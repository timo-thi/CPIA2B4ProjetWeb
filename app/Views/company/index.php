<script src="../public/js/company_details.js"></script>
<div class="container mt-3 " style="max-width:90%">
  <?php
  $filtre1 = 'Nom';
  $filtre2 = 'Secteur';
  $filtre3 = 'Localisation';
  $filtre4 = 'Étudiants CESI acceptés';

  $HideFilter1 = '';
  $HideFilter2 = '';
  $HideFilter3 = '';
  $HideFilter4 = '';

  require '../app/Views/templates/Filter.php';
  ?>
  <div class="row mt-3 position-relative">
    <div class="col-6  ">
      <div class="partieScrollable">
        
        <?php

      // Configuration
      $items_per_page = 6; // Nombre de pilotes par page

      // Connexion à la base de données

      $db = new PDO("mysql:host=localhost;dbname=web", "root", "");

      // Récupération du nombre total d'offres
      $total_items = $db->query("SELECT COUNT(*) FROM company")->fetchColumn();

      // Calcul du nombre de pages
      $total_pages = ceil($total_items / $items_per_page);

      // Récupération du numéro de la page courante
      $current_page = isset($_GET['page']) ? intval($_GET['page']) : 1;

      // Vérification de la validité du numéro de page
      if ($current_page < 1 || $current_page > $total_pages) {
        $current_page = 1;
      }

      // Calcul des bornes LIMIT pour la requête SQL
      $offset = ($current_page - 1) * $items_per_page;
      $limit = $items_per_page;

      // Exécution de la requête SQL avec pagination
      $stmt = $db->prepare("
      select * from view_company group by id_company
        LIMIT :offset, :limit;
      ");
      $stmt->bindParam(":offset", $offset, PDO::PARAM_INT);
      $stmt->bindParam(":limit", $limit, PDO::PARAM_INT);
      $stmt->execute();

      // Affichage des résultats
      while ($row = $stmt->fetch()) { ?>
        <div class="row ms-5">
                  <div class="card bg-clair mb-3 list-item" style="max-width: 100%;" id="<?= $row['id_company']?>">
                    <div class="row g-0 dib">
                      <div class="col-md-4 my-auto di">
                        <img src="https://cdn.discordapp.com/attachments/1072440528026738688/1088735990673317978/company.png" class="img-fluid rounded-start" alt="...">
                      </div>
                      <div class="col-md-7">
                        <div class="card-body sombre di" >
                          <h5 class="card-title"> <?= $row['name'] ?> </h5>
                          <p class="card-text"><?php echo "Nombre d'étudiants CESI acceptés : {$row['cesi_accepté']}"; ?> </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
      <?php
      }

      // Affichage de la pagination
      if ($total_pages > 1) {
        echo '<div class=" row justify-content-center ms-5">';
        $precedent= "?p=company.index&page=" . ($current_page - 1);
        echo "<div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href=\"{$precedent}\"><</a></div>";
        for ($i = 1; $i <= $total_pages; $i++) {
          $class = ($i == $current_page) ? "active" : "";
          $url = "?p=company.index&page=" . $i;
          echo "<div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href=\"{$url}\">{$i}</a></div>";
        }
        $suivant= "?p=company.index&page=" . ($current_page + 1);
        echo "<div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href=\"{$suivant}\">></a></div>";
        echo '</div>';
      }


?>
      </div>
    </div>

    <div class="col-6 position-absolute end-0 ">
      <div class="position-absolute ms-2 end-0 ">
        <?php require '../app/Views/templates/DetailEntreprise.php';?>
      </div>
    </div>
  </div>
</div>
