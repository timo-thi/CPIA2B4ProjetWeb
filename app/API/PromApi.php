<?php
namespace App\API;


use App\Entity\PromEntity;
use Core\Api\Api;


class PromApi extends Api {


	protected $table = 'activity';
	protected $query = "call SEARCH_PROM(?)";


	public function get($id = null): array {
		return parent::get($id);
	}
}