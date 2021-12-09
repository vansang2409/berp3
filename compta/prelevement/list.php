<?php
/* Copyright (C) 2005      
 * Copyright (C) 2005-2016 
 * Copyright (C) 2005-2009 
 * Copyright (C) 2010-2018 
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
 *      \file       htdocs/compta/prelevement/list.php
 *      \ingroup    prelevement
 *      \brief      Page list of direct debit orders or credit transfers orders
 */

require '../../main.inc.php';
require_once DOL_DOCUMENT_ROOT.'/compta/prelevement/class/bonprelevement.class.php';
require_once DOL_DOCUMENT_ROOT.'/compta/prelevement/class/ligneprelevement.class.php';
require_once DOL_DOCUMENT_ROOT.'/compta/bank/class/account.class.php';

// Load translation files required by the page
$langs->loadLangs(array('banks', 'withdrawals', 'companies', 'categories'));

$action     = GETPOST('action', 'aZ09') ?GETPOST('action', 'aZ09') : 'view'; // The action 'add', 'create', 'edit', 'update', 'view', ...
$massaction = GETPOST('massaction', 'alpha'); // The bulk action (combo box choice into lists)
$show_files = GETPOST('show_files', 'int'); // Show files area generated by bulk actions ?
$confirm    = GETPOST('confirm', 'alpha'); // Result of a confirmation
$cancel     = GETPOST('cancel', 'alpha'); // We click on a Cancel button
$toselect   = GETPOST('toselect', 'array'); // Array of ids of elements selected into a list
$contextpage = GETPOST('contextpage', 'aZ') ? GETPOST('contextpage', 'aZ') : 'directdebitcredittransferlinelist'; // To manage different context of search
$backtopage = GETPOST('backtopage', 'alpha'); // Go back to a dedicated page
$optioncss  = GETPOST('optioncss', 'aZ'); // Option for the css output (always '' except when 'print')

$type = GETPOST('type', 'aZ09');

$limit = GETPOST('limit', 'int') ?GETPOST('limit', 'int') : $conf->liste_limit;
$sortfield = GETPOST('sortfield', 'aZ09comma');
$sortorder = GETPOST('sortorder', 'aZ09comma');
$page = GETPOSTISSET('pageplusone') ? (GETPOST('pageplusone') - 1) : GETPOST("page", 'int');
if (empty($page) || $page == -1) {
	$page = 0;
}     // If $page is not defined, or '' or -1
$offset = $limit * $page;
$pageprev = $page - 1;
$pagenext = $page + 1;
if (!$sortorder) {
	$sortorder = "DESC";
}
if (!$sortfield) {
	$sortfield = "p.datec";
}

$search_line = GETPOST('search_line', 'alpha');
$search_bon = GETPOST('search_bon', 'alpha');
$search_code = GETPOST('search_code', 'alpha');
$search_company = GETPOST('search_company', 'alpha');
$statut = GETPOST('statut', 'int');

$bon = new BonPrelevement($db);
$line = new LignePrelevement($db);
$company = new Societe($db);

$hookmanager->initHooks(array('withdrawalsreceiptslineslist'));

// Security check
$socid = GETPOST('socid', 'int');
if ($user->socid) {
	$socid = $user->socid;
}
if ($type == 'bank-transfer') {
	$result = restrictedArea($user, 'paymentbybanktransfer', '', '', '');
} else {
	$result = restrictedArea($user, 'prelevement', '', '', 'bons');
}


/*
 * Actions
 */

if (GETPOST('button_removefilter_x', 'alpha') || GETPOST('button_removefilter.x', 'alpha') || GETPOST('button_removefilter', 'alpha')) { // All tests are required to be compatible with all browsers
	$search_line = "";
	$search_bon = "";
	$search_code = "";
	$search_company = "";
	$statut = "";
}


/*
 *  View
 */

$form = new Form($db);

llxHeader('', $langs->trans("WithdrawalsLines"));

$sql = "SELECT p.rowid, p.ref, p.statut as status, p.datec";
$sql .= " , f.rowid as facid, f.ref as invoiceref, f.total_ttc";
$sql .= " , s.rowid as socid, s.nom as name, s.code_client, s.email";
$sql .= " , pl.amount, pl.statut as statut_ligne, pl.rowid as rowid_ligne";
$sql .= " FROM ".MAIN_DB_PREFIX."prelevement_bons as p";
$sql .= " , ".MAIN_DB_PREFIX."prelevement_lignes as pl";
$sql .= " , ".MAIN_DB_PREFIX."prelevement_facture as pf";
if ($type == 'bank-transfer') {
	$sql .= " , ".MAIN_DB_PREFIX."facture_fourn as f";
} else {
	$sql .= " , ".MAIN_DB_PREFIX."facture as f";
}
$sql .= " , ".MAIN_DB_PREFIX."societe as s";
$sql .= " WHERE pl.fk_prelevement_bons = p.rowid";
$sql .= " AND pf.fk_prelevement_lignes = pl.rowid";
if ($type == 'bank-transfer') {
	$sql .= " AND pf.fk_facture_fourn = f.rowid";
} else {
	$sql .= " AND pf.fk_facture = f.rowid";
}
$sql .= " AND f.fk_soc = s.rowid";
$sql .= " AND f.entity IN (".getEntity('invoice').")";
if ($socid) {
	$sql .= " AND s.rowid = ".((int) $socid);
}
if ($search_line) {
	$sql .= " AND pl.rowid = '".$db->escape($search_line)."'";
}
if ($search_bon) {
	$sql .= natural_search("p.ref", $search_bon);
}
if ($type == 'bank-transfer') {
	if ($search_code) {
		$sql .= natural_search("s.code_fourn", $search_code);
	}
} else {
	if ($search_code) {
		$sql .= natural_search("s.code_client", $search_code);
	}
}
if ($search_company) {
	$sql .= natural_search("s.nom", $search_company);
}

$sql .= $db->order($sortfield, $sortorder);

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

$result = $db->query($sql);
if ($result) {
	$num = $db->num_rows($result);
	$i = 0;

	$param = "&amp;statut=".urlencode($statut);
	$param .= "&amp;search_bon=".urlencode($search_bon);
	if ($limit > 0 && $limit != $conf->liste_limit) {
		$param .= '&limit='.urlencode($limit);
	}

	print"\n<!-- debut table -->\n";
	print '<form method="POST" id="searchFormList" action="'.$_SERVER["PHP_SELF"].'">'."\n";
	if ($optioncss != '') {
		print '<input type="hidden" name="optioncss" value="'.$optioncss.'">';
	}
	print '<input type="hidden" name="token" value="'.newToken().'">';
	print '<input type="hidden" name="formfilteraction" id="formfilteraction" value="list">';
	print '<input type="hidden" name="action" value="list">';
	print '<input type="hidden" name="sortfield" value="'.$sortfield.'">';
	print '<input type="hidden" name="sortorder" value="'.$sortorder.'">';
	print '<input type="hidden" name="contextpage" value="'.$contextpage.'">';

	$title = $langs->trans("WithdrawalsLines");
	if ($type == 'bank-transfer') {
		$title = $langs->trans("CreditTransferLines");
	}
	print_barre_liste($title, $page, $_SERVER["PHP_SELF"], $param, $sortfield, $sortorder, '', $num, $nbtotalofrecords, 'generic', 0, '', '', $limit, 0, 0, 1);

	$moreforfilter = '';

	print '<div class="div-table-responsive">';
	print '<table class="tagtable liste'.($moreforfilter ? " listwithfilterbefore" : "").'">'."\n";

	print '<tr class="liste_titre">';
	print '<td class="liste_titre"><input type="text" class="flat" name="search_line" value="'.dol_escape_htmltag($search_line).'" size="6"></td>';
	print '<td class="liste_titre"><input type="text" class="flat" name="search_bon" value="'.dol_escape_htmltag($search_bon).'" size="6"></td>';
	print '<td class="liste_titre">&nbsp;</td>';
	print '<td class="liste_titre"><input type="text" class="flat" name="search_company" value="'.dol_escape_htmltag($search_company).'" size="6"></td>';
	print '<td class="liste_titre" align="center"><input type="text" class="flat" name="search_code" value="'.dol_escape_htmltag($search_code).'" size="6"></td>';
	print '<td class="liste_titre">&nbsp;</td>';
	print '<td class="liste_titre">&nbsp;</td>';
	print '<td class="liste_titre maxwidthsearch">';
	$searchpicto = $form->showFilterButtons();
	print $searchpicto;
	print '</td>';
	print '</tr>';

	$columntitle = "WithdrawalsReceipts";
	if ($type == 'bank-transfer') {
		$columntitle = "BankTransferReceipts";
	}

	print '<tr class="liste_titre">';
	print_liste_field_titre($columntitle, $_SERVER["PHP_SELF"], "p.ref", '', $param, '', $sortfield, $sortorder);
	print_liste_field_titre("Line", $_SERVER["PHP_SELF"], '', '', $param, '', $sortfield, $sortorder);
	print_liste_field_titre("Bill", $_SERVER["PHP_SELF"], "f.ref", '', $param, '', $sortfield, $sortorder);
	print_liste_field_titre("Company", $_SERVER["PHP_SELF"], "s.nom", '', $param, '', $sortfield, $sortorder);
	print_liste_field_titre("CustomerCode", $_SERVER["PHP_SELF"], "s.code_client", '', $param, '', $sortfield, $sortorder, 'center ');
	print_liste_field_titre("Date", $_SERVER["PHP_SELF"], "p.datec", "", $param, '', $sortfield, $sortorder, 'center ');
	print_liste_field_titre("Amount", $_SERVER["PHP_SELF"], "pl.amount", "", $param, '', $sortfield, $sortorder, 'right ');
	print_liste_field_titre('');
	print "</tr>\n";

	if ($num) {
		while ($i < min($num, $limit)) {
			$obj = $db->fetch_object($result);

			$bon->id = $obj->rowid;
			$bon->ref = $obj->ref;
			$bon->statut = $obj->status;

			$company->id = $obj->socid;
			$company->name = $obj->name;
			$company->email = $obj->email;
			$company->code_client = $obj->code_client;

			print '<tr class="oddeven">';

			print '<td>';
			print $bon->getNomUrl(1);
			print "</td>\n";

			print '<td>';
			print $line->LibStatut($obj->statut_ligne, 2);
			print "&nbsp;";
			print '<a href="'.DOL_URL_ROOT.'/compta/prelevement/line.php?id='.$obj->rowid_ligne.'">';
			print substr('000000'.$obj->rowid_ligne, -6);
			print '</a></td>';

			print '<td>';
			print '<a href="'.DOL_URL_ROOT.'/compta/facture/card.php?facid='.$obj->facid.'">';
			print img_object($langs->trans("ShowBill"), "bill");
			print '&nbsp;<a href="'.DOL_URL_ROOT.'/compta/facture/card.php?facid='.$obj->facid.'">'.$obj->invoiceref."</a></td>\n";
			print '</a>';
			print '</td>';

			print '<td>';
			print $company->getNomUrl(1);
			print "</td>\n";

			print '<td align="center"><a href="card.php?id='.$obj->rowid.'">'.$obj->code_client."</a></td>\n";

			print '<td class="center">'.dol_print_date($db->jdate($obj->datec), 'day')."</td>\n";

			print '<td class="right"><span class="amount">'.price($obj->amount)."</span></td>\n";

			print '<td>&nbsp;</td>';

			print "</tr>\n";
			$i++;
		}
	} else {
		print '<tr><td colspan="8"><span class="opacitymedium">'.$langs->trans("None").'</span></td></tr>';
	}
	print "</table>";
	print '</div>';

	print '</form>';

	$db->free($result);
} else {
	dol_print_error($db);
}

// End of page
llxFooter();
$db->close();
