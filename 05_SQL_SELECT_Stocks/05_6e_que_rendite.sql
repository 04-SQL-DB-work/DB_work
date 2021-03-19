/**
 Berechnungsbeispiel Rendite 
 mit INNER JOIN
 @Author R. Dannhaus
*/

USE stocks;
DROP TABLE IF EXISTS tmp;

-- Zeige die Aktie mit der max. Rendite im jeweiligen Industriesektor
-- Rendite = Dividendenanteil pro Aktie * Anzahl der Auszahlungen/Jahr * 100 / Aktienpreis (Kurs)

CREATE TABLE tmp
(
	id INT(11) NOT NULL PRIMARY KEY,
	c_name VARCHAR(100) NOT NULL,
	ticker VARCHAR(100) NOT NULL,
	sector VARCHAR(100) NOT NULL,
	industry VARCHAR(100) NOT NULL,
	price DECIMAL(6,2) NOT NULL,
	dividend DECIMAL(6,4) NOT NULL,
	payouts INT(11) NOT NULL,
 	rendite DECIMAL(6,2) NOT NULL
 );
 
INSERT INTO tmp
SELECT 
	id, 
    c_name, 
    ticker, 
    sector, 
    industry, 
    price, 
    dividend, 
    payouts, 
    round(dividend*payouts*100/price,2) AS rendite
FROM ccc_list
;

-- Teilabschnitt / Beispiel
SELECT * FROM tmp LIMIT 10;

SELECT
	c_name AS "Firma",
	ticker AS "SYM",
	t1.sector AS "Industriesektor",
	price AS "Preis in US$",
	dividend AS "Dividende in US$",
	payouts AS "Auszahlungen",
	dividend*payouts AS "Dividende p.a. in US$",
	rendite AS "Rendite in %"
FROM tmp t1
INNER JOIN
    (SELECT 
		sector, MAX(rendite) AS "MaxRendite"
    FROM tmp
    GROUP BY sector) t2 
ON t1.sector = t2.sector 
AND t1.Rendite = t2.MaxRendite
ORDER BY t1.Rendite DESC
;

