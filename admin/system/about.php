<?php
/* Copyright (C) 2003-2004 
 * Copyright (C) 2003          
 * Copyright (C) 2004-2013 
 * Copyright (C) 2007      Franky Van Liedekerke <franky.van.liedekerke@telenet.be>
 * Copyright (C) 2005-2007 
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
 *       \file       htdocs/admin/system/about.php
 *       \brief      About Berp3 File page
 */

require '../../main.inc.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/admin.lib.php';
require_once DOL_DOCUMENT_ROOT.'/core/lib/files.lib.php';

// Load translation files required by the page
$langs->loadLangs(array("help", "members", "other", "admin"));

$action = GETPOST('action', 'aZ09');

if (!$user->admin) {
	accessforbidden();
}

$sfurl = '';
$version = '0.0';


/*
 *	Actions
 */

// None


/*
 * View
 */

llxHeader();


print load_fiche_titre($langs->trans("ExternalResources"), '', 'title_setup');

print '<div style="padding-left: 30px;">'.img_picto_common('', 'berp3_box.png', 'height="120"').'</div>';



print '<div class="fichecenter"><div class="fichehalfleft">';

print $langs->trans("Berp3License").' : ';
print '<ul><li>';
print '<a href="https://www.gnu.org/copyleft/gpl.html">GNU-GPL v3+</a></li>';
print '</li></ul>';

//print "<br>\n";

print $langs->trans("Developpers").':';
print '<ul>';
print '<li>'.$langs->trans("SourcesRepository").': <a href="https://www.github.com/Berp3/berp3" target="_blank" rel="external">https://www.github.com/Berp3/berp3</a></li>';
print '<li>'.$langs->trans("SeeWikiForAllTeam").': <a href="https://bonaerp.com/index.php/Berp3_Project" target="_blank" rel="external">https://bonaerp.com/index.php/Berp3_Project</a></li>';
print '</ul>';

//print "<br>\n";

print $langs->trans("OtherInformations").':';

print '<ul>';
print '<li>';
print '<a target="_blank" href="https://www.berp3.org/" rel="external">'.$langs->trans("OfficialWebSite").'</a>';
print '</li>';
// Show local site
/*
if (preg_match('/^fr_/i', $langs->getDefaultLang()))
{
	print '<li>';
	print '<a target="_blank" href="https://www.berp3.fr/" rel="external">'.$langs->trans("OfficialWebSiteLocal", $langs->transnoentitiesnoconv("France")).'</a>';
	print '</li>';
}
if (preg_match('/^el_/i', $langs->getDefaultLang()))
{
	print '<li>';
	print '<a target="_blank" href="https://www.berp3.gr/" rel="external">'.$langs->trans("OfficialWebSiteLocal", $langs->transnoentitiesnoconv("Greece")).'</a>';
	print '</li>';
}
if (preg_match('/^es_/i', $langs->getDefaultLang()))
{
	print '<li>';
	print '<a target="_blank" href="https://www.berp3.es/" rel="external">'.$langs->trans("OfficialWebSiteLocal", $langs->transnoentitiesnoconv("Spain")).'</a>';
	print '</li>';
}
if (preg_match('/^it_/i', $langs->getDefaultLang()))
{
	print '<li>';
	print '<a target="_blank" href="https://www.berp3.it/" rel="external">'.$langs->trans("OfficialWebSiteLocal", $langs->transnoentitiesnoconv("Italy")).'</a>';
	print '</li>';
}
if (preg_match('/^de_/i', $langs->getDefaultLang()))
{
	print '<li>';
	print '<a target="_blank" href="https://www.berp3.de/" rel="external">'.$langs->trans("OfficialWebSiteLocal", $langs->transnoentitiesnoconv("Germany")).'</a>';
	print '</li>';
}*/
// print '<li>';
// print '<a target="_blank" href="https://bonaerp.com/" rel="external">'.$langs->trans("OfficialWiki").'</a>';
// print '</li>';
// print '</ul>';

// print $langs->trans("Demo").':';
// print '<ul>';
// print '<li>';
// print '<a target="_blank" href="https://www.berp3.org/onlinedemo/" rel="external">'.$langs->trans("OfficialDemo").'</a>';
// print '</li>';
// print '</ul>';

// print $langs->trans("ModulesMarketPlaces").':';
// print '<ul>';
// print '<li>';
// print '<a target="_blank" href="https://www.berp3store.com" rel="external">'.$langs->trans("OfficialMarketPlace").'</a>';
// print '</li>';
// print '</ul>';


print '</div><div class="fichehalfright">';


print $langs->trans("HelpCenter").':';
print '<ul>';
print '<li>';
//print $langs->trans("SeeWikiPage",'http://bonaerp.com/index.php/List_of_OpenSource_Software_companies_and_freelancers');
print '<a target="_blank" href="'.DOL_URL_ROOT.'/support/index.php" data-ajax="false">'.$langs->trans("HelpCenter").'</a>';
print '</li>';
print '</ul>';


print $langs->trans("Foundation").':';

print '<ul>';
$url = 'https://bonaerp.com/index.php/Subscribe';
if (preg_match('/^fr_/i', $langs->getDefaultLang())) {
	$url = 'https://bonaerp.com/index.php/Adh%C3%A9rer';
}
if (preg_match('/^es_/i', $langs->getDefaultLang())) {
	$url = 'https://bonaerp.com/index.php/Subscribirse';
}
print '<li><a href="'.$url.'" target="_blank" rel="external">'.$langs->trans("SubscribeToFoundation").'</a></li>';
print '</ul>';

print $langs->trans("SocialNetworks").':';

print '<ul>';

print '<li><a href="https://facebook.com/berp3" target="_blank" rel="external">FaceBook</a></li>';
print '<li><a href="https://twitter.com/berp3" target="_blank" rel="external">Twitter</a></li>';

print '</ul>';


print $langs->trans("OtherResources").':';
print '<ul>';

$url = 'https://saas.berp3.org'; $title = $langs->trans("OfficialWebHostingService");
if (preg_match('/^fr_/i', $langs->getDefaultLang())) {
	$url = 'https://bonaerp.com/index.php/Solutions_Cloud_pour_Berp3_ERP_CRM';
}
if (preg_match('/^es_/i', $langs->getDefaultLang())) {
	$url = 'https://bonaerp.com/index.php/Soluciones_en_la_Nube';
}
print '<li>';
print '<a target="_blank" href="'.$url.'" rel="external">'.$title.'</a>';
print '</li>';
$url = 'https://partners.berp3.org'; $title = $langs->trans("ReferencedPreferredPartners");
print '<li>';
print '<a target="_blank" href="'.$url.'" rel="external">'.$title.'</a>';
print '</li>';

print '</ul>';

print '</div>';
print '</div>';
print '<div class="clearboth"></div>';


$showpromotemessage = 1;
if ($showpromotemessage) {
	$tmp = versionberp3array();
	if (is_numeric($tmp[2])) {    // Not alpha, beta or rc
		print '<br>';
		print '<br>';

		if ((empty($tmp[2]) && (strpos($tmp[1], '0') === 0)) || (strpos($tmp[2], '0') === 0)) {
			print $langs->trans("TitleExampleForMajorRelease").':<br>';
			print '<textarea style="width:80%; min-height: 60px">';
			print $langs->trans("ExampleOfNewsMessageForMajorRelease", DOL_VERSION, DOL_VERSION);
			print '</textarea>';
		} else {
			print $langs->trans("TitleExampleForMaintenanceRelease").':<br>';
			print '<textarea style="width:80%; min-height: 60px">';
			print $langs->trans("ExampleOfNewsMessageForMaintenanceRelease", DOL_VERSION, DOL_VERSION);
			print '</textarea>';
		}
	}
}

// End of page
llxFooter();
$db->close();
