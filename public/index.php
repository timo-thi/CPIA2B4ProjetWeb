<?php
define('ROOT', dirname(__DIR__) . DIRECTORY_SEPARATOR);
require ROOT . 'app/App.php';
App::load();

$app = App::getInstance();


/**
 * Check if the page exists
 * If not, redirect to home
 */
if (isset($_SESSION['auth'],$_SESSION['role'])) {
	if (! isset($_GET['p'])) {
		$page = 'offer.index';
	} else {
		$page = $_GET['p'];
	}
} else {
	// $page = 'offer.index';
	$page = 'users.login';
}


$page = explode('.', $page);
if ($page[0] === 'admin') {
	$controller = '\App\Controller\Admin\\' . ucfirst($page[1]) . 'Controller';
	$action = $page[2];
} else {
	$controller = '\App\Controller\\' . ucfirst($page[0]) . 'Controller';
	$action = $page[1];
}
$controller = new $controller();
$controller->$action();