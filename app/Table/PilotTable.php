<?php
namespace App\Table;

use \App\Entity\PilotEntity;
use \Core\Table\Table;


class PilotTable extends Table {


	protected $table = 'pilots';
	

	public function get($id): PilotEntity | Bool {
		$res = $this->details($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}


	public function search($attributes) {
		$proc_name = "call SEARCH_" . strtoupper($this->table) . "(?, ?)"; // SEARCH one record in table
		return $this->query($proc_name, $attributes);
	}


	public function getPilotCount() {
		$proc_name = "SELECT COUNT(*) AS count FROM profile WHERE id_roles = '2'"; // GET_ACTIVE_OFFER_COUNT
		return $this->query($proc_name, null, true);
	}
}
?>