SELECT rok 
	   , cena_kategorie 
	   , round(avg(cena_cena),2) AS prumerna_cena
	   , round(avg(zamest_hodnota)) AS prumerna_mzda
	   , round(avg(zamest_hodnota)/avg(cena_cena),2) AS pocet
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 
WHERE (cena_kategorie =  'Mléko polotučné pasterované' OR 
	   cena_kategorie = 'Chléb konzumní kmínový') AND 
	   (rok = 2006 OR 
	   rok = 2018)
GROUP BY rok, cena_kategorie 
ORDER BY cena_kategorie, rok 