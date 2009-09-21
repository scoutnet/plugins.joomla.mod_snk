<?php
// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
 
// Include the syndicate functions only once
//require_once( dirname(__FILE__).DS.'helper.php' );
require_once(JPATH_SITE.DS.'components'.DS.'com_snk'.DS.'models'.DS.'snk.php');
 
try {
	$helper = new SnkModelSnk();
	$events = $helper->getEvents($params);
	$kalenders = $helper->getKalenders($params);
	require( JModuleHelper::getLayoutPath( 'mod_snk' ) );
} catch (Exception $e) {
	echo "<span class='termin'>zZ ist der Scoutnet Kalender down.<br>Bitte versuch es zu einem sp&auml;teren Zeitpunkt noch mal</span>";
}

?>
