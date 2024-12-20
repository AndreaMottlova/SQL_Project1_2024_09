
CREATE OR REPLACE TABLE t_andrea_mottlova_project_SQL_secondary_final
SELECT 	e.year AS rok 
		,e.country AS stat
		,round(e.gdp/1000000) AS hdp_v_mil
		,e.population AS populace
		,e.gini AS gini
FROM countries AS c 
JOIN economies AS e 
	ON c.country =e.country 
WHERE	c.continent ='Europe' AND 
		e.`year` BETWEEN 2006 AND 2018
ORDER BY stat, rok desc
		
		
SELECT * 
FROM t_andrea_mottlova_project_sql_secondary_final AS tampssf 
