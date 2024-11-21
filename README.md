# Zythologue, une base de données pour amateurs de bières

## Un projet utilisant Docker, Postgresql et DBeaver

Pour lancer le projet en local, il faut avoir installé Docker (et Docker Desktop). 
Commencer par cloner le projet avec le lien du repository.
Dans VS Code, dans le dossier du projet, utiliser la commande ```docker compose up```. 
Si ce n'est pas déjà fait, configurer le mot de passe, le nom d'utilisateur et le nom de la base de données dans DBeaver (ou dans un autre logiciel similaire) d'après les infodmations du docker-compose.yml.
Nom d'utilisateur : myuser
Mot de passe : mypassword 123
Nom de la base de données : myappdb

## Documents sur la méthode MERISE

- [Dictionnaire de données et règles de gestion](https://docs.google.com/spreadsheets/d/1HoxHClDUAwwVPahSalJrS0S1PYmNppsXQaiHIV4uIVw/edit?usp=sharing)
- Schémas du MCD, MLD et MPD : en format png à la racine du projet


## Requêtes sql

Les différentes requêtes sql demandées par le cahier des charges se trouvent dans le fichier queries.sql. Pour les tester, aller dans DBeaver, clic droit sur myappdb dans l'arborescence, et sélectionner editeur sql > open sql console.
Dans la console ainsi créée, copier une des commandes sql de requête puis l'exécuter.

Pour lister les bières par taux d'alcool, de la plus légère à la plus forte :

```
select * from beer order by abv;
```

Pour afficher le nombre de bières par catégorie.

```
select COUNT(*), category.* FROM beer 
left join category ON category.id = beer.id_category 
group by category.id ;
```

Pour trouver toutes les bières d'une brasserie donnée.

```
select * FROM beer 
left join brewery ON brewery.id = beer.id_brewery 
WHERE brewery.name='Mountain Peak Brewery' ;
```

Pour lister les utilisateurs et le nombre de bières qu'ils ont ajoutées à leurs favoris.

```
select COUNT(*), u.* FROM "user" u 
left join favorite ON u.id = favorite.id_user 
group by u.id ;
```

Pour ajouter une nouvelle bière à la base de données.

```
INSERT INTO beer (name, description, abv, id_brewery, id_category) VALUES
('La Goudale', 'It is round in mouth and slightly bitter, the wheat gives it a touch of acidity and the malt some bitterness. The final result is very pleasant, it is a beer to be savored.', 8, 3, 2);
```

Pour afficher les bières et leurs brasseries, ordonnées par pays de la brasserie.

```
select * FROM beer 
left join brewery ON brewery.id = beer.id_brewery 
ORDER BY brewery.country ;
```

Pour lister les bières avec leurs ingrédients.

```
select * FROM beer 
left join beer_ingredient bi ON beer.id = bi.id_beer 
left join ingredient on ingredient.id = bi.id_ingredient ;
```


Pour afficher les brasseries et le nombre de bières qu'elles produisent, pour celles ayant plus de 5 bières.
```
select COUNT(*), brewery.* FROM beer 
left join brewery ON brewery.id = beer.id_brewery 
group by brewery.id having COUNT(*) > 5;
```

Pour lister les bières qui n'ont pas encore été ajoutées aux favoris par aucun utilisateur.
```
SELECT beer.*
FROM beer
LEFT JOIN favorite  ON beer.id = favorite.id_beer 
WHERE favorite.id_beer IS NULL;
```

Pour trouver les bières favorites communes entre deux utilisateurs.
```
select count(*), b.* from beer b 
left join favorite f on f.id_beer = b.id 
left join "user" u on f.id_user = u.id 
where u.id = 1 or u.id = 2
group by b.id 
having count(*) > 1;
```

Pour afficher les brasseries dont les bières ont une moyenne de notes supérieure à une certaine valeur.
```
select brewery.*, AVG(review.rating) FROM review 
left join beer on beer.id = review.id_beer 
left join brewery ON brewery.id = beer.id_brewery 
group by brewery.id having AVG(review.rating) > 3;
```

Pour mettre à jour les informations d'une brasserie.
```
UPDATE brewery
SET country = 'France'
WHERE id = 1;
```

Pour supprimer les photos d'une bière en particulier.
```
DELETE FROM photo
WHERE id_beer = 3;
```

-- Tester la procédure review_beer().
```
CALL review_beer(5, 1, 1);

CALL review_beer(2, 1, 1);
```



