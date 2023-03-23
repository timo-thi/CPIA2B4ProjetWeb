<?php
foreach ($offers as $offer) {
	echo '<div class="offer">';
	echo '<h2>' . $offer->name . '</h2>';
	echo '<p>' . $offer->company . '</p>';
	echo '<p>' . $offer->city . '</p>';
	echo '<p>' . $offer->zipcode . '</p>';
	echo '</div>';
}
?>
<div>
	<h1>first</h1>
	<h2><?= $first_offer->name ?></h2>
	<p><?= $first_offer->company ?></p>
	<p><?= $first_offer->city ?></p>
	<p><?= $first_offer->zipcode ?></p>
</div>