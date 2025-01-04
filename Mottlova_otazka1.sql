-- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

-- tabulka vše
SELECT * 
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 

CREATE OR REPLACE VIEW v_andrea_mottlova_otazka1 AS (
SELECT  rok
		,odvetvi
		,round(avg(prumerna_mzda)) AS prum_mzda
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
)


-- select view
SELECT * 
FROM v_andrea_mottlova_otazka1 AS vamo 



-- pokles mezd v určitých odvětvích v konkrétních letech
SELECT *
FROM v_andrea_mottlova_otazka1 AS vamo 
WHERE  mzda_vyvoj = 'pokles' 
ORDER BY mzda_rozdil_procenta 


-- růst mezd za celé sledované období podle odvětví

SELECT 	A.odvetvi
		, A.prumerna_mzda AS prum_mzda_2006
		, B.prumerna_mzda AS prum_mzda_2018 
		, round(B.prumerna_mzda/A.prumerna_mzda*100-100,2) AS narust_procenta
FROM 
		(SELECT odvetvi
				, round(avg(prumerna_mzda)) AS prumerna_mzda
		FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 
		WHERE rok =2006
		GROUP BY rok, odvetvi) AS A 
	JOIN 
		(SELECT odvetvi
				, round(avg(prumerna_mzda)) AS prumerna_mzda
		FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 
		WHERE rok =2018
		GROUP BY odvetvi) AS B
	ON A.odvetvi=B.odvetvi
ORDER BY narust_procenta desc


