-- Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách 
-- potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?


-- tabulka vše
SELECT * 
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 

---------

SELECT rok  
	   , round(HDP/1000000) AS 'HDP_v_mil'
	   , round( (lag(HDP) OVER (ORDER BY rok))/1000000) AS 'HDP_predch_rok_v_mil'
	   , round( (HDP/lag(HDP) OVER (ORDER BY rok) *100)-100,2) AS 'HDP_rozdil_procenta'
	   , round(avg(cena),2) AS prumerna_cena
	   , round(lag(avg(cena)) OVER (ORDER BY rok),2) AS cena_predch_rok
	   , round( (avg(cena)/lag(avg(cena)) OVER (ORDER BY rok) *100)-100,2) AS 'cena_rozdil_procenta'
	   , round(avg(prumerna_mzda),2) AS prumerna_mzda
	   , round(lag(avg(prumerna_mzda)) OVER (ORDER BY rok),2) AS mzda_predch_rok
	   , round( (avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (ORDER BY rok) *100)-100,2) AS 'mzda_rozdil_procenta'
	   ,CASE 
	  	WHEN (HDP/lag(HDP) OVER (ORDER BY rok)) *100-100 >0 THEN 'růst'
	 	WHEN (HDP/lag(HDP) OVER (ORDER BY rok)) *100-100 <0 THEN 'pokles'
	 	WHEN (HDP/lag(HDP) OVER (ORDER BY rok)) *100-100 =0 THEN 'stagnace'
	    END AS 'HDP_vývoj'
	   ,CASE 
	  	WHEN (avg(cena)/lag(avg(cena)) OVER (ORDER BY rok) *100)-100 >0 THEN 'růst'
	 	WHEN (avg(cena)/lag(avg(cena)) OVER (ORDER BY rok) *100)-100 <0 THEN 'pokles'
	 	WHEN (avg(cena)/lag(avg(cena)) OVER (ORDER BY rok) *100)-100 =0 THEN 'stagnace'
	    END AS 'cena_vývoj'
	    ,CASE 
	  	WHEN (avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (ORDER BY rok) *100)-100 >0 THEN 'růst'
	 	WHEN (avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (ORDER BY rok) *100)-100 <0 THEN 'pokles'
	 	WHEN (avg(prumerna_mzda)/lag(avg(prumerna_mzda)) OVER (ORDER BY rok) *100)-100 =0 THEN 'stagnace'
	    END AS 'mzdy_vývoj'
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 
GROUP BY rok, HDP


SELECT * 
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 