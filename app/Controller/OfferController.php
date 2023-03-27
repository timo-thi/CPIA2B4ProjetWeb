<?php
namespace App\Controller;


use App\Table\OfferTable;
use App\Table\CompanyTable;
use App\Table\SkillsTable;
use App\Table\LocalitiesTable;
use App\Table\RequireTable;
use App\Table\ActivityTable;


class OfferController extends AppController {


	public OfferTable $Offer;
	public CompanyTable $Company;
	public SkillsTable $Skills;
	public LocalitiesTable $Localities;
	public RequireTable $Require;
	public ActivityTable $Activity;


	/** Contructor
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Offer');
		$this->loadModel('Company');
		$this->loadModel('Skills');
		$this->loadModel('Localities');
		$this->loadModel('Require');
		$this->loadModel('Activity');
	}


	/** Offer search page
	 * @return void
	 */
	public function index() {
		$annonces = $this->Offer->search();
		if (empty($annonces)){
			$this->notFound();
		}
		// echo '<pre>', var_dump($annonces), '</pre>';
		$first = $this->Offer->details($annonces[0]->id_offer)[0];
		$first->skills = $this->Skills->find($annonces[0]->id_offer);
		$this->render('offer.index', compact('annonces', 'first'));
	}


	public function create() {
		$errors = false;
		if (isset($_POST['title'], $_POST['description'], $_POST['startdate'], $_POST['period'], $_POST['locality'], $_POST['email'], $_POST['tel'], $_POST['wage'], $_POST['activity'], $_POST['visibility'], $_POST['skills'])) {
			$result = $this->Offer->create([
				$_POST['title'],
				$_POST['visibility'],
				$_POST['startdate'],
				$_POST['period'],
				$_POST['amount'],
				$_POST['wage'],
				$_POST['description'],
				$_POST['email'],
				$_POST['tel'],
				$_POST['locality'],
				$_POST['activity']
			]);
			if (!empty($_POST['skills'])) {
				$requirement = $_POST['skills'];
				foreach ($requirement as $id_skill) {
					if ($id_skill == "0"){
						continue;
					}
					$this->Require->create([
						$id_skill,
						$result[0]->id_offer
					]);
				}
			}
			// $_POST['skills'];
			if ($result) {
				return $this->index(); // Rediriger vers entreprises avec filtre sur l'entreprise concernée
			}
		}
		if (isset($_GET['id'])) {
			$company = $this->Company->details($_GET['id'])[0];
			$localities = $this->Localities->find($_GET['id']); // TODO: find all localities or reorganise offer creation
			$activities = $this->Activity->find($_GET['id']);
			$skills = $this->Skills->all();
		} else {
			return $this->notFound();
		}
		$this->render('offer.create', compact('localities', 'activities', 'skills', 'company', 'errors'));
	}
	
	
	public function edit() {
		$errors = false;
		if (isset($_POST['Supprimer'])) {
			return $this->delete();
		}
		if (isset($_POST['title'], $_POST['description'], $_POST['startdate'], $_POST['period'], $_POST['locality'], $_POST['email'], $_POST['tel'], $_POST['wage'], $_POST['activity'], $_POST['visibility'], $_POST['skills'])) {
			$result = $this->Offer->create([
				$_POST['title'],
				$_POST['visibility'],
				$_POST['startdate'],
				$_POST['period'],
				$_POST['amount'],
				$_POST['wage'],
				$_POST['description'],
				$_POST['email'],
				$_POST['tel'],
				$_POST['locality'],
				$_POST['activity']
			]);
			if (!empty($_POST['skills'])) {
				$requirement = $_POST['skills'];
				foreach ($requirement as $id_skill) {
					if ($id_skill == "0"){
						continue;
					}
					$this->Require->create([
						$id_skill,
						$result[0]->id_offer
					]);
				}
			}
			// $_POST['skills'];
			if ($result) {
				return $this->index();
			}
		}
		if (isset($_GET['id'])) {
			$offer = $this->Offer->details($_GET['id'])[0];
			$company = $this->Company->details($_GET['id'])[0];
			$localities = $this->Localities->find($_GET['id']); // TODO: find all localities or reorganise offer creation
			$activities = $this->Activity->find($_GET['id']);
			$skills = $this->Skills->all();
		} else {
			return $this->notFound();
		}
		$this->render('offer.create', compact('localities', 'activities', 'skills', 'company', 'offer', 'errors'));
	}


	public function delete() {
		if (isset($_POST['delete'])) {
			$result = $this->Offer->delete($_POST['id_offer']);
			return $this->index();
		}
	}
}