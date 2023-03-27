<?php
namespace App\Table;

use Core\Table\Table;


class RequireTable extends Table {


	protected $table = 'requires';


	public function create($attributes) {
		return $this->query(
			"call CREATION_REQUIRES(?, ?)",
			[$attributes]
		);
	}
}