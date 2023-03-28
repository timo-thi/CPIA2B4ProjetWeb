<?php
namespace App\Controller;


use App\Table\OfferTable;
use App\Table\CompanyTable;
use App\Table\SkillsTable;
use App\Table\LocalitiesTable;


class OfferController extends AppController {


	public OfferTable $Offer;
	public CompanyTable $Company;
	public SkillsTable $Skills;
	public LocalitiesTable $Localities;


	/** Contructor
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Offer');
		$this->loadModel('Company');
		$this->loadModel('Skills');
	}


	/** Offer search page
	 * @return void
	 */
	public function index() {
		$items_per_page = 5; // Nombre d'offres par page

		// Connexion à la base de données
		
		// Récupération du nombre total d'offres
		$total_items = $this->Offer->getActiveOfferCount();

		// Calcul du nombre de pages
		$total_pages = ceil($total_items->count / $items_per_page);

		// Récupération du numéro de la page courante
		$current_page = isset($_GET['page']) ? intval($_GET['page']) : 1;

		// Vérification de la validité du numéro de page
		if ($current_page < 1) {
			$current_page = 1;
		} elseif ($current_page > $total_pages) {
			$current_page = $total_pages;
		}

		// Calcul des bornes LIMIT pour la requête SQL
		$offset = ($current_page - 1) * $items_per_page;
		$limit = $items_per_page;

		$annonces = $this->Offer->search([$offset, $limit]);
		if (empty($annonces)){
			$this->notFound();
		}
		// echo '<pre>', var_dump($annonces), '</pre>';
		$first = $this->Offer->details($annonces[0]->id_offer)[0];
		$first->skills = $this->Skills->find($annonces[0]->id_offer);
		$this->render('offer.index', compact('annonces', 'first', 'total_pages', 'current_page'));
	}
}