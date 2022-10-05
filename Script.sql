

-- cvičení 1
-- řádkový komentář
/*
blokový komentář
 */

SELECT *
FROM healthcare_provider AS hp;
-- cvičení 2
SELECT name, provider_type
FROM healthcare_provider;
-- cvičení 3
SELECT name, provider_type
FROM healthcare_provider
LIMIT 30 OFFSET 600;
-- cvičení 4
SELECT *
FROM healthcare_provider
ORDER BY region_code DESC; 
-- cvičení 5 - lepší struktura, nelze prohazovat klauzule, 
SELECT 
	name,
	region_code,
	district_code
FROM healthcare_provider
ORDER BY district_code DESC 
LIMIT 500;

-- DISTINCT odstraňuje duplicity
SELECT 
	DISTINCT region_code  
FROM healthcare_provider
ORDER BY district_code DESC;
-- cvičení 6 - WHERE - filtrování řádků - zde odfiltruji pouze řádky, kde je region_code CZ10 - zapisuje se do jednoduchý úvozovek
SELECT *
FROM healthcare_provider
WHERE region_code = 'CZ010' 
-- cvičení 7 


-- cvičení nevím kolik
SELECT 
	name,
	district_code
FROM healthcare_provider
WHERE district_code IN ('CZ0201', 'CZ0202');
-- alternativa toho předchozího
SELECT 
	name,
	district_code
FROM healthcare_provider
WHERE district_code = 'CZ0201' OR district_code = 'CZ0202';


-- vytvoření tabulky z existujících dat
CREATE TABLE t_engeto_first_table AS 
	SELECT *
	FROM healthcare_provider
	WHERE region_code = 'CZ064';

-- vyhledání v tabulce
SELECT *
FROM t_engeto_first_table teft
WHERE provider_id > 60000;

-- smazání tabulky pokud existuje
DROP TABLE IF EXISTS t_engeto_first_table;

-- vytvoření absolutně nové tabulky - varchar je string plovoucí délky, char je přesně dané délky
-- zpětný apostrof exaktně definuje, že se jedná o název sloupce
CREATE TABLE IF NOT EXISTS t_pablo_escobar_cocaine_deals (
	`user_id` integer NOT NULL AUTO_INCREMENT,
	`date_start` date, 
	`date_end` date,
	`education` varchar(255),
	`job` varchar(255),
	PRIMARY KEY (user_id)
	);

SELECT *
FROM t_pablo_escobar_cocaine_deals;

-- vkládání dat do tabulky
INSERT INTO t_pablo_escobar_cocaine_deals 
VALUES (0, '2022-05-31', '2022-06-10', 'Street', 'street dealer', 300)

DROP TABLE IF EXISTS t_pablo_escobar_cocaine_deals;

-- změna existujících záznamů - změní všechny záznamy
UPDATE t_pablo_escobar_cocaine_deals
SET job = 'poskok';

UPDATE t_pablo_escobar_cocaine_deals
SET money = 300
WHERE user_id = 3;


ALTER TABLE t_pablo_escobar_cocaine_deals 
ADD COLUMN money integer;

ALTER TABLE t_pablo_escobar_cocaine_deals
DROP money;

























