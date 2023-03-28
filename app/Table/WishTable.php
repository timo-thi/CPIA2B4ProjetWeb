<?php
namespace App\Table;


use \App\Entity\WishEntity;
use \Core\Table\Table;


class WishTable extends Table {

	protected $table = 'wish';

	public function create($attributes) {
		return $this->query(
			'call CREATION_WISH(?, ?)',
			$attributes
		);
	}
}