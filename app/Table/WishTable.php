<?php
namespace App\Table;


use \App\Entity\WishEntity;
use \Core\Table\Table;


class WishTable extends Table {

	protected $table = 'wish';

	public function create($attributes) {
		return $this->query(
			'call CREATION_WISH(?, ?)',
			$attributes
		);
	}


	/** Add or remove wish from wish table
	 * @param $id - offer id
	 */
	public function post($id) {
		$this->create([
			$_SESSION['auth'],
			$id
		]);
	}


	public function wished($id) {
		return $this->query(
			'SELECT * FROM wish WHERE id_offer = ? AND id_profile = ?',
			[$id, $_SESSION['auth']]
		);
	}
}