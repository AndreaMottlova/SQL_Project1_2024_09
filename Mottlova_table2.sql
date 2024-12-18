
CREATE OR REPLACE TABLE t_andrea_mottlova_project_SQL_secondary_final
SELECT 	e.year AS rok 
		,e.country AS stat
		,round(e.gdp/1000000) AS hdp_v_mil
		,e.population AS populace
		,e.gini AS gini
		,round(e.taxes,2) AS dane
		,round(e.fertility,1) AS plodnost
		,e.mortaliy_under5 AS umrtnost_pod5
		,c.abbreviation AS zkratka
		,c.avg_height AS prumerna_vyska
		,c.capital_city AS hlavni_mesto
		,c.continent AS kontinent
		,c.currency_code AS mena_kod
		,c.currency_name AS mena
		,c.religion AS nabozenstvi
		,c.domain_tld AS domena
		,c.elevation AS nadmorska_vyska
		,c.north AS sever
		,c.south AS jih
		,c.west AS západ
		,c.east AS vychod
		,c.government_type AS vladni_utvar
		,c.independence_date AS nezavislost
		,c.landlocked AS vnitrozemsky
		,c.life_expectancy AS delka_zivota
		,c.national_symbol AS narodni_symbol
		,c.national_dish AS narodni_jidlo
		,round(c.population_density,2) AS hustota_obyvatel
		,c.region_in_world AS region_svet
		,c.surface_area AS plocha
		,c.yearly_average_temperature AS prumerna_rocni_teplota
		,c.median_age_2018 AS median_vek_2018
		,c.iso2 
		,c.iso3
FROM countries AS c 
JOIN economies AS e 
	ON c.country =e.country 
WHERE	c.continent ='Europe' AND 
		e.`year` BETWEEN 2006 AND 2018
ORDER BY stat, rok desc
		
		
SELECT * 
FROM t_andrea_mottlova_project_sql_secondary_final AS tampssf 
