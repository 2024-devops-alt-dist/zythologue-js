-- Lister les bières par taux d'alcool, de la plus légère à la plus forte.
select * from beer order by abv;

--Afficher le nombre de bières par catégorie.
select COUNT(*), category.* FROM beer 
left join category ON category.id = beer.id_category 
group by category.id ;

-- Trouver toutes les bières d'une brasserie donnée.
select * FROM beer 
left join brewery ON brewery.id = beer.id_brewery 
WHERE brewery.name='Mountain Peak Brewery' ;

-- Lister les utilisateurs et le nombre de bières qu'ils ont ajoutées à leurs favoris.
select COUNT(*), u.* FROM "user" u 
left join favorite ON u.id = favorite.id_user 
group by u.id ;

-- Ajouter une nouvelle bière à la base de données.
INSERT INTO beer (name, description, abv, id_brewery, id_category) VALUES
('La Goudale', 'It is round in mouth and slightly bitter, the wheat gives it a touch of acidity and the malt some bitterness. The final result is very pleasant, it is a beer to be savored.', 8, 3, 2);

-- Afficher les bières et leurs brasseries, ordonnées par pays de la brasserie.
select * FROM beer 
left join brewery ON brewery.id = beer.id_brewery 
ORDER BY brewery.country ;


-- Lister les bières avec leurs ingrédients.
select * FROM beer 
left join beer_ingredient bi ON beer.id = bi.id_beer 
left join ingredient on ingredient.id = bi.id_ingredient ;

-- Afficher les brasseries et le nombre de bières qu'elles produisent, pour celles ayant plus de 5 bières.
select COUNT(*), brewery.* FROM beer 
left join brewery ON brewery.id = beer.id_brewery 
group by brewery.id having COUNT(*) > 5;


-- Lister les bières qui n'ont pas encore été ajoutées aux favoris par aucun utilisateur.
SELECT beer.*
FROM beer
LEFT JOIN favorite  ON beer.id = favorite.id_beer 
WHERE favorite.id_beer IS NULL;

-- Trouver les bières favorites communes entre deux utilisateurs.
select count(*), b.* from beer b 
left join favorite f on f.id_beer = b.id 
left join "user" u on f.id_user = u.id 
where u.id = 1 or u.id = 2
group by b.id 
having count(*) > 1;

-- Afficher les brasseries dont les bières ont une moyenne de notes supérieure à une certaine valeur.
select brewery.*, AVG(review.rating) FROM review 
left join beer on beer.id = review.id_beer 
left join brewery ON brewery.id = beer.id_brewery 
group by brewery.id having AVG(review.rating) > 3;

-- Mettre à jour les informations d'une brasserie.
UPDATE brewery
SET country = 'France'
WHERE id = 1;

-- Supprimer les photos d'une bière en particulier.
DELETE FROM photo
WHERE id_beer = 3;


-- Tester la procédure review_beer().
CALL review_beer(5, 1, 1);

CALL review_beer(2, 1, 1);