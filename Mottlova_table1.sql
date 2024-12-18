CREATE OR REPLACE TABLE t_andrea_mottlova_project_SQL_primary_final AS 
SELECT 
	A.price_year AS rok
	, A.category_name AS kategorie_potraviny
	, A.category_value AS cena
	, A.price_value AS velikost
	, A.price_unit AS jednotka
	, B.industry_branch_name AS odvetvi
	, B.value_payroll AS prumerna_mzda
	, B.unit_name AS mena
	, e.GDP AS HDP
FROM (
	SELECT 
		  cp.category_code
		 ,cpc.name AS category_name
		 ,cp.value AS category_value
		 ,cpc.price_value 
		 ,cpc.price_unit 
		 ,YEAR(cp.date_from) AS price_year
	FROM czechia_price AS cp 
	LEFT JOIN czechia_price_category AS cpc 
		ON cp.category_code =cpc.code 
	WHERE cp.region_code IS NULL
	) AS A	
LEFT JOIN (	
	SELECT 
		 industry_branch_code 
		,cpib.name AS industry_branch_name
		,cp.value_type_code
		,cpvt.name AS value_name
		,avg(cp.value) AS value_payroll
		,cp.unit_code 
		,cpu.name AS unit_name
		,cp.calculation_code 
		,cpc.name AS calculation_code_name
		,cp.payroll_year 
	FROM czechia_payroll AS cp 
	LEFT JOIN czechia_payroll_calculation AS cpc 
		ON cp.calculation_code =cpc.code 
	LEFT JOIN czechia_payroll_industry_branch AS cpib 
		ON cp.industry_branch_code =cpib.code 
	LEFT JOIN czechia_payroll_unit AS cpu 
		ON cp.unit_code =cpu.code 
	LEFT JOIN czechia_payroll_value_type AS cpvt 
		ON cp.value_type_code =cpvt.code
		WHERE cp.value IS NOT NULL AND 
		cp.calculation_code=200 AND -- přepočtený
		cp.industry_branch_code IS NOT NULL AND 
		cp.value_type_code=5958
		GROUP BY industry_branch_code ,cpib.name,cp.value_type_code,cpvt.name,cp.unit_code ,cpu.name,cpc.name,cp.payroll_year 
		) AS B 
ON B.payroll_year=A.price_year
LEFT JOIN economies AS e 
ON B.payroll_year=e.`year` 
WHERE e.country = 'Czech Republic';


SELECT * 
FROM t_andrea_mottlova_project_sql_primary_final AS tampspf 

