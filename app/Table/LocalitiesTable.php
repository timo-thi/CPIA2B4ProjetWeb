<?php
namespace App\Table;


use App\Entity\LocalitiesEntity;
use Core\Table\Table;


class LocalitiesTable extends Table {


	protected $table = 'localities';
	protected $api_query = "call SEARCH_LOCALITIES(?)";


	/**
	 * @param int|null $id
	 * @return LocalitiesEntity[]
	 */
	public function get($id): array {
		return $this->query($this->api_query, [$id]);
	}
}