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
}