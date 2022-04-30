--Auteur AGBA Pascal Sébastien
--TP2 BDD1
--Exercice1 complet
--Date 28/09/2021
--Q1 COmplet et vérifier en sall de TP avec Professeur)
--1)
SELECT insee AS "code insee", nom, superficie from communes ORDER BY superficie DESC;
--2)
SELECT insee, nom from communes  WHERE nom LIKE '%Lille%';
--3)
SELECT insee AS "code insee", substring(insee,1,2) AS  "département" , nom from communes;

--4)
SELECT population.insee AS "code insee",communes.nom,  recensement AS "année de recensement",  pop_totale AS "population totale"
FROM population JOIN  communes ON communes.insee= population.insee ORDER BY communes.nom DESC , recensement  ASC;
--5)
SELECT population.insee AS "code insee",communes.nom, pop_totale AS "population totale"
FROM population JOIN  communes ON communes.insee= population.insee WHERE recensement=2016 ORDER BY pop_totale DESC;

--6)
SELECT population.insee AS "code insee", communes.nom,pop_mun as  "  population municipale",superficie ,cast(pop_mun/superficie as integer) AS "densité"
FROM population JOIN  communes ON communes.insee= population.insee WHERE recensement=2016 ORDER BY densité DESC ;
----------------------------------------------------------------------------------------------------------------------------------------------------------

--Q2 COmplet)

SELECT population.insee AS "code insee", communes.nom,pop_mun as  "  population municipale",superficie ,cast(pop_mun/superficie as integer) AS "densité"
FROM population JOIN  communes USING( insee) WHERE recensement=2016 ORDER BY densité DESC ;
----------------------------------------------------------------------------------------------------------------------------------------------------------


--Q3 complet)
--1)
SELECT  nom, nom_station AS "nom de station", lat AS "latitude", lon AS "longitude"  FROM stations  JOIN  communes USING(insee) ORDER BY nom;

--2)
SELECT  nom, nom_station AS "nom de station", lat AS "latitude", lon AS "longitude"  FROM communes   LEFT JOIN stations  USING(insee)  ORDER BY nom;

----------------------------------------------------------------------------------------------------------------------------------------------------------


--Q4 complet et vérifier avec Professeur en TP)
--1
SELECT count(valeur) as "Nb  mesure" FROM mesures_mensuelles;


--2
SELECT avg(valeur) AS "moyenne", max(valeur) AS "maximimun",min(valeur)  AS "minimum"  from mesures_mensuelles  WHERE code_polluant= 7;

--3
SELECT count (valeur) AS "NB mesures" ,avg(valeur) AS "moyenne", max(valeur) AS "maximimun",min(valeur)  AS "minimum"  from mesures_mensuelles JOIN stations USING(code_station) WHERE code_polluant= 7;
--4


SELECT  count (valeur) AS "NB mesures" ,avg(valeur) AS "moyenne", max(valeur) AS "maximimun",min(valeur)  AS "minimum",nom_station
 from mesures_mensuelles JOIN stations USING(code_station)
WHERE code_polluant= 7 GROUP BY nom_station;

--5
SELECT  count (valeur) AS "NB mesures" ,avg(valeur) AS "moyenne", max(valeur) AS "maximimun",min(valeur)  AS "minimum",nom_station
 from mesures_mensuelles JOIN stations USING(code_station)
WHERE code_polluant=6001 GROUP BY nom_station;

--6
SELECT  count (valeur) AS "NB mesures" ,avg(valeur) AS "moyenne", max(valeur) AS "maximimun",min(valeur)  AS "minimum",nom_station
 from mesures_mensuelles JOIN stations USING(code_station)
WHERE code_polluant=6001 GROUP BY nom_station HAVING  avg (valeur)>10 ;


--7)
SELECT  count (valeur) AS "NB mesures" ,avg(valeur) AS "moyenne", max(valeur) AS "maximimun",min(valeur)  AS "minimum",code_station,code_polluant
 from mesures_mensuelles JOIN stations USING(code_station)
 GROUP BY code_station,code_polluant ORDER BY code_polluant ;
--8)
SELECT  count (valeur) AS "NB mesures" ,avg(valeur) AS "moyenne", max(valeur) AS "maximimun",min(valeur)  AS "minimum",code_station,code_polluant,nom_station,nom_polluant
 from mesures_mensuelles JOIN stations USING(code_station)JOIN polluants USING(code_polluant)
 GROUP BY code_station,code_polluant, nom_station ,nom_polluant;
 ---FIN SUJET
