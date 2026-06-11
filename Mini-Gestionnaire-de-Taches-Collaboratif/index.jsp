<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mini Gestionnaire de Taches</title>
    <link rel="stylesheet" href="assets/site-style.css">
</head>
<body>
<header class="site-header">
    <nav class="top-nav" aria-label="Navigation principale">
        <a class="brand" href="index.jsp">Mini Gestionnaire</a>
        <div class="nav-links">
            <a href="../index.html">Cours Java</a>
            <a href="add-task.jsp">Ajouter</a>
            <a href="tasks.jsp">Taches</a>
        </div>
    </nav>
</header>

<main class="page">
    <section class="hero">
        <p class="eyebrow">Projet JSP</p>
        <h1>Mini Gestionnaire de Taches</h1>
        <p class="hero-text">Ajoute, consulte, termine et supprime tes taches directement depuis le site deploye sur Tomcat.</p>
        <div class="hero-actions">
            <a class="button primary" href="add-task.jsp">Ajouter une tache</a>
            <a class="button secondary" href="tasks.jsp">Voir les taches</a>
        </div>
    </section>

    <section class="feature-grid" aria-label="Fonctionnalites">
        <article class="feature-card">
            <span class="tag">Session</span>
            <h2>Stockage temporaire</h2>
            <p>Les taches sont gardees dans ta session navigateur pendant l'utilisation du site.</p>
        </article>
        <article class="feature-card">
            <span class="tag">CRUD</span>
            <h2>Actions essentielles</h2>
            <p>Creation, affichage, changement de statut et suppression sont disponibles.</p>
        </article>
        <article class="feature-card">
            <span class="tag">JSP</span>
            <h2>Page deployable</h2>
            <p>Cette version fonctionne dans le WAR actuel, sans compilation Maven separee.</p>
        </article>
    </section>
</main>
</body>
</html>
