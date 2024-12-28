-- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?


SELECT rok
	   , kategorie_potraviny 
	   , round(avg(cena),2) AS prumerna_cena
	   , round( lag(avg(cena)) OVER (PARTITION BY kategorie_potraviny ORDER BY rok),2) AS prumerna_cena_predch_rok
	   , round(avg(cena)/lag(avg(cena)) OVER (PARTITION BY kategorie_potraviny ORDER BY rok) *100-100,2) AS prum_cena_rozdil_procenta
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf
GROUP BY kategorie_potraviny , rok


-- --------------------------------------------------------------------------------------------- 
-- porovnání nárustu cen za celé období (půměr + suma)
WITH cte_am_zdrazovani_potravin AS (
	SELECT rok
		   , kategorie_potraviny 
		   , round(avg(cena),2) AS prumerna_cena
		   , round( lag(avg(cena)) OVER (PARTITION BY kategorie_potraviny ORDER BY rok),2) AS prumerna_cena_predch_rok
		   , round(avg(cena)/lag(avg(cena)) OVER (PARTITION BY kategorie_potraviny ORDER BY rok) *100-100,2) AS prum_cena_rozdil_procenta
	FROM t_andrea_mottlova_project_sql_primary_final AS tampspf
	GROUP BY kategorie_potraviny , rok
)
SELECT kategorie_potraviny
	   , round( avg(prum_cena_rozdil_procenta),2) AS prumerny_narust_procenta
	   , sum(prum_cena_rozdil_procenta) AS suma_narust_procenta
FROM cte_am_zdrazovani_potravin
GROUP BY kategorie_potraviny
ORDER BY suma_narust_procenta

