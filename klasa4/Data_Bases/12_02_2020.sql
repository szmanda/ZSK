USE olejki_mysql;

INSERT INTO Olejki (IDOlejku, NazwaOlejku)
VALUES (52,'Truskawka');

INSERT INTO Olejki (IDOlejku, NazwaOlejku)
VALUES (53,'Malina'), (54,'Estragon');

UPDATE Olejki
SET NazwaLacinska = "Nieznana"
WHERE NazwaLacinska IS NULL;

UPDATE Olejkiceny
SET Cena=cena+1
WHERE IDOlejku BETWEEN 5 AND 10;

UPDATE Olejkiceny
SET Cena=cena*1.1
WHERE IDOLejku IN (
	SELECT IDOlejku
    FROM Olejki
    WHERE NazwaOlejku LIKE 'C%'
);

UPDATE Olejkiceny
SET cena=cena*0.7
WHERE Cena > (SELECT AVG(Cena));



select iloscopakowan
INTO @ilosc 
from olejkiilosci
where idolejku =
(select IdOlejku from olejki where NazwaOlejku = 'Bazylia');

update olejkiilosci
set iloscopakowan = @ilosc
where idolejku =
(select idolejku from olejki where NazwaOlejku = 'Majeranek');



UPDATE olejkiilosci
SET iloscopakowan = iloscopakowan + 100
WHERE idolejku IN
(SELECT idolejku
FROM olejki
WHERE idtypurosliny = 
(SELECT idtypurosliny
FROM roslinytypy
WHERE typrosliny = 'Drzewo'));

UPDATE Olejkiceny
SET cena=cena*1.65
WHERE idolejku IN
(SELECT idolejku
FROM olejki
WHERE idskladnikarosliny = 
(SELECT idskladnikarosliny
FROM roslinyskladniki
WHERE skladnikrosliny = 'Kwiaty'));

UPDATE olejkiilosci
SET iloscopakowan = iloscopakowan*1.1
WHERE idolejku = (
	SELECT idolejku
    WHERE iloscopakowan < 35
);


DELETE FROM olejki
WHERE NazwaLacinska = 'Nieznana';

DELETE FROM olejkiostrzezenia
WHERE IDOlejku = (
	SELECT IDOlejku FROM Olejki where NazwaOlejku = 'Cynamon'
);

DELETE FROM olejkizapachy
WHERE IDZapachu = (
	SELECT IDZapachu FROM Zapachy where Zapach = "Ostry"
);

DELETE FROM olejki
WHERE idolejku IN (
	SELECT idolejku
    FROM olejkiostrzezenia
    GROUP BY idolejku
    HAVING COUNT(IDOstrzezenia) > 2
);

CREATE table a(
b varchar(4) not null primary key
);
INSERT INTO a VALUES('qwe');
SELECT * FROM a;
DELETE FROM a;
SELECT * FROM a;
DROP TABLE a;
