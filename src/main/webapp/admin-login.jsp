<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion Admin</title>
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
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 2rem;
}

.container {
    background-color: var(--warm-beige);
    border-radius: 15px;
    padding: 3rem;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
    text-align: center;
}

h2 {
    font-size: 2.5rem;
    margin-bottom: 1.5rem;
    color: var(--soft-charcoal);
}

form {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

.form-group {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
}

label {
    font-size: 1.1rem;
    color: var(--soft-charcoal);
    font-weight: bold;
}

input {
    padding: 0.8rem;
    border: 2px solid var(--taupe);
    border-radius: 8px;
    font-size: 1rem;
    background-color: rgba(255, 255, 255, 0.9);
    transition: var(--transition);
}

input:focus {
    outline: none;
    border-color: var(--soft-gold);
    box-shadow: 0 0 0 4px rgba(232, 217, 197, 0.3);
}

button {
    background: linear-gradient(135deg, var(--soft-gold), var(--taupe));
    color: var(--cream-white);
    padding: 1rem;
    border: none;
    border-radius: 8px;
    font-size: 1.2rem;
    cursor: pointer;
    transition: var(--transition);
    font-weight: bold;
}

button:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 20px rgba(232, 217, 197, 0.5);
}

.error-message {
    text-align: center;
    margin-top: 1.5rem;
    font-size: 1rem;
    padding: 0.8rem;
    border-radius: 8px;
    background-color: rgba(255, 0, 0, 0.1);
    color: #ff4d4d;
    display: none;
}

.error-message.visible {
    display: block;
}
    
    </style>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
    <div class="container">
        <h2>Connexion Admin</h2>
        <form action="LoginServlet" method="POST" id="loginForm">
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>
            <div class="form-group">
                <label>Mot de passe</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit">Se Connecter</button>
        </form>
        <p id="errorMessage" class="error-message">Identifiants incorrects.</p>
    </div>

    <script>
        document.getElementById("loginForm").addEventListener("submit", function(event) {
            let errorMessage = document.getElementById("errorMessage");
            errorMessage.classList.add("hidden");
        });

        <% if (request.getAttribute("error") != null) { %>
            document.getElementById("errorMessage").classList.remove("hidden");
        <% } %>
    </script>
</body>
</html>
