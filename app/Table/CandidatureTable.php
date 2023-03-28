<?php
namespace App\Table;


use \App\Entity\CandidatureEntity;
use \Core\Table\Table;


class CandidatureTable extends Table {

	protected $table = 'candidature';

	public function create($attributes) {
		return $this->query(
			'call CREATION_CANDIDATURE(?, ?, ?, ?)',
			$attributes,
			true
		);
	}
}