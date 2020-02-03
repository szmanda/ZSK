USE Olejki_mysql;

-- ćw 1
-- Wyświetl nazwy olejków, które mają chociaż jedno ostrzeżenie takie samo jako olejek róża
SELECT NazwaOlejku
FROM olejki
WHERE NazwaOlejku <> 'róża' AND IDOlejku IN (
	SELECT IDOlejku
	FROM OlejkiOstrzezenia
	WHERE IDOstrzezenia IN (
		SELECT oo.IDOstrzezenia
		FROM Olejki o
			INNER JOIN olejkiostrzezenia oo
				ON o.IDOlejku = oo.IDOlejku
		WHERE o.NazwaOlejku = 'róża'
	)
);

-- ćw 2
-- Wyświetl nazwy tych olejków, których cena za oparkowanie, jest większa niż średnia cena olejków produkowanych z typów rośliny - drzewo Wynik posortuj wg nazwy olejku
SELECT NazwaOlejku
FROM olejki
WHERE IDOlejku IN (
    SELECT IDOlejku
    FROM OlejkiCeny
    WHERE Cena > (
		SELECT AVG(Cena)
		FROM OlejkiCeny
		WHERE IDOlejku IN (
			SELECT IDOlejku
			FROM Olejki
			WHERE IDTypuRosliny = (
				SELECT IDTypuRosliny
				FROM roslinytypy
				WHERE TypRosliny = 'drzewo'
			)
		)
	)
)

-- ćw 3
-- Wyświetl nazwy tych olejków które mają najwięcej ostrzezen
SELECT IDOlejku
FROM olejkiostrzezenia
GROUP BY 1
HAVING Count(IDOstrzezenia) = (
	SELECT COUNT(IDOstrzezenia)
	FROM OlejkiOstrzezenia
	GROUP BY IDOlejku
	ORDER BY 1 DESC
	LIMIT 1
)


-- ćw 4
-- Wyświetl nazwy tych olejków które są opisane taką samą ilością zapachów co olejek pieprz czarny
SELECT nazwaolejku
FROM olejki
WHERE nazwaolejku <> 'pieprz czarny' AND idolejku IN (
    SELECT idolejku
    FROM olejkizapachy
    GROUP BY 1
    HAVING COUNT(idzapachu) = (
        SELECT COUNT(idzapachu)
        FROM olejkizapachy
        WHERE idolejku = (
            SELECT idolejku
			FROM olejki
			WHERE nazwaolejku = 'pieprz czarny'
		)
	)
)

-- ćw 5
-- Olejki których jest przynajmniej tyle co olejków  Imbir (Ilość opakowań)
SELECT NazwaOlejku
FROM Olejki
WHERE IDOlejku IN (
    SELECT IDOlejku
    FROM olejkiilosci
    WHERE IloscOpakowan >= (
        SELECT IloscOpakowan
        FROM olejkiilosci
        WHERE IDOlejku = (
            SELECT IDOlejku
			FROM Olejki
			WHERE NazwaOlejku = 'imbir'
		)
	)
)

-- ćw 6
-- Olejki, które mają przynajmniej tyle zapachów co olejek Paczula
SELECT NazwaOlejku
FROM olejki
WHERE NazwaOlejku <> 'paczula' AND IDOlejku IN (
	SELECT IDOlejku
    FROM olejkizapachy
    GROUP BY 1
    HAVING COUNT(IDOlejku) >= ( 
        SELECT COUNT(IDZapachu)
        FROM olejkizapachy
        WHERE IDOlejku = (
            SELECT IDOlejku
			FROM Olejki
			WHERE NazwaOlejku = 'paczula'
		)
	)
)
-- ćw 7
-- Olejki o cena za mililitr powyżej średniej
SELECT IDOlejku
FROM olejkiceny
HAVING CAST(AVG(Cena/Objetosc_ml) AS DECIMAL (5,3)) > (
    SELECT CAST(AVG(Cena/Objetosc_ml) AS DECIMAL (5,3))
	FROM olejkiceny
)
-- ćw 8
-- Olejki których ilpość opakowań jest większa od średniej


-- EXISTS (NOT EXISTS)
-- podzapytania z exists nie wymagają joinów

-- Typy roślin, z których nie są produkowane żadne olejki
SELECT TypRosliny
FROM roslinytypy
WHERE NOT EXISTS (
	SELECT IDTypuRosliny
    FROM Olejki
    WHERE roslinytypy.IDTypuRosliny = olejki.IDTypuRosliny
);

