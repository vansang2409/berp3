<?php
/* Copyright (C) 2001-2007  
 * Copyright (C) 2004-2014 
 * Copyright (C) 2004      
 * Copyright (C) 2005      
 * Copyright (C) 2005-2012 
 * Copyright (C) 2006      
 * Copyright (C) 2010-2016 
 * Copyright (C) 2010-2021         
 * Copyright (C) 2012-2013 
 * Copyright (C) 2012      Cedric Salvador       
 *   
 * Copyright (C) 2014       
 * Copyright (C) 2016       
 * Copyright (C) 2018-2021  
 * Copyright (C) 2020	             
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
 * \file 		htdocs/comm/propal/card.php
 * \ingroup 	propale
 * \brief 		Page of commercial proposals card and list
 */

require '../../main.inc.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/html.formother.class.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/html.formfile.class.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/html.formpropal.class.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/html.formmargin.class.php';
require_once DOL_DOCUMENT_ROOT.'/leads/propal/class/leads.class.php';
require_once DOL_DOCUMENT_ROOT.'/comm/action/class/actioncomm.class.php';
require_once DOL_DOCUMENT_ROOT.'/core/modules/propale/modules_propale.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/propal.lib.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/functions2.lib.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/signature.lib.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/extrafields.class.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/doleditor.class.php';
if (!empty($conf->projet->enabled)) {
	require_once DOL_DOCUMENT_ROOT.'/projet/class/project.class.php';
	require_once DOL_DOCUMENT_ROOT.'/core/class/html.formprojet.class.php';
}

if (!empty($conf->variants->enabled)) {
	require_once DOL_DOCUMENT_ROOT.'/variants/class/ProductCombination.class.php';
}
error_reporting(E_ERROR | E_PARSE);
// Load translation files required by the page
$langs->loadLangs(array('companies', 'propal', 'compta', 'bills', 'orders', 'products', 'deliveries', 'sendings', 'other'));
if (!empty($conf->incoterm->enabled)) {
	$langs->load('incoterm');
}
if (!empty($conf->margin->enabled)) {
	$langs->load('margins');
}

$error = 0;

$id = GETPOST('id', 'int');
$ref = GETPOST('ref', 'alpha');
$socid = GETPOST('socid', 'int');
$action = GETPOST('action', 'aZ09');
$cancel = GETPOST('cancel', 'alpha');
$origin = GETPOST('origin', 'alpha');
$originid = GETPOST('originid', 'int');
$confirm = GETPOST('confirm', 'alpha');
$lineid = GETPOST('lineid', 'int');
$contactid = GETPOST('contactid', 'int');
$projectid = GETPOST('projectid', 'int');

//arry status
$arraystatus = [
	"_new" => "New",
	"_1st_meeting" => "1stmeeting",
	"_negotiation" => "Negotiation",
	"_won" => "Won",
	"_lost" => "Lost",
	"_deleted" => "Deleted",
	"_pre_call" => "Precall",
];

// PDF
$hidedetails = (GETPOST('hidedetails', 'int') ? GETPOST('hidedetails', 'int') : (!empty($conf->global->MAIN_GENERATE_DOCUMENTS_HIDE_DETAILS) ? 1 : 0));
$hidedesc = (GETPOST('hidedesc', 'int') ? GETPOST('hidedesc', 'int') : (!empty($conf->global->MAIN_GENERATE_DOCUMENTS_HIDE_DESC) ? 1 : 0));
$hideref = (GETPOST('hideref', 'int') ? GETPOST('hideref', 'int') : (!empty($conf->global->MAIN_GENERATE_DOCUMENTS_HIDE_REF) ? 1 : 0));

// Nombre de ligne pour choix de produit/service predefinis
$NBLINES = 4;

$object = new Leads($db);
$extrafields = new ExtraFields($db);
// fetch optionals attributes and labels
$extrafields->fetch_name_optionals_label($object->table_element);

//echo $object->refCode();

// Security check
if (!empty($user->socid)) {
	$socid = $user->socid;
	$object->id = $user->socid;
}
restrictedArea($user, 'propal', $object->id);


/*
 * Actions
 */

$parameters = array('socid' => $socid);
$reshook = $hookmanager->executeHooks('doActions', $parameters, $object, $action); // Note that $action and $object may have been modified by some hooks
if ($reshook < 0) {
	setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
}

if (empty($reshook)) {
	$backurlforlist = DOL_URL_ROOT.'/comm/propal/list.php';

	if (empty($backtopage) || ($cancel && empty($id))) {
		if (empty($backtopage) || ($cancel && strpos($backtopage, '__ID__'))) {
			if (empty($id) && (($action != 'add' && $action != 'create') || $cancel)) {
				$backtopage = $backurlforlist;
			} else {
				$backtopage = DOL_URL_ROOT.'/comm/propal/card.php?id='.((!empty($id) && $id > 0) ? $id : '__ID__');
			}
		}
	}

	if ($cancel) {
		if (!empty($backtopageforcancel)) {
			header("Location: ".$backtopageforcancel);
			exit;
		} elseif (!empty($backtopage)) {
			header("Location: ".$backtopage);
			exit;
		}
		$action = '';
	}

	include DOL_DOCUMENT_ROOT.'/core/actions_setnotes.inc.php'; // Must be include, not includ_once

	include DOL_DOCUMENT_ROOT.'/core/actions_dellink.inc.php'; // Must be include, not include_once

	include DOL_DOCUMENT_ROOT.'/core/actions_lineupdown.inc.php'; // Must be include, not include_once

	
	include DOL_DOCUMENT_ROOT.'/core/actions_printing.inc.php';

	// Actions to send emails
	$actiontypecode = 'AC_OTH_AUTO';
	$triggersendname = 'PROPAL_SENTBYMAIL';
	$autocopy = 'MAIN_MAIL_AUTOCOPY_PROPOSAL_TO';
	$trackid = 'pro'.$object->id;
	include DOL_DOCUMENT_ROOT.'/core/actions_sendmails.inc.php';

	// Actions to build doc
	$upload_dir = $conf->propal->multidir_output[$object->entity];
	$permissiontoadd = $usercancreate;
	include DOL_DOCUMENT_ROOT.'/core/actions_builddoc.inc.php';
}

// Action

// Create new lead
$error = 0;
$btn_action = (!empty(GETPOST('save'))) ? GETPOST('save') : '';
//echo  $btn_action;
if($action == 'add' && $btn_action == 'Save' ){
	if (!GETPOST('ref_client')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("CustomerName")), null, 'errors');
		$error++;
	}
	if (!GETPOST('phone')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("CustomerPhone")), null, 'errors');
		$error++;
	}
	if (!GETPOST('email')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("CustomerEmail")), null, 'errors');
		$error++;
	}
	if (!GETPOST('sales_person')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("SalesPerson")), null, 'errors');
		$error++;
	}
	if (!GETPOST('na')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("NextAction")), null, 'errors');
		$error++;
	}
	if (!GETPOST('ec')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("ExpectedClosing")), null, 'errors');
		$error++;
	}
	if (!GETPOST('status')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("Status")), null, 'errors');
		$error++;
	}
	if(!$error){
		$object->ref_client = GETPOST('ref_client');
		$object->phone = GETPOST('phone');
		$object->email = GETPOST('email');
		$object->sales_person_id = GETPOST('sales_person');
		$object->next_action = GETPOST('na');
		$object->expected_closing = GETPOST('ec');
		$object->status = GETPOST('status');
		$object->priority = GETPOST('priority');
		$object->note_private = GETPOST('note_private');
		$result = $object->createLeads();
		//echo $object->rowid;
		$actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"."?mainmenu=commercial&action=view&leftmenu=leads&leads=".$object->rowid;
		if($result == 1){
			echo "<script type='text/javascript'> document.location = '".$actual_link."'; </script>";
		}
		
	}
    
}
dol_htmloutput_mesg(is_numeric($error) ? '' : $error, $errors, 'error');
// Update lead
if($action == 'edit' && $btn_action == 'Save'){
	if (!GETPOST('ref_client')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("CustomerName")), null, 'errors');
		$error++;
	}
	if (!GETPOST('phone')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("CustomerPhone")), null, 'errors');
		$error++;
	}
	if (!GETPOST('email')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("CustomerEmail")), null, 'errors');
		$error++;
	}
	if (!GETPOST('sales_person')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("SalesPerson")), null, 'errors');
		$error++;
	}
	if (!GETPOST('na')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("NextAction")), null, 'errors');
		$error++;
	}
	if (!GETPOST('ec')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("ExpectedClosing")), null, 'errors');
		$error++;
	}
	if (!GETPOST('status')) {
		setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("Status")), null, 'errors');
		$error++;
	}
	if(!$error){
		$object->ref_client = GETPOST('ref_client');
		$object->phone = GETPOST('phone');
		$object->email = GETPOST('email');
		$object->sales_person_id = GETPOST('sales_person');
		$object->next_action = GETPOST('na');
		$object->expected_closing = GETPOST('ec');
		$object->status = GETPOST('status');
		$object->note_private = GETPOST('note_private');
		$object->progress = GETPOST('progress');
		$object->rowid = GETPOST('rowid');
		$object->priority = GETPOST('priority');
		$result = $object->updateLeads();
		$actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"."?mainmenu=commercial&action=view&leftmenu=leads&leads=".$object->rowid;
		if($result == 1){
			echo "<script type='text/javascript'> document.location = '".$actual_link."'; </script>";
		}

		
		
	}


    
}
?>
<style type="text/css">
    /* 
        Use :not with impossible condition so inputs are only hidden 
        if pseudo selectors are supported. Otherwise the user would see
        no inputs and no highlighted stars.
    */
    .rating input[type="radio"]:not(:nth-of-type(0)) {
        /* hide visually */    
        border: 0;
        clip: rect(0 0 0 0);
        height: 1px;
        margin: -1px;
        overflow: hidden;
        padding: 0;
        position: absolute;
        width: 1px;
    }
    .rating [type="radio"]:not(:nth-of-type(0)) + label {
        display: none;
    }
    
    label[for]:hover {
        cursor: pointer;
    }
    
    .rating .stars label:before {
		content: "★";
    }
    
    .stars label {
        color: lightgray;
    }
    
    .stars label:hover {
        text-shadow: 0 0 1px #000;
    }
    
    .rating [type="radio"]:nth-of-type(1):checked ~ .stars label:nth-of-type(-n+1),
    .rating [type="radio"]:nth-of-type(2):checked ~ .stars label:nth-of-type(-n+2),
    .rating [type="radio"]:nth-of-type(3):checked ~ .stars label:nth-of-type(-n+3),
    .rating [type="radio"]:nth-of-type(4):checked ~ .stars label:nth-of-type(-n+4),
    .rating [type="radio"]:nth-of-type(5):checked ~ .stars label:nth-of-type(-n+5) {
        color: orange;
    }
    
    .rating [type="radio"]:nth-of-type(1):focus ~ .stars label:nth-of-type(1),
    .rating [type="radio"]:nth-of-type(2):focus ~ .stars label:nth-of-type(2),
    .rating [type="radio"]:nth-of-type(3):focus ~ .stars label:nth-of-type(3),
    .rating [type="radio"]:nth-of-type(4):focus ~ .stars label:nth-of-type(4),
    .rating [type="radio"]:nth-of-type(5):focus ~ .stars label:nth-of-type(5) {
        color: darkorange;
    }
</style>
<?php
/*
 * View
 */

$form = new Form($db);
$formfile = new FormFile($db);
$formpropal = new FormPropal($db);
$formmargin = new FormMargin($db);
if (!empty($conf->projet->enabled)) {
	$formproject = new FormProjets($db);
}

$title = $langs->trans('Leads')." - ".$langs->trans('Card');
$help_url = 'EN:Commercial_Proposals|FR:Proposition_commerciale|ES:Presupuestos|DE:Modul_Angebote';
llxHeader('', $title, $help_url);

$now = dol_now();

// Add new proposal
if ($action == 'create' || $action == 'add') {
	$currency_code = $conf->currency;

	print load_fiche_titre($langs->trans("NewLeads"), '', 'propal');

	print '<form name="addprop" action="'.$_SERVER["PHP_SELF"].'" method="POST">';
	print '<input type="hidden" name="token" value="'.newToken().'">';
	print '<input type="hidden" name="action" value="add">';
	if ($origin != 'project' && $originid) {
		print '<input type="hidden" name="origin" value="'.$origin.'">';
		print '<input type="hidden" name="originid" value="'.$originid.'">';
	} elseif ($origin == 'project' && !empty($projectid)) {
		print '<input type="hidden" name="projectid" value="'.$projectid.'">';
	}

	print dol_get_fiche_head();

	print '<table class="border centpercent">';

	// Reference

	// Ref customer
	print '<tr><td style="width:15%">'.$langs->trans('CustomerName').'</td><td colspan="3" >';
	print '<input type="text" name="ref_client" class="width100p" value="" ></td>';
	print '</tr>';
	// Phone / Fax
	print '<tr><td>'.$form->editfieldkey('Phone', 'phone', '', $object, 0).'</td>';
	print '<td colspan="3" '.($conf->browser->layout == 'phone' ? ' ' : '').'>'.img_picto('', 'object_phoning').' <input type="text" name="phone" id="phone" class="width100p widthcentpercentminusx" value="'.(GETPOSTISSET('phone') ?GETPOST('phone', 'alpha') : $object->phone).'" ></td></tr>';
    //Email
	print '<tr><td>'.$form->editfieldkey('EMail', 'email', '', $object, 0, 'string', '', empty($conf->global->SOCIETE_EMAIL_MANDATORY) ? '' : $conf->global->SOCIETE_EMAIL_MANDATORY).'</td>';
	print '<td colspan="3" '.(($conf->browser->layout == 'phone') || empty($conf->mailing->enabled) ? ' "' : '').'>'.img_picto('', 'object_email').' <input type="text" class="width100p widthcentpercentminusx" name="email" id="email" value="'.$object->email.'" ></td></tr>';
	// sales person
	print '<tr>';
	print '<td>'.$form->editfieldkey('SalesPerson', 'commercial_id', '', $object, 0).'</td>';
	print '<td colspan="3" >';
	$userlist = $form->select_dolusers('', '', 0, null, 0, '', '', 0, 0, 0, 'AND u.statut = 1', 0, '', '', 0, 1);
	$selected = GETPOST('sales_person', 'array');
	if (empty($selected)) {
		$selected = $object->getSalesRepresentatives($user, 1);
		
	}
	print '<select class="flat width100p" id="status" name="sales_person" >';
	if (!empty($userlist)) {
		foreach ($userlist as $key => $value) {
			$newval = ($translate ? $langs->trans($value) : $value);
			$newval = ($key_in_label ? $key.' - '.$newval : $newval);

			$out .= '<option value="'.$key.'"';
			if (is_array($selected) && !empty($selected) && in_array((string) $key, $selected) && ((string) $key != '')) {
				$out .= ' selected';
			}
			$out .= ' data-html="'.dol_escape_htmltag($newval).'"';
			$out .= '>';
			$out .= dol_htmlentitiesbr($newval);
			$out .= '</option>'."\n";
		}
	}
	print $out;
	print '</select>';
	//print img_picto('', 'user').$form->multiselectarray('sales_person', $userlist, $arrayselected, 0, 0, 'quatrevingtpercent widthcentpercentminusx', 0, 0, '', '', '', 1);
	print '</td></tr>';

	

	// Next Action
	print '<tr><td>'.$langs->trans('NextAction').'</td><td colspan="3" >';
	print $form->selectDate('', 'na', '', '', '', "addprop", 1, 1);
	print '</td></tr>';
    // Expected Closing
	print '<tr><td>'.$langs->trans('ExpectedClosing').'</td><td colspan="3">';
	print $form->selectDate(date('Y-m-d', strtotime(' +1 day')), 'ec', '', '', '', "addprop",1, 1);
	print '</td></tr>';
	
	// status
	print '<tr>';
	print '<td>'.$form->editfieldkey('Status', 'status', '', $object, 0).'</td>';
	print '<td colspan="3">';
	print '<select class="flat width100p" id="status" name="status" >';
	foreach($arraystatus as $key =>$value){
		$selected = ($key == $object->status)? 'selected' : '';
		print '<option value="'.$key.'" '.$selected.'>'.$value.'</option>';
	}
	print '</select>';
	print '</td></tr>';
    // // priority
	
		print '<tr>';
		print '<td>'.$form->editfieldkey('Priority', 'multicurrency_code', '', $object, 0).'</td>';
		print '<td >';
		print '<fieldset class="rating">
					<input id="priority-1" type="radio" name="priority" value="1"> 
					<label for="priority-1">Low</label>
					<input id="priority-2" type="radio" name="priority" value="2">
					<label for="priority-2">Low</label>
					<input id="priority-3" type="radio" name="priority" value="3" checked>
					<label for="priority-3">Medium</label>
					<input id="priority-4" type="radio" name="priority" value="4">
					<label for="priority-4">High</label>
					<input id="priority-5" type="radio" name="priority" value="5">
					<label for="priority-5">High</label>
					<div class="stars">
						<label for="priority-1" aria-label="Low" title="Low"></label>
						<label for="priority-2" aria-label="Low" title="Low"></label>
						<label for="priority-3" aria-label="3 stars" title="Medium"></label>
						<label for="priority-4" aria-label="4 stars" title="High"></label>
						<label for="priority-5" aria-label="5 stars" title="High"></label>   
					</div>
				</fieldset>';
		print '</td></tr>';
	
	// Private note
	if (empty($user->socid)) {
		print '<tr>';
		print '<td class="tdtop">'.$langs->trans('NotePrivate').'</td>';
		print '<td valign="top" colspan="3">';
		$note_private = $object->getDefaultCreateValueFor('note_private', ((!empty($origin) && !empty($originid) && is_object($objectsrc)) ? $objectsrc->note_private : null));
		$doleditor = new DolEditor('note_private', $note_private, '', 80, 'berp3_notes', 'In', 0, false, empty($conf->global->FCKEDITOR_ENABLE_NOTE_PRIVATE) ? 0 : 1, ROWS_3, '90%');
		print $doleditor->Create(1);
		// print '<textarea name="note_private" wrap="soft" cols="70" rows="'.ROWS_3.'">'.$note_private.'.</textarea>
		print '</td></tr>';
	}

    

	

	print "</table>\n";

	print dol_get_fiche_end();

	$langs->load("bills");

	print $form->buttonsSaveCancel("Save");

	print "</form>";


}
if(!empty(GETPOST('progress')) && $action == 'view' && !empty(GETPOST('leads'))){
   $object->progress = GETPOST('progress');
   $rowid = (!empty(GETPOST('leads'))) ? GETPOST('leads') : 0 ;
   $object->rowid = ($rowid == 0 ) ? GETPOST('rowid'): $rowid;
   $object->updateProgress();
}
if ($action == 'edit' || $action == 'view') {
	$url_action = '';
	$currency_code = $conf->currency;
	$rowid = (!empty(GETPOST('leads'))) ? GETPOST('leads') : 0 ;
	$object->rowid = ($rowid == 0 ) ? GETPOST('rowid'): $rowid;
	//$object->rowid;
	$object->ref_client = GETPOST('ref_client');
	$object->phone = GETPOST('phone');
	$object->email = GETPOST('email');
	$object->sales_person_id = GETPOST('sales_person');
	$object->next_action = GETPOST('na');
	$object->expected_closing = GETPOST('ec');
	$object->status = GETPOST('status');
	$object->note_private = GETPOST('note_private');
	$object->priority = GETPOST('priority');
	//$object->progress = GETPOST('progress');
	
    $leads = $object->fecthLeadsById($rowid);
	$ap = array("qualified", "disqualified", "cancel", "convertedtoquotation","draft");
	//print_r($object->progress);
	// if($object->progress == '' || $object->progress == 0 || empty($object->progress)){
	// 	$object->progress = 'draft';
	// 	echo 123;
	// }
	if( !in_array($object->progress,$ap)){
		$object->progress = 'draft';
		//echo 123;
	}
	//echo $object->progress;
	$disabled ='disabled="disabled"';
	if($action == 'edit'){
		$disabled = '';
		print load_fiche_titre($langs->trans("EditLead"), '', 'propal');
		$btn_name = 'save';
		$btn_label = 'Save';
		$url_action = "?mainmenu=commercial&action=view&leftmenu=leads&leads=".$object->rowid;
	}
		
	if($action == 'view'){
        print load_fiche_titre($langs->trans("ViewLead"), '', 'propal');
		$btn_name = 'edit';
		$btn_label = 'Edit';
		$url_action = "?mainmenu=commercial&action=edit&leftmenu=leads&leads=".$object->rowid;
	}
	
	print '<form name="addprop" action="'.$_SERVER["PHP_SELF"].'" method="POST">';
	print '<input type="hidden" name="token" value="'.newToken().'">';
	print '<input type="hidden" name="action" value="edit">';
	print '<input type="hidden" name="rowid" value="'.$object->rowid.'">';
	print '<input type="hidden" name="progress" value="'.$object->progress.'">';
	if ($origin != 'project' && $originid) {
		print '<input type="hidden" name="origin" value="'.$origin.'">';
		print '<input type="hidden" name="originid" value="'.$originid.'">';
	} elseif ($origin == 'project' && !empty($projectid)) {
		print '<input type="hidden" name="projectid" value="'.$projectid.'">';
	}

	print dol_get_fiche_head();

	print '<table class="border centpercent">';

	// Reference
    print '<tr><td style="width:15%">'.$langs->trans('Ref').'</td><td colspan="3" >';
	print '<input disabled type="text" name="ref" class="width100p" value="'.$object->ref.'" ></td>';
	print '</tr>';
	// Ref customer
	print '<tr><td style="width:15%">'.$langs->trans('CustomerName').'</td><td colspan="3" >';
	print '<input '.$disabled.' type="text" name="ref_client" class="width100p" value="'.$object->ref_client.'" ></td>';
	print '</tr>';
	// Phone / Fax
	print '<tr><td>'.$form->editfieldkey('Phone', 'phone', '', $object, 0).'</td>';
	print '<td colspan="3" '.($conf->browser->layout == 'phone' ? ' ' : '').'>'.img_picto('', 'object_phoning').' <input '.$disabled.' type="text" name="phone" id="phone" class="width100p widthcentpercentminusx" value="'.$object->phone.'" required></td></tr>';
    //Email
	print '<tr><td>'.$form->editfieldkey('EMail', 'email', '', $object, 0, 'string', '', empty($conf->global->SOCIETE_EMAIL_MANDATORY) ? '' : $conf->global->SOCIETE_EMAIL_MANDATORY).'</td>';
	print '<td colspan="3" '.(($conf->browser->layout == 'phone') || empty($conf->mailing->enabled) ? ' "' : '').'>'.img_picto('', 'object_email').' <input '.$disabled.' type="text" class="width100p widthcentpercentminusx" name="email" id="email" value="'.$object->email.'" required></td></tr>';
	// sales person
	print '<tr>';
	print '<td>'.$form->editfieldkey('SalesPerson', 'commercial_id', '', $object, 0).'</td>';
	print '<td colspan="3" >';
	$userlist = $form->select_dolusers('', '', 0, null, 0, '', '', 0, 0, 0, 'AND u.statut = 1', 0, '', '', 0, 1);
	$selected = GETPOST('sales_person', 'array');
	if (empty($selected)) {
		$selected = $object->getSalesRepresentatives($user, 1);	
	}
	//print_r($userlist);
	print '<select class="flat width100p" id="status" name="sales_person" '.$disabled.' >';
	if (!empty($userlist)) {
		foreach ($userlist as $key => $value) {
			$newval = ($translate ? $langs->trans($value) : $value);
			$newval = ($key_in_label ? $key.' - '.$newval : $newval);

			$out .= '<option value="'.$key.'"';
			if ($key == $object->sales_person_id) {
				$out .= ' selected';
			}
			$out .= ' data-html="'.dol_escape_htmltag($newval).'"';
			$out .= '>';
			$out .= dol_htmlentitiesbr($newval);
			$out .= '</option>'."\n";
		}
	}
	print $out;
	print '</select>';
	//print img_picto('', 'user').$form->multiselectarray('sales_person', $userlist, $arrayselected, 0, 0, 'quatrevingtpercent widthcentpercentminusx', 0, 0, '', '', '', 1);
	print '</td></tr>';
    
	if($action == 'edit'){
		// Next Action
		print '<tr><td>'.$langs->trans('NextAction').'</td><td colspan="3" >';
		print $form->selectDate($object->next_action, 'na', '', '', '', "addprop", 1, 1);
		print '</td></tr>';

		// Expected Closing
		print '<tr><td>'.$langs->trans('ExpectedClosing').'</td><td colspan="3">';
		print $form->selectDate($object->expected_closing, 'ec', '', '', '', "addprop", 1, 1,'','','','','','','','','');
		print '</td></tr>';
		//arry status
	}
	if($action == 'view'){
		// Next Action
		print '<tr><td>'.$langs->trans('NextAction').'</td><td colspan="3" >';
		print '<input '.$disabled.' type="text" name="nc" class="width100p" value="'.$object->next_action.'" >';
		print '</td></tr>';
		// Expected Closing
		print '<tr><td>'.$langs->trans('ExpectedClosing').'</td><td colspan="3">';
		print '<input '.$disabled.' type="text" name="nc" class="width100p" value="'.$object->expected_closing.'" >';
		print '</td></tr>';
		
	}
	
	// status
	print '<tr>';
	print '<td>'.$form->editfieldkey('Status', 'status', '', $object, 0).'</td>';
	print '<td colspan="3">';
	print '<select class="flat width100p" id="status" name="status" '.$disabled.' >';

	foreach($arraystatus as $key =>$value){
		$selected = ($key == $object->status)? 'selected' : '';
		print '<option value="'.$key.'" '.$selected.'>'.$value.'</option>';
	}
	
	print '</select>';
	print '</td></tr>';
   
	// // priority
	
	print '<tr>';
	print '<td>'.$form->editfieldkey('Priority', 'multicurrency_code', '', $object, 0).'</td>';
	print '<td >';
	print '<fieldset class="rating">
				<input id="priority-1" type="radio" name="priority" value="1" '.($object->priority == 1 ? "checked":"").'> 
				<label for="priority-1">Low</label>
				<input id="priority-2" type="radio" name="priority" value="2" '.($object->priority == 2 ? "checked":"").'>
				<label for="priority-2">Low</label>
				<input id="priority-3" type="radio" name="priority" value="3" '.($object->priority == 3 ? "checked":"").'>
				<label for="priority-3">Medium</label>
				<input id="priority-4" type="radio" name="priority" value="4" '.($object->priority == 4 ? "checked":"").'>
				<label for="priority-4">High</label>
				<input id="priority-5" type="radio" name="priority" value="5" '.($object->priority == 5 ? "checked":"").'>
				<label for="priority-5">High</label>
				<div class="stars">
					<label for="priority-1" aria-label="Low" title="Low"></label>
					<label for="priority-2" aria-label="Low" title="Low"></label>
					<label for="priority-3" aria-label="3 stars" title="Medium"></label>
					<label for="priority-4" aria-label="4 stars" title="High"></label>
					<label for="priority-5" aria-label="5 stars" title="High"></label>   
				</div>
			</fieldset>';
	print '</td></tr>';


    // note private
	print '<tr><td class="tdtop">'.$form->editfieldkey('NotePrivate', 'note_private', '', $object, 0).'</td>';
	print '<td colspan="3"><textarea name="note_private" id="note_private" class="quatrevingtpercent width100p" rows="3" wrap="soft" '.$disabled.'>';
	print dol_escape_htmltag($object->note_private, 0, 1);
	print '</textarea>';
	print $form->widgetForTranslation("note_private", $object, $permissiontoadd, 'textarea', 'alphanohtml', 'quatrevingtpercent');
	print '</td></tr>';

	

	print "</table>\n";

	print dol_get_fiche_end();

	$langs->load("bills");

	//print $form->buttonsSaveCancel("Save");
	$arrayProgress = array();
    
	if($object->progress == 'draft'){
		$arrayProgress = [
			'qualified' => [
				 'name' => 'Qualified',
				 'css' => 'color: #fff;background-color: #00c292;border-color: #00c292;background-image:unset',
				 'url' => '?mainmenu=commercial&action=view&leftmenu=leads&progress=qualified&leads='.$object->rowid,
				 ],
			'disqualified' => [
				'name' =>'Disqualified',
				'css' => 'color: #fff;background-color: #e46a76;border-color: #e46a76;background-image:unset',
				'url' => '?mainmenu=commercial&action=view&leftmenu=leads&progress=disqualified&leads='.$object->rowid,
				] ,
			'cancel' => [
				'name' =>'Cancel',
				'css' => 'color: #fff;background-color: darkgrey;border-color: #a09595;background-image:unset',
				'url' => '?mainmenu=commercial&action=view&leftmenu=leads&progress=cancel&leads='.$object->rowid,
			],
		];
	}
	
	if($object->progress == 'qualified'){
		$arrayProgress = [
			'convertedtoquotation' => [
				 'name' => 'Convert to Quotation',
				 'css' => 'color: #fff;background-color: #00c292;border-color: #00c292;background-image:unset',
				 'url' => '././customer.php?mainmenu=commercial&action=create&leftmenu=leads&type=c&progress=convertedtoquotation&leads='.$object->rowid,
				],
			'cancel' => [
				'name' =>'Cancel',
				'css' => 'color: #fff;background-color: darkgrey;border-color: #a09595;background-image:unset',
				'url' => '?mainmenu=commercial&action=view&leftmenu=leads&progress=cancel&leads='.$object->rowid,
			],
		];
	}
	if($object->progress == 'disqualified'){
		$arrayProgress = [
			'qualified' => [ 
				'name' => 'Qualified',
				'css' => 'color: #fff;background-color: #00c292;border-color: #00c292;background-image:unset',
				'url' => '?mainmenu=commercial&action=view&leftmenu=leads&progress=qualified&leads='.$object->rowid,
			],
			'cancel' => [
				'name' =>'Cancel',
				'css' => 'color: #fff;background-color: darkgrey;border-color: #a09595;background-image:unset',
				'url' => '?mainmenu=commercial&action=view&leftmenu=leads&progress=cancel&leads='.$object->rowid,
			],
		];
	}
    
	print '<div class="center">';
	if($action == 'edit'){
		print '<input type="submit" class="button button-save" name="save" id="save" value="Save">';
	}
    

	
	if($action == 'view'){
		if($object->progress == 'cancel'){
		  	print '<p style = "color:red">Cancelled</p>';
		}else{
			print '<a type="submit" class="button button-edit" name="edit" id="edit" href="'.$url_action.'" >Edit</a>';
			foreach ($arrayProgress as $key => $value) {
				print '<a type="submit" class="button button-'.$key.' " name="'.$key.'" href="'.$value['url'].'"  style="'.$value['css'].'">'.$value['name'].'</a>';
			}
		}
		
		
	}
	print '</div>';
	print "</form>";


}



//$url_update_progress = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";


// End of page
llxFooter();
$db->close();

	