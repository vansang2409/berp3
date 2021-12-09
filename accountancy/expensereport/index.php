<?php
/* 	
 * 	
 * Copyright (C) 2013-2016	
 * Copyright (C) 2014		
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
 * \file		htdocs/accountancy/expensereport/index.php
 * \ingroup		Accountancy (Double entries)
 * \brief		Home expense report ventilation
 */

require '../../main.inc.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/date.lib.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/accounting.lib.php';
require_once DOL_DOCUMENT_ROOT.'/expensereport/class/expensereport.class.php';

// Load translation files required by the page
$langs->loadLangs(array("compta", "bills", "other", "accountancy"));

$month_start = ($conf->global->SOCIETE_FISCAL_MONTH_START ? ($conf->global->SOCIETE_FISCAL_MONTH_START) : 1);
if (GETPOST("year", 'int')) {
	$year_start = GETPOST("year", 'int');
} else {
	$year_start = dol_print_date(dol_now(), '%Y');
	if (dol_print_date(dol_now(), '%m') < $month_start) {
		$year_start--; // If current month is lower that starting fiscal month, we start last year
	}
}
$year_end = $year_start + 1;
$month_end = $month_start - 1;
if ($month_end < 1) {
	$month_end = 12;
	$year_end--;
}
$search_date_start = dol_mktime(0, 0, 0, $month_start, 1, $year_start);
$search_date_end = dol_get_last_day($year_end, $month_end);
$year_current = $year_start;

// Validate History
$action = GETPOST('action', 'aZ09');

// Security check
if (empty($conf->accounting->enabled)) {
	accessforbidden();
}
if ($user->socid > 0) {
	accessforbidden();
}
if (empty($user->rights->accounting->mouvements->lire)) {
	accessforbidden();
}


/*
 * Actions
 */

if (($action == 'clean' || $action == 'validatehistory') && $user->rights->accounting->bind->write) {
	// Clean database
	$db->begin();
	$sql1 = "UPDATE ".MAIN_DB_PREFIX."expensereport_det as erd";
	$sql1 .= " SET fk_code_ventilation = 0";
	$sql1 .= ' WHERE erd.fk_code_ventilation NOT IN';
	$sql1 .= '	(SELECT accnt.rowid ';
	$sql1 .= '	FROM '.MAIN_DB_PREFIX.'accounting_account as accnt';
	$sql1 .= '	INNER JOIN '.MAIN_DB_PREFIX.'accounting_system as syst';
	$sql1 .= '	ON accnt.fk_pcg_version = syst.pcg_version AND syst.rowid='.((int) $conf->global->CHARTOFACCOUNTS).' AND accnt.entity = '.((int) $conf->entity).')';
	$sql1 .= ' AND erd.fk_expensereport IN (SELECT rowid FROM '.MAIN_DB_PREFIX.'expensereport WHERE entity = '.((int) $conf->entity).')';
	$sql1 .= ' AND fk_code_ventilation <> 0';
	dol_syslog("htdocs/accountancy/customer/index.php fixaccountancycode", LOG_DEBUG);
	$resql1 = $db->query($sql1);
	if (!$resql1) {
		$error++;
		$db->rollback();
		setEventMessages($db->lasterror(), null, 'errors');
	} else {
		$db->commit();
	}
	// End clean database
}

if ($action == 'validatehistory') {
	$error = 0;
	$db->begin();

	// Now make the binding
	if ($db->type == 'pgsql') {
		$sql1 = "UPDATE ".MAIN_DB_PREFIX."expensereport_det";
		$sql1 .= " SET fk_code_ventilation = accnt.rowid";
		$sql1 .= " FROM ".MAIN_DB_PREFIX."c_type_fees as t, ".MAIN_DB_PREFIX."accounting_account as accnt , ".MAIN_DB_PREFIX."accounting_system as syst";
		$sql1 .= " WHERE ".MAIN_DB_PREFIX."expensereport_det.fk_c_type_fees = t.id  AND accnt.fk_pcg_version = syst.pcg_version AND syst.rowid = ".((int) $conf->global->CHARTOFACCOUNTS).' AND accnt.entity = '.((int) $conf->entity);
		$sql1 .= " AND accnt.active = 1 AND t.accountancy_code = accnt.account_number";
		$sql1 .= " AND ".MAIN_DB_PREFIX."expensereport_det.fk_code_ventilation = 0";
	} else {
		$sql1 = "UPDATE ".MAIN_DB_PREFIX."expensereport_det as erd, ".MAIN_DB_PREFIX."c_type_fees as t, ".MAIN_DB_PREFIX."accounting_account as accnt , ".MAIN_DB_PREFIX."accounting_system as syst";
		$sql1 .= " SET erd.fk_code_ventilation = accnt.rowid";
		$sql1 .= " WHERE erd.fk_c_type_fees = t.id AND accnt.fk_pcg_version = syst.pcg_version AND syst.rowid = ".((int) $conf->global->CHARTOFACCOUNTS).' AND accnt.entity = '.((int) $conf->entity);
		$sql1 .= " AND accnt.active = 1 AND t.accountancy_code=accnt.account_number";
		$sql1 .= " AND erd.fk_code_ventilation = 0";
	}

	dol_syslog('htdocs/accountancy/expensereport/index.php');

	$resql1 = $db->query($sql1);
	if (!$resql1) {
		$error++;
		$db->rollback();
		setEventMessages($db->lasterror(), null, 'errors');
	} else {
		$db->commit();
		setEventMessages($langs->trans('AutomaticBindingDone'), null, 'mesgs');
	}
}


/*
 * View
 */

llxHeader('', $langs->trans("ExpenseReportsVentilation"));

$textprevyear = '<a href="'.$_SERVER["PHP_SELF"].'?year='.($year_current - 1).'">'.img_previous().'</a>';
$textnextyear = '&nbsp;<a href="'.$_SERVER["PHP_SELF"].'?year='.($year_current + 1).'">'.img_next().'</a>';

print load_fiche_titre($langs->trans("ExpenseReportsVentilation")."&nbsp;".$textprevyear."&nbsp;".$langs->trans("Year")."&nbsp;".$year_start."&nbsp;".$textnextyear, '', 'title_accountancy');

print '<span class="opacitymedium">'.$langs->trans("DescVentilExpenseReport").'</span><br>';
print '<span class="opacitymedium hideonsmartphone">'.$langs->trans("DescVentilExpenseReportMore", $langs->transnoentitiesnoconv("ValidateHistory"), $langs->transnoentitiesnoconv("ToBind")).'<br>';
print '</span><br>';


$y = $year_current;

$buttonbind = '<a class="butAction" href="'.$_SERVER['PHP_SELF'].'?year='.$year_current.'&action=validatehistory">'.$langs->trans("ValidateHistory").'</a>';


print_barre_liste(img_picto('', 'unlink', 'class="paddingright fa-color-unset"').$langs->trans("OverviewOfAmountOfLinesNotBound"), '', '', '', '', '', '', -1, '', '', 0, $buttonbind, '', 0, 1, 1);
//print load_fiche_titre($langs->trans("OverviewOfAmountOfLinesNotBound"), $buttonbind, '');

print '<div class="div-table-responsive-no-min">';
print '<table class="noborder centpercent">';
print '<tr class="liste_titre"><td class="minwidth100">'.$langs->trans("Account").'</td>';
print '<td>'.$langs->trans("Label").'</td>';
for ($i = 1; $i <= 12; $i++) {
	$j = $i + ($conf->global->SOCIETE_FISCAL_MONTH_START ? $conf->global->SOCIETE_FISCAL_MONTH_START : 1) - 1;
	if ($j > 12) {
		$j -= 12;
	}
	print '<td width="60" class="right">'.$langs->trans('MonthShort'.str_pad($j, 2, '0', STR_PAD_LEFT)).'</td>';
}
print '<td width="60" class="right"><b>'.$langs->trans("Total").'</b></td></tr>';

$sql = "SELECT ".$db->ifsql('aa.account_number IS NULL', "'tobind'", 'aa.account_number')." AS codecomptable,";
$sql .= " ".$db->ifsql('aa.label IS NULL', "'tobind'", 'aa.label')." AS intitule,";
for ($i = 1; $i <= 12; $i++) {
	$j = $i + ($conf->global->SOCIETE_FISCAL_MONTH_START ? $conf->global->SOCIETE_FISCAL_MONTH_START : 1) - 1;
	if ($j > 12) {
		$j -= 12;
	}
	$sql .= "  SUM(".$db->ifsql("MONTH(er.date_debut)=".$j, "erd.total_ht", "0").") AS month".str_pad($j, 2, "0", STR_PAD_LEFT).",";
}
$sql .= " SUM(erd.total_ht) as total";
$sql .= " FROM ".MAIN_DB_PREFIX."expensereport_det as erd";
$sql .= " LEFT JOIN ".MAIN_DB_PREFIX."expensereport as er ON er.rowid = erd.fk_expensereport";
$sql .= " LEFT JOIN ".MAIN_DB_PREFIX."accounting_account as aa ON aa.rowid = erd.fk_code_ventilation";
$sql .= " WHERE er.date_debut >= '".$db->idate($search_date_start)."'";
$sql .= " AND er.date_debut <= '".$db->idate($search_date_end)."'";
// Define begin binding date
if (!empty($conf->global->ACCOUNTING_DATE_START_BINDING)) {
	$sql .= " AND er.date_debut >= '".$db->idate($conf->global->ACCOUNTING_DATE_START_BINDING)."'";
}
$sql .= " AND er.fk_statut IN (".ExpenseReport::STATUS_APPROVED.", ".ExpenseReport::STATUS_CLOSED.")";
$sql .= " AND er.entity IN (".getEntity('expensereport', 0).")"; // We don't share object for accountancy
$sql .= " AND aa.account_number IS NULL";
$sql .= " GROUP BY erd.fk_code_ventilation,aa.account_number,aa.label";

dol_syslog('/accountancy/expensereport/index.php:: sql='.$sql);
$resql = $db->query($sql);
if ($resql) {
	$num = $db->num_rows($resql);

	while ($row = $db->fetch_row($resql)) {
		print '<tr class="oddeven"><td>';
		if ($row[0] == 'tobind') {
			print '<span class="opacitymedium">'.$langs->trans("Unknown").'</span>';
		} else {
			print length_accountg($row[0]);
		}
		print '</td>';
		print '<td>';
		if ($row[0] == 'tobind') {
			print $langs->trans("UseMenuToSetBindindManualy", DOL_URL_ROOT.'/accountancy/expensereport/list.php?search_year='.$y, $langs->transnoentitiesnoconv("ToBind"));
		} else {
			print $row[1];
		}
		print '</td>';
		for ($i = 2; $i <= 12; $i++) {
			print '<td class="right nowraponall amount">'.price($row[$i]).'</td>';
		}
		print '<td class="right nowraponall amount">'.price($row[13]).'</td>';
		print '<td class="right nowraponall amount"><b>'.price($row[14]).'</b></td>';
		print '</tr>';
	}
	$db->free($resql);
} else {
	print $db->lasterror(); // Show last sql error
}
print "</table>\n";
print '</div>';


print '<br>';


print_barre_liste(img_picto('', 'link', 'class="paddingright fa-color-unset"').$langs->trans("OverviewOfAmountOfLinesBound"), '', '', '', '', '', '', -1, '', '', 0, '', '', 0, 1, 1);
//print load_fiche_titre($langs->trans("OverviewOfAmountOfLinesBound"), '', '');


print '<div class="div-table-responsive-no-min">';
print '<table class="noborder centpercent">';
print '<tr class="liste_titre"><td class="minwidth100">'.$langs->trans("Account").'</td>';
print '<td>'.$langs->trans("Label").'</td>';
for ($i = 1; $i <= 12; $i++) {
	$j = $i + ($conf->global->SOCIETE_FISCAL_MONTH_START ? $conf->global->SOCIETE_FISCAL_MONTH_START : 1) - 1;
	if ($j > 12) {
		$j -= 12;
	}
	print '<td width="60" class="right">'.$langs->trans('MonthShort'.str_pad($j, 2, '0', STR_PAD_LEFT)).'</td>';
}
print '<td width="60" class="right"><b>'.$langs->trans("Total").'</b></td></tr>';

$sql = "SELECT ".$db->ifsql('aa.account_number IS NULL', "'tobind'", 'aa.account_number')." AS codecomptable,";
$sql .= "  ".$db->ifsql('aa.label IS NULL', "'tobind'", 'aa.label')." AS intitule,";
for ($i = 1; $i <= 12; $i++) {
	$j = $i + ($conf->global->SOCIETE_FISCAL_MONTH_START ? $conf->global->SOCIETE_FISCAL_MONTH_START : 1) - 1;
	if ($j > 12) {
		$j -= 12;
	}
	$sql .= " SUM(".$db->ifsql("MONTH(er.date_debut)=".$j, "erd.total_ht", "0").") AS month".str_pad($j, 2, "0", STR_PAD_LEFT).",";
}
$sql .= " ROUND(SUM(erd.total_ht),2) as total";
$sql .= " FROM ".MAIN_DB_PREFIX."expensereport_det as erd";
$sql .= " LEFT JOIN ".MAIN_DB_PREFIX."expensereport as er ON er.rowid = erd.fk_expensereport";
$sql .= " LEFT JOIN ".MAIN_DB_PREFIX."accounting_account as aa ON aa.rowid = erd.fk_code_ventilation";
$sql .= " WHERE er.date_debut >= '".$db->idate($search_date_start)."'";
$sql .= " AND er.date_debut <= '".$db->idate($search_date_end)."'";
// Define begin binding date
if (!empty($conf->global->ACCOUNTING_DATE_START_BINDING)) {
	$sql .= " AND er.date_debut >= '".$db->idate($conf->global->ACCOUNTING_DATE_START_BINDING)."'";
}
$sql .= " AND er.fk_statut IN (".ExpenseReport::STATUS_APPROVED.", ".ExpenseReport::STATUS_CLOSED.")";
$sql .= " AND er.entity IN (".getEntity('expensereport', 0).")"; // We don't share object for accountancy
$sql .= " AND aa.account_number IS NOT NULL";
$sql .= " GROUP BY erd.fk_code_ventilation,aa.account_number,aa.label";

dol_syslog('htdocs/accountancy/expensereport/index.php');
$resql = $db->query($sql);
if ($resql) {
	$num = $db->num_rows($resql);

	while ($row = $db->fetch_row($resql)) {
		print '<tr class="oddeven"><td>';
		if ($row[0] == 'tobind') {
			print '<span class="opacitymedium">'.$langs->trans("Unknown").'</span>';
		} else {
			print length_accountg($row[0]);
		}
		print '</td>';

		print '<td>';
		if ($row[0] == 'tobind') {
			print $langs->trans("UseMenuToSetBindindManualy", DOL_URL_ROOT.'/accountancy/expensereport/list.php?search_year='.$y, $langs->transnoentitiesnoconv("ToBind"));
		} else {
			print $row[1];
		}
		print '</td>';
		for ($i = 2; $i <= 12; $i++) {
			print '<td class="right nowraponall amount">'.price($row[$i]).'</td>';
		}
		print '<td class="right nowraponall amount">'.price($row[13]).'</td>';
		print '<td class="right nowraponall amount"><b>'.price($row[14]).'</b></td>';
		print '</tr>';
	}
	$db->free($resql);
} else {
	print $db->lasterror(); // Show last sql error
}
print "</table>\n";
print '</div>';



if ($conf->global->MAIN_FEATURES_LEVEL > 0) { // This part of code looks strange. Why showing a report where results depends on next step (so not yet available) ?
	print '<br>';
	print '<br>';

	print_barre_liste($langs->trans("OtherInfo"), '', '', '', '', '', '', -1, '', '', 0, '', '', 0, 1, 1);
	//print load_fiche_titre($langs->trans("OtherInfo"), '', '');

	print '<div class="div-table-responsive-no-min">';
	print '<table class="noborder centpercent">';
	print '<tr class="liste_titre"><td class="left">'.$langs->trans("Total").'</td>';
	for ($i = 1; $i <= 12; $i++) {
		$j = $i + ($conf->global->SOCIETE_FISCAL_MONTH_START ? $conf->global->SOCIETE_FISCAL_MONTH_START : 1) - 1;
		if ($j > 12) {
			$j -= 12;
		}
		print '<td width="60" class="right">'.$langs->trans('MonthShort'.str_pad($j, 2, '0', STR_PAD_LEFT)).'</td>';
	}
	print '<td width="60" class="right"><b>'.$langs->trans("Total").'</b></td></tr>';

	$sql = "SELECT '".$db->escape($langs->trans("TotalExpenseReport"))."' AS label,";
	for ($i = 1; $i <= 12; $i++) {
		$j = $i + ($conf->global->SOCIETE_FISCAL_MONTH_START ? $conf->global->SOCIETE_FISCAL_MONTH_START : 1) - 1;
		if ($j > 12) {
			$j -= 12;
		}
		$sql .= " SUM(".$db->ifsql("MONTH(er.date_create)=".$j, "erd.total_ht", "0").") AS month".str_pad($j, 2, "0", STR_PAD_LEFT).",";
	}
	$sql .= " SUM(erd.total_ht) as total";
	$sql .= " FROM ".MAIN_DB_PREFIX."expensereport_det as erd";
	$sql .= " LEFT JOIN ".MAIN_DB_PREFIX."expensereport as er ON er.rowid = erd.fk_expensereport";
	$sql .= " WHERE er.date_debut >= '".$db->idate($search_date_start)."'";
	$sql .= " AND er.date_debut <= '".$db->idate($search_date_end)."'";
	// Define begin binding date
	if (!empty($conf->global->ACCOUNTING_DATE_START_BINDING)) {
		$sql .= " AND er.date_debut >= '".$db->idate($conf->global->ACCOUNTING_DATE_START_BINDING)."'";
	}
	$sql .= " AND er.fk_statut IN (".ExpenseReport::STATUS_APPROVED.", ".ExpenseReport::STATUS_CLOSED.")";
	$sql .= " AND er.entity IN (".getEntity('expensereport', 0).")"; // We don't share object for accountancy

	dol_syslog('htdocs/accountancy/expensereport/index.php');
	$resql = $db->query($sql);
	if ($resql) {
		$num = $db->num_rows($resql);

		while ($row = $db->fetch_row($resql)) {
			print '<tr><td>'.$row[0].'</td>';
			for ($i = 1; $i <= 12; $i++) {
				print '<td class="right nowraponall amount">'.price($row[$i]).'</td>';
			}
			print '<td class="right nowraponall amount"><b>'.price($row[13]).'</b></td>';
			print '</tr>';
		}

		$db->free($resql);
	} else {
		print $db->lasterror(); // Show last sql error
	}
	print "</table>\n";
	print '</div>';
}

// End of page
llxFooter();
$db->close();
