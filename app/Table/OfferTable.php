<?php
namespace App\Table;


use \App\Entity\OfferEntity;
use \Core\Table\Table;


class OfferTable extends Table {


	protected $table = 'offer';


	/**
	 * @param int $id
	 * @return OfferEntity | Bool
	 */
	public function get($id): OfferEntity | Bool {
		$res = $this->details($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}


	public function create($attributes) {
		return $this->query(
			'call CREATION_OFFER(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
			$attributes
		);
	}
}