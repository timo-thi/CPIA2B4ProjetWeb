<?php

use \Core\Config;
use Core\Database\MysqlDatabase;
use Core\Table\Table;

class App {


	public $title = 'Grafikart Tutorials';
	private static $_instance;
	private $db_instance;


	public static function getInstance(): self{
		if (is_null(self::$_instance)) {
			self::$_instance = new App();
		}
		return self::$_instance;
	}


	public static function load(){
		session_start();
		require ROOT . 'app/Autoloader.php';
		App\Autoloader::register();
		require ROOT . 'core/Autoloader.php';
		Core\Autoloader::register();
	}


	public function getTable($name): Table {
		$class_name = '\\App\\Table\\' . ucfirst($name) . 'Table';
		return new $class_name($this->getDB());
	}


	public function getDB() {
		$config = Config::getInstance(ROOT . 'config/config.php');
		if (is_null($this->db_instance)) {
			$this->db_instance = new MysqlDatabase($config->get('db_name'), $config->get('db_user'), $config->get('db_pass'), $config->get('db_host'));
		}
		return $this->db_instance;
	}


	public function setTitle($title) {
		$this->title .= " | $title";
	}
}