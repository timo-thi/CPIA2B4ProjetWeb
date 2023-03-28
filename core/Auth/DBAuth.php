<?php
namespace Core\Auth;


use Core\Database\Database;


class DBAuth {


	/**
	 * @var mixed(Database, MysqlDatabase)
	 */
	private $db;


	public function __construct(Database $db) {
		$this->db = $db;
	}


	public function getUserId() {
		if ($this->logged()) {
			return $_SESSION['auth'];
		}
		return false;
	}


	/**
	 * @param $username
	 * @param $password
	 * @return bool
	 */
	public function login($username, $password) {	 
		$user = $this->db->prepare('call AUTH(?)', [$username], null, true);
		if ($user) {
			if (sha1($password) === $user->password) { //ajouter sha1() pour crypter le password
				$profile = \App::getInstance()->getTable('User');
				$role = $profile->details($user->id_profile)[0];
				//var_dump($role);
				$_SESSION['auth'] = $user->id_profile;
				$_SESSION['user'] = $username;
				$_SESSION['role'] = $role->id_roles;
				return true;
			}
		}
		return false;
	}


	/**
	 * @return bool
	 */
	public function logged() {
		return isset($_SESSION['auth']);
	}
}