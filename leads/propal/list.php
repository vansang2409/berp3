<?php
/* Copyright (C) 2001-2007 		
 * Copyright (C) 2004-2016 
 * Copyright (C) 2004      
 * Copyright (C) 2005      
 * Copyright (C) 2005-2013 
 * Copyright (C) 2006      			
 * Copyright (C) 2010-2011 
 * Copyright (C) 2010-2011 
 * Copyright (C) 2012      		
 * Copyright (C) 2013      			
 * Copyright (C) 2015      
 * Copyright (C) 2016-2021 			
 * Copyright (C) 2017-2018 			
 * Copyright (C) 2018	   			
 * Copyright (C) 2019-2021 
 * Copyright (C) 2021	   Anthony Berton			<anthony.berton@bb2a.fr>
 * Copyright (C) 2021      			
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
 *	\file       	htdocs/comm/propal/list.php
 *	\ingroup    	propal
 *	\brief      	Page of commercial proposals card and list
 */

require '../../main.inc.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/html.formother.class.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/html.formfile.class.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/html.formpropal.class.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/html.formcompany.class.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/date.lib.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/company.lib.php';
require_once DOL_DOCUMENT_ROOT.'/leads/propal/class/leads.class.php';
require_once DOL_DOCUMENT_ROOT.'/projet/class/project.class.php';

// Load translation files required by the page
$langs->loadLangs(array('companies', 'propal', 'compta', 'bills', 'orders', 'products', 'deliveries', 'categories'));
if (!empty($conf->expedition->enabled)) {
	$langs->loadLangs(array('sendings'));
}
// turn off warning reporting
error_reporting(E_ERROR | E_PARSE);
$socid = GETPOST('socid', 'int');

$action = GETPOST('action', 'aZ09');
$massaction = GETPOST('massaction', 'alpha');
$show_files = GETPOST('show_files', 'int');
$confirm = GETPOST('confirm', 'alpha');
$toselect = GETPOST('toselect', 'array');
//print_r($toselect);
$contextpage = GETPOST('contextpage', 'aZ') ?GETPOST('contextpage', 'aZ') : 'proposallist';

$search_priority = GETPOST('search_priority','int');
$search_sales = GETPOST('search_sales', 'int');
$search_ref = GETPOST('sf_ref') ?GETPOST('sf_ref', 'alpha') : GETPOST('search_ref', 'alpha');
$search_refcustomer = GETPOST('search_refcustomer', 'alpha');
$search_status = GETPOST('search_status', 'alpha');
$optioncss = GETPOST('optioncss', 'alpha');
$object_statut = GETPOST('search_statut', 'alpha');
$search_progress = GETPOST('search_progress', 'alpha');
$sall = trim((GETPOST('search_all', 'alphanohtml') != '') ?GETPOST('search_all', 'alphanohtml') : GETPOST('sall', 'alphanohtml'));
$mesg = (GETPOST("msg") ? GETPOST("msg") : GETPOST("mesg"));


$limit = GETPOST('limit', 'int') ?GETPOST('limit', 'int') : $conf->liste_limit;
$sortfield = GETPOST("sortfield", 'alpha');
$sortorder = GETPOST("sortorder", 'alpha');
$page = GETPOSTISSET('pageplusone') ? (GETPOST('pageplusone') - 1) : GETPOST("page", 'int');
if (empty($page) || $page == -1 || !empty($search_btn) || !empty($search_remove_btn) || (empty($toselect) && $massaction === '0')) {
	$page = 0;
}     // If $page is not defined, or '' or -1
$offset = $limit * $page;
$pageprev = $page - 1;
$pagenext = $page + 1;
if (!$sortfield) {
	$sortfield = 'l.ref';
}
if (!$sortorder) {
	$sortorder = 'DESC';
}

// Security check
$module = 'propal';
$dbtable = '';
$objectid = '';
if (!empty($user->socid)) {
	$socid = $user->socid;
}
if (!empty($socid)) {
	$objectid = $socid;
	$module = 'societe';
	$dbtable = '&societe';
}
$result = restrictedArea($user, $module, $objectid, $dbtable);

$diroutputmassaction = $conf->propal->multidir_output[$conf->entity].'/temp/massgeneration/'.$user->id;

// Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
$object = new Leads($db);
$hookmanager->initHooks(array('propallist'));
$extrafields = new ExtraFields($db);

// fetch optionals attributes and labels
$extrafields->fetch_name_optionals_label($object->table_element);

$search_array_options = $extrafields->getOptionalsFromPost($object->table_element, '', 'search_');

// List of fields to search into when doing a "search in all"
$fieldstosearchall = array(
	'l.ref'=>'Ref',
	'l.ref_client'=>'CustomerRef',
);
if (empty($user->socid)) {
	$fieldstosearchall["note_private"] = "NotePrivate";
}


$checkedtypetiers = 0;
$arrayfields = array(
	'l.ref'=>array('label'=>"Ref", 'checked'=>1),
	'l.ref_client'=>array('label'=>"RefCustomer", 'checked'=>1),
	'l.phone'=>array('label'=>"Phone", 'checked'=>1),
	'l.email'=>array('label'=>"Email", 'checked'=>1),
	'l.sales_person_id'=>array('label'=>"SalesPerson", 'checked'=>1),
	'l.sales_person'=>array('label'=>"SalesPerson", 'checked'=>1),
	'l.next_action'=>array('label'=>"NextAction", 'checked'=>1),
	'l.expected_closing'=>array('label'=>"ExpectedClosing", 'checked'=>1),
	'l.priority'=>array('label'=>"Priority", 'checked'=>1),
	'l.note_private'=>array('label'=>"NotePrivate", 'checked'=>1),
	'l.created_date'=>array('label'=>"CreatedDate", 'checked'=>1),
	'l.updated_date'=>array('label'=>"Updated_date", 'checked'=>0),
	'l.progress'=>array('label'=>"Progress", 'checked'=>1),
	'l.status'=>array('label'=>"Status", 'checked'=>1),
	'u.lastname'=>array('label'=>"Lastname", 'checked'=>1),
	'u.firstname'=>array('label'=>"Firstname", 'checked'=>1),
);
$arrayprogress = [
	'qualified' => 'Qualified',
	'disqualified' => 'Disqualified',
	'cancel' => 'Cancel',
	'convertedtoquotation' => 'Converted to Quotation',
	'draft' => 'Draft',
];

$arraystatus = [
	"_new" => "New",
	"_1st_meeting" => "1stmeeting",
	"_negotiation" => "Negotiation",
	"_won" => "Won",
	"_lost" => "Lost",
	"_deleted" => "Deleted",
	"_pre_call" => "Precall",
];
$arraypriority = [
	"0"  => "All",
	"1" => "Low",
	"3" => "Medium",
	"4" => "High",
];
// Extra fields
include DOL_DOCUMENT_ROOT.'/core/tpl/extrafields_list_array_fields.tpl.php';

$permissiontoread = $user->rights->propal->lire;
$permissiontoadd = $user->rights->propal->creer;
$permissiontodelete = $user->rights->propal->supprimer;
if (!empty($conf->global->MAIN_USE_ADVANCED_PERMS)) {
	$permissiontovalidate = $user->rights->propal->propal_advance->validate;
	$permissiontoclose = $user->rights->propal->propal_advance->close;
	$permissiontosendbymail = $user->rights->propal->propal_advance->send;
} else {
	$permissiontovalidate = $user->rights->propal->creer;
	$permissiontoclose = $user->rights->propal->creer;
	$permissiontosendbymail = $user->rights->propal->lire;
}


/*
 * Actions
 */

if (GETPOST('cancel', 'alpha')) {
	$action = 'list';
	$massaction = '';
}
if (!GETPOST('confirmmassaction', 'alpha') && $massaction != 'presend' && $massaction != 'confirm_presend') {
	$massaction = '';
}

$parameters = array('socid'=>$socid);
$reshook = $hookmanager->executeHooks('doActions', $parameters, $object, $action); // Note that $action and $object may have been modified by some hooks
if ($reshook < 0) {
	setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
}

include DOL_DOCUMENT_ROOT.'/core/actions_changeselectedfields.inc.php';

// Do we click on purge search criteria ?
if (GETPOST('button_removefilter_x', 'alpha') || GETPOST('button_removefilter.x', 'alpha') || GETPOST('button_removefilter', 'alpha')) { // All tests are required to be compatible with all browsers
	$search_priority = '';
	$search_sales = '';
	$search_ref = '';
	$search_refcustomer = '';
	$search_status = '';
	$search_progress = '';
}



if (empty($reshook)) {
	$objectclass = 'Leads';
	$objectlabel = 'Leads';
	$uploaddir = $conf->propal->multidir_output[$conf->entity];
	include DOL_DOCUMENT_ROOT.'/core/actions_massactions.inc.php';
}

if ($action == 'validate' && $permissiontovalidate) {
	if (GETPOST('confirm') == 'yes') {
		// $tmpproposal = new Leads($db);
		// $db->begin();
		// $error = 0;
		// foreach ($toselect as $checked) {
		// 	// if ($tmpproposal->fetch($checked)) {
		// 	// 	if ($tmpproposal->statut == 0) {
		// 	// 		if ($tmpproposal->valid($user)) {
		// 	// 			setEventMessage($langs->trans('hasBeenValidated', $tmpproposal->ref), 'mesgs');
		// 	// 		} else {
		// 	// 			setEventMessage($langs->trans('CantBeValidated'), 'errors');
		// 	// 			$error++;
		// 	// 		}
		// 	// 	} else {
		// 	// 		$langs->load("errors");
		// 	// 		setEventMessage($langs->trans('ErrorIsNotADraft', $tmpproposal->ref), 'errors');
		// 	// 		$error++;
		// 	// 	}
		// 	// } else {
		// 	// 	dol_print_error($db);
		// 	// 	$error++;
		// 	// }
		// 	echo $checked;
		// }
		// if ($error) {
		// 	$db->rollback();
		// } else {
		// 	$db->commit();
		// }
		echo 123;
	}
	
}



/*
 * View
 */
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
$now = dol_now();

$form = new Form($db);
$formother = new FormOther($db);
$formfile = new FormFile($db);
$formpropal = new FormPropal($db);
$companystatic = new Societe($db);
$projectstatic = new Project($db);
$formcompany = new FormCompany($db);

$help_url = 'EN:Commercial_Proposals|FR:Proposition_commerciale|ES:Presupuestos';
//llxHeader('',$langs->trans('Proposal'),$help_url);

//$sql = 'SELECT * FROM '.MAIN_DB_PREFIX.'leads';
$sql = 'SELECT l.*, u.lastname ,u.firstname  FROM '.MAIN_DB_PREFIX.'leads l INNER JOIN '.MAIN_DB_PREFIX.'user u ON l.sales_person_id = u.rowid';
$sql .=' WHERE 1 = 1 ';
if(!empty($search_status)){
	$sql .=" AND l.status = '".$search_status."'";
}
if(!empty($search_progress)){
	$sql .=" AND l.progress = '".$search_progress."'";
}
if(!empty($search_sales) && $search_sales != 0){
	$sql .=" AND l.sales_person_id = ".$search_sales;
}
if(!empty($search_priority) && $search_priority != 0){
	$sql .=" AND l.priority = ".$search_priority;
}

//echo $sql;
// Count total nb of records
$nbtotalofrecords = '';
if (empty($conf->global->MAIN_DISABLE_FULL_SCANLIST)) {
	$result = $db->query($sql);
	$nbtotalofrecords = $db->num_rows($result);

	if (($page * $limit) > $nbtotalofrecords) {	// if total resultset is smaller then paging size (filtering), goto and load page 0
		$page = 0;
		$offset = 0;
	}
}

$sql .= $db->plimit($limit + 1, $offset);

$resql = $db->query($sql);

if ($resql) {
	$objectstatic = new Leads($db);
    $title = $langs->trans('ListOfLeads');
	$num = $db->num_rows($resql);
	$arrayofselected = is_array($toselect) ? $toselect : array();
	llxHeader('', $langs->trans('ListOfLeads'), $help_url);

	$param = '&search_status='.urlencode($search_status);
	if (!empty($contextpage) && $contextpage != $_SERVER["PHP_SELF"]) {
		$param .= '&contextpage='.urlencode($contextpage);
	}
	if ($limit > 0 && $limit != $conf->liste_limit) {
		$param .= '&limit='.urlencode($limit);
	}
	if ($sall) {
		$param .= '&sall='.urlencode($sall);
	}
	

	// Add $param from extra fields
	include DOL_DOCUMENT_ROOT.'/core/tpl/extrafields_list_search_param.tpl.php';

	// List of mass actions available
	// if ($permissiontovalidate) {
	// 	$arrayofmassactions['prevalidate']=img_picto('', 'check', 'class="pictofixedwidth"').$langs->trans("Validate");
	// }
	
	if ($permissiontodelete) {
		
		$arrayofmassactions['predelete'] = img_picto('', 'delete', 'class="pictofixedwidth"').$langs->trans("Delete");
	}

	if (in_array($massaction, array('presend', 'predelete', 'closed'))) {
		$arrayofmassactions = array();
	}
	$massactionbutton = $form->selectMassAction('', $arrayofmassactions);

	$url = DOL_URL_ROOT.'/leads/propal/card.php?action=create';
	
	$newcardbutton = dolGetButtonTitle($langs->trans('NewPropal'), '', 'fa fa-plus-circle', $url, '', $user->rights->propal->creer);

	// Fields title search
	print '<form method="POST" id="searchFormList" action="'.$_SERVER["PHP_SELF"].'">';
	if ($optioncss != '') {
		print '<input type="hidden" name="optioncss" value="'.$optioncss.'">';
	}
	print '<input type="hidden" name="token" value="'.newToken().'">';
	print '<input type="hidden" name="formfilteraction" id="formfilteraction" value="list">';
	print '<input type="hidden" name="action" value="list">';
	print '<input type="hidden" name="sortfield" value="'.$sortfield.'">';
	print '<input type="hidden" name="sortorder" value="'.$sortorder.'">';
	print '<input type="hidden" name="contextpage" value="'.$contextpage.'">';
    
	print_barre_liste($title, $page, $_SERVER["PHP_SELF"], $param, $sortfield, $sortorder, $massactionbutton, $num, $nbtotalofrecords, 'propal', 0, $newcardbutton, '', $limit, 0, 0, 1);

	$topicmail = "SendPropalRef";
	$modelmail = "propal_send";
	$objecttmp = new Leads($db);
	$trackid = 'pro'.$object->id;
	include DOL_DOCUMENT_ROOT.'/core/tpl/massactions_pre.tpl.php';

	if ($massaction == 'prevalidate') {
		print $form->formconfirm($_SERVER["PHP_SELF"], $langs->trans("ConfirmMassValidation"), $langs->trans("ConfirmMassValidationQuestion"), "validate", null, '', 0, 200, 500, 1);
	}

	if ($massaction == 'presign') {
		print $form->formconfirm($_SERVER["PHP_SELF"], $langs->trans("ConfirmMassSignature"), $langs->trans("ConfirmMassSignatureQuestion"), "sign", null, '', 0, 200, 500, 1);
	}

	if ($massaction == 'nopresign') {
		print $form->formconfirm($_SERVER["PHP_SELF"], $langs->trans("ConfirmMassNoSignature"), $langs->trans("ConfirmMassNoSignatureQuestion"), "nosign", null, '', 0, 200, 500, 1);
	}

	if ($sall) {
		foreach ($fieldstosearchall as $key => $val) {
			$fieldstosearchall[$key] = $langs->trans($val);
		}
		print '<div class="divsearchfieldfilter">'.$langs->trans("FilterOnInto", $sall).join(', ', $fieldstosearchall).'</div>';
	}

	$i = 0;

	

	$varpage = empty($contextpage) ? $_SERVER["PHP_SELF"] : $contextpage;
	$selectedfields = $form->multiSelectArrayWithCheckbox('selectedfields', $arrayfields, $varpage); // This also change content of $arrayfields
	$selectedfields .= (count($arrayofmassactions) ? $form->showCheckAddButtons('checkforselect', 1) : '');

	print '<div class="div-table-responsive">';
	print '<table class="tagtable liste'.($moreforfilter ? " listwithfilterbefore" : "").'">'."\n";
    print '<thead >';
	// filter
	print '<tr class="liste_titre_filter">';
	print '<td class="liste_titre" align="middle">';
	print  $tmptitle = $langs->trans('Priority');
	print '</td>';
	print '<td class="liste_titre" align="middle" colspan="4">';
	print '<select class="flat width100p" id="search_priority" name="search_priority" >';
	foreach($arraypriority as $key =>$value){
		$selected = ($key == $object->status)? 'selected' : '';
		print '<option value="'.$key.'" '.$selected.'>'.$value.'</option>';
	}
	print '</select>';
	print '</td>';
	print '<td class="liste_titre" align="middle">';
	print $tmptitle = $langs->trans('SalesPerson');
	print '</td>';
	print '<td class="liste_titre" align="middle" colspan="4">';
	$userlist = $form->select_dolusers('','', 0, null, 0, '', '', 0, 0, 0, 'AND u.statut = 1', 0, '', ' ', 0, 1);
	$selected = GETPOST('search_sales', 'array');
	print '<select class="flat width100p" id="search_sales" name="search_sales" >';
	print '<option value="0">All</option>';
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
	print '</td>';
	
	// Action column
	print '<td class="liste_titre" align="right" colspan="1">';
	$searchpicto = $form->showFilterButtons();
	print $searchpicto;
	print '</td>';

	print "</tr>\n";
	print '<th><td colspan="11"><div style="min-height:5px;"></div></td></th>';
    print '</thead>';
	// Fields title
	print '<tr class="liste_titre">';
	if (!empty($arrayfields['l.ref']['checked'])) {
		print_liste_field_titre($arrayfields['l.ref']['label'], $_SERVER["PHP_SELF"], 'ref', '', $param, '', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['l.ref_client']['checked'])) {
		print_liste_field_titre($arrayfields['l.ref_client']['label'], $_SERVER["PHP_SELF"], 'ref_client', '', $param, '', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['l.phone']['checked'])) {
		print_liste_field_titre($arrayfields['l.phone']['label'], $_SERVER["PHP_SELF"], 'phone', '', $param, '', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['l.email']['checked'])) {
		print_liste_field_titre($arrayfields['l.email']['label'], $_SERVER["PHP_SELF"], 'email', '', $param, '', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['l.next_action']['checked'])) {
		print_liste_field_titre($arrayfields['l.next_action']['label'], $_SERVER["PHP_SELF"], 'next_action', '', $param, '', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['l.expected_closing']['checked'])) {
		print_liste_field_titre($arrayfields['l.expected_closing']['label'], $_SERVER["PHP_SELF"], 'expected_closing', '', $param, '', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['l.sales_person']['checked'])) {
		print_liste_field_titre($arrayfields['l.sales_person']['label'], $_SERVER["PHP_SELF"], 'sales_person', '', $param, '', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['l.priority']['checked'])) {
		print_liste_field_titre($arrayfields['l.priority']['label'], $_SERVER["PHP_SELF"], 'priority', '', $param, '', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['l.progress']['checked'])) {
		print_liste_field_titre($arrayfields['l.progress']['label'], $_SERVER["PHP_SELF"], 'progress', '', $param, '', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['l.status']['checked'])) {
		print_liste_field_titre($arrayfields['l.status']['label'], $_SERVER["PHP_SELF"], 'status', '', $param, '', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['l.created_date']['checked'])) {
		print_liste_field_titre($arrayfields['l.created_date']['label'], $_SERVER["PHP_SELF"], 'created_date', '', $param, '', $sortfield, $sortorder);
	}
	// Extra fields
	include DOL_DOCUMENT_ROOT.'/core/tpl/extrafields_list_search_title.tpl.php';
	// Hook fields
	$parameters = array(
		'arrayfields' => $arrayfields,
		'param' => $param,
		'sortfield' => $sortfield,
		'sortorder' => $sortorder,
		'totalarray' => &$totalarray,
	);
	$reshook = $hookmanager->executeHooks('printFieldListTitle', $parameters); // Note that $action and $object may have been modified by hook
	print $hookmanager->resPrint;
	if (!empty($arrayfields['p.datec']['checked'])) {
		print_liste_field_titre($arrayfields['p.datec']['label'], $_SERVER["PHP_SELF"], "p.datec", "", $param, 'align="center" class="nowrap"', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['p.tms']['checked'])) {
		print_liste_field_titre($arrayfields['p.tms']['label'], $_SERVER["PHP_SELF"], "p.tms", "", $param, 'align="center" class="nowrap"', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['p.date_cloture']['checked'])) {
		print_liste_field_titre($arrayfields['p.date_cloture']['label'], $_SERVER["PHP_SELF"], "p.date_cloture", "", $param, 'align="center" class="nowrap"', $sortfield, $sortorder);
	}
	if (!empty($arrayfields['p.note_public']['checked'])) {
		print_liste_field_titre($arrayfields['p.note_public']['label'], $_SERVER["PHP_SELF"], "p.note_public", "", $param, '', $sortfield, $sortorder, 'center nowrap ');
	}
	if (!empty($arrayfields['p.note_private']['checked'])) {
		print_liste_field_titre($arrayfields['p.note_private']['label'], $_SERVER["PHP_SELF"], "p.note_private", "", $param, '', $sortfield, $sortorder, 'center nowrap ');
	}
	if (!empty($arrayfields['p.fk_statut']['checked'])) {
		print_liste_field_titre($arrayfields['p.fk_statut']['label'], $_SERVER["PHP_SELF"], "p.fk_statut", "", $param, 'class="right"', $sortfield, $sortorder);
	}
	print_liste_field_titre($selectedfields, $_SERVER["PHP_SELF"], "", '', '', 'align="center"', $sortfield, $sortorder, 'maxwidthsearch ');
	print '</tr>'."\n";

	$now = dol_now();
	$i = 0;
	$typenArray = null;
	while ($i < min($num, $limit)) {
		$obj = $db->fetch_object($resql);
         
		$objectstatic->id = $obj->rowid;
		$objectstatic->ref = $obj->ref;
		$objectstatic->ref_client = $obj->ref_client;
		$objectstatic->phone = $obj->phone;
		$objectstatic->email = $obj->email;
		$objectstatic->sales_person_id = $obj->sales_person_id;
		$objectstatic->note_private = $obj->note_private;
		$objectstatic->priority = $obj->priority;
		$objectstatic->next_action = $obj->next_action;
		$objectstatic->expected_closing = $obj->expected_closing;
		$objectstatic->progress = $obj->progress;
		$objectstatic->status = $obj->status;
		$objectstatic->created_date = $obj->created_date;
		$objectstatic->updated_date = $obj->updated_date;
		$objectstatic->quotation_id = $obj->quotation_id;
        $le_url = '#';
		if($obj->progress == 'convertedtoquotation')
		{
            $le_url = DOL_URL_ROOT.'/comm/propal/card.php?id='.$obj->quotation_id;
		}else{
			$le_url = DOL_URL_ROOT.'/leads/propal/card.php?mainmenu=commercial&action=view&leftmenu=leads&leads='.$obj->rowid;
		}
		print '<tr class="oddeven">';

		if (!empty($arrayfields['l.ref']['checked'])) {
			print '<td class="nowraponall">';
			print '<a href="'.$le_url.'" >';
			print $obj->ref;
			print '</a>';
			print "</td>\n";
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}

		if (!empty($arrayfields['l.ref_client']['checked'])) {
			// Customer ref
			print '<td class="nowrap tdoverflowmax200">';
			print $obj->ref_client;
			print '</td>';
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}
        if (!empty($arrayfields['l.phone']['checked'])) {
			// Customer ref
			print '<td class="nowrap tdoverflowmax200">';
			print $obj->phone;
			print '</td>';
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}
		if (!empty($arrayfields['l.email']['checked'])) {
			// Customer ref
			print '<td class="nowrap tdoverflowmax200">';
			print $obj->email;
			print '</td>';
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}
		if (!empty($arrayfields['l.next_action']['checked'])) {
			// Customer ref
			print '<td class="nowrap tdoverflowmax200">';
			print $obj->next_action;
			print '</td>';
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}
		if (!empty($arrayfields['l.expected_closing']['checked'])) {
			// Customer ref
			print '<td class="nowrap tdoverflowmax200">';
			print $obj->expected_closing;
			print '</td>';
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}
        if (!empty($arrayfields['l.sales_person']['checked'])) {
			// Customer ref
			print '<td class="nowrap tdoverflowmax200">';
			print $obj->lastname.' '.$obj->firstname ;
			print '</td>';
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}
		if (!empty($arrayfields['l.priority']['checked'])) {
			// Customer ref
			print '<td class="nowrap tdoverflowmax200">';
			//echo $obj->priority;
			print '<div class="rating">
					<input id="priority-1'.$obj->rowid.'" type="radio" name="priority'.$obj->rowid.'" value="1" '.($obj->priority == 1 ? "checked":"").'> 
					<label for="priority-1'.$obj->rowid.'">Low</label>
					<input id="priority-2'.$obj->rowid.'" type="radio" name="priority'.$obj->rowid.'" value="2" '.($obj->priority == 2 ? "checked":"").'>
					<label for="priority-2'.$obj->rowid.'">Low</label>
					<input id="priority-3'.$obj->rowid.'" type="radio" name="priority'.$obj->rowid.'" value="3" '.($obj->priority == 3 ? "checked":"").'>
					<label for="priority-3'.$obj->rowid.'">Medium</label>
					<input id="priority-4'.$obj->rowid.'" type="radio" name="priority'.$obj->rowid.'" value="4" '.($obj->priority == 4 ? "checked":"").'>
					<label for="priority-4'.$obj->rowid.'">High</label>
					<input id="priority-5'.$obj->rowid.'" type="radio" name="priority'.$obj->rowid.'" value="5" '.($obj->priority == 5 ? "checked":"").'>
					<label for="priority-5'.$obj->rowid.'">High</label>
					<div class="stars">
						<label for="priority-1'.$obj->rowid.'" aria-label="Low" title="Low"></label>
						<label for="priority-2'.$obj->rowid.'" aria-label="Low" title="Low"></label>
						<label for="priority-3'.$obj->rowid.'" aria-label="3 stars" title="Medium"></label>
						<label for="priority-4'.$obj->rowid.'" aria-label="4 stars" title="High"></label>
						<label for="priority-5'.$obj->rowid.'" aria-label="5 stars" title="High"></label>   
					</div>
				</div>';
			//print $obj->priority;
			print '</td>';
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}
		if (!empty($arrayfields['l.progress']['checked'])) {
			// progress
			print '<td class="nowrap tdoverflowmax200">';
			print $arrayprogress[$obj->progress];
			print '</td>';
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}
		if (!empty($arrayfields['l.status']['checked'])) {
			// status
			print '<td class="nowrap tdoverflowmax200">';
			print $arraystatus[$obj->status];
			print '</td>';
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}
		if (!empty($arrayfields['l.created_date']['checked'])) {
			// Customer ref
			print '<td class="nowrap tdoverflowmax200">';
			print $obj->created_date;
			print '</td>';
			if (!$i) {
				$totalarray['nbfield']++;
			}
		}
		// Action column
		print '<td class="nowrap" align="center">';
		if ($massactionbutton || $massaction) {   // If we are in select mode (massactionbutton defined) or if we have already selected and sent an action ($massaction) defined
			$selected = 0;
			if (in_array($obj->rowid, $arrayofselected)) {
				$selected = 1;
			}
			print '<input id="cb'.$obj->rowid.'" class="flat checkforselect" type="checkbox" name="toselect[]" value="'.$obj->rowid.'"'.($selected ? ' checked="checked"' : '').'>';
		}
		print '</td>';
		if (!$i) {
			$totalarray['nbfield']++;
		}
		print "</tr>\n";

		$i++;
	}

	// Show total line
	include DOL_DOCUMENT_ROOT.'/core/tpl/list_print_total.tpl.php';

	$db->free($resql);

	$parameters = array('arrayfields'=>$arrayfields, 'sql'=>$sql);
	$reshook = $hookmanager->executeHooks('printFieldListFooter', $parameters); // Note that $action and $object may have been modified by hook
	print $hookmanager->resPrint;

	print '</table>'."\n";
	print '</div>'."\n";

	print '</form>'."\n";

	$hidegeneratedfilelistifempty = 1;
	if ($massaction == 'builddoc' || $action == 'remove_file' || $show_files) {
		$hidegeneratedfilelistifempty = 0;
	}

	// Show list of available documents
	$urlsource = $_SERVER['PHP_SELF'].'?sortfield='.$sortfield.'&sortorder='.$sortorder;
	$urlsource .= str_replace('&amp;', '&', $param);

	$filedir = $diroutputmassaction;
	$genallowed = $user->rights->propal->lire;
	$delallowed = $user->rights->propal->creer;

	print $formfile->showdocuments('massfilesarea_proposals', '', $filedir, $urlsource, 0, $delallowed, '', 1, 1, 0, 48, 1, $param, $title, '', '', '', null, $hidegeneratedfilelistifempty);
} else {
	dol_print_error($db);
}

// End of page
llxFooter();
$db->close();
