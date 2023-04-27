USE master;
DROP DATABASE IF EXISTS MusicConcert;
CREATE DATABASE MusicConcert;
USE MusicConcert;


CREATE TABLE Musicians --создаем таблицу узлов музыканты
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(50) NOT NULL
) AS NODE; 

CREATE TABLE Instrument -- создаем таблицу узлов инструменты
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(30) NOT NULL
) AS NODE; 

CREATE TABLE Concert -- создаем таблицу узлов концерты
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(100) NOT NULL,
place NVARCHAR(50) NOT NULL,
city NVARCHAR(30) NOT NULL
) AS NODE; 


CREATE TABLE Knows AS EDGE; -- связь(таблица ребер) знакомства в группе

CREATE TABLE Play  AS EDGE; -- связь музыкант играет на инструменте

CREATE TABLE PlaysIn AS EDGE; -- связь музыкант играет где-то

 --добавляем ограничеие ребер
ALTER TABLE Knows 
ADD CONSTRAINT EC_Knows CONNECTION (Musicians TO Musicians);

ALTER TABLE Play
ADD CONSTRAINT EC_Play CONNECTION (Musicians TO Instrument);

ALTER TABLE PlaysIn
ADD CONSTRAINT EC_PlaysIn CONNECTION (Musicians TO Concert);


--заполняем таблицы
INSERT INTO Musicians (id, name)
VALUES (1, N'Лиза'),
       (2, N'Катя'),
       (3, N'Макс'),
       (4, N'Олег'),
       (5, N'Саша'),
       (6, N'Глеб'),
       (7, N'Влад'),
       (8, N'Миша'),
       (9, N'Ваня'),
       (10, N'Яна'),
       (11, N'Аня'),
       (12, N'Тим'),
       (13, N'Ася'),
       (14, N'Лев');
GO
SELECT *
FROM Musicians;

INSERT INTO Instrument (id, name)
VALUES (1, N'бас-гитара'),
       (2, N'электро-гитара'),
       (3, N'клавиши'),
       (4, N'барабаны'),
       (5, N'скрипка'),
       (6, N'бонго'),
       (7, N'цимбалы'),
       (8, N'бубен'),
       (9, N'лютня'),
	   (10, N'валторна');
GO
SELECT *
FROM Instrument;

INSERT INTO Concert (id,name, place, city)
VALUES (1, N'Ночь рока: Самые громкие хиты всех времен!', N'облостная филармония', N'Брест'),
       (2, N'Электрический сад: Шоу света и звука.', N'КЗ Минск', N'Минск'),
       (3, N'Золотая эра джаза: Возвращение к корням.', N'Дворец Республики', N'Минск'),
       (4, N'Шоу на воде: Фонтаны, пиротехника и музыкальные хиты.', N'ОКЦ', N'Брест'),
       (5, N'Музыкальный марафон: 24 часа нон-стоп музыки.' , N'Драм театр', N'Гродно'),
       (6, N'Путешествие во времени: Концерт-ретроспектива легендарных групп.', N'Большой театр', N'Москва'),
       (7, N'Блюзовый бенефис: Борьба с бедностью через музыку.', N'Мариинский театр', N'Санкт-Петербург'),
       (8, N'Хип-хоп фестиваль: Лучшие исполнители жанра на одной сцене.', N'Кремль', N'Москва'),
       (9, N'Классический мир: Незабываемый концерт с участием ведущих симфонических оркестров мира.', N'Большой театр Беларуси', N'Минск'),
	   (10, N'Музыкальный эксперимент: Интерактивный концерт, где зрители влияют на звучание музыки.', N'Городской дворец культуры', N'Орша');
GO
SELECT *
FROM Concert;

INSERT INTO Knows ($from_id, $to_id)
VALUES 
((SELECT $node_id FROM Musicians WHERE id = 14), (SELECT $node_id FROM Musicians WHERE id = 2)),

 ((SELECT $node_id FROM Musicians WHERE id = 1), (SELECT $node_id FROM Musicians WHERE id = 10)),

 ((SELECT $node_id FROM Musicians WHERE id = 2), (SELECT $node_id FROM Musicians WHERE id = 11)),

 ((SELECT $node_id FROM Musicians WHERE id = 3), (SELECT $node_id FROM Musicians WHERE id = 12)),

 ((SELECT $node_id FROM Musicians WHERE id = 4), (SELECT $node_id FROM Musicians WHERE id = 13)),

 ((SELECT $node_id FROM Musicians WHERE id = 5), (SELECT $node_id FROM Musicians WHERE id = 14)),

 ((SELECT $node_id FROM Musicians WHERE id = 6), (SELECT $node_id FROM Musicians WHERE id = 1)),

 ((SELECT $node_id FROM Musicians WHERE id = 7), (SELECT $node_id FROM Musicians WHERE id = 2)),

 ((SELECT $node_id FROM Musicians WHERE id = 8), (SELECT $node_id FROM Musicians WHERE id = 4)),

 ((SELECT $node_id FROM Musicians WHERE id = 9), (SELECT $node_id FROM Musicians WHERE id = 3)),

 ((SELECT $node_id FROM Musicians WHERE id = 6), (SELECT $node_id FROM Musicians WHERE id = 5)),

 ((SELECT $node_id FROM Musicians WHERE id = 8), (SELECT $node_id FROM Musicians WHERE id = 11)),

 ((SELECT $node_id FROM Musicians WHERE id = 11), (SELECT $node_id FROM Musicians WHERE id = 3)),
 ----------------------------------------------------------------------------------------------------------
 ((SELECT $node_id FROM Musicians WHERE id = 9), (SELECT $node_id FROM Musicians WHERE id = 13)),

 ((SELECT $node_id FROM Musicians WHERE id = 5), (SELECT $node_id FROM Musicians WHERE id = 6)),

 ((SELECT $node_id FROM Musicians WHERE id = 1), (SELECT $node_id FROM Musicians WHERE id = 14)),

 ((SELECT $node_id FROM Musicians WHERE id = 1), (SELECT $node_id FROM Musicians WHERE id = 3)),

 ((SELECT $node_id FROM Musicians WHERE id = 13), (SELECT $node_id FROM Musicians WHERE id = 7)),

 ((SELECT $node_id FROM Musicians WHERE id = 7), (SELECT $node_id FROM Musicians WHERE id = 11)),

 ((SELECT $node_id FROM Musicians WHERE id = 8), (SELECT $node_id FROM Musicians WHERE id = 10)),

 ((SELECT $node_id FROM Musicians WHERE id = 9), (SELECT $node_id FROM Musicians WHERE id = 8)),

 ((SELECT $node_id FROM Musicians WHERE id = 12), (SELECT $node_id FROM Musicians WHERE id = 10)),

 ((SELECT $node_id FROM Musicians WHERE id = 11), (SELECT $node_id FROM Musicians WHERE id = 4)),

 ((SELECT $node_id FROM Musicians WHERE id = 10), (SELECT $node_id FROM Musicians WHERE id = 2)),

 ((SELECT $node_id FROM Musicians WHERE id = 2), (SELECT $node_id FROM Musicians WHERE id = 5)),

 ((SELECT $node_id FROM Musicians WHERE id = 4), (SELECT $node_id FROM Musicians WHERE id = 9)),

 ----------------------------------------------------------------------------------------------------------

 ((SELECT $node_id FROM Musicians WHERE id = 5), (SELECT $node_id FROM Musicians WHERE id = 7));


INSERT INTO Play ($from_id, $to_id)
VALUES 
((SELECT $node_id FROM Musicians WHERE ID = 1), (SELECT $node_id FROM Instrument WHERE ID = 10)),

 ((SELECT $node_id FROM Musicians WHERE ID = 2), (SELECT $node_id FROM Instrument WHERE ID = 1)),

 ((SELECT $node_id FROM Musicians WHERE ID = 3), (SELECT $node_id FROM Instrument WHERE ID = 9)),

 ((SELECT $node_id FROM Musicians WHERE ID = 4), (SELECT $node_id FROM Instrument WHERE ID = 2)),

 ((SELECT $node_id FROM Musicians WHERE ID = 5), (SELECT $node_id FROM Instrument WHERE ID = 8)),

 ((SELECT $node_id FROM Musicians WHERE ID = 6), (SELECT $node_id FROM Instrument WHERE ID = 3)),

 ((SELECT $node_id FROM Musicians WHERE ID = 7), (SELECT $node_id FROM Instrument WHERE ID = 7)),

 ((SELECT $node_id FROM Musicians WHERE ID = 8), (SELECT $node_id FROM Instrument WHERE ID = 4)), ((SELECT $node_id FROM Musicians WHERE ID = 9), (SELECT $node_id FROM Instrument WHERE ID = 6)),

 ((SELECT $node_id FROM Musicians WHERE ID = 10), (SELECT $node_id FROM Instrument WHERE ID = 5)),

 ((SELECT $node_id FROM Musicians WHERE ID = 11), (SELECT $node_id FROM Instrument WHERE ID = 1)),

 ((SELECT $node_id FROM Musicians WHERE ID = 12), (SELECT $node_id FROM Instrument WHERE ID = 3)),

 ((SELECT $node_id FROM Musicians WHERE ID = 13), (SELECT $node_id FROM Instrument WHERE ID = 3)),

 ((SELECT $node_id FROM Musicians WHERE ID = 14), (SELECT $node_id FROM Instrument WHERE ID = 1));
 
 
INSERT INTO PlaysIn ($from_id, $to_id)
VALUES 
((SELECT $node_id FROM Musicians WHERE ID = 1), (SELECT $node_id FROM Concert WHERE ID = 7)),

((SELECT $node_id FROM Musicians WHERE ID = 2), (SELECT $node_id FROM Concert WHERE ID = 1)),

((SELECT $node_id FROM Musicians WHERE ID = 2), (SELECT $node_id FROM Concert WHERE ID = 4)),

((SELECT $node_id FROM Musicians WHERE ID = 3), (SELECT $node_id FROM Concert WHERE ID = 9)),

((SELECT $node_id FROM Musicians WHERE ID = 4), (SELECT $node_id FROM Concert WHERE ID = 2)),

((SELECT $node_id FROM Musicians WHERE ID = 5), (SELECT $node_id FROM Concert WHERE ID = 8)),

((SELECT $node_id FROM Musicians WHERE ID = 6), (SELECT $node_id FROM Concert WHERE ID = 3)),

((SELECT $node_id FROM Musicians WHERE ID = 6), (SELECT $node_id FROM Concert WHERE ID = 10)),((SELECT $node_id FROM Musicians WHERE ID = 8), (SELECT $node_id FROM Concert WHERE ID = 4)),((SELECT $node_id FROM Musicians WHERE ID = 8), (SELECT $node_id FROM Concert WHERE ID = 5)),

((SELECT $node_id FROM Musicians WHERE ID = 9), (SELECT $node_id FROM Concert WHERE ID = 6)),

((SELECT $node_id FROM Musicians WHERE ID = 10), (SELECT $node_id FROM Concert WHERE ID = 5)),

((SELECT $node_id FROM Musicians WHERE ID = 11), (SELECT $node_id FROM Concert WHERE ID = 1)),

((SELECT $node_id FROM Musicians WHERE ID = 12), (SELECT $node_id FROM Concert WHERE ID = 3)),

((SELECT $node_id FROM Musicians WHERE ID = 13), (SELECT $node_id FROM Concert WHERE ID = 3)),

((SELECT $node_id FROM Musicians WHERE ID = 14), (SELECT $node_id FROM Concert WHERE ID = 1));

--5. Используя функцию MATCH, напишите не менее 5 различных запросов к построенной графовой базе данных.

--С кем знакома Лиза?
SELECT Musicians1.name, Musicians2.name AS [familiar name]
FROM Musicians AS Musicians1
 , Knows
 , Musicians AS Musicians2
WHERE MATCH(Musicians1-(Knows)->Musicians2)
 AND Musicians1.id = 1;


--С кем знакомы знакомые знакомых Лизы?
SELECT musician1.name + N' знает ' + musician2.name AS Level1
 , musician2.name + N' знает ' + musician3.name AS Level2
FROM Musicians AS musician1
 , Knows AS knows1
 , Musicians AS musician2
 , Knows AS knows2
 , Musicians AS musician3
WHERE MATCH(musician1-(knows1)->musician2-(knows2)->musician3)
 AND musician1.id = 1;

--На каких инструментах играют знакомые Лизы?SELECT musician2.name AS musician, Instrument.name AS [instrument]FROM Musicians AS musician1
 , Knows
 , Musicians AS musician2 , Instrument , PlayWHERE MATCH(musician1-(Knows)->musician2-(Play)->Instrument)
 AND musician1.id = 1;--В каких концертах учавствовали знакомые Лизы?SELECT musician2.name AS musician, Concert.name AS concertFROM Musicians AS musician1
 , Knows
 , Musicians AS musician2 , Concert , PlaysInWHERE MATCH(musician1-(Knows)->musician2-(PlaysIn)->Concert)
 AND musician1.id = 1;
--В каких концертах учавствовали знакомые знакомых Лизы?
SELECT musician3.name AS musician, Concert.name AS concert
FROM Musicians AS musician1
 , Knows AS knows1
 , Musicians AS musician2
 , Knows AS knows2
 , Musicians AS musician3
 , Concert , PlaysIn
WHERE MATCH(musician1-(knows1)->musician2-(knows2)->musician3-(PlaysIn)->Concert)
 AND musician1.id = 1;


--
SELECT musician1.name AS musician1, musician2.name AS musician2, musician3.name AS musician3, Concert.name AS concert
FROM Musicians AS musician1
 , Knows AS knows1
 , Musicians AS musician2
 , Knows AS knows2
 , Musicians AS musician3
 , Concert , PlaysIn AS play1
 , PlaysIn AS play2
WHERE MATCH(Concert<-(play1)-musician1-(knows1)->musician2-(knows2)->musician3-(play2)->Concert);


--6. Используя функцию SHORTEST_PATH, напишите не менее 2 различных запросов к построенной графовой базе данных (используйте как шаблон "+", так и "{1,n}").

SELECT musician1.name AS musician 
 , STRING_AGG(musician2.name, '->') WITHIN GROUP (GRAPH PATH) AS
Friends
FROM Musicians AS musician1
 , Knows FOR PATH AS n
 , Musicians FOR PATH AS musician2
WHERE MATCH(SHORTEST_PATH(musician1(-(n)->musician2)+))
 AND musician1.id = 1;


SELECT musician1.name AS musician 
 , STRING_AGG(musician2.name, '->') WITHIN GROUP (GRAPH PATH) AS
Friends
FROM Musicians AS musician1
 , Knows FOR PATH AS n
 , Musicians FOR PATH AS musician2
WHERE MATCH(SHORTEST_PATH(musician1(-(n)->musician2){1,2}))
 AND musician1.id = 1;


