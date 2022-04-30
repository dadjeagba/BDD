--Auteur AGBA Pascal Sébastien
--Mardi 12/10/2021
--Exercice3
--Q1 Le fichier a  été exécuté et les les tables ont été créees
--Q2)
CREATE TABLE regions (
code_region TEXT PRIMARY KEY,
nom_region text )
;
CREATE TABLE departements (
code_dept TEXT PRIMARY KEY,
nom_dept text,
code_region text,
FOREIGN KEY (code_region) REFERENCES regions(code_region)
)
;
CREATE TABLE academies (
code_acad TEXT PRIMARY KEY,
nom_acad text
)
;
CREATE TABLE natures (
code_nature TEXT PRIMARY KEY,
nom_nature text
);

CREATE TABLE communes (
code_commune TEXT PRIMARY KEY,
nom_commune text,
code_dept text,
FOREIGN KEY (code_dept) REFERENCES departements(code_dept)
)
;


CREATE TABLE etablissements (
code_etab TEXT PRIMARY KEY,
adresse text,
appellation  text not null,
code_commune text ,
code_nature text,
code_acad text,
FOREIGN KEY (code_nature) REFERENCES natures(code_nature),
FOREIGN KEY (code_commune) REFERENCES communes(code_commune),
FOREIGN KEY (code_acad) REFERENCES academies(code_acad)
)
;
--Pour bien écrire les tables, ont écrit en premier les tables dont aucun attribut  n'est une clé etrangères
--Une fois que ces dernières sont écrites, on écrit ensuite celles dont  un ou plusieurs attribut(s) sont des clés étrangères
--Q3)


INSERT INTO agba.regions(code_region, nom_region) SELECT DISTINCT code_reg,region from scol.importation;
INSERT INTO agba.academies(code_acad, nom_acad) SELECT DISTINCT code_acad,academie from scol.importation;
INSERT INTO agba.natures(code_nature, nom_nature) SELECT DISTINCT code_nature,nature from scol.importation;
INSERT INTO agba.departements(code_dept, nom_dept,code_region)  SELECT DISTINCT code_dept,departement,code_reg from scol.importation;

INSERT INTO communes SELECT DISTINCT code_commune,commune,code_dept from scol.importation;
INSERT INTO etablissements SELECT code_etab,adresse,appellation,code_commune, code_nature,code_acad from scol.importation
