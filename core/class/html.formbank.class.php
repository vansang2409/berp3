<?php
/* Copyright (C) 2012			
 * Copyright (C) 2015		
 * Copyright (C) 2016              
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
 *	\file       htdocs/core/class/html.formbank.class.php
 *  \ingroup    core
 *	\brief      File of class with all html predefined components
 */

include_once DOL_DOCUMENT_ROOT.'/compta/bank/class/account.class.php';


/**
 *	Class to manage generation of HTML components for bank module
 */
class FormBank
{
	/**
	 * @var Berp3DB Database handler.
	 */
	public $db;

	/**
	 * @var string Error code (or message)
	 */
	public $error = '';


	/**
	 * Constructor
	 *
	 * @param		Berp3DB		$db      Database handler
	 */
	public function __construct($db)
	{
		$this->db = $db;
	}

	/**
	 *  Retourne la liste des types de comptes financiers
	 *
	 *  @param	integer	$selected        Type pre-selectionne
	 *  @param  string	$htmlname        Nom champ formulaire
	 *  @return	void
	 */
	public function selectTypeOfBankAccount($selected = Account::TYPE_CURRENT, $htmlname = 'type')
	{
		$account = new Account($this->db);

		print Form::selectarray($htmlname, $account->type_lib, $selected);
	}

	/**
	 * Returns the name of the Iban label. India uses 'IFSC' and the rest of the world 'IBAN' name.
	 *
	 * @param Account $account Account object
	 * @return string
	 */
	public static function getIBANLabel(Account $account)
	{
		if ($account->getCountryCode() == 'IN') {
			return 'IFSC';
		}

		return 'IBANNumber';
	}
}
