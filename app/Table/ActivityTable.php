<?php
namespace App\Table;


use App\Entity\ActivityEntity;
use Core\Table\Table;


class ActivityTable extends Table {


	protected $table = 'activity';
	protected $query = "call SEARCH_ACTIVITY(?)";


	/**
	 * @param int|null $id
	 * @return ActivityEntity[]
	 */
	public function get($id = null): array {
		return $this->find($id);
	}


	/** Get one record from a table
	 * Override the parent method to fetch several records
	 * @param $id int - id of the record to be fetched
	 * @return array
	 */
	public function find($id) {
		$upper_table = strtoupper($this->table);
		return $this->query(
			"call DETAILS_{$upper_table}(?)",
			[$id],
			false
		);
	}
}