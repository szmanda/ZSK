USE Olejki_mysql;

-- ćw 9
-- Podaj te składniki roślin z których nie są produkowane żadne olejki
SELECT SkladnikRosliny
FROM roslinyskladniki
WHERE NOT EXISTS (
	SELECT IDSkladnikaRosliny
    FROM olejki
    WHERE olejki.IDSkladnikaRosliny = roslinyskladniki.IDSkladnikaRosliny
)

-- cw 10
-- Wyświetl nazswy olejków i ich identyfikatory, jeżeli mają ostrzeżenia
SELECT NazwaOlejku, IDOlejku
FROM olejki
WHERE EXISTS (
	SELECT IDOlejku
    FROM olejkiostrzezenia
    WHERE olejkiostrzezenia.IDOlejku = olejki.IDOlejku
)

USE northwind_mysql;


-- ćw 11
-- Zwróć listę pracowników (imie, nazwisko, id) którzy obsłużyli zamówienia i dniu 1/1/1014
SELECT FirstName, LastName, EmployeeID
FROM employees e
WHERE EXISTS(
	SELECT *
    FROM orders o
    WHERE 
		e.EmployeeID = o.EmployeeID
		AND OrderDate = "2014-1-1"
)

-- z join
SELECT DISTINCT e.FirstName, e.LastName, e.EmployeeID
FROM employees e
INNER JOIN orders o
	ON e.EmployeeID = o.EmployeeID
WHERE OrderDate = "2014-1-1";

-- bez join i exists
SELECT FirstName, LastName, EmployeeID
FROM employees e
WHERE EmployeeID IN (
	SELECT EmployeeID
    FROM orders o
    WHERE OrderDate = "2014-1-1"
)


-- cw 12
-- Wyświetl liczbę dostawców którzy w ofercie zapewniają towary o cenie poniżej 20
SELECT COUNT(SupplierID) AS "liczba dostawców"
FROM dbo_suppliers
WHERE EXISTS(
	SELECT *
    FROM products
    WHERE dbo_suppliers.SupplierID = products.SupplierID
		AND products.UnitPrice < 20
)
-- cw 22
-- wyswietl listę dostawców którzy w ofercie zapewniają towary o cenie równej 22

/* Funkcja LTRIM() usuwa z ciągu znaków wiodące spacje
Funkcja RTRIM() usuwa z ciągu kończące spacje
Funkcja TRIM() usuwa zarówno wiodoące jak i kończące */
SELECT LTRIM("   nos wujka") AS raz, RTRIM("nos cioci     ") AS dwa, TRIM("   nos babci   ") AS trzy;

-- Funkcja REPLACE() zwraca poprawiony string z zamieniomnnym jednym fragmentem ciągu na inny:
SELECT REPLACE("Kierownik niech nam żyje", "żyje", "zginie") AS WIWAT; 

-- W  Wyniku działanie a funkcji substr() zostanie zwrócony fragment stringu rozpoczynający sie od drugiego arg, długości określonej trzecim arg
SELECT SUBSTR(REPLACE("Kierownik niech nam żyje", "żyje", "zginie"), 4,10) AS substr;

/* Funkcja CONCAT() zwraca połączenie dowolnej ilości ciągów znaków
Funkcja SPACE() zwraca określoną argumentem ilość spacji */

USE Olejki_mysql;
SELECT CONCAT(NazwaOlejku, SPACE(20), NazwaLacinska) AS cos
FROM olejki;

-- funkcja LENGTH() jako wynik zwraca długość ciągu znaków podanego jako parametr jej wywołania, dla wartości null zwraca null
SELECT NazwaOlejku, LENGTH(NazwaOlejku)
FROM OLEJKI
WHERE LENGTH(NazwaOlejku) = 5;

-- funkcja FORMAT()
SELECT Cena, FORMAT(Cena,1)
FROM olejkiceny

-- funkcje CURDATE(), CURTIME(), NOW(), DATE_ADD(), DAYNAME(), MONTHNAME(), DATEDIFF()
-- funkcje CAST(), ROUND()