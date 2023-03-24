<?php
namespace App\Controller;


use App\Table\StudentTable;


class StudentController extends AppController {


	public StudentTable $Student;


	/** Contructpr
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
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
		echo '<pre>', var_dump($profiles), '</pre>';
		$this->render('student.index', compact('profiles'));
	}
}