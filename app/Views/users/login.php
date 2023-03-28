<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login</title>

	<link rel="stylesheet" href="<?= '../public/css/style.css'?>">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  	<link rel="stylesheet" href="<?= '../public/css/oeil.css'?>">

</head>
<body class="bg-sombre">
	
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
		
</body>
</html>