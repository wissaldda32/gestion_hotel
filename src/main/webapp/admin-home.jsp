<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="admin-navbar.jsp" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord Admin</title>
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

        /* Tableau de bord */
        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        h1 {
            font-size: 2.5rem;
            color: var(--soft-charcoal);
            margin-bottom: 2rem;
            text-align: center;
        }

        .grid {
            display: grid;
            gap: 1.5rem;
        }

        .card {
            background-color: var(--warm-beige);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: var(--transition);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        .card h2 {
            font-size: 1.75rem;
            color: var(--soft-charcoal);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .card p {
            font-size: 1.1rem;
            color: var(--taupe);
            margin-bottom: 1.5rem;
        }

        .card a {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            background: linear-gradient(135deg, var(--soft-gold), var(--taupe));
            color: var(--cream-white);
            border-radius: 8px;
            text-decoration: none;
            font-size: 1.1rem;
            transition: var(--transition);
        }

        .card a:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(232, 217, 197, 0.5);
        }

        @media (min-width: 768px) {
            .grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>Bienvenue, Administrateur !</h1>
        
        <div class="grid">
            <!-- Carte des chambres -->
            <div class="card">
                <h2>📌 Chambres</h2>
                <p>Gérez les chambres et leurs disponibilités.</p>
                <a href="gestion-chambres.jsp">Voir les chambres</a>
            </div>

            <!-- Carte des réservations -->
            <div class="card">
                <h2>📌 Réservations</h2>
                <p>Gérez les réservations et leur statut.</p>
                <a href="gestion-reservations.jsp">Voir les réservations</a>
            </div>
        </div>
    </div>
</body>
</html>