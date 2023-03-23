<?php
namespace App\Controller;


use App\Table\OfferTable;


class OfferController extends AppController {


	public OfferTable $Offer;

	public function __construct() {
		parent::__construct();
		$this->loadModel('Offer');
	}


	public function index() {
		$annonces = $this->Offer->search();
		if (empty($annonces)){
			$this->notFound();
		}
		$first = $this->Offer->details($annonces[0]->id_offer)[0];
		// echo '<pre>', var_dump($annonces), '</pre>';
		// echo '<pre>', var_dump($first), '</pre>';
		$this->render('offer.index', compact('annonces', 'first'));
	}


	public function show() {
		$article = $this->Post->findWithCategory($_GET['id']);
		if ($article === false) {
			$this->notFound();
		}
		$this->render('posts.show', compact('article'));
	}
}