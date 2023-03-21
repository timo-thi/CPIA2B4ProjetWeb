<?php
namespace App\API;


use App\Entity\ActivityEntity;
use Core\Api\Api;


class ActivityApi extends Api {


	protected $table = 'activity';
	protected $query = "call SEARCH_ACTIVITY(?)";


	public function get($id = null): array {
		return parent::get($id);
	}
}