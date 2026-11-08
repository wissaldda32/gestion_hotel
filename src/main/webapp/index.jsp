<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
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
    }

    .admin-btn-container {
        position: absolute;
        top: 25px;
        right: 35px;
        display: flex;
        gap: 15px;
    }

    .admin-btn {
        color: var(--soft-charcoal);
        text-decoration: none;
        padding: 12px 25px;
        border-radius: 25px;
        background-color: rgba(232, 217, 197, 0.3);
        transition: all 0.3s;
        border: 1px solid var(--taupe);
        font-size: 1.1rem;
    }

    .admin-btn:hover {
        background-color: rgba(232, 217, 197, 0.5);
    }

    h1 {
        text-align: center;
        margin: 3rem 0;
        font-size: 3.5rem;
        color: var(--soft-charcoal);
        font-weight: 300;
        letter-spacing: 1px;
    }

    nav {
        background-color: rgba(255, 255, 255, 0.9);
        backdrop-filter: blur(5px);
        padding: 1.5rem;
    }

    nav ul {
        list-style: none;
        display: flex;
        justify-content: center;
        gap: 3rem;
        font-size: 1.2rem;
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
        height: 70vh;
        background: linear-gradient(to bottom, rgba(245, 237, 226, 0.2), rgba(255, 252, 248, 0.8));
    }

    .banner img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        opacity: 0.9;
        mix-blend-mode: multiply;
    }

    .overlay {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        color: var(--soft-charcoal);
        padding: 3rem;
        max-width: 800px;
    }

    .overlay h2 {
        font-size: 3rem;
        margin-bottom: 1.5rem;
        font-weight: 300;
        text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.5);
    }

    .overlay p {
        font-size: 1.5rem;
        margin-bottom: 2rem;
        color: var(--taupe);
    }

    .btn {
        padding: 15px 35px;
        font-size: 1.3rem;
        background-color: transparent;
        color: var(--soft-charcoal);
        border: 1px solid var(--taupe);
        border-radius: 30px;
        transition: all 0.3s;
    }

    .btn:hover {
        background-color: var(--taupe);
        color: var(--cream-white);
    }

.services {
    padding: 8rem 2rem;
    background-color: var(--warm-beige);
}

.services h2 {
    text-align: center;
    margin-bottom: 6rem;
    font-size: 3.5rem;
    color: var(--soft-charcoal);
    font-weight: 300;
    letter-spacing: 2px;
}

.service-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 5rem;
    max-width: 1400px;
    margin: 0 auto;
    padding: 0 2rem;
}

.service {
    text-align: center;
    padding: 4rem;
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 25px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
    transition: all 0.3s ease;
    min-height: 600px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow: hidden; /* Ajouté pour le zoom */
}

.service:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 40px rgba(0,0,0,0.12);
}

.service img {
    width: 90%;
    max-width: 400px;
    height: 350px;
    object-fit: cover;
    border-radius: 15px;
    margin: 0 auto 2.5rem;
    display: block;
    filter: grayscale(20%);
    border: 2px solid var(--soft-gold);
    transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.service:hover img {
    transform: scale(1.05);
    filter: grayscale(0%);
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

.service h3 {
    font-size: 2.5rem;
    margin: 2rem 0;
    color: var(--soft-charcoal);
    font-weight: 400;
    line-height: 1.3;
}

.service p {
    font-size: 1.3rem;
    line-height: 1.8;
    color: var(--taupe);
    margin-bottom: 2rem;
    padding: 0 1.5rem;
}

@media (max-width: 768px) {
    .services {
        padding: 6rem 1rem;
    }
    
    .service {
        min-height: 500px;
        padding: 3rem;
    }
    
    .service img {
        height: 250px;
        max-width: 300px;
    }
    
    .services h2 {
        font-size: 3rem;
        margin-bottom: 4rem;
    }
    
    .service-container {
        grid-template-columns: 1fr;
        gap: 4rem;
    }
    
    .service h3 {
        font-size: 2.2rem;
    }
    
    .service p {
        font-size: 1.2rem;
    }
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
        h1 { font-size: 2.5rem; }
        .overlay h2 { font-size: 2rem; }
        .overlay p { font-size: 1.2rem; }
        nav ul { flex-direction: column; gap: 1rem; }
        .service { padding: 2rem; }
    }
</style>  
   
</head>

<body>
<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String email = (String) sessionUser.getAttribute("email");
%>
<header>
<div class="admin-btn-container">
    <a href="admin-login.jsp" class="admin-btn">Admin</a>
    <a href="login" class="admin-btn">se connecter</a>
    <a href="logout" class="admin-btn">Log out</a>
    
</div>
        <h1>Bienvenue à l'Hôtel Luxe</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Accueil</a></li>
                <li><a href="chambres.jsp">Chambres</a></li>
                <li><a href="BoiteReceptionServlet">Boîte de réception</a></li>
                <li><a href="location">Location</a></li>
                <li><a href="reviews.jsp">reviews</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="aboutus.jsp">À propos</a></li>
            </ul>
        </nav>
    </header>

    <section class="banner">
        <img src="images/hotel1.jpg" alt="Hôtel de Luxe">
        <div class="overlay">
            <h2>Une expérience unique</h2>
            <p>Réservez dès maintenant pour un séjour inoubliable</p>
            <a href="chambres.jsp" class="btn">Réserver</a>
        </div>
    </section>

    <section class="services">
        <h2>Nos Services</h2>
        <div class="service-container">
            <div class="service">
                <img src="images/chambre.jpg" alt="Chambres confortables">
                <h3>Chambres confortables</h3>
                <p>Des chambres luxueuses avec une vue imprenable.</p>
            </div>
            <div class="service">
                <img src="images/rest.jpg" alt="Restaurant">
                <h3>Restaurant 5 étoiles</h3>
                <p>Un menu raffiné préparé par nos chefs renommés.</p>
            </div>
            <div class="service">
                <img src="images/spa.jpg" alt="Spa et bien-être">
                <h3>Spa et Bien-être</h3>
                <p>Un espace de relaxation pour un séjour agréable.</p>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 Hôtel Luxe - Tous droits réservés.</p>
    </footer>
</body>
</html>