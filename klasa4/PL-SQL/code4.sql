SET SERVEROUTPUT ON;
DECLARE ile NUMBER;
BEGIN wysocy(ile => ile);
DBMS_OUTPUT.PUT_LINE(ile);
END;

-- W mysql zmienna typu float / real jest niewskazana, ponieważ powoduje blendy
-- powinno uzywać sie typu Decimal slbo Numeric
-- Float czasem nie jest w stanie dokladnie podanej przez as wartości, i zapisuje
-- najbliższą niej, powoduje to niewaściwe wyniki, zwaszcza przy mnożeniu
-- W językach programowania baz danych (np PL/SQL) nawet zalecane jest używanie tych typów,
-- ponieważ tu nie powodują one blendow


-- wykonanie kodu skladająceg się z fragmentów napisów,
-- wymaga użycia polecenia EXECUTE IMMEDIATE

create or replace Procedure exe_tekst
(typ varchar2)
IS
BEGIN
EXECUTE IMMEDIATE 'UPDATE osoby SET Nazwisko=' || typ || '(Nazwisko)';
END exe_tekst;

CREATE OR REPLACE PROCEDURE exe_tekst
(typ varchar2)
IS
zap varchar2(111);
BEGIN
zap:= 'UPDATE osoby SET Nazwisko=' || typ || '(Nazwisko)';
EXECUTE IMMEDIATE zap;
END exe_tekst;

-- procedura może zawierać wiecej niż jeden parametr typu OUT
-- oprócz liczby osób o wzroście większym od wartośći progowej chcemy
-- wyznaczyć ich średni wzrost. Możemy zastosować dwa zapytania agregujące


create or replace PROCEDURE wysocy
(mm number, ile OUT number, sr OUT real)
IS
BEGIN
SELECT COUNT(wzrost), AVG(wzrost), INTO ile, sr FROM OSOBY
WHERE wzrost > MM;
END wysocy;


-- dla każdego parametru może zostać zdefiniowana wartość
-- domyślna przy pomosy zowa kluczowego default

create or replace PROCEDURE wysocy
(mm number default 1.7, ile OUT number)
IS
BEGIN
SELECT COUNT(wzrost)
INTO ile
FROM OSOBY
WHERE wzrost > MM;
END wysocy;

-- po zaktualizowaniu znów mamy 2 srgumenty w procedurze i można ją wykonać
-- w nastepujący  sposob:

SET SERVEROUTPUT ON;
DECLARE
ile NUMBER;
BEGIN
wysocy(1.8,ile);
DBMS_OUTPUT.PUT_LINE(ile);
END;

-- aby użyć wartości domyślnej możemy wpisać jako argument (ile => ile)

-- spróbujmy zamienić miejscami atrybuty

create or replace PROCEDURE wysocy
(ile OUT number, mm number default 1.7)
IS
BEGIN
SELECT COUNT(wzrost) INTO ile FROM OSOBY
WHERE wzrost > mm;
END wysocy;

-- wywoanie nazewnicze jest dopuszczalne również wtedy, kiedy
-- podajemy pelny zestaw parametrów

SET SERVEROUTPUT ON;
DECLARE
ile NUMBER;
BEGIN
wysocy(mm => 1.8,ile => ile);
DBMS_OUTPUT.PUT_LINE(ile);
END;

-- procedury o trzech parametrach numerycznych
-- Pierwzse dwa zsa typu IN a trzeci jest typu OUT

CREATE OR REPLACE PROCEDURE dziel
(a real, b real, c OUT real)
AS
BEGIN
c:=a/b;
END;

-- poprawne wywoanie tej procedury:
-- w peni pozycyjne z dwoma pierwszymi parametrami
-- danymi pozycyjnie oraz z danym

SET SERVEROUTPUT ON;
DECLARE res real;
BEGIN
dziel(10,9,res);
DBMS_OUTPUT.PUT_LINE('Wynik = ' || res);
dziel(10,9,c => res);
DBMS_OUTPUT.PUT_LINE('Wynik = ' || res);
dziel(10, b=> 9, c => res);
DBMS_OUTPUT.PUT_LINE('Wynik = ' || res);
dziel(10,c => res, b => 9);
DBMS_OUTPUT.PUT_LINE('Wynik = ' || res);
END;

-- wykonywanie zapytań skadanych z fragmentów, np. danych statycznych
-- napisanych czy też zawartych w zmiennej

CREATE OR REPLACE PROCEDURE exe_tekst
(typ varchar2)
IS
zap varchar2(111);
BEGIN
zap:= 'UPDATE osoby SET Nazwisko=' || typ || '(Nazwisko)';
EXECUTE IMMEDIATE zap;
END exe_tekst;

-- Wywoanie powyższej procedury powoduje przerwanie dziaania
-- programu i wywietlanie komunikatu o blendzie

CREATE OR REPLACE PROCEDURE blad
IS
BEGIN
RAISE_APPLICATION_ERROR (-20205, 'Blad programu');
END blad;

-- wykonanie tego samego za pomocą EXECUTE IMMEDIATE

CREATE OR REPLACE PROCEDURE exe_tekst
(typ varchar2)
IS
BEGIN
IF UPPER(typ) NOT IN ('UPPER', 'LOWER', 'INITCAP') THEN
RAISE_APPLICATION_ERROR (-20205, 'Zla funkcja');
else
EXECUTE IMMEDIATE 'UPDATE osoby SET nazwisko=' || typ || '(NAZWISKO)';
END IF;
END exe_tekst;
