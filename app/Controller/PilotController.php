<?php
namespace App\Controller;


use App\Table\PilotTable;
use App\Table\PromTable;


class PilotController extends AppController {


	public PilotTable $Pilot;
	public PromTable $Prom;


	/** Contructpr
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Pilot');
		$this->loadModel('Prom');
	}


	/** Offer search page
	 * @return void
	 */
	public function index() {
		$items_per_page = 6; // Nombre de pilotes par page

		// Récupération du nombre total d'offres
		$total_items = $this->Pilot->getPilotCount()->count;

		// Calcul du nombre de pages
		$total_pages = ceil($total_items / $items_per_page);

		// Récupération du numéro de la page courante
		$current_page = isset($_GET['page']) ? intval($_GET['page']) : 1;

		// Vérification de la validité du numéro de page
		if ($current_page < 1 || $current_page > $total_pages) {
			$current_page = 1;
		}

		// Calcul des bornes LIMIT pour la requête SQL
		$profiles = $this->Pilot->search([
			($current_page - 1) * $items_per_page,
			$items_per_page
		]);
		if (empty($profiles)){
			$this->notFound();
		}
		$this->render('pilot.index', compact('profiles', 'total_pages', 'current_page'));
	}


	public function create() {
		$errors = false;
		if (isset($_POST['lname'], $_POST['fname'], $_POST['email'], $_POST['pwd'], $_POST['conf'], $_POST['role'], $_POST['prom'])) {
			if ($_POST['pwd'] != $_POST['conf'] || $_POST['pwd'] == '' || $_POST['conf'] == '') {
				$errors = true;
			} else {
				$result = $this->Pilot->create([
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
		if (isset($_POST['delete'])) {
			return $this->delete();
		} elseif (isset($_POST['edit'])) {
			if (isset($_POST['lname'], $_POST['fname'], $_POST['id_profile'], $_POST['email'], $_POST['pwd'], $_POST['conf'], $_POST['prom'])) {
				if ($_POST['pwd'] != $_POST['conf']) {
					$errors = true;
				} elseif ($_POST['pwd'] == $_POST['conf'] && $_POST['pwd'] != '') {
					$p_result = $this->Pilot->edit_password([
						$_GET['id'],
						sha1($_POST['pwd'])
					]);
				} else {
					$result = $this->Pilot->edit([
						$_POST['lname'],
						$_POST['fname'],
						2,
						$_POST['email'],
						$_GET['id'],
						$_POST['prom']
					]);
					return $this->index();
				}
			}
		}
		if (isset($_GET['id'])) {
			$profile = $this->Pilot->details($_GET['id']);
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
		if (isset($_POST['delete'])) {
			$result = $this->Pilot->delete($_POST['id_profile']);
			return $this->index();
		}
	}
}