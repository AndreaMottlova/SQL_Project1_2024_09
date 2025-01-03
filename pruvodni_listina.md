# Projekt 1 – SQL – Datová akademie
---

### **Zadání projektu**

Projekt se zamìøuje na dostupnost základních potravin široké veøejnosti, na základì srovnání cen potravin, prùmìrných mezd, pøípadnì i vlivu HDP. 
Pro výstup z projektu je potøeba vytvoøit **Tabulku 1** která obsahuje ceny potravin a prùmìrné mzdy v ÈR a **Tabulku 2**, která obsahuje HDP a další data o dalších evropských státech. 
Z tabulek je následnì potøeba odpovìdìt na **5 zadaných výzkumných otázek**. 

### **Výstup projektu**

**Tabulka 1**
Tabulka 1 obsahuje údaje o dostupnosti potravin na základì prùmìrných cen potravin a prùmìrných mezd za urèité období. 
Pro analýzu jsem použila tabulky czechia_payroll (tabulka o prùmìrných mzdách v rùzných odvìtvích) a czechia_price (tabulka o cenách potravin v regionech ÈR) a další k nim napojené tabulky a èíselníky. 

*NULL hodnoty nebo odstranìné data:*
Jelikož je vhodné tabulku velikostnì optimalizovat, ponechala jsme pouze hodnoty/sloupce, které budu potøebovat pro zodpovìzení zadaných výzkumných otázek.  
-	*Regiony* – rozdìlení na regiony není pro výzkum dùležité, ponechala jsem proto pouze hodnotu region NULL, což pøedstavuje prùmìr za celou ÈR
-	NULL hodnoty u cen potravin a názvu odvìtví byly odstranìny
-	*Calculation code* obsahoval hodnoty 100 – fyzický a 200 pøepoètený. Jelikož prùmìrná mzda se poèítá na pøepoètené plné úvazky, ponechala jsem pouze hodnotu 200
-	*Value_type_code* obsahoval hodnoty 5958 (prùmìrná mzda) nebo 316 (prùmìrný poèet zamìstnaných osob) – kód 316 jsem nikde v odpovìdích nepotøebovala, z tabulky jsem ho proto odstranila
Spojením tabulek s cenami a prùmìrnými mzdami vznikl prùnik údajù za *období od roku 2006 do 2018*. 

**Tabulka 2**
Dodateèná data (HDP, GINI, populace) o evropských státech za období 2006 až 2018.

**Otázka 1**
***Rostou v prùbìhu let mzdy ve všech odvìtvích, nebo v nìkterých klesají?***

Pokud vezmeme v úvahu celé sledované období (porovnání roku 2006 a 2018), mzdy ve všech odvìtvích od roku 2006 do 2018 stoupaly, minimální celkový nárust byl o 37,1 % v odvìtví Penìžnictví a pojišovnictví, naopak nejvìtší nárust od roku 2006 do 2018 byl v odvìtví Zdravotní a sociální péèe a to o 77,8 %.
V datech byl ale zaznamenán pokles mezd v nìkterých rocích a odvìtvích. **Nejvìtší pokles, o 8,8 % byl v roce 2013 v odvìtví Penìžnictví a pojišovnictví**, kdy prùmìrná mzda klesla z 50 801 Kè v roce 2012 na 46 317 Kè v roce 2013. 

**Otázka 2**
***Kolik je možné si koupit litrù mléka a kilogramù chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?***

Ve sledovaném období byla prùmìrná mzda na zaèátku období, tedy v roku 2006, ve výši 21165 Kè, na konci období, tedy v roce 2018, vystoupala prùmìrná mzda na 33091 Kè. 
Mezi roky 2006 a 2018 došlo k nárustu prùmìrné mzdy, ale také ke zvýšení cen potravin. V roce 2018 je možné za prùmìrnou mzdu koupit o nìco víc chleba (1365 kg) než v roce 2006 (1312 kg). U mlíka byl rozdíl výraznìjší, kdy v roce 2006 bylo možné koupit z prùmìrné mzdy 1465 l, kdežto v roce 2018 až 1669 l mléka. 
Z toho vyplývá, že **za prùmìrnou mzdu je v roce 2018 možné koupit vìtší množství základních potravin**, což mùže odrážet rùst reálné kupní síly. 

**Otázka 3**
***Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší procentuální meziroèní nárùst)?***

Na základì dat lze identifikovat, že **potravinou s nejpomalejším meziroèním nárustem cen je Cukr krystalový**, který vykazuje nejnižší prùmìrný meziroèní nárust procent a to o 1,92%, což znamená, že jeho cena se dokonce snižovala. Celkový pokles ceny èiní 23,02%. 
Kromì cukru zlevòovali ještì Rajská jablka èervená kulatá, a to prùmìrnì meziroènì o 0,74%, celkový pokles ceny byl o 8,89%. Tohle jsou dvì kategorie, která zdražovala nejpomaleji, respektive zlevòovala, což je v porovnání s ostatními kategoriemi potravin výjimeèné. 

**Otázka 4**
***Existuje rok, ve kterém byl meziroèní nárùst cen potravin výraznì vyšší než rùst mezd (vìtší než 10 %)?***

Meziroèní nárust cen potravin i meziroèní nárust mezd jsem vyhodnotila procentuálním nárustem oproti pøedchozímu roku. Rozdílem mezi tìmito vypoètenými hodnotami jsem porovnala vývoj cen vs mezd. Nejhorší situace nastává, když rùst cen potravin je vysoký, ale rùst mezd je nízký. 
Z dat vyplývá, že **ani v jednom ze sledovaných rokù nebyl meziroèní nárust cen potravin vyšší než 10 % oproti rùstu mezd**. 
Nejhorší situace byla v roce 2013, kdy prùmìrné ceny potravin vzrostli o 5,55 % a prùmìrné mzdy klesly o 1,56 % což znamená, že rùst potravin byl vyšší o 7,11 % oproti rùstu mezd. 

**Otázka 5**
***Má výška HDP vliv na zmìny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výraznìji v jednom roce, projeví se to na cenách potravin èi mzdách ve stejném nebo následujícím roce výraznìjším rùstem?***

Z dat je patrné, že nejvýraznìjší nárust HDP (nad 5%) byl v rocích 2007, 2015 a 2017. 
-	2007: HDP vzrostlo o 5,57 %, ceny potravin o 6,35 %, mzdy o 6,88 % 
Následující rok (2008) ceny potravin vzrostli o 6,41 % a mzdy o 7,69 % -> zdá se, že vyšší rùst HDP mùže souviset s rùstem cen i mezd ve stejném i následujícím roce

-	2015: HDP vzrostlo o 5,39 %, ceny potravin klesly o 0,56 %, a mzdy vzrostly o 2,6 % 
Následující rok (2016) ceny potravin klesly o 1,12 % a mzdy vzrostly o 3,64 % -> tady neplatí, že by vyšší rùst HDP souvisel s rùstem cen i mezd ve stejném i následujícím roce

-	2017: HDP vzrostlo o 5,17 %, ceny potravin o 9,98 %, mzdy o 6,17 % 
Následující rok (2018) ceny potravin vzrostli o 1,95 % a mzdy o 7,7 % -> 
-> tady se opìt zdá, že rùst HDP by mohl souviset s rùstem cen a mezd, minimálnì pokud se jedná o rok ve kterém bylo HDP vyšší. 
**Závìr:** z dat **nelze jednoznaènì urèit**, že pokud HDP vzroste výraznìji v jednom roce, projeví se to na cenách potravin èi mzdách ve stejném nebo následujícím roce výraznìjším rùstem.