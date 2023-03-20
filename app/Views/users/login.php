<?php if ($errors):?>
	<div class="alert alert-danger">
		Identifiant ou mot de passe incorrect
	</div>
<?php endif; ?>

<form action="" method="post">
	<?= $form->input('username', 'Pseudo'); ?>
	<?= $form->input('password', 'Mot de passe', ['type' => 'password']); ?>
	<?= $form->submit(); ?>
</form>