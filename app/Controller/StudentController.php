<?php
namespace App\Controller;


use App\Table\StudentTable;
use App\Table\PromTable;


class StudentController extends AppController {


	public StudentTable $Student;
	public PromTable $Prom;


	/** Contructpr
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Prom');
		$this->loadModel('Student');
	}


	/** Offer search page
	 * @return void
	 */
	public function index() {
		$profiles = $this->Student->search();
		if (empty($profiles)){
			$this->notFound();
		}
		// echo '<pre>', var_dump($profiles), '</pre>';
		$this->render('student.index', compact('profiles'));
	}


	public function create() {
		$errors = false;
		if (isset($_POST['lname'], $_POST['fname'], $_POST['email'], $_POST['pwd'], $_POST['conf'], $_POST['role'], $_POST['prom'])) {
			if ($_POST['pwd'] != $_POST['conf'] || $_POST['pwd'] == '' || $_POST['conf'] == '') {
				$errors = true;
			} else {
				$result = $this->Student->create([
					$_POST['lname'],
					$_POST['fname'],
					$_POST['role'],
					$_POST['email'],
					sha1($_POST['pwd']),
					$_POST['prom']
				]);
				if ($result) {
					return $this->index();
				}
			}
		}
		$promos = $this->Prom->all();
		$this->render('users.create', compact('promos' , 'errors'));
	}


	public function edit() {
		$errors = false;
		if (isset($_POST['lname'], $_POST['fname'], $_POST['id_profile'], $_POST['email'], $_POST['pwd'], $_POST['conf'], $_POST['prom'])) {
			if ($_POST['pwd'] != $_POST['conf']) {
				$errors = true;
			} elseif ($_POST['pwd'] == $_POST['conf'] && $_POST['pwd'] != '') {
				$p_result = $this->Student->edit_password([
					$_GET['id'],
					sha1($_POST['pwd'])
				]);
			} else {
				$result = $this->Student->edit([
					$_POST['lname'],
					$_POST['fname'],
					3,
					$_POST['email'],
					$_GET['id'],
					$_POST['prom']
				]);
				if ($result) {
					return $this->index();
				}
			}
		}
		if (isset($_GET['id'])) {
			$profile = $this->Student->details($_GET['id']);
			if (empty($profile)){
				return $this->notFound();
			}
			$profile = $profile[0];
			// echo '<pre>', var_dump($profile), '</pre>';
		} else {
			return $this->index();
		}
		$promos = $this->Prom->all();
		$this->render('users.edit', compact('promos', 'profile' , 'errors'));
	}


	public function delete() {
		if (isset($_GET['id'])) {
			$result = $this->Student->delete($_GET['id']);
			if ($result) {
				return $this->index();
			}
		}
	}
}