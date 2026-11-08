<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Confirmation de Réservation</title>
   <style>
    :root {
        --soft-gold: #E8D9C5;
        --warm-beige: #F5EDE2;
        --cream-white: #FFFCF8;
        --taupe: #D3C0B2;
        --soft-charcoal: #4A4A4A;
        --empire-green: #2E8B57; /* Vert Empire */
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
        line-height: 1.8;
        font-size: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 2rem;
    }

    .container {
        text-align: center;
        background-color: var(--warm-beige);
        padding: 3rem;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        width: 100%;
    }

    h2 {
        font-size: 2.5rem;
        color: var(--empire-green); /* Vert Empire */
        margin-bottom: 1.5rem;
    }

    p {
        font-size: 1.2rem;
        color: var(--soft-charcoal);
        margin-bottom: 2rem;
    }

    a {
        display: inline-block;
        background-color: var(--soft-gold);
        color: var(--cream-white);
        padding: 1rem 2rem;
        text-decoration: none;
        border-radius: 30px;
        font-size: 1.1rem;
        transition: var(--transition);
        border: 1px solid var(--taupe);
    }

    a:hover {
        background-color: var(--taupe);
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(232, 217, 197, 0.5);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        h2 {
            font-size: 2rem;
        }

        p {
            font-size: 1rem;
        }

        a {
            padding: 0.8rem 1.5rem;
            font-size: 1rem;
        }

        .container {
            padding: 2rem;
        }
    }
</style>
</head>
<body>

<div class="container">
    <h2>Votre réservation a été enregistrée avec succès !</h2>
    <p>Merci pour votre confiance.</p>
    <a href="index.jsp">Retour à l'accueil</a>
</div>

</body>
</html>
