--Auteur AGBA Pascal Sébastien)
--TP BDD1)
--Q1
--a))
SELECT dossard,nom FROM coureurs;
--b))
 SELECT dossard,nom FROM coureurs ORDER BY dossard asc;
 --c)
 SELECT equipe,dossard, nom FROM coureurs ORDER BY equipe, nom ;
 --d)
 SELECT dossard,nom,taille  FROM coureurs ORDER BY taille asc;
--e)
 SELECT nom,dossard  FROM coureurs WHERE equipe='LavePlusBlanc';
--f)
-- avec  double  quotes )
  SELECT "nom","dossard" FROM coureurs WHERE equipe='LavePlusBlanc';
 -- Précédé par le nom  de la table)
 SELECT coureurs.nom,coureurs.dossard FROM coureurs WHERE equipe='LavePlusBlanc';
--h)
SELECT nom,taille,equipe  FROM coureurs WHERE taille<180 ORDER BY  taille asc;
 --i)
 SELECT couleur  FROM equipes ;
-- Q2)
--a)
SELECT nom ||' appartient à l ''équipe '|| equipe  FROM coureurs;
--b)
SELECT nom ||' appartient à l ''équipe '||  equipe  as "appartenance" FROM coureurs;
--c)
SELECT UPPER(nom) as "nom maj", char_length(nom) as "lg"  FROM coureurs;
--d avec nommage de la colonne et classement par ordre croissant)
SELECT UPPER(nom) as "nom maj", char_length(nom) as "lg"  FROM coureurs ORDER BY lg asc ;
--d' sans  nommage de la colonne)
SELECT UPPER(nom) , char_length(nom)  FROM coureurs ORDER BY  char_length(nom) asc ;
--Q3)
 --a)
 SELECT nom FROM coureurs WHERE nom like 'a%';
 --b)
 SELECT nom FROM coureurs WHERE nom LIKE '%er%';
 --c)
 SELECT nom FROM coureurs WHERE nom like '_____';
 --d)
 SELECT nom FROM coureurs WHERE nom like '%a__';
 --e)
 SELECT nom FROM coureurs WHERE nom like '%a__%';
 --Q4)
 --a)
 SELECT taille/100 from coureurs;
 --Ici l'erreur réside dans le fait que c'est la division  partie entière qui est appliquée
 --b)
  SELECT taille/100.0 from coureurs;
  -- Ce n'est vraiment pas une erreur mais on remaque les 0 initule sont affichés donc pas très appréciable
  --c)
  SELECT cast(taille/100.0 as float) FROM coureurs ;
  --c' avec nommage de la colonne en  taille en m
--d)
SELECT trunc(taille/100.0,2) as "taille en m" FROM coureurs ;

--q5
--a)
--c Nous avons une colonne dans la table coureurs qui réference une autre colonne dans la table equipe
--coureurs.equipe=equipe.nom;
--b
SELECT dossard ,coureurs.nom, equipe, couleur FROM coureurs JOIN equipes ON coureurs.equipe=equipes.nom ;
--c)
SELECT coureurs.nom,directeur FROM coureurs JOIN equipes ON coureurs.equipe=equipes.nom ;

--d)
SELECT coureurs.nom,dossard from coureurs JOIN equipes ON  coureurs.equipe=equipes.nom WHERE directeur='Ralph';
--e)
SELECT directeur FROM equipes JOIN coureurs ON coureurs.equipe=equipes.nom WHERE coureurs.nom = 'alphonse'
--Q6)
--a)
INSERT INTO equipes values ('AGBA','Jaune','Pascal');
--b)
INSERT INTO coureurs(dossard,nom,equipe,taille) values  ('13','Constance','AGBA','170');
INSERT INTO coureurs values('10','Jeanen','AGBA','177');

--Q7)

--a)
SELECT nom,directeur FROM   equipes   WHERE directeur IS  NULL ;
--b)
SELECT nom,directeur FROM   equipes   WHERE directeur IS NOT  NULL ;
--Q8)

--a)
UPDATE   coureurs SET taille= taille-1  WHERE equipe = 'PicsouBank';

--b)
UPDATE   equipes  SET  directeur= 'DirecteurOrange' WHERE  directeur IS NULL;
