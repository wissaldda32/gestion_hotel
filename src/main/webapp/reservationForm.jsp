<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String idChambre = request.getParameter("id_chambre");
    String total = request.getParameter("total");
    String services = request.getParameter("services");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finalisation de la réservation</title>
    <style>
    :root {
        --soft-gold: #E8D9C5;
        --warm-beige: #F5EDE2;
        --cream-white: #FFFCF8;
        --taupe: #D3C0B2;
        --soft-charcoal: #4A4A4A;
        --blue-900: #1E3A8A;
        --blue-500: #3B82F6;
        --blue-600: #2563EB;
        --gray-200: #E5E7EB;
        --gray-500: #6B7280;
        --gray-700: #374151;
        --green-500: #10B981;
        --red-500: #EF4444;
        --transition: all 0.3s ease-in-out;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Cormorant Garamond', serif;
    }

    body {
        background-color: var(--cream-white);
        color: var(--soft-charcoal);
        line-height: 1.6;
        padding: 2rem;
    }

    .container {
        max-width: 600px;
        margin: 0 auto;
        background-color: var(--warm-beige);
        padding: 2rem;
        border-radius: 15px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        font-size: 2rem;
        color: var(--soft-charcoal);
        margin-bottom: 1.5rem;
        text-align: center;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 1.5rem;
    }

    label {
        font-size: 1.1rem;
        color: var(--soft-charcoal);
    }

    input[type="date"],
    select {
        width: 100%;
        padding: 0.8rem;
        border: 2px solid var(--taupe);
        border-radius: 8px;
        font-size: 1rem;
        background-color: rgba(255, 255, 255, 0.9);
        transition: var(--transition);
    }

    input[type="date"]:focus,
    select:focus {
        outline: none;
        border-color: var(--soft-gold);
        box-shadow: 0 0 0 4px rgba(232, 217, 197, 0.3);
    }

    p {
        font-size: 1.1rem;
        color: var(--soft-charcoal);
        text-align: center;
    }

    p strong {
        color: var(--blue-900);
    }

    .button {
        background: linear-gradient(135deg, var(--soft-gold), var(--taupe));
        color: var(--cream-white);
        padding: 1rem;
        border: none;
        border-radius: 8px;
        font-size: 1.2rem;
        cursor: pointer;
        transition: var(--transition);
        text-align: center;
    }

    .button:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(232, 217, 197, 0.5);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .container {
            padding: 1.5rem;
        }

        h2 {
            font-size: 1.75rem;
        }
    }
</style>
</head>
<body>

<div class="container">
    <h2>Finalisez votre réservation</h2>

    <form action="ReservationServlet" method="post">
        <label>Date de début :</label>
        <input type="date" name="date_debut" required>

        <label>Date de fin :</label>
        <input type="date" name="date_fin" required>

        <label>Mode de paiement :</label>
        <select name="mode_paiement">
            <option value="Carte bancaire">Carte bancaire</option>
            <option value="PayPal">PayPal</option>
            <option value="Espèces">Espèces</option>
        </select>

        <p>Total : <strong><%= total %> MAD</strong></p>
        <input type="hidden" name="total" value="<%= total %>">
        <input type="hidden" name="id_chambre" value="<%= idChambre %>">

        <button type="submit" class="button">Confirmer</button>
    </form>
</div>

</body>
</html>
