// var num_a = Number(document.getElementById("nbr").value);
var num_address = $('nbr').attr('value');
// var num_address = num_a.valueOf(document.getElementById("nbr"));
//var num_address=valueOf(Nnumber(document.getElementById("nbr")));

function addAddress() {
  // Incrémenter le nombre d'adresses
 
 num_address++;
  // Créer un nouveau bloc d'adresse avec un identifiant unique
  var newAddress = `
    <div class="container">
      <button class="bg-sombre clair border-0 rounded px-2 mb- mt-3 ms- me- dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#adresse`+ num_address +`" aria-expanded="false" aria-controls="adresse`+ num_address +`">
        Adresse `+ num_address +`
      </button>
      <div class="collapse border-sombre border-top-0 border-start-0 border-end-0" id="adresse`+ num_address +`" data-address-id="`+ num_address +`">
        <input type="hidden" name="id_locality[]" value="">
        <div class="container mt-4 position-relative">
          <label class="col ">
            <strong style="font-size: 130%;">Ville</strong>
          </label>
          <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="city[]" id="city">
        </div>
        <div class="container mt-4 position-relative">
          <label class="col ">
            <strong style="font-size: 130%;">Code Postal</strong>
          </label>
          <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="zipcode[]" id="zipcode">
        </div>
        <div class="container mt-4 position-relative">
          <label class="col ">
            <strong style="font-size: 130%;">Adresse</strong>
          </label>
          <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="address[]" id="address">
        </div>
        <div class="container mt-4 position-relative">
          <label class="col ">
            <strong style="font-size: 130%;">Numéro</strong>
          </label>
          <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="number[]" id="number">
        </div>
        <div class="container mt-4 position-relative">
          <label class="col ">
            <strong style="font-size: 130%;">Comment</strong>
          </label>
          <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="comment[]" id="comment">
        </div>
      </div>
    </div>
  `;

  // Ajouter le bloc d'adresse au HTML
  document.getElementById("addresses").innerHTML += newAddress;
}