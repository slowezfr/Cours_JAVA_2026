<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Les constructeurs</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
</head>
<body>
<header class="site-header">
    <nav class="top-nav" aria-label="Navigation principale">
        <a class="brand" href="index.html">Atelier Java 2</a>
        <div class="nav-links">
            <a href="lesobjets.jsp">Objets</a>
            <a href="lesconstructeurs.jsp">Constructeurs</a>
            <a href="lepolymorphisme.jsp">Polymorphisme</a>
        </div>
    </nav>
</header>

<%!
    class Livre {
        private String titre;
        private String auteur;

        public Livre() {
            this("Titre inconnu", "Auteur inconnu");
        }

        public Livre(String titre, String auteur) {
            this.titre = titre;
            this.auteur = auteur;
        }

        public String getDescription() {
            return titre + " - " + auteur;
        }
    }

    class Etudiant {
        private String nom;
        private double note;

        public Etudiant() {
            this("Anonyme", 10);
        }

        public Etudiant(String nom) {
            this(nom, 10);
        }

        public Etudiant(String nom, double note) {
            this.nom = (nom == null || nom.trim().isEmpty()) ? "Anonyme" : nom;
            this.note = note;
        }

        public Etudiant(Etudiant autre) {
            this(autre.nom, autre.note);
        }

        public String getDescription() {
            return nom + " a " + note + "/20";
        }
    }

    class Produit {
        private double prix;

        public Produit(double prix) {
            if (prix < 0) {
                this.prix = 0;
            } else {
                this.prix = prix;
            }
        }

        public double getPrix() {
            return prix;
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
    String titre = request.getParameter("titre");
    String auteur = request.getParameter("auteur");

    Livre livreVide = new Livre();
    Livre livrePlein = null;
    if (titre != null && auteur != null && !titre.trim().isEmpty() && !auteur.trim().isEmpty()) {
        livrePlein = new Livre(titre.trim(), auteur.trim());
    }

    Etudiant etudiantDefaut = new Etudiant();
    Etudiant etudiantNom = new Etudiant("Theo");
    Etudiant etudiantComplet = new Etudiant("Marie", 15);
    Etudiant etudiantCopie = new Etudiant(etudiantComplet);
    Produit produit = new Produit(-50);
%>

<main class="page">
    <section class="hero compact">
        <p class="eyebrow">Serie 02</p>
        <h1>Les constructeurs</h1>
        <p class="lead">Initialisation d'objets, surcharge de constructeurs, chainage avec <code>this()</code> et copie.</p>
    </section>

    <section class="form-panel">
        <h2>Tester la classe Livre</h2>
        <form action="#" method="post" class="form-grid">
            <div class="field">
                <label for="titre">Titre</label>
                <input id="titre" type="text" name="titre" placeholder="Le Petit Prince">
            </div>
            <div class="field">
                <label for="auteur">Auteur</label>
                <input id="auteur" type="text" name="auteur" placeholder="Antoine de Saint-Exupery">
            </div>
            <div class="form-actions field full">
                <button class="button primary" type="submit">Creer les livres</button>
                <a class="button secondary" href="index.html">Retour au sommaire</a>
            </div>
        </form>
    </section>

    <section class="result-grid">
        <article class="result-card highlight">
            <span class="tag">Livre</span>
            <h2>Constructeurs de base</h2>
            <p>Constructeur par defaut : <strong><%= html(livreVide.getDescription()) %></strong></p>
            <% if (livrePlein != null) { %>
                <p>Constructeur avec parametres : <strong><%= html(livrePlein.getDescription()) %></strong></p>
            <% } else { %>
                <p>Remplissez le formulaire pour tester le constructeur avec parametres.</p>
            <% } %>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 1</span>
            <h2>Constructeur par defaut</h2>
            <p>Etudiant cree sans parametre : <strong><%= etudiantDefaut.getDescription() %></strong></p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 2</span>
            <h2>Surcharge</h2>
            <ul>
                <li>Sans parametre : <%= etudiantDefaut.getDescription() %></li>
                <li>Avec le nom : <%= etudiantNom.getDescription() %></li>
                <li>Avec le nom et la note : <%= etudiantComplet.getDescription() %></li>
            </ul>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 3</span>
            <h2>Chainage avec this()</h2>
            <p>Le constructeur sans parametre appelle <code>this("Anonyme", 10)</code> pour eviter la duplication.</p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 4</span>
            <h2>Constructeur de copie</h2>
            <p>Copie de l'etudiant Marie : <strong><%= etudiantCopie.getDescription() %></strong></p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 5</span>
            <h2>Validation du prix</h2>
            <p>Produit cree avec un prix de -50 euros : le prix reel est <strong><%= produit.getPrix() %> euro</strong>.</p>
        </article>
    </section>

    <a class="back-link" href="index.html">Retour au sommaire</a>
</main>
</body>
</html>
