SELECT 
	 industry_branch_code 
	,cpib.name AS industry_branch_name
	,cp.value_type_code
	,cpvt.name AS value_name
	,cp.value AS value_payroll
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
	ON cp.value_type_code =cpvt.code; 

	
	
SELECT 
	  cp.category_code
	 ,cpc.name AS category_name
	 ,cp.value AS category_value
	 ,cpc.price_value 
	 ,cpc.price_unit 
	 ,cp.region_code 
	 ,cr.name AS region_name
	 ,YEAR(cp.date_from) AS price_year
FROM czechia_price AS cp 
LEFT JOIN czechia_price_category AS cpc 
	ON cp.category_code =cpc.code 
LEFT JOIN czechia_region AS cr
	ON cp.region_code =cr.code ;
	
	

SELECT 
	  e.country
	 ,e.`year` 
	 ,e.GDP 
	 ,e.gini 
	 ,e.population 
FROM economies AS e 
LEFT JOIN countries AS c 
	ON e.country=c.country 
WHERE e.country ='Czech Republic' AND c.country ='Czech Republic'
	
