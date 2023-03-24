<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<?= '../BootStrap/assets/vendors/bootstrap/css/bootstrap.min.css'?>">
  <link rel="stylesheet" href="<?= '../public/css/style.css'?>">
  <link rel="stylesheet" href="<?= '../BootStrap/assets/vendors/fontawesome/css/all.min.css'?>">
  <link rel="stylesheet" href="<?= '../public/css/oeil.css'?>">
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> -->
  <title>Recherche d'entreprise</title>
  <script src="../BootStrap/assets/vendors/jquery/jquery.min.js"></script> <!-- Jquery have to be included here to be recognized -->
</head>
<body class="bg-sombre">
  <nav class="navbar navbar-expand-lg bg-clair">
    <div class="container-fluid">
      <a class="navbar-brand me-4" href="./Acceuil.php">
        <!-- Add eye icon -->
        <div class="icon_container container">
        <?php require 'oeil.php';?>
            
        </div>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
          aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-auto mb-lg-0">
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="../public/index.php?p=offer.index">Offres</a>
        </li>
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="../public/index.php?p=company.index">Entreprise</a>
        </li>
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="../public/index.php?p=student.index">Etudiants</a>
        </li>
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="../public/index.php?p=pilot.index">Pilotes</a>
        </li>
        </ul>


        <ul class="navbar-nav mb-auto mb-lg-0">
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="./Candidatures.php">Candidatures</a>
        </li>
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="./WishList.php">WishList</a>
        </li>
        
          <li class="nav-item dropdown clair rounded-2 bg-sombre" style="width:fit-content">
            <button class="btn active dropdown-toggle  border-0" type="button" data-bs-toggle="dropdown"
              aria-pressed="true" style="width:fit-content">
              User
            </button>
            <ul class="dropdown-menu dropdown-menu-end rounded-top-0 border-start-0 border-end-0 border-top-0 mt- bg-clair sombre" >
              <li><a class="dropdown-item" href="#">Settings</a></li>
              <li><a class="dropdown-item" href="#">Sign out</a></li>
              <li><a class="dropdown-item" href="#">Help</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
    <?php
    echo $content;
    ?>
  <?php require ROOT . 'app/Views/HTML/Footer.php'?>
  <script src="<?= '../BootStrap/assets/vendors/bootstrap/js/bootstrap.bundle.js'?>"></script>
</body>
</html>