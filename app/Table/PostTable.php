<?php
namespace App\Table;


use \Core\Table\Table;


class PostTable extends Table {


	protected $table = 'articles';


	/**
	 * Récupère les derniers articles
	 */
	public function last() {
		return $this->query(
			"SELECT articles.id, articles.titre, articles.contenu, articles.datet, categories.titre as categorie
			FROM articles
			LEFT JOIN categories ON category_id = categories.id
			ORDER BY articles.datet DESC
		", null);
	}


	/**
	 * Récupère les derniers articles en lien avec une catégorie
	 * @param $category_id int
	 * @return Entity
	 */
	public function findWithCategory($id) {
		return $this->query(
			"SELECT articles.id, articles.titre, articles.contenu, categories.titre as categorie, categories.id as category_id
			FROM " . $this->table . "
			LEFT JOIN  categories ON category_id = categories.id
			WHERE articles.id = ?
			", [$id], true);
	}


	/**
	 * Récupère les derniers articles en lien avec une catégorie
	 * @param $category_id int
	 * @return \App\Entity\PostEntity
	 */
	public function lastByCategory($category_id) {
		return $this->query(
			"SELECT articles.id, articles.titre, articles.contenu, categories.titre as categorie 
				FROM articles 
					LEFT JOIN  categories ON category_id = categories.id
				WHERE category_id = ?
				ORDER BY articles.datet DESC
			",
			[$category_id],
			false);
	}
}