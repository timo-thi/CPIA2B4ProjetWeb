<?php
namespace App\Controller;
use \Core\Auth\DBAuth;
use \Core\HTML\BootstrapForm;
use App\Table\UserTable;


class UsersController extends AppController {


	public UserTable $User;


	/** Contructpr
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('User');
	}



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
					header('Location: index.php?p=acceuil.index'); // changer les pages
				} elseif ($_SESSION['role'] == 2){
					header('Location: index.php?p=acceuil.index'); // changer les pages
				} elseif ($_SESSION['role'] == 3){
					header('Location: index.php?p=acceuil.index'); // changer les pages
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


	public function settings(){
		$errors = false;
		$errors2 = false;
		$verif = $this->User->details($_SESSION['auth']);
		//echo '<pre>', var_dump($verif),'<pre>';
		if (isset($_POST['edit'])) {
			if ((!empty($_POST['pwd'])) && (!empty($_POST['conf'])) && (!empty($_POST['password']))) {
				if ($_POST['password'] == $verif[0]->password) { // ajouter sha1 à $_POST['password'] pour regarder si les 2 mdp sont correctes	
					if ($_POST['pwd'] != $_POST['conf']) {
						$errors = true;
					} elseif ($_POST['pwd'] == $_POST['conf'] && $_POST['pwd'] != '') {
						$p_result = $this->User->edit_password([
							$_SESSION['auth'],
							sha1($_POST['pwd'])
						]);
					}
				} else {
				$errors2 = true;
				}
			} else {
				$errors = true;
			}
		}
		$this->render('users.settings', compact('errors', 'errors2'));
	}
}