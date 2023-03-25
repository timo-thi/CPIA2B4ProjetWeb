<?php
namespace App\Controller;


use App\Table\CandidatureTable;
use App\Table\SkillsTable;


class CandidatureController extends AppController {


	public CandidatureTable $Candidature;
	public SkillsTable $Skills;


	/** Contructor
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->loadModel('Candidature');
		$this->loadModel('Skills');
	}


	/** Offer search page
	 * @return void
	 */
	public function index() {
		$annonces = $this->Candidature->search();
		if (empty($annonces)){
			$this->notFound();
		}
		// echo '<pre>', var_dump($annonces), '</pre>';
		$first = $this->Candidature->find($_SESSION['role']);
		$first->skills = $this->Skills->find($annonces[0]->id_candidature);
		$this->render('profile.candidature', compact('annonces', 'first'));
	}
}