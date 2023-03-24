<?php 
if ($page == 'RechercheOffre'){
    $filtre1 = 'Rémunération';
    $filtre2 = 'Secteur';
    $filtre3 = 'Entreprise';
    $filtre4 = '';
    $HideFilter1 = '';
    $HideFilter2 = '';
    $HideFilter3 = '';
    $HideFilter4 = 'd-none';
    $Image = 'oeil_fond_fffaf0.png';
    $Titre = 'Titre de l\'offre';
    $SousInfo1 = 'Entreprise';
    $SousInfo2 = 'Ville';
    $SousInfo3 = 'Code postal';
    $Delimit1 = '-';
    $Delimit2 = '(';
    $Delimit3 = ')';
}
elseif ($page == 'RechercheEtudiant'){
    $filtre1 = 'Nom';
    $filtre2 = 'Prénom';
    $filtre3 = 'Promo';
    $filtre4 = 'Progression';
    $HideFilter1 = '';
    $HideFilter2 = '';
    $HideFilter3 = '';
    $HideFilter4 = '';
    $CadreInfo1 =  'Nom';
    $CadreInfo2 =  'Prénom';
    $CadreInfo3 =  'Mail';
    $CadreInfo4 =  'Promo';
    $CadreInfo5 =  'Accepté';
    $CadreDrop = 'Voir les candidatures';
    $CadreDetail1 = 'Nom de l\'offre';
    $CadreDetail2 = 'Progrès';
    $CadreDetail3 = 'Entreprise';
    $CadreDetail4 = 'Date de la candidature';
}
elseif ($page == 'RecherchePilote'){
    $filtre1 = 'Nom';
    $filtre2 = 'Prénom';
    $filtre3 = 'Promo';
    $filtre4 = 'Campus';
    $HideFilter1 = '';
    $HideFilter2 = '';
    $HideFilter3 = '';
    $HideFilter4 = '';
    $CadreInfo1 =  'Nom';
    $CadreInfo2 =  'Prénom';
    $CadreInfo3 =  'Mail';
    $CadreInfo4 =  '';
    $CadreInfo5 =  '';
    $CadreDrop = 'Voir les promos';
    $CadreDetail1 = 'NomPromo';
    $CadreDetail2 = 'Nombre d\'étudiants';
    $CadreDetail3 = 'Campus';
    $CadreDetail4 = 'Adresse';
}
elseif($page == 'RechercheEntreprise'){
    $filtre1 = 'Nom';
    $filtre2 = 'Secteur';
    $filtre3 = 'Localisation';
    $filtre4 = 'Étudiants CESI acceptés';
    $HideFilter1 = '';
    $HideFilter2 = '';
    $HideFilter3 = '';
    $HideFilter4 = '';
    $Image = 'oeil_fond_fffaf0.png';
    $Titre = 'Titre de l\'entreprise';
    $SousInfo1 = 'Elèves déjà acceptés en stage';
    $SousInfo2 = '';
    $SousInfo3 = '';
    $Delimit1 = ':';
    $Delimit2 = '';
    $Delimit3 = '';
}
elseif($page == 'Candidature'){
    $filtre1 = 'Date de candidature';
    $filtre2 = 'Secteur';
    $filtre3 = 'Entreprise';
    $filtre4 = '';
    $HideFilter1 = '';
    $HideFilter2 = '';
    $HideFilter3 = '';
    $HideFilter4 = 'd-none';
    $Image = 'oeil_fond_fffaf0.png';
    $Titre = 'Titre de l\'offre';
    $SousInfo1 = 'Entreprise';
    $SousInfo2 = 'Ville';
    $SousInfo3 = 'Code postal';
    $Delimit1 = '-';
    $Delimit2 = '(';
    $Delimit3 = ')';
}
elseif($page == 'WishList'){
    $filtre1 = 'Secteur';
    $filtre2 = 'Entreprise';
    $filtre3 = '';
    $filtre4 = '';
    $HideFilter1 = '';
    $HideFilter2 = '';
    $HideFilter3 = 'd-none';
    $HideFilter4 = 'd-none';
    $Image = 'oeil_fond_fffaf0.png';
    $Titre = 'Titre de l\'offre';
    $SousInfo1 = 'Entreprise';
    $SousInfo2 = 'Ville';
    $SousInfo3 = 'Code postal';
    $Delimit1 = '-';
    $Delimit2 = '(';
    $Delimit3 = ')';
}
if($page == 'Navbar'){
    $image = '../logo_oeil/oeil.html';
    $lien1 = 'Offres';
    $source1 = './RechercheOffre.php';
    $lien2 = 'Entreprises';
    $source2 = './RechercheEntreprise.php';
    $lien3 = 'Étudiants';
    $source3 = './RechercheEtudiant.php';
    $lien4 = 'Pilotes';
    $source4 = './RecherchePilote.php';
    $lien5 = 'Candidatures';
    $source5 = './Candidatures.php';
    $lien6 = 'WishList';
    $source6 = './WishList.php';
}

?>