-- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

-- tabulka vše
SELECT * 
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 


SELECT  rok
		,odvetvi
		,avg(prumerna_mzda) AS prum_mzda
		,round(lag(avg(prumerna_mzda)) OVER (PARTITION BY odvetvi ORDER BY rok)) AS prum_mzda_predch_rok
		,round(avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (PARTITION BY odvetvi ORDER BY rok)*100-100,2) AS mzda_rozdil_procenta
		,CASE 
			WHEN avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (PARTITION BY odvetvi ORDER BY rok)*100-100 >0 THEN 'růst'
			WHEN avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (PARTITION BY odvetvi ORDER BY rok)*100-100 <0 THEN 'pokles'
			WHEN avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (PARTITION BY odvetvi ORDER BY rok)*100-100 =0 THEN 'stagnace'
		END AS mzda_vyvoj
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 
GROUP BY rok, odvetvi  
ORDER BY odvetvi ,rok


