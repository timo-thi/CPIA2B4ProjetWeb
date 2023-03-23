<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
      <?php require ROOT . 'BootStrap/assets/vendors/bootstrap/css/bootstrap.min.css'?>
    </style>
    <style>
      <?php require ROOT . 'public/css/style.css'?>
    </style>
    <style>
      <?php require ROOT . 'BootStrap/assets/vendors/fontawesome/css/all.min.css'?>
    </style>
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> -->
    <title>Recherche d'entreprise</title>
</head>
<body>
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
          <a class="nav-link sombre" href="./RechercheOffre.php">Offres</a>
        </li>
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="./RechercheEntreprise.php">Entreprise</a>
        </li>
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="./RechercheEtudiant.php">Etudiants</a>
        </li>
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="./RecherchePilote.php">Pilotes</a>
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

  <?php require ROOT . 'app/Views/HTML/Footer.php'?>
  <script src="../../../BootStrap/assets/vendors/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  <script src="../../../BootStrap/assets/vendors/jquery/jquery.min.js"></script>
</body>
</html>