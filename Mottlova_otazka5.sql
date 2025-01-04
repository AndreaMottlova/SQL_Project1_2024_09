-- Má výška sec.hdp vliv na změny ve mzdách a cenách potravin? Neboli, pokud sec.hdp vzroste výrazněji v jednom roce, projeví se to na cenách 
-- potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?


SELECT prim.rok  
	   , round(sec.hdp/1000000) AS hdp_v_mil
	   , round( (lag(sec.hdp) OVER (ORDER BY prim.rok))/1000000) AS hdp_predch_rok_v_mil
	   , round( (sec.hdp/lag(sec.hdp) OVER (ORDER BY prim.rok) *100)-100,2) AS hdp_rozdil_procenta
	   , round(avg(prim.cena),2) AS prumerna_cena
	   , round(lag(avg(prim.cena)) OVER (ORDER BY prim.rok),2) AS cena_predch_rok
	   , round( (avg(prim.cena)/lag(avg(prim.cena)) OVER (ORDER BY prim.rok) *100)-100,2) AS cena_rozdil_procenta
	   , round(avg(prim.prumerna_mzda),2) AS prumerna_mzda
	   , round(lag(avg(prim.prumerna_mzda)) OVER (ORDER BY prim.rok),2) AS mzda_predch_rok
	   , round( (avg(prim.prumerna_mzda)/lag(avg(prim.prumerna_mzda)) OVER (ORDER BY prim.rok) *100)-100,2) AS mzda_rozdil_procenta
	   ,CASE 
	  	WHEN (sec.hdp/lag(sec.hdp) OVER (ORDER BY prim.rok)) *100-100 >0 THEN 'růst'
	 	WHEN (sec.hdp/lag(sec.hdp) OVER (ORDER BY prim.rok)) *100-100 <0 THEN 'pokles'
	 	WHEN (sec.hdp/lag(sec.hdp) OVER (ORDER BY prim.rok)) *100-100 =0 THEN 'stagnace'
	    END AS hdp_vyvoj
	   ,CASE 
	  	WHEN (avg(prim.cena)/lag(avg(prim.cena)) OVER (ORDER BY prim.rok) *100)-100 >0 THEN 'růst'
	 	WHEN (avg(prim.cena)/lag(avg(prim.cena)) OVER (ORDER BY prim.rok) *100)-100 <0 THEN 'pokles'
	 	WHEN (avg(prim.cena)/lag(avg(prim.cena)) OVER (ORDER BY prim.rok) *100)-100 =0 THEN 'stagnace'
	    END AS cena_vyvoj
	    ,CASE 
	  	WHEN (avg(prim.prumerna_mzda)/lag(avg(prim.prumerna_mzda)) OVER (ORDER BY prim.rok) *100)-100 >0 THEN 'růst'
	 	WHEN (avg(prim.prumerna_mzda)/lag(avg(prim.prumerna_mzda)) OVER (ORDER BY prim.rok) *100)-100 <0 THEN 'pokles'
	 	WHEN (avg(prim.prumerna_mzda)/lag(avg(prim.prumerna_mzda)) OVER (ORDER BY prim.rok) *100)-100 =0 THEN 'stagnace'
	    END AS mzdy_vyvoj
FROM t_andrea_mottlova_project_sql_primary_final AS prim
JOIN t_andrea_mottlova_project_sql_secondary_final AS sec 
	ON prim.rok=sec.rok 
WHERE sec.stat = 'Czech Republic'
GROUP BY prim.rok, sec.hdp
