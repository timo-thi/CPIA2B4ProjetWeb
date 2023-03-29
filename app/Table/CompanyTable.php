<?php
namespace App\Table;


use App\Entity\CompanyEntity;
use Core\Table\Table;


class CompanyTable extends Table {


	protected $table = 'company';


	public function get($id = null): CompanyEntity | Bool {
		$res = $this->details($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}


	public function create($attributes) {
		return $this->query(
			"call CREATE_COMPANY(?, ?, ?)",
			$attributes,
			true
		);
	}

	public function edit($attributes) {
		return $this->query(
			"call UPDATE_COMPANY(?, ?, ?, ?)",
			$attributes,
			true
		);
	}


	public function add($attributes) {
		return $this->query(
			"call ADD_LOCALITY(?, ?, ?, ?, ?, ?)",
			$attributes,
			true
		);
	}

	public function delete($id) {
		return $this->query(
			"call DELETE_COMPANY(?)",
			[$id],
			true
		);
	}


	public function search($attributes) {
		$proc_name = "call SEARCH_" . strtoupper($this->table) . "(?, ?)"; // SEARCH one record in table
		return $this->query($proc_name, $attributes);
	}


	public function getActiveCompanyCount() {
		$proc_name = "SELECT COUNT(*) AS count FROM company WHERE active = '1'"; // GET_ACTIVE_COMPANY_COUNT
		return $this->query($proc_name, null, true);
	}
}