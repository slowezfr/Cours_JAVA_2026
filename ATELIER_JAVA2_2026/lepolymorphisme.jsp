<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Le polymorphisme</title>
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
    interface Affichable {
        String afficher();
    }

    class Animal {
        protected String nom;

        public Animal(String nom) {
            this.nom = nom;
        }

        public String crier() {
            return "...";
        }

        public String toString() {
            return "Animal nomme " + nom;
        }
    }

    class Chien extends Animal implements Affichable {
        public Chien(String nom) {
            super(nom);
        }

        public String crier() {
            return "Wouf wouf !";
        }

        public String toString() {
            return "Chien nomme " + nom;
        }

        public String afficher() {
            return toString() + " dit " + crier();
        }
    }

    class Chat extends Animal implements Affichable {
        public Chat(String nom) {
            super(nom);
        }

        public String crier() {
            return "Miaou !";
        }

        public String toString() {
            return "Chat nomme " + nom;
        }

        public String afficher() {
            return toString() + " dit " + crier();
        }
    }

    class Oiseau extends Animal {
        public Oiseau(String nom) {
            super(nom);
        }

        public String crier() {
            return "Cui cui !";
        }

        public String toString() {
            return "Oiseau nomme " + nom;
        }
    }

    abstract class Forme {
        public abstract double aire();
    }

    class Cercle extends Forme {
        private double rayon;

        public Cercle(double rayon) {
            this.rayon = rayon;
        }

        public double aire() {
            return Math.PI * rayon * rayon;
        }
    }

    class Carre extends Forme {
        private double cote;

        public Carre(double cote) {
            this.cote = cote;
        }

        public double aire() {
            return cote * cote;
        }
    }

    private String typeAnimal(Animal animal) {
        if (animal instanceof Chien) {
            return "C'est un chien";
        }
        if (animal instanceof Chat) {
            return "C'est un chat";
        }
        return "Autre animal";
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
    String nomChien = request.getParameter("chien");
    String nomChat = request.getParameter("chat");

    if (nomChien == null || nomChien.trim().isEmpty()) {
        nomChien = "Rex";
    } else {
        nomChien = nomChien.trim();
    }

    if (nomChat == null || nomChat.trim().isEmpty()) {
        nomChat = "Felix";
    } else {
        nomChat = nomChat.trim();
    }

    Animal[] animaux = {
        new Chien(nomChien),
        new Chat(nomChat),
        new Oiseau("Rio")
    };

    Forme[] formes = {
        new Cercle(3),
        new Carre(4)
    };

    Affichable[] affichables = {
        new Chien(nomChien),
        new Chat(nomChat)
    };
%>

<main class="page">
    <section class="hero compact">
        <p class="eyebrow">Serie 03</p>
        <h1>Le polymorphisme</h1>
        <p class="lead">Une meme reference <code>Animal</code> peut appeler des comportements differents selon l'objet reel.</p>
    </section>

    <section class="form-panel">
        <h2>Tester les animaux</h2>
        <form action="#" method="post" class="form-grid">
            <div class="field">
                <label for="chien">Nom du chien</label>
                <input id="chien" type="text" name="chien" placeholder="Rex">
            </div>
            <div class="field">
                <label for="chat">Nom du chat</label>
                <input id="chat" type="text" name="chat" placeholder="Felix">
            </div>
            <div class="form-actions field full">
                <button class="button primary" type="submit">Faire crier les animaux</button>
                <a class="button secondary" href="index.html">Retour au sommaire</a>
            </div>
        </form>
    </section>

    <section class="result-grid">
        <article class="result-card highlight">
            <span class="tag">Demo</span>
            <h2>Tableau Animal[]</h2>
            <p>La boucle reste la meme, mais chaque classe execute sa propre version de <code>crier()</code>.</p>
            <ul>
                <% for (Animal animal : animaux) { %>
                    <li><%= html(animal.toString()) %> dit : <%= html(animal.crier()) %> - <%= typeAnimal(animal) %></li>
                <% } %>
            </ul>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 1</span>
            <h2>Redefinir toString()</h2>
            <p>Chaque classe retourne une description adaptee, par exemple <code><%= html(animaux[0].toString()) %></code>.</p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 2</span>
            <h2>Classe abstraite Forme</h2>
            <ul>
                <li>Aire du cercle de rayon 3 : <%= formes[0].aire() %></li>
                <li>Aire du carre de cote 4 : <%= formes[1].aire() %></li>
            </ul>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 3</span>
            <h2>Interface Affichable</h2>
            <ul>
                <% for (Affichable affichable : affichables) { %>
                    <li><%= html(affichable.afficher()) %></li>
                <% } %>
            </ul>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 4</span>
            <h2>Ajouter un Oiseau</h2>
            <p><code>Oiseau</code> herite de <code>Animal</code>, redefinit <code>crier()</code> et rejoint le tableau sans changer la boucle.</p>
        </article>

        <article class="result-card">
            <span class="tag">Exercice 5</span>
            <h2>instanceof</h2>
            <p>La boucle distingue les chiens, les chats et les autres animaux avec l'operateur <code>instanceof</code>.</p>
        </article>
    </section>

    <a class="back-link" href="index.html">Retour au sommaire</a>
</main>
</body>
</html>
