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
		// Configuration
		$items_per_page = 6; // Nombre de pilotes par page

		// Récupération du nombre total d'offres
		$total_items = $this->Company->getActiveCompanyCount()->count;

		// Calcul du nombre de pages
		$total_pages = ceil($total_items / $items_per_page);

		// Récupération du numéro de la page courante
		$current_page = isset($_GET['page']) ? intval($_GET['page']) : 1;

		// Vérification de la validité du numéro de page
		if ($current_page < 1 || $current_page > $total_pages) {
			$current_page = 1;
		}

		// Calcul des bornes LIMIT pour la requête SQL
		
		$annonces = $this->Company->search([
			($current_page - 1) * $items_per_page,
			$items_per_page
		]);
		if (empty($annonces)){
			$this->notFound();
		}
		$first = $this->Company->details($annonces[0]->id_company)[0];
		$first->activities = $this->Activity->get($annonces[0]->id_company);
		$first->localities = $this->Localities->get($annonces[0]->id_company);
		$first->rates = $this->Rate->get($annonces[0]->id_company);
		// echo '<pre class="clair">', var_dump($first), '</pre>';
		$this->render('company.index', compact('annonces', 'first', 'total_pages', 'current_page'));
	}

	public function create() {
		$annonces = $this->Activity->all();
		$errors = false;
		if (!empty($_POST)) {
			if ((
				!empty($_POST['name'])) &&
				(!empty($_POST['link'])) &&
				(!empty($_POST['city'])) &&
				(!empty($_POST['zipcode'])) &&
				(!empty($_POST['address'])) &&
				(!empty($_POST['number']))
				){
				if (isset(
					$_POST['name'],
					$_POST['link'],
					$_POST['city'],
					$_POST['zipcode'],
					$_POST['address'],
					$_POST['number'],
					$_POST['comment'],
					$_POST['visibility']
					)) {
					$first = $this->Company->create([
						$_POST['name'],
						$_POST['visibility'],
						$_POST['link']
					]);
					for ($i=0;$i<count($_POST['city']);$i++){
						$second = $this->Company->add([
							$_POST['address'][$i],
							$_POST['number'][$i],
							$_POST['comment'][$i],
							$first->id_company,
							$_POST['city'][$i],
							$_POST['zipcode'][$i]
						]);
					}
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
		
		if ((
			!empty($_POST['name'])) &&
			(!empty($_POST['link'])) &&
			(!empty($_POST['city'])) &&
			(!empty($_POST['zipcode'])) &&
			(!empty($_POST['address'])) &&
			(!empty($_POST['number']))
			){
			if (isset(
				$_POST['name'],
				$_POST['link'],
				$_POST['city'],
				$_POST['zipcode'],
				$_POST['address'],
				$_POST['number'],
				$_POST['comment'],
				$_POST['visibility']
				)) {
				$result = $this->Company->edit([
					$_GET['id'],
					$_POST['name'],
					$_POST['visibility'],
					$_POST['link']					
				]);
				$old = $this->Localities->find($_GET['id']);
				$new = $_POST['id_localities'];
				foreach ($old as $value) {
					if (!in_array($value->id_localities, $new)) {
						$this->Localities->delete($value->id_localities);
					}
				}
				$i = 0;
				foreach ($new as $value) {
					if (!in_array($value, $old) || $value == '') {
						$this->Company->add([
							$_POST['address'][$i],
							$_POST['number'][$i],
							$_POST['comment'][$i],
							$_GET['id'][$i],
							$_POST['city'][$i],
							$_POST['zipcode'][$i]
						]);
					}
					$i++;
				}
				return $this->index();
			}
		} else {
			$errors = true;
		}
		if (isset($_GET['id'])) {
			$company = $this->Company->details($_GET['id']);
			// echo '<pre>', var_dump($company), '</pre>';
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

	public function rate(){
		$errors = false;
		if ((!empty($_POST['rate'])) && (!empty($_POST['comment']))){
			if (isset($_POST['rate'],$_POST['comment'])){
				$result = $this->Rate->create([
					$_SESSION['auth'],
					$_GET['id'],
					$_POST['rate'],
					$_POST['comment']
				]);
				if ($result){
					return $this->index();
				}
			}
		} else {
			$errors = true;
		}
		$this->render('company.rate', compact('errors'));
	}
}