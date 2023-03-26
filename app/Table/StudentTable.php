<?php
namespace App\Table;

use \App\Entity\StudentEntity;
use \Core\Table\Table;


class StudentTable extends Table {


	protected $table = 'student';
	

	public function get($id): StudentEntity | Bool {
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
}
?>