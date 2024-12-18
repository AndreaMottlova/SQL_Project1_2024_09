-- Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?


-- tabulka vše
SELECT * 
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 

---------

SELECT rok 
	   , round(avg(cena),2) AS prumerna_cena_potravin
	   , round(lag(avg(cena)) OVER (ORDER BY rok),2) AS prum_cena_predch_rok
	   , round(avg(cena)/lag(avg(cena)) OVER (ORDER BY rok)*100-100,2) AS prum_cena_rozdil_procent
	   , round(avg(prumerna_mzda),2) AS prumerna_mzda
	   , round(lag(avg(prumerna_mzda)) OVER (ORDER BY rok),2) AS prum_mzda_predch_rok
	   , round(avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (ORDER BY rok)*100-100,2) AS prum_mzda_rozdil_procent
	   , round((avg(cena)/lag(avg(cena)) OVER (ORDER BY rok)*100-100)-(avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (ORDER BY rok)*100-100),2) AS porovnani_ceny_vs_mzdy
	   , CASE
	   	WHEN (avg(cena)/lag(avg(cena)) OVER (ORDER BY rok)*100-100)-(avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (ORDER BY rok)*100-100) > 0 THEN 'růst'
	   	WHEN (avg(cena)/lag(avg(cena)) OVER (ORDER BY rok)*100-100)-(avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (ORDER BY rok)*100-100) < 0 THEN 'pokles'
	   	WHEN (avg(cena)/lag(avg(cena)) OVER (ORDER BY rok)*100-100)-(avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (ORDER BY rok)*100-100) = 0 THEN 'stagnace'
	   END AS vyvoj_ceny_vs_mzdy
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 
GROUP BY rok 
ORDER BY rok 