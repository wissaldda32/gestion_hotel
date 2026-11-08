<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription Client</title>
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

        .message.success {
            background-color: rgba(0, 255, 0, 0.1);
            color: #00cc66;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="image-section"></div>
        <div class="form-section">
            <h2>Inscription Client</h2>
            <form action="inscription" method="post">
                <div class="form-group">
                    <label for="nom">Nom:</label>
                    <input type="text" id="nom" name="nom" required>
                </div>
                <div class="form-group">
                    <label for="prenom">Prénom:</label>
                    <input type="text" id="prenom" name="prenom" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="telephone">Téléphone:</label>
                    <input type="text" id="telephone" name="telephone" required>
                </div>
                <div class="form-group">
                    <label for="motDePasse">Mot de passe:</label>
                    <input type="password" id="motDePasse" name="motDePasse" required>
                </div>
                <button type="submit">S'inscrire</button>
            </form>

            <p class="login-link">Déjà membre ? <a href="login.jsp">Me connecter</a></p>
        </div>
    </div>

    <%
        String error = request.getParameter("error");
        String success = request.getParameter("success");
    %>

    <% if (error != null) { %>
        <div class="message error">
            <% if ("champs_vides".equals(error)) { %>
                🚨 Tous les champs sont obligatoires !
            <% } else if ("email_invalide".equals(error)) { %>
                🚨 Adresse email invalide !
            <% } else if ("telephone_invalide".equals(error)) { %>
                🚨 Numéro de téléphone invalide !
            <% } else if ("mot_de_passe_invalide".equals(error)) { %>
                🚨 Le mot de passe doit contenir au moins 8 caractères, 1 majuscule et 1 chiffre !
            <% } else if ("email_existe".equals(error)) { %>
                🚨 Cet email est déjà utilisé !
            <% } else if ("inscription_failed".equals(error)) { %>
                🚨 Une erreur est survenue, veuillez réessayer.
            <% } %>
        </div>
    <% } %>

    <% if ("inscription_ok".equals(success)) { %>
        <div class="message success">✅ Inscription réussie, vous pouvez vous connecter !</div>
    <% } %>
</body>
</html>