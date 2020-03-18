-- TRIGGERS
-- 1--------------------------------------------------
-- Stwórz wyzwalacz, przy użyciu którego nowi uczniowie szkoły średniej będą automatycznie nośić nazwę (name) - 'Friendly' tak jak wszyscy inni w ich roczniku. Zatem, po uruchomieniu wyzwalacza, otrzymamy ('Freindly', A) w tabeli Like dla każdego ucznia szkoły średniej A w tym samym roczniku
-- co 'Freindly'
delimiter //
CREATE OR REPLACE TRIGGER dodaj
BEFORE INSERT
ON highschooler FOR EACH ROW
BEGIN
SET NEW.name = 'Friendly';
END;//
delimiter ;
ALTER TRIGGER friend.dodaj ENABLE;

-- 2--------------------------------------------------
-- Stwórz jeden lub więcej wyzwalaczy do zarządzania atrybutem rocznika nowych uczniów szkoły średniej. Wytycznie wyzwalacza - jeżeli wartość będzie niższa niż 9 lub większa niż 12, zmieniaj wartość na NULL. Z drugiej strony, jeżeli występuje wartość NULL dla rocznika, zmień ją na 9.
-- wywala linia z WHEN()
delimiter //
CREATE OR REPLACE TRIGGER aktualizujGrade
BEFORE UPDATE
ON highschooler FOR EACH ROW
BEGIN
  IF(new.grade>12 OR new.grade<9) THEN
    SET NEW.grade=NULL;
  ELSEIF(new.grade=NULL) THEN
    SET NEW.grade=9;
  END IF;
END;//
delimiter ;

-- 3--------------------------------------------------
-- Stwórz jeden lub więcej wyzwalaczy do zarządzania symertią w relacjach między przyjaciółmi (Freind). Zatem, jeżeli (A,B) zostanie skasowany z  'Friend', to wtedy (B,A) powinno zostać także wykasowane.
-- Jeżeli (A,B) zostanie wstawione w 'Friend', wtedy (B,A) powinno zostać wstawione także. Nie należy przejmować się aktualizacją tabeli Friend.

-- error przy insertowaniu danych:
-- #1442 - Can't update table 'friend' in stored function/trigger because it is already used by statement which invoked this stored function/trigger
delimiter //
CREATE OR REPLACE TRIGGER symetriaInsert
AFTER INSERT
ON `friend` FOR EACH ROW
BEGIN
  INSERT INTO `friend` (`ID1`,`ID2`)
  VALUES (NEW.ID2,NEW.ID1);
END;//
delimiter ;
INSERT INTO friend VALUES(1510,1911);

SELECT * FROM friend WHERE ID1=1510 OR ID2=1510;
INSERT INTO friend VALUES(1510,1911);


-- 4--------------------------------------------------
-- Stwórz wyzwalacz, który automatycznie kasuje uczniów - absolwentów, gdy skończą szkołę , tj., gdy ich rocznik zostanie zaktualizowanay i przekroczy 12.


-- 5--------------------------------------------------
-- Stwórz wyzwalacz, który automatycznie kasuje uczniów - absolwentów, gdy skończą szkołę, tj., gdy ich rocznik zostanie zaktualizowanay i przekroczy 12.  (zad 4).
-- Ponadto, stwórz wyzwalacz , który w momencie przeniesienia ucznia na wyższy rocznik przenosi także jego/jej kolegów.


-- 6--------------------------------------------------
-- Stwóż wyzwalacz z następującym działaniem: Jeżeli A lubi B ale zostaje zaktualizowany do A lubiącego C, a B i C są przyjaciółmi 'friends', to wtedy B i C przestają być przyjaciółmi 'friends'.
-- Nie zapomnij kasować przyjaźni i upewnij się, że wyzwalacz tylko uruchomi się gdy lubiana "liked" (ID2) osoba zostaje zmieniona, ale lubienie "liking" (ID1) osoby nie zostaje zmienione.
