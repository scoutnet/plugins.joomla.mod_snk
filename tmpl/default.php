<?php // no direct access
defined( '_JEXEC' ) or die( 'Restricted access' ); ?>

<?php JHTML::_('stylesheet', 'kalender.css', 'modules/mod_snk/assets/'); ?>


<? 
foreach ($events as $event) { ?>
<span class='snk_termin'>
	<span class='snk_termin_date'><? echo strftime("%d.%m.%y",$event['Start']); ?></span>
	<span class='snk_termin_text'><? echo $event['Title'];?></span>
</span>
<?}?>
