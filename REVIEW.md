# Revue de code entre pair de Juliette sur le repo d'Adrien

https://github.com/2024-devops-alt-dist/zythologue-al

## Cloner le projet

Pas de soucis particulier

## Lancer docker avec la commande indiquée dans le README

J'avais oublié d'arrêter mon propre Docker sur Docker Desktop donc le port 5432 était déjà pris, mais je m'en suis vite rendu compte et une fois mon Docker arrêté, j'ai pu lancer celui d'Adrien sans problème, un volume a bien été créé ainsi qu'une base de donnée. 

## Configuration de la connexion via DBeaver

Pas de problème particulier

## Requêtes SQL 

- 1e requête : RAS
- 2e requête : Afficher le nombre de bières par catégorie. Petit problème, la requête se lance bien mais n'affiche qu'une seule bière par catégorie. Correction proposée, changer l'id dans la jointure de b vers c : 
```
SELECT c.name, count(b.beer_id)
FROM category c
left JOIN beer b ON c.category_id = b.category_id
GROUP BY c.category_id;
```
- 3e requête : Fonctionne, n'utilise pas de jointure 
- 4e requête : Même problème que pour la 2e requête, problème dans la sélection du bonne id pour la jointure. Correction proposée : changer l'id dans la jointure de f :
```
SELECT u.username, count(f.beer_id) AS favorite_number
FROM users u 
LEFT JOIN favorite f ON u.user_id = f.user_id
GROUP BY u.username 
```
- 5e requête : RAS
- 6e requête : RAS
- 7e requête : RAS
- 8e requête : RAS
- 9e requête : RAS
- 10e requête : RAS (je note que je n'ai pas fait pareil, là Adrien a fait deux jointures de la même table mais avec un alias différent)
- 11e requête : RAS (c'est chouette d'afficher l'average aussi, je crois que je ne l'ai pas fait donc je note ça !)
- 12e requête : RAS
- 13e requête : RAS

## Manipulations avancées :

- procédure stockée : RAS
- trigger : RAS

