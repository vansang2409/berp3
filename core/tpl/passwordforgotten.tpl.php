<?php
/* Copyright (C) 2009-2010  
 * Copyright (C) 2011-2013 
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


if (!defined('NOBROWSERNOTIF')) {
	define('NOBROWSERNOTIF', 1);
}

// Protection to avoid direct call of template
if (empty($conf) || !is_object($conf)) {
	print "Error, template page can't be called as URL";
	exit;
}


require_once DOL_DOCUMENT_ROOT.'/core/lib/functions2.lib.php';

header('Cache-Control: Public, must-revalidate');
header("Content-type: text/html; charset=".$conf->file->character_set_client);

if (GETPOST('dol_hide_topmenu')) {
	$conf->dol_hide_topmenu = 1;
}
if (GETPOST('dol_hide_leftmenu')) {
	$conf->dol_hide_leftmenu = 1;
}
if (GETPOST('dol_optimize_smallscreen')) {
	$conf->dol_optimize_smallscreen = 1;
}
if (GETPOST('dol_no_mouse_hover')) {
	$conf->dol_no_mouse_hover = 1;
}
if (GETPOST('dol_use_jmobile')) {
	$conf->dol_use_jmobile = 1;
}

// If we force to use jmobile, then we reenable javascript
if (!empty($conf->dol_use_jmobile)) {
	$conf->use_javascript_ajax = 1;
}

$php_self = $_SERVER['PHP_SELF'];
$php_self .= dol_escape_htmltag($_SERVER["QUERY_STRING"]) ? '?'.dol_escape_htmltag($_SERVER["QUERY_STRING"]) : '';
$php_self = str_replace('action=validatenewpassword', '', $php_self);

$titleofpage = $langs->trans('SendNewPassword');

print top_htmlhead('', $titleofpage);


$colorbackhmenu1 = '60,70,100'; // topmenu
if (!isset($conf->global->THEME_ELDY_TOPMENU_BACK1)) {
	$conf->global->THEME_ELDY_TOPMENU_BACK1 = $colorbackhmenu1;
}
$colorbackhmenu1 = empty($user->conf->THEME_ELDY_ENABLE_PERSONALIZED) ? (empty($conf->global->THEME_ELDY_TOPMENU_BACK1) ? $colorbackhmenu1 : $conf->global->THEME_ELDY_TOPMENU_BACK1) : (empty($user->conf->THEME_ELDY_TOPMENU_BACK1) ? $colorbackhmenu1 : $user->conf->THEME_ELDY_TOPMENU_BACK1);
$colorbackhmenu1 = join(',', colorStringToArray($colorbackhmenu1)); // Normalize value to 'x,y,z'

?>
<!-- BEGIN PHP TEMPLATE PASSWORDFORGOTTEN.TPL.PHP -->

<body class="body bodylogin"<?php print empty($conf->global->MAIN_LOGIN_BACKGROUND) ? '' : ' style="background-size: cover; background-position: center center; background-attachment: fixed; background-repeat: no-repeat; background-image: url(\''.DOL_URL_ROOT.'/viewimage.php?cache=1&noalt=1&modulepart=mycompany&file='.urlencode('logos/'.$conf->global->MAIN_LOGIN_BACKGROUND).'\')"'; ?>>

<?php if (empty($conf->dol_use_jmobile)) { ?>
<script>
$(document).ready(function () {
	// Set focus on correct field
	<?php if ($focus_element) {
		?>$('#<?php echo $focus_element; ?>').focus(); <?php
	} ?>		// Warning to use this only on visible element
});
</script>
<?php } ?>

<style>
.img_logo {
	  width:50%;
  }
.lr {
	text-align:left;
	padding:0px 0px 5px 43px;
}
.recaptcha {
	padding: 0 42px; 
	max-width:50%; 
	float:left;
}
.btn-fg {
	padding: 0px 40px 0px 0px;
    max-width:50%; 
	float:right;
}
@media only screen and (max-width: 553px) {
  .img_logo {
	  width:100%;
  }
  .login_table {
	  max-width: 553px;
  }
  #login_line1 {
	  text-align: left;
  }
  .trinputlogin input[type=text], input[type=password] {
    max-width: 100%;
  }

  .login_table .tdinputlogin {
    min-width: 450px !important;
 }
 .lr {
	text-align:left;
	padding:0px 0px 5px 20px;
	}
.recaptcha {
	padding: 0 20px; 
	max-width:50%; 
	float:left;
 }	
.btn-fg {
	padding: 0px 20px 0px 0px;
    max-width:50%; 
	float:right;
 }
}
</style>
<div class="login_center center"<?php print empty($conf->global->MAIN_LOGIN_BACKGROUND) ? ' style="background-size: cover; background-position: center center; background-attachment: fixed; background-repeat: no-repeat; background-color: white;"' : '' ?>>
<div class="login_vertical_align">
<div id="login_left">
<img alt="" title="" src="<?php echo $urllogo; ?>" id="img_logo" class ="img_logo" />
</div>

<br>
<form id="login" name="login" method="POST" action="<?php echo $php_self; ?>">

<input type="hidden" name="token" value="<?php echo newToken(); ?>">
<input type="hidden" name="action" value="buildnewpassword">

<?php 
$title = 'BERP3';
?>
<!-- Title with version -->
<div class="login_table_title center" title="<?php echo dol_escape_htmltag($title); ?>">
</div>



<div class="login_table" style="min-height: 280px;">
<h2>Forgot Password</h2>
<div id="login_line1">
<div id="login_right">

<div class="tagtable centpercent" title="Login pass" >

<!-- Login -->
<div class="trinputlogin">
<div class="tagtd nowraponall center valignmiddle tdinputlogin" style="min-width: 450px;">
<!-- <span class="span-icon-user">-->
<span class="span" style="padding-left: 5px" >Email Address</span>
<input type="text" maxlength="255" placeholder="<?php echo $langs->trans("Email Address"); ?>" <?php echo $disabled; ?> id="username" name="username" class="input" value="<?php echo dol_escape_htmltag($username); ?>" tabindex="1" />
</div>
</div>
<!-- <div class="trinputlogin">
	<div class="tagtd nowraponall center valignmiddle tdinputlogin" style="min-width: 482px;">
		<span class="span">Select Company</span>
		<select class="input" name="company" id="company" style="display: block; width: 100%;height: calc(2.15rem + 2px);">
            <option value="">Select Company</option>
            <option value="22">JL Industry</option>
            <option value="24">MeGoMega Ptd Ltd</option>
            <option value="39">JLDesigns</option>
            <option value="40">BioMedix Singapore Pte Ltd</option>
            <option value="42">Bona Tech</option>
            <option value="44">N-test</option>
            <option value="49">MeGoMega Pte Ltd</option>
            <option value="56">Gustin</option>
            <option value="58">Singroll Pte Ltd</option>
            <option value="62">TGB</option>
            <option value="64">Coach Masters Academy</option>
            <option value="65">ROSELTD</option>
            <option value="68">SUNNY LTD</option>
            <option value="69">New Testing</option>
            <option value="74">ROSE2</option>            					  
        </select>
	</div>
</div> -->
<?php
if (!empty($captcha)) {
	// Add a variable param to force not using cache (jmobile)
	// $php_self = preg_replace('/[&\?]time=(\d+)/', '', $php_self); // Remove param time
	// if (preg_match('/\?/', $php_self)) {
	// 	$php_self .= '&time='.dol_print_date(dol_now(), 'dayhourlog');
	// } else {
	// 	$php_self .= '?time='.dol_print_date(dol_now(), 'dayhourlog');
	// }
	// TODO: provide accessible captcha variants
	?>
	<!-- Captcha -->
	<!-- <div class="trinputlogin">
	<div class="tagtd tdinputlogin nowrap none valignmiddle">

	<span class="fa fa-unlock"></span>
	<span class="nofa inline-block">
	<input id="securitycode" placeholder="<?php echo $langs->trans("SecurityCode"); ?>" class="flat input-icon-security width125" type="text" maxlength="5" name="code" tabindex="3" autocomplete="off" />
	</span>
	<span class="nowrap inline-block">
	<img class="inline-block valignmiddle" src="<?php echo DOL_URL_ROOT ?>/core/antispamimage.php" border="0" width="80" height="32" id="img_securitycode" />
	<a class="inline-block valignmiddle" href="<?php echo $php_self; ?>" tabindex="4"><?php echo $captcha_refresh; ?></a>
	</span>

	</div></div> -->
	<?php
}

if (!empty($morelogincontent)) {
	if (is_array($morelogincontent)) {
		foreach ($morelogincontent as $format => $option) {
			if ($format == 'table') {
				echo '<!-- Option by hook -->';
				echo $option;
			}
		}
	} else {
		echo '<!-- Option by hook -->';
		echo $morelogincontent;
	}
}
?>

</div>

</div> <!-- end div login_right -->

</div> <!-- end div login_line1 -->


<div id="login_line2" style="clear: both;margin-top: -20px;">

<!-- Button "Regenerate and Send password" -->
<br>
<!--
<input type="submit" <?php echo $disabled; ?> class="button small" name="button_password" value="<?php echo $langs->trans('SendNewPassword'); ?>" tabindex="4" />
-->
<?php 
   $urlsp ="https://bona.com.sg/";
   //echo dol_escape_htmltag($urlsp)
?>
<style>
.disablehover:hover{
	border: 0px !important;
}
.captcha {
	font-family: Century Gothic;
    font-size: 14px !important;
    display: block;
    font-weight: 700;
    text-align: left;
}
</style>
<div class="login_right lr" >
<label for="Captcha" class="hidden captcha" ><?php echo $langs->trans("Captcha"); ?></label>
</div>
<div id="login-submit-wrapper">
    <div class="recaptcha">
	  	
		<div class="g-recaptcha" data-sitekey="6Lel4Z4UAAAAAOa8LO1Q9mqKRUiMYl_00o5mXJrR" data-callback="enableBtn"></div>
	</div>
    <div class="btn-fg">
		<button type="submit" class=""  style="border-radius: 5px;background-color: #0178c8 !important;border-color: #0178c8 !important; color:white;display:block;padding: 0.25rem 0.5rem;width:90px;margin-bottom:10px;width:145px;height:45px;margin-bottom:10px;font-size: large;" value="&nbsp; <?php echo $langs->trans('SendNewPassword'); ?> &nbsp;" tabindex="4" id="btn_pass" name="button_password" >Verify</button>
		<!-- <button type="submit" class="" style="border-radius: 5px;background-color: #343a40 !important;border-color: #343a40 !important; color:white;display:block;padding: 0.25rem 0.5rem;width:90px;margin-bottom:10px;" value="&nbsp; <?php echo $langs->trans('Support'); ?> &nbsp;" tabindex="5" ><a class="disablehover" style="color:#ffffff" href="<?php echo dol_escape_htmltag($urlsp) ?>" target="_blank">Support</a></button> -->
			<?php
			$moreparam = '';
			if (!empty($conf->dol_hide_topmenu)) {
				$moreparam .= (strpos($moreparam, '?') === false ? '?' : '&').'dol_hide_topmenu='.$conf->dol_hide_topmenu;
			}
			if (!empty($conf->dol_hide_leftmenu)) {
				$moreparam .= (strpos($moreparam, '?') === false ? '?' : '&').'dol_hide_leftmenu='.$conf->dol_hide_leftmenu;
			}
			if (!empty($conf->dol_no_mouse_hover)) {
				$moreparam .= (strpos($moreparam, '?') === false ? '?' : '&').'dol_no_mouse_hover='.$conf->dol_no_mouse_hover;
			}
			if (!empty($conf->dol_use_jmobile)) {
				$moreparam .= (strpos($moreparam, '?') === false ? '?' : '&').'dol_use_jmobile='.$conf->dol_use_jmobile;
			}

			print '<a class="alogin" style="color:#0178c8;font-family: Century Gothic;font-size: 14px !important;display: block;font-weight: 700 !important;" href="'.$dol_url_root.'/index.php'.$moreparam.'">'.$langs->trans('BackToLoginPage').'</a>';
			?>
	</div>
</div>
</div>

</div>

</form>

<div style="max-width:570px;background-color:white;margin:auto;">
    <div>
  	 <a href="https://bona.com.sg/" target="_blank" style="color: #343a40;font-weight: bold;font-size: .875rem;">Bona ERP by Bona Technologies</a>
  	</div>
	<div>
		<img src="<?php echo DOL_URL_ROOT."/theme/berp3_login_footer.png"?>" alt="" class="img-fluid">
	</div>
</div>
<div class="center login_main_home divpasswordmessagedesc paddingtopbottom<?php echo empty($conf->global->MAIN_LOGIN_BACKGROUND) ? '' : ' backgroundsemitransparent boxshadow'; ?>" style="max-width: 70%">
<?php if ($mode == 'berp3' || !$disabled) { ?>
	<span class="passwordmessagedesc">
	<?php echo $langs->trans('SendNewPasswordDesc'); ?>
	</span>
<?php } else { ?>
	<div class="warning center">
	<?php echo $langs->trans('AuthenticationDoesNotAllowSendNewPassword', $mode); ?>
	</div>
<?php } ?>
</div>


<br>

<?php if (!empty($message)) { ?>
	<div class="center login_main_message">
	<?php echo dol_htmloutput_mesg($message, '', '', 1); ?>
	</div>
<?php } ?>


<!-- Common footer is not used for passwordforgotten page, this is same than footer but inside passwordforgotten tpl -->

<?php
if (!empty($conf->global->MAIN_HTML_FOOTER)) {
	print $conf->global->MAIN_HTML_FOOTER;
}

if (!empty($morelogincontent) && is_array($morelogincontent)) {
	foreach ($morelogincontent as $format => $option) {
		if ($format == 'js') {
			echo "\n".'<!-- Javascript by hook -->';
			echo $option."\n";
		}
	}
} elseif (!empty($moreloginextracontent)) {
	echo '<!-- Javascript by hook -->';
	echo $moreloginextracontent;
}

// Google Analytics
// TODO Add a hook here
if (!empty($conf->google->enabled) && !empty($conf->global->MAIN_GOOGLE_AN_ID)) {
	$tmptagarray = explode(',', $conf->global->MAIN_GOOGLE_AN_ID);
	foreach ($tmptagarray as $tmptag) {
		print "\n";
		print "<!-- JS CODE TO ENABLE for google analtics tag -->\n";
		print "
					<!-- Global site tag (gtag.js) - Google Analytics -->
					<script async src=\"https://www.googletagmanager.com/gtag/js?id=".trim($tmptag)."\"></script>
					<script>
					window.dataLayer = window.dataLayer || [];
					function gtag(){dataLayer.push(arguments);}
					gtag('js', new Date());

					gtag('config', '".trim($tmptag)."');
					</script>";
		print "\n";
	}
}

// TODO Replace this with a hook
// Google Adsense (need Google module)
if (!empty($conf->google->enabled) && !empty($conf->global->MAIN_GOOGLE_AD_CLIENT) && !empty($conf->global->MAIN_GOOGLE_AD_SLOT)) {
	if (empty($conf->dol_use_jmobile)) {
		?>
	<div class="center"><br>
		<script><!--
			google_ad_client = "<?php echo $conf->global->MAIN_GOOGLE_AD_CLIENT ?>";
			google_ad_slot = "<?php echo $conf->global->MAIN_GOOGLE_AD_SLOT ?>";
			google_ad_width = <?php echo $conf->global->MAIN_GOOGLE_AD_WIDTH ?>;
			google_ad_height = <?php echo $conf->global->MAIN_GOOGLE_AD_HEIGHT ?>;
			//-->
		</script>
		<script	src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script>
	</div>
		<?php
	}
}
?>


</div>
</div>	<!-- end of center -->

<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script>
	function enableBtn(){
   		document.getElementById("btn_pass").disabled = false;
    }
</script>
</body>
</html>
<!-- END PHP TEMPLATE -->
