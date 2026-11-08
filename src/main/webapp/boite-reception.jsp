<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%
    if (session == null || session.getAttribute("idClient") == null) {
        response.sendRedirect("login.jsp?error=session_expired");
        return;
    }

    List<Map<String, Object>> reservations = (List<Map<String, Object>>) request.getAttribute("reservations");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boîte de Réception</title>
    <style>
        :root {
            --soft-gold: #E8D9C5;
            --warm-beige: #F5EDE2;
            --cream-white: #FFFCF8;
            --taupe: #D3C0B2;
            --soft-charcoal: #4A4A4A;
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Conteneur principal */
        .main-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            width: 100%;
        }

        /* Titre principal */
        .main-title {
            font-size: 2.5rem;
            color: var(--soft-charcoal);
            margin-bottom: 2rem;
            text-align: center;
        }

        /* Conteneur du tableau */
        .table-container {
            background-color: var(--warm-beige);
            padding: 0rem;
            border-radius: 10px;
            width: 100%;
            max-width: 1200px;
            overflow-x: auto;
            margin-bottom: 2rem;
        }

        /* Tableau */
        table {
            width: 100%;
            border-collapse: collapse;
            background: var(--cream-white);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 1rem;
            text-align: center;
            border-bottom: 1px solid var(--taupe);
        }

        thead {
            background-color: var(--soft-gold);
            color: var(--soft-charcoal);
        }

        tr:hover {
            background-color: var(--warm-beige);
            transition: var(--transition);
        }

        /* Styles des statuts */
        .status-confirme {
            color: #28a745;
            font-weight: bold;
        }

        .status-en_attente {
            color: var(--taupe);
            font-weight: bold;
        }

        .status-annule {
            color: #dc3545;
            font-weight: bold;
        }

        .status-paiement-paye {
            color: #28a745;
            font-weight: bold;
        }

        .status-paiement-en_attente {
            color: var(--taupe);
            font-weight: bold;
        }

        .status-paiement-annule {
            color: #dc3545;
            font-weight: bold;
        }

        /* Bouton de téléchargement */
        .btn-download {
            display: inline-block;
            padding: 0.5rem 1rem;
            background-color: var(--soft-charcoal);
            color: var(--cream-white);
            text-decoration: none;
            border-radius: 8px;
            transition: var(--transition);
        }

        .btn-download:hover {
            background-color: var(--taupe);
        }

        /* Bouton de retour */
        .btn-back {
            display: inline-block;
            color: var(--soft-charcoal);
            text-decoration: none;
            transition: var(--transition);
        }

        .btn-back:hover {
            color: var(--taupe);
        }

        /* Message vide */
        .empty-message {
            color: var(--soft-charcoal);
            text-align: center;
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <h1 class="main-title">Boîte de Réception</h1>

        <% if (reservations == null || reservations.isEmpty()) { %>
            <p class="empty-message">Aucune réservation trouvée.</p>
        <% } else { %>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Chambre</th>
                            <th>Dates</th>
                            <th>Statut</th>
                            <th>Montant</th>
                            <th>Mode Paiement</th>
                            <th>Statut Paiement</th>
                            <th>Lettre</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, Object> res : reservations) { %>
                            <tr>
                                <td><%= res.get("numero_chambre") %> (<%= res.get("type") %>)</td>
                                <td><%= res.get("date_debut") %> - <%= res.get("date_fin") %></td>
                                <td class="status-<%= res.get("statut") %>"><%= res.get("statut") %></td>
                                <td><%= res.get("montant") != null ? res.get("montant") + " MAD" : "N/A" %></td>
                                <td><%= res.get("mode_paiement") != null ? res.get("mode_paiement") : "N/A" %></td>
                                <td class="status-paiement-<%= res.get("statut_paiement") %>">
                                    <%= res.get("statut_paiement") != null ? res.get("statut_paiement") : "N/A" %>
                                </td>
                                <td>
                                    <% if (res.get("lettre_contenu") != null) { %>
                                        <a href="TelechargerLettreServlet?id=<%= res.get("id") %>" class="btn-download">
                                            Télécharger 📄
                                        </a>
                                    <% } else { %>
                                        <span>Non disponible</span>
                                    <% } %>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>

        <a href="index.jsp" class="btn-back">Retour au tableau de bord<hr></a>
       
    </div>
</body>
</html>