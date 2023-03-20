<?php

namespace Core\Controller;


class Controller {


	protected $viewPath;
	protected $template;


	public function render($view, $variables = []) {
		ob_start();
		extract($variables);
		require($this->viewPath . str_replace('.', '/', $view) . '.php');
		$content = ob_get_clean();
		require($this->viewPath . 'templates/' . $this->template . '.php');
	}

	
	protected function notFound() {
		header("HTTP/1.0 404 Not Found");
		header("Page not Found");
	}


	protected function forbidden() {
		header("HTTP/1.0 403 Forbidden");
		die('Accès interdit');
	}
}