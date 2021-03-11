/* QUERIES Basic */

USE stocks;

/*
Felder abfragen
Felder kombinieren
Ausgabe beschränken
*/

-- Abfrage aller Spalten der Tab
#SELECT * FROM stocks.ccc_list;

-- Begrenzung: 5 Zeilen ab 0
#SELECT * FROM stocks.ccc_list LIMIT 0,5;
#SELECT * FROM stocks.ccc_list LIMIT 5;  #vom Anfang der Tabelle ...

-- Begrenzung: 5 Zeilen ab 10
#SELECT * FROM stocks.ccc_list LIMIT 10,5;

-- Abfrage eines Feldes oder einer Feld-Kombi (rows 1-10 )
SELECT 
industry,ticker,c_name
FROM stocks.ccc_list 
LIMIT 10; 




