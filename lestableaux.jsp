<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Les tableaux</title>
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
    String chaine = request.getParameter("chaine");
    if (chaine == null || chaine.trim().isEmpty()) {
        chaine = "6 78 15 -4 3";
    }

    String[] morceaux = chaine.trim().split("\\s+");
    List<Integer> valeurs = new ArrayList<Integer>();
    for (int i = 0; i < morceaux.length; i++) {
        try {
            valeurs.add(Integer.parseInt(morceaux[i]));
        } catch (NumberFormatException exception) {
            // Les valeurs non numeriques sont ignorees pour garder la page utilisable.
        }
    }

    boolean aDesValeurs = !valeurs.isEmpty();
    int premiere = aDesValeurs ? valeurs.get(0) : 0;
    int sommeDeuxPremieres = valeurs.size() >= 2 ? valeurs.get(0) + valeurs.get(1) : premiere;
    int somme = 0;
    int maximum = aDesValeurs ? valeurs.get(0) : 0;
    int minimum = aDesValeurs ? valeurs.get(0) : 0;
    int procheZero = aDesValeurs ? valeurs.get(0) : 0;
    int procheZeroVersion2 = aDesValeurs ? valeurs.get(0) : 0;

    for (int i = 0; i < valeurs.size(); i++) {
        int nombre = valeurs.get(i);
        somme += nombre;
        if (nombre > maximum) {
            maximum = nombre;
        }
        if (nombre < minimum) {
            minimum = nombre;
        }
        if (Math.abs(nombre) < Math.abs(procheZero)) {
            procheZero = nombre;
        }
        if (Math.abs(nombre) < Math.abs(procheZeroVersion2)
                || (Math.abs(nombre) == Math.abs(procheZeroVersion2) && nombre > procheZeroVersion2)) {
            procheZeroVersion2 = nombre;
        }
    }
%>

<main class="page">
    <section class="hero compact">
        <p class="eyebrow">Exercice 04</p>
        <h1>Les tableaux</h1>
        <p class="lead">Transformer une saisie utilisateur en tableau de nombres, puis calculer des resultats avec des boucles.</p>
    </section>

    <section class="form-panel">
        <h2>Saisir des nombres</h2>
        <form action="#" method="post" class="form-grid">
            <div class="field full">
                <label for="chaine">Valeurs separees par des espaces</label>
                <input type="text" id="chaine" name="chaine" value="<%= html(chaine) %>">
            </div>
            <div class="form-actions field full">
                <button class="button primary" type="submit">Afficher</button>
                <a class="button secondary" href="index.html">Retour au sommaire</a>
            </div>
        </form>
    </section>

    <% if (!aDesValeurs) { %>
        <section class="panel">
            <h2>Aucune valeur numerique</h2>
            <p class="notice">Saisissez au moins un nombre pour afficher les resultats.</p>
        </section>
    <% } else { %>
        <section class="result-grid">
            <article class="result-card highlight">
                <span class="tag">Tableau</span>
                <h2>Valeurs lues</h2>
                <p>Le tableau contient <strong><%= valeurs.size() %></strong> valeur(s).</p>
                <ul>
                    <% for (int i = 0; i < valeurs.size(); i++) { %>
                        <li>Valeur <%= i + 1 %> : <%= valeurs.get(i) %></li>
                    <% } %>
                </ul>
            </article>

            <article class="result-card">
                <span class="tag">Exercice 1</span>
                <h2>Carre de la premiere valeur</h2>
                <p><%= premiere %> x <%= premiere %> = <strong><%= premiere * premiere %></strong></p>
            </article>

            <article class="result-card">
                <span class="tag">Exercice 2</span>
                <h2>Somme des deux premieres valeurs</h2>
                <p>Resultat : <strong><%= sommeDeuxPremieres %></strong></p>
            </article>

            <article class="result-card">
                <span class="tag">Exercice 3</span>
                <h2>Somme de toutes les valeurs</h2>
                <p>Resultat : <strong><%= somme %></strong></p>
            </article>

            <article class="result-card">
                <span class="tag">Exercice 4</span>
                <h2>Valeur maximum</h2>
                <p>Maximum : <strong><%= maximum %></strong></p>
            </article>

            <article class="result-card">
                <span class="tag">Exercice 5</span>
                <h2>Valeur minimum</h2>
                <p>Minimum : <strong><%= minimum %></strong></p>
            </article>

            <article class="result-card">
                <span class="tag">Exercice 6</span>
                <h2>Plus proche de zero</h2>
                <p>Resultat : <strong><%= procheZero %></strong></p>
            </article>

            <article class="result-card">
                <span class="tag">Exercice 7</span>
                <h2>Plus proche de zero, version positive</h2>
                <p>En cas d'egalite, le positif est choisi : <strong><%= procheZeroVersion2 %></strong></p>
            </article>
        </section>
    <% } %>

    <a class="back-link" href="index.html">Retour au sommaire</a>
</main>
</body>
</html>
