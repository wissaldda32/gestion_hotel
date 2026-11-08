<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600&display=swap" rel="stylesheet">
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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 2rem;
        }

        .container {
            display: flex;
            background-color: var(--warm-beige);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            width: 100%;
        }

        .image-section {
            flex: 1;
            background: url('images/insrcc.jpg') no-repeat center center/cover;
        }

        .form-section {
            flex: 1;
            padding: 3rem;
            background-color: var(--cream-white);
        }

        h2 {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--soft-charcoal);
            text-align: center;
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
            margin-top: 1rem;
        }

        button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(232, 217, 197, 0.5);
        }

        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 1rem;
            color: var(--soft-charcoal);
        }

        .login-link a {
            color: var(--taupe);
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
        }

        .login-link a:hover {
            color: var(--soft-gold);
        }

        .message {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 1rem;
            padding: 0.8rem;
            border-radius: 8px;
        }

        .message.error {
            background-color: rgba(255, 0, 0, 0.1);
            color: #ff4d4d;
        }

        .separator {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
        }

        .separator .line {
            flex-grow: 1;
            border-top: 1px solid var(--taupe);
        }

        .separator .text {
            margin: 0 1rem;
            color: var(--soft-charcoal);
        }

        .error-message {
            position: fixed;
            bottom: 1rem;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(255, 0, 0, 0.1);
            color: #ff4d4d;
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="image-section"></div>
        <div class="form-section">
            <h2>Se connecter</h2>
            <form action="login" method="post">
                <div class="form-group">
                    <label for="email">Adresse e-mail ou numéro de membre</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="motDePasse">Mot de passe</label>
                    <input type="password" id="motDePasse" name="motDePasse" required>
                </div>
                <a href="#" class="login-link">Mot de passe oublié ?</a>
                <button type="submit">Me connecter</button>
            </form>
            <div class="separator">
                <div class="line"></div>
                <span class="text">ou</span>
                <div class="line"></div>
            </div>
            <p class="login-link">Pas encore membre ? <a href="Inscription.jsp">S'inscrire gratuitement</a></p>
        </div>
    </div>

    <%
        String error = request.getParameter("error");
    %>
    <% if ("invalid_credentials".equals(error)) { %>
        <div class="error-message">🚨 Email ou mot de passe incorrect. Veuillez réessayer.</div>
    <% } %>
</body>
</html>