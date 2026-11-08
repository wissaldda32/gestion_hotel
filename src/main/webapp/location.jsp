<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    
   <style>
   :root {
    --soft-gold: #E8D9C5;
    --warm-beige: #F5EDE2;
    --cream-white: #FFFCF8;
    --taupe: #D3C0B2;
    --soft-charcoal: #4A4A4A;
    --transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.1);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Playfair Display', serif;
}

body {
    background-color: var(--cream-white);
    color: var(--soft-charcoal);
    line-height: 1.8;
    font-size: 18px;
    scroll-behavior: smooth;
}

header {
    background: linear-gradient(to right, var(--warm-beige), var(--cream-white));
    padding: 2rem;
    border-bottom: 1px solid var(--soft-gold);
    text-align: center;
    position: relative;
    overflow: hidden;
}

header::after {
    content: '';
    position: absolute;
    bottom: -50px;
    left: 0;
    width: 100%;
    height: 50px;
    background: linear-gradient(to bottom, var(--warm-beige), transparent);
}

nav {
    background-color: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(5px);
    padding: 1.5rem;
    margin-top: 1rem;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
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
    transition: var(--transition);
    border-radius: 30px;
    position: relative;
}

nav a:hover {
    background: rgba(232, 217, 197, 0.2);
}

nav a::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    width: 0;
    height: 2px;
    background: var(--taupe);
    transition: var(--transition);
}

nav a:hover::after {
    width: 100%;
    left: 0;
}

.container {
    padding: 2rem;
    max-width: 1200px;
    margin: 0 auto;
}

.title-section {
    text-align: center;
    margin-bottom: 3rem;
}

.title {
    font-size: 3rem;
    color: var(--soft-charcoal);
    font-weight: 600;
    letter-spacing: 1px;
}

.contact-section {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 2rem;
    margin-bottom: 4rem;
}

.contact-section div {
    background: linear-gradient(145deg, rgba(255, 255, 255, 0.9), var(--warm-beige));
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.contact-section h3 {
    font-size: 1.8rem;
    margin-bottom: 1rem;
    color: var(--soft-charcoal);
}

.contact-section p {
    font-size: 1.2rem;
    margin-bottom: 0.5rem;
    color: var(--taupe);
}

.contact-section a {
    color: var(--soft-charcoal);
    text-decoration: none;
    font-weight: 500;
    transition: var(--transition);
}

.contact-section a:hover {
    color: var(--soft-gold);
}

.map {
    margin-top: 2rem;
    text-align: center;
}

.map iframe {
    width: 100%;
    height: 400px;
    border: 0;
    border-radius: 10px;
}

footer {
    background-color: var(--warm-beige);
    color: var(--soft-charcoal);
    text-align: center;
    padding: 3rem;
    margin-top: 5rem;
    border-top: 1px solid var(--soft-gold);
    position: relative;
}

footer .social-media {
    margin-bottom: 1.5rem;
}

footer .social-media a {
    margin: 0 10px;
    color: var(--soft-charcoal);
    font-size: 2rem;
    transition: var(--transition);
}

footer .social-media a:hover {
    color: var(--soft-gold);
}

footer p {
    font-size: 1.2rem;
    color: var(--taupe);
}

/* Mobile Responsive */
@media (max-width: 768px) {
    .contact-section {
        grid-template-columns: 1fr;
    }

    .title {
        font-size: 2.5rem;
    }

    .contact-section h3 {
        font-size: 1.5rem;
    }

    .contact-section p {
        font-size: 1rem;
    }

    .map iframe {
        height: 300px;
    }

    footer p {
        font-size: 1rem;
    }
}
   
   </style>
   
    
<body>
<header>
        <h1>Notre location</h1>
       <nav>
            <ul>
                <li><a href="index.jsp">Accueil</a></li>
                <li><a href="chambres.jsp">Chambres</a></li>
                <li><a href="location">Location</a></li>
                <li><a href="reviews.jsp">reviews</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                 <li><a href="aboutus.jsp">À propos</a></li>
            </ul>
        </nav>
    </header>
    <div class="container">
        <div class="title-section">
            <div class="title">Location & Contact</div>
        </div>

        <div class="contact-section">
            <div>
                <h3>Hotel Location</h3>
                <p>Avenue Mohamed V, Quartier Al Fadila</p>
                <p>44000 ESSAOUIRA</p>
                <p>Morocco</p>
                <p><a href="https://www.google.com/maps" target="_blank">Get Directions</a></p>
            </div>
            <div>
                <h3>Hotel Contact</h3>
                <p>Telephone: +212 500000</p>
                <p>Email: <a href="AcheSmito@Hotel.com">AcheSmito@Hotel.com</a></p>
            </div>
            <div>
                <h3>Parking Lot</h3>
                <p>Parking included</p>
                <p>Enclosed outdoor parking</p>
            </div>
        </div>

        <!-- Google Maps -->
        <div class="map">
            <h3>Find Us Here</h3>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4881.439568298514!2d-9.76637408369312!3d31.508213051620235!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xdad9a4e9f588ccf%3A0x57421a176d5d7d30!2sEssaouira!5e0!3m2!1sen!2sma!4v1740187671051!5m2!1sen!2sma" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="social-media">
            <a href="https://www.facebook.com" target="_blank">
                <i class="fab fa-facebook fa-2x" style="color: #3b5998;"></i>
            </a>
            <a href="https://www.youtube.com" target="_blank">
                <i class="fab fa-youtube fa-2x" style="color: #FF0000;"></i>
            </a>
            <a href="https://www.instagram.com" target="_blank">
                <i class="fab fa-instagram fa-2x" style="color: #E4405F;"></i>
            </a>
        </div>
      <p>&copy; 2025 Hôtel Luxe - Tous droits réservés.</p>
      
    </footer>
</body>
</html>