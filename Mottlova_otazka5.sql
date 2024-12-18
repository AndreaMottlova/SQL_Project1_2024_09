

SELECT rok  
	   , round(HDP/1000000,2) AS 'HDP_v_mil'
	   , round( (lag(HDP) OVER (ORDER BY rok))/1000000,2) AS 'HDP_predch_rok_v_mil'
	   , round( (HDP/lag(HDP) OVER (ORDER BY rok) *100)-100,2) AS 'HDP_rozdil_procenta'
	   , round(avg(cena_cena),2) AS prumerna_cena
	   , round(lag(avg(cena_cena)) OVER (ORDER BY rok),2) AS cena_predch_rok
	   , round( (avg(cena_cena)/lag(avg(cena_cena)) OVER (ORDER BY rok) *100)-100,2) AS 'cena_rozdil_procenta'
	   , round(avg(zamest_hodnota),2) AS prumerna_mzda
	   , round(lag(avg(zamest_hodnota)) OVER (ORDER BY rok),2) AS mzda_predch_rok
	   , round( (avg(zamest_hodnota)/lag(avg(zamest_hodnota)) OVER (ORDER BY rok) *100)-100,2) AS 'mzda_rozdil_procenta'
	   ,CASE 
	  	WHEN (HDP/lag(HDP) OVER (ORDER BY rok)) *100-100 >0 THEN 'růst'
	 	WHEN (HDP/lag(HDP) OVER (ORDER BY rok)) *100-100 <0 THEN 'pokles'
	 	WHEN (HDP/lag(HDP) OVER (ORDER BY rok)) *100-100 =0 THEN 'stagnace'
	    END AS 'HDP_vývoj'
	   ,CASE 
	  	WHEN (avg(cena_cena)/lag(avg(cena_cena)) OVER (ORDER BY rok) *100)-100 >0 THEN 'růst'
	 	WHEN (avg(cena_cena)/lag(avg(cena_cena)) OVER (ORDER BY rok) *100)-100 <0 THEN 'pokles'
	 	WHEN (avg(cena_cena)/lag(avg(cena_cena)) OVER (ORDER BY rok) *100)-100 =0 THEN 'stagnace'
	    END AS 'cena_vývoj'
	    ,CASE 
	  	WHEN (avg(zamest_hodnota)/lag(avg(zamest_hodnota)) OVER (ORDER BY rok) *100)-100 >0 THEN 'růst'
	 	WHEN (avg(zamest_hodnota)/lag(avg(zamest_hodnota)) OVER (ORDER BY rok) *100)-100 <0 THEN 'pokles'
	 	WHEN (avg(zamest_hodnota)/lag(avg(zamest_hodnota)) OVER (ORDER BY rok) *100)-100 =0 THEN 'stagnace'
	    END AS 'mzdy_vývoj'
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 
WHERE zamest_kod_typ =5958
GROUP BY rok, HDP


SELECT * 
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 