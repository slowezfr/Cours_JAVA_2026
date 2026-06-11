<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Le polymorphisme</title>
</head>
<body bgcolor="white">
<h1>Exercices sur le polymorphisme</h1>

<form action="#" method="post">
    <p>Saisir le nom d'un chien : <input type="text" name="chien"></p>
    <p>Saisir le nom d'un chat : <input type="text" name="chat"></p>
    <p><input type="submit" value="Faire crier les animaux"></p>
</form>

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

<h2>Demonstration du polymorphisme</h2>
<p>Le tableau est declare <code>Animal[]</code>, mais chaque objet execute sa propre version de
<code>crier()</code>.</p>
<ul>
    <% for (Animal animal : animaux) { %>
        <li>
            <%= html(animal.toString()) %> dit : <%= html(animal.crier()) %>
            - <%= typeAnimal(animal) %>
        </li>
    <% } %>
</ul>

<h2>Exercice 1 : Redefinir toString()</h2>
<p>Chaque classe retourne une description adaptee avec <code>toString()</code>, par exemple
<code><%= html(animaux[0].toString()) %></code>.</p>

<h2>Exercice 2 : La classe abstraite Forme</h2>
<ul>
    <li>Aire du cercle de rayon 3 : <%= formes[0].aire() %></li>
    <li>Aire du carre de cote 4 : <%= formes[1].aire() %></li>
</ul>

<h2>Exercice 3 : L'interface Affichable</h2>
<ul>
    <% for (Affichable affichable : affichables) { %>
        <li><%= html(affichable.afficher()) %></li>
    <% } %>
</ul>

<h2>Exercice 4 : Ajouter un Oiseau</h2>
<p>La classe <code>Oiseau</code> herite de <code>Animal</code> et redefinit <code>crier()</code>.
Elle est ajoutee dans le tableau sans changer la boucle d'affichage.</p>

<h2>Exercice 5 : L'operateur instanceof</h2>
<p>La boucle affiche un message specifique pour les chiens, les chats et les autres animaux.</p>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
