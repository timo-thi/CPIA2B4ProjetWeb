<?php include 'TplVar.php' ;?> 

<div class="card bg-clair" style="max-width:100%; min-height:39em">

    <div class="row">
        <div class="card-title ">
            <div class="container">
                <div class="row">
                    <div class="col-md-auto">
                        <h1 class="sombre " style="width: max-content;">Titre de l'offre</h1>
                    </div>
                    
                    <div class="col-md-auto ">
                    
                        <div class="btn-group position-absolute end-0 mt-2" role="group" >
                              <button class="active border-0 bg-sombre clair rounded " style="width: max-content;"> Like</button>
                              <button class="active border-0 bg-sombre clair rounded ms-2 me-3" style="width: max-content;"> Postuler</button>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div> 
        <div class="card-body">
            <div class="container">
            <div class="row">
                <div class="col col-lg-1">
                </div>
    
                 <div class="col-md-auto " >
                    <h3 class="sombre"> Entreprise</h3>
                    <ul class="navbar-nav">
                        <li>Adresse</li>
                        <li>Ville (code postal)</li>
                        <li>Site web</li>
                    </ul>
                </div>
                <div class="col-md-auto ">
                     <ul class="navbar-nav align-self-end">
                        <li><!--logoMail--> Email@entreprise.com</li>
                        <li><!--logoPhone--> 09.87.56.32.14</li>
                    </ul>
                </div>

                
                </div>
            </div>
        </div>
        <div class="card-text">
            <div class="container">
            <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium ipsum excepturi, doloribus architecto dolore delectus repellendus totam. Blanditiis magnam molestiae facilis mollitia minus id numquam fugiat alias quae? Recusandae, nam?</p>
            <p>Gratification: <!--variable du prix--> /mois</p>
            </div>
        </div>
        <div class="card-body">
            <div class="container">
                    <h5 class="but clair p-1" style="width:max-content">Secteurs d'activité:</h5>        
                    <ul class="navbar-nav border-sombre rounded-4 ps-2"  name="Activity">
                        
                        <!--faire une boucle-->
                        <li>
                            <p class="sombre"> Activité 1</p>
                        </li>
                        <li>
                            <p class="sombre"> Activité 2</p>
                        </li>

                    </ul>
                

                    <h5 class="but clair p-1 " style="width:max-content">Skills:</h5>
                    <ul class="navbar-nav border-sombre rounded-4 ps-2 "  name="Activity">
                      
                    
                        <!--faire une boucle-->
                        <li>
                            <p class="sombre"> Activité 1</p>
                        </li>
                        <li>
                            <p class="sombre"> Activité 2</p>
                        </li>
                    </ul>
                
            </div>
        </div>
       


            
    </div>

    



</div>
