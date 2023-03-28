<?php
namespace App\Table;


use Core\Table\Table;


class RateTable extends Table {


	protected $table = 'rate';
	protected $api_query = "call SEARCH_RATE(?)";


	/**
	 * @param int|null $id
	 * @return RateEntity[]
	 */
	public function get($id = null): array {
		return $this->query($this->api_query, [$id]);
	}

	public function create($attributes) {
		return $this->query(
			'call CREATION_RATE(?, ?, ?, ?)',
			$attributes
		);
	}
}