
USE work;  #Focus auf DB
DROP TABLE IF EXISTS cats; #Tab löschen, falls vorhanden

CREATE TABLE IF NOT EXISTS cats # Tab. anlegen
(
	id INT NOT NULL PRIMARY KEY,
    cat_name VARCHAR(20) NOT NULL,
	fur_color VARCHAR(20) NOT NULL,
	cat_age INT NOT NULL
);

DESC cats;

/* Parsen & Einlesen der Daten */
LOAD DATA LOCAL INFILE "C:/Users/micro/Desktop/DB_work/04_SQL_DataImport/data/cats_export.csv"
INTO TABLE cats
FIELDS TERMINATED BY ";"
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

SELECT * FROM cats;



