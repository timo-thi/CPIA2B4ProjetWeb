<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="EyeternShip is the best CESI stage looker and manager">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link rel="stylesheet" href="<?= '../public/css/style.css'?>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
  <link rel="stylesheet" href="<?= '../public/css/oeil.css'?>">

  <link rel="shortcut icon" href="../app/Views/assets/imgs/oeil_fond_2c2c2c.png" type="image/x-icon">
  
  <title>Recherche d'entreprise</title>
  <!-- <script src="../BootStrap/assets/vendors/jquery/jquery.min.js"></script> Jquery have to be included here to be recognized -->
  <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
</head>
<body class="bg-sombre">
  <nav class="navbar navbar-expand-lg bg-clair">
    <div class="container-fluid">
      <a class="navbar-brand me-4" href="../public/index.php?p=acceuil.index">
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
        <?php if ($_SESSION['role']!=3):?>
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="../public/index.php?p=student.index">Etudiants</a>
        </li>
        <?php endif ?>
        <?php if ($_SESSION['role']==1):?>
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="../public/index.php?p=pilot.index">Pilotes</a>
        </li>
        <?php endif ?>
        </ul>
        <ul class="navbar-nav mb-auto mb-lg-0">
        <?php if ($_SESSION['role']!=2):?>
        
          <li class="nav-item me-2">
            <a class="nav-link sombre" href="../public/index.php?p=profile.candidature">Candidatures</a>
          </li>
        <li class="nav-item me-2">
          <a class="nav-link sombre" href="../public/index.php?p=profile.wish">WishList</a>
        </li>
        <?php endif?>
          <li class="nav-item dropdown clair rounded-2 bg-sombre" style="width:fit-content">
            <button class="btn active dropdown-toggle  border-0" type="button" data-bs-toggle="dropdown"
              aria-pressed="true" style="width:fit-content">
              <i class="fas fa-user-circle"></i> Utilisateur
            </button>
            <ul class="dropdown-menu dropdown-menu-end rounded-top-0 border-start-0 border-end-0 border-top-0 mt- bg-clair sombre" >
              <li><a class="dropdown-item" href="../public/index.php?p=users.settings">Settings</a></li>
              <li><a class="dropdown-item" href="../public/index.php?p=users.logout">Se déconnecter</a></li>
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
    <!-- Footer -->
  <div class="footer text-center text-lg-start bg-light text-muted mt-auto">
    <!-- Section: Social media -->

    <!-- Section: Social media -->

    <!-- Section: Links  -->
    <section class="bg-clair ">
      <div class="container text-center bg-clair text-md-start ">
        <!-- Grid row -->
        <div class="row pt-4">
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4 ">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4 sombre">
              A Propos
            </h6>
            <p>
              <a href="#!" class="nav-link">Crédits</a>
            </p>
            <p>
              <a href="../app/Views/mentions_legales.html" target="_blank" class="nav-link">Mentions légales</a>
            </p>
            <p>
              <a href="#!" class="nav-link">Préférences cookies</a>
            </p>
            <p>
              <a href="#!" class="nav-link">Données Personnelles</a>
            </p>
            <p>
              <a href="#!" class="nav-link">Conditions Générales d'Utilisation</a>
            </p>
          </div>
          <!-- Grid column -->
          <div class="col-xs border-top-0 border-bottom-0 border-end-0 border-sombre border-4 barre-footer barre mb-4" >

          </div>
          <!-- Grid column -->
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4 sombre ">
              Nous découvrir
            </h6>
            <p>
              <a href="#!" class="nav-link">École</a>
            </p>
            <p>
              <a href="#!" class="nav-link">Alumni</a>
            </p>
            <p>
              <a href="#!" class="nav-link">Presse</a>
            </p>
            <p>
              <a href="#!" class="nav-link">Actualité</a>
            </p>
            <p>
              <a href="#!" class="nav-link">International</a>
            </p>
          </div>
          <!-- Grid column -->
          <div class="col-xs border-top-0 border-bottom-0 border-end-0 border-sombre border-4 barre-footer barre mb-4" >
            
          </div>
          <!-- Grid column -->
          <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-4">

            <h6 class="text-uppercase fw-bold mb-4 sombre">
              L’actualité de CESI
            </h6>
            <ul class="list-group">
              <li class="row mb-4 ms-1">
                <a href="" class="me-3 nav-link col-1">
                  <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-3 nav-link col-1">
                  <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-3 nav-link col-1">
                  <i class="fab fa-linkedin"></i>
                </a>
              </li>
              <li class="row mb-4 ms-1">
                <a href="" class="me-3 nav-link col-1">
                  <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-3 nav-link col-1">
                  <i class="fab fa-youtube"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
      <div class=" text-center p-4 clair bg-sombre">
        © 2023 Copyright:
        <a class=" text-reset fw-bold" href="../public/index.php?p=acceuil.index">EyeTernShip.com</a>
      </div>
    </section>
    <!-- Section: Links  -->

    <!-- Copyright -->

    <!-- Copyright -->
  </div>
  <!-- Footer -->

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</body>
</html>