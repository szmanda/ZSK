-- ścieżka do folderu przechowującego bazy
SELECT @@datadir;

USE olejki_mysql;

-- ćw 35.
-- wypisz te składniki rośliny z których produkowane są olejki z bazy
SELECT distinct s.SkladnikRosliny AS "składnik rośliny"
FROM Olejki o
INNER JOIN roslinyskladniki s
	ON o.IDSkladnikaRosliny = s.IDSkladnikaRosliny;

SELECT distinct s.SkladnikRosliny AS "składnik rośliny"
FROM Olejki o
LEFT JOIN roslinyskladniki s
	ON o.IDSkladnikaRosliny = s.IDSkladnikaRosliny;
    
SELECT distinct s.SkladnikRosliny AS "składnik rośliny"
FROM roslinyskladniki s
RIGHT JOIN Olejki o
	ON o.IDSkladnikaRosliny = s.IDSkladnikaRosliny;

-- ćw 36.
-- wyświetl nazwę oplejku, datę produkcji a w oddzielnych kolumnach miesiąc, ilość tygodni  od daty prdukcji do dnia dzisiajszego, ilość dni od daty produkcji do dnia dzisiejszego.

SELECT NazwaOlejku, DataProdukcji,
monthname(DataProdukcji) AS Miesiac,
FLOOR(datediff(Now(),DataProdukcji)/7) AS 'Ile tyg',
datediff(Now(), DataProdukcji) AS 'Ile dni'
FROM Olejki;

-- ćw 37.
-- wypisz nazwy olejków (duże litery), nazwę łacińską (małe litery), datę produkcji ale tylko dzień i miesiąc (w oddzielnych kolumnach)
SELECT UPPER(NazwaOlejku), LOWER(NazwaLacinska), DAY(DataProdukcji), MONTH(DataProdukcji)
FROM Olejki;

-- ćw 38.
-- wypisz nazwę olejku i datę produkcji z 2014
SELECT NazwaOlejku AS 'Nazwa', DATE(DataProdukcji) AS 'Data'
FROM olejki
WHERE DataProdukcji BETWEEN '2014-01-01' AND '2014-12-01';

-- ćw 39.
-- zlicz olejki które mają słodki zapach
SELECT COUNT(o.idolejku) AS "Ile słodkich olejków"
FROM Olejki o
	INNER JOIN olejkizapachy oz
		ON o.IDOlejku = oz.IDOlejku
	INNER JOIN zapachy z
		ON z.IDZapachu = oz.IDZapachu
WHERE Zapach = "Słodki";

-- ćw 40.
-- Ile w bazie jest olejków, dla których brak jest przypisanych zapachów
SELECT COUNT(*)  AS 'ilość bez opisu'
FROM olejki
	LEFT JOIN olejkizapachy
		ON olejki.IDOlejku = olejkizapachy.IDOlejku
	LEFT JOIN zapachy
		ON olejkizapachy.IDZapachu = zapachy.IDZapachu
WHERE Zapach IS NULL;

-- ćw 41.
-- Zlicz dla każdego zapchu ilość olejków wg ich zapachu. Dane wpisz tak żeby dane olejki o największej liczbie były wyświetlane jako pierwsze

-- ćw 42.
-- W przeciwieństwie do SQL SERVER można stosować group by (cyfra)
SELECT Zapach, COUNT(z.IDZapachu) AS 'Ilość olejków'
FROM olejki o
	INNER JOIN olejkizapachy oz
		ON o.IDOlejku = oz.IDOlejku
	INNER JOIN zapachy z
		ON oz.IDZapachu = z.IDZapachu
GROUP BY 1
ORDER BY 2 DESC;

-- ćw 43.
-- Oblicz przez ile zapachów opisany jest każdy z olejków
SELECT o.NazwaOlejku AS 'Nazwa olejku', COUNT(z.IDZapachu) AS 'Ile zapachów'
FROM Olejki o
	INNER JOIN olejkizapachy oz
		ON o.IDOlejku = oz.IDOlejku
	INNER JOIN zapachy z
		ON oz.IDZapachu = z.IDZapachu
GROUP BY 1
ORDER BY 2 DESC;

-- ćw 44.
-- Oblicz ile ostrzeżeń ma każdy z olejków
SELECT o.NazwaOlejku, COUNT(w.IDOstrzezenia)
FROM olejki o
	LEFT JOIN olejkiostrzezenia ow
		ON o.IDOlejku = ow.IDOlejku
	LEFT JOIN ostrzezenia w
		ON ow.IDOstrzezenia = w.IDOstrzezenia
GROUP BY 1;

-- ćw 45.
-- Oblicz, jaka jest średnia cena olejku dka każdej grupy olejków produkowanych z innych skłądników rośliny. Wynik zaokrąglij do 2 miejsc po przecinku.
SELECT rs.SkladnikRosliny AS Składnik, ROUND(AVG(oc.Cena),2) AS 'Średnia cena'
FROM olejki o
	INNER JOIN roslinyskladniki rs
		ON o.IDSkladnikaRosliny = rs.IDSkladnikaRosliny
	INNER JOIN olejkiceny oc
		ON o.IDOlejku = oc.IDOlejku
GROUP BY rs.SkladnikRosliny;

-- ćw 46.
-- Wypisz nazwy olejków wraz z ilością określeń w tabeli Charakterystyki, ale tylko te olejki które określono przynajmniej 6 wyrażeniami. Olejki posortuj tak aby te o najwyższej liczbie określeń były jako pierwsze, a jeśli są olejki o takiej samej liczbie charakterystyk, to posortuj je wewnątrz według alfabetu.
SELECT o.NazwaOlejku, COUNT(c.Charakterystyka)
FROM Olejki o
	INNER JOIN olejkicharakterystyki oc
		ON o.IDOlejku = oc.IDOlejku
	INNER JOIN charakterystyki c
		ON oc.IDCharakterystyki = c.IDCharakterystyki
GROUP BY 1
HAVING COUNT(c.Charakterystyka) >= 6
ORDER BY 2 DESC, 1 ASC;

-- ćw 47.
-- Wypisz te olejki, które mają dwa lub więcej ostrzeżeń
SELECT o.NazwaOlejku AS 'Nazwa olejku'
FROM Olejki o
	INNER JOIN olejkicharakterystyki oc
		ON o.IDOlejku = oc.IDOlejku
	INNER JOIN charakterystyki c
		ON oc.IDCharakterystyki = c.IDCharakterystyki
GROUP BY 1
HAVING COUNT(c.Charakterystyka) >= 2;

-- ćw 48.
-- Znajdz informacje o o najwyższym stężeniu olejków dla każdej grupy olejków produkowanych z innych składników roślinnych.
-- cast używamy aby nie nastąpiły błędy przy obliczaniu gdy działamy na kolumnach z typem danych float/double (chodzi o te małe przeskoki na n-tym miejscu po przecinku) może to być niebezpieczne zwłaszcza w banokosci gdy kwoty są wielokrotnie mnożone)

SELECT CAST(MAX(os.Stezenie) AS DECIMAL(3,2)) AS 'Maksymalne stężenie', rs.SkladnikRosliny AS 'Składnik rośliny'
FROM Olejki o
	INNER JOIN roslinyskladniki rs
		ON o.IDSkladnikaRosliny = rs.IDSkladnikaRosliny
	INNER JOIN olejkistezenia os
		ON o.IDOlejku = os.IDOlejku
GROUP BY 2;

-- ćw 49.
-- Oblicz jaka jest średnia cena olejków produkowanych z kwiatów i średnia cena olejków produkowanych z żywicy
SELECT ROUND(CAST(AVG(oc.Cena) AS DECIMAL(5,2)),2)
