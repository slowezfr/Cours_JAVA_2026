<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Taches</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
</head>
<body>
<header class="site-header">
    <nav class="top-nav" aria-label="Navigation principale">
        <a class="brand" href="index.html">Cours Java 2026</a>
        <div class="nav-links">
            <a href="lesboucles.jsp">Boucles</a>
            <a href="lesconditions.jsp">Conditions</a>
            <a href="leschaines.jsp">Chaines</a>
            <a href="lestableaux.jsp">Tableaux</a>
        </div>
    </nav>
</header>

<%!
    class MyClass {
        String nameTache;

        public MyClass(String name) {
            nameTache = name;
        }
    }

    private String html(String valeur) {
        if (valeur == null) {
            return "";
        }
        return valeur
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>

<%
    String valeur = request.getParameter("valeur");
    MyClass tache = null;
    if (valeur != null && !valeur.trim().isEmpty()) {
        tache = new MyClass(valeur.trim());
    }
%>

<main class="page">
    <section class="hero compact">
        <p class="eyebrow">Page annexe</p>
        <h1>Saisir une tache</h1>
        <p class="lead">Petit exemple JSP avec creation d'un objet Java a partir d'un formulaire.</p>
    </section>

    <section class="form-panel">
        <h2>Nouvelle tache</h2>
        <form action="#" method="post" class="form-grid">
            <div class="field full">
                <label for="inputValeur">Nom de la tache</label>
                <input type="text" id="inputValeur" name="valeur" value="<%= html(valeur) %>" placeholder="Revision JSP">
            </div>
            <div class="form-actions field full">
                <button class="button primary" type="submit">Enregistrer</button>
                <a class="button secondary" href="index.html">Retour au sommaire</a>
            </div>
        </form>
    </section>

    <section class="result-grid">
        <article class="result-card highlight">
            <span class="tag">Objet</span>
            <h2>Resultat</h2>
            <% if (tache != null) { %>
                <p>Nom de la tache : <strong><%= html(tache.nameTache) %></strong></p>
            <% } else { %>
                <p>Saisissez une tache pour creer un objet et afficher son contenu.</p>
            <% } %>
        </article>
    </section>

    <a class="back-link" href="index.html">Retour au sommaire</a>
</main>
</body>
</html>
