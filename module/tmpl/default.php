<?php // no direct access
defined( '_JEXEC' ) or die( 'Restricted access' ); ?>

<?php JHTML::_('stylesheet', 'kalender.css', 'modules/mod_snk/assets/'); ?>


<table>
<? 
foreach ($events as $event) { ?>
<tr>
	<td class='snk_termin_date'><? echo strftime("%d.%m.%y",$event['Start']); ?></td>
	<td class='snk_termin_text'><? echo (($link != "")?"<a href='".$link."'>":"").$event['Title'].(($link!="")?"</a>":"");?></td>
</tr>
<?}?>
</table>
