<?php
/* Copyright (C) 2002-2004 		
 * Copyright (C) 2004      
 * Copyright (C) 2004-2011 
 * Copyright (C) 2005      Marc Barilley			<marc@ocebo.com>
 * Copyright (C) 2005-2013 
 * Copyright (C) 2006      			
 * Copyright (C) 2008      Raphael Bertrand			
 * Copyright (C) 2010-2020 
 * Copyright (C) 2010-2017 
 * Copyright (C) 2012-2014   	
 * Copyright (C) 2012      Cedric Salvador          
 * Copyright (C) 2013      		  	
 * Copyright (C) 2014-2015             
 * Copyright (C) 2018      			
 * Copyright (C) 2018-2021           
 * Copyright (C) 2018               	
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
 *	\file       htdocs/comm/propal/class/propal.class.php
 *	\brief      File of class to manage proposals
 */

require_once DOL_DOCUMENT_ROOT.'/core/class/commonobject.class.php';
require_once DOL_DOCUMENT_ROOT."/core/class/commonobjectline.class.php";
require_once DOL_DOCUMENT_ROOT.'/product/class/product.class.php';
require_once DOL_DOCUMENT_ROOT.'/contact/class/contact.class.php';
require_once DOL_DOCUMENT_ROOT.'/margin/lib/margins.lib.php';
require_once DOL_DOCUMENT_ROOT.'/multicurrency/class/multicurrency.class.php';
require_once DOL_DOCUMENT_ROOT.'/core/class/commonincoterm.class.php';

/**
 *	Class to manage proposals
 */
class Leads extends CommonObject
{
	use CommonIncoterm;

	/**
	 * @var string ID to identify managed object
	 */
	public $element = 'leads';

	/**
	 * @var string Name of table without prefix where object is stored
	 */
	public $table_element = 'leads';

	/**
	 * @var int    Name of subtable line
	 */
	public $table_element_line = 'leadsdet';

	/**
	 * @var string Fieldname with ID of parent key if this field has a parent
	 */
	public $fk_element = 'fk_leads';

	/**
	 * @var string String with name of icon for myobject. Must be the part after the 'object_' into object_myobject.png
	 */
	public $picto = 'lead';

	/**
	 * 0=No test on entity, 1=Test with field entity, 2=Test with link by societe
	 * @var int
	 */
	public $ismultientitymanaged = 1;

	/**
	 * 0=Default, 1=View may be restricted to sales representative only if no permission to see all or to company of external user if external user
	 * @var integer
	 */
	public $restrictiononfksoc = 1;

	/**
	 * {@inheritdoc}
	 */
	protected $table_ref_field = 'ref';

	/**
	 * ID of the client
	 * @var int
	 */
	public $socid;

	/**
	 * ID of the contact
	 * @var int
	 */
	public $contactid;
	public $author;

	/**
	 * Ref from thirdparty
	 * @var string
	 */
	public $ref_client;

	/**
	 * Status of the quote
	 * @var int
	 * @see Propal::STATUS_DRAFT, Propal::STATUS_VALIDATED, Propal::STATUS_SIGNED, Propal::STATUS_NOTSIGNED, Propal::STATUS_BILLED
	 */
	public $statut;

	/**
	 * Status of the quote
	 * @var int
	 * @see Propal::STATUS_DRAFT, Propal::STATUS_VALIDATED, Propal::STATUS_SIGNED, Propal::STATUS_NOTSIGNED, Propal::STATUS_BILLED
	 */
	public $status;

	public $next_action;

	public $expected_closing;

	/**
	 * @deprecated
	 * @see $sales_person_id
	 */
	public $customer_name;

	
	public $sales_person_id;

	/**
	 * @var integer|string $date_creation;
	 */
	public $date_creation;


	public $extraparams = array();

	/**
	 * @var PropaleLigne[]
	 */
	public $lines = array();
	public $line;

	public $labelStatus = array();
	public $labelStatusShort = array();

	// Multicurrency
	/**
	 * @var int ID
	 */
	public $fk_multicurrency;

	public $multicurrency_code;
	public $multicurrency_tx;
	public $multicurrency_total_ht;
	public $multicurrency_total_tva;
	public $multicurrency_total_ttc;
    public $priority;
	public $progress;
	public $note_private;
	public $rowid;
	public $id;
	public $created_date;
	public $updated_date;
	public $quotation_id;


	/**
	 *  'type' if the field format ('integer', 'integer:ObjectClass:PathToClass[:AddCreateButtonOrNot[:Filter]]', 'varchar(x)', 'double(24,8)', 'real', 'price', 'text', 'html', 'date', 'datetime', 'timestamp', 'duration', 'mail', 'phone', 'url', 'password')
	 *         Note: Filter can be a string like "(t.ref:like:'SO-%') or (t.date_creation:<:'20160101') or (t.nature:is:NULL)"
	 *  'label' the translation key.
	 *  'enabled' is a condition when the field must be managed.
	 *  'position' is the sort order of field.
	 *  'notnull' is set to 1 if not null in database. Set to -1 if we must set data to null if empty ('' or 0).
	 *  'visible' says if field is visible in list (Examples: 0=Not visible, 1=Visible on list and create/update/view forms, 2=Visible on list only, 3=Visible on create/update/view form only (not list), 4=Visible on list and update/view form only (not create). 5=Visible on list and view only (not create/not update). Using a negative value means field is not shown by default on list but can be selected for viewing)
	 *  'noteditable' says if field is not editable (1 or 0)
	 *  'default' is a default value for creation (can still be overwrote by the Setup of Default Values if field is editable in creation form). Note: If default is set to '(PROV)' and field is 'ref', the default value will be set to '(PROVid)' where id is rowid when a new record is created.
	 *  'index' if we want an index in database.
	 *  'foreignkey'=>'tablename.field' if the field is a foreign key (it is recommanded to name the field fk_...).
	 *  'searchall' is 1 if we want to search in this field when making a search from the quick search button.
	 *  'isameasure' must be set to 1 if you want to have a total on list for this field. Field type must be summable like integer or double(24,8).
	 *  'css' is the CSS style to use on field. For example: 'maxwidth200'
	 *  'help' is a string visible as a tooltip on field
	 *  'showoncombobox' if value of the field must be visible into the label of the combobox that list record
	 *  'disabled' is 1 if we want to have the field locked by a 'disabled' attribute. In most cases, this is never set into the definition of $fields into class, but is set dynamically by some part of code.
	 *  'arrayofkeyval' to set list of value if type is a list of predefined values. For example: array("0"=>"Draft","1"=>"Active","-1"=>"Cancel")
	 *  'comment' is not used. You can store here any text of your choice. It is not used by application.
	 *
	 *  Note: To have value dynamic, you can set value to 0 in definition and edit the value on the fly into the constructor.
	 */

	// BEGIN MODULEBUILDER PROPERTIES
	/**
	 * @var array  Array with all fields and their property. Do not use it as a static var. It may be modified by constructor.
	 */
	public $fields = array(
		'rowid' =>array('type'=>'integer', 'label'=>'RowID', 'enabled'=>1, 'visible'=>-1, 'notnull'=>1, 'position'=>10),
		'quotatio_id' =>array('type'=>'integer', 'label'=>'QuotationID', 'enabled'=>1, 'visible'=>-1, 'notnull'=>1, 'position'=>10),
		'sales_person_id' =>array('type'=>'integer', 'label'=>'SalesPersonID', 'enabled'=>1, 'visible'=>-1, 'notnull'=>1, 'position'=>11),
		'priority' =>array('type'=>'integer', 'label'=>'Prority', 'enabled'=>1, 'visible'=>-1, 'notnull'=>1, 'position'=>12),
		'progress' =>array('type'=>'integer', 'label'=>'Progress', 'enabled'=>1, 'visible'=>-1, 'notnull'=>1, 'position'=>13),
		'entity' =>array('type'=>'integer', 'label'=>'Entity', 'default'=>1, 'enabled'=>1, 'visible'=>-2, 'notnull'=>1, 'position'=>15, 'index'=>1),
		'ref' =>array('type'=>'varchar(30)', 'label'=>'Ref', 'enabled'=>1, 'visible'=>-1, 'notnull'=>1, 'showoncombobox'=>1, 'position'=>20),
		'ref_client' =>array('type'=>'varchar(255)', 'label'=>'RefCustomer', 'enabled'=>1, 'visible'=>-1, 'position'=>22),
		'ref_ext' =>array('type'=>'varchar(255)', 'label'=>'RefExt', 'enabled'=>1, 'visible'=>0, 'position'=>40),
		'fk_soc' =>array('type'=>'integer:Societe:societe/class/societe.class.php', 'label'=>'ThirdParty', 'enabled'=>1, 'visible'=>-1, 'position'=>23),
		'fk_projet' =>array('type'=>'integer:Project:projet/class/project.class.php:1:fk_statut=1', 'label'=>'Fk projet', 'enabled'=>1, 'visible'=>-1, 'position'=>24),
		'tms' =>array('type'=>'timestamp', 'label'=>'DateModification', 'enabled'=>1, 'visible'=>-1, 'notnull'=>1, 'position'=>25),
		'next_action' =>array('type'=>'date', 'label'=>'NextAction', 'enabled'=>1, 'visible'=>-1, 'position'=>30),
		'created_date' =>array('type'=>'datetime', 'label'=>'CreatedDate', 'enabled'=>1, 'visible'=>-1, 'position'=>30),
		'updated_date' =>array('type'=>'datetime', 'label'=>'Updated_date', 'enabled'=>1, 'visible'=>-1, 'position'=>30),
		'expected_closing' =>array('type'=>'date', 'label'=>'ExpectedClosing', 'enabled'=>1, 'visible'=>-1, 'position'=>35),
		'note_private' =>array('type'=>'text', 'label'=>'NotePublic', 'enabled'=>1, 'visible'=>0, 'position'=>170),
		'note_public' =>array('type'=>'text', 'label'=>'NotePrivate', 'enabled'=>1, 'visible'=>0, 'position'=>175),
		'model_pdf' =>array('type'=>'varchar(255)', 'label'=>'PDFTemplate', 'enabled'=>1, 'visible'=>0, 'position'=>180),
		'date_livraison' =>array('type'=>'date', 'label'=>'DateDeliveryPlanned', 'enabled'=>1, 'visible'=>-1, 'position'=>185),
		'last_main_doc' =>array('type'=>'varchar(255)', 'label'=>'LastMainDoc', 'enabled'=>1, 'visible'=>-1, 'position'=>260),
		'fk_statut' =>array('type'=>'smallint(6)', 'label'=>'Status', 'enabled'=>1, 'visible'=>-1, 'notnull'=>1, 'position'=>500),
		'import_key' =>array('type'=>'varchar(14)', 'label'=>'ImportId', 'enabled'=>1, 'visible'=>-2, 'position'=>900),
		'email' =>array('type'=>'varchar(20)', 'label'=>'Email', 'enabled'=>1, 'visible'=>-2, 'position'=>905),
		'phone' =>array('type'=>'varchar(20)', 'label'=>'Phone', 'enabled'=>1, 'visible'=>-2, 'position'=>910),
		'customer_name' =>array('type'=>'varchar(250)', 'label'=>'CustomerName', 'enabled'=>1, 'visible'=>-2, 'position'=>915),
	);
	// END MODULEBUILDER PROPERTIES

	/**
	 * Draft status
	 */
	const STATUS_DRAFT = 0;
	/**
	 * Validated status
	 */
	const STATUS_VALIDATED = 1;
	/**
	 * Signed quote
	 */
	const STATUS_SIGNED = 2;
	/**
	 * Not signed quote
	 */
	const STATUS_NOTSIGNED = 3;
	/**
	 * Billed or processed quote
	 */
	const STATUS_BILLED = 4; // Todo rename into STATUS_CLOSE ?


	/**
	 *	Constructor
	 *
	 *	@param      Berp3DB	$db         Database handler
	 *	@param      int		$socid		Id third party
	 *	@param      int		$propalid   Id proposal
	 */
	public function __construct($db, $socid = 0, $leadid = 0)
	{
		global $conf, $langs;

		$this->db = $db;

		$this->socid = $socid;
		$this->id = $leadid;
        $this->rowid = $leadid;
		$this->duree_validite = ((int) $conf->global->PROPALE_VALIDITY_DURATION);
	}
	// change string to date

	public function stringToDate($string){
        $time = strtotime($string);
        $newformat = date('Y-m-d',$time);
        return $newformat;
	}
    // create leads into database
    public function refCode(){
		$sql = "SELECT MAX(ref) as 'ref' FROM " .MAIN_DB_PREFIX."leads " ;
		$resql = $this->db->query($sql);
		
		if ($resql) {
			$num = $this->db->num_rows($resql);
			$i = 0;
			while ($i < $num) {
				$obj = $this->db->fetch_object($resql);
				$ref =  $obj->ref;
				$i++;
			}
			$ref = substr($ref,2,strlen($ref));
			$ref = (int) ($ref < 1) ? 0:$ref;
			$ref += 1; 
			return 'LE'.str_pad($ref, 6, '0', STR_PAD_LEFT);;
		} else {
			dol_print_error($this->db);
			return -1;
		}
	}
	public function createLeads(){
		$error = 0;
        $notrigger = 0;
		$this->db->begin();
        // set ref code
		$this->ref = $this->refCode();
		// Insertion dans base de la ligne
		$sql = 'INSERT INTO '.MAIN_DB_PREFIX.'leads';
		$sql .= ' (ref,ref_client,email,phone,sales_person_id,status,note_private,next_action,expected_closing,priority,progress)';
		$sql .= " VALUES ('".$this->ref."',";
		$sql .= " '".$this->ref_client."',";
		$sql .= " '".$this->email."',";
		$sql .= " '".$this->phone."',";
		$sql .= " '".$this->sales_person_id."',";
		$sql .= " '".$this->status."',";
		$sql .= " '".$this->note_private."',";
		$sql .= " '".$this->stringToDate($this->next_action)."',";
		$sql .= " '".$this->stringToDate($this->expected_closing)."',";
		$sql .= " '".$this->priority."',";
		$sql .= " 'draft'";
		$sql .= ')';
        //echo $sql;exit;
		dol_syslog(get_class($this)."::insert", LOG_DEBUG);
		$resql = $this->db->query($sql);
		if ($resql) {
			$this->id = $this->db->last_insert_id(MAIN_DB_PREFIX.'leads');
			$this->rowid = $this->id;

			if (!$error) {
				$this->db->commit();
				return 1;
			}

			foreach ($this->errors as $errmsg) {
				dol_syslog(get_class($this)."::insert ".$errmsg, LOG_ERR);
				$this->error .= ($this->error ? ', '.$errmsg : $errmsg);
			}
			$this->db->rollback();
			return -1 * $error;
		} else {
			$this->error = $this->db->error();
			$this->db->rollback();
			return -2;
		}
		return 1;
	}
	// update leads into database
	public function updateLeads(){
		$error = 0;
		$notrigger = 0;
		$this->db->begin();

		// Insertion dans base de la ligne
		$sql = "UPDATE ".MAIN_DB_PREFIX."leads SET ";
		$sql .= "ref_client = '".$this->ref_client."',";
		$sql .= "email = '".$this->email."',";
		$sql .= "phone = '".$this->phone."',";
		$sql .= "sales_person_id = '".$this->sales_person_id."',";
		$sql .= "status = '".$this->status."',";
		$sql .= "note_private = '".$this->note_private."',";
		$sql .= "next_action = '".$this->stringToDate($this->next_action)."',";
		$sql .= "expected_closing = '".$this->stringToDate($this->expected_closing)."',";
		$sql .= "priority = '".$this->priority."',";
		$sql .= "progress = '".$this->progress."'";
		$sql .= " WHERE rowid = ".((int) $this->rowid);
		//echo $sql;
		dol_syslog(get_class($this)."::update", LOG_DEBUG);
		$resql = $this->db->query($sql);
		if ($resql) {
			

			if (!$error) {
				$this->db->commit();
				return 1;
			}

			foreach ($this->errors as $errmsg) {
				dol_syslog(get_class($this)."::update ".$errmsg, LOG_ERR);
				$this->error .= ($this->error ? ', '.$errmsg : $errmsg);
			}
			$this->db->rollback();
			return -1 * $error;
		} else {
			$this->error = $this->db->error();
			$this->db->rollback();
			return -2;
		}
		return 1;
	}

	// update progress leads into database
	public function updateProgress(){
		$error = 0;
		$notrigger = 0;
		$this->db->begin();

		// Insertion dans base de la ligne
		$sql = "UPDATE ".MAIN_DB_PREFIX."leads SET ";
		$sql .= "progress = '".$this->progress."'";
		$sql .= " WHERE rowid = ".((int) $this->rowid);
		//echo $sql;exit;
		dol_syslog(get_class($this)."::update", LOG_DEBUG);
		$resql = $this->db->query($sql);
		if ($resql) {
			

			if (!$error) {
				$this->db->commit();
				return 1;
			}

			foreach ($this->errors as $errmsg) {
				dol_syslog(get_class($this)."::update ".$errmsg, LOG_ERR);
				$this->error .= ($this->error ? ', '.$errmsg : $errmsg);
			}
			$this->db->rollback();
			return -1 * $error;
		} else {
			$this->error = $this->db->error();
			$this->db->rollback();
			return -2;
		}
		return 1;
	}
	
	// update quotation id when convert to quotation
	public function toQuotation($id){
		$error = 0;
		$notrigger = 0;
		$this->db->begin();

		// Insertion dans base de la ligne
		$sql = "UPDATE ".MAIN_DB_PREFIX."leads SET ";
		$sql .= "quotation_id = ".$id;
		$sql .= "  WHERE rowid = ".((int) $this->rowid);
		//echo $sql;
		dol_syslog(get_class($this)."::update", LOG_DEBUG);
		$resql = $this->db->query($sql);
		if ($resql) {
			

			if (!$error) {
				$this->db->commit();
				return 1;
			}

			foreach ($this->errors as $errmsg) {
				dol_syslog(get_class($this)."::update ".$errmsg, LOG_ERR);
				$this->error .= ($this->error ? ', '.$errmsg : $errmsg);
			}
			$this->db->rollback();
			return -1 * $error;
		} else {
			$this->error = $this->db->error();
			$this->db->rollback();
			return -2;
		}
		return 1;
	}
	
	/**
	 *  Return array of sales representatives
	 *
	 *  @param	User		$user			Object user
	 *  @param	int			$mode			0=Array with properties, 1=Array of id.
	 *  @param	string		$sortfield		List of sort fields, separated by comma. Example: 't1.fielda,t2.fieldb'
	 *  @param	string		$sortorder		Sort order, separated by comma. Example: 'ASC,DESC';
	 *  @return array       				Array of sales representatives of third party
	 */
	public function getSalesRepresentatives(User $user, $mode = 0, $sortfield = null, $sortorder = null)
	{
		global $conf;

		$reparray = array();

		$sql = "SELECT DISTINCT u.rowid, u.login, u.lastname, u.firstname, u.office_phone, u.job, u.email, u.statut as status, u.entity, u.photo, u.gender";
		$sql .= ", u.office_fax, u.user_mobile, u.personal_mobile";
		$sql .= " FROM ".MAIN_DB_PREFIX."societe_commerciaux as sc, ".MAIN_DB_PREFIX."user as u";
		if (!empty($conf->multicompany->enabled) && !empty($conf->global->MULTICOMPANY_TRANSVERSE_MODE)) {
			$sql .= ", ".MAIN_DB_PREFIX."usergroup_user as ug";
			$sql .= " WHERE ((ug.fk_user = sc.fk_user";
			$sql .= " AND ug.entity = ".$conf->entity.")";
			$sql .= " OR u.admin = 1)";
		} else {
			$sql .= " WHERE entity in (0, ".$conf->entity.")";
		}

		$sql .= " AND u.rowid = sc.fk_user AND sc.fk_soc = ".((int) $this->id);
		if (empty($sortfield) && empty($sortorder)) {
			$sortfield = 'u.lastname,u.firstname';
			$sortorder = 'ASC,ASC';
		}
		$sql .= $this->db->order($sortfield, $sortorder);

		$resql = $this->db->query($sql);
		if ($resql) {
			$num = $this->db->num_rows($resql);
			$i = 0;
			while ($i < $num) {
				$obj = $this->db->fetch_object($resql);

				if (empty($mode)) {
					$reparray[$i]['id'] = $obj->rowid;
					$reparray[$i]['lastname'] = $obj->lastname;
					$reparray[$i]['firstname'] = $obj->firstname;
					$reparray[$i]['email'] = $obj->email;
					$reparray[$i]['phone'] = $obj->office_phone;
					$reparray[$i]['office_phone'] = $obj->office_phone;
					$reparray[$i]['office_fax'] = $obj->office_fax;
					$reparray[$i]['user_mobile'] = $obj->user_mobile;
					$reparray[$i]['personal_mobile'] = $obj->personal_mobile;
					$reparray[$i]['job'] = $obj->job;
					$reparray[$i]['statut'] = $obj->status; // deprecated
					$reparray[$i]['status'] = $obj->status;
					$reparray[$i]['entity'] = $obj->entity;
					$reparray[$i]['login'] = $obj->login;
					$reparray[$i]['photo'] = $obj->photo;
					$reparray[$i]['gender'] = $obj->gender;
				} else {
					$reparray[] = $obj->rowid;
				}
				$i++;
			}
			return $reparray;
		} else {
			dol_print_error($this->db);
			return -1;
		}
	}


	// check input 
	public function checkInput()
	{
		if(empty($this->ref_client) || empty($this->phone) || empty($this->email) || 
		   empty($this->sales_person_id) || empty($this->next_action) || empty($this->expected_closing) ||
		   empty($this->status)){
			   return 0;
		   }
		   return 1;
	}

	// fetch leads by rowid
	public function fecthLeadsById($rowid){
		
		$sql = "SELECT * FROM " .MAIN_DB_PREFIX."leads " ;
		$sql .=" WHERE rowid = ".$rowid;
        
		$resql = $this->db->query($sql);
		if ($resql) {
			$num = $this->db->num_rows($resql);
			$i = 0;
			while ($i < $num) {
				$obj = $this->db->fetch_object($resql);

				if (empty($mode)) {
					$this->rowid = $reparray[$i]['id'] = $obj->rowid;
					$this->ref = $reparray[$i]['ref'] = $obj->ref;
					$this->ref_client = $reparray[$i]['ref_client'] = $obj->ref_client;
					$this->email = $reparray[$i]['email'] = $obj->email;
					$this->phone = $reparray[$i]['phone'] = $obj->phone;
					$this->sales_person_id = $reparray[$i]['sales_person_id'] = $obj->sales_person_id;
					$this->next_action = $reparray[$i]['next_action'] = $obj->next_action;
					$this->expected_closing = $reparray[$i]['expected_closing'] = $obj->expected_closing;
					$this->status = $reparray[$i]['status'] = $obj->status;
					$this->note_private = $reparray[$i]['note_private'] = $obj->note_private;
					$this->priority = $reparray[$i]['priority'] = $obj->priority; // deprecated
					$this->progress = $reparray[$i]['progress'] = $obj->progress;
					$this->created_date = $reparray[$i]['created_dated'] = $obj->created_date;
					$this->updated_date = $reparray[$i]['updated_dated'] = $obj->updated_date;
					$this->updated_date = $reparray[$i]['quotation_id'] = $obj->quotation_id;

				} else {
					$reparray[] = $obj->rowid;
				}
				$i++;
			}
			
			return $reparray;
		} else {
			dol_print_error($this->db);
			return -1;
		}
	}



/**
 *	Class to manage commercial proposal lines
 */
// class PropaleLigne extends CommonObjectLine
// {
// 	/**
// 	 * @var string ID to identify managed object
// 	 */
// 	public $element = 'propaldet';

// 	/**
// 	 * @var string Name of table without prefix where object is stored
// 	 */
// 	public $table_element = 'propaldet';

// 	public $oldline;

// 	// From llx_propaldet
// 	public $fk_propal;
// 	public $fk_parent_line;
// 	public $desc; // Description ligne
// 	public $fk_product; // Id produit predefini
// 	/**
// 	 * @deprecated
// 	 * @see $product_type
// 	 */
// 	public $fk_product_type;
// 	/**
// 	 * Product type.
// 	 * @var int
// 	 * @see Product::TYPE_PRODUCT, Product::TYPE_SERVICE
// 	 */
// 	public $product_type = Product::TYPE_PRODUCT;

// 	public $qty;

// 	public $tva_tx;
// 	public $vat_src_code;

// 	public $subprice;
// 	public $remise_percent;
// 	public $fk_remise_except;

// 	public $rang = 0;

// 	public $fk_fournprice;
// 	public $pa_ht;
// 	public $marge_tx;
// 	public $marque_tx;

// 	public $special_code; // Tag for special lines (exlusive tags)
// 	// 1: frais de port
// 	// 2: ecotaxe
// 	// 3: option line (when qty = 0)

// 	public $info_bits = 0; // Some other info:
// 	// Bit 0: 	0 si TVA normal - 1 si TVA NPR
// 	// Bit 1:	0 ligne normale - 1 si ligne de remise fixe

// 	public $total_ht; // Total HT  de la ligne toute quantite et incluant la remise ligne
// 	public $total_tva; // Total TVA  de la ligne toute quantite et incluant la remise ligne
// 	public $total_ttc; // Total TTC de la ligne toute quantite et incluant la remise ligne

// 	/**
// 	 * @deprecated
// 	 * @see $remise_percent, $fk_remise_except
// 	 */
// 	public $remise;
// 	/**
// 	 * @deprecated
// 	 * @see $subprice
// 	 */
// 	public $price;

// 	// From llx_product
// 	/**
// 	 * @deprecated
// 	 * @see $product_ref
// 	 */
// 	public $ref;
// 	/**
// 	 * Product reference
// 	 * @var string
// 	 */
// 	public $product_ref;
// 	/**
// 	 * @deprecated
// 	 * @see $product_label
// 	 */
// 	public $libelle;
// 	/**
// 	 * @deprecated
// 	 * @see $product_label
// 	 */
// 	public $label;
// 	/**
// 	 *  Product label
// 	 * @var string
// 	 */
// 	public $product_label;
// 	/**
// 	 * Product description
// 	 * @var string
// 	 */
// 	public $product_desc;

// 	/**
// 	 * Product use lot
// 	 * @var string
// 	 */
// 	public $product_tobatch;

// 	/**
// 	 * Product barcode
// 	 * @var string
// 	 */
// 	public $product_barcode;

// 	public $localtax1_tx; // Local tax 1
// 	public $localtax2_tx; // Local tax 2
// 	public $localtax1_type; // Local tax 1 type
// 	public $localtax2_type; // Local tax 2 type
// 	public $total_localtax1; // Line total local tax 1
// 	public $total_localtax2; // Line total local tax 2

// 	public $date_start;
// 	public $date_end;

// 	public $skip_update_total; // Skip update price total for special lines

// 	// Multicurrency
// 	public $fk_multicurrency;
// 	public $multicurrency_code;
// 	public $multicurrency_subprice;
// 	public $multicurrency_total_ht;
// 	public $multicurrency_total_tva;
// 	public $multicurrency_total_ttc;

// 	/**
// 	 * 	Class line Contructor
// 	 *
// 	 * 	@param	Berp3DB	$db	Database handler
// 	 */
// 	public function __construct($db)
// 	{
// 		$this->db = $db;
// 	}

// 	/**
// 	 *	Retrieve the propal line object
// 	 *
// 	 *	@param	int		$rowid		Propal line id
// 	 *	@return	int					<0 if KO, >0 if OK
// 	 */
	public function fetch($rowid)
	{
		$sql = 'SELECT * FROM '.MAIN_DB_PREFIX.'leads ';
		$sql .= ' WHERE rowid = '.((int) $rowid);
		//echo $sql;
		$result = $this->db->query($sql);
		if ($result) {
			$obj = $this->db->fetch_object($result);
             
			if ($obj) {
				$this->id =  $obj->rowid;
				$this->rowid =  $obj->rowid;
				$this->ref =  $obj->ref;
				$this->ref_client =  $obj->ref_client;
				$this->email =  $obj->email;
				$this->phone =  $obj->phone;
				$this->sales_person_id =  $obj->sales_person_id;
				$this->next_action =  $obj->next_action;
				$this->expected_closing =  $obj->expected_closing;
				$this->status =  $obj->status;
				$this->note_private =  $obj->note_private;
				$this->priority =  $obj->priority; // deprecated
				$this->progress = $obj->progress;

				$this->db->free($result);

				return 1;
			} else {
				return 0;
			}
		} else {
			return -1;
		}
	}

// 	/**
// 	 *  Insert object line propal in database
// 	 *
// 	 *	@param		int		$notrigger		1=Does not execute triggers, 0= execute triggers
// 	 *	@return		int						<0 if KO, >0 if OK
// 	 */
// 	public function insert($notrigger = 0)
// 	{
// 		global $conf, $user;

// 		$error = 0;

// 		dol_syslog(get_class($this)."::insert rang=".$this->rang);

// 		$pa_ht_isemptystring = (empty($this->pa_ht) && $this->pa_ht == ''); // If true, we can use a default value. If this->pa_ht = '0', we must use '0'.

// 		// Clean parameters
// 		if (empty($this->tva_tx)) {
// 			$this->tva_tx = 0;
// 		}
// 		if (empty($this->localtax1_tx)) {
// 			$this->localtax1_tx = 0;
// 		}
// 		if (empty($this->localtax2_tx)) {
// 			$this->localtax2_tx = 0;
// 		}
// 		if (empty($this->localtax1_type)) {
// 			$this->localtax1_type = 0;
// 		}
// 		if (empty($this->localtax2_type)) {
// 			$this->localtax2_type = 0;
// 		}
// 		if (empty($this->total_localtax1)) {
// 			$this->total_localtax1 = 0;
// 		}
// 		if (empty($this->total_localtax2)) {
// 			$this->total_localtax2 = 0;
// 		}
// 		if (empty($this->rang)) {
// 			$this->rang = 0;
// 		}
// 		if (empty($this->remise)) {
// 			$this->remise = 0;
// 		}
// 		if (empty($this->remise_percent) || !is_numeric($this->remise_percent)) {
// 			$this->remise_percent = 0;
// 		}
// 		if (empty($this->info_bits)) {
// 			$this->info_bits = 0;
// 		}
// 		if (empty($this->special_code)) {
// 			$this->special_code = 0;
// 		}
// 		if (empty($this->fk_parent_line)) {
// 			$this->fk_parent_line = 0;
// 		}
// 		if (empty($this->fk_fournprice)) {
// 			$this->fk_fournprice = 0;
// 		}
// 		if (!is_numeric($this->qty)) {
// 			$this->qty = 0;
// 		}
// 		if (empty($this->pa_ht)) {
// 			$this->pa_ht = 0;
// 		}
// 		if (empty($this->multicurrency_subprice)) {
// 			$this->multicurrency_subprice = 0;
// 		}
// 		if (empty($this->multicurrency_total_ht)) {
// 			$this->multicurrency_total_ht = 0;
// 		}
// 		if (empty($this->multicurrency_total_tva)) {
// 			$this->multicurrency_total_tva = 0;
// 		}
// 		if (empty($this->multicurrency_total_ttc)) {
// 			$this->multicurrency_total_ttc = 0;
// 		}

// 		// if buy price not defined, define buyprice as configured in margin admin
// 		if ($this->pa_ht == 0 && $pa_ht_isemptystring) {
// 			if (($result = $this->defineBuyPrice($this->subprice, $this->remise_percent, $this->fk_product)) < 0) {
// 				return $result;
// 			} else {
// 				$this->pa_ht = $result;
// 			}
// 		}

// 		// Check parameters
// 		if ($this->product_type < 0) {
// 			return -1;
// 		}

// 		$this->db->begin();

// 		// Insert line into database
// 		$sql = 'INSERT INTO '.MAIN_DB_PREFIX.'propaldet';
// 		$sql .= ' (fk_propal, fk_parent_line, label, description, fk_product, product_type,';
// 		$sql .= ' fk_remise_except, qty, vat_src_code, tva_tx, localtax1_tx, localtax2_tx, localtax1_type, localtax2_type,';
// 		$sql .= ' subprice, remise_percent, ';
// 		$sql .= ' info_bits, ';
// 		$sql .= ' total_ht, total_tva, total_localtax1, total_localtax2, total_ttc, fk_product_fournisseur_price, buy_price_ht, special_code, rang,';
// 		$sql .= ' fk_unit,';
// 		$sql .= ' date_start, date_end';
// 		$sql .= ', fk_multicurrency, multicurrency_code, multicurrency_subprice, multicurrency_total_ht, multicurrency_total_tva, multicurrency_total_ttc)';
// 		$sql .= " VALUES (".$this->fk_propal.",";
// 		$sql .= " ".($this->fk_parent_line > 0 ? "'".$this->db->escape($this->fk_parent_line)."'" : "null").",";
// 		$sql .= " ".(!empty($this->label) ? "'".$this->db->escape($this->label)."'" : "null").",";
// 		$sql .= " '".$this->db->escape($this->desc)."',";
// 		$sql .= " ".($this->fk_product ? "'".$this->db->escape($this->fk_product)."'" : "null").",";
// 		$sql .= " '".$this->db->escape($this->product_type)."',";
// 		$sql .= " ".($this->fk_remise_except ? "'".$this->db->escape($this->fk_remise_except)."'" : "null").",";
// 		$sql .= " ".price2num($this->qty, 'MS').",";
// 		$sql .= " ".(empty($this->vat_src_code) ? "''" : "'".$this->db->escape($this->vat_src_code)."'").",";
// 		$sql .= " ".price2num($this->tva_tx).",";
// 		$sql .= " ".price2num($this->localtax1_tx).",";
// 		$sql .= " ".price2num($this->localtax2_tx).",";
// 		$sql .= " '".$this->db->escape($this->localtax1_type)."',";
// 		$sql .= " '".$this->db->escape($this->localtax2_type)."',";
// 		$sql .= " ".(price2num($this->subprice) !== '' ? price2num($this->subprice, 'MU') : "null").",";
// 		$sql .= " ".price2num($this->remise_percent, 3).",";
// 		$sql .= " ".(isset($this->info_bits) ? ((int) $this->info_bits) : "null").",";
// 		$sql .= " ".price2num($this->total_ht, 'MT').",";
// 		$sql .= " ".price2num($this->total_tva, 'MT').",";
// 		$sql .= " ".price2num($this->total_localtax1, 'MT').",";
// 		$sql .= " ".price2num($this->total_localtax2, 'MT').",";
// 		$sql .= " ".price2num($this->total_ttc, 'MT').",";
// 		$sql .= " ".(!empty($this->fk_fournprice) ? "'".$this->db->escape($this->fk_fournprice)."'" : "null").",";
// 		$sql .= " ".(isset($this->pa_ht) ? "'".price2num($this->pa_ht)."'" : "null").",";
// 		$sql .= ' '.((int) $this->special_code).',';
// 		$sql .= ' '.((int) $this->rang).',';
// 		$sql .= ' '.(empty($this->fk_unit) ? 'NULL' : ((int) $this->fk_unit)).',';
// 		$sql .= " ".(!empty($this->date_start) ? "'".$this->db->idate($this->date_start)."'" : "null").',';
// 		$sql .= " ".(!empty($this->date_end) ? "'".$this->db->idate($this->date_end)."'" : "null");
// 		$sql .= ", ".($this->fk_multicurrency > 0 ? ((int) $this->fk_multicurrency) : 'null');
// 		$sql .= ", '".$this->db->escape($this->multicurrency_code)."'";
// 		$sql .= ", ".price2num($this->multicurrency_subprice, 'CU');
// 		$sql .= ", ".price2num($this->multicurrency_total_ht, 'CT');
// 		$sql .= ", ".price2num($this->multicurrency_total_tva, 'CT');
// 		$sql .= ", ".price2num($this->multicurrency_total_ttc, 'CT');
// 		$sql .= ')';

// 		dol_syslog(get_class($this).'::insert', LOG_DEBUG);
// 		$resql = $this->db->query($sql);
// 		if ($resql) {
// 			$this->rowid = $this->db->last_insert_id(MAIN_DB_PREFIX.'propaldet');

// 			if (!$error) {
// 				$this->id = $this->rowid;
// 				$result = $this->insertExtraFields();
// 				if ($result < 0) {
// 					$error++;
// 				}
// 			}

// 			if (!$error && !$notrigger) {
// 				// Call trigger
// 				$result = $this->call_trigger('LINEPROPAL_INSERT', $user);
// 				if ($result < 0) {
// 					$this->db->rollback();
// 					return -1;
// 				}
// 				// End call triggers
// 			}

// 			$this->db->commit();
// 			return 1;
// 		} else {
// 			$this->error = $this->db->error()." sql=".$sql;
// 			$this->db->rollback();
// 			return -1;
// 		}
// 	}

// 	/**
// 	 * 	Delete line in database
// 	 *
// 	 *  @param	User	$user		Object user
// 	 *	@param 	int		$notrigger	1=Does not execute triggers, 0= execute triggers
// 	 *	@return	 int  				<0 if ko, >0 if ok
// 	 */
	public function delete(User $user, $notrigger = 0)
	{
		global $conf;
        //print_r($user);
		$error = 0;
		$this->db->begin();

		$sql = "DELETE FROM ".MAIN_DB_PREFIX."leads WHERE rowid = ".((int) $this->rowid);
		dol_syslog("LeadsLigne::delete", LOG_DEBUG);
		if ($this->db->query($sql)) {
			$this->db->commit();
			return 1;
		} else {
			$this->error = $this->db->error()." sql=".$sql;
			$this->db->rollback();
			return -1;
		}
	}

// 	/**
// 	 *	Update propal line object into DB
// 	 *
// 	 *	@param 	int		$notrigger	1=Does not execute triggers, 0= execute triggers
// 	 *	@return	int					<0 if ko, >0 if ok
// 	 */
// 	public function update($notrigger = 0)
// 	{
// 		global $conf, $user;

// 		$error = 0;

// 		$pa_ht_isemptystring = (empty($this->pa_ht) && $this->pa_ht == ''); // If true, we can use a default value. If this->pa_ht = '0', we must use '0'.

// 		if (empty($this->id) && !empty($this->rowid)) {
// 			$this->id = $this->rowid;
// 		}

// 		// Clean parameters
// 		if (empty($this->tva_tx)) {
// 			$this->tva_tx = 0;
// 		}
// 		if (empty($this->localtax1_tx)) {
// 			$this->localtax1_tx = 0;
// 		}
// 		if (empty($this->localtax2_tx)) {
// 			$this->localtax2_tx = 0;
// 		}
// 		if (empty($this->total_localtax1)) {
// 			$this->total_localtax1 = 0;
// 		}
// 		if (empty($this->total_localtax2)) {
// 			$this->total_localtax2 = 0;
// 		}
// 		if (empty($this->localtax1_type)) {
// 			$this->localtax1_type = 0;
// 		}
// 		if (empty($this->localtax2_type)) {
// 			$this->localtax2_type = 0;
// 		}
// 		if (empty($this->marque_tx)) {
// 			$this->marque_tx = 0;
// 		}
// 		if (empty($this->marge_tx)) {
// 			$this->marge_tx = 0;
// 		}
// 		if (empty($this->price)) {
// 			$this->price = 0; // TODO A virer
// 		}
// 		if (empty($this->remise)) {
// 			$this->remise = 0; // TODO A virer
// 		}
// 		if (empty($this->remise_percent)) {
// 			$this->remise_percent = 0;
// 		}
// 		if (empty($this->info_bits)) {
// 			$this->info_bits = 0;
// 		}
// 		if (empty($this->special_code)) {
// 			$this->special_code = 0;
// 		}
// 		if (empty($this->fk_parent_line)) {
// 			$this->fk_parent_line = 0;
// 		}
// 		if (empty($this->fk_fournprice)) {
// 			$this->fk_fournprice = 0;
// 		}
// 		if (empty($this->subprice)) {
// 			$this->subprice = 0;
// 		}
// 		if (empty($this->pa_ht)) {
// 			$this->pa_ht = 0;
// 		}

// 		// if buy price not defined, define buyprice as configured in margin admin
// 		if ($this->pa_ht == 0 && $pa_ht_isemptystring) {
// 			if (($result = $this->defineBuyPrice($this->subprice, $this->remise_percent, $this->fk_product)) < 0) {
// 				return $result;
// 			} else {
// 				$this->pa_ht = $result;
// 			}
// 		}

// 		$this->db->begin();

// 		// Mise a jour ligne en base
// 		$sql = "UPDATE ".MAIN_DB_PREFIX."propaldet SET";
// 		$sql .= " description='".$this->db->escape($this->desc)."'";
// 		$sql .= ", label=".(!empty($this->label) ? "'".$this->db->escape($this->label)."'" : "null");
// 		$sql .= ", product_type=".$this->product_type;
// 		$sql .= ", vat_src_code = '".(empty($this->vat_src_code) ? '' : $this->vat_src_code)."'";
// 		$sql .= ", tva_tx='".price2num($this->tva_tx)."'";
// 		$sql .= ", localtax1_tx=".price2num($this->localtax1_tx);
// 		$sql .= ", localtax2_tx=".price2num($this->localtax2_tx);
// 		$sql .= ", localtax1_type='".$this->db->escape($this->localtax1_type)."'";
// 		$sql .= ", localtax2_type='".$this->db->escape($this->localtax2_type)."'";
// 		$sql .= ", qty='".price2num($this->qty)."'";
// 		$sql .= ", subprice=".price2num($this->subprice)."";
// 		$sql .= ", remise_percent=".price2num($this->remise_percent)."";
// 		$sql .= ", price=".price2num($this->price).""; // TODO A virer
// 		$sql .= ", remise=".price2num($this->remise).""; // TODO A virer
// 		$sql .= ", info_bits='".$this->db->escape($this->info_bits)."'";
// 		if (empty($this->skip_update_total)) {
// 			$sql .= ", total_ht=".price2num($this->total_ht)."";
// 			$sql .= ", total_tva=".price2num($this->total_tva)."";
// 			$sql .= ", total_ttc=".price2num($this->total_ttc)."";
// 			$sql .= ", total_localtax1=".price2num($this->total_localtax1)."";
// 			$sql .= ", total_localtax2=".price2num($this->total_localtax2)."";
// 		}
// 		$sql .= ", fk_product_fournisseur_price=".(!empty($this->fk_fournprice) ? "'".$this->db->escape($this->fk_fournprice)."'" : "null");
// 		$sql .= ", buy_price_ht=".price2num($this->pa_ht);
// 		if (strlen($this->special_code)) {
// 			$sql .= ", special_code=".$this->special_code;
// 		}
// 		$sql .= ", fk_parent_line=".($this->fk_parent_line > 0 ? $this->fk_parent_line : "null");
// 		if (!empty($this->rang)) {
// 			$sql .= ", rang=".((int) $this->rang);
// 		}
// 		$sql .= ", date_start=".(!empty($this->date_start) ? "'".$this->db->idate($this->date_start)."'" : "null");
// 		$sql .= ", date_end=".(!empty($this->date_end) ? "'".$this->db->idate($this->date_end)."'" : "null");
// 		$sql .= ", fk_unit=".(!$this->fk_unit ? 'NULL' : $this->fk_unit);

// 		// Multicurrency
// 		$sql .= ", multicurrency_subprice=".price2num($this->multicurrency_subprice)."";
// 		$sql .= ", multicurrency_total_ht=".price2num($this->multicurrency_total_ht)."";
// 		$sql .= ", multicurrency_total_tva=".price2num($this->multicurrency_total_tva)."";
// 		$sql .= ", multicurrency_total_ttc=".price2num($this->multicurrency_total_ttc)."";

// 		$sql .= " WHERE rowid = ".((int) $this->id);

// 		dol_syslog(get_class($this)."::update", LOG_DEBUG);
// 		$resql = $this->db->query($sql);
// 		if ($resql) {
// 			if (!$error) {
// 				$result = $this->insertExtraFields();
// 				if ($result < 0) {
// 					$error++;
// 				}
// 			}

// 			if (!$error && !$notrigger) {
// 				// Call trigger
// 				$result = $this->call_trigger('LINEPROPAL_UPDATE', $user);
// 				if ($result < 0) {
// 					$this->db->rollback();
// 					return -1;
// 				}
// 				// End call triggers
// 			}

// 			$this->db->commit();
// 			return 1;
// 		} else {
// 			$this->error = $this->db->error();
// 			$this->db->rollback();
// 			return -2;
// 		}
// 	}

// 	// phpcs:disable PEAR.NamingConventions.ValidFunctionName.ScopeNotCamelCaps
// 	/**
// 	 *	Update DB line fields total_xxx
// 	 *	Used by migration
// 	 *
// 	 *	@return		int		<0 if KO, >0 if OK
// 	 */
// 	public function update_total()
// 	{
// 		// phpcs:enable
// 		$this->db->begin();

// 		// Mise a jour ligne en base
// 		$sql = "UPDATE ".MAIN_DB_PREFIX."propaldet SET";
// 		$sql .= " total_ht=".price2num($this->total_ht, 'MT')."";
// 		$sql .= ",total_tva=".price2num($this->total_tva, 'MT')."";
// 		$sql .= ",total_ttc=".price2num($this->total_ttc, 'MT')."";
// 		$sql .= " WHERE rowid = ".((int) $this->rowid);

// 		dol_syslog("PropaleLigne::update_total", LOG_DEBUG);

// 		$resql = $this->db->query($sql);
// 		if ($resql) {
// 			$this->db->commit();
// 			return 1;
// 		} else {
// 			$this->error = $this->db->error();
// 			$this->db->rollback();
// 			return -2;
// 		}
// 	}

	
 }
