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


	public function edit($attributes) {
		return $this->query(
			'call UPDATE_OFFER(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
			$attributes
		);
	}


	public function search($attributes) {
		$proc_name = "call SEARCH_" . strtoupper($this->table) . "(?, ?)"; // SEARCH one record in table
		return $this->query($proc_name, $attributes);
	}


	public function getActiveOfferCount() {
		$proc_name = "SELECT COUNT(*) AS count FROM offer WHERE active = '1' GROUP BY id_offer"; // GET_ACTIVE_OFFER_COUNT
		return $this->query($proc_name, null, true);
	}
}