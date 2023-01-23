CREATE DATABASE got;

/* Após a criação do banco de dados, as tabelas foram importadas no Workbench. */

USE got;

/* Exclusão das colunas desnecessárias nas tabelas para obter as respostas das perguntas. */
ALTER TABLE got_episodes_v4 DROP COLUMN Release_date;
ALTER TABLE got_episodes_v4 DROP COLUMN votes;
ALTER TABLE got_episodes_v4 DROP COLUMN Summary;
ALTER TABLE got_episodes_v4 DROP COLUMN Writer_1;
ALTER TABLE got_episodes_v4 DROP COLUMN Writer_2;
ALTER TABLE got_episodes_v4 DROP COLUMN Writer_3;
ALTER TABLE got_episodes_v4 DROP COLUMN Star_1;
ALTER TABLE got_episodes_v4 DROP COLUMN Star_2;
ALTER TABLE got_episodes_v4 DROP COLUMN Star_3;
ALTER TABLE got_episodes_v4 DROP COLUMN US_Viewers;
ALTER TABLE got_episodes_v4 DROP COLUMN Budget_estimate;
ALTER TABLE got_episodes_v4 DROP COLUMN Users_reviews;
ALTER TABLE got_episodes_v4 DROP COLUMN Critics_reviews;
ALTER TABLE characters_v4 DROP COLUMN First_appearance;
ALTER TABLE characters_v4 DROP COLUMN Last_appearance;

/* Perguntas e códigos feitos para obter os resultados. */

/* 1 - Quais personagens que mais tiveram aparições na série?*/

SELECT * FROM characters_v4;
SELECT `Character`, episodes_appeared FROM characters_v4 
ORDER BY episodes_appeared desc LIMIT 5;

/* 2 - Quantos episódios têm em cada temporada?*/

SELECT * FROM got_episodes_v4;
SELECT Season, COUNT(Episode) FROM got_episodes_v4
GROUP BY Season 
ORDER BY COUNT(Episode)
DESC LIMIT 8;

/* 3 - Quais são as 5 regiões com mais casas?*/

SELECT * FROM houses_v1;
SELECT COUNT(House_name), Region FROM houses_v1
GROUP BY Region 
ORDER BY COUNT(House_name)
DESC LIMIT 5;

/* 4 - Quem dirigiu mais episódios?*/

SELECT * FROM got_episodes_v4;
SELECT DISTINCT Director, COUNT(Director) Episode FROM got_episodes_v4
GROUP BY Director
ORDER BY COUNT(Director)
DESC LIMIT 5;

/* 5 - Qual a maior duração de episódio que têm em cada temporada?*/

SELECT * FROM got_episodes_v4;
SELECT Season, MAX(Duration) FROM got_episodes_v4
GROUP BY Season
ASC;

/* 6 - Quais os episódios com piores avaliações*/

SELECT * FROM got_episodes_v4;
SELECT Season, Episode, Title, Rating FROM got_episodes_v4
ORDER BY Rating 
ASC LIMIT 5;