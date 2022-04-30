--TP5
--Auteur AGBA Pascal Sébastien
--Q1
CREATE TABLE  etapes(
nom VARCHAR(50),
numero INT NOT NULL check( numero >=1) PRIMARY KEY
);*
--Remplissage de la table
INSERT INTO etapes(nom,numero) VALUES ('Dunkerque',6),('Flaine',7),('Serres',10);
--Q2
CREATE TABLE temps(
dossard INTEGER NOT NULL,
etape INTEGER NOT NULL ,
chrono INTERVAL,
id SERIAL  PRIMARY KEY

);
--Q3
-- Ici il etape et dossard sont des clés étrangères donc pour une bon fonctionnement de la table il faut docnc  ajouter ces contraintes
ALTER TABLE temps add FOREIGN KEY (etape) REFERENCES etapes(numero);
ALTER TABLE temps add  FOREIGN KEY (dossard) REFERENCES coureurs(dossard)
;
--Q4)
ALTER TABLE temps add  check (chrono <'06:00:00 ' AND chrono >='00:00:00') ;

--Q5
INSERT INTO temps VALUES (4,10,'03:00:00'),(7,6'04:05:30');
--Q6
--1
--copie de la table  etapes
CREATE TABLE cpetapes AS SELECT * from etapes;
 --Copie de la table  temps
CREATE TABLE  cptemps AS SELECT * from temps;
--2
--ERREUR:  UPDATE ou DELETE sur la table « etapes » viole la contrainte de clé étrangère
--« temps_etape_fkey » de la table « temps »
--DETAIL:  La clé (numero)=(6) est toujours référencée à partir de la table « temps ».
-- ON ne peut supprimer une table dont l'un des éléments est toujours rattaché à une autre table. Ici c'est la contrainte d'intégrité qui nous oblige à devoir supprimer la clé de
--numero 6  dans tables  temps avant de supprimer l'élément  qu'il référence dans etapes. Un DELETE ON CASCADE aurait pu résoudre le problème (mais ce n'est pas la question de notre tp)
--3
DELETE FROM temps;
--La table est vidée avec la commande ci-dessus
--4
INSERT INTO temps VALUES (19,4,'03:02:00');
--Lors de ce enregistrement son id est 8
--5)
delete from etapes;
DELETE FROM temps;
 --les deux commandes ci-dessus ont permi de vider les deux tables
--6) RESTAURATION DES TABLES A PARTIR DES SAUVEGARDES
INSERT INTO etapes SELECT * from cpetapes;
INSERT INTO temps SELECT * from cptemps;
--Q7
--enregistrement  de la requete commme vue à l'étape 1;
 CREATE VIEW classement_avec_rank1 AS  SELECT  dossard,chrono ,rank() over (ORDER BY chrono) AS Classement FROM temps WHERE etape=1;

 --ceci est la requête
 CREATE VIEW classement_avec_rank2 AS  SELECT  dossard,chrono ,rank() over (ORDER BY chrono) AS Classement FROM temps WHERE etape=2;
--Q8)
 SELECT coureurs.dossard, coureurs.nom ,coureurs.equipe ,chrono, rank() over (ORDER BY chrono) AS Classement
  FROM   coureurs LEFT JOIN temps  USING (dossard)  GROUP BY   etape, dossard,chrono ;
