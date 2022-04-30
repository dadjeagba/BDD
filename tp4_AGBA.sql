
--Exercice1
--Q1)
SELECT *,trunc(superficie/5)+1 as "cat_sup" from communes;
--Q2)
 SELECT trunc(superficie/5)+1 AS "cat_sup", AVG(superficie), from communes GROUP BY cat_sup ORDER cat_sup ASC;
--Q3)
 SELECT communes.*, trunc(superficie/5)+1 AS "cat_sup",trunc(pop_totale/1000)+1 AS "cat_pop", pop_totale  AS  "pop_2016"
 FROM communes JOIN population USING(insee) WHERE recensement=2016;

 --Q4)
  --1)
 SELECT count(*) as "nb_communes", min(superficie),max(superficie),trunc(avg(superficie),2)
                                 as "Moyenne" ,trunc(pop_totale/1000)+1 AS "cat_pop" FROM communes JOIN population USING(insee) WHERE recensement=2016 GROUP BY trunc(pop_totale/1000)+1;

  --2)
         SELECT count(*) as "nb_communes", min(superficie),max(superficie),trunc(avg(superficie),2)
                                         as "Moyenne" ,trunc(pop_totale/1000)+1 AS "cat_pop" FROM communes JOIN population USING(insee)
                  WHERE recensement=2016 GROUP BY trunc(pop_totale/1000)+1  HAVING trunc(pop_totale/1000)+1 >5 ORDER BY nb_communes ASC ;






 --Exercice2

 --Utilisation de vue pour q3
 CREATE view  vueQ4_1 AS

 SELECT communes.*, trunc(superficie/5)+1 AS "cat_sup",trunc(pop_totale/1000)+1 AS "cat_pop", pop_totale  AS  "pop_2016"
 FROM communes JOIN population USING(insee) WHERE recensement=2016;
--Utilisation de vue pour les vues de q4

CREATE view  vueQ4_1 AS
SELECT count(*) as "nb_communes", min(superficie),max(superficie),trunc(avg(superficie),2)
                                as "Moyenne" ,trunc(pop_totale/1000)+1 AS "cat_pop" FROM communes JOIN population USING(insee)
         WHERE recensement=2016 GROUP BY trunc(pop_totale/1000)+1  HAVING trunc(pop_totale/1000)+1 >5 ORDER BY nb_communes ASC ;


CREATE view  vueQ4_2 AS  SELECT count(*) as "nb_communes", min(superficie),max(superficie),trunc(avg(superficie),2)
                                 as "Moyenne" ,trunc(pop_totale/1000)+1 AS "cat_pop" FROM communes JOIN population USING(insee)
          WHERE recensement=2016 GROUP BY trunc(pop_totale/1000)+1  HAVING trunc(pop_totale/1000)+1 >5 ORDER BY nb_communes ASC ;


          
