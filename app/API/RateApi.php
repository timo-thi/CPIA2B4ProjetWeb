<?php
namespace App\API;


use Core\Api\Api;


class RateApi extends Api {


	protected $table = 'rate';
	protected $query = "call SEARCH_RATE(?)";


	public function get($id = null): array {
		return parent::get($id);
	}
}