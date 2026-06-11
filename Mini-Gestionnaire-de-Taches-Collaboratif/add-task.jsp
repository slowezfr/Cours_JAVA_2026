<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une tache</title>
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

<main class="page narrow">
    <section class="hero compact">
        <p class="eyebrow">Nouvelle tache</p>
        <h1>Ajouter une tache</h1>
        <p class="hero-text">Renseigne un titre, une description et une date d'echeance.</p>
    </section>

    <section class="panel">
        <form action="tasks.jsp" method="post" class="task-form">
            <input type="hidden" name="action" value="add">

            <label for="title">Titre</label>
            <input id="title" name="title" type="text" maxlength="80" required>

            <label for="description">Description</label>
            <textarea id="description" name="description" rows="5" maxlength="500" required></textarea>

            <label for="dueDate">Date d'echeance</label>
            <input id="dueDate" name="dueDate" type="date" required>

            <div class="form-actions">
                <button class="button primary" type="submit">Enregistrer</button>
                <a class="button secondary" href="tasks.jsp">Annuler</a>
            </div>
        </form>
    </section>
</main>
</body>
</html>
