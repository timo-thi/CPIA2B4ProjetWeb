<div class="container mt-5 bg-clair rounded-3" style="width: 60vh; max-width=90%;"><!--ou style="width: 40%; max-width=90vh;"-->
            <h1 class="sombre text-center">Modifier un utilisateur</h1>
            <form action="" class="mx-auto" method="" style="width:95%">
                <div class="container mt-5 position-relative">
				<label for="lname">Nom<input type="text" name="lname" id="lname" placeholder="Ex : Dupond" value="<?= isset($_POST['lname']) ? $_POST['lname'] : ''?>"></label>
                </div>

                <div class="container mt-4 position-relative">
				<label for="fname">Prénom<input type="text" name="fname" id="fname" placeholder="Ex : Antoine" value="<?= isset($_POST['fname']) ? $_POST['fname'] : ''?>"></label>
                </div>

                <div class="container mt-4 position-relative">
				<label for="email">E-mail<input type="email" name="email" id="email" placeholder="Ex : nom.prenom@viacesi.fr" value="<?= isset($_POST['email']) ? $_POST['email'] : ''?>"></label>
                </div>

                <div class="container mt-4 position-relative">
					<label for="role">Role</label>
					<?php if ($_SESSION['role'] == 2): ?>
					<select name="role" id="role">
						<option value="3" selected hidden>Etudiant</option>
						<?php elseif ($_SESSION['role'] == 1): ?>
					<select name="role" id="role">
						<option value="0" <?= (!isset($_POST['role']) || $_POST['role'] == 0) ? 'selected' : ''?>>Choisissez une option</option>
						<option value="1" <?= (isset($_POST['role']) && $_POST['role'] == 1) ? 'selected' : ''?>>Administrateur</option>
						<option value="2" <?= (isset($_POST['role']) && $_POST['role'] == 2) ? 'selected' : ''?>>Pilote</option>
						<option value="3" <?= (isset($_POST['role']) && $_POST['role'] == 3) ? 'selected' : ''?>>Etudiant</option>
						<?php endif;?>
					</select>
			
                </div>

                <div class="container mt-4 di">
                    <div class="row position-relative di">
						<label for="prom">Promotion</label>
						<select name="prom" id="prom" <?= (isset($_SESSION['role']) && $_SESSION['role'] == 1) ? 'multiple' : ''?>>
							<option value="0" <?= (!isset($_POST['prom']) || $_POST['prom'] == 0) ? 'selected' : ''?>>Choisissez une option</option>
							<?php foreach ($promos as $promo): ?>
								<option value="<?= $promo->id_prom ?>" <?= (isset($_POST['prom']) && $_POST['prom'] == $promo->id_prom) ? 'selected' : ''?>><?= $promo->name ?></option>
							<?php endforeach;?>
						</select>
						
                    </div>
                </div>

                <div class="container mt-4 position-relative">
                    <label for="mdp" class="col ">
                        <strong style="font-size: 130%;">Mot de passe</strong>
                    </label>
                    <input type="password" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="mdp">
                </div>
                <div class="container mt-4 position-relative">
                    <label for="mdp2" class="col  ">
                        <strong style="font-size: 130%;"> Confirmation</strong>
                    </label>
                    <input type="password" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="mdp2">
                </div>
                
                
                <div class="row mt-5">
                    <div class="position-relative">
                        <div class="col">
                            <div class="btn-group position-absolute end-0" role="group">
								<input type="submit" value="Ajouter">
								<input type="reset" value="Annnuler">
                            </div>
                        </div>
                    </div>
                 </div>
                    
                
            </form>

</div>