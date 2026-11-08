<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, metier.DatabaseConnection" %>
<%
    HttpSession sessionAdmin = request.getSession(false);
    if (sessionAdmin == null || sessionAdmin.getAttribute("admin") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    String numero = "", type = "", statut = "";
    double prix = 0;
    int capacite = 0;

    try (Connection conn = DatabaseConnection.getConnection()) {
        String sql = "SELECT * FROM Chambres WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            numero = rs.getString("numero_chambre");
            type = rs.getString("type");
            prix = rs.getDouble("prix");
            capacite = rs.getInt("capacite");
            statut = rs.getString("statut");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier Chambre</title>
    
    
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
    background-color: var(--warm-beige);
    color: var(--soft-charcoal);
    font-size: 1rem;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Form container */
.bg-white {
    background-color: var(--cream-white);
    border-radius: 1rem;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    padding: 2rem;
}

/* Heading */
h2 {
    font-size: 2rem;
    font-weight: 700;
    color: var(--soft-charcoal);
    margin-bottom: 1.5rem;
    text-align: center;
}

/* Form labels and inputs */
label {
    font-size: 1rem;
    color: var(--soft-charcoal);
    display: block;
    margin-bottom: 0.5rem;
}

.form-control {
    width: 100%;
    padding: 0.75rem;
    margin-bottom: 1.25rem;
    border: 1px solid var(--taupe);
    border-radius: 0.375rem;
    font-size: 1rem;
    color: var(--soft-charcoal);
    background-color: var(--cream-white);
    transition: var(--transition);
}

.form-control:focus {
    border-color: var(--soft-gold);
    outline: none;
}

/* Select input */
select.form-control {
    padding: 0.75rem;
    background-color: var(--cream-white);
    color: var(--soft-charcoal);
}

/* Button */
button {
    padding: 1rem;
    background-color: var(--soft-charcoal);
    color: var(--cream-white);
    font-weight: 600;
    border: none;
    border-radius: 0.375rem;
    cursor: pointer;
    transition: var(--transition);
}

button:hover {
    background-color: var(--taupe);
}

/* Responsive Design */
@media (max-width: 768px) {
    h2 {
        font-size: 1.5rem;
    }

    .bg-white {
        padding: 1.5rem;
    }

    .form-control {
        padding: 0.5rem;
    }

    button {
        padding: 0.75rem;
    }
}
   
   </style>
   
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">

    <div class="bg-white p-8 rounded-lg shadow-lg w-96">
        <h2 class="text-2xl font-bold text-gray-700 mb-4">Modifier Chambre</h2>

        <form action="ModifierChambreServlet" method="POST">
            <input type="hidden" name="id" value="<%= id %>">

            <label>Numéro de Chambre :</label>
            <input type="text" name="numero_chambre" value="<%= numero %>" required class="form-control mb-3">

            <label>Type :</label>
            <select name="type" class="form-control mb-3">
                <option value="standard" <%= type.equals("standard") ? "selected" : "" %>>Standard</option>
                <option value="suite" <%= type.equals("suite") ? "selected" : "" %>>Suite</option>
                <option value="deluxe" <%= type.equals("deluxe") ? "selected" : "" %>>Deluxe</option>
            </select>

            <label>Prix (MAD) :</label>
            <input type="number" name="prix" step="0.01" value="<%= prix %>" required class="form-control mb-3">

            <label>Capacité :</label>
            <input type="number" name="capacite" value="<%= capacite %>" required class="form-control mb-3">

            <label>Statut :</label>
            <select name="statut" class="form-control mb-3">
                <option value="disponible" <%= statut.equals("disponible") ? "selected" : "" %>>Disponible</option>
                <option value="reservee" <%= statut.equals("reservee") ? "selected" : "" %>>Réservée</option>
                <option value="indisponible" <%= statut.equals("indisponible") ? "selected" : "" %>>Indisponible</option>
            </select>

            <button type="submit" class="btn btn-warning w-100">Modifier</button>
        </form>
    </div>

</body>
</html>
