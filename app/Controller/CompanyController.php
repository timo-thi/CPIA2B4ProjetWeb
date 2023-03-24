<?php
namespace App\Controller;


use App\Table\CompanyTable;
use App\Table\ActivityTable;
use App\Table\RateTable;
use App\Table\LocalitiesTable;


class CompanyController extends AppController {


	public CompanyTable $Company;
	public ActivityTable $Activity;
	public RateTable $Rate;
	public LocalitiesTable $Localities;


	/** Contructpr
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Company');
		$this->loadModel('Localities');
		$this->loadModel('Rate');
		$this->loadModel('Activity');
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
		$first->activities = $this->Activity->get($annonces[0]->id_company);
		$first->localities = $this->Localities->get($annonces[0]->id_company);
		$first->rates = $this->Rate->get($annonces[0]->id_company);
		// echo '<pre class="clair">', var_dump($first), '</pre>';
		$this->render('company.index', compact('annonces', 'first'));
	}
}