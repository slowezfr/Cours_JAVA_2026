<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Les conditions</title>
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
    private int parseEntier(String valeur, int defaut) {
        try {
            return Integer.parseInt(valeur);
        } catch (Exception exception) {
            return defaut;
        }
    }
%>

<%
    String valeur1 = request.getParameter("valeur1");
    String valeur2 = request.getParameter("valeur2");
    String valeur3 = request.getParameter("valeur3");

    int a = parseEntier(valeur1, 10);
    int b = parseEntier(valeur2, 20);
    int c = parseEntier(valeur3, 15);

    String comparaison;
    if (a > b) {
        comparaison = "A est superieur a B.";
    } else if (a < b) {
        comparaison = "A est inferieur a B.";
    } else {
        comparaison = "A est egal a B.";
    }

    int minimum = Math.min(a, b);
    int maximum = Math.max(a, b);
    boolean cEntreAEtB = c >= minimum && c <= maximum;
    boolean cPair = c % 2 == 0;
%>

<main class="page">
    <section class="hero compact">
        <p class="eyebrow">Exercice 02</p>
        <h1>Les conditions</h1>
        <p class="lead">Comparer des valeurs avec <code>if</code>, <code>else if</code> et <code>else</code>.</p>
    </section>

    <section class="form-panel">
        <h2>Saisir trois valeurs</h2>
        <form action="#" method="post" class="form-grid">
            <div class="field">
                <label for="valeur1">A</label>
                <input type="number" id="valeur1" name="valeur1" value="<%= a %>">
            </div>
            <div class="field">
                <label for="valeur2">B</label>
                <input type="number" id="valeur2" name="valeur2" value="<%= b %>">
            </div>
            <div class="field">
                <label for="valeur3">C</label>
                <input type="number" id="valeur3" name="valeur3" value="<%= c %>">
            </div>
            <div class="form-actions field full">
                <button class="button primary" type="submit">Afficher</button>
                <a class="button secondary" href="index.html">Retour au sommaire</a>
            </div>
        </form>
    </section>

    <section class="result-grid three">
        <article class="result-card highlight">
            <span class="tag">Demo</span>
            <h2>Comparaison de A et B</h2>
            <p>A = <strong><%= a %></strong>, B = <strong><%= b %></strong></p>
            <p><%= comparaison %></p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 1</span>
            <h2>C entre A et B</h2>
            <p>C = <strong><%= c %></strong></p>
            <% if (cEntreAEtB) { %>
                <p>Oui, C est compris entre A et B.</p>
            <% } else { %>
                <p>Non, C n'est pas compris entre A et B.</p>
            <% } %>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 2</span>
            <h2>Pair ou impair</h2>
            <% if (cPair) { %>
                <p>La valeur C est paire.</p>
            <% } else { %>
                <p>La valeur C est impaire.</p>
            <% } %>
        </article>
    </section>

    <a class="back-link" href="index.html">Retour au sommaire</a>
</main>
</body>
</html>
