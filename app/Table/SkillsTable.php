<?php
namespace App\Table;


use App\Entity\SkillsEntity;
use Core\Table\Table;


class SkillsTable extends Table {

	
	protected $table = 'skills';
	protected $api_query = "call SEARCH_SKILLS(?)";

	public function get($id): array {
		$res = $this->query($this->api_query, [$id]);
		if (empty($res)) {
			return false;
		}
		return $res;
	}
}