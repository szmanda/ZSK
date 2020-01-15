use olejki;

-- wyświetla lokalizację bazy danych;
select  @@datadir;

-- ćw 1.
-- Wypisz zawartość wszystkich kolumn z tabeli olejki
SELECT * FROM olejki;

-- ćw 2.
-- Wypisz nazwy olejków (polskie i łacińskie), tak aby nazy kolumn były pełne.
SELECT nazwaolejku AS 'Nazwa olejku', nazwalacinska AS 'Nazwa łacińska'
FROM olejki;

-- ćw 3.
-- Wypisz pełną nazwę olejku (razem z łacińską) ale tak aby była umieszczona w jednej kol.
SELECT concat(nazwaolejku,' ',nazwalacinska) AS 'Pełna nazwa olejku'
FROM olejki;


-- ćw 4.
-- Wypisz cztery pierwsze zapachy
SELECT * FROM zapachy
LIMIT 4;
-- limit jest domyślnie ascending

-- ćw 5.
-- wypisz 4 pierwsze składniki rośliny (tabela RoślinySkładniki)
SELECT skladnikrosliny AS 'składnik rośliny'
FROM roslinyskladniki
GROUP BY skladnikrosliny
LIMIT 4;

-- ćw 6.
-- Posortuj olejki według ich nazw łacińskich w porządku nierosnącym,
-- wyswietl pierwsze 5 wyników
SELECT * FROM olejki
ORDER BY NazwaLacinska DESC
LIMIT 5;

-- ćw 7.
-- Wypisz 5 nazw łacińskich olejków o najwyższych identyfikatorach
SELECT nazwalacinska AS 'Nazwa łacińska'
FROM olejki
ORDER BY IDOlejku DESC
LIMIT 5;

-- ćw 8.
-- Wypisz wszystkie informacje o olejkach, zaczynając od olejku o najmniejszym identyfikatorrze
-- typu rośliny, a kolejnym kryterium sortowania powinna być nazwa oleku
SELECT * FROM olejki
ORDER BY IDTypuRosliny ASC, NazwaOlejku DESC;

-- ćw 9.
-- Wypisz nazwy łacińskie olejków, których identyfikator jest większy od 10
SELECT NazwaLacinska AS 'Nazwa łacińska'
FROM olejki
WHERE IDOlejku > 10;

-- ćw 10.
-- Wypisz wszystkie informacje o olejkach poza olejkami o identyfikatorach 5, 6.
SELECT * FROM olejki
WHERE IDOlejku <> 5 AND IDOlejku <> 6;
-- alternative:
SELECT * FROM olejki
WHERE IDOlejku NOT IN (5,6);

-- ćw 11.
-- Wypisz nazwy łacińskei olejków których NazwaOlejku zaczyna się od litery D
SELECT NazwaLacinska AS 'Nazwa Łacińska'
FROM olejki
WHERE NazwaOlejku LIKE 'D%';
-- alt:
SELECT NazwaLacinska AS 'Nazwa Łacińska'
FROM olejki
WHERE LEFT(NazwaOlejku,1) = 'D';

-- ćw 12.
-- Wypisz wszystkie informacje o olejkach, których drugą literą nazwy łacińskiej jest a.
SELECT * FROM olejki
WHERE NazwaOlejku LIKE '_a%'
-- alternatywnie
SELECT * FROM olejki
WHERE RIGHT(LEFT(NazwaOlejku,2),1) = 'a';

-- ćw 13.
-- Wypisz identyfikatory tych olejków m których nazwa jest pięcioliterowa, nazwy też wyświetl
SELECT IDOlejku AS 'Identyfikator', NazwaOlejku AS "Nazwa olejku"
FROM olejki
WHERE NazwaOlejku LIKE '_____';
-- alt
SELECT IDOlejku AS 'Identyfikator', NazwaOlejku AS "Nazwa olejku"
FROM olejki
WHERE LENGTH(NazwaOlejku) = 5;

-- ćw 14.
-- Wypisz wszystkie dane tych olejków  których sładnik rośliny jest różny od 5,
-- a druga litera nazwy łacińskiej to i
SELECT * FROM olejki
WHERE IDSkladnikaRosliny <> 5
AND NazwaLacinska LIKE '_i%';

-- ćw 15.
-- Wypisz wszystkie zapachy (bez_id), których identyfikatory są z przedziały od 3 do 12
SELECT Zapach FROM zapachy
WHERE IDZapachu BETWEEN 3 AND 12;

-- ćw 16.
-- Wypisz nazwy łacińskie olejków  Róża, Mirra, Imbir
SELECT NazwaLacinska FROM olejki
WHERE NazwaOlejku IN ('Róża','Mirra','Imbir');

-- ćw 17.
-- Wypisz wszystkie zapachy o identyfikatorach 4, 6, 10
SELECT Zapach FROM zapachy
WHERE IDZapachu IN (4,6,10);

-- ćw 18.
-- Przy użyciu klauzyli BETWEEN wyświetl nazwy olejków zaczynające sie o literami z zakresy D-L
-- obecnie już nie używane, ale możliwe na egzaminie:
SELECT nazwaolejku  AS 'Nazwa olejku'
FROM olejki
WHERE nazwaolejku BETWEEN 'D%' AND 'M%'
ORDER BY nazwaolejku;
-- lepsza wersja:
SELECT nazwaolejku  AS 'Nazwa olejku'
FROM olejki
WHERE LEFT(nazwaolejku,1) BETWEEN 'D' AND 'L'
ORDER BY nazwaolejku;

-- ćw 19.
-- Z tabeli Olejki wyświetl  IDOlejku i nazwy olejków nie zaczynające się na literę E
SELECT nazwaolejku  AS 'Nazwa olejku'
FROM olejki
WHERE nazwaolejku NOT LIKE 'e%';

-- ćw 20.
-- Z tabeli olejki wyświetl nazwy olejków zaczynające się na litery A, B, C, D, E, F.
SELECT nazwaolejku AS 'Nazwa olejkow'
FROM olejki
WHERE LEFT(nazwaolejku,1) BETWEEN 'A' AND 'F';

-- wersja oldschool
SELECT nazwaolejku AS 'Nazwa olejkow'
FROM olejki
WHERE
	nazwaolejku LIKE 'a%'
	OR nazwaolejku LIKE 'b%'
	OR nazwaolejku LIKE 'c%'
	OR nazwaolejku LIKE 'd%'
	OR nazwaolejku LIKE 'e%'
	OR nazwaolejku LIKE 'f%';

-- ćw 21.
-- Z tabeli Ostrzeżenia wyświetl  IDostrzezenia,
-- dla opisu ostrzezenia zaczynającego się od litery O i id ostrzezania rownego 7

-- ćw 22.
-- Wyświetl id olejku, nazwę łacińską i nazwę olejku dla olejków krórych nazwa
-- zaczyna się od A,B,C wyniki posortuj malejącą wg nazwy olejku