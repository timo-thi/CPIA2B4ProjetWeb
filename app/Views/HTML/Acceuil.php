<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../BootStrap/assets/css/style.css">
    <link rel="stylesheet" href="../../../BootStrap/assets/css/style.css">
    <link rel="stylesheet" href="../../../BootStrap/assets/vendors/fontawesome/css/all.min.css">
    <title>Acceuil</title>
</head>


<body class="bg-sombre ">
<?php require './Navbar.php';
?>

    <div class="row mt-4 text-center">
        <figure class="figure">
            <img src="../assets/imgs/oeil_fond_2c2c2c.png" class="figure-img img-fluid rounded border border-light" style="width: 90%;"
                alt="...">
        </figure>
    </div>

<div class="container">
<div class="row g-4 justify-content-around">
    <div class="col-5 col-rows-1 col-rows-md-2 g-4">
        <?php 
        $page = 'RechercheOffre';
        for ($in = 1; $in <= 10; $in++){
            
                echo '<div class="row ms-5">';
                require './cadreOffre.php';
                echo '</div>';
        }?>
    
    </div>

    <div class="col-5 col-rows-1 col-rows-md-2 g-4">
        <?php 
        $page = 'RechercheEntreprise';
            for ($in = 1; $in <= 10; $in++){
                
                    echo '<div class="row me-5">';
                    require './cadreOffre.php';
                    echo '</div>';
            }?>
    </div>
</div>
</div>

    <script src="../../../BootStrap/assets/vendors/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../../../BootStrap/assets/vendors/jquery/jquery.min.js"></script>
</body>

<?php require './Footer.php'?>

</html>