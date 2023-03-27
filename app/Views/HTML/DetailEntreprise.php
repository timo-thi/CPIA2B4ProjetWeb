<?php include 'TplVar.php' ;?> 

<div class="card bg-clair" style="max-width:100%; min-height:80vh">

    <div class="row">
        <div class="card-title ">
            <div class="container">
                <div class="row">
                    <div class="col-md-auto">
                        <h1 class="sombre " style="width: max-content;">Entreprise</h1>
                    </div>
                    
                    <div class="col-md-auto ">
                    
                        <div class="btn-group position-absolute end-0 mt-2" role="group" >
                              <button class="active border-0 bg-sombre clair rounded " style="width: max-content;"> Wish-List</button>
                              <a href="../public/index.php?p=company.CreationEntreprise"><button class="active border-0 bg-sombre clair rounded ms-2 me-3" style="width: max-content;"> Voir les offres</button></a>²²
                        </div>
                    </div>
                    
                </div>
            </div>
        </div> 
        <div class="card-body">
            <div class="container">
                    <ul class="navbar-nav">
                        <li>
                            <a class="nav-link" href=""> Lien vers le site</a>
                        </li>
                        <li>Nombres d'élèves CESI déjà acceptés en stage: <!--variable--></li>
                        
                    </ul>
                
            </div>
        </div>
        <div class="card-body">
            <div class="container">
                <h5 class="but clair p-1" style="width:max-content">Secteur d'activité:</h5>
                <ul class="navbar-nav border-sombre rounded-4 ps-2"  name="Activity">
                    <!--faire une boucle-->
                    <li>
                         <p class="sombre"> Activité 1</p>
                    </li>
                    <li>
                         <p class="sombre"> Activité 2</p>
                    </li>

                    </ul>
                

                    <h5 class="but clair p-1 mt-4" style="width:max-content">Localisations</h5>
                    <ul class="navbar-nav border-sombre rounded-4 ps-2"  name="Activity">
                        <!--faire une boucle-->
                        <li>
                            <p class="sombre"> Activité 1</p>
                        </li>
                        <li>
                            <p class="sombre"> Activité 2</p>
                        </li>
                    </ul>

                    <h5 class="but clair p-1 mt-4" style="width:max-content">Commentaires</h5>
                     <div class="">
                        <div class="border-sombre rounded-4 px-2">
                           <!-- boucles avec les commentaires-->
                        </div>
                    </div>
            </div>
        </div>
       


            
    </div>

    



</div>
