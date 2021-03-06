-- patrz. 25_03_2020.sql
-- TRIGGERS
-- BEFORE INSERT blokuje użytkownika przy dodawaniu rekordu, uruchamia trigger, a następnie po zakończeniu jego działania odblokowuje użytkownika (związane z transakcjami). JEśli nastąpi błąd żadna operacja nie jest wykonywana
-- AFTER INSERT najpierw wykonuje okerację użytkonika, a dopiero po jej zakończeniu uruchamia trigger.

-- 1--------------------------------------------------
-- Stwórz wyzwalacz, przy użyciu którego nowi uczniowie szkoły średniej będą automatycznie nośić nazwę (name) - 'Friendly' tak jak wszyscy inni w ich roczniku. Zatem, po uruchomieniu wyzwalacza, otrzymamy ('Freindly', A) w tabeli Like dla każdego ucznia szkoły średniej A w tym samym roczniku
-- co 'Freindly'

DElIMITER $$
DROP TRIGGER IF EXISTS highschool.highscooler_AFTER_INSERT$$
CREATE TRIGGER highschool.highscooler_AFTER_INSERT
BEFORE INSERT
ON highschooler
FOR EACH ROW
BEGIN
IF new.name='Friendly' THEN
INSERT INTO Likes(SELECT new.id, h.id FROM highschooler h WHERE new.grade = h.grade AND NOT new.id-h.id);
END IF;
END $$
DELIMITER ;

-- 2--------------------------------------------------
-- Stwórz jeden lub więcej wyzwalaczy do zarządzania atrybutem rocznika nowych uczniów szkoły średniej. Wytycznie wyzwalacza - jeżeli wartość będzie niższa niż 9 lub większa niż 12, zmieniaj wartość na NULL. Z drugiej strony, jeżeli występuje wartość NULL dla rocznika, zmień ją na 9.
-- wywala linia z WHEN()
delimiter $$
DROP TRIGGER IF EXISTS aktualizujGrade $$
DROP TRIGGER IF EXISTS highschool.highschooler_AFTER_INSERT_2 $$
CREATE TRIGGER highschool.highschooler_AFTER_INSERT_2
AFTER INSERT
ON highschooler FOR EACH ROW
BEGIN
	IF new.grade > 12 OR new.grade < 9 THEN
		UPDATE highschooler SET grade=NULL WHERE id=new.id;
	ELSEIF new.grade=NULL THEN
		UPDATE highschooler SET grade=9 WHERE id=new.id;
	END IF;
END $$
delimiter ;

-- 3--------------------------------------------------
-- Stwórz jeden lub więcej wyzwalaczy do zarządzania symertią w relacjach między przyjaciółmi (Freind). Zatem, jeżeli (A,B) zostanie skasowany z  'Friend', to wtedy (B,A) powinno zostać także wykasowane.
-- Jeżeli (A,B) zostanie wstawione w 'Friend', wtedy (B,A) powinno zostać wstawione także. Nie należy przejmować się aktualizacją tabeli Friend.

-- error przy insertowaniu danych?:
-- #1442 - Can't update table 'friend' in stored function/trigger because it is already used by statement which invoked this stored function/trigger
delimiter //
CREATE OR REPLACE TRIGGER symetriaDelete
AFTER DELETE
ON `friend` FOR EACH ROW
BEGIN
  DELETE FROM friend WHERE ID1=old.ID2 AND ID2=old.ID1;
END;//

CREATE OR REPLACE TRIGGER symetriaInsert
AFTER INSERT
ON `friend` FOR EACH ROW
BEGIN
  INSERT INTO `friend` (`ID1`,`ID2`)
  VALUES (NEW.ID2, NEW.ID1);
END;//
delimiter ;
INSERT INTO friend VALUES(1510,1911);

SELECT * FROM friend WHERE ID1=1510 OR ID2=1510;
INSERT INTO friend VALUES(1510,1911);


-- 4--------------------------------------------------
-- Stwórz wyzwalacz, który automatycznie kasuje uczniów - absolwentów, gdy skończą szkołę , tj., gdy ich rocznik zostanie zaktualizowanay i przekroczy 12.
delimiter //
CREATE OR REPLACE TRIGGER absolwenci
AFTER UPDATE
ON `highschooler` FOR EACH ROW
BEGIN
  DELETE FROM highschooler WHERE grade>12;
END;//
delimiter ;


-- 5--------------------------------------------------
-- Stwórz wyzwalacz, który automatycznie kasuje uczniów - absolwentów, gdy skończą szkołę, tj., gdy ich rocznik zostanie zaktualizowanay i przekroczy 12.  (zad 4).
-- Ponadto, stwórz wyzwalacz , który w momencie przeniesienia ucznia na wyższy rocznik przenosi także jego/jej kolegów.
delimiter //
CREATE OR REPLACE TRIGGER absolwenci
BEFORE UPDATE
ON `highschooler` FOR EACH ROW
BEGIN
  UPDATE `highschooler` SET grade = grade+1
  WHERE ID IN(SELECT ID1 friend WHERE ID2 = old.ID)
  -- dla poprawności danych:
    OR ID IN(SELECT ID2 friend WHERE ID1 = old.ID);
  DELETE FROM highschooler WHERE grade>12;
END;//
delimiter ;


-- 6--------------------------------------------------
-- Stwórz wyzwalacz z następującym działaniem: Jeżeli A lubi B ale zostaje zaktualizowany do A lubiącego C, a B i C są przyjaciółmi 'friends', to wtedy B i C przestają być przyjaciółmi 'friends'.
-- Stwórz wyzwalacz: Załóżmy że A lubił B, natomiast ten rekord został zmieniony na A lubi C. Z tego wynika że  Należy usunąć B przyjaźni się z C czyli poprzednie ID2 przyjaźni się z nowym  ID2
-- Nie zapomnij kasować przyjaźni i upewnij się, że wyzwalacz tylko uruchomi się gdy lubiana "liked" (ID2) osoba zostaje zmieniona, ale lubienie "liking" (ID1) osoby nie zostaje zmienione.

delimiter //
CREATE OR REPLACE TRIGGER zmiana
BEFORE UPDATE
ON `likes` FOR EACH ROW
BEGIN
  IF (new.ID2 IS NOT NULL) THEN
    DELETE FROM `friend`
    WHERE ID1=old.ID2 AND ID2= new.ID2;
  END IF;
END;//
delimiter ;
