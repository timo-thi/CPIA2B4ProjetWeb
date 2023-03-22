<?php
namespace App\API;

use \App\Entity\ProfileEntity;
use \Core\Api\Api;


class ProfileApi extends Api {


	protected $table = 'profile';
	

	public function get($id): ProfileEntity | Bool {
		$res = parent::get($id);
		if (empty($res)) {
			return false;
		}
		return $res[0];
	}
}
?>