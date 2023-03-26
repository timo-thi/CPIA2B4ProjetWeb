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
			"call CREATE_COMPANY(?, ?, ?, ?, ?, ?, ?, ?)",
			$attributes,
			true
		);
	}
}