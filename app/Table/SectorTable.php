<?php
namespace App\Table;


use \App\Entity\SectorEntity;
use \Core\Table\Table;


class SectorTable extends Table {

	protected $table = 'sector';


	public function create($id_company, $id_activity) {
		return $this->query(
			"call CREATION_SECTOR(?, ?)",
			[$id_company, $id_activity],
			true
		);
	}
}