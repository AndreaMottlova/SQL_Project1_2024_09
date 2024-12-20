-- Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?


-- tabulka vše
SELECT * 
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 

---------

SELECT rok 
	   , kategorie_potraviny
	   , concat(round(avg(cena),2),' / ',velikost,jednotka)  AS prumerna_cena
	   , concat(round(avg(prumerna_mzda)),' Kč') AS prumerna_mzda
	   , concat(floor(avg(prumerna_mzda)/avg(cena)),' ',jednotka) AS pocet
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 
WHERE (kategorie_potraviny=  'Mléko polotučné pasterované' OR 
	   kategorie_potraviny= 'Chléb konzumní kmínový') AND 
	   (rok = 2006 OR 
	   rok = 2018)
GROUP BY rok, kategorie_potraviny
ORDER BY kategorie_potraviny, rok 

