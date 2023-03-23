<?php
namespace App\Table;

use \App\Entity\OfferEntity;
use \Core\Table\Table;


class OfferTable extends Table {


	protected $table = 'offer';
	

	public function get($id): OfferEntity | Bool {
		$res = $this->find($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}
}
