<?php
namespace App\Table;

use \App\Entity\PilotEntity;
use \Core\Table\Table;


class PilotTable extends Table {


	protected $table = 'pilots';
	

	public function get($id): PilotEntity | Bool {
		$res = $this->details($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}


	public function create($attributes) {
		return $this->query(
			"call CREATION_PROFILE(?, ?, ?, ?, ?, ?)",
			$attributes,
			true
		);
	}


	public function edit($attributes) {
		return $this->query(
			"call UPDATE_PROFILE(?, ?, ?, ?, ?, ?)",
			$attributes,
			true
		);
	}


	public function edit_password($attributes) {
		return $this->query(
			"call UPDATE_PASSWORD(?, ?)",
			$attributes,
			true
		);
	}


	public function delete($id) {
		return $this->query(
			"call DELETE_PROFILE(?)",
			[$id],
			false
		);
	}
}
?>