<?php
namespace App\API;


use App\Entity\SkillsEntity;
use Core\Api\Api;


class SkillsApi extends Api {

	
	protected $table = 'skills';
	protected $query = "call SEARCH_SKILLS(?)";

	public function get($id): array {
		$res = parent::get($id);
		if (empty($res)) {
			return false;
		}
		return $res;
	}
}