<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les objets</title>
</head>
<body bgcolor="white">
<h1>Exercices sur les objets</h1>

<form action="#" method="post">
    <p>Saisir un nom : <input type="text" name="nom"></p>
    <p>Saisir un age : <input type="text" name="age"></p>
    <p><input type="submit" value="Creer la personne"></p>
</form>

<%!
    class Personne {
        private String nom;
        private int age;

        public String getNom() {
            return nom;
        }

        public void setNom(String nom) {
            this.nom = nom;
        }

        public int getAge() {
            return age;
        }

        public void setAge(int age) {
            this.age = age;
        }

        public String seDecrire() {
            return "Je m'appelle " + nom + " et j'ai " + age + " ans";
        }
    }

    class Voiture {
        private String marque;
        private String modele;
        private int annee;

        public Voiture(String marque, String modele, int annee) {
            this.marque = marque;
            this.modele = modele;
            this.annee = annee;
        }

        public String getDescription() {
            return marque + " " + modele + " de " + annee;
        }
    }

    class Rectangle {
        private double longueur;
        private double largeur;

        public Rectangle(double longueur, double largeur) {
            this.longueur = longueur;
            this.largeur = largeur;
        }

        public double calculerSurface() {
            return longueur * largeur;
        }
    }

    class CompteBancaire {
        private double solde;

        public CompteBancaire(double solde) {
            this.solde = solde;
        }

        public void deposer(double montant) {
            if (montant > 0) {
                solde += montant;
            }
        }

        public void retirer(double montant) {
            if (montant > 0 && montant <= solde) {
                solde -= montant;
            }
        }

        public double getSolde() {
            return solde;
        }
    }

    private int lireAge(String valeur, int valeurParDefaut) {
        try {
            return Integer.parseInt(valeur);
        } catch (Exception exception) {
            return valeurParDefaut;
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
    String nom = request.getParameter("nom");
    String age = request.getParameter("age");

    Personne p = null;
    if (nom != null && age != null && !nom.trim().isEmpty() && !age.trim().isEmpty()) {
        p = new Personne();
        p.setNom(nom.trim());
        p.setAge(lireAge(age.trim(), 0));
    }

    Voiture voiture = new Voiture("Renault", "Clio", 2020);
    Rectangle rectangle = new Rectangle(5, 3);
    CompteBancaire compte = new CompteBancaire(0);
    compte.deposer(100);
    compte.retirer(30);
%>

<% if (p != null) { %>
    <h2>Objet Personne cree avec encapsulation</h2>
    <p>Nom : <%= html(p.getNom()) %></p>
    <p>Age : <%= p.getAge() %> ans</p>
    <p><%= html(p.seDecrire()) %></p>
<% } %>

<h2>Exercice 1 : La classe Voiture</h2>
<p>Voiture instanciee : <%= voiture.getDescription() %></p>

<h2>Exercice 2 : Ajouter une methode a la classe Personne</h2>
<p>La methode <code>seDecrire()</code> retourne une phrase complete a partir du nom et de l'age.</p>
<% if (p == null) { %>
    <p>Remplissez le formulaire pour creer une personne et afficher le resultat.</p>
<% } %>

<h2>Exercice 3 : La classe Rectangle</h2>
<p>Surface d'un rectangle de 5 par 3 : <%= rectangle.calculerSurface() %></p>

<h2>Exercice 4 : Le compte bancaire</h2>
<p>Apres un depot de 100 euros puis un retrait de 30 euros, le solde final est de <%= compte.getSolde() %> euros.</p>

<h2>Exercice 5 : L'encapsulation</h2>
<p>Les attributs de <code>Personne</code> sont prives et le code utilise <code>getNom()</code>,
<code>setNom(...)</code>, <code>getAge()</code> et <code>setAge(...)</code>.</p>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
