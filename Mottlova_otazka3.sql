-- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

SELECT rok
	   , cena_kategorie 
	   , round(avg(cena_cena),2) AS prumerna_cena
	   , round( lag(avg(cena_cena)) OVER (PARTITION BY cena_kategorie ORDER BY rok),2) AS prumerna_cena_predch_rok
	   , round(avg(cena_cena)/lag(avg(cena_cena)) OVER (PARTITION BY cena_kategorie ORDER BY rok) *100-100,2) AS prum_cena_rozdil_procenta
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf
WHERE zamest_kod_typ =5958
GROUP BY cena_kategorie , rok



