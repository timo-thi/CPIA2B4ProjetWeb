<?php
namespace App\Table;

use \App\Entity\ProfileEntity;
use \Core\Table\Table;


class ProfileTable extends Table {


	protected $table = 'profile';
	

	public function get($id): ProfileEntity | Bool {
		$res = $this->details($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}
}
?>