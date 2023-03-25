<?php
namespace App\Controller;


use App\Table\OfferTable;
use App\Table\SkillsTable;


class OfferController extends AppController {


	public OfferTable $Offer;
	public SkillsTable $Skills;


	/** Contructor
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Offer');
		$this->loadModel('Skills');
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
}