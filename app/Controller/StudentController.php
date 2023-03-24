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
		$annonces = $this->Student->search();
		if (empty($annonces)){
			$this->notFound();
		}
		var_dump($annonces);
		// $first = $this->Student->details($annonces[0]->id_offer)[0];
		$this->render('offer.index', compact('annonces', 'first'));
	}
}