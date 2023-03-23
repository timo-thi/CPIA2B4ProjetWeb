<?php
define('ROOT', dirname(__DIR__) . DIRECTORY_SEPARATOR);
require ROOT . 'app/App.php';
App::load();

$app = App::getInstance();

$apicontroller = new \App\Controller\ApiController();

try {
	if (isset($_GET['t'])) {
		$args = explode('.', $_GET['t']);
		if (count($args) > 1) {
			$action = $args[0];
			$id = $args[1];
			return $apicontroller->$action($id);
		}
	}
} catch (\Throwable $th) {
	return $apicontroller->BadRequest();
}