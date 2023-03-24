<form class="d-flex" role="search">
        <input class="form-control me-2" type="search" style="max-width: 200px; max-height:25px" placeholder="Search" aria-label="Search">
        <button class="bg-clair rounded-3 border-0"  type="submit">Search</button>
        
        <div class="btn-group ms-2" role="group" aria-label="Basic example">
            <button type="button" class="bg-clair border-0 rounded-3 ms-4 <?=$HideFilter1 ?>">  <?=$filtre1;?> </button>
            <button type="button" class="bg-clair border-0 rounded-3 ms-4 <?=$HideFilter2 ?>">  <?=$filtre2;?></button>
            <button type="button" class="bg-clair border-0 rounded-3 ms-4 <?=$HideFilter3 ?>">  <?=$filtre3;?></button>
            <button type="button" class="bg-clair border-0 rounded-3 ms-4 <?=$HideFilter4 ?>">  <?=$filtre4;?></button>
        </div>
</form>