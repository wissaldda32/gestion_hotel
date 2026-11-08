<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Avis des Clients</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
  
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
        font-family: 'Cormorant Garamond', serif;
    }

    body {
        background-color: var(--cream-white);
        color: var(--soft-charcoal);
        line-height: 1.8;
        font-size: 20px;
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
    .review-form input,
.review-form textarea {
    width: 100%;
    padding: 1.2rem;
    border: 2px solid var(--taupe);
    border-radius: 10px;
    background: rgba(255, 255, 255, 0.95);
    font-size: 1.1rem;
    transition: var(--transition);
    color: var(--soft-charcoal);
    margin-bottom: 1.5rem; /* Espace ajouté entre les champs */
}
    

    .review-form {
        max-width: 800px;
        margin: 4rem auto;
        padding: 3rem;
        background: linear-gradient(145deg, var(--warm-beige) 0%, var(--cream-white) 100%);
        border-radius: 15px;
        border: 2px solid var(--soft-gold);
        box-shadow: 0 15px 40px rgba(0, 0, 0, 0.08);
        transform: translateY(20px);
        opacity: 0;
        animation: fadeInUp 0.6s ease forwards;
    }

    @keyframes fadeInUp {
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .review-form h2 {
        color: var(--soft-charcoal);
        font-size: 2.8rem;
        margin-bottom: 2.5rem;
        text-align: center;
        letter-spacing: 1px;
        position: relative;
    }

    .review-form h2::after {
        content: '✍️';
        position: absolute;
        right: 0;
        bottom: -10px;
        font-size: 1.5rem;
        opacity: 0.3;
    }

    .review-form input,
    .review-form textarea {
        width: 100%;
        padding: 1.2rem;
        border: 2px solid var(--taupe);
        border-radius: 10px;
        background: rgba(255, 255, 255, 0.95);
        font-size: 1.1rem;
        transition: var(--transition);
        color: var(--soft-charcoal);
    }

    .review-form input:focus,
    .review-form textarea:focus {
        outline: none;
        border-color: var(--soft-gold);
        box-shadow: 0 0 0 4px rgba(232, 217, 197, 0.3);
        transform: scale(1.02);
    }

    .review-form textarea {
        min-height: 150px;
        resize: vertical;
    }

    .review-form button {
        background: linear-gradient(135deg, var(--soft-gold), var(--taupe));
        color: var(--cream-white);
        padding: 1.2rem 2.5rem;
        border: none;
        border-radius: 40px;
        font-size: 1.3rem;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
        gap: 10px;
        margin: 1rem auto 0;
        box-shadow: 0 4px 15px rgba(232, 217, 197, 0.3);
    }

    .review-form button:hover {
        transform: translateY(-3px) scale(1.05);
        box-shadow: 0 6px 20px rgba(232, 217, 197, 0.5);
    }

    .review-list {
        background-color: rgba(245, 237, 226, 0.1);
        padding: 4rem 2rem;
        clip-path: polygon(0 3%, 100% 0, 100% 97%, 0 100%);
    }

    .review-list h2 {
        color: var(--soft-charcoal);
        font-size: 3rem;
        margin-bottom: 4rem;
        text-align: center;
        position: relative;
        padding-bottom: 1rem;
    }

    .review-list h2::before {
        content: '⭐';
        position: absolute;
        left: 50%;
        bottom: -15px;
        transform: translateX(-50%);
        font-size: 2rem;
        opacity: 0.3;
    }

    .review {
        background: linear-gradient(145deg, rgba(255, 255, 255, 0.9) 0%, var(--warm-beige) 100%);
        padding: 2.5rem;
        margin-bottom: 2.5rem;
        border-left: 5px solid var(--soft-gold);
        transition: var(--transition);
        opacity: 0;
        transform: translateX(-20px);
    }

    .review.visible {
        opacity: 1;
        transform: translateX(0);
    }

    .review:hover {
        transform: translateX(10px);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    }

    .review h3 {
        color: var(--soft-charcoal);
        font-size: 2rem;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .review h3::before {
        content: '👤';
        font-size: 1.5rem;
        opacity: 0.8;
    }

    .review p {
        color: var(--taupe);
        font-size: 1.2rem;
        line-height: 1.7;
        padding-left: 2rem;
        border-left: 2px solid var(--soft-gold);
        position: relative;
    }

    .review p::before {
        content: '“';
        position: absolute;
        left: -1rem;
        top: -0.5rem;
        font-size: 3rem;
        color: var(--soft-gold);
        opacity: 0.3;
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

    footer::before {
        content: '';
        position: absolute;
        top: -20px;
        left: 50%;
        transform: translateX(-50%);
        width: 60%;
        height: 20px;
        background: radial-gradient(ellipse at center, rgba(0, 0, 0, 0.08) 0%, rgba(0, 0, 0, 0) 80%);
    }

    @media (max-width: 768px) {
        .review-form {
            padding: 2rem;
            margin: 2rem 1rem;
            border-radius: 10px;
        }

        .review-list {
            padding: 3rem 1rem;
            clip-path: polygon(0 1%, 100% 0, 100% 99%, 0 100%);
        }

        .review {
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .review h3 {
            font-size: 1.6rem;
        }

        .review p {
            font-size: 1.1rem;
            padding-left: 1rem;
        }

        footer {
            padding: 2rem 1rem;
        }
    }
</style>
</head>
<body>
    <header>
        <h1>Avis des Clients</h1>
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

    <section class="review-form">
        <h2>Laisser un avis</h2>
        <form action="addReview.jsp" method="post">
            <input type="text" name="name" placeholder="Votre nom" required>
            <input type="number" name="rating" min="1" max="5" placeholder="Note (1 à 5)" required>
            <textarea name="comment" placeholder="Votre commentaire" required></textarea>
            <button type="submit">Envoyer</button>
        </form>
    </section>

    <section class="review-list">
        <h2>Avis des Clients</h2>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionhotel", "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM reviews ORDER BY id DESC");

                while (rs.next()) {
        %>
                    <div class="review">
                        <h3><%= rs.getString("name") %> - ⭐ <%= rs.getInt("rating") %>/5</h3>
                        <p><%= rs.getString("comment") %></p>
                    </div>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<p>Erreur lors du chargement des avis.</p>");
            }
        %>
    </section>
    <footer>
        <p>&copy; 2025 Hôtel Luxe - Tous droits réservés.</p>
    </footer>
    <script>
    // Animation des avis au défilement
    const reviews = document.querySelectorAll('.review');
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if(entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, { threshold: 0.1 });

    reviews.forEach(review => observer.observe(review));
</script>
</body>
</html>
