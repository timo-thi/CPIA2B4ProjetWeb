<?php
define('ROOT', dirname(__DIR__) . DIRECTORY_SEPARATOR);
require ROOT . 'app/App.php';
App::load();

$app = App::getInstance();


$apicontroller = new \App\Controller\ApiController();

/**
 * Check if the user is logged in and if he has the right role
 */
// if (!isset($_SESSION['auth'],$_SESSION['role'])) {
// 	return $apicontroller->Unauthorized();
// }

try {
	if (isset($_GET['t'])) {
		$args = explode('.', $_GET['t']);
		if (count($args) > 1) {
			$action = $args[0];
			$id = $args[1];
			return $apicontroller->$action($id);
		}
	} elseif (isset($_POST['wish_id'])) {
		$apicontroller->wish($_POST['wish_id']);
	}
} catch (\Throwable $th) {
	return $apicontroller->BadRequest();
}