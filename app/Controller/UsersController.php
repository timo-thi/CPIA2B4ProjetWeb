<?php
namespace App\Controller;
use \Core\Auth\DBAuth;
use \Core\HTML\BootstrapForm;
use App\Table\UserTable;


class UsersController extends AppController {

	/**
	 * @param $username
	 * @param $password
	 * @return bool
	 */
	public function login() {
		$errors = false;
		if (!empty($_POST)) {
			$auth = new DBAuth(\App::getInstance()->getDb());
			if ($auth->login($_POST['username'], $_POST['password'])) {
				if ($_SESSION['role'] == 1){
					header('Location: index.php?p=offer.index'); // changer les pages
				} elseif ($_SESSION['role'] == 2){
					header('Location: index.php?p=pilot.index'); // changer les pages
				} elseif ($_SESSION['role'] == 3){
					header('Location: index.php?p=student.index'); // changer les pages
				} else {
					echo 'Profil non trouvé, veuillez contacter un administrateur';
				}
			}
			else {
				$errors = true;
			}
		}
		//$role = $this->User->details()[3];
		//echo '<pre>', var_dump($role), '</pre>';
		$form = new BootstrapForm($_POST);
		$this->render('users.login', compact('form', 'errors'));
	}

	/** Logout
	 * @return void
	 */
	public function logout(){
		session_destroy();
		$this->login();
	}
}