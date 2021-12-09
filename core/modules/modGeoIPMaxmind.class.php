<?php
/* Copyright (C) 2009 
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
 *  \defgroup   geoip      Module geoipmaxmind
 *  \brief      Module to make geoip conversions
 *	\file       htdocs/core/modules/modGeoIPMaxmind.class.php
 *	\ingroup    geoip
 *	\brief      Description and activation file for the module geoipmaxmind
 */

include_once DOL_DOCUMENT_ROOT.'/core/modules/Berp3Modules.class.php';


/**
 *	Class to describe and enable module Import
 */
class modGeoIPMaxmind extends Berp3Modules
{

	/**
	 *   Constructor. Define names, constants, directories, boxes, permissions
	 *
	 *   @param      Berp3DB		$db      Database handler
	 */
	public function __construct($db)
	{
		$this->db = $db;
		$this->numero = 2900;

		// Family can be 'crm','financial','hr','projects','products','ecm','technic','other'
		// It is used to group modules in module setup page
		$this->family = "interface";
		// Module label (no space allowed), used if translation string 'ModuleXXXName' not found (where XXX is value of numeric property 'numero' of module)
		$this->name = preg_replace('/^mod/i', '', get_class($this));
		// Module description, used if translation string 'ModuleXXXDesc' not found (where XXX is value of numeric property 'numero' of module)
		$this->description = "GeoIP Maxmind conversions capabilities";
		// Possible values for version are: 'development', 'experimental', 'berp3' or version
		$this->version = 'berp3';
		// Key used in llx_const table to save module status enabled/disabled (where MYMODULE is value of property name of module in uppercase)
		$this->const_name = 'MAIN_MODULE_'.strtoupper($this->name);
		// Name of image file used for this module.
		// If file is in theme/yourtheme/img directory under name object_pictovalue.png, use this->picto='pictovalue'
		// If file is in module/images directory, use this->picto=DOL_URL_ROOT.'/module/images/file.png'
		$this->picto = 'geoip';

		// Data directories to create when module is enabled
		$this->dirs = array("/geoipmaxmind");

		// Config pages
		$this->config_page_url = array("geoipmaxmind.php");

		// Dependencies
		$this->hidden = false; // A condition to hide module
		$this->depends = array(); // List of module class names as string that must be enabled if this module is enabled
		$this->requiredby = array(); // List of module ids to disable if this one is disabled
		$this->conflictwith = array(); // List of module class names as string this module is in conflict with
		$this->phpmin = array(5, 6);
		$this->phpmax = array();
		$this->need_berp3_version = array(2, 7, -1); // Minimum version of Berp3 required by module
		$this->need_javascript_ajax = 1;

		// Constants
		$this->const = array();

		// Boxes
		$this->boxes = array();

		// Permissions
		$this->rights = array();
		$this->rights_class = 'geoipmaxmind';
		$r = 0;
	}
}
