<form action="" method="post">
	<?= $form->input('titre', 'Titre de l\'article'); ?>
	<?= $form->input('contenu', 'Contenu de passe', ['type' => 'textarea']); ?>
	<?= $form->select('category_id', 'Catégorie', $categories); ?>
	<button class="btn btn-primary">Sauveguarder</button>
</form>