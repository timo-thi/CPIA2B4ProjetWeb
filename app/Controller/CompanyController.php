<?php
namespace App\Controller;


use App\Table\CompanyTable;


class CompanyController extends AppController {


	public CompanyTable $Company;


	/** Contructpr
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Company');
	}


	/** Company search page
	 * @return void
	 */
	public function index() {
		$annonces = $this->Company->search();
		if (empty($annonces)){
			$this->notFound();
		}
		$first = $this->Company->details($annonces[0]->id_company)[0];
		$this->render('company.index', compact('annonces', 'first'));
	}
}