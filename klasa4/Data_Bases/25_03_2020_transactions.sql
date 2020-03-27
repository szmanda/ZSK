
USE bank;

ALTER TABLE bank_klienci ENGINE=InnoDB;
ALTER TABLE bank_konta ENGINE=InnoDB;

-- TRANSACTIONS: (InnoDB)
-- START TRANSACTION - rozpoczyna transakcję
-- COMMIT - zatwierdza zmiany
-- ROLLBACK - wycofuje zmiany

-- 3. Utwórz widok (Bank_widok), który uwzględni osoby z saldem 1000 lub 
-- mniejszym oraz tych z saldem 10000 lub większym.

CREATE OR REPLACE VIEW Bank_widok AS
SELECT kl.id, kl.imie, kl.nazwisko, ko.saldo
FROM bank_klienci kl INNER JOIN bank_konta ko
ON kl.id = ko.id
WHERE ko.saldo >=10000;

-- 4. Utwórz transakcję, w której klient o ID 3 przeleje klientowi o ID 7 
-- kwotę 1450zł. Odwołaj transakcję.

START TRANSACTION;
BEGIN;
UPDATE Bank_konta SET saldo = saldo - 1450 WHERE id = 3;
UPDATE Bank_konta SET saldo = saldo + 1450 WHERE id = 7;
ROLLBACK;

-- 5. Utwórz transakcję, w której klient o ID 6 przeleje 
-- klientowi o ID 5 kwotę 220zł. Potwierdź transakcję.

START TRANSACTION;
BEGIN;
UPDATE Bank_konta SET saldo = saldo - 220 WHERE id = 6;
UPDATE Bank_konta SET saldo = saldo + 220 WHERE id = 5;
COMMIT;

-- 6. Dodaj kolejnego klienta – Wu X’ian z saldem 31500. 
-- Miasto – Paris, nr konta: 25025536548520147930286057.

INSERT INTO bank_klienci(Imie,Nazwisko,Miasto) VALUES
('Wu','X’ian','Paris');

INSERT INTO bank_konta(id,nrKonta,Saldo) VALUES
((SELECT id FROM bank_klienci WHERE Nazwisko = 'X’ian'),'25025536548520147930286057',31500);

