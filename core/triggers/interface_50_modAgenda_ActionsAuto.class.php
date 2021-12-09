<?php
/* Copyright (C) 2005-2017	 	
 * Copyright (C) 2009-2017			
 * Copyright (C) 2011-2014	
 * Copyright (C) 2013		Cedric GROSS			
 * Copyright (C) 2014				
 * Copyright (C) 2015		Bahfir Abbes			<bafbes@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

/**
 *	\file       htdocs/core/triggers/interface_50_modAgenda_ActionsAuto.class.php
 *  \ingroup    agenda
 *  \brief      Trigger file for agenda module
 */

require_once DOL_DOCUMENT_ROOT.'/core/triggers/berp3triggers.class.php';


/**
 *  Class of triggered functions for agenda module
 */
class InterfaceActionsAuto extends Berp3Triggers
{
	/**
	 * Constructor
	 *
	 * @param Berp3DB $db Database handler
	 */
	public function __construct($db)
	{
		$this->db = $db;

		$this->name = preg_replace('/^Interface/i', '', get_class($this));
		$this->family = "agenda";
		$this->description = "Triggers of this module add actions in agenda according to setup made in agenda setup.";
		// 'development', 'experimental', 'berp3' or version
		$this->version = self::VERSION_BERP3;
		$this->picto = 'action';
	}

	/**
	 * Function called when a Berp3r business event is done.
	 * All functions "runTrigger" are triggered if file is inside directory htdocs/core/triggers or htdocs/module/code/triggers (and declared)
	 *
	 * Following properties may be set before calling trigger. The may be completed by this trigger to be used for writing the event into database:
	 *      $object->actiontypecode (translation action code: AC_OTH, ...)
	 *      $object->actionmsg (note, long text)
	 *      $object->actionmsg2 (label, short text)
	 *      $object->sendtoid (id of contact or array of ids of contacts)
	 *      $object->socid (id of thirdparty)
	 *      $object->fk_project
	 *      $object->fk_element	(ID of object to link action event to)
	 *      $object->elementtype (->element of object to link action to)
	 *      $object->module (if defined, elementtype in llx_actioncomm will be elementtype@module)
	 *
	 * @param string		$action		Event action code ('CONTRACT_MODIFY', 'RECRUITMENTCANDIDATURE_MODIFIY', ...)
	 * @param Object		$object     Object
	 * @param User		    $user       Object user
	 * @param Translate 	$langs      Object langs
	 * @param conf		    $conf       Object conf
	 * @return int         				<0 if KO, 0 if no triggered ran, >0 if OK
	 */
	public function runTrigger($action, $object, User $user, Translate $langs, Conf $conf)
	{
		if (empty($conf->agenda) || empty($conf->agenda->enabled)) {
			return 0; // Module not active, we do nothing
		}

		// Do not log events when trigger is for creating event (infinite loop)
		if (preg_match('/^ACTION_/', $action)) {
			return 0;
		}

		$key = 'MAIN_AGENDA_ACTIONAUTO_'.$action;
		//var_dump($action.' - '.$conf->global->$key);exit;

		// Do not log events not enabled for this action
		if (empty($conf->global->$key)) {
			return 0;
		}

		$langs->load("agenda");

		if (empty($object->actiontypecode)) {
			$object->actiontypecode = 'AC_OTH_AUTO';
		}

		// Actions
		if ($action == 'COMPANY_CREATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "companies"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("NewCompanyToBerp3", $object->name);
			}
			$object->actionmsg = $langs->transnoentities("NewCompanyToBerp3", $object->name);

			$object->sendtoid = 0;
			$object->socid = $object->id;
		} elseif ($action == 'COMPANY_MODIFY') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "companies"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("COMPANY_MODIFYInBerp3", $object->name);
			}
			$object->actionmsg = $langs->transnoentities("COMPANY_MODIFYInBerp3", $object->name);

			$object->sendtoid = 0;
			$object->socid = $object->id;
		} elseif ($action == 'COMPANY_SENTBYMAIL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders"));

			if (empty($object->actionmsg2)) {
				dol_syslog('Trigger called with property actionmsg2 on object not defined', LOG_ERR);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'CONTACT_CREATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "companies"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("CONTACT_CREATEInBerp3", $object->getFullName($langs));
			}
			$object->actionmsg = $langs->transnoentities("CONTACT_CREATEInBerp3", $object->getFullName($langs));

			$object->sendtoid = array($object->id => $object->id);
			$object->socid = $object->socid;
		} elseif ($action == 'CONTACT_MODIFY') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "companies"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("CONTACT_MODIFYInBerp3", $object->name);
			}
			$object->actionmsg = $langs->transnoentities("CONTACT_MODIFYInBerp3", $object->name);

			$object->sendtoid = array($object->id => $object->id);
			$object->socid = $object->socid;
		} elseif ($action == 'CONTRACT_VALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "contracts"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ContractValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("ContractValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));

			$object->sendtoid = 0;
		} elseif ($action == 'CONTRACT_SENTBYMAIL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "contracts"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ContractSentByEMail", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("ContractSentByEMail", $object->ref);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'PROPAL_VALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "propal"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("PropalValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("PropalValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));

			$object->sendtoid = 0;
		} elseif ($action == 'PROPAL_SENTBYMAIL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "propal"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ProposalSentByEMail", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("ProposalSentByEMail", $object->ref);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'PROPAL_CLOSE_SIGNED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "propal"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("PropalClosedSignedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("PropalClosedSignedInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'PROPAL_CLASSIFY_BILLED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "propal"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("PropalClassifiedBilledInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("PropalClassifiedBilledInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'PROPAL_CLOSE_REFUSED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "propal"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("PropalClosedRefusedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("PropalClosedRefusedInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_VALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("OrderValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("OrderValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_CLOSE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("OrderDeliveredInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("OrderDeliveredInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_CLASSIFY_BILLED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("OrderBilledInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("OrderBilledInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_CANCEL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("OrderCanceledInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("OrderCanceledInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_SENTBYMAIL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("OrderSentByEMail", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("OrderSentByEMail", $object->ref);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'BILL_VALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InvoiceValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("InvoiceValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));

			$object->sendtoid = 0;
		} elseif ($action == 'BILL_UNVALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InvoiceBackToDraftInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("InvoiceBackToDraftInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'BILL_SENTBYMAIL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InvoiceSentByEMail", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("InvoiceSentByEMail", $object->ref);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'BILL_PAYED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills"));

			// Values for this action can't be defined by caller.
			$object->actionmsg2 = $langs->transnoentities("InvoicePaidInBerp3", $object->ref);
			$object->actionmsg = $langs->transnoentities("InvoicePaidInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'BILL_CANCEL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InvoiceCanceledInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("InvoiceCanceledInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'FICHINTER_CREATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "interventions"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InterventionCreatedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("InterventionCreatedInBerp3", $object->ref);

			$object->sendtoid = 0;
			$object->fk_element = 0;
			$object->elementtype = '';
		} elseif ($action == 'FICHINTER_VALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "interventions"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InterventionValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("InterventionValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));

			$object->sendtoid = 0;
			$object->fk_element = 0;
			$object->elementtype = '';
		} elseif ($action == 'FICHINTER_MODIFY') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "interventions"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InterventionModifiedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("InterventionModifiedInBerp3", $object->ref);

			$object->sendtoid = 0;
			$object->fk_element = 0;
			$object->elementtype = '';
		} elseif ($action == 'FICHINTER_SENTBYMAIL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "interventions"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InterventionSentByEMail", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("InterventionSentByEMail", $object->ref);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'FICHINTER_CLASSIFY_BILLED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "interventions"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InterventionClassifiedBilledInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("InterventionClassifiedBilledInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'FICHINTER_CLASSIFY_UNBILLED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "interventions"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InterventionClassifiedUnbilledInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("InterventionClassifiedUnbilledInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'FICHINTER_DELETE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "interventions"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InterventionDeletedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("InterventionDeletedInBerp3", $object->ref);

			$object->sendtoid = 0;
			$object->fk_element = 0;
			$object->elementtype = '';
		} elseif ($action == 'SHIPPING_VALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "sendings"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ShippingValidated", ($object->newref ? $object->newref : $object->ref));
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("ShippingValidated", ($object->newref ? $object->newref : $object->ref));
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'SHIPPING_SENTBYMAIL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "sendings"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ShippingSentByEMail", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("ShippingSentByEMail", $object->ref);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'RECEPTION_VALIDATE') {
			$langs->load("agenda");
			$langs->load("other");
			$langs->load("receptions");

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ReceptionValidated", ($object->newref ? $object->newref : $object->ref));
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("ReceptionValidated", ($object->newref ? $object->newref : $object->ref));
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'RECEPTION_SENTBYMAIL') {
			$langs->load("agenda");
			$langs->load("other");
			$langs->load("receptions");

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ReceptionSentByEMail", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("ReceptionSentByEMail", $object->ref);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'PROPOSAL_SUPPLIER_VALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "propal"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("PropalValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("PropalValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));

			$object->sendtoid = 0;
		} elseif ($action == 'PROPOSAL_SUPPLIER_SENTBYMAIL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "propal"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ProposalSentByEMail", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("ProposalSentByEMail", $object->ref);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'PROPOSAL_SUPPLIER_CLOSE_SIGNED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "propal"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("PropalClosedSignedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("PropalClosedSignedInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'PROPOSAL_SUPPLIER_CLOSE_REFUSED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "propal"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("PropalClosedRefusedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("PropalClosedRefusedInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_SUPPLIER_CREATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("OrderCreatedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("OrderCreatedInBerp3", ($object->newref ? $object->newref : $object->ref));

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_SUPPLIER_VALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("OrderValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("OrderValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_SUPPLIER_APPROVE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("OrderApprovedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("OrderApprovedInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_SUPPLIER_REFUSE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders", "main"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("OrderRefusedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("OrderRefusedInBerp3", $object->ref);

			if (!empty($object->refuse_note)) {
				$object->actionmsg .= '<br>';
				$object->actionmsg .= $langs->trans("Reason") . ': '.$object->refuse_note;
			}

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_SUPPLIER_CANCEL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders", "main"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("OrderCanceledInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("OrderCanceledInBerp3", $object->ref);

			if (!empty($object->cancel_note)) {
				$object->actionmsg .= '<br>';
				$object->actionmsg .= $langs->trans("Reason") . ': '.$object->cancel_note;
			}

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_SUPPLIER_SUBMIT') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("SupplierOrderSubmitedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("SupplierOrderSubmitedInBerp3", ($object->newref ? $object->newref : $object->ref));

			if (!empty($object->context['comments'])) {
				$object->actionmsg .= '<br>';
				$object->actionmsg .= $langs->trans("Comment") . ': '.$object->context['comments'];
			}

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_SUPPLIER_RECEIVE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("SupplierOrderReceivedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("SupplierOrderReceivedInBerp3", ($object->newref ? $object->newref : $object->ref));

			$object->sendtoid = 0;
		} elseif ($action == 'ORDER_SUPPLIER_SENTBYMAIL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("SupplierOrderSentByEMail", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("SupplierOrderSentByEMail", $object->ref);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'ORDER_SUPPLIER_CLASSIFY_BILLED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("SupplierOrderClassifiedBilled", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("SupplierOrderClassifiedBilled", $object->ref);
			}

			$object->sendtoid = 0;
		} elseif ($action == 'BILL_SUPPLIER_VALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InvoiceValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));
			}
			$object->actionmsg = $langs->transnoentities("InvoiceValidatedInBerp3", ($object->newref ? $object->newref : $object->ref));

			$object->sendtoid = 0;
		} elseif ($action == 'BILL_SUPPLIER_UNVALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InvoiceBackToDraftInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("InvoiceBackToDraftInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'BILL_SUPPLIER_SENTBYMAIL') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills", "orders"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("SupplierInvoiceSentByEMail", $object->ref);
			}
			if (empty($object->actionmsg)) {
				$object->actionmsg = $langs->transnoentities("SupplierInvoiceSentByEMail", $object->ref);
			}

			// Parameters $object->sendtoid defined by caller
			//$object->sendtoid=0;
		} elseif ($action == 'BILL_SUPPLIER_PAYED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InvoicePaidInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("InvoicePaidInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'BILL_SUPPLIER_CANCELED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "bills"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("InvoiceCanceledInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("InvoiceCanceledInBerp3", $object->ref);

			$object->sendtoid = 0;
		} elseif ($action == 'MEMBER_VALIDATE') {
			// Members
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "members"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("MemberValidatedInBerp3", $object->getFullName($langs));
			}
			$object->actionmsg = $langs->transnoentities("MemberValidatedInBerp3", $object->getFullName($langs));
			$object->actionmsg .= "\n".$langs->transnoentities("Member").': '.$object->getFullName($langs);
			$object->actionmsg .= "\n".$langs->transnoentities("Type").': '.$object->type;

			$object->sendtoid = 0;
		} elseif ($action == 'MEMBER_MODIFY') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "members"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("MemberModifiedInBerp3", $object->getFullName($langs));
			}
			$object->actionmsg = $langs->transnoentities("MemberModifiedInBerp3", $object->getFullName($langs));
			$object->actionmsg .= "\n".$langs->transnoentities("Member").': '.$object->getFullName($langs);
			$object->actionmsg .= "\n".$langs->transnoentities("Type").': '.$object->type;

			$object->sendtoid = 0;
		} elseif ($action == 'MEMBER_SUBSCRIPTION_CREATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "members"));

			$member = $this->context['member'];
			if (!is_object($member)) {	// This should not happen
				dol_syslog("Execute a trigger MEMBER_SUBSCRIPTION_CREATE with context key 'member' not an object");
				include_once DOL_DOCUMENT_ROOT.'/adherents/class/adherent.class.php';
				$member = new Adherent($this->db);
				$member->fetch($object->fk_adherent);
			}

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("MemberSubscriptionAddedInBerp3", $object->id, $member->getFullName($langs));
			}
			$object->actionmsg = $langs->transnoentities("MemberSubscriptionAddedInBerp3", $object->id, $member->getFullName($langs));
			$object->actionmsg .= "\n".$langs->transnoentities("Member").': '.$member->getFullName($langs);
			$object->actionmsg .= "\n".$langs->transnoentities("Type").': '.$object->fk_type;
			$object->actionmsg .= "\n".$langs->transnoentities("Amount").': '.$object->amount;
			$object->actionmsg .= "\n".$langs->transnoentities("Period").': '.dol_print_date($object->dateh, 'day').' - '.dol_print_date($object->datef, 'day');

			$object->sendtoid = 0;
			if ($object->fk_soc > 0) {
				$object->socid = $object->fk_soc;
			}
		} elseif ($action == 'MEMBER_SUBSCRIPTION_MODIFY') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "members"));

			$member = $this->context['member'];
			if (!is_object($member)) {	// This should not happen
				include_once DOL_DOCUMENT_ROOT.'/adherents/class/adherent.class.php';
				$member = new Adherent($this->db);
				$member->fetch($this->fk_adherent);
			}

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("MemberSubscriptionModifiedInBerp3", $object->id, $member->getFullName($langs));
			}
			$object->actionmsg = $langs->transnoentities("MemberSubscriptionModifiedInBerp3", $object->id, $member->getFullName($langs));
			$object->actionmsg .= "\n".$langs->transnoentities("Member").': '.$member->getFullName($langs);
			$object->actionmsg .= "\n".$langs->transnoentities("Type").': '.$object->fk_type;
			$object->actionmsg .= "\n".$langs->transnoentities("Amount").': '.$object->amount;
			$object->actionmsg .= "\n".$langs->transnoentities("Period").': '.dol_print_date($object->dateh, 'day').' - '.dol_print_date($object->datef, 'day');

			$object->sendtoid = 0;
			if ($object->fk_soc > 0) {
				$object->socid = $object->fk_soc;
			}
		} elseif ($action == 'MEMBER_SUBSCRIPTION_DELETE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "members"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("MemberSubscriptionDeletedInBerp3", $object->ref, $object->getFullName($langs));
			}
			$object->actionmsg = $langs->transnoentities("MemberSubscriptionDeletedInBerp3", $object->ref, $object->getFullName($langs));
			$object->actionmsg .= "\n".$langs->transnoentities("Member").': '.$object->getFullName($langs);
			$object->actionmsg .= "\n".$langs->transnoentities("Type").': '.$object->type;
			$object->actionmsg .= "\n".$langs->transnoentities("Amount").': '.$object->last_subscription_amount;
			$object->actionmsg .= "\n".$langs->transnoentities("Period").': '.dol_print_date($object->last_subscription_date_start, 'day').' - '.dol_print_date($object->last_subscription_date_end, 'day');

			$object->sendtoid = 0;
			if ($object->fk_soc > 0) {
				$object->socid = $object->fk_soc;
			}
		} elseif ($action == 'MEMBER_RESILIATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "members"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("MemberResiliatedInBerp3", $object->getFullName($langs));
			}
			$object->actionmsg = $langs->transnoentities("MemberResiliatedInBerp3", $object->getFullName($langs));
			$object->actionmsg .= "\n".$langs->transnoentities("Member").': '.$object->getFullName($langs);
			$object->actionmsg .= "\n".$langs->transnoentities("Type").': '.$object->type;

			$object->sendtoid = 0;
		} elseif ($action == 'MEMBER_DELETE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "members"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("MemberDeletedInBerp3", $object->getFullName($langs));
			}
			$object->actionmsg = $langs->transnoentities("MemberDeletedInBerp3", $object->getFullName($langs));
			$object->actionmsg .= "\n".$langs->transnoentities("Member").': '.$object->getFullName($langs);
			$object->actionmsg .= "\n".$langs->transnoentities("Type").': '.$object->type;

			$object->sendtoid = 0;
		} elseif ($action == 'PROJECT_CREATE') {
			// Projects
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "projects"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ProjectCreatedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("ProjectCreatedInBerp3", $object->ref);
			$object->actionmsg .= "\n".$langs->transnoentities("Project").': '.$object->ref;

			$object->sendtoid = 0;
		} elseif ($action == 'PROJECT_VALIDATE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "projects"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ProjectValidatedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("ProjectValidatedInBerp3", $object->ref);
			$object->actionmsg .= "\n".$langs->transnoentities("Project").': '.$object->ref;

			$object->sendtoid = 0;
		} elseif ($action == 'PROJECT_MODIFY') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "projects"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("ProjectModifiedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("ProjectModifiedInBerp3", $object->ref);
			//$object->actionmsg .= "\n".$langs->transnoentities("Task").': ???';
			if (!empty($object->usage_opportunity) && is_object($object->oldcopy) && $object->opp_status != $object->oldcopy->opp_status) {
				$object->actionmsg .= "\n".$langs->transnoentitiesnoconv("OpportunityStatus").': '.$object->oldcopy->opp_status.' -> '.$object->opp_status;
			}

			$object->sendtoid = 0;
		} elseif ($action == 'TASK_CREATE') {
			// Project tasks
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "projects"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("TaskCreatedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("TaskCreatedInBerp3", $object->ref);
			$object->actionmsg .= "\n".$langs->transnoentities("Task").': '.$object->ref;

			$object->sendtoid = 0;
		} elseif ($action == 'TASK_MODIFY') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "projects"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("TaskModifiedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("TaskModifieddInBerp3", $object->ref);
			$object->actionmsg .= "\n".$langs->transnoentities("Task").': '.$object->ref;

			$object->sendtoid = 0;
		} elseif ($action == 'TASK_DELETE') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "projects"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("TaskDeletedInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("TaskDeletedInBerp3", $object->ref);
			$object->actionmsg .= "\n".$langs->transnoentities("Task").': '.$object->ref;

			$object->sendtoid = 0;
		} elseif ($action == 'TICKET_ASSIGNED') {
			// Load translation files required by the page
			$langs->loadLangs(array("agenda", "other", "projects"));

			if (empty($object->actionmsg2)) {
				$object->actionmsg2 = $langs->transnoentities("TICKET_ASSIGNEDInBerp3", $object->ref);
			}
			$object->actionmsg = $langs->transnoentities("TICKET_ASSIGNEDInBerp3", $object->ref);
			if ($object->oldcopy->fk_user_assign > 0) {
				$tmpuser = new User($this->db);
				$tmpuser->fetch($object->oldcopy->fk_user_assign);
				$object->actionmsg .= "\n".$langs->transnoentities("OldUser").': '.$tmpuser->getFullName($langs);
			} else {
				$object->actionmsg .= "\n".$langs->transnoentities("OldUser").': '.$langs->trans("None");
			}
			if ($object->fk_user_assign > 0) {
				$tmpuser = new User($this->db);
				$tmpuser->fetch($object->fk_user_assign);
				$object->actionmsg .= "\n".$langs->transnoentities("NewUser").': '.$tmpuser->getFullName($langs);
			} else {
				$object->actionmsg .= "\n".$langs->transnoentities("NewUser").': '.$langs->trans("None");
			}
			$object->sendtoid = 0;
		} else {
			// TODO Merge all previous cases into this generic one
			// $action = BILL_DELETE, TICKET_CREATE, TICKET_MODIFY, TICKET_DELETE, CONTACT_SENTBYMAIL, RECRUITMENTCANDIDATURE_MODIFY, ...
			// Note: We are here only if $conf->global->MAIN_AGENDA_ACTIONAUTO_action is on (tested at begining of this function).
			// Note that these key can be set in agenda setup, only if defined into c_action_trigger
			// Load translation files required by the page
			if (empty($object->actionmsg2)) {
				$langs->loadLangs(array("agenda", "other"));
				if ($langs->transnoentities($action."InBerp3", (empty($object->newref) ? $object->ref : $object->newref)) != $action."InBerp3") {	// specific translation key
					$object->actionmsg2 = $langs->transnoentities($action."InBerp3", (empty($object->newref) ? $object->ref : $object->newref));
				} else {	// generic translation key
					$tmp = explode('_', $action);
					$object->actionmsg2 = $langs->transnoentities($tmp[count($tmp) - 1]."InBerp3", (empty($object->newref) ? $object->ref : $object->newref));
				}
			}
			if (empty($object->actionmsg)) {
				$langs->loadLangs(array("agenda", "other"));
				if ($langs->transnoentities($action."InBerp3", (empty($object->newref) ? $object->ref : $object->newref)) != $action."InBerp3") {	// specific translation key
					$object->actionmsg = $langs->transnoentities($action."InBerp3", (empty($object->newref) ? $object->ref : $object->newref));
				} else {	// generic translation key
					$tmp = explode('_', $action);
					$object->actionmsg = $langs->transnoentities($tmp[count($tmp) - 1]."InBerp3", (empty($object->newref) ? $object->ref : $object->newref));
				}
			}

			if (!isset($object->sendtoid) || !is_array($object->sendtoid)) {
				$object->sendtoid = 0;
			}
		}

		// If trackid is not defined, we set it
		if (empty($object->trackid)) {
			// See also similar list into emailcollector.class.php
			if (preg_match('/^COMPANY_/', $action)) {
				$object->trackid = 'thi'.$object->id;
			} elseif (preg_match('/^CONTACT_/', $action)) {
				$object->trackid = 'ctc'.$object->id;
			} elseif (preg_match('/^CONTRACT_/', $action)) {
				$object->trackid = 'con'.$object->id;
			} elseif (preg_match('/^PROPAL_/', $action)) {
				$object->trackid = 'pro'.$object->id;
			} elseif (preg_match('/^ORDER_/', $action)) {
				$object->trackid = 'ord'.$object->id;
			} elseif (preg_match('/^BILL_/', $action)) {
				$object->trackid = 'inv'.$object->id;
			} elseif (preg_match('/^FICHINTER_/', $action)) {
				$object->trackid = 'int'.$object->id;
			} elseif (preg_match('/^SHIPPING_/', $action)) {
				$object->trackid = 'shi'.$object->id;
			} elseif (preg_match('/^RECEPTION_/', $action)) {
				$object->trackid = 'rec'.$object->id;
			} elseif (preg_match('/^PROPOSAL_SUPPLIER/', $action)) {
				$object->trackid = 'spr'.$object->id;
			} elseif (preg_match('/^ORDER_SUPPLIER_/', $action)) {
				$object->trackid = 'sor'.$object->id;
			} elseif (preg_match('/^BILL_SUPPLIER_/', $action)) {
				$object->trackid = 'sin'.$object->id;
			} elseif (preg_match('/^MEMBER_SUBSCRIPTION_/', $action)) {
				$object->trackid = 'sub'.$object->id;
			} elseif (preg_match('/^MEMBER_/', $action)) {
				$object->trackid = 'mem'.$object->id;
			} elseif (preg_match('/^PROJECT_/', $action)) {
				$object->trackid = 'proj'.$object->id;
			} elseif (preg_match('/^TASK_/', $action)) {
				$object->trackid = 'tas'.$object->id;
			} elseif (preg_match('/^TICKET_/', $action)) {
				$object->trackid = 'tic'.$object->id;
			} else {
				$object->trackid = '';
			}
		}

		if (!empty($user->login)) {
			$object->actionmsg = dol_concatdesc($langs->transnoentities("Author").': '.$user->login, $object->actionmsg);
		} elseif (isset($object->origin_email)) {
			$object->actionmsg = dol_concatdesc($langs->transnoentities("Author").': '.$object->origin_email, $object->actionmsg);
		}

		dol_syslog("Trigger '".$this->name."' for action '$action' launched by ".__FILE__.". id=".$object->id);

		// Add entry in event table
		$now = dol_now();

		if (isset($_SESSION['listofnames-'.$object->trackid])) {
			$attachs = $_SESSION['listofnames-'.$object->trackid];
			if ($attachs && strpos($action, 'SENTBYMAIL')) {
				$object->actionmsg = dol_concatdesc($object->actionmsg, "\n".$langs->transnoentities("AttachedFiles").': '.$attachs);
			}
		}
		require_once DOL_DOCUMENT_ROOT.'/contact/class/contact.class.php';
		require_once DOL_DOCUMENT_ROOT.'/societe/class/societe.class.php';
		$contactforaction = new Contact($this->db);
		$societeforaction = new Societe($this->db);
		// Set contactforaction if there is only 1 contact.

		if (is_array($object->sendtoid)) {
			if (count($object->sendtoid) == 1) {
				$contactforaction->fetch(reset($object->sendtoid));
			}
		} else {
			if ($object->sendtoid > 0) {
				$contactforaction->fetch($object->sendtoid);
			}
		}
		// Set societeforaction.
		if (isset($object->socid) && $object->socid > 0) {
			$societeforaction->fetch($object->socid);
		} elseif (isset($object->fk_soc) && $object->fk_soc > 0) {
			$societeforaction->fetch($object->fk_soc);
		} elseif (isset($object->thirdparty) && isset($object->thirdparty->id) && $object->thirdparty->id > 0) {
			$societeforaction = $object->thirdparty;
		}

		$projectid = isset($object->fk_project) ? $object->fk_project : 0;
		if ($object->element == 'project') {
			$projectid = $object->id;
		}

		$elementid = $object->id; // id of object
		$elementtype = $object->element;
		$elementmodule = (empty($object->module) ? '' : $object->module);
		if ($object->element == 'subscription') {
			$elementid = $object->fk_adherent;
			$elementtype = 'member';
		}
		//var_dump($societeforaction);var_dump($contactforaction);var_dump($elementid);var_dump($elementtype);exit;

		// Insertion action
		require_once DOL_DOCUMENT_ROOT.'/comm/action/class/actioncomm.class.php';
		$actioncomm = new ActionComm($this->db);
		$actioncomm->type_code   = $object->actiontypecode; // Type of event ('AC_OTH', 'AC_OTH_AUTO', 'AC_XXX'...)
		$actioncomm->code        = 'AC_'.$action;
		$actioncomm->label       = $object->actionmsg2;
		$actioncomm->note_private = $object->actionmsg; // TODO Replace with ($actioncomm->email_msgid ? $object->email_content : $object->actionmsg)
		$actioncomm->fk_project  = $projectid;
		$actioncomm->datep       = $now;
		$actioncomm->datef       = $now;
		$actioncomm->durationp   = 0;
		$actioncomm->percentage  = -1; // Not applicable
		$actioncomm->socid       = $societeforaction->id;
		$actioncomm->contact_id = $contactforaction->id; // deprecated, use ->socpeopleassigned instead
		$actioncomm->authorid    = $user->id; // User saving action
		$actioncomm->userownerid = $user->id; // Owner of action
		// Fields defined when action is an email (content should be into object->actionmsg to be added into note, subject into object->actionms2 to be added into label)
		$actioncomm->email_msgid   = empty($object->email_msgid) ? null : $object->email_msgid;
		$actioncomm->email_from    = empty($object->email_from) ? null : $object->email_from;
		$actioncomm->email_sender  = empty($object->email_sender) ? null : $object->email_sender;
		$actioncomm->email_to      = empty($object->email_to) ? null : $object->email_to;
		$actioncomm->email_tocc    = empty($object->email_tocc) ? null : $object->email_tocc;
		$actioncomm->email_tobcc   = empty($object->email_tobcc) ? null : $object->email_tobcc;
		$actioncomm->email_subject = empty($object->email_subject) ? null : $object->email_subject;
		$actioncomm->errors_to     = empty($object->errors_to) ? null : $object->errors_to;

		// Object linked (if link is for thirdparty, contact, project it is a recording error. We should not have links in link table
		// for such objects because there is already a dedicated field into table llx_actioncomm or llx_actioncomm_resources.
		if (!in_array($elementtype, array('societe', 'contact', 'project'))) {
			$actioncomm->fk_element  = $elementid;
			$actioncomm->elementtype = $elementtype.($elementmodule ? '@'.$elementmodule : '');
		}

		if (property_exists($object, 'attachedfiles') && is_array($object->attachedfiles) && count($object->attachedfiles) > 0) {
			$actioncomm->attachedfiles = $object->attachedfiles;
		}
		if (property_exists($object, 'sendtouserid') && is_array($object->sendtouserid) && count($object->sendtouserid) > 0) {
			$actioncomm->userassigned = $object->sendtouserid;
		}
		if (property_exists($object, 'sendtoid') && is_array($object->sendtoid) && count($object->sendtoid) > 0) {
			foreach ($object->sendtoid as $val) {
				$actioncomm->socpeopleassigned[$val] = $val;
			}
		}

		$ret = $actioncomm->create($user); // User creating action

		if ($ret > 0 && !empty($conf->global->MAIN_COPY_FILE_IN_EVENT_AUTO)) {
			if (is_array($object->attachedfiles) && array_key_exists('paths', $object->attachedfiles) && count($object->attachedfiles['paths']) > 0) {
				foreach ($object->attachedfiles['paths'] as $key => $filespath) {
					$srcfile = $filespath;
					$destdir = $conf->agenda->dir_output.'/'.$ret;
					$destfile = $destdir.'/'.$object->attachedfiles['names'][$key];
					if (dol_mkdir($destdir) >= 0) {
						require_once DOL_DOCUMENT_ROOT.'/core/lib/files.lib.php';
						dol_copy($srcfile, $destfile);
					}
				}
			}
		}

		unset($object->actionmsg);
		unset($object->actionmsg2);
		unset($object->actiontypecode); // When several action are called on same object, we must be sure to not reuse value of first action.

		if ($ret > 0) {
			$_SESSION['LAST_ACTION_CREATED'] = $ret;
			return 1;
		} else {
			$this->error = "Failed to insert event : ".$actioncomm->error." ".join(',', $actioncomm->errors);
			$this->errors = $actioncomm->errors;

			dol_syslog("interface_modAgenda_ActionsAuto.class.php: ".$this->error, LOG_ERR);
			return -1;
		}
	}
}
