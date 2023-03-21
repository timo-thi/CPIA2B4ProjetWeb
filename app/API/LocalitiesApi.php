<?php
namespace App\API;


use App\Entity\LocalitiesEntity;
use Core\Api\Api;


class LocalitiesApi extends Api {


	protected $table = 'activity';
	protected $query = "call SEARCH_LOCALITIES(?)";


	public function get($id = null): array {
		return parent::get($id);
	}
}