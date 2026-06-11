<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil - Mini Gestionnaire de Taches</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css">
</head>
<body>
<main class="page">
    <section class="hero">
        <p class="eyebrow">Projet JSP / Servlets</p>
        <h1>Mini Gestionnaire de Taches</h1>
        <p>Ajoute, consulte, supprime et termine tes taches pendant ta session utilisateur.</p>

        <nav class="actions" aria-label="Navigation principale">
            <a class="button primary" href="${pageContext.request.contextPath}/add-task.jsp">Ajouter une tache</a>
            <a class="button secondary" href="${pageContext.request.contextPath}/tasks.jsp">Voir les taches</a>
        </nav>
    </section>
</main>
</body>
</html>
