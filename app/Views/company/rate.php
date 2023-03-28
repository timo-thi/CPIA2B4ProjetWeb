<div class="container">
    <form method="post" >

        <label class="row">
            <strong style="font-size: 130%;">Rate</strong>
        </label>
        <input type="number" style="width: 40%;" name="rate" id="rate" min="0" max="5" placeholder="Ex : note /5" value="" >
        <label class="row">
            <strong style="font-size: 130%;">Comentaire</strong>
        </label>
        <textarea name="comment" id="comment" cols="30" rows="10" maxlength="255" placeholder="Ex : Mon commentaire sur l'entreprise"></textarea>
        <!-- <input type="text" style="width: 40%;" name="comment" id="comment" placeholder="Ex : Mon commentaire sur l'entreprise" value=""> -->
        <label class="row">
            <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;" name="edit">Ajouter</button>
        </label>
    </form>
</div>