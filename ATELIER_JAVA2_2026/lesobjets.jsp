<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Les objets</title>
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

<main class="page">
    <section class="hero compact">
        <p class="eyebrow">Serie 01</p>
        <h1>Les objets</h1>
        <p class="lead">Creation de classes, instanciation, methodes, encapsulation et manipulation d'objets simples.</p>
    </section>

    <section class="form-panel">
        <h2>Tester la classe Personne</h2>
        <form action="#" method="post" class="form-grid">
            <div class="field">
                <label for="nom">Nom</label>
                <input id="nom" type="text" name="nom" placeholder="Marie">
            </div>
            <div class="field">
                <label for="age">Age</label>
                <input id="age" type="number" name="age" placeholder="25">
            </div>
            <div class="form-actions field full">
                <button class="button primary" type="submit">Creer la personne</button>
                <a class="button secondary" href="index.html">Retour au sommaire</a>
            </div>
        </form>
    </section>

    <section class="result-grid">
        <% if (p != null) { %>
            <article class="result-card highlight">
                <span class="tag">Personne</span>
                <h2>Objet cree avec encapsulation</h2>
                <p>Nom : <strong><%= html(p.getNom()) %></strong></p>
                <p>Age : <strong><%= p.getAge() %> ans</strong></p>
                <p><%= html(p.seDecrire()) %></p>
            </article>
        <% } else { %>
            <article class="result-card highlight">
                <span class="tag">Personne</span>
                <h2>Objet a tester</h2>
                <p>Remplissez le formulaire pour afficher la description generee par <code>seDecrire()</code>.</p>
            </article>
        <% } %>

        <article class="result-card">
            <span class="tag">Exercice 1</span>
            <h2>Classe Voiture</h2>
            <p>Voiture instanciee : <strong><%= voiture.getDescription() %></strong></p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 2</span>
            <h2>Methode seDecrire()</h2>
            <p>La classe <code>Personne</code> possede une methode qui retourne une phrase complete.</p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 3</span>
            <h2>Classe Rectangle</h2>
            <p>Surface d'un rectangle de 5 par 3 : <strong><%= rectangle.calculerSurface() %></strong></p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 4</span>
            <h2>Compte bancaire</h2>
            <p>Apres un depot de 100 euros puis un retrait de 30 euros, le solde final est de <strong><%= compte.getSolde() %> euros</strong>.</p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 5</span>
            <h2>Encapsulation</h2>
            <p>Les attributs sont prives et le code utilise les getters et setters pour lire ou modifier l'objet.</p>
        </article>
    </section>

    <a class="back-link" href="index.html">Retour au sommaire</a>
</main>
</body>
</html>
