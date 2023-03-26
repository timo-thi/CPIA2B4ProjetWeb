<?php
namespace App\Controller;


use \App\Table\OfferTable;

use \App\Table\SkillsTable;

use \App\Table\CompanyTable;

use \App\Table\ActivityTable;

use \App\Table\LocalitiesTable;

use \App\Table\RateTable;

use \App\Table\PilotTable;

use \App\Table\StudentTable;

use App\Table\PromTable;

use App\Table\CandidatureTable;


class ApiController extends AppController {


	public function render($view, $variables = []) {
		$this->template = explode('.', $view)[1];
		$datas = json_encode($variables);
		require ($this->viewPath . 'api/' . $this->template . '.php');
	}
	
	
	public function offer($id) {
		$OfferApi = new OfferTable(\App::getInstance()->getDb());
		$datas = $OfferApi->get($id);
		if (!$datas) {
			return $this->NotFound();
		}
		$SkillsApi = new SkillsTable(\App::getInstance()->getDb());
		$datas->skills = $SkillsApi->get($id);
		$this->render('api.offer', $datas);
	}


	public function company($id) {
		$CompanyApi = new CompanyTable(\App::getInstance()->getDb());
		$datas = $CompanyApi->get($id);
		if (!$datas) {
			return $this->NotFound();
		}
		$ActivityApi = new ActivityTable(\App::getInstance()->getDb());
		$LocalitiesApi = new LocalitiesTable(\App::getInstance()->getDb());
		$RateApi = new RateTable(\App::getInstance()->getDb());
		$datas->activities = $ActivityApi->get($id);
		$datas->localities = $LocalitiesApi->get($id);
		$datas->rates = $RateApi->get($id);
		$this->render('api.company', $datas);
	}


	public function student($id) {
		// $profile = $this->profile($id);
		$StudentApi = new StudentTable(\App::getInstance()->getDb());
		$CandidatureApi = new CandidatureTable(\App::getInstance()->getDb());
		$profile = $StudentApi->get($id);
		if (!$profile) {
			return $this->NotFound();
		}
		$profile->candidatures = $CandidatureApi->find($id);
		$this->render('api.student', $profile);
	}


	public function pilot($id) {
		$ProfileApi = new PilotTable(\App::getInstance()->getDb());
		$profile = $ProfileApi->get($id);
		if (!$profile) {
			return $this->NotFound();
		}
		$promApi = new PromTable(\App::getInstance()->getDb());
		$profile->promos = $promApi->get($id);
		$this->render('api.pilot', $profile);
	}


	public function NotFound() {
		header("HTTP/1.0 404 Not Found");
		$this->render('api.404');
	}


	public function BadRequest() {
		header("HTTP/1.0 400 Bad Request");
		$this->render('api.400');
	}


	public function Unauthorized() {
		header("HTTP/1.0 401 Unauthorized");
		$this->render('api.401');
	}
}
