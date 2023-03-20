<?php
namespace App\Entity;
use Core\Entity\Entity;


class CategoryEntity extends Entity {
	

	public function getUrl() {
		return 'index.php?p=posts.category&id=' . $this->id;
	}


	public function getCategorie() {
		$html = '<p>' . substr($this->contenu, 0, 100) . '...</p>';
		$html .= '<p><a href="' . $this->getUrl() . '">Voir la suite</a></p>';
		return $html;
	}


	public function getContenu() {
		$html = '<p>' . substr($this->contenu, 0, 100) . '...</p>';
		$html .= '<p><a href="' . $this->getUrl() . '">Voir la suite</a></p>';
		return $html;
	}
}