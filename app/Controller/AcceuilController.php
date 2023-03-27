<?php
namespace App\Controller;


use App\Table\OfferTable;
use App\Table\CompanyTable;


class AcceuilController extends AppController {


	public OfferTable $Offer;
	public CompanyTable $Company;


	/** Contructor
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Offer');
		$this->loadModel('Company');
	}


	/** Offer search page
	 * @return void
	 */
	public function index() {
		$offer = $this->Offer->search();
		if (empty($offer)){
			$this->notFound();
		}
		// echo '<pre>', var_dump($offer), '</pre>';
		

		$comp = $this->Company->search();
		if (empty($comp)){
			$this->notFound();
		}
		// echo '<pre class="clair">', var_dump($comp), '</pre>';
	
		$this->render('acceuil.index', compact('comp', 'offer'));
	}
}