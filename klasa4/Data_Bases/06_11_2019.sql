USE northwind_mysql;

-- zad 1
-- Wypisz imiona, nazwiska oraz wiek pracowników, dane posortuj malejąco wg nazwiska potem rosnąco wg wieku

-- z użyciem NOW() - zawiera datę i godzine
SELECT LastName AS 'Nazwisko', FirstName AS 'Imie',
FLOOR(DATEDIFF(NOW(), BirthDate)/365) AS 'Wiek'
FROM employees
ORDER BY 1 DESC, 3 ASC;

-- z użyciem CURDATE() - tylko data
SELECT LastName AS 'Nazwisko', FirstName AS 'Imie',
FLOOR(DATEDIFF(CURDATE(), BirthDate)/365) AS 'Wiek'
FROM employees
ORDER BY 1 DESC, 3 ASC;

-- z TIMESTAMPDIFF() - z ustawieniem interwqału
SELECT LastName AS 'Nazwisko', FirstName AS 'Imie',
TIMESTAMPDIFF(YEAR, Birthdate, CURDATE()) AS 'Wiek'
FROM employees
ORDER BY 1 DESC, 3 ASC;


-- zad 2
-- Wypisz nazwiska, imiona oraz ilość przepracowanych lat w firmie - pracowników najdłużej zatrudnionych

-- z DATEDIFF i FLOOR
SELECT
	(FLOOR(DATEDIFF(CURDATE(),HireDate)/365)) AS 'ilość przepracowanych lat',
	FirstName AS 'imie',
	LastName AS 'nazwisko'
FROM employees
ORDER BY 1 DESC
LIMIT 5;

-- z DATEDIFF i ROUND
SELECT
	(ROUND((DATEDIFF(CURDATE(),HireDate)/365)-0.5,0)) AS 'ilość przepracowanych lat',
	FirstName AS 'imie',
	LastName AS 'nazwisko'
FROM employees
ORDER BY 1 DESC
LIMIT 5;

-- z TIMESTAMPDIFF()
SELECT
	TIMESTAMPDIFF(YEAR, HireDate, CURDATE()) AS 'ilość przpracowanych lat',
	FirstName AS 'imie',
	LastName AS 'nazwisko'
FROM employees
ORDER BY 1 DESC
LIMIT 5;

-- zad 3
-- Oblicz jaki jest średni wiek pracowników
-- z curdate(), bez datediff/timestamp
SELECT FLOOR(AVG(Year(CURDATE())-Year(BirthDate))) AS 'Średni wiek'
FROM employees;
-- z now()
SELECT FLOOR(AVG(Year(NOW())-Year(BirthDate))) AS 'Średni wiek'
FROM employees;
-- z tmiestampdiff i floor
SELECT FLOOR(AVG(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()))) AS 'Średni wiek'
FROM employees;
-- z timestamp i floor
SELECT FLOOR(AVG(DATEDIFF(CURDATE(),BirthDate)/365)-0.5) AS 'Średni wiek'
FROM employees;


-- zad 4
-- Wykonaj zestawienie, które pokaże jak obroty (wartości zamówień) przedstawiają się w poszczególnych latach
SELECT YEAR(OrderDate) AS 'Rok', Round(Sum(UnitPrice*Quantity),2) AS 'Wartość'
FROM Orders o
INNER JOIN `Order Details` d ON o.OrderID = d.OrderID
GROUP BY Year(OrderDate)
ORDER BY 1;

-- zad 5
-- W których miesiącach realizuje się najwięcej zamówień?
-- z MonthName()
SELECT
	MonthName(OrderDate) AS 'Miesiąc',
	Count(*) 'Ilość zamówień'
FROM Orders
GROUP BY Month(OrderDate)
ORDER BY 2 DESC
LIMIT 1;

-- zad 6 (rollup)
-- Wykoanj zestawienie, które pokazuje jak w poszczególnych latach i miesiącach roskłada sie liczba zamówień. Na zestawieniu oprócz ilości za miesiące pokaż rówież ilości na całe lata
SELECT
	Year(OrderDate) AS Rok,
    Month(OrderDate) AS Miesiac,
    Count(*) 'Ilość zamówień'
FROM orders
GROUP BY 2
WITH ROLLUP;

-- zad 7
-- Wyświetl raport sprzedaży za 2013r. Wez pod uwagę rok, miesiac i łączną sprzedaż oraz podsumowanie roku 2013.
SELECT
	Year(o.OrderDate) AS Rok,
    MonthName(o.OrderDate) AS Miesiac,
    ROUND (SUM(od.unitprice *od.quantity),2) AS Sprzedaż
FROM orders o
	INNER JOIN `order details` od
		ON o.OrderID = od.OrderID
WHERE Year(OrderDate) = 2013 
GROUP BY 2
WITH ROLLUP;

-- zad 8
-- Dla każdego stanowiska oblicz średni wiek jego pracowników
SELECT
	Title AS 'Stanowisko',
	ROUND(AVG(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE())), 2) AS 'Średnia dla stanowiska'
FROM employees
GROUP BY Title;

-- zad 9
-- modyfikowanie czasu: Stwórz tabele wg wzoru i zmień typ danych z tmiestamp na datetime

CREATE TABLE test(
str VARCHAR(32),
ts TIMESTAMP DEFAULT current_timestamp
);

SELECT NOW()
CREATE DATABASE TEST111;
USE TEAT111;
CREATE TABLE test(
str VARCHAR(32),
ts TIMESTAMP DEFAULT current_timestamp
);
describe TEST
ALTER TABLE test
MODIFY ts DATETIME DEFAULT NOW()