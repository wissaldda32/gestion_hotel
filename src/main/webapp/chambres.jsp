<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.ChambreDAO" %>
<%@ page import="metier.Chambre" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chambres et Suites</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600&display=swap" rel="stylesheet">

  <style>
        :root {
            --soft-gold: #E8D9C5;
            --warm-beige: #F5EDE2;
            --cream-white: #FFFCF8;
            --taupe: #D3C0B2;
            --soft-charcoal: #4A4A4A;
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
            line-height: 1.8;
            font-size: 20px;
        }

        header {
            background: linear-gradient(to right, var(--warm-beige), var(--cream-white));
            padding: 2rem;
            border-bottom: 1px solid var(--soft-gold);
            text-align: center;
        }

        nav {
            background-color: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
            padding: 1.5rem;
            margin-top: 1rem;
        }

        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
            gap: 3rem;
            font-size: 1.2rem;
            flex-wrap: wrap;
        }

        nav a {
            color: var(--soft-charcoal);
            text-decoration: none;
            padding: 0.8rem 1.5rem;
            transition: all 0.3s;
            border-bottom: 2px solid transparent;
        }

        nav a:hover {
            border-bottom: 2px solid var(--taupe);
        }

        .banner {
            position: relative;
            height: 60vh;
            margin: 2rem 0;
        }

        .banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.8) sepia(0.1);
        }

        .overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: var(--cream-white);
            width: 90%;
            max-width: 1200px;
        }

        .overlay h2 {
            font-size: 4rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            letter-spacing: 2px;
        }

        .presentation {
            max-width: 1200px;
            margin: 4rem auto;
            padding: 2rem;
            text-align: center;
        }

        .presentation-img {
            width: 100%;
            max-width: 800px;
            height: auto;
            margin: 2rem auto;
            border-radius: 15px;
            border: 3px solid var(--soft-gold);
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .separator {
            width: 150px;
            height: 2px;
            background-color: var(--soft-gold);
            margin: 2rem auto;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 4rem;
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
            justify-items: center;
        }

        .card {
            background: var(--cream-white);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            border: 1px solid var(--taupe);
            max-width: 500px;
            margin: 0 auto;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
        }

        .card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-bottom: 3px solid var(--soft-gold);
            transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            filter: grayscale(20%);
        }

        .card:hover img {
            filter: grayscale(0%);
            transform: scale(1.02);
        }

        .card-content {
            padding: 2rem;
            text-align: center;
        }

        .card h2 {
            font-size: 2.2rem;
            color: var(--soft-charcoal);
            margin-bottom: 1rem;
            font-weight: 400;
        }

        .card p {
            font-size: 1.1rem;
            color: var(--taupe);
            line-height: 1.6;
            margin-bottom: 2rem;
        }

        .card-buttons {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            align-items: center;
        }

        .reserve-button {
            background-color: var(--soft-gold);
            color: var(--cream-white);
            padding: 1rem 2rem;
            text-decoration: none;
            border-radius: 30px;
            transition: all 0.3s;
            border: 1px solid var(--taupe);
        }

        .reserve-button:hover {
            background-color: var(--taupe);
        }

        .more-button {
            border: 2px solid var(--soft-gold);
            color: var(--soft-charcoal);
            padding: 1rem 2rem;
            text-decoration: none;
            border-radius: 30px;
            transition: all 0.3s;
        }

        .more-button:hover {
            background-color: var(--soft-gold);
            color: var(--cream-white);
        }

        footer {
            background-color: var(--warm-beige);
            color: var(--soft-charcoal);
            text-align: center;
            padding: 3rem;
            margin-top: 5rem;
            border-top: 1px solid var(--soft-gold);
        }

        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
                padding: 1rem;
            }

            nav ul {
                flex-direction: column;
                gap: 1rem;
            }

            .banner {
                height: 40vh;
            }

            .overlay h2 {
                font-size: 2.5rem;
            }

            .presentation-img {
                max-width: 90%;
            }

            .card {
                max-width: 100%;
                margin: 0 1rem;
            }

            .card img {
                height: 250px;
            }
        }
    </style>

        <script>
        function verifierAuthentification(idChambre) {
            let isAuthenticated = <%= (session.getAttribute("email") != null) ? "true" : "false" %>;
            if (isAuthenticated) {
                window.location.href = "reservation.jsp?id=" + idChambre;
            } else {
                window.location.href = "login.jsp";
            }
        }
    </script>
</head>
<body>
    <header>
        <h1>Nos chambres</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Accueil</a></li>
                <li><a href="chambres.jsp">Chambres</a></li>
                <li><a href="location">Location</a></li>
                <li><a href="reviews.jsp">Reviews</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="aboutus.jsp">À propos</a></li>
            </ul>
        </nav>
    </header>

    <div class="banner">
        <section class="banner">
            <img src="images/hotel1.jpg" alt="Hôtel de Luxe">
            <div class="overlay">
                <h2>Chambres et Suites</h2>
            </div>
        </section>
    </div>

    <div class="presentation">
        <h2>Chambres et Suites</h2>
        <div class="separator"></div>
        <img src="images/decoration.jpg" alt="Décoration intérieure" class="presentation-img">
        <p>Au Sofitel Kasba Tadla, découvrez la magie des chambres alliant un décor contemporain. Une déconnexion apportée par le doux bruit des fontaines. Parce que chacune de nos chambres est unique, chaque séjour au Sofitel est une expérience merveilleuse. À travers nos fenêtres et nos magnifiques terrasses, vous prenez plaisir à observer les vues les plus spectaculaires sur la belle ville de Kasba.</p>
    </div>

    <div class="container">
        <%
            ChambreDAO chambreDAO = new ChambreDAO();
            List<Chambre> chambres = chambreDAO.getChambresDisponibles();
            for (Chambre chambre : chambres) {
        %>
        <div class="card">
            <img src="<%= chambre.getImageUrl() %>" alt="<%= chambre.getType() %>">
            <div class="card-content">
                <h2><%= chambre.getType() %></h2>
                <p><%= chambre.getDescription() %></p>
                <div class="card-buttons">
                    <a href="#" class="reserve-button" onclick="verifierAuthentification('<%= chambre.getId() %>')">Réserver maintenant →</a>
                    <a href="#" class="more-button">En voir davantage →</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <footer>
        <p>&copy; 2024 Hôtel Luxe - Tous droits réservés.</p>
    </footer>
</body>
</html>
