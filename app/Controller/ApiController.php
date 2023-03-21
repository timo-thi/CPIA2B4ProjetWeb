<?php
namespace App\Controller;


use \App\API\OfferApi;
use \App\API\SkillsApi;
use \App\API\CompanyApi;
use \App\API\ActivityApi;
use \App\API\LocalitiesApi;
use \App\API\RateApi;


class ApiController extends AppController {


	public function render($view, $variables = []) {
		$this->template = explode('.', $view)[1];
		$datas = json_encode($variables);
		require ($this->viewPath . 'api/' . $this->template . '.php');
	}
	
	
	public function offer($id) {
		$OfferApi = new OfferApi();
		$datas = $OfferApi->get($id);
		if (!$datas) {
			return $this->NotFound();
		}
		$SkillsApi = new SkillsApi();
		$datas->skills = $SkillsApi->get($id);
		$this->render('api.offer', $datas);
	}
	
	
	public function company($id) {
		$CompanyApi = new CompanyApi();
		$datas = $CompanyApi->get($id);
		if (!$datas) {
			return $this->NotFound();
		}
		$ActivityApi = new ActivityApi();
		$LocalitiesApi = new LocalitiesApi();
		$RateApi = new RateApi();
		$datas->activities = $ActivityApi->get($id);
		$datas->localities = $LocalitiesApi->get($id);
		$datas->rates = $RateApi->get($id);
		$this->render('api.company', $datas);
	}


	public function student($id) {
		
	}


	public function NotFound() {
		header("HTTP/1.0 404 Not Found");
		$this->render('api.404');
	}
}