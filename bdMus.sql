USE master;
DROP DATABASE IF EXISTS MusicConcert;
CREATE DATABASE MusicConcert;
USE MusicConcert;


CREATE TABLE Musicians --������� ������� ����� ���������
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(50) NOT NULL
) AS NODE; 

CREATE TABLE Instrument -- ������� ������� ����� �����������
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(30) NOT NULL
) AS NODE; 

CREATE TABLE Concert -- ������� ������� ����� ��������
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(100) NOT NULL,
place NVARCHAR(50) NOT NULL,
city NVARCHAR(30) NOT NULL
) AS NODE; 


CREATE TABLE Knows AS EDGE; -- �����(������� �����) ���������� � ������

CREATE TABLE Play  AS EDGE; -- ����� �������� ������ �� �����������

CREATE TABLE PlaysIn AS EDGE; -- ����� �������� ������ ���-��

 --��������� ���������� �����
ALTER TABLE Knows 
ADD CONSTRAINT EC_Knows CONNECTION (Musicians TO Musicians);

ALTER TABLE Play
ADD CONSTRAINT EC_Play CONNECTION (Musicians TO Instrument);

ALTER TABLE PlaysIn
ADD CONSTRAINT EC_PlaysIn CONNECTION (Musicians TO Concert);


--��������� �������
INSERT INTO Musicians (id, name)
VALUES (1, N'����'),
       (2, N'����'),
       (3, N'����'),
       (4, N'����'),
       (5, N'����'),
       (6, N'����'),
       (7, N'����'),
       (8, N'����'),
       (9, N'����'),
       (10, N'���'),
       (11, N'���'),
       (12, N'���'),
       (13, N'���'),
       (14, N'���');
GO
SELECT *
FROM Musicians;

INSERT INTO Instrument (id, name)
VALUES (1, N'���-������'),
       (2, N'�������-������'),
       (3, N'�������'),
       (4, N'��������'),
       (5, N'�������'),
       (6, N'�����'),
       (7, N'�������'),
       (8, N'�����'),
       (9, N'�����'),
	   (10, N'��������');
GO
SELECT *
FROM Instrument;

INSERT INTO Concert (id,name, place, city)
VALUES (1, N'���� ����: ����� ������� ���� ���� ������!', N'��������� ����������', N'�����'),
       (2, N'������������� ���: ��� ����� � �����.', N'�� �����', N'�����'),
       (3, N'������� ��� �����: ����������� � ������.', N'������ ����������', N'�����'),
       (4, N'��� �� ����: �������, ����������� � ����������� ����.', N'���', N'�����'),
       (5, N'����������� �������: 24 ���� ���-���� ������.' , N'���� �����', N'������'),
       (6, N'����������� �� �������: �������-������������� ����������� �����.', N'������� �����', N'������'),
       (7, N'�������� �������: ������ � ��������� ����� ������.', N'���������� �����', N'�����-���������'),
       (8, N'���-��� ���������: ������ ����������� ����� �� ����� �����.', N'������', N'������'),
       (9, N'������������ ���: ������������ ������� � �������� ������� ������������� ��������� ����.', N'������� ����� ��������', N'�����'),
	   (10, N'����������� �����������: ������������� �������, ��� ������� ������ �� �������� ������.', N'��������� ������ ��������', N'����');
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

--5. ��������� ������� MATCH, �������� �� ����� 5 ��������� �������� � ����������� �������� ���� ������.

--� ��� ������� ����?
SELECT Musicians1.name, Musicians2.name AS [familiar name]
FROM Musicians AS Musicians1
 , Knows
 , Musicians AS Musicians2
WHERE MATCH(Musicians1-(Knows)->Musicians2)
 AND Musicians1.id = 1;


--� ��� ������� �������� �������� ����?
SELECT musician1.name + N' ����� ' + musician2.name AS Level1
 , musician2.name + N' ����� ' + musician3.name AS Level2
FROM Musicians AS musician1
 , Knows AS knows1
 , Musicians AS musician2
 , Knows AS knows2
 , Musicians AS musician3
WHERE MATCH(musician1-(knows1)->musician2-(knows2)->musician3)
 AND musician1.id = 1;

--�� ����� ������������ ������ �������� ����?SELECT musician2.name AS musician, Instrument.name AS [instrument]FROM Musicians AS musician1
 , Knows
 , Musicians AS musician2 , Instrument , PlayWHERE MATCH(musician1-(Knows)->musician2-(Play)->Instrument)
 AND musician1.id = 1;--� ����� ��������� ������������ �������� ����?SELECT musician2.name AS musician, Concert.name AS concertFROM Musicians AS musician1
 , Knows
 , Musicians AS musician2 , Concert , PlaysInWHERE MATCH(musician1-(Knows)->musician2-(PlaysIn)->Concert)
 AND musician1.id = 1;
--� ����� ��������� ������������ �������� �������� ����?
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


--6. ��������� ������� SHORTEST_PATH, �������� �� ����� 2 ��������� �������� � ����������� �������� ���� ������ (����������� ��� ������ "+", ��� � "{1,n}").

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


