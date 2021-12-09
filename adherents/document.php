<?php
/* Copyright (C) 2002-2007 
 * Copyright (C) 2004-2010 
 * Copyright (C) 2005-2012 
 * Copyright (C) 2010      
 * Copyright (C) 2013            
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
 *  \file       htdocs/adherents/document.php
 *  \brief      Tab for documents linked to third party
 *  \ingroup    societe
 */

require '../main.inc.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/member.lib.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/files.lib.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/images.lib.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/html.formfile.class.php';
require_once DOL_DOCUMENT_ROOT.'/adherents/class/adherent.class.php';
require_once DOL_DOCUMENT_ROOT.'/adherents/class/adherent_type.class.php';

// Load translation files required by the page
$langs->loadLangs(array("companies", "members", "other"));


$id = GETPOSTISSET('id') ? GETPOST('id', 'int') : GETPOST('rowid', 'int');
$ref = GETPOST('ref', 'alphanohtml');
$action = GETPOST('action', 'aZ09');
$confirm = GETPOST('confirm', 'alpha');

// Get parameters
$limit = GETPOST('limit', 'int') ? GETPOST('limit', 'int') : $conf->liste_limit;
$sortfield = GETPOST("sortfield", 'alpha');
$sortorder = GETPOST("sortorder", 'alpha');
$page = GETPOSTISSET('pageplusone') ? (GETPOST('pageplusone') - 1) : GETPOST("page", 'int');
if (empty($page) || $page == -1) {
	$page = 0;
}     // If $page is not defined, or '' or -1
$offset = $limit * $page;
$pageprev = $page - 1;
$pagenext = $page + 1;
if (!$sortorder) {
	$sortorder = "ASC";
}
if (!$sortfield) {
	$sortfield = "name";
}

$object = new Adherent($db);
$membert = new AdherentType($db);
$result = $object->fetch($id, $ref);
if ($result < 0) {
	dol_print_error($db);
	exit;
}
$upload_dir = $conf->adherent->dir_output."/".get_exdir(0, 0, 0, 1, $object, 'member');

// Fetch object
if ($id > 0 || !empty($ref)) {
	// Load member
	$result = $object->fetch($id, $ref);

	// Define variables to know what current user can do on users
	$canadduser = ($user->admin || $user->rights->user->user->creer);
	// Define variables to know what current user can do on properties of user linked to edited member
	if ($object->user_id) {
		// $User is the user who edits, $object->user_id is the id of the related user in the edited member
		$caneditfielduser = ((($user->id == $object->user_id) && $user->rights->user->self->creer)
			|| (($user->id != $object->user_id) && $user->rights->user->user->creer));
		$caneditpassworduser = ((($user->id == $object->user_id) && $user->rights->user->self->password)
			|| (($user->id != $object->user_id) && $user->rights->user->user->password));
	}
}

// Define variables to determine what the current user can do on the members
$canaddmember = $user->rights->adherent->creer;
// Define variables to determine what the current user can do on the properties of a member
if ($id) {
	$caneditfieldmember = $user->rights->adherent->creer;
}

$permissiontoadd = $canaddmember;

// Security check
$result = restrictedArea($user, 'adherent', $object->id, '', '', 'socid', 'rowid', 0);


/*
 * Actions
 */

include DOL_DOCUMENT_ROOT.'/core/actions_linkedfiles.inc.php';


/*
 * View
 */

$form = new Form($db);

$title = $langs->trans("Member")." - ".$langs->trans("Documents");

$help_url = "EN:Module_Foundations|FR:Module_Adh&eacute;rents|ES:M&oacute;dulo_Miembros|DE:Modul_Mitglieder";

llxHeader("", $title, $help_url);

if ($id > 0) {
	$result = $membert->fetch($object->typeid);
	if ($result > 0) {
		// Build file list
		$filearray = dol_dir_list($upload_dir, "files", 0, '', '(\.meta|_preview.*\.png)$', $sortfield, (strtolower($sortorder) == 'desc' ?SORT_DESC:SORT_ASC), 1);
		$totalsize = 0;
		foreach ($filearray as $key => $file) {
			$totalsize += $file['size'];
		}

		if (!empty($conf->notification->enabled)) {
			$langs->load("mails");
		}

		$head = member_prepare_head($object);

		print dol_get_fiche_head($head, 'document', $langs->trans("Member"), -1, 'user');

		$linkback = '<a href="'.DOL_URL_ROOT.'/adherents/list.php?restore_lastsearch_values=1">'.$langs->trans("BackToList").'</a>';

		dol_banner_tab($object, 'rowid', $linkback);

		print '<div class="fichecenter">';

		print '<div class="underbanner clearboth"></div>';
		print '<table class="border tableforfield centpercent">';

		$linkback = '<a href="'.DOL_URL_ROOT.'/adherents/list.php?restore_lastsearch_values=1">'.$langs->trans("BackToList").'</a>';

		// Login
		if (empty($conf->global->ADHERENT_LOGIN_NOT_REQUIRED)) {
			print '<tr><td class="titlefield">'.$langs->trans("Login").' / '.$langs->trans("Id").'</td><td class="valeur">'.$object->login.'&nbsp;</td></tr>';
		}

		// Type
		print '<tr><td>'.$langs->trans("Type").'</td><td class="valeur">'.$membert->getNomUrl(1)."</td></tr>\n";

		// Morphy
		print '<tr><td class="titlefield">'.$langs->trans("MemberNature").'</td><td class="valeur" >'.$object->getmorphylib().'</td>';
		/*print '<td rowspan="'.$rowspan.'" class="center" valign="middle" width="25%">';
		print $form->showphoto('memberphoto',$object);
		print '</td>';*/
		print '</tr>';

		// Company
		print '<tr><td>'.$langs->trans("Company").'</td><td class="valeur">'.$object->company.'</td></tr>';

		// Civility
		print '<tr><td>'.$langs->trans("UserTitle").'</td><td class="valeur">'.$object->getCivilityLabel().'&nbsp;</td>';
		print '</tr>';

		// Number of Attached Files
		print '<tr><td>'.$langs->trans("NbOfAttachedFiles").'</td><td colspan="3">'.count($filearray).'</td></tr>';

		//Total Size Of Attached Files
		print '<tr><td>'.$langs->trans("TotalSizeOfAttachedFiles").'</td><td colspan="3">'.dol_print_size($totalsize, 1, 1).'</td></tr>';

		print '</table>';

		print '</div>';

		print dol_get_fiche_end();

		$modulepart = 'member';
		$permissiontoadd = $user->rights->adherent->creer;
		$permtoedit = $user->rights->adherent->creer;
		$param = '&id='.$object->id;
		include DOL_DOCUMENT_ROOT.'/core/tpl/document_actions_post_headers.tpl.php';
		print "<br><br>";
	} else {
		dol_print_error($db);
	}
} else {
	$langs->load("errors");
	print $langs->trans("ErrorRecordNotFound");
}

// End of page
llxFooter();
$db->close();
