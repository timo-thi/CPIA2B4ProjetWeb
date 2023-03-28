<?php 

include 'TplVar.php';
$page = 'NavBar';

?>
    <nav class="navbar navbar-expand-lg bg-clair">
        <div class="container-fluid">
            <a class="navbar-brand me-4" href="./Acceuil.php">
                <!-- Add eye icon -->
                <div class="icon_container container">
                <?php require '../logo_oeil/oeil.html'?>
                   
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
                            <?= $_SESSION['username'] ?>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end rounded-top-0 border-start-0 border-end-0 border-top-0 mt- bg-clair sombre" >
                            <li><a class="dropdown-item" href="#">Settings</a></li>
                            <li><a class="dropdown-item" href="#">Se déconnecter</a></li>
                            <li><a class="dropdown-item" href="#">Help</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
