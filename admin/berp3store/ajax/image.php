<?php
/* Copyright (C) 2017		 Oscss-Shop              .
 * Copyright (C) 2008-2011   
 * Copyright (C) 2020       
 *
 * This program is free software; you can redistribute it and/or modifyion 2.0 (the "License");
 * it under the terms of the GNU General Public License as published bypliance with the License.
 * the Free Software Foundation; either version 3 of the License, or
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 * or see https://www.gnu.org/
 */

if (!defined('REQUIRE_JQUERY_BLOCKUI')) {
	define('REQUIRE_JQUERY_BLOCKUI', 1);
}
if (!defined('NOTOKENRENEWAL')) {
	define('NOTOKENRENEWAL', 1);
}


/**
 *      \file       htdocs/admin/berp3store/ajax/image.php
 *      \ingroup    admin
 *      \brief      Page des informations berp3store
 */
require "../../../main.inc.php";

// CORE

global $lang, $user, $conf;


require_once DOL_DOCUMENT_ROOT.'/admin/berp3store/class/berp3store.class.php';
$berp3store = new Berp3store();

$id_product = GETPOST('id_product', 'int');
$id_image   = GETPOST('id_image', 'int');
// quality : image resize with this in the URL : "cart_default", "home_default", "large_default", "medium_default", "small_default", "thickbox_default"
$quality    = GETPOST('quality', 'alpha');

try {
	$url = $conf->global->MAIN_MODULE_BERPSTORE_API_SRV.'/api/images/products/'.$id_product.'/'.$id_image.'/'.$quality;
	$api = new PrestaShopWebservice(
		$conf->global->MAIN_MODULE_BERPSTORE_API_SRV,
		$conf->global->MAIN_MODULE_BERPSTORE_API_KEY,
		$berp3store->debug_api
	);
	//echo $url;
	$request = $api->executeRequest($url, array(CURLOPT_CUSTOMREQUEST => 'GET'));
	header('Content-type:image');
	print $request['response'];
} catch (PrestaShopWebserviceException $e) {
	// Here we are dealing with errors
	$trace = $e->getTrace();
	if ($trace[0]['args'][0] == 404) {
		die('Bad ID');
	} elseif ($trace[0]['args'][0] == 401) {
		die('Bad auth key');
	} else {
		die('Can not access to '.$conf->global->MAIN_MODULE_BERPSTORE_API_SRV);
	}
}
