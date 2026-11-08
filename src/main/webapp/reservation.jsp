<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="metier.ChambreDAO" %>
<%@ page import="metier.Chambre" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Réservation</title>
  <style>
  :root {
    --soft-gold: #E8D9C5;
    --warm-beige: #F5EDE2;
    --cream-white: #FFFCF8;
    --taupe: #D3C0B2;
    --soft-charcoal: #4A4A4A;
    --primary-color: #8B5E3B;
    --hover-color: #6F4F2B;
    --transition: all 0.3s ease-in-out;
}

body {
    font-family: 'Poppins', sans-serif;
    background-color: var(--cream-white);
    color: var(--soft-charcoal);
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.container {
    width: 90%;
    max-width: 1200px;
    background: linear-gradient(135deg, var(--warm-beige), var(--soft-gold));
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    animation: fadeIn 0.5s ease-in-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}

.room-image {
    width: 100%;
    height: 450px;
    object-fit: cover;
    border-radius: 50px;
    display: block;
    margin-bottom: 30px;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
    transition: var(--transition);
    clip-path: ellipse(75% 60% at center);
}

.room-image:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
}

h2, h3 {
    color: var(--primary-color);
    text-align: center;
    font-weight: bold;
    margin-bottom: 20px;
}

h2::after {
    content: '';
    display: block;
    width: 80px;
    height: 4px;
    background: var(--primary-color);
    margin: 10px auto;
    border-radius: 2px;
}

.details p {
    font-size: 16px;
    margin: 10px 0;
    padding: 12px;
    background-color: rgba(211, 192, 178, 0.4);
    border-radius: 10px;
    color: var(--soft-charcoal);
    border-left: 5px solid var(--taupe);
}

form {
    background-color: var(--soft-gold);
    padding: 30px;
    border-radius: 15px;
    margin-top: 20px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

label {
    font-weight: bold;
    color: var(--soft-charcoal);
    display: block;
    margin: 12px 0 8px;
}

input, select {
    width: 100%;
    padding: 12px;
    border: 1px solid var(--taupe);
    border-radius: 10px;
    background-color: var(--cream-white);
    font-size: 16px;
    transition: var(--transition);
}

input:focus, select:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 5px rgba(139, 94, 59, 0.3);
}

button {
    background: var(--primary-color);
    color: white;
    border: none;
    padding: 14px;
    font-size: 16px;
    border-radius: 10px;
    cursor: pointer;
    width: 100%;
    margin-top: 20px;
    transition: var(--transition);
    font-weight: bold;
    text-transform: uppercase;
}

button:hover {
    background: var(--hover-color);
    transform: translateY(-2px);
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
}

#total {
    font-size: 22px;
    font-weight: bold;
    color: var(--primary-color);
    text-align: right;
    margin-top: 20px;
    padding-top: 15px;
    border-top: 2px dashed var(--taupe);
}

@media (max-width: 768px) {
    .container {
      width: 95%;
      padding: 20px;
    }
    .room-image {
      height: 250px;
    }
}
  
  </style>
   
</head>
<body>

<%
  // Récupération des données de la chambre
  String idChambreStr = request.getParameter("id");
  ChambreDAO chambreDAO = new ChambreDAO();
  Chambre chambre = null;

  if (idChambreStr != null && !idChambreStr.isEmpty()) {
    try {
      int idChambre = Integer.parseInt(idChambreStr);
      chambre = chambreDAO.getChambreById(idChambre);
    } catch (NumberFormatException e) {
      chambre = null;
    }
  }

  BigDecimal prixBase = (chambre != null) ? chambre.getPrix() : BigDecimal.ZERO;
  double prixBaseDouble = prixBase.doubleValue();
%>

<!-- ✅ Container principal -->
<div>
  <!-- ✅ Section Image et Détails -->
  <div>
    <img src="<%= chambre != null ? chambre.getImageUrl() : "images/default-room.jpg" %>" alt="Chambre">
    <h2><%= chambre != null ? chambre.getType() : "Chambre non trouvée" %></h2>

    <p><strong>Numéro de chambre :</strong> <%= chambre != null ? chambre.getNumeroChambre() : "Non disponible" %></p>
    <p><strong>Type :</strong> <%= chambre != null ? chambre.getType() : "Non disponible" %></p>
    <p><strong>Prix :</strong> <%= prixBaseDouble %> MAD</p>
    <p><strong>Capacité :</strong> <%= chambre != null ? chambre.getCapacite() : "Non spécifiée" %> personnes</p>
    <p><strong>Description :</strong> <%= chambre != null ? chambre.getDescription() : "Aucune description disponible" %></p>
    <p><strong>Services :</strong> <%= chambre != null ? chambre.getServices() : "Non spécifiés" %></p>
    <p><strong>Équipements :</strong> <%= chambre != null ? chambre.getEquipements() : "Non spécifiés" %></p>
    <p><strong>Literie :</strong> <%= chambre != null ? chambre.getLiterie() : "Non spécifiée" %></p>
    <p><strong>Restauration :</strong> <%= chambre != null ? chambre.getRestauration() : "Non spécifiée" %></p>
    <p><strong>Statut :</strong> <%= chambre != null ? chambre.getStatut() : "Non spécifié" %></p>
  </div>

  <!-- ✅ Section Services et Paiement -->
  <div>
    <h3>Choisissez vos services</h3>
    <form action="ReservationServlet" method="post">
      <input type="hidden" name="idChambre" value="<%= idChambreStr != null ? idChambreStr : "" %>">

      <!-- ✅ Services supplémentaires -->
      <label><input type="checkbox" name="services" value="100" onclick="updateTotal()"> Petit-déjeuner (+100 MAD)</label><br>
      <label><input type="checkbox" name="services" value="150" onclick="updateTotal()"> Déjeuner (+150 MAD)</label><br>
      <label><input type="checkbox" name="services" value="200" onclick="updateTotal()"> Dîner (+200 MAD)</label><br>
      <label><input type="checkbox" name="services" value="400" onclick="updateTotal()"> Pension complète (+400 MAD)</label><br>

      <hr>
      <p><strong>Taxes et frais :</strong> 28.6 MAD</p>
      <p><strong>Total :</strong> <span id="total"><%= prixBaseDouble + 28.6 %></span> MAD</p>

      <!-- ✅ Formulaire de paiement -->
      <h3>Paiement :</h3>
      <label>Date d'arrivée : <input type="date" name="dateDebut" required></label><br>
      <label>Date de départ : <input type="date" name="dateFin" required></label><br>
      <label>Mode de paiement :
        <select name="modePaiement" required>
          <option value="carte_credit">Carte de crédit</option>
          <option value="paypal">PayPal</option>
          <option value="espece">Espèces</option>
        </select>
      </label><br>

      <button type="submit">Confirmer la réservation</button>
    </form>
  </div>
</div>

<!-- ✅ Script pour mise à jour dynamique du total -->
<script>
  function updateTotal() {
    let basePrice = <%= prixBaseDouble %>;
    let taxes = 28.6;
    let total = basePrice + taxes;

    document.querySelectorAll('input[name="services"]:checked').forEach((checkbox) => {
      total += parseFloat(checkbox.value);
    });

    document.getElementById("total").innerText = total.toFixed(2) + " MAD";
  }
</script>

</body>
</html>