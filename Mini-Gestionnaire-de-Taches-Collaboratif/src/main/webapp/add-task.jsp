<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une tache</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css">
</head>
<body>
<main class="page narrow">
    <header class="topbar">
        <a href="${pageContext.request.contextPath}/index.jsp">Accueil</a>
        <a href="${pageContext.request.contextPath}/tasks.jsp">Liste des taches</a>
    </header>

    <section class="panel">
        <h1>Ajouter une tache</h1>

        <form action="${pageContext.request.contextPath}/tasks" method="post" class="task-form">
            <input type="hidden" name="action" value="add">

            <label for="title">Titre</label>
            <input id="title" name="title" type="text" maxlength="80" required>

            <label for="description">Description</label>
            <textarea id="description" name="description" rows="5" maxlength="500" required></textarea>

            <label for="dueDate">Date d'echeance</label>
            <input id="dueDate" name="dueDate" type="date" required>

            <div class="form-actions">
                <button class="button primary" type="submit">Enregistrer</button>
                <a class="button secondary" href="${pageContext.request.contextPath}/tasks.jsp">Annuler</a>
            </div>
        </form>
    </section>
</main>
</body>
</html>
