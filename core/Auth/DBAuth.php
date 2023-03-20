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
		$user = $this->db->prepare('SELECT * FROM users WHERE username = ?', [$username], null, true);
		if ($user) {
			if (sha1($password) === $user->password) {
				$_SESSION['auth'] = $user->id;
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