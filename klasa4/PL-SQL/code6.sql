-- WSZYSTKI WYJĄTKI ZDEFINNIOWANE PRZEZ UŻYTKOWNIKA MAJĄ TEN SAM KOD (-1)

SET SERVEROUTPUT ON;

-- KOD POKAZUJĄCY ŻE NIE MA OSÓB O WZROŚCIE
-- WYŻSZYM OD PROGU DANEGO PARAMETREM

-- RAISE; OZNACZA WYŚWIETLENIE NA EKRANIE BLEDU

CREATE OR REPLACE PROCEDURE LICZ
(MINI NUMBER, ILE OUT NUMBER)
IS
BRAKUJE EXCEPTION;
BEGIN
SELECT COUNT(IdOsoby) INTO ILE FROM Osoby
WHERE Wzrost > mini;
IF (ile = 0) THEN
RAISE BRAKUJE;
END IF;
EXCEPTION
WHEN BRAKUJE THEN
DBMS_OUTPUT.PUT_LINE('NIE MA TAKICH');
DBMS_OUTPUT.PUT_LINE('KOD - ' || SQLCODE);
DBMS_OUTPUT.PUT_LINE('OPIS - ' || SQLERRM);
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE(SQLCODE);
END;

-- PONIŻEJ DODANO LINIĘ PRAGMA EXCEPTION_INIT SLUZY DO POWIAZANIA KODU BLEDU
-- Z JEGO NAZWA POZWALA NA PRZYPISANIE KODU DO NASZEGO WYJATKU

CREATE OR REPLACE PROCEDURE LICZ
(MINI NUMBER, ILE OUT NUMBER)
IS
BRAKUJE EXCEPTION;
PRAGMA EXCEPTION_INIT(BRAKUJE,-13467);
BEGIN
SELECT COUNT(IdOsoby) INTO ILE FROM Osoby
WHERE Wzrost > mini;
IF (ile = 0) THEN
RAISE BRAKUJE;
END IF;
EXCEPTION
WHEN BRAKUJE THEN
DBMS_OUTPUT.PUT_LINE('NIE MA TAKICH');
DBMS_OUTPUT.PUT_LINE('KOD - ' || SQLCODE);
DBMS_OUTPUT.PUT_LINE('OPIS - ' || SQLERRM);
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE(SQLCODE);
END;


-- W SUNKCJACH KONIECZNE JEST STOSOWANIE ALIASOW, BEZ NICH

CREATE OR REPLACE FUNCTION LICZF (MINI NUMBER, ILEP OUT NUMBER)
RETURN INT
IS
ILE INT;
BEGIN
SELECT COUNT(IDOSOBY) INTO ILE FROM OSOBY
WHERE WZROST > MINI;
RETURN ILE;
END;


-- FUNKCJA ZAWSZE ZWRACA WARTOŚĆ PRZEZ NAZWE JEJ WYWOANIE Z BLOKU ANONIMOWEGO
-- JESRT RÓWNOZNACZNE Z PRZYPISANIEM ZWRACANEJ WARTOŚŚCI POD ZMIENNA LUB
-- WYKORZYSTANIEM JAKO PARAMETRU INNEJ FUNKCJI


DECLARE
ILE NUMBER;
BEGIN
ILE:=LICZF(1.8);
DBMS_OUTPUT.PUT_LINE('LICZF ZWRACA ' || ILE);
END;

CREATE OR REPLACE FUNCTION LICZF (MINI NUMBER, ILEP OUT NUMBER)
RETURN INT
IS
ILE INT;
BEGIN
SELECT COUNT(IDOSOBY) INTO ILE FROM OSOBY
WHERE WZROST > MINI;
ILEP:=ILE;
RETURN ILE;
END;


-- FUNKCJA NIE MOŻE PRZEKAZYWAĆ WARTOŚCI DO MIEJSCA WYWOANIA PRZEZ NAZWE
-- A DO JEJ WNETRZA PARAMETRY PRZEKAZYWANE SA PRZEZ ICH LISTE
-- DOZWOLONE JESR STOSOWANIE NA LISCIE PARAMETRU TYPU OUT

DECLARE
ILE NUMBER;
ILEP NUMBER;
BEGIN
ILE:=LICZF(1.8,ILEP);
DBMS_OUTPUT.PUT_LINE(ILE);
DBMS_OUTPUT.PUT_LINE(ILEP);
END;

-- PRARAMETR TYPU IN OUT MOŻE ZOSTAĆ WYKORZYSTANY DO DWUKIERUNKOWEGO
-- PRZEKAZYWANIA DANYCH

-- NAPISZMY FUNKCJE LICZACA

CREATE OR REPLACE FUNCTION RAZEM
(KTO IN ZAROBKI.IDOSOBY%TYPE)
RETURN NUMBER
IS
POLICZ NUMBER;
BEGIN
SELECT SUM(BRUTTO) INTO POLICZ FROM ZAROBKI
WHERE IDOSOBY=KTO;
RETURN POLICZ;
END;


-- PROCEDURY WYJĄTKOW
-- MOZNA DODAC WYJATKI DO PISANEJ FUNKCJI

CREATE OR REPLACE FUNCTION LICZF (MINI NUMBER)
RETURN INT
IS
ILE INT;
BRAKUJE EXCEPTION;
BEGIN
SELECT COUNT(IDOSOBY) INTO ILE FROM OSOBY
WHERE WZROST > MINI;
RETURN ILE;
EXCEPTION
WHEN BRAKUJE THEN
DBMS_OUTPUT.PUT_LINE('NIE MA TAKICH');
DBMS_OUTPUT.PUT_LINE('KOD - ' || SQLCODE);
DBMS_OUTPUT.PUT_LINE('OPIS - ' || SQLERRM);
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE(SQLCODE);
END;

-- W JEDNEJ FUNKCJI NIE MOGE SIE ODWOLAC DO INNEJ FUNKCJI,
-- ALE MOGE SIE ODWOLAC DO PROCEDURY,A Z PROCEDURY MOGE
-- ODWOLAC SIE DO FUNKCJI


CREATE OR REPLACE FUNCTION LICZF
(MINI NUMBER DEFAULT 1.8)
RETURN INT
IS
ILE INT;
BRAKUJE EXCEPTION;
BEGIN
SELECT COUNT(IDOSOBY) INTO ILE FROM OSOBY
WHERE WZROST > MINI;
RETURN ILE;
EXCEPTION
WHEN BRAKUJE THEN
DBMS_OUTPUT.PUT_LINE('NIE MA TAKICH');
DBMS_OUTPUT.PUT_LINE('KOD - ' || SQLCODE);
DBMS_OUTPUT.PUT_LINE('OPIS - ' || SQLERRM);
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE(SQLCODE);
END;


-- ======= ROZPOCZYNAMY ZABAWE Z KWERENDAMI =======
-- KWERENDY SA PISANE W JEZYKU DQL

SELECT NAZWISKO, RAZEM(IDOSOBY) FROM OSOBY;



-- WBUDOWANA FUNKCA W ORACLE FUNKCJA WYBIERAJACA Z DATY
-- JEJ CZESC. JESLI CHCEMY NP. UZYSKAC ZAWARTY W DACIE ROK,
-- STOSUJEMY WIELOKROTNA KONWERSJE

SELECT
TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE, 'yyyymmdd'),1,4)) AS ROK
FROM DUAL;

-- NIE MOZNA ZAPOMNIEC O WIRTUALNEJ TABELI DUAL,
-- Z KTOREJ MOZEMY ODCZYTYWAC DANE SYSTEMOWE

SELECT
TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE, 'yyyymmdd'),5,2)) AS MIESIAC
FROM DUAL;

SELECT
TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE, 'yyyymmdd'),7,2)) AS DZIEN
FROM DUAL;

-- ABY ODCZYTAC DZNIEN W ROKU MOZEMY UZYC INNEGO SZABLONU

-- ======== PAKIETY ========

-- PAKIET SKADA SIE Z DWOCH CZESCI DEKLARACJI ORAZ CIALA A TWORZENIE ODBYWA SIE
-- W DWOCH ETAPACH: PIERWSZY DEKLARUJE JAKIE FUNKCJE BĘDA
-- ZNAJDOWALY SIE W PAKIECIE, DRUGI ETAP TO ZAPISANIE CIALA PAKIETU

CREATE OR REPLACE PACKAGE PAKIET
IS
FUNCTION LICZF(MINI NUMBER, ILE OUT INT) RETURN INT;
FUNCTION LICZ(MINI NUMBER, ILE OUT INT) RETURN INT;
END;

-- PAKIET MOZEMY USUNĄC Z BAZY ANALOGICZNE DO FUNKCJI I PROCEDUR:

DROP PACKAGE PAKIET;

-- UTWORZMY JEDNAK PAKIET SPOWROTEM:

-- 1 ETAP
CREATE OR REPLACE PACKAGE PAKIET
IS
  FUNCTION LICZF(MINI NUMBER, ILE OUT INT) RETURN INT;
  FUNCTION LICZF(ILE OUT INT) RETURN INT;
END;


-- 2 ETAP
CREATE OR REPLACE PACKAGE BODY PAKIET
IS
FUNCTION LICZF (MINI INT, ILE OUT INT) RETURN INT
  IS
  BEGIN
    SELECT COUNT(IDOSOBY) INTO ILE FROM OSOBY
    WHERE ROKURODZ > MINI;
    RETURN 0;
    EXCEPTION
    WHEN OTHERS THEN
    RETURN SQLCODE;
  END;
FUNCTION LICZF (ILE OUT INT)
RETURN INT
  IS
  BEGIN
    SELECT COUNT(IDOSOBY) INTO ILE FROM OSOBY
    WHERE ROKURODZ > (SELECT AVG(ROKURODZ) FROM OSOBY);
    RETURN 0;
    EXCEPTION
    WHEN OTHERS THEN
    RETURN SQLCODE;
  END;
  BEGIN
  NULL;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE;
END;
