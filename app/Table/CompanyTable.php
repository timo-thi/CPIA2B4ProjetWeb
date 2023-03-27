<?php
namespace App\Table;


use App\Entity\CompanyEntity;
use Core\Table\Table;


class CompanyTable extends Table {


	protected $table = 'company';


	public function get($id = null): CompanyEntity | Bool {
		$res = $this->find($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}


	public function create($attributes) {
		return $this->query(
			"call CREATE_COMPANY(?, ?, ?, ?, ?, ?, ?, ?)",
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
			"call ADD_LOCALITY(?, ?, ?, ?, ?, ?, ?)",
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
}