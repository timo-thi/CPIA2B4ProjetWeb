<?php
namespace Core\Api;


use \App;


class Api {


	protected $table;
	protected $db;
	protected $query;


	public function __construct() {
		if (is_null($this->table)) {
			$this->table = strtolower(str_replace('Api', '', get_class($this)));
		}
		if (is_null($this->query)) {
			$this->query = "call DETAILS_".strtoupper($this->table) . "(?)";
		}
		$this->db = App::getInstance()->getDb();
	}

	
	public function get($id) {
		$class = str_replace('Api', 'Entity', get_class($this));
		return $this->db->prepare($this->query, [$id], str_replace('API', 'Entity', $class));
	}
}