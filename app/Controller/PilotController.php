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
}