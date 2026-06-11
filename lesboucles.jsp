<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Les boucles</title>
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

    private String repeter(String texte, int nombre) {
        StringBuilder resultat = new StringBuilder();
        for (int i = 0; i < nombre; i++) {
            resultat.append(texte);
        }
        return resultat.toString();
    }
%>

<%
    String valeur = request.getParameter("valeur");
    int cpt = parseEntier(valeur, 5);
    if (cpt < 1) {
        cpt = 1;
    }
    if (cpt > 20) {
        cpt = 20;
    }

    StringBuilder ligne = new StringBuilder();
    StringBuilder carre = new StringBuilder();
    StringBuilder triangleGauche = new StringBuilder();
    StringBuilder triangleInverse = new StringBuilder();
    StringBuilder triangleDroite = new StringBuilder();
    StringBuilder triangleIsocele = new StringBuilder();
    StringBuilder demiLosange = new StringBuilder();
    StringBuilder table = new StringBuilder();

    for (int i = 1; i <= cpt; i++) {
        ligne.append("*");
    }

    for (int i = 1; i <= cpt; i++) {
        carre.append(repeter("*", cpt)).append("\n");
        triangleGauche.append(repeter("*", i)).append("\n");
        triangleInverse.append(repeter("*", cpt - i + 1)).append("\n");
        triangleDroite.append(repeter(" ", cpt - i)).append(repeter("*", i)).append("\n");
        triangleIsocele.append(repeter(" ", cpt - i)).append(repeter("*", (i * 2) - 1)).append("\n");
        demiLosange.append(repeter("*", i)).append("\n");
        table.append(cpt).append(" x ").append(i).append(" = ").append(cpt * i).append("\n");
    }

    for (int i = cpt - 1; i >= 1; i--) {
        demiLosange.append(repeter("*", i)).append("\n");
    }
%>

<main class="page">
    <section class="hero compact">
        <p class="eyebrow">Exercice 01</p>
        <h1>Les boucles</h1>
        <p class="lead">Utilisation de boucles <code>for</code> imbriquees pour generer des formes et une table de multiplication.</p>
    </section>

    <section class="form-panel">
        <h2>Choisir une valeur</h2>
        <form action="#" method="post" class="form-grid">
            <div class="field">
                <label for="inputValeur">Nombre d'etoiles</label>
                <input type="number" id="inputValeur" name="valeur" min="1" max="20" value="<%= cpt %>">
            </div>
            <div class="form-actions field full">
                <button class="button primary" type="submit">Afficher</button>
                <a class="button secondary" href="index.html">Retour au sommaire</a>
            </div>
        </form>
    </section>

    <section class="result-grid">
        <article class="result-card highlight">
            <span class="tag">Demo</span>
            <h2>Ligne d'etoiles</h2>
            <pre class="pattern"><%= ligne.toString() %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 1</span>
            <h2>Carre d'etoiles</h2>
            <pre class="pattern"><%= carre.toString() %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 2</span>
            <h2>Triangle gauche</h2>
            <pre class="pattern"><%= triangleGauche.toString() %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 3</span>
            <h2>Triangle inverse</h2>
            <pre class="pattern"><%= triangleInverse.toString() %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 4</span>
            <h2>Triangle droite</h2>
            <pre class="pattern"><%= triangleDroite.toString() %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 5</span>
            <h2>Triangle isocele</h2>
            <pre class="pattern"><%= triangleIsocele.toString() %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 6</span>
            <h2>Demi-losange</h2>
            <pre class="pattern"><%= demiLosange.toString() %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 7</span>
            <h2>Table de multiplication</h2>
            <pre class="pattern"><%= table.toString() %></pre>
        </article>
    </section>

    <a class="back-link" href="index.html">Retour au sommaire</a>
</main>
</body>
</html>
