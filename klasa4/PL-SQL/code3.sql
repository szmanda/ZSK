create or replace PROCEDURE wysocy
(mm number, ile OUT number)
IS
BEGIN
SELECT COUNT(wzrost)
INTO ile
FROM OSOBY
WHERE wzrost > MM;
END wysocy;


-- typ real opzwala w oracle wyświetlać duże liczby zmiennoprzecinkowe,
-- w programowaniu baz danych nie występują np typy float czy decimal(9,2)

create or replace PROCEDURE wysocy
(mm number, ile OUT number, sr OUT real)
IS
BEGIN
SELECT COUNT(wzrost)
AVG(wzrost)
INTO ile,
sr FROM OSOBY
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

-- Wywoanie tak zdefiniowanej procedury z bloku znonimowego wymaga
-- zadeklarowanej zmiennej
-- Dla procedury ze zdefiniowaną zawartością domyślną poprawne jest
-- wywoanie, w którym podajemy wartość posiadającego ją parametru

SET SERVEROUTPUT ON;
DECLARE ile NUMBER;
BEGIN wysocy(1.8,ile);
DBMS_OUTPUT.PUT_LINE(ile);
END;

-- wywoanie nazewnicze, bez względu na to, na których pozycjach
-- znajdują sie wartości domyślne jest zawsze poprawne

SET SERVEROUTPUT ON;
DECLARE ile NUMBER;
BEGIN wysocy(ile => ile);
DBMS_OUTPUT.PUT_LINE(ile);
END;

-- wykonanie kodu skladająceg się z fragmentów napisów,
-- wymaga użycia polecenia EXECUTE IMMEDIATE

create or replace Procedure exe_tekst
(typ varchar2)
IS
BEGIN
EXECUTE IMMEDIATE 'UPDATE osoby SET Nazwisko=' ||typ || '(Nazwisko)';
END exe_tekst;
