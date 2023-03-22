<?php
namespace App\Table;


use App\Entity\PromEntity;
use Core\Table\Table;


class PromTable extends Table {


	protected $table = 'prom';


	/**
	 * @param int $id
	 * @return PromEntity | Bool
	 */
	public function get($id = null): array {
		return $this->find($id);
	}
}