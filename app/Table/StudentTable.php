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


	public function search($attributes) {
		$proc_name = "call SEARCH_" . strtoupper($this->table) . "(?, ?)"; // SEARCH one record in table
		return $this->query($proc_name, $attributes);
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


	public function getStudentCount() {
		$proc_name = "SELECT COUNT(*) AS count FROM profile WHERE id_roles = '3'"; // GET_ACTIVE_OFFER_COUNT
		return $this->query($proc_name, null, true);
	}
}
?>