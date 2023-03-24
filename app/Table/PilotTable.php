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
}
?>