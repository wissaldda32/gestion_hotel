<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>À propos de nous</title>
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

    header h1 {
        font-size: 3rem;
        color: var(--soft-charcoal);
        margin-bottom: 1rem;
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

    .about-us {
        max-width: 1200px;
        margin: 4rem auto;
        padding: 2rem;
        text-align: center;
    }

    .about-us h2 {
        font-size: 2.5rem;
        color: var(--soft-charcoal);
        margin-bottom: 1.5rem;
    }

    .about-us p {
        font-size: 1.2rem;
        color: var(--soft-charcoal);
        line-height: 1.8;
        margin-bottom: 2rem;
    }

    .chef-photo {
        margin: 2rem 0;
    }

    .chef-photo img {
        width: 100%;
        max-width: 400px;
        border-radius: 15px;
        border: 3px solid var(--soft-gold);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .chef-photo h3 {
        font-size: 2rem;
        color: var(--soft-charcoal);
        margin: 1.5rem 0;
    }

    .chef-photo p {
        font-size: 1.1rem;
        color: var(--soft-charcoal);
        line-height: 1.8;
    }

    .about-us ul {
        list-style: none;
        padding: 0;
    }

    .about-us ul li {
        margin-bottom: 4rem;
    }

    .about-us ul li h4 {
        font-size: 1.75rem;
        color: var(--soft-charcoal);
        margin-bottom: 1rem;
    }

    .meal-content {
        display: flex;
        align-items: center;
        gap: 3rem;
        margin-bottom: 2rem;
    }

    /* Alternance des images à gauche et à droite */
    .meal-content:nth-child(odd) {
        flex-direction: row-reverse; /* Image à droite */
    }

    .meal-content:nth-child(even) {
        flex-direction: row; /* Image à gauche */
    }

    .meal-content p {
        flex: 1;
        font-size: 1.1rem;
        color: var(--soft-charcoal);
        line-height: 1.8;
    }

    .meal-content img {
        width: 250px; /* Image plus grande */
        height: 250px;
        border-radius: 15px;
        object-fit: cover;
        border: 3px solid var(--soft-gold);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        transition: all 0.3s;
    }

    .meal-content img:hover {
        transform: scale(1.05); /* Effet de zoom au survol */
        filter: brightness(1.1); /* Luminosité augmentée */
    }

    footer {
        background-color: var(--warm-beige);
        color: var(--soft-charcoal);
        text-align: center;
        padding: 3rem;
        margin-top: 5rem;
        border-top: 1px solid var(--soft-gold);
    }

    footer p {
        font-size: 1.1rem;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        header h1 {
            font-size: 2.5rem;
        }

        nav ul {
            flex-direction: column;
            gap: 1rem;
        }

        .about-us {
            padding: 1rem;
        }

        .meal-content {
            flex-direction: column;
            text-align: center;
        }

        .meal-content img {
            width: 100%;
            max-width: 300px;
            height: auto;
        }

        /* Annule l'alternance sur les petits écrans */
        .meal-content:nth-child(odd),
        .meal-content:nth-child(even) {
            flex-direction: column;
        }
    }
</style>
</head>
<body>
    <header>
        <h1>À propos de l'Hôtel Luxe</h1>
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

    <section class="about-us">
        <h2>Notre Histoire</h2>
        <p>Notre hôtel est un établissement de luxe situé au cœur de la ville, offrant un service personnalisé et une atmosphère chaleureuse. Depuis notre ouverture, nous nous efforçons de fournir une expérience unique à chaque client.</p>
        
        <h2>Nos Services</h2>
        <p>Nous offrons une gamme de services incluant des chambres confortables, un spa de détente, et un restaurant gastronomique.</p>
        
        <h2>Notre Cuisine</h2>
        <p>Notre restaurant propose une cuisine raffinée, mettant en valeur les produits locaux de la région. Nos chefs préparent des plats traditionnels et modernes, avec des influences internationales, pour satisfaire tous les goûts.</p>
        
        <div class="chef-photo">
            <h3>Notre Chef</h3>
            <img src="images/chef.jpg" alt="Chef Moha">
            <p>Notre chef cuisinier, Moha, est un expert de la cuisine marocaine. Avec des années d'expérience dans la préparation des plats traditionnels, il crée des repas qui capturent les saveurs authentiques du Maroc. Son art culinaire repose sur l'utilisation d'ingrédients frais et locaux, et il est passionné par le partage de la culture gastronomique marocaine avec nos invités.</p>
        </div>

        <h3>Repas Traditionnels Marocains :</h3>
        <ul>
            <li> 
                <h4>Petit Déjeuner</h4>
                <div class="meal-content">
                    <p>Un repas léger et délicieux pour commencer la journée, avec des dattes, du lait, des crêpes marocaines (M'semen), des baghrirs, et des fruits frais, accompagné de thé à la menthe.</p>
                    <img src="images/ff.jpg" alt="Petit déjeuner marocain" class="meal-image">
                </div>
            </li>
            <li>
                <h4>Déjeuner</h4>
                <div class="meal-content">
                    <p>Un repas copieux comprenant des plats traditionnels comme le couscous aux légumes, le tajine de poulet au citron confit et olives, et des salades marocaines fraîches.</p>
                    <img src="images/ghaa.jpg" alt="Déjeuner marocain" class="meal-image">
                </div>
            </li>
            <li>
                <h4>Goûter</h4>
                <div class="meal-content">
                    <p>Une pause gourmande avec des pâtisseries marocaines comme les cornes de gazelle, les ghribas, et des fruits secs accompagnés de thé à la menthe sucré.</p>
                    <img src="images/gg.jpg" alt="Goûter marocain" class="meal-image">
                </div>
            </li>
            <li>
                <h4>Dîner</h4>
                <div class="meal-content">
                    <p>Un repas raffiné pour clore la journée, avec des plats comme le tajine de kefta aux œufs, les pastillas, et un assortiment de fruits frais pour terminer en beauté.</p>
                    <img src="images/dinner.jpg" alt="Dîner marocain" class="meal-image">
                </div>
            </li>
        </ul>
    </section>

    <footer>
        <p>&copy; 2025 Hôtel Luxe - Tous droits réservés.</p>
    </footer>
</body>
</html>
