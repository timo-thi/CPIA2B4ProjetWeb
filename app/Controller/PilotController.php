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
		$profiles = $this->Pilot->search();
		if (empty($profiles)){
			$this->notFound();
		}
		$this->render('pilot.index', compact('profiles'));
	}
}