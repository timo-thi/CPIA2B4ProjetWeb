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
}