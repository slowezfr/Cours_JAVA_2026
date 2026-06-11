# Atelier Java 2 2026

Rendu place dans le dossier `ATELIER_JAVA2_2026` du depot `slowezfr/Cours_JAVA_2026`.

## Pages

- `index.html` : sommaire de l'atelier Java 2.
- `lesobjets.jsp` : exercices sur les classes, attributs, methodes et encapsulation.
- `lesconstructeurs.jsp` : exercices sur les constructeurs par defaut, surcharges, `this()` et constructeur de copie.
- `lepolymorphisme.jsp` : exercices sur l'heritage, la redefinition, les classes abstraites, les interfaces et `instanceof`.

## Production

Le depot possede deja un workflow GitHub Actions qui genere `theo.war` et le depose sur le serveur Tomcat AWS.
Apres execution du workflow, le dossier est accessible a cette adresse :

```text
http://ec2-35-180-71-137.eu-west-3.compute.amazonaws.com/theo/ATELIER_JAVA2_2026/
```

Si l'affichage n'est pas encore disponible, verifier que les secrets GitHub Actions du depot sont bien configures et que le workflow s'est termine avec une icone verte.
