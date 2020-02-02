-- MySQL 5.7 w konsoli
start CMD
    prompt :
    cd <ścieżka>
    -- np. C:\Program Files\MySQL\MySQL Server 5.7
    bin\mysql -u root -p
    <hasło>
    -- w szkole: student

-- Zalogowano do serwera MySQL
-- (widoczny prompt mysql>)

USE olejki_mysql
-- Database changed

SHOW TABLES
-- +------------------------+
-- | Tables_in_olejki_mysql |
-- +------------------------+
-- | charakterystyki        |
-- | olejki                 |
-- | olejkiceny             |
-- | olejkicharakterystyki  |
-- | olejkiilosci           |
-- | olejkiostrzezenia      |
-- | olejkistezenia         |
-- | olejkizapachy          |
-- | ostrzezenia            |
-- | roslinyskladniki       |
-- | roslinytypy            |
-- | zapachy                |
-- +------------------------+
-- 12 rows in set (0.00 sec)


-- Wypisz nazwy olejków wraz z ich liczbą ostrzeżeń
SELECT ol.NazwaOlejku, Count(o.Ostrzezenie) AS Ilosc
FROM olejki ol
  INNER JOIN olejkiostrzezenia oo
    ON ol.IDOlejku = oo.IDOlejku
  INNER JOIN ostrzezenia o
    ON oo.IDOstrzezenia = o.IDOstrzezenia
GROUP BY ol.NazwaOlejku;
-- +----------------------------+-------+
-- | NazwaOlejku                | Ilosc |
-- +----------------------------+-------+
-- | Balsam cytrynowy (Melissa) |     1 |
-- | Bazylia                    |     1 |
-- | Bergamota                  |     1 |
-- | Cynamon                    |     2 |
-- | Cytryna                    |     1 |
-- | Gałka muszkatołowa         |     1 |
-- | Geranium                   |     2 |
-- | Imbir                      |     1 |
-- | Jaśmin                     |     1 |
-- | Jałowiec                   |     1 |
-- | Lemongrass                 |     1 |
-- | Majeranek                  |     1 |
-- | Mięta pieprzowa            |     2 |
-- | Pieprz czarny              |     1 |
-- | Pomarańcza                 |     1 |
-- | Róża                       |     1 |
-- | Rozmaryn                   |     2 |
-- | Szałwia muszkatołowa       |     2 |
-- | Tymianek                   |     2 |
-- | Ylang-ylang                |     1 |
-- +----------------------------+-------+
-- 20 rows in set (0.16 sec)

-- Oblicz jaka jest średnia cena olejków produkowanych z innych składników rożliny.
SELECT s.SkladnikRosliny, CAST(AVG(c.Cena) AS DECIMAL(5,2)) AS 'SredniaCena'
FROM Olejki o
  INNER JOIN roslinyskladniki s
    ON o.IDSkladnikaRosliny = s.IDSkladnikaRosliny
  INNER JOIN olejkiceny c
    ON o.IDOlejku = c.IDOlejku
GROUP BY 1;
-- +-----------------+-------------+
-- | SkladnikRosliny | SredniaCena |
-- +-----------------+-------------+
-- | Cała roślina    |       20.76 |
-- | Drewno          |       22.03 |
-- | Igły            |       26.90 |
-- | Jagody          |       24.70 |
-- | Korzenie        |       33.99 |
-- | Kwiaty          |       29.98 |
-- | Liście          |       32.10 |
-- | Nasiona         |       24.70 |
-- | Pestki owoców   |       95.90 |
-- | Skórka owoców   |       30.28 |
-- | Wnętrze owocu   |       23.60 |
-- | Żywica          |       25.33 |
-- +-----------------+-------------+
-- 12 rows in set (0.01 sec)

-- Wypisz nazwy olejków wraz z ilością określeń w tabeli Charakterystyki, ale tylko te które określono przynajmnije 6 wyrażeniami. Olejki posortuj takm by te o najwyższej liczbye określeń były jako pierwsze, a jeśli są olejki o takiej samej liczbie charakterystyk, to posortuj je wewnątrz według alfabetu
SELECT o.NazwaOlejku, Count(c.Charakterystyka) AS Ilosc
FROM olejki o
  INNER JOIN olejkicharakterystyki oc
    ON o.IDOlejku = oc.IDOlejku
  INNER JOIN charakterystyki c
    ON oc.IDCharakterystyki = c.IDCharakterystyki
GROUP BY 1
HAVING Count(c.Charakterystyka)>=6
ORDER BY 2 DESC, 1 ASC;
-- +----------------------+-------+
-- | NazwaOlejku          | Ilosc |
-- +----------------------+-------+
-- | Drzewko herbaciane   |    10 |
-- | Lawenda              |     9 |
-- | Paczula              |     8 |
-- | Cytryna              |     7 |
-- | Drzewo sanadłowe     |     7 |
-- | Eukaliptus           |     7 |
-- | Rumianek lekarski    |     7 |
-- | Szałwia lekarska     |     7 |
-- | Szałwia muszkatołowa |     7 |
-- | Wetiwer              |     7 |
-- | Benzoes              |     6 |
-- | Jałowiec             |     6 |
-- | Palisander           |     6 |
-- | Rumian szlachetny    |     6 |
-- | Tymianek             |     6 |
-- +----------------------+-------+
-- 15 rows in set (0.01 sec)

-- Wypisz te olejki które mają 2 lub więcej ostrzeżeń
SELECT o.NazwaOlejku, Count(os.IDOstrzezenia) AS Ilosc
FROM olejki o
  INNER JOIN olejkiostrzezenia oo
    ON o.IDOlejku = oo.IDOlejku
  INNER JOIN ostrzezenia os
    ON oo.IDOstrzezenia = os.IDOstrzezenia
GROUP BY 1
HAVING Count(os.IDOstrzezenia)>=2
ORDER BY 1 ASC;
-- +----------------------+-------+
-- | NazwaOlejku          | Ilosc |
-- +----------------------+-------+
-- | Cynamon              |     2 |
-- | Geranium             |     2 |
-- | Mięta pieprzowa      |     2 |
-- | Rozmaryn             |     2 |
-- | Szałwia muszkatołowa |     2 |
-- | Tymianek             |     2 |
-- +----------------------+-------+
-- 6 rows in set (0.00 sec)

-- Znajdź informacje o najwyższym stężeniu olejków dla każdej grupy olejków produkowanych z innych zkładników roślinnych
SELECT rs.SkladnikRosliny, CAST(MAX(os.Stezenie) AS DECIMAL(3,2)) AS 'Max. stezenie'
FROM olejki o
  INNER JOIN roslinyskladniki rs
    ON o.IDSkladnikaRosliny = rs.IDSkladnikaRosliny
  INNER JOIN olejkistezenia os
    ON o.IDOlejku = os.IDOlejku
GROUP BY 1;
-- +-----------------+---------------+
-- | SkladnikRosliny | Max. stezenie |
-- +-----------------+---------------+
-- | Cała roślina    |          0.60 |
-- | Drewno          |          0.60 |
-- | Igły            |          0.60 |
-- | Jagody          |          0.85 |
-- | Korzenie        |          0.30 |
-- | Kwiaty          |          0.85 |
-- | Liście          |          0.85 |
-- | Nasiona         |          0.60 |
-- | Pestki owoców   |          0.30 |
-- | Skórka owoców   |          0.85 |
-- | Wnętrze owocu   |          0.10 |
-- | Żywica          |          0.50 |
-- +-----------------+---------------+
-- 12 rows in set (0.00 sec)

-- Oblicz jaka jest średnia cena olejków produkowanych z kwaitów i średnia cena oleków produkowanych z żywicy

-- ALternatywnie WHERE s.SkladnikRosliny IN ('Kwiaty','Żywica')
SELECT ROUND(AVG(c.Cena), 2) AS 'SredniaCena', s.SkladnikRosliny
FROM olejki o
  INNER JOIN roslinyskladniki s
    ON o.IDSkladnikaRosliny = s.IDSkladnikaRosliny
  INNER JOIN olejkiceny c
    ON o.IDOlejku = c.IDOlejku
WHERE s.SkladnikRosliny = 'Kwiaty' OR s.SkladnikRosliny = 'Żywica'
GROUP BY 2;
-- +-------------+-----------------+
-- | SredniaCena | SkladnikRosliny |
-- +-------------+-----------------+
-- |       29.98 | Kwiaty          |
-- |       25.33 | Żywica          |
-- +-------------+-----------------+
-- 2 rows in set (0.00 sec)

-- Jaka jest łaczna ilośc opakowań olejków produkowanych z krzewówm, a jak z drzew (dla każdej grupy oddzielnie).
SELECT SUM(i.IloscOpakowan), rt.TypRosliny
FROM olejki o
  INNER JOIN roslinytypy rt
    ON o.IDTypuRosliny = rt.IDTypuRosliny
  INNER JOIN olejkiilosci i
    ON o.IDOlejku = i.IDOlejku
WHERE rt.TypRosliny IN ('Krzew','Drzewo')
GROUP BY 2;
-- +----------------------+------------+
-- | SUM(i.IloscOpakowan) | TypRosliny |
-- +----------------------+------------+
-- |                 2786 | Drzewo     |
-- |                 1303 | Krzew      |
-- +----------------------+------------+
-- 2 rows in set (0.01 sec)

-- Wypisz te grupy olejków (grupy wyznacza składnik z którego jest produkowany), dla których łączna wartość (SUM(c.Cena * i.IloscOpakowan)) jest poniżej 5000.
SELECT s.SkladnikRosliny, SUM(c.Cena * i.IloscOpakowan) AS Wartosc
FROM olejki o
  INNER JOIN olejkiceny c
    ON o.IDOlejku = c.IDOlejku
  INNER JOIN olejkiilosci i
    ON o.IDOlejku = i.IDOlejku
  INNER JOIN roslinyskladniki s
    ON o.IDSkladnikaRosliny = s.IDSkladnikaRosliny
GROUP BY 1
HAVING SUM(c.Cena * i.IloscOpakowan) < 5000;
-- +-----------------+---------+
-- | SkladnikRosliny | Wartosc |
-- +-----------------+---------+
-- | Cała roślina    | 4470.50 |
-- | Drewno          | 1253.00 |
-- | Igły            |  941.50 |
-- | Jagody          | 2251.60 |
-- | Nasiona         | 1729.00 |
-- | Pestki owoców   | 3356.50 |
-- | Wnętrze owocu   | 1227.20 |
-- | Żywica          | 2143.50 |
-- +-----------------+---------+
-- 8 rows in set (0.00 sec)

-- Wblicz jaka jest wartość każdego olejku (wypisz nazwy, ceny, ilości i wartość). Olejki o nazwyższej wartości powinny być jako pierwsze
SELECT o.NazwaOlejku, c.Cena, i.IloscOpakowan AS Ilosc, SUM(c.Cena * i.IloscOpakowan) AS Wartosc
FROM olejki o
  INNER JOIN olejkiceny c
    ON o.IDOlejku = c.IDOlejku
  INNER JOIN olejkiilosci i
    ON o.IDOlejku = i.IDOlejku
GROUP BY 1
ORDER BY 4 DESC;
-- +----------------------------+-------+-------+----------+
-- | NazwaOlejku                | Cena  | Ilosc | Wartosc  |
-- +----------------------------+-------+-------+----------+
-- | Neroli                     | 45.60 |  1000 | 45600.00 |
-- | Imbir                      | 43.20 |   879 | 37972.80 |
-- | Rozmaryn                   | 37.80 |   213 |  8051.40 |
-- ...
-- | Palisander                 | 15.80 |    22 |   347.60 |
-- | Drzewo sanadłowe           | 12.80 |    18 |   230.40 |
-- | Drzewko herbaciane         |  3.89 |    10 |    38.90 |
-- +----------------------------+-------+-------+----------+
-- 47 rows in set (0.00 sec)

-- Oblicz jaka jest cena 1ml olejku
SELECT o.NazwaOlejku, CAST((c.Cena/c.Objetosc_ml) AS DECIMAL (5,2)) AS 'Cena/ml'
FROM olejki o
  INNER JOIN olejkiceny c
    ON o.IDOlejku = c.IDOlejku;

-- Oblicz jaka jest maksymalna, minimalna i średnia cena ojelku na mililitr
SELECT
  (CAST(MAX(c.Cena/c.Objetosc_ml) AS DECIMAL (5,2))) AS 'MaxCena/ml',
  (CAST(MIN(c.Cena/c.Objetosc_ml) AS DECIMAL (5,2))) AS 'MinCena/ml',
  (CAST(AVG(c.Cena/c.Objetosc_ml) AS DECIMAL (5,2))) AS 'AvgCena/ml'
FROM olejki o
  INNER JOIN olejkiceny c
    ON o.IDOlejku = c.IDOlejku;
-- +------------+------------+------------+
-- | MaxCena/ml | MinCena/ml | AvgCena/ml |
-- +------------+------------+------------+
-- |      31.97 |       0.39 |       5.02 |
-- +------------+------------+------------+
-- 1 row in set (0.00 sec)

-- zsumuj wartości tych olejków, które są produkowane z Liści
SELECT CAST(SUM(c.Cena * i.IloscOpakowan))
FROM olejki o
  INNER JOIN olejkiceny c
    ON o.IDOlejku = c.IDOlejku
  INNER JOIN olejkiilosci i
    ON o.IDOlejku = i.IDOlejku;
