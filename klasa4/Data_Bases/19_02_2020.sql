-- Perspektywy

CREATE OR REPLACE VIEW view0 AS
	SELECT
		o.IDOlejku,
        o.Nazwaolejku,
        rt.TypRosliny,
        rs.SkladnikRosliny,
        oc.Cena,
        oc.Objetosc_ml,
        oi.IloscOpakowan
	FROM
		Olejki o
			INNER JOIN
		RoslinyTypy rt ON o.IDTypuRosliny = rt.IDTypuRosliny
			INNER JOIN
		roslinyskladniki rs ON o.IDSkladnikaRosliny = rs.IDSkladnikaRosliny
			INNER JOIN
		olejkiceny oc ON o.IDOlejku = oc.IDOlejku
			INNER JOIN
		olejkiilosci oi ON o.IDOlejku = oi.IDOlejku;


-- 1. Stwórz widok w którym oprócz danych z zadania poprzedniego umieść jeszcze cenę olejku z 1ml cenę zaokronglij do dwóch miejsc po przecinku

USE olejki_mysql;

CREATE OR REPLACE VIEW view1 AS
	SELECT
		olejki.IDOlejku,
        olejki.Nazwaolejku,
        olejki.NazwaLacinska,
        olejki.DataProdukcji,
        roslinyskladniki.SkladnikRosliny,
        (CAST(olejkiCeny.cena / olejkiceny.Objetosc_ml AS DECIMAL (10,2))) AS 'cena za 1ml'
	FROM
		Olejki
			INNER JOIN
		RoslinyTypy ON olejki.IDTypuRosliny = roslinyTypy.IDTypuRosliny
			INNER JOIN
		roslinyskladniki ON olejki.IDSkladnikaRosliny = roslinyskladniki.IDSkladnikaRosliny
			INNER JOIN
		olejkiceny ON olejki.IDOlejku = olejkiceny.IDOlejku
			INNER JOIN
		olejkiilosci ON olejki.IDOlejku = olejkiilosci.IDOlejku;
			
SELECT * FROM view1;

-- 2. Stwórz widok obliczający wartość - cena*iloscopakowan - każdej grupy produkowanej z danego typu rosliny

CREATE OR REPLACE VIEW view2 AS
	SELECT
        roslinytypy.TypRosliny,
        SUM(olejkiilosci.iloscopakowan * Cena) AS 'wartosc'
	FROM
		olejki
			INNER JOIN
		olejkiilosci ON olejki.IDOlejku = olejkiilosci.IDOlejku
			INNER JOIN
		olejkiceny ON olejki.IDOlejku = olejkiceny.IDOlejku
			INNER JOIN
		roslinytypy ON olejki.IDTypuRosliny = roslinytypy.IDTypuRosliny
	GROUP BY TypRosliny;
    
-- lub tez
CREATE OR REPLACE VIEW view2a AS
	SELECT
        TypRosliny,
        SUM(iloscopakowan * Cena) AS 'wartosc'
	FROM
		view0
	GROUP BY TypRosliny;


SELECT * FROM view2;
SELECT * FROM view2a;

-- 3. stwórz widok pokazujący ile ml jest każde3go olejku, wynik posortuj nierosnąco
CREATE OR REPLACE VIEW view3 AS
	SELECT
		NazwaOlejku,
        (IloscOpakowan * Objetosc_ml) AS 'Ilosc w ml'
	FROM
		view0
        ORDER BY 2 DESC;
        
SELECT * FROM view3;

-- 4. Stwórz widok zawierający średnie ceny za 1 ml w każdej grupie składnika rośliny
-- error?
CREATE OR REPLACE VIEW view4 AS
	SELECT
		SkladnikRosliny,
        AVG('cena za 1ml'),
        CAST(AVG('cena za 1 ml') AS DECIMAL (10,2)) AS 'srednia cena'
	FROM
		view1
	GROUP BY SkladnikRosliny;

SELECT * FROM view1;
SELECT * FROM view4;

-- 5. Ztwórz widok pokazujący identyfikatory i nazwy olejków oraz prypisane im zapachy
CREATE OR REPLACE vIEW view5 AS
	SELECT
		o.IDOLejku,
        o.NazwaOlejku,
        z.Zapach
	FROM
		olejki o
	INNER JOIN
		olejkizapachy oz ON o.IDOlejku = oz.IDOlejku
	INNER JOIN
		zapachy z ON oz.IDZapachu = z.IDZapachu;
        
-- 6. korzystając z widoku view5 podlicz ile zapachów ma każdy olejek
CREATE OR REPLACE VIEW view6 AS
	SELECT
		IDOlejku, NazwaOlejku, Count(Zapach) AS 'ilosc zapachow'
	FROM
		view5
	GROUP BY IDOlejku, NazwaOlejku;
    
-- 7. korzystając z widoku view5 oblicz
CREATE OR REPLACE VIEW view7 AS
	SELECT
		Zapach,
        COUNT(IDOlejku) as "ilosc olejkow"
	FROM
		view5
	group by Zapach;
    
-- 8. Wypisz 3 najczęściej występujące zapachy
CREATE OR REPLACE VIEW view8 AS
	SELECT
		Zapach,
        Count(Zapach)
	FROM
		view5
	GROUP BY Zapach
    ORDER BY Count(Zapach) DESC
    Limit 3;
    
        
        
        