SELECT  rok
		,zamest_odvetvi AS odvetvi
		,avg(zamest_hodnota) AS prum_mzda
		,round(lag(avg(zamest_hodnota)) OVER (PARTITION BY zamest_odvetvi ORDER BY rok)) AS prum_mzda_predch_rok
		,round(avg(zamest_hodnota)/lag(avg(zamest_hodnota)) OVER (PARTITION BY zamest_odvetvi ORDER BY rok)*100-100,2) AS mzda_rozdil_procenta
		,CASE 
			WHEN avg(zamest_hodnota)/lag(avg(zamest_hodnota)) OVER (PARTITION BY zamest_odvetvi ORDER BY rok)*100-100 >0 THEN 'růst'
			WHEN avg(zamest_hodnota)/lag(avg(zamest_hodnota)) OVER (PARTITION BY zamest_odvetvi ORDER BY rok)*100-100 <0 THEN 'pokles'
			WHEN avg(zamest_hodnota)/lag(avg(zamest_hodnota)) OVER (PARTITION BY zamest_odvetvi ORDER BY rok)*100-100 =0 THEN 'stagnace'
		END AS mzda_vyvoj
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 
WHERE zamest_kod_typ =5958
GROUP BY rok, zamest_odvetvi  
ORDER BY zamest_odvetvi , rok


