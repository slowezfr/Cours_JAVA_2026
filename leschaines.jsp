<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Les chaines</title>
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

    private boolean estVoyelle(char caractere) {
        String voyelles = "aeiouyAEIOUYàâäéèêëîïôöùûüÿÀÂÄÉÈÊËÎÏÔÖÙÛÜŸ";
        return voyelles.indexOf(caractere) >= 0;
    }
%>

<%
    String chaine = request.getParameter("chaine");
    if (chaine == null || chaine.trim().isEmpty()) {
        chaine = "L'hiver sera pluvieux";
    }

    int longueurChaine = chaine.length();
    String troisiemeCaractere = longueurChaine >= 3 ? String.valueOf(chaine.charAt(2)) : "chaine trop courte";
    String sousChaine = longueurChaine >= 6 ? chaine.substring(2, 6) : "chaine trop courte";
    int positionE = chaine.indexOf('e');

    int nombreE = 0;
    int voyelles = 0;
    int consonnes = 0;
    StringBuilder vertical = new StringBuilder();
    StringBuilder retourLigne = new StringBuilder();
    StringBuilder uneSurDeux = new StringBuilder();
    StringBuilder verlan = new StringBuilder();

    for (int i = 0; i < chaine.length(); i++) {
        char caractere = chaine.charAt(i);
        if (caractere == 'e' || caractere == 'E') {
            nombreE++;
        }
        if (Character.isLetter(caractere)) {
            if (estVoyelle(caractere)) {
                voyelles++;
            } else {
                consonnes++;
            }
        }
        vertical.append(caractere).append("\n");
        if (i % 2 == 0) {
            uneSurDeux.append(caractere);
        }
    }

    retourLigne.append(chaine.replace(" ", "\n"));
    verlan.append(new StringBuilder(chaine).reverse().toString());
%>

<main class="page">
    <section class="hero compact">
        <p class="eyebrow">Exercice 03</p>
        <h1>Les chaines de caracteres</h1>
        <p class="lead">Manipuler du texte avec <code>length()</code>, <code>charAt()</code>, <code>substring()</code>, boucles et conditions.</p>
    </section>

    <section class="form-panel">
        <h2>Saisir une phrase</h2>
        <form action="#" method="post" class="form-grid">
            <div class="field full">
                <label for="chaine">Texte</label>
                <input type="text" id="chaine" name="chaine" value="<%= html(chaine) %>">
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
            <h2>Analyse de base</h2>
            <p>Longueur : <strong><%= longueurChaine %> caracteres</strong></p>
            <p>Troisieme caractere : <strong><%= html(troisiemeCaractere) %></strong></p>
            <p>Sous-chaine de l'index 2 a 6 : <strong><%= html(sousChaine) %></strong></p>
            <p>Premier <code>e</code> a la position : <strong><%= positionE %></strong></p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 1</span>
            <h2>Compter les e</h2>
            <p>Nombre de lettres <code>e</code> : <strong><%= nombreE %></strong></p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 2</span>
            <h2>Affichage vertical</h2>
            <pre class="text-output"><%= html(vertical.toString()) %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 3</span>
            <h2>Retour a la ligne</h2>
            <pre class="text-output"><%= html(retourLigne.toString()) %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 4</span>
            <h2>Une lettre sur deux</h2>
            <pre class="text-output"><%= html(uneSurDeux.toString()) %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 5</span>
            <h2>Phrase en verlan</h2>
            <pre class="text-output"><%= html(verlan.toString()) %></pre>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 6</span>
            <h2>Voyelles et consonnes</h2>
            <p>Voyelles : <strong><%= voyelles %></strong></p>
            <p>Consonnes : <strong><%= consonnes %></strong></p>
        </article>
    </section>

    <a class="back-link" href="index.html">Retour au sommaire</a>
</main>
</body>
</html>
