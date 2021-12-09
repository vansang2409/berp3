<?php
/* Copyright (C) 2011 
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
 * or see https://www.gnu.org/
 */

/**
 *  \file		htdocs/core/lib/ws.lib.php
 *  \ingroup	webservices
 *  \brief		Set of function for manipulating web services
 */


/**
 *  Check authentication array and set error, errorcode, errorlabel
 *
 *  @param	array	$authentication     Array with authentication informations ('login'=>,'password'=>,'entity'=>,'berp3key'=>)
 *  @param 	int		$error				Number of errors
 *  @param  string	$errorcode			Error string code
 *  @param  string	$errorlabel			Error string label
 *  @return User						Return user object identified by login/pass/entity into authentication array
 */
function check_authentication($authentication, &$error, &$errorcode, &$errorlabel)
{
	global $db, $conf, $langs;
	global $berp3_main_authentication, $berp3_auto_user;

	$fuser = new User($db);

	if (!$error && ($authentication['berp3key'] != $conf->global->WEBSERVICES_KEY)) {
		$error++;
		$errorcode = 'BAD_VALUE_FOR_SECURITY_KEY';
		$errorlabel = 'Value provided into berp3key entry field does not match security key defined in Webservice module setup';
	}

	if (!$error && !empty($authentication['entity']) && !is_numeric($authentication['entity'])) {
		$error++;
		$errorcode = 'BAD_PARAMETERS';
		$errorlabel = "The entity parameter must be empty (or filled with numeric id of instance if multicompany module is used).";
	}

	if (!$error) {
		$result = $fuser->fetch('', $authentication['login'], '', 0);
		if ($result < 0) {
			$error++;
			$errorcode = 'ERROR_FETCH_USER';
			$errorlabel = 'A technical error occurred during fetch of user';
		} elseif ($result == 0) {
			$error++;
			$errorcode = 'BAD_CREDENTIALS';
			$errorlabel = 'Bad value for login or password';
		}

		if (!$error && $fuser->statut == 0) {
			$error++;
			$errorcode = 'ERROR_USER_DISABLED';
			$errorlabel = 'This user has been locked or disabled';
		}

		// Validation of login
		if (!$error) {
			$fuser->getrights(); // Load permission of user

			// Authentication mode
			if (empty($berp3_main_authentication)) {
				$berp3_main_authentication = 'http,berp3';
			}
			// Authentication mode: forceuser
			if ($berp3_main_authentication == 'forceuser' && empty($berp3_auto_user)) {
				$berp3_auto_user = 'auto';
			}
			// Set authmode
			$authmode = explode(',', $berp3_main_authentication);

			include_once DOL_DOCUMENT_ROOT.'/core/lib/security2.lib.php';
			$login = checkLoginPassEntity($authentication['login'], $authentication['password'], $authentication['entity'], $authmode, 'ws');
			if (empty($login)) {
				$error++;
				$errorcode = 'BAD_CREDENTIALS';
				$errorlabel = 'Bad value for login or password';
			}
		}
	}

	return $fuser;
}
