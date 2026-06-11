<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les constructeurs</title>
</head>
<body bgcolor="white">
<h1>Exercices sur les constructeurs</h1>

<form action="#" method="post">
    <p>Saisir un titre de livre : <input type="text" name="titre"></p>
    <p>Saisir un auteur : <input type="text" name="auteur"></p>
    <p><input type="submit" value="Creer les livres"></p>
</form>

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

<h2>Demonstration de la classe Livre</h2>
<p>Livre cree via le constructeur par defaut : <%= html(livreVide.getDescription()) %></p>
<% if (livrePlein != null) { %>
    <p>Livre cree via le constructeur avec parametres : <%= html(livrePlein.getDescription()) %></p>
<% } else { %>
    <p>Remplissez le formulaire pour tester le constructeur avec parametres.</p>
<% } %>

<h2>Exercice 1 : Le constructeur par defaut</h2>
<p>Etudiant cree sans parametre : <%= etudiantDefaut.getDescription() %></p>

<h2>Exercice 2 : La surcharge de constructeurs</h2>
<ul>
    <li>Constructeur sans parametre : <%= etudiantDefaut.getDescription() %></li>
    <li>Constructeur avec le nom : <%= etudiantNom.getDescription() %></li>
    <li>Constructeur avec le nom et la note : <%= etudiantComplet.getDescription() %></li>
</ul>

<h2>Exercice 3 : Chainer les constructeurs avec this()</h2>
<p>Le constructeur sans parametre appelle <code>this("Anonyme", 10)</code> pour eviter la duplication.</p>

<h2>Exercice 4 : Le constructeur de copie</h2>
<p>Copie de l'etudiant Marie : <%= etudiantCopie.getDescription() %></p>

<h2>Exercice 5 : Valider les parametres dans le constructeur</h2>
<p>Produit cree avec un prix de -50 euros : le prix reel est <%= produit.getPrix() %> euro.</p>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
