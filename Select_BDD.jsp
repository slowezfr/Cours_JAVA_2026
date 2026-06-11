<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion MariaDB</title>
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

<%
    List<String[]> films = new ArrayList<String[]>();
    String erreur = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String url = "jdbc:mariadb://localhost:3306/films";
        String user = "cnam";
        String password = "cnam";

        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        String sql = "SELECT idFilm, titre, annee FROM Film WHERE annee >= 2000";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            films.add(new String[] {
                    rs.getString("idFilm"),
                    rs.getString("titre"),
                    rs.getString("annee")
            });
        }
    } catch (Exception exception) {
        erreur = exception.getMessage();
    } finally {
        if (rs != null) {
            try { rs.close(); } catch (SQLException ignore) {}
        }
        if (pstmt != null) {
            try { pstmt.close(); } catch (SQLException ignore) {}
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException ignore) {}
        }
    }
%>

<main class="page">
    <section class="hero compact">
        <p class="eyebrow">Base de donnees</p>
        <h1>Connexion a MariaDB avec JSP</h1>
        <p class="lead">Exemple de lecture d'une table de films et liste des exercices lies a la base de donnees.</p>
    </section>

    <section class="panel">
        <h2>Films depuis MariaDB</h2>
        <% if (erreur != null) { %>
            <p class="notice">La connexion MariaDB n'est pas disponible pour le moment : <%= erreur %></p>
        <% } else if (films.isEmpty()) { %>
            <p class="notice">Aucun film trouve avec la requete actuelle.</p>
        <% } else { %>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Titre</th>
                        <th>Annee</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < films.size(); i++) {
                        String[] film = films.get(i);
                    %>
                        <tr>
                            <td><%= film[0] %></td>
                            <td><%= film[1] %></td>
                            <td><%= film[2] %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </section>

    <section class="section-heading">
        <p class="eyebrow">Travail demande</p>
        <h2>Exercices base de donnees</h2>
    </section>

    <section class="result-grid">
        <article class="result-card">
            <span class="tag">Exercice 1</span>
            <h2>Films entre 2000 et 2015</h2>
            <p>Extraire les films dont l'annee est superieure a 2000 et inferieure a 2015.</p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 2</span>
            <h2>Annee de recherche</h2>
            <p>Creer un champ permettant a l'utilisateur de choisir l'annee de sa recherche.</p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 3</span>
            <h2>Modifier un titre</h2>
            <p>Creer une page permettant de modifier le titre d'un film selon son ID.</p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 4</span>
            <h2>Ajouter un film</h2>
            <p>Creer un formulaire pour saisir un nouveau film dans la base de donnees.</p>
        </article>
    </section>

    <section class="panel">
        <p class="eyebrow">Projet</p>
        <h2>Bibliotheque</h2>
        <p class="notice">
            Concevoir une application de gestion de bibliotheque : enregistrer et supprimer des livres,
            rechercher les livres disponibles, gerer les emprunts, les utilisateurs et les stocks.
        </p>
    </section>

    <a class="back-link" href="index.html">Retour au sommaire</a>
</main>
</body>
</html>
