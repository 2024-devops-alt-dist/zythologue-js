# Zythologue, une base de données pour amateurs de bières

## Un projet utilisant Docker, Postgresql et DBeaver

Pour lancer le projet en local, il faut avoir installé Docker (et Docker Desktop). 
Commencer par cloner le projet avec le lien du repository.
Dans VS Code, dans le dossier du projet, utiliser la commande "docker compose up". 
Si ce n'est pas déjà fait, configurer le mot de passe, le nom d'utilisateur et le nom de la base de données dans DBeaver (ou dans un autre logiciel similaire) d'après les infodmations du docker-compose.yml.
Nom d'utilisateur : myuser
Mot de passe : mypassword 123
Nom de la base de données : myappdb

## Documents sur la méthode MERISE

- Dictionnaire de données et règles de gestion : https://docs.google.com/spreadsheets/d/1HoxHClDUAwwVPahSalJrS0S1PYmNppsXQaiHIV4uIVw/edit?usp=sharing
- Schémas du MCD, MLD et MPD : en format png à la racine du projet

[Modèle Conceptuel de Données](../beer_BDD_MCD.png)

## Requêtes sql

Les différentes requêtes sql demandées par le cahier des charges se trouvent dans le fichier queries.sql. Pour les tester, aller dans DBeaver, clic droit sur myappdb dans l'arborescence, et sélectionner editeur sql > open sql console.
Dans la console ainsi créée, copier une des commandes sql de requête puis l'exécuter.

Pour lister les bières par taux d'alcool, de la plus légère à la plus forte :

```select * from beer order by abv;```