<?php
namespace App\API;

use \App\Entity\OfferEntity;
use \Core\Api\Api;


class OfferApi extends Api {


	protected $table = 'offer';
	

	public function get($id): OfferEntity | Bool {
		$res = parent::get($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}
}
?>