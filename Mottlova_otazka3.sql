-- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
SELECT rok
	   , cena_kategorie 
	   , round(avg(cena_cena),2) AS prumerna_cena
	   , round( lag(avg(cena_cena)) OVER (PARTITION BY cena_kategorie ORDER BY rok),2) AS prumerna_cena_predch_rok
	   , round(avg(cena_cena)/lag(avg(cena_cena)) OVER (PARTITION BY cena_kategorie ORDER BY rok) *100-100,2) AS prum_cena_rozdil_procenta
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf
WHERE zamest_kod_typ =5958
GROUP BY cena_kategorie , rok



-- porovnání nárustu cen za celé období (půměr + suma)
WITH cte_am_zdrazovani_potravin AS (
	SELECT rok
		   , cena_kategorie 
		   , round(avg(cena_cena),2) AS prumerna_cena
		   , round( lag(avg(cena_cena)) OVER (PARTITION BY cena_kategorie ORDER BY rok),2) AS prumerna_cena_predch_rok
		   , round(avg(cena_cena)/lag(avg(cena_cena)) OVER (PARTITION BY cena_kategorie ORDER BY rok) *100-100,2) AS prum_cena_rozdil_procenta
	FROM t_andrea_mottlova_project_sql_primary_final AS tampspf
	WHERE zamest_kod_typ =5958
	GROUP BY cena_kategorie , rok
)
SELECT cena_kategorie
	   , round( avg(prum_cena_rozdil_procenta),2) AS prumerny_narust
	   , sum(prum_cena_rozdil_procenta) AS suma_narust
FROM cte_am_zdrazovani_potravin
GROUP BY cena_kategorie
ORDER BY suma_narust

