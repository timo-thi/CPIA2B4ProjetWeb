<?php
namespace App\Table;

use \App\Entity\PilotsEntity;
use \Core\Table\Table;


class PilotsTable extends Table {


	protected $table = 'pilots';
	

	public function get($id): PilotsEntity | Bool {
		$res = $this->details($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}
}
?>