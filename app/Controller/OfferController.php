<?php
namespace App\Controller;


use App\Table\OfferTable;


class OfferController extends AppController {


	public OfferTable $Offer;


	/** Contructpr
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Offer');
	}


	/** Offer search page
	 * @return void
	 */
	public function index() {
		$annonces = $this->Offer->search();
		if (empty($annonces)){
			$this->notFound();
		}
		$first = $this->Offer->details($annonces[0]->id_offer)[0];
		$this->render('offer.index', compact('annonces', 'first'));
	}
}