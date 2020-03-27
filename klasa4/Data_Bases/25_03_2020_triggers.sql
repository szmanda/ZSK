-- TRIGGERS
-- BEFORE INSERT blokuje użytkownika przy dodawaniu rekordu, uruchamia trigger, a następnie po zakończeniu jego działania odblokowuje użytkownika (związane z transakcjami). JEśli nastąpi błąd żadna operacja nie jest wykonywana
-- AFTER INSERT najpierw wykonuje okerację użytkonika, a dopiero po jej zakończeniu uruchamia trigger.

-- 1--------------------------------------------------
-- Stwórz wyzwalacz, przy użyciu którego nowi uczniowie szkoły średniej będą automatycznie nośić nazwę (name) - 'Friendly' tak jak wszyscy inni w ich roczniku. Zatem, po uruchomieniu wyzwalacza, otrzymamy ('Freindly', A) w tabeli Like dla każdego ucznia szkoły średniej A w tym samym roczniku
-- co 'Freindly'

USE highschool;

DElIMITER $$
DROP TRIGGER IF EXISTS highschool.highscooler_AFTER_INSERT$$
CREATE TRIGGER highschool.highscooler_AFTER_INSERT
AFTER INSERT
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

delimiter $$
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

SHOW triggers;

-- 3--------------------------------------------------
-- Stwórz jeden lub więcej wyzwalaczy do zarządzania symertią w relacjach między przyjaciółmi (Freind). Zatem, jeżeli (A,B) zostanie skasowany z  'Friend', to wtedy (B,A) powinno zostać także wykasowane.
-- Jeżeli (A,B) zostanie wstawione w 'Friend', wtedy (B,A) powinno zostać wstawione także. Nie należy przejmować się aktualizacją tabeli Friend.

DELIMITER $$
DROP TRIGGER IF EXISTS highschool.friend_AFTER_INSERT_1 $$
CREATE DEFINER = CURRENT_USER TRIGGER `highschool`.`friend_AFTER_INSERT_1` AFTER INSERT ON `friend` FOR EACH ROW
BEGIN
	INSERT INTO friend VALUES (new.id2,new.id1);
END $$
DELIMITER ;


-- 4--------------------------------------------------
-- Stwórz wyzwalacz, który automatycznie kasuje uczniów - absolwentów, gdy skończą szkołę , tj., gdy ich rocznik zostanie zaktualizowanay i przekroczy 12.

USE highschool;

DELIMITER $$
DROP TRIGGER IF EXISTS highschool.highschooler_AFTER_UPDATE_1 $$
CREATE DEFINER = CURRENT_USER TRIGGER `highschool`.`highschool.highschooler_AFTER_UPDATE_1` AFTER INSERT ON `highschooler` FOR EACH ROW
BEGIN
	IF new.grade>12 THEN
		DELETE FROM highschooler WHERE id=new.id;
    END IF;
END $$
DELIMITER ;


-- 5--------------------------------------------------
-- Stwórz wyzwalacz, który automatycznie kasuje uczniów - absolwentów, gdy skończą szkołę, tj., gdy ich rocznik zostanie zaktualizowanay i przekroczy 12.  (zad 4).
-- Ponadto, stwórz wyzwalacz , który w momencie przeniesienia ucznia na wyższy rocznik przenosi także jego/jej kolegów.

