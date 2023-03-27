<?php
namespace App\Table;

use \Core\Table\Table;

class UserTable extends Table {

	protected $table = 'Profile';

	
	public function edit_password($attributes) {
		return $this->query(
			"call UPDATE_PASSWORD(?, ?)",
			$attributes,
			true
		);
	}
	
}