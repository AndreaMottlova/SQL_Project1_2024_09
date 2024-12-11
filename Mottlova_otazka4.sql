-- Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

SELECT rok 
	   , round(avg(cena_cena),2) AS prumerna_cena_potravin
	   , round(lag(avg(cena_cena)) OVER (ORDER BY rok),2) AS prum_cena_predch_rok
	   , round(avg(cena_cena)/lag(avg(cena_cena)) OVER (ORDER BY rok)*100-100,2) AS prum_cena_rozdil_procent
	   , round(avg(zamest_hodnota),2) AS prumerna_mzda
	   , round(lag(avg(zamest_hodnota)) OVER (ORDER BY rok),2) AS prum_mzda_predch_rok
	   , round(avg(zamest_hodnota)/lag(avg(zamest_hodnota)) OVER (ORDER BY rok)*100-100,2) AS prum_mzda_rozdil_procent
	   , round((avg(cena_cena)/lag(avg(cena_cena)) OVER (ORDER BY rok)*100-100)-(avg(zamest_hodnota)/lag(avg(zamest_hodnota)) OVER (ORDER BY rok)*100-100),2) AS porovnani_ceny_vs_mzdy
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 
WHERE zamest_kod_typ = 5958
GROUP BY rok 
ORDER BY rok 