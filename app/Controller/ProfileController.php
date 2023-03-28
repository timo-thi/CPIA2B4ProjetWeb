<?php
namespace App\Controller;


use App\Table\CandidatureTable;
use App\Table\WishTable;
use App\Table\SkillsTable;
use App\Table\OfferTable;


class ProfileController extends AppController {


	public CandidatureTable $Candidature;
	public WishTable $Wish;
    public SkillsTable $Skills;
    public OfferTable $Offer;


	/** Contructor
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Candidature');
		$this->loadModel('Wish');
        $this->loadModel('Skills');
        $this->loadModel('Offer');
	}


	/** Offer search page
	 * @return void
	 */
	public function candidature() {
		$annonces = $this->Candidature->find($_SESSION['auth']);
		if (empty($annonces)){
			return $this->notFound();
		}
		//echo '<pre>', var_dump($annonces), '</pre>';
		$first = $this->Offer->details($annonces[0]->id_offer)[0];
		$first->skills = $this->Skills->find($annonces[0]->id_offer);
		$first->wished = empty($this->Wish->wished($annonces[0]->id_offer)) ? false : true;
        //echo '<pre>', var_dump($first), '</pre>';
		$this->render('profile.candidature', compact('annonces', 'first'));
	}

    public function wish() {
		$annonces = $this->Wish->find($_SESSION['auth']);
		if (empty($annonces)){
			return $this->notFound();
		}
		//echo '<pre>', var_dump($annonces), '</pre>';
		$first = $this->Offer->details($annonces[0]->id_offer)[0];
		$first->skills = $this->Skills->find($annonces[0]->id_offer);
		$first->wished = empty($this->Wish->wished($annonces[0]->id_offer)) ? false : true;
        //echo '<pre>', var_dump($first), '</pre>';
		$this->render('profile.wish', compact('annonces', 'first'));
	}
}