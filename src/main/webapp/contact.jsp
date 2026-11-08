<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contactez-nous</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600&display=swap" rel="stylesheet">
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

    .contact-form {
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

    .contact-form h2 {
        color: var(--soft-charcoal);
        font-size: 2.8rem;
        margin-bottom: 2.5rem;
        text-align: center;
        letter-spacing: 1px;
    }

    .contact-form input,
    .contact-form textarea {
        width: 100%;
        padding: 1.2rem;
        border: 2px solid var(--taupe);
        border-radius: 10px;
        background: rgba(255, 255, 255, 0.95);
        font-size: 1.1rem;
        transition: var(--transition);
        color: var(--soft-charcoal);
        margin-bottom: 1.5rem; /* Space added between fields */
    }

    .contact-form input:focus,
    .contact-form textarea:focus {
        outline: none;
        border-color: var(--soft-gold);
        box-shadow: 0 0 0 4px rgba(232, 217, 197, 0.3);
        transform: scale(1.02);
    }

    .contact-form textarea {
        min-height: 150px;
        resize: vertical;
    }

    .contact-form button {
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

    .contact-form button:hover {
        transform: translateY(-3px) scale(1.05);
        box-shadow: 0 6px 20px rgba(232, 217, 197, 0.5);
    }

    .messages {
        background-color: rgba(245, 237, 226, 0.1);
        padding: 4rem 2rem;
        clip-path: polygon(0 3%, 100% 0, 100% 97%, 0 100%);
    }

    .messages h2 {
        color: var(--soft-charcoal);
        font-size: 3rem;
        margin-bottom: 4rem;
        text-align: center;
        position: relative;
        padding-bottom: 1rem;
    }

    .messages h2::before {
        content: '⭐';
        position: absolute;
        left: 50%;
        bottom: -15px;
        transform: translateX(-50%);
        font-size: 2rem;
        opacity: 0.3;
    }

    .message {
        background: linear-gradient(145deg, rgba(255, 255, 255, 0.9) 0%, var(--warm-beige) 100%);
        padding: 2.5rem;
        margin-bottom: 2.5rem;
        border-left: 5px solid var(--soft-gold);
        transition: var(--transition);
        opacity: 0;
        transform: translateX(-20px);
    }

    .message.visible {
        opacity: 1;
        transform: translateX(0);
    }

    .message h3 {
        color: var(--soft-charcoal);
        font-size: 2rem;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .message h3::before {
        content: '👤';
        font-size: 1.5rem;
        opacity: 0.8;
    }

    .message p {
        color: var(--taupe);
        font-size: 1.2rem;
        line-height: 1.7;
        padding-left: 2rem;
        border-left: 2px solid var(--soft-gold);
        position: relative;
    }

    .message p::before {
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
        .contact-form {
            padding: 2rem;
            margin: 2rem 1rem;
            border-radius: 10px;
        }

        .messages {
            padding: 3rem 1rem;
            clip-path: polygon(0 1%, 100% 0, 100% 99%, 0 100%);
        }

        .message {
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .message h3 {
            font-size: 1.6rem;
        }

        .message p {
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
        <h1>Contactez-nous</h1>
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

    <section class="contact-form">
        <h2>Envoyez-nous un message</h2>
        <form action="sendMessage.jsp" method="post">
            <input type="text" name="name" placeholder="Votre nom" required>
            <input type="email" name="email" placeholder="Votre email" required>
            <textarea name="message" placeholder="Votre message" required></textarea>
            <button type="submit">Envoyer</button>
        </form>
    </section>

    <section class="messages">
        <h2>Messages des Clients</h2>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionhotel", "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM messages ORDER BY id DESC");

                while (rs.next()) {
        %>
                    <div class="message">
                        <h3><%= rs.getString("name") %> (<%= rs.getString("email") %>)</h3>
                        <p><%= rs.getString("message") %></p>
                    </div>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<p>Erreur lors du chargement des messages.</p>");
            }
        %>
    </section>
     <footer>
        <p>&copy; 2025 Hôtel Luxe - Tous droits réservés.</p>
    </footer>
</body>
</html>
