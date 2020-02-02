USE olejki_mysql;

-- ćw 21.
-- Z tabeli Ostrzeżenia wyświetl IDOstrzeżenia,
-- dla opisu ostrzeżenia zaczynającego się od litery O i id ostrzeżenia równego 7
SELECT IDOstrzezenia AS Identyfikator, Opis
FROM ostrzezenia
WHERE Opis LIKE 'O%' AND IDOstrzezenia = 7;

-- ćw 22.
-- Wyświetl id olejku, nazwę łacińską i nazwę olejku dla których
-- nazwa zaczyna się od A,B,C wyniki posortuj nierosnąco wg. nazwy olejku
SELECT IDOlejku AS Identyfikator, 
NazwaLacinska AS Łacińska, 
NazwaOlejku AS Nazwa
FROM olejki
WHERE LEFT(NazwaOlejku,1) IN ('A','B','C')
ORDER BY NazwaOlejku DESC;

-- ćw 23.
-- z tabeli olejkiceny wypisz 9 najtańszych olejków
SELECT olejki.NazwaOlejku AS olejek, olejkiceny.Cena AS Cena
FROM olejki
INNER JOIN olejkiceny ON olejki.IDOlejku = olejkiceny.IDOlejku
ORDER BY olejkiceny.cena
LIMIT 9;


-- ćw 24.
-- z tabeli olejkiceny policz ile łącznie jest olejków o danej objętości i wyszczególnij jaki procent stanowią wszystkich zasobów łącznie
SELECT olejkiceny.Objetosc_ml AS Objetosc, Count(olejkiceny.IDOlejku) AS Ilosc, 
Count(olejkiceny.IDOlejku)/(SELECT Count(olejkiceny.IDolejku) AS suma FROM olejkiceny)*100 AS 'Procent Zasobow'
FROM Olejkiceny
GROUP BY Objetosc_ml;

-- JOINy inner left right cross

-- ćw 25.
-- z Wypisz nazwy olejków , które wytwarzane są z całych roślin, albo z liści. (Składnik rośliny: liście, cała roślina)
SELECT o.NazwaOlejku
FROM olejki o
INNER JOIN roslinyskladniki rs
ON o.IDSkladnikaRosliny = rs.IDSkladnikaRosliny
WHERE rs.SkladnikRosliny = 'Liście'
XOR rs.SkladnikRosliny =  'Cała roślina';

-- ćw 26.
-- Wypisz nazwy łacińskie olejków które są wytwarzane z kwiatów i krzewów
SELECT o.NazwaOlejku
FROM olejki o
INNER JOIN roslinytypy rt ON o.IDTypuRosliny = rt.IDTypuRosliny
WHERE rt.TypRosliny IN ('kwiat','krzew');
-- WHERE rt.TypRosliny = 'kwiat' OR rt.TypRosliny = 'krzew';

-- ćw 27.
-- Wypisz nazwy tych olejków, które zaczynają się od litery M, a wytwarzane są ze składnika (typ rośliny) drzewo
SELECT o.NazwaOlejku AS 'Nazwa olejku'
FROM olejki o
INNER JOIN roslinytypy rt
ON o.IDTypuRosliny = rt.IDTypuRosliny
WHERE o.NazwaOlejku LIKE 'M%' AND rt.TypRosliny = 'Drzewo';

-- ćw 28.
-- wypisz te typy roślin z których nie produkuje się olejków (a przynajmniej brak jest takiej informacji w baziw danych ) w klauzuli where użyj IS NULL
SELECT rt.TypRosliny
FROM olejki o
RIGHT JOIN roslinytypy rt ON o.IDTypuRosliny = rt.IDTypuRosliny
WHERE o.IDTypuRosliny IS NULL;

-- ćw 29.
-- Wypisz wszystkie nazwy olejków wraz z ostrzeżeniami i opisem ostrzeżenia, posortuje je tak, by jako pierwsze  były olejki z ostrzeżeniami a na końcu te bez  żadnych ostrzeżeń. Olejki wewnątrz jednego rodzaju ostrzeżenia powinny być posortowane alfabetycznie
SELECT ol.NazwaOlejku AS 'Nazwa Olejku', ost.Ostrzezenie, ost.Opis
FROM olejki ol
LEFT JOIN olejkiostrzezenia olo ON ol.IDOlejku = olo.IDOlejku
LEFT JOIN ostrzezenia ost ON olo.IDOstrzezenia = ost.IDOstrzezenia
ORDER BY ost.Ostrzezenie DESC, ol.NazwaOlejku ASC;

-- ćw 30.
-- Wypisz wszystkie nazwy olejków, z których  można kożystac bez żadnych przeciwwskazań (nie mają ostrzeżeń)
SELECT ol.NazwaOlejku
FROM olejki ol
LEFT JOIN olejkiostrzezenia olo ON ol.IDOlejku = olo.IDOlejku
WHERE olo.IDOstrzezenia IS NULL;

-- ćw 31.
-- Wypisz nazwy łacińskie olejkow mających słodki zapach.
SELECT o.NazwaLacinska
FROM olejki o
INNER JOIN olejkizapachy oz ON o.IDOlejku = oz.IDOlejku
INNER JOIN zapachy z ON oz.IDZapachu = z.IDZapachu
WHERE z.Zapach = 'słodki';

-- ćw 32.
-- Wypisz nazwy olejków mających choć jedno z działań: Uspokajający, Antydepresyjny.
SELECT DISTINCT o.NazwaOlejku, c.Charakterystyka
FROM olejki o
INNER JOIN olejkicharakterystyki oc
ON o.IDOlejku = oc.IDOlejku
INNER JOIN charakterystyki c
ON oc.IDCharakterystyki = c.IDCharakterystyki
WHERE c.Charakterystyka IN ('Uspokajajacy','Antydepresyjny');

-- ćw 33.
-- Które olejki (nazwy) mające charakter pobudzający lub moczopędny i mają jednocześnie kwatowy zapach
SELECT DISTINCT o.NazwaOlejku, c.Charakterystyka, z.Zapach
FROM olejki o
INNER JOIN olejkicharakterystyki oc
ON o.IDOlejku = oc.IDOlejku
INNER JOIN charakterystyki c
ON oc.IDCharakterystyki = c.IDCharakterystyki
INNER JOIN olejkizapachy oz
ON oz.IDOlejku = o.IDOlejku
INNER JOIN Zapachy z
ON z.IDZapachu = oz.IDZapachu
WHERE c.Charakterystyka IN ('Moczopędny','Pobudzający') AND z.Zapach = 'kwiatowy'; 

-- ćw 32.
-- Wypisz te typy roślin, z których produkowane są olejki z bazy

SELECT DISTINCT rt.TypRosliny
FROM olejki o
RIGHT JOIN roslinytypy rt
ON o.IDTypuRosliny = rt.IDTypuRosliny
WHERE o.IDOlejku IS NOT NULL;
-- albo prościej:
SELECT DISTINCT rt.TypRosliny
FROM olejki o
INNER JOIN roslinytypy rt
ON o.IDTypuRosliny = rt.IDTypuRosliny;

-- ćw 33.
-- Wypisz te składniki roślinne, z których produkowane są olejki

-- ćw 34.
-- Wyświetl nazwę olejku, datę proddukcji a w oddzielnych kolumnach miesiąc , ilość tygodni do daty produkcji do dania dzisiejszego.

