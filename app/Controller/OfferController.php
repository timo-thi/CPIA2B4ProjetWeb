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
		$offers = $this->Offer->search();
		if (empty($offers)){
			$this->notFound();
		}
		$first_offer = $this->Offer->details($offers[0]->id_offer)[0];
		echo '<pre>', var_dump($offers), '</pre>';
		echo '<pre>', var_dump($first_offer), '</pre>';
		$this->render('offer.index', compact('offers', 'first_offer'));
	}


	public function show() {
		$article = $this->Post->findWithCategory($_GET['id']);
		if ($article === false) {
			$this->notFound();
		}
		$this->render('posts.show', compact('article'));
	}
}