<%@ include file="admin-navbar.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, metier.DatabaseConnection" %>

<%
    HttpSession sessionAdmin = request.getSession(false);
    if (sessionAdmin == null || sessionAdmin.getAttribute("admin") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Chambres</title>
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

        /* Bouton Ajouter */
        .btn-add {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background-color: var(--soft-charcoal);
            color: var(--cream-white);
            text-decoration: none;
            border-radius: 8px;
            margin-bottom: 2rem;
            transition: var(--transition);
        }

        .btn-add:hover {
            background-color: var(--taupe);
        }

        /* Conteneur du tableau */
        .table-container {
            background-color: var(--warm-beige);
            padding: 0rem;
            border-radius: 10px;
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

        .btn-edit, .btn-delete {
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            font-size: 1rem;
            transition: var(--transition);
        }

        .btn-edit {
            background-color: #3b82f6;
        }

        .btn-edit:hover {
            background-color: #2563eb;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
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
        <h1 class="main-title">Gestion des Chambres</h1>

        <a href="ajouter-chambre.jsp" class="btn-add">
            ➕ Ajouter une Chambre
        </a>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Numéro</th>
                        <th>Type</th>
                        <th>Prix (MAD)</th>
                        <th>Capacité</th>
                        <th>Statut</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try (Connection conn = DatabaseConnection.getConnection()) {
                            String sql = "SELECT * FROM Chambres";
                            PreparedStatement stmt = conn.prepareStatement(sql);
                            ResultSet rs = stmt.executeQuery();

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("numero_chambre") %></td>
                        <td><%= rs.getString("type") %></td>
                        <td><%= rs.getDouble("prix") %></td>
                        <td><%= rs.getInt("capacite") %> personnes</td>
                        <td><%= rs.getString("statut") %></td>
                        <td class="action-buttons">
                            <a href="modifier-chambre.jsp?id=<%= rs.getInt("id") %>" class="btn-edit">
                                 Modifier
                            </a>
                            <a href="SupprimerChambreServlet?id=<%= rs.getInt("id") %>" class="btn-delete">
                                 Supprimer
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>