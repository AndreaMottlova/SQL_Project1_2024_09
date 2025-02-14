# Projekt 1 – SQL – Datová akademie
---

### **Zadání projektu**

Projekt se zaměřuje na dostupnost základních potravin široké veřejnosti, na základě srovnání cen potravin, průměrných mezd, případně i vlivu HDP. 
Pro výstup z projektu je potřeba vytvořit **Tabulku 1**, která obsahuje ceny potravin a průměrné mzdy v ČR a **Tabulku 2**, která obsahuje HDP a další data o dalších evropských státech. 
Z tabulek je následně potřeba odpovědět na **5 zadaných výzkumných otázek**. 

### **Výstup projektu**

**Tabulka 1**

Tabulka 1 obsahuje údaje o dostupnosti potravin na základě průměrných cen potravin a průměrných mezd za určité období. 
Pro analýzu jsem použila tabulky czechia_payroll (tabulka o průměrných mzdách v různých odvětvích) a czechia_price (tabulka o cenách potravin v regionech ČR) a další k nim napojené tabulky a číselníky. 

*NULL hodnoty nebo odstraněné data:*
Jelikož je vhodné tabulku velikostně optimalizovat, ponechala jsme pouze hodnoty/sloupce, které budu potřebovat pro zodpovězení zadaných výzkumných otázek.  
-	*Regiony* – rozdělení na regiony není pro výzkum důležité, ponechala jsem proto pouze hodnotu region NULL, což představuje průměr za celou ČR
-	NULL hodnoty u cen potravin a názvu odvětví byly odstraněny
-	*Calculation code* obsahoval hodnoty 100 – fyzický a 200 přepočtený. Jelikož průměrná mzda se počítá na přepočtené plné úvazky, ponechala jsem pouze hodnotu 200
-	*Value_type_code* obsahoval hodnoty 5958 (průměrná mzda) nebo 316 (průměrný počet zaměstnaných osob) – kód 316 jsem nikde v odpovědích nepotřebovala, z tabulky jsem ho proto odstranila
  
Spojením tabulek s cenami a průměrnými mzdami vznikl průnik údajů za *období od roku 2006 do 2018*. 

**Tabulka 2**

Dodatečná data (HDP, GINI, populace) o evropských státech za období 2006 až 2018.

**Otázka 1**

***Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?***

Pokud vezmeme v úvahu celé sledované období (porovnání roku 2006 a 2018), mzdy ve všech odvětvích od roku 2006 do 2018 stoupaly, minimální celkový nárust byl o 37,1 % v odvětví Peněžnictví a pojišťovnictví, naopak největší nárust od roku 2006 do 2018 byl v odvětví Zdravotní a sociální péče a to o 77,8 %.
V datech byl ale zaznamenán pokles mezd v některých rocích a odvětvích. **Největší pokles, o 8,8 % byl v roce 2013 v odvětví Peněžnictví a pojišťovnictví**, kdy průměrná mzda klesla z 50 801 Kč v roce 2012 na 46 317 Kč v roce 2013. 

**Otázka 2**

***Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?***

Ve sledovaném období byla průměrná mzda na začátku období, tedy v roku 2006, ve výši 21165 Kč, na konci období, tedy v roce 2018, vystoupala průměrná mzda na 33091 Kč. 
Mezi roky 2006 a 2018 došlo k nárustu průměrné mzdy, ale také ke zvýšení cen potravin. V roce 2018 je možné za průměrnou mzdu koupit o něco víc chleba (1365 kg) než v roce 2006 (1312 kg). U mléka byl rozdíl výraznější, kdy v roce 2006 bylo možné koupit z průměrné mzdy 1465 l, kdežto v roce 2018 až 1669 l mléka. 
Z toho vyplývá, že **za průměrnou mzdu je v roce 2018 možné koupit větší množství základních potravin**, což může odrážet růst reálné kupní síly. 

**Otázka 3**

***Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší procentuální meziroční nárůst)?***

Na základě dat lze identifikovat, že **potravinou s nejpomalejším meziročním nárustem cen je Cukr krystalový**, který vykazuje nejnižší průměrný meziroční nárust procent a to o 1,92%, což znamená, že jeho cena se dokonce snižovala. Celkový pokles ceny činí 23,02%. 
Kromě cukru zlevňovali ještě Rajská jablka červená kulatá, a to průměrně meziročně o 0,74%, celkový pokles ceny byl o 8,89%. Tohle jsou dvě kategorie, která zdražovala nejpomaleji, respektive zlevňovala, což je v porovnání s ostatními kategoriemi potravin výjimečné. 

**Otázka 4**

***Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?***

Meziroční nárust cen potravin i meziroční nárust mezd jsem vyhodnotila procentuálním nárustem oproti předchozímu roku. Rozdílem mezi těmito vypočtenými hodnotami jsem porovnala vývoj cen vs mezd. Nejhorší situace nastává, když růst cen potravin je vysoký, ale růst mezd je nízký. 
Z dat vyplývá, že **ani v jednom ze sledovaných roků nebyl meziroční nárust cen potravin vyšší než 10 % oproti růstu mezd**. 
Nejhorší situace byla v roce 2013, kdy průměrné ceny potravin vzrostli o 5,55 % a průměrné mzdy klesly o 1,56 % což znamená, že růst cen potravin byl vyšší o 7,11 % oproti růstu mezd. 

**Otázka 5**

***Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?***

Z dat je patrné, že nejvýraznější nárust HDP (nad 5%) byl v rocích 2007, 2015 a 2017. 
-	2007: HDP vzrostlo o 5,57 %, ceny potravin o 6,35 %, mzdy o 6,88 % 
Následující rok (2008) ceny potravin vzrostly o 6,41 % a mzdy o 7,69 % -> zdá se, že vyšší růst HDP může souviset s růstem cen i mezd ve stejném i následujícím roce

-	2015: HDP vzrostlo o 5,39 %, ceny potravin klesly o 0,56 %, a mzdy vzrostly o 2,6 % 
Následující rok (2016) ceny potravin klesly o 1,12 % a mzdy vzrostly o 3,64 % -> tady neplatí, že by vyšší růst HDP souvisel s růstem cen i mezd ve stejném i následujícím roce

-	2017: HDP vzrostlo o 5,17 %, ceny potravin o 9,98 %, mzdy o 6,17 % 
Následující rok (2018) ceny potravin vzrostly o 1,95 % a mzdy o 7,7 % -> tady se opět zdá, že růst HDP by mohl souviset s růstem cen a mezd, minimálně pokud se jedná o rok ve kterém bylo HDP vyšší.
 	
**Závěr:** z dat **nelze jednoznačně určit**, že pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem.
