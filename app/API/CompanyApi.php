<?php
namespace App\API;


use App\Entity\CompanyEntity;
use Core\Api\Api;


class CompanyApi extends Api {


	protected $table = 'company';


	public function get($id = null): CompanyEntity | Bool {
		$res = parent::get($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}
}