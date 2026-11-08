<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
    <title>Ajouter une Chambre</title>
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
        <h2 class="text-2xl font-bold text-gray-700 mb-4">Ajouter une Chambre</h2>

        <form action="AjouterChambreServlet" method="POST">
            <label>Numéro de Chambre :</label>
            <input type="text" name="numero_chambre" required class="form-control mb-3">

            <label>Type :</label>
            <select name="type" class="form-control mb-3">
                <option value="standard">Standard</option>
                <option value="suite">Suite</option>
                <option value="deluxe">Deluxe</option>
            </select>

            <label>Prix (MAD) :</label>
            <input type="number" name="prix" step="0.01" required class="form-control mb-3">

            <label>Capacité :</label>
            <input type="number" name="capacite" required class="form-control mb-3">

            <button type="submit" class="btn btn-success w-100">Ajouter</button>
        </form>
    </div>

</body>
</html>
