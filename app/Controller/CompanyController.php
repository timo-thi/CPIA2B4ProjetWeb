<?php
namespace App\Controller;


use App\Table\CompanyTable;
use App\Table\ActivityTable;
use App\Table\RateTable;
use App\Table\LocalitiesTable;
use App\Table\SectorTable;


class CompanyController extends AppController {


	public CompanyTable $Company;
	public ActivityTable $Activity;
	public RateTable $Rate;
	public LocalitiesTable $Localities;
	public SectorTable $Sector;


	/** Contructpr
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Company');
		$this->loadModel('Localities');
		$this->loadModel('Rate');
		$this->loadModel('Activity');
		$this->loadModel('Sector');
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

	public function create() {
		$annonces = $this->Activity->all();
		$errors = false;
		if (!empty($_POST)) {
			if ((!empty($_POST['name'])) && (!empty($_POST['link'])) && (!empty($_POST['city'])) && (!empty($_POST['zipcode'])) && (!empty($_POST['address'])) && (!empty($_POST['number']))){
				if (isset($_POST['name'],$_POST['link'],$_POST['city'],$_POST['zipcode'],$_POST['address'],$_POST['number'],$_POST['comment'])) {
					$first = $this->Company->create([$_POST['name'],true,$_POST['link'],$_POST['city'],$_POST['zipcode'],$_POST['address'],$_POST['number'],$_POST['comment']]);
					// echo '<pre>', var_dump($first), '</pre>';
					if (!empty($_POST['sector'])) {
						foreach ($_POST['sector'] as $sector) {
							$second = $this->Sector->create($first->id_company, $sector);
							// echo '<pre>', var_dump($second), '</pre>';
						}
					}
				}
			} else {
				$errors = true;
			}
		}
		$this->render('company.create', compact('annonces', 'errors'));
	}

	public function edit() {
		$errors = false;
		if ((!empty($_POST['name'])) && (!empty($_POST['link'])) && (!empty($_POST['city'])) && (!empty($_POST['zipcode'])) && (!empty($_POST['address'])) && (!empty($_POST['number']))){
			if (isset($_POST['name'],$_POST['link'],$_POST['city'],$_POST['zipcode'],$_POST['address'],$_POST['number'],$_POST['comment'])) {
				$first = $this->Company->search($_GET['id']);
				$result = $this->Company->edit([
					$_GET['id'],
					$_POST['name'],
					true,
					$_POST['link']					
				]);
				$results = $this->Company->add([
					$_POST['address'],
					$_POST['number'],
					$_POST['comment'],
					$result[0]->id_city,
					$_GET['id'],
					$_POST['city'],
					$_POST['zipcode']
				]);
				if ($result) {
					return $this->index();
				}
			}
		} else {
			$errors = true;
		}
		if (isset($_GET['id'])) {
			$company = $this->Company->details($_GET['id']);
			echo '<pre>', var_dump($company), '</pre>';
			if (empty($company)){
				return $this->notFound();
			}
			$company = $company[0];
			$company->activities = $this->Activity->find($_GET['id']);
			for ($i=0;$i<count($company->activities);$i++){
				$company->activities[$i]=$company->activities[$i]->id_activity;
			}
			$company->localities = $this->Localities->find($_GET['id']);
			//echo '<pre>', var_dump($company->localities), '</pre>';
		} else {
			return $this->index();
		}
		$activity = $this->Activity->all();
		$this->render('company.edit', compact('company','activity', 'errors'));
	}
}