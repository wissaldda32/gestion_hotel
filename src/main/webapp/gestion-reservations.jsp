<%@ include file="admin-navbar.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, metier.DatabaseConnection" %>

<%
    HttpSession sessionAdmin = request.getSession(false);
    if (sessionAdmin == null || sessionAdmin.getAttribute("admin") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    Connection conn = DatabaseConnection.getConnection();
    String query = "SELECT r.id, c.nom_client, c.prenom_client, c.email_client, c.telephone_client, " +
                   "ch.numero_chambre, r.date_debut, r.date_fin, r.statut " +
                   "FROM Reservations r " +
                   "JOIN Client c ON r.id_client = c.id " +
                   "JOIN Chambres ch ON r.id_chambre = ch.id " +
                   "ORDER BY r.date_reservation DESC";
    PreparedStatement stmt = conn.prepareStatement(query);
    ResultSet rs = stmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Réservations</title>
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

        /* Barre de navigation */
        nav {
            background-color: var(--soft-charcoal);
            padding: 1rem 2rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav a {
            color: var(--cream-white);
            text-decoration: none;
            font-size: 1.25rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
        }

        nav a:hover {
            color: var(--taupe);
        }

        ul {
            display: flex;
            gap: 1.5rem;
            list-style: none;
        }

        ul li a {
            color: var(--cream-white);
            font-size: 1rem;
            transition: var(--transition);
        }

        ul li a:hover {
            color: var(--taupe);
        }

        ul li a.logout {
            color: var(--soft-gold);
        }

        ul li a.logout:hover {
            color: var(--taupe);
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
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 1200px;
            overflow-x: auto;
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

        .btn-accept, .btn-decline {
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            font-size: 1rem;
            transition: var(--transition);
        }

        .btn-accept {
            background-color: #28a745;
        }

        .btn-accept:hover {
            background-color: #218838;
        }

        .btn-decline {
            background-color: #dc3545;
        }

        .btn-decline:hover {
            background-color: #c82333;
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <h1 class="main-title">Gestion des Réservations</h1>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Nom Client</th>
                        <th>Email</th>
                        <th>Téléphone</th>
                        <th>Chambre</th>
                        <th>Date Début</th>
                        <th>Date Fin</th>
                        <th>Statut</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("nom_client") %> <%= rs.getString("prenom_client") %></td>
                        <td><%= rs.getString("email_client") %></td>
                        <td><%= rs.getString("telephone_client") %></td>
                        <td>Chambre <%= rs.getString("numero_chambre") %></td>
                        <td><%= rs.getDate("date_debut") %></td>
                        <td><%= rs.getDate("date_fin") %></td>
                        <td><%= rs.getString("statut") %></td>
                        <td class="action-buttons">
                            <% if (rs.getString("statut").equals("en_attente")) { %>
                            <a href="ValiderReservationServlet?id=<%= rs.getInt("id") %>" class="btn-accept">
                                ✅ Accepter
                            </a>
                            <a href="RefuserReservationServlet?id=<%= rs.getInt("id") %>" class="btn-decline">
                                ❌ Refuser
                            </a>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>