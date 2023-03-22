<?php
namespace App\Controller;


use \App\Table\OfferTable;

use \App\Table\SkillsTable;

use \App\Table\CompanyTable;

use \App\Table\ActivityTable;

use \App\Table\LocalitiesTable;

use \App\Table\RateTable;

use \App\Table\ProfileTable;

use App\Table\PromTable;


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


	public function profile($id) {
		$ProfileApi = new ProfileTable(\App::getInstance()->getDb());
		$datas = $ProfileApi->get($id);
		return $datas;
	}


	public function student($id) {
		$profile = $this->profile($id);
		if (!$profile) {
			return $this->NotFound();
		}
		if ($profile->id_role == 3) {
			$promApi = new PromTable(\App::getInstance()->getDb());
			$profile->promos = $promApi->get($id);
			$this->render('api.student', $profile);
		} else {
			$this->NotFound();
		}
	}


	public function pilot($id) {
		$profile = $this->profile($id);
		if (!$profile) {
			return $this->NotFound();
		}
		if ($profile->id_role == 2) {
			$promApi = new PromTable(\App::getInstance()->getDb());
			$profile->promos = $promApi->get($id);
			$this->render('api.pilot', $profile);
		} else {
			$this->NotFound();
		}
	}


	public function NotFound() {
		header("HTTP/1.0 404 Not Found");
		$this->render('api.404');
	}
}
