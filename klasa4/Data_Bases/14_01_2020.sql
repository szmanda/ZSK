-- indexsy i konta użytkowników

use firma;
show indexes from transak;



create database magazyn;

use magazyn;

create table pracownicy(
	id_pracownika INT NOT NULL PRIMARY KEY,
    nazwisko VARCHAR(20) NULL,
    imie VARCHAR(20) NULL
)ENGINE=InnoDB;

create table place(
	pensja DECIMAL(10,2) NOT NULL,
    dodatki DECIMAL(10,2) NULL,
    id_pracownika INT,
    INDEX place_FKindex1 (id_pracownika),
    CONSTRAINT place_FK1 FOREIGN KEY (id_pracownika)
	REFERENCES pracownicy(id_pracownika)
		ON UPDATE NO ACTION
        ON DELETE NO ACTION
)ENGINE=InnoDB;

create table magazyn(
	id_towaru INT NOT NULL PRIMARY KEY,
    nazwa VARCHAR(20) NULL,
    cena DECIMAL(10,2) NULL,
    liczba_sztuk INT NULL
)ENGINE=InnoDB;

-- konta użytkowników

SELECT * FROM MYSQL.USER;
DROP USER 'kadrowa'@'localhost';
DROP USER 'ksiegowa'@'localhost';
DROP USER 'magazynier'@'localhost';
DROP USER 'informatyk'@'localhost';
DROP USER 'prezes'@'localhost';

CREATE USER 'kadrowa'@'localhost' IDENTIFIED BY 'haslo';
GRANT ALL PRIVILEGES ON magazyn.pracownicy TO 'kadrowa'@'localhost';
GRANT SELECT ON magazyn.place TO 'kadrowa'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'kadrowa'@'localhost';

CREATE USER 'ksiegowa'@'localhost' IDENTIFIED BY 'haslo';
GRANT SELECT ON magazyn.pracownicy TO 'ksiegowa'@'localhost';
GRANT ALL PRIVILEGES ON magazyn.place TO 'ksiegowa'@'localhost';
GRANT SELECT ON magazyn.magazyn TO 'ksiegowa'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'magazynier'@'localhost' IDENTIFIED BY 'haslo';
GRANT ALL PRIVILEGES ON magazyn.magazyn TO 'magazynier'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'informatyk'@'localhost' IDENTIFIED BY 'haslo';
GRANT ALL PRIVILEGES ON magazyn.* TO 'informatyk'@'localhost'
WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'prezes'@'localhost' IDENTIFIED BY 'haslo';
GRANT SELECT ON magazyn.* TO 'prezes'@'localhost';
FLUSH PRIVILEGES;


