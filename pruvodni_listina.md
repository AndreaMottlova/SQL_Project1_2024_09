# Projekt 1 � SQL � Datov� akademie
---

### **Zad�n� projektu**

Projekt se zam��uje na dostupnost z�kladn�ch potravin �irok� ve�ejnosti, na z�klad� srovn�n� cen potravin, pr�m�rn�ch mezd, p��padn� i vlivu HDP. 
Pro v�stup z projektu je pot�eba vytvo�it **Tabulku 1** kter� obsahuje ceny potravin a pr�m�rn� mzdy v �R a **Tabulku 2**, kter� obsahuje HDP a dal�� data o dal��ch evropsk�ch st�tech. 
Z tabulek je n�sledn� pot�eba odpov�d�t na **5 zadan�ch v�zkumn�ch ot�zek**. 

### **V�stup projektu**

**Tabulka 1**
Tabulka 1 obsahuje �daje o dostupnosti potravin na z�klad� pr�m�rn�ch cen potravin a pr�m�rn�ch mezd za ur�it� obdob�. 
Pro anal�zu jsem pou�ila tabulky czechia_payroll (tabulka o pr�m�rn�ch mzd�ch v r�zn�ch odv�tv�ch) a czechia_price (tabulka o cen�ch potravin v regionech �R) a dal�� k nim napojen� tabulky a ��seln�ky. 

*NULL hodnoty nebo odstran�n� data:*
Jeliko� je vhodn� tabulku velikostn� optimalizovat, ponechala jsme pouze hodnoty/sloupce, kter� budu pot�ebovat pro zodpov�zen� zadan�ch v�zkumn�ch ot�zek.  
-	*Regiony* � rozd�len� na regiony nen� pro v�zkum d�le�it�, ponechala jsem proto pouze hodnotu region NULL, co� p�edstavuje pr�m�r za celou �R
-	NULL hodnoty u cen potravin a n�zvu odv�tv� byly odstran�ny
-	*Calculation code* obsahoval hodnoty 100 � fyzick� a 200 p�epo�ten�. Jeliko� pr�m�rn� mzda se po��t� na p�epo�ten� pln� �vazky, ponechala jsem pouze hodnotu 200
-	*Value_type_code* obsahoval hodnoty 5958 (pr�m�rn� mzda) nebo 316 (pr�m�rn� po�et zam�stnan�ch osob) � k�d 316 jsem nikde v odpov�d�ch nepot�ebovala, z tabulky jsem ho proto odstranila
Spojen�m tabulek s cenami a pr�m�rn�mi mzdami vznikl pr�nik �daj� za *obdob� od roku 2006 do 2018*. 

**Tabulka 2**
Dodate�n� data (HDP, GINI, populace) o evropsk�ch st�tech za obdob� 2006 a� 2018.

**Ot�zka 1**
***Rostou v pr�b�hu let mzdy ve v�ech odv�tv�ch, nebo v n�kter�ch klesaj�?***

Pokud vezmeme v �vahu cel� sledovan� obdob� (porovn�n� roku 2006 a 2018), mzdy ve v�ech odv�tv�ch od roku 2006 do 2018 stoupaly, minim�ln� celkov� n�rust byl o 37,1 % v odv�tv� Pen�nictv� a poji��ovnictv�, naopak nejv�t�� n�rust od roku 2006 do 2018 byl v odv�tv� Zdravotn� a soci�ln� p��e a to o 77,8 %.
V datech byl ale zaznamen�n pokles mezd v n�kter�ch roc�ch a odv�tv�ch. **Nejv�t�� pokles, o 8,8 % byl v roce 2013 v odv�tv� Pen�nictv� a poji��ovnictv�**, kdy pr�m�rn� mzda klesla z 50 801 K� v roce 2012 na 46 317 K� v roce 2013. 

**Ot�zka 2**
***Kolik je mo�n� si koupit litr� ml�ka a kilogram� chleba za prvn� a posledn� srovnateln� obdob� v dostupn�ch datech cen a mezd?***

Ve sledovan�m obdob� byla pr�m�rn� mzda na za��tku obdob�, tedy v roku 2006, ve v��i 21165 K�, na konci obdob�, tedy v roce 2018, vystoupala pr�m�rn� mzda na 33091 K�. 
Mezi roky 2006 a 2018 do�lo k n�rustu pr�m�rn� mzdy, ale tak� ke zv��en� cen potravin. V roce 2018 je mo�n� za pr�m�rnou mzdu koupit o n�co v�c chleba (1365 kg) ne� v roce 2006 (1312 kg). U ml�ka byl rozd�l v�razn�j��, kdy v roce 2006 bylo mo�n� koupit z pr�m�rn� mzdy 1465 l, kde�to v roce 2018 a� 1669 l ml�ka. 
Z toho vypl�v�, �e **za pr�m�rnou mzdu je v roce 2018 mo�n� koupit v�t�� mno�stv� z�kladn�ch potravin**, co� m��e odr�et r�st re�ln� kupn� s�ly. 

**Ot�zka 3**
***Kter� kategorie potravin zdra�uje nejpomaleji (je u n� nejni��� procentu�ln� meziro�n� n�r�st)?***

Na z�klad� dat lze identifikovat, �e **potravinou s nejpomalej��m meziro�n�m n�rustem cen je Cukr krystalov�**, kter� vykazuje nejni��� pr�m�rn� meziro�n� n�rust procent a to o 1,92%, co� znamen�, �e jeho cena se dokonce sni�ovala. Celkov� pokles ceny �in� 23,02%. 
Krom� cukru zlev�ovali je�t� Rajsk� jablka �erven� kulat�, a to pr�m�rn� meziro�n� o 0,74%, celkov� pokles ceny byl o 8,89%. Tohle jsou dv� kategorie, kter� zdra�ovala nejpomaleji, respektive zlev�ovala, co� je v porovn�n� s ostatn�mi kategoriemi potravin v�jime�n�. 

**Ot�zka 4**
***Existuje rok, ve kter�m byl meziro�n� n�r�st cen potravin v�razn� vy��� ne� r�st mezd (v�t�� ne� 10 %)?***

Meziro�n� n�rust cen potravin i meziro�n� n�rust mezd jsem vyhodnotila procentu�ln�m n�rustem oproti p�edchoz�mu roku. Rozd�lem mezi t�mito vypo�ten�mi hodnotami jsem porovnala v�voj cen vs mezd. Nejhor�� situace nast�v�, kdy� r�st cen potravin je vysok�, ale r�st mezd je n�zk�. 
Z dat vypl�v�, �e **ani v jednom ze sledovan�ch rok� nebyl meziro�n� n�rust cen potravin vy��� ne� 10 % oproti r�stu mezd**. 
Nejhor�� situace byla v roce 2013, kdy pr�m�rn� ceny potravin vzrostli o 5,55 % a pr�m�rn� mzdy klesly o 1,56 % co� znamen�, �e r�st potravin byl vy��� o 7,11 % oproti r�stu mezd. 

**Ot�zka 5**
***M� v��ka HDP vliv na zm�ny ve mzd�ch a cen�ch potravin? Neboli, pokud HDP vzroste v�razn�ji v jednom roce, projev� se to na cen�ch potravin �i mzd�ch ve stejn�m nebo n�sleduj�c�m roce v�razn�j��m r�stem?***

Z dat je patrn�, �e nejv�razn�j�� n�rust HDP (nad 5%) byl v roc�ch 2007, 2015 a 2017. 
-	2007: HDP vzrostlo o 5,57 %, ceny potravin o 6,35 %, mzdy o 6,88 % 
N�sleduj�c� rok (2008) ceny potravin vzrostli o 6,41 % a mzdy o 7,69 % -> zd� se, �e vy��� r�st HDP m��e souviset s r�stem cen i mezd ve stejn�m i n�sleduj�c�m roce

-	2015: HDP vzrostlo o 5,39 %, ceny potravin klesly o 0,56 %, a mzdy vzrostly o 2,6 % 
N�sleduj�c� rok (2016) ceny potravin klesly o 1,12 % a mzdy vzrostly o 3,64 % -> tady neplat�, �e by vy��� r�st HDP souvisel s r�stem cen i mezd ve stejn�m i n�sleduj�c�m roce

-	2017: HDP vzrostlo o 5,17 %, ceny potravin o 9,98 %, mzdy o 6,17 % 
N�sleduj�c� rok (2018) ceny potravin vzrostli o 1,95 % a mzdy o 7,7 % -> 
-> tady se op�t zd�, �e r�st HDP by mohl souviset s r�stem cen a mezd, minim�ln� pokud se jedn� o rok ve kter�m bylo HDP vy���. 
**Z�v�r:** z dat **nelze jednozna�n� ur�it**, �e pokud HDP vzroste v�razn�ji v jednom roce, projev� se to na cen�ch potravin �i mzd�ch ve stejn�m nebo n�sleduj�c�m roce v�razn�j��m r�stem.