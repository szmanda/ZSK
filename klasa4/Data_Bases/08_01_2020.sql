create database muzyka_ms
character set utf8
collate utf8_general_ci;

use muzyka_ms;

create table Panstwa(
	IdPanstwa VARCHAR(3),
    Nazwa VARCHAR(20) NOT NULL,
    PRIMARY KEY (IdPanstwa)
)ENGINE=InnoDB;

INSERT INTO Panstwa (IdPanstwa,Nazwa)
values
	('PL','Polska'),
	('USA','Stany Zjednoczone'),
    ('IR','Irlandia'),
    ('FR','Francja'),
    ('WB','Wielka Brytania');

SELECT * FROM Panstwa;

create table Wykonawcy(
	IdWykonawcy CHAR(3),
    Nazwisko varchar(25) NULL,
    Imie varchar(10) NULL,
    Pseudonim varchar(10) NULL,
    Pochodzenie varchar(3) NOT NULL,
    PRIMARY KEY (IdWykonawcy),
    FOREIGN KEY (Pochodzenie)
		REFERENCES Panstwa(IdPanstwa)
			on update cascade
)ENGINE=InnoDB;

INSERT INTO Wykonawcy
values
	('W01','','','U2','IR'),
	('W02','Kasia','Kowalska','','PL'),
	('W03','Miles','Davis','','USA');

create table Muzyka_rodzaje(
	IdRodzaju VARCHAR(3),
    Rodzaj VARCHAR(10) NOT NULL,
    PRIMARY KEY (IdRodzaju)
)ENGINE=InnoDB;

INSERT into Muzyka_rodzaje
values
	('J','Jazz'),
	('R','Rock'),
	('P','Pop');

create table Plyty(
	IdPlyty CHAR(5),
    Tytul VARCHAR(35) NOT NULL,
    ROK INT(4) NULL,
    IdRodzaju VARCHAR(3) NOT NULL,
    primary key (IdPlyty),
    foreign key (IdRodzaju)
		references Muzyka_rodzaje(IdRodzaju)
)ENGINE=InnoDB;

insert into Plyty
values
	('P0001','Seven steps to heaven',1963,'J'),
	('P0002','Love songs',1999,'J'),
	('P0003','Achtung baby',NULL,'R');

create table Plyty_wykonawcy(
	IdPlyty CHAR(5) NULL,
    IDWykonawcy CHAR(3) NULL,
    foreign key (IdPlyty) REFERENCES Plyty(IdPlyty),
    foreign key (IdWykonawcy) REFERENCES Wykonawcy(IdWykonawcy)
)ENGINE=InnoDB;

INSERT INTO Wykonawcy
values
	('W04','Ella','Frizgerald','','USA'),
	('W05','Louis','Armstrong','','USA');

insert into Plyty
values
	('P0004','Ella i Louis Again',2003,'J');

insert into Plyty_wykonawcy
values
	('P0004','W03'),
	('P0004','W04');

ALTER TABLE Wykonawcy
ADD column Kto CHAR(1) CHECK (Kto IN('K','M','Z'));

Select * from wykonawcy;
insert into wykonawcy(IdWykonawcy,Kto)
values
	('Z'),
	('K'),
	('M'),
	('K'),
	('M');
    
update wykonawcy
set Kto = ('Z')
where IdWykonawcy IN('W01');

update wykonawcy
set Kto = ('K')
where IdWykonawcy IN('W02','W04');

update wykonawcy
set Kto = ('M')
where IdWykonawcy IN('W03','W05');

select * from wykonawcy;

ALTER TABLE Plyty
ADD column Cena DECIMAL(5,2);

