# Mini Gestionnaire de Taches Collaboratif

Application web Java realisee avec JSP, Servlet, POO et session utilisateur.

## Fonctionnalites

- Page d'accueil avec navigation
- Ajout d'une tache depuis un formulaire JSP
- Affichage des taches avec une boucle JSP
- Stockage des taches dans une `ArrayList<Task>` en session
- Suppression d'une tache
- Date d'echeance
- Marquage d'une tache comme terminee

## Structure du projet

```text
src/main/java/fr/projet/model/Task.java
src/main/java/fr/projet/servlet/TaskServlet.java
src/main/webapp/index.jsp
src/main/webapp/add-task.jsp
src/main/webapp/tasks.jsp
src/main/webapp/WEB-INF/web.xml
```

## Lancer en local avec Tomcat

1. Installer Java JDK 8 ou plus.
2. Installer Apache Maven.
3. Installer Apache Tomcat 9.
4. Construire le fichier WAR :

```bash
mvn clean package
```

5. Copier le fichier suivant dans le dossier `webapps` de Tomcat :

```text
target/mini-gestionnaire-taches.war
```

6. Pour obtenir une URL comme `/theo`, renommer le fichier WAR avant de le copier :

```text
theo.war
```

7. Demarrer Tomcat puis ouvrir :

```text
http://localhost:8080/theo/
```

## Mettre sur GitHub

```bash
git init
git add .
git commit -m "Ajouter le mini gestionnaire de taches JSP"
git branch -M main
git remote add origin https://github.com/VOTRE_COMPTE/mini-gestionnaire-taches.git
git push -u origin main
```

## Deployer sur le serveur AWS

1. Construire le projet avec `mvn clean package`.
2. Renommer `target/mini-gestionnaire-taches.war` avec votre prenom, par exemple `theo.war`.
3. Envoyer ce fichier sur le serveur Tomcat AWS dans le dossier `webapps`.
4. Redemarrer Tomcat si necessaire.
5. Ouvrir :

```text
http://ec2-15-237-202-85.eu-west-3.compute.amazonaws.com/theo/
```

Remplacer `theo` par votre prenom exact.
