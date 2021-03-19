-- Zeige die Aktie mit der max. Rendite im jeweiligen Industriesektor
-- Rendite in % = Dividendenanteil pro Aktie * Anzahl der Auszahlungen/Jahr * 100 / Aktienpreis (Kurs)
-- Variante mit VIEWs

USE stocks;

-- Löschen falls vorhanden
DROP VIEW IF EXISTS renditen;
DROP VIEW IF EXISTS renditen_max;
DROP VIEW IF EXISTS top_wert_im_sektor;

-- Berechnung der jährl. Rendite aller Aktienwerte
CREATE VIEW renditen AS
SELECT 
    c_name,
    round(dividend*payouts*100/price,2) AS rendite -- Rendite p.a
FROM ccc_list;

SELECT * FROM renditen;

-- Berechnung der max. Rendite je Sektor
CREATE VIEW  renditen_max AS 
SELECT 
    sector, 
    round(max(yield),2) AS rendite -- max. Rendite im Sektor
FROM ccc_list 
GROUP BY sector;

SELECT * FROM renditen_max;

-- Ergebnis-View:
CREATE VIEW top_wert_im_sektor AS
SELECT
	t1.sector AS "Sektor",
    t1.ticker AS "SYM",
    t1.c_name AS "Firma",
	t1.price AS "Aktienkurs",
    t1.dividend AS "Dividende",
    t2.rendite AS "Rendite p.a. in %" -- Wert aus VIEW:renditen
FROM ccc_list AS t1 
-- Verknüpfen mit berechneten Renditen aus VIEW:renditen
INNER JOIN renditen AS t2 ON t1.c_name = t2.c_name
-- Verknüpfen mit max Renditen je Sektor aus VIEW:renditen_max
INNER JOIN renditen_max AS t3
ON t1.sector = t3.sector  -- wenn gleicher Wert im Feld Sektor 
AND t2.rendite = t3.rendite -- UND gleicher Wert im Feld Rendite 
ORDER BY t2.rendite DESC; -- Absteigend sortieren

SELECT * FROM top_wert_im_sektor;

