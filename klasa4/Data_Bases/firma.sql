DROP DATABASE firma;
 
CREATE DATABASE firma;
 
USE firma;
 
CREATE TABLE dostawcy(
id_dostaw        char(4) not null primary key,
dostawca         char(30),
adres1           char(30),
adres2           char(30),
miasto           char(20),
stan             char(2),
kod              char(10),
telefon          char(13),
kontakt          char(30),
tel_wewn         char(4),
warunki          char(10),
rabat            double
);
 
INSERT INTO dostawcy VALUES
("1000","DYNAMITE INDUSTRIES",      "54 N. MAIN",           NULL,       "Sacramento",       "CA",   "46002",    "(916)555-3000",    "P. MORGAN, SR.",   NULL,   "NET 15",   0.00),
("1005","ACME ENTERPRISES",     "1424 LAKESIDE",        "SUITE 1200",   "Modesto",      "AZ",   "96002",    "(209)555-1000",    "KIRK PETERS",      "909",  "NET 30",   0.00),
("2000","DEPENDO INDUSTRIES",       "33 S.W. SWINGLE BLVD.",    "SUITE 4403",   "Sacramento",       "CA",   "46004",    "(916)555-5400",    "T.D. KIMBLE",      "0300", "NET 30",   0.00),
("2100","EXECUTIVE ENTERPRISES",    "2204 MOONGLOW LANE",       "SUITE 4055",   "San Francisco",    "AZ",   "55032",    "(415)555-2000",    "JIM SMITHSON",     "1500", "NET 30",   0.00),
("3000","SOUTHERN SALES LTD.",      "9904 ELM STREET",      NULL,       "San Diego",        "CA",   "40444",    "(619)555-5100",    "TIM DAVIDSON",     "0200", "NET 30",   0.00),
("5000","KIRK ENTERPRISES",     "2001 JUPITER LANE",        "SUITE 1701",   "San Francisco",    "CA",   "55032",    "(415)555-7000",    "KIRK BARRETT",     "0007", "NET 30",   5.00),
("5500","FASTWARE FURNITURE MFG.",  "6602 CROW STREET",     "SUITE 331",    "San Diego",        "AZ",   "40347",    "(619)555-4400",    "DAVID SOUP",       "0300", "NET 15",   5.00),
("8000","HARVARD FURNITURE MFG.",   "47663 TRAMWAY",        "SUITE 4",  "San Diego",        "CA",   "40345",    "(619)555-5620",    "DAVID SAMSON",     "4501", "NET 15",   5.00);
 
CREATE TABLE towary(
id_towaru        char(10) not null primary key,
data_zamow       date,
nazwa            char(30),
opis             char(30),
czas_realizacji  double,
cena             double,
il_do_zam        double,
il_na_stan       double,
id_dostaw        char(4),
nie_kontyn       char(1),
koszt            double,
komentarz        blob
);
 
INSERT INTO towary VALUES
("C-111-6000", NULL, "KRZESLO BIUROWE",         "SKORA-BRZ-WYSOKIE OPARCIE",        45.00, 2000.00, 3.00,  5.00,  "1000", 0, 1200.00, NULL),
("C-111-6015", NULL, "SOFA-1.80 m",         "WELWET-SZARA-FRANCUSKA",       45.00, 1250.00, 1.00,  3.00,  "1005", 0, 650.00,  NULL),
("C-111-6045", NULL, "SOFA-1.80 m",         "WELWET-NIEBIESKA-FRANCUSKA",       45.00, 1400.00, 1.00,  1.00,  "1005", 0, 1000.00, NULL),
("C-111-8000", NULL, "SOFA-2.40 m",         "SKORA-BRZ-WYSOKIE OPARCIE",        45.00, 2300.00, 1.00,  2.00,  "1000", 0, 1500.00, NULL),
("C-111-8045", NULL, "SOFA-2.40 m",         "WELWET-NIEBIESKA-FRANCUSKA",       45.00, 1500.00, 1.00,  1.00,  "1005", 1, 1200.00, NULL),
("C-222-1000", NULL, "KRZESLO BIUROWE",         "SKORA-BRZ-WYSOKIE OPARCIE",        60.00, 1750.00, 2.00,  2.00,  "2000", 0, 1250.00, NULL),
("C-222-1001", NULL, "KRZESLO BIUROWE",         "SKORA-BRZ",                60.00, 1750.00, 2.00,  4.00,  "2000", 0, 1000.00, NULL),
("C-222-2000", NULL, "KRZESLO BIUROWE",         "PLASTIK-CZARNE-WYSOKIE OPARCIE",   60.00, 1300.00, 2.00,  2.00,  "2100", 0, 900.00,  NULL),
("C-222-2010", NULL, "KRZESLO BIUROWE",         "PLASTIK-BRZ-WYSOKIE OPARCIE",      60.00, 1300.00, 2.00,  3.00,  "2100", 0, 900.00,  NULL),
("C-222-2020", NULL, "KRZESLO BIUROWE",         "PLASTIK-SZARE-WYSOKIE OPARCIE",    60.00, 1300.00, 2.00,  1.00,  "2100", 0, 900.00,  NULL),
("C-222-3000", NULL, "KRZESLO",             "PLASTIK-CZARNE",           60.00, 500.00,  4.00,  4.00,  "2100", 0, 350.00,  NULL),
("C-222-3010", NULL, "KRZESLO",             "PLASTIK-BRZ",              60.00, 500.00,  4.00,  5.00,  "2100", 0, 350.00,  NULL),
("C-222-3020", NULL, "KRZESLO",             "PLASTIK-SZARE",            60.00, 500.00,  4.00,  2.00,  "2100", 0, 350.00,  NULL),
("C-300-2020", NULL, "STOLIK",              "DREWNO-TEKOWE-2 POLKI",        45.00, 250.00,  4.00,  5.00,  "8000", 0, 125.00,  NULL),
("C-300-2040", NULL, "BIBLIOTECZKA",            "DREWNO-DAB-2 POLKI",           45.00, 325.00,  4.00,  7.00,  "8000", 0, 175.00,  NULL),
("C-300-4000", NULL, "BIBLIOTECZKA",            "DREWNO-DAB-4 POLKI",           45.00, 550.00,  4.00,  12.00, "8000", 0, 350.00,  NULL),
("C-300-4010", NULL, "BIBLIOTECZKA",            "DREWNO-TEKOWE-4 POLKI",        45.00, 500.00,  4.00,  10.00, "8000", 0, 300.00,  NULL),
("C-400-2060", NULL, "STOLIK",              "DREWNO-DAB-30 X 60 CM",        45.00, 375.00,  12.00, 8.00,  "3000", 0, 250.00,  NULL),
("C-400-2080", NULL, "STOLIK",              "SZKLO/MOSIADZ-30 X 60 CM",     45.00, 250.00,  12.00, 4.00,  "3000", 0, 175.00,  NULL),
("C-400-5000", NULL, "STOLIK DO KAWY",          "SZKLO/MOSIADZ - 0.5 M2-OWAL",      30.00, 875.00,  4.00,  1.00,  "3000", 0, 500.00,  NULL),
("C-400-5020", NULL, "STOLIK DO KAWY",          "SZKLO/MOSIADZ-0.5 M2-PROSTOKAT",   30.00, 85.00,   4.00,  3.00,  "3000", 0, 500.00,  NULL),
("C-400-5050", NULL, "STOLIK DO KAWY",          "DREWNO-0.5 M2-PROSTOKAT",      45.00, 875.00,  4.00,  5.00,  "3000", 0, 650.00,  NULL),
("C-500-6000", NULL, "LAMPA STOJACA",           "MOSIADZ-0.55 M2-ART DECO",     45.00, 250.00,  2.00,  2.00,  "5000", 0, 150.00,  NULL),
("C-500-6050", NULL, "LAMPA STOJACA",           "MOSIADZ-0.55 M2-ANGIELSKI",        45.00, 275.00,  2.00,  1.00,  "5000", 0, 165.00,  NULL),
("C-600-5000", NULL, "BIURKO PRACOWNICZE-1.50 M",   "DREWNO-DB-FANTAZYJNY",         60.00, 2250.00, 4.00,  3.00,  "5500", 0, 1500.00, NULL),
("C-600-5050", NULL, "BIURKO SEKRETARKI -1.50 M",   "DREWNO-DB-FANTAZYJNY",         60.00, 1100.00, 4.00,  6.00,  "5500", 0, 850.00,  NULL),
("C-600-6020", NULL, "BIURKO PRACOWNICZE-1.80 M",   "DREWNO-DB-FANTAZYJNY",         60.00, 2450.00, 4.00,  4.00,  "5500", 0, 1750.00, NULL),
("C-600-6050", NULL, "BIURKO SEKRETARKI -1.80 M",   "DREWNO-DB-FANTAZYJNY",         60.00, 1350.00, 4.00,  4.00,  "5500", 0, 975.00,  NULL),
("C-700-2020", NULL, "SZAFKA NA DOKUMENTY-2 SZUFLADY",  "METAL-BRAZ",               60.00, 100.00,  2.00,  4.00,  "5500", 0, 75.00,   NULL),
("C-700-2030", NULL, "SZAFKA NA DOKUMENTY-2 SZUFLADY",  "METAL-CZARNA",             60.00, 100.00,  2.00,  5.00,  "5500", 0, 75.00,   NULL),
("C-700-4000", NULL, "SZAFKA NA DOKUMENTY-4 SZUFLADY",  "DREWNO-DAB-FANTAZYJNY",        60.00, 400.00,  2.00,  10.00, "5500", 0, 250.00,  NULL),
("C-700-4020", NULL, "SZAFKA NA DOKUMENTY-4 SZUFLADY",  "METAL-BRAZ",               60.00, 150.00,  2.00,  15.00, "5500", 0, 100.00,  NULL),
("C-700-4030", NULL, "SZAFKA NA DOKUMENTY-4 SZUFLADY",  "METAL-CZARNY",             60.00, 150.00,  2.00,  20.00, "5500", 0, 100.00,  NULL);
 
CREATE TABLE personel(
nazwisko        char(15) not null,
imie            char(10) not null,
inicjal         char(1),
dzial           char(15),
id_pracown      char(11) not null primary key,
telefon         char(13),
specjaln        char(11),
uwagi           char(40),
nagrody         char(15),
data_zatr       date,
stopien         char(3),
zwolniony       char(1),
pelny_etat      char(1),
wydajnosc       double,
wskaznik        double,
pensja          double,
stanowisko      char(15),
staz            double,
adres1          char(20),
adres2          char(20),
miasto          char(14),
stan            char(2),
kod             char(10)
);
 
INSERT INTO personel VALUES
("Montovan",    "John",     "U", "ZBYT",        "001-02-0003", "(617)555-3403", "HANDEL",   NULL, NULL,         '1986-9-9', NULL,   0, 0, 5.00, 0.00,   2770.00, "SPRZEDAWCA",  5.00,   "1034 Lorraine St.",    NULL,       "Boston",   "MA", "02201"),
("Loftus",  "Kathy",    "I", "ZBYT",        "001-02-3333", "(615)555-6331", "HANDEL",   NULL, NULL,         '1985-5-5', NULL,   1, 1, 5.00, 0.00,   2770.00, "SPRZEDAWCA",  3.00,   "40555 Brentwood",  NULL,       "Nashville",    "TN", "37201"),
("London",  "Eric",     "S", "ZBYT",        "001-20-3033", "(612)555-4336", "HANDEL",   NULL, NULL,         '1985-6-12',    NULL,   0, 1, 5.00, 20.00,  2770.00, "SPRZEDAWCA",  1.00,   "2015 Edmonton",    "Apt 120",  "Minneapolis",  "MN", "55415"),
("Drendon", "Kelly",    "A", "ZBYT",        "001-22-3333", "(805)555-8674", "HANDEL",   NULL, NULL,         '1981-8-8', NULL,   0, 0, 5.00, 15.00,  2770.00, "SPRZEDAWCA",  3.00,   "12508 Robin Hood Ln.", "Apt. 3303",    "Santa Barbara","CA", "93103"),
("Lisbonn", "Rick",     "R", "ZBYT",        "001-22-3334", "(609)555-3344", "HANDEL",   NULL, NULL,         '1986-12-13',   NULL,   0, 0, 5.00, 20.00,  2770.00, "SPRZEDAWCA",  3.00,   "1550 Keystone St.",    NULL,       "Atlantic City","NJ", "08401"),
("Kotky",   "Linda",    "J", "ZBYT",        "010-20-0333", "(716)555-1100", "HANDEL",   NULL, NULL,         '1985-3-5', NULL,   0, 0, 5.00, 0.00,   2770.00, "SPRZEDAWCA",  4.00,   "6300 Canoga Ave.", NULL,       "Buffalo",  "NY", "14204"),
("Long",    "Chuck",    "E", "ZBYT",        "100-22-3333", "(602)555-6630", "NADZOR",   NULL, NULL,         '1983-8-18',    NULL,   1, 1, 4.00, 0.00,   3180.00, "SPRZEDAWCA",  3.00,   "40677 Misty Isle Dr.", NULL,       "Tucson",   "AZ", "85745"),
("Larson",  "Jill",     "O", "ZBYT",        "101-02-3303", "(402)555-9974", "HANDEL",   NULL, NULL,         '1986-2-1', NULL,   0, 0, 5.00, 0.00,   2770.00, "SPRZEDAWCA",  1.00,   "13044 Etiwanda",   "Suite 3",  "Lincoln",  "NE", "68506"),
("Lucas",   "John",     "M", "ZBYT",        "101-20-3003", "(919)555-5842", "HANDEL",   NULL, NULL,         '1982-8-9', NULL,   0, 0, 5.00, 0.00,   2770.00, "SPRZEDAWCA",  2.00,   "1240 Victory Blvd.",   NULL,       "Durham",   "NC", "27701"),
("Kaufman", "Lisa",     "C", "ZBYT",        "110-02-3030", "(312)555-0300", "HANDEL",   NULL, NULL,         '1983-11-1',    NULL,   1, 1, 5.00, 0.00,   2350.00, "SPRZEDAWCA",  4.00,   "1960 Lindley Ave.",    NULL,       "Chicago",  "IL", "60680"),
("Keegan",  "Keith",    "S", "ZBYT",        "110-20-0303", "(213)555-5922", "HANDEL",   NULL, NULL,         '1981-9-11',    "RD",   1, 1, 5.00, 0.00,   3180.00, "SPRZEDAWCA",  3.00,   "6045 Vineland Blvd.",  "Apt. 1201",    "Hollywood",    "CA", "90028"),
("Sanders", "Kathy",    "O", "ZBYT",        "111-11-2222", "(206)555-5800", "NADZOR",   NULL, NULL,         '1986-3-23',    NULL,   1, 1, 6.00, 5.00,   4850.00, "DYREKTOR",    9.00,   "1202 N. Pacific Ave.", NULL,       "Seattle",  "WA", "98102"),
("Michaels",    "Ellen",    "V", "ZBYT",        "111-11-3333", "(215)555-0912", "NADZOR",   NULL, NULL,         '1986-3-17',    NULL,   1, 1, 4.00, 0.00,   3180.00, "SPRZEDAWCA",  4.00,   "18088 Westbrook",  "Suite 100",    "Philadelphia", "PA", "19104"),
("Orlando", "John",     "S", "ZBYT",        "111-22-3333", "(305)555-7647", "HANDEL",   NULL, NULL,         '1986-4-24',    NULL,   1, 1, 5.00, 0.00,   2930.00, "SPRZEDAWCA",  6.00,   "899 Kenwood St.",  NULL,       "N.Bay Village","FL", "33141"),
("Eivera",  "Harry",    "E", "ADMINISTRACJA",   "111-22-3777", "(213)555-3232", "ZARZADZANIE",  NULL, NULL,         '1982-10-10',   NULL,   1, 1, 2.00, 0.00,   980.00,  "URZENIK", 3.00,   "7010 Balcom Ave.", NULL,       "El Segundo",   "CA", "90245"),
("Egan",    "Michelle", "P", "ZBYT",        "111-22-5555", "(303)555-7337", "HANDEL",   NULL, NULL,         '1981-7-7', NULL,   1, 1, 5.00, 25.00,  2770.00, "SPRZEDAWCA",  3.00,   "5670 Colorado Blvd.",  NULL,       "Denver",   "CO", "80249"),
("Gilbert", "Chuck",    "H", "ZBYT",        "111-22-6666", "(202)555-9626", "HANDEL",   NULL, NULL,         '1984-4-5', NULL,   1, 1, 5.00, 25.00,  2770.00, "SPRZEDAWCA",  3.00,   "7619 Kraft Dr.",   NULL,       "Washington",   "DC", "20002"),
("Hart",    "Paul",     "C", "ZBYT",        "111-22-7777", "(718)555-0059", "HANDEL",   NULL, NULL,         '1982-3-2', "RD",   0, 0, 5.00, 20.00,  2770.00, "SPRZEDAWCA",  3.00,   "8301 Sale Street", "Apt. 230", "Brooklyn", "NY", "11222"),
("Johnson", "Jay",      "O", "ZBYT",        "111-22-8888", "(502)555-6784", "HANDEL",   NULL, NULL,         '1983-6-19',    "ZAW",  1, 1, 5.00, 25.00,  2770.00, "SPRZEDAWCA",  7.00,   "14234 Riverside Dr.",  NULL,       "Louisville",   "KY", "40202"),
("Anderson",    "Debbie",   "I", "ADMINISTRACJA",   "118-72-3777", "(415)555-3489", "ZARZADZANIE",  NULL, NULL,         '1986-4-4', NULL,   1, 1, 2.00, 0.00,   1100.00, "URZENIK", 2.00,   "951 Knob Hill Blvd.",  "Apt. 101", "San Francisco","CA", "94123"),
("Young",   "Sandy",    "E", "ZBYT",        "122-33-4444", "(802)555-8777", "NADZOR",   NULL, NULL,         '1986-4-24',    NULL,   1, 1, 4.00, 0.00,   3180.00, "SPRZEDAWCA",  2.00,   "14097 Gilmore St.",    NULL,       "Burlington",   "VT", "05401"),
("Peterson",    "John",     "F", "ZBYT",        "134-44-5555", "(213)555-3358", "HANDEL",   NULL, NULL,         '1986-5-15',    NULL,   0, 0, 5.00, 0.00,   2770.00, "SPRZEDAWCA",  2.00,   "10711 Highland Ave.",  NULL,       "Los Angeles",  "CA", "90044"),
("Beman",   "Sandy",    "J", "ADMINISTRACJA",   "151-22-7773", "(213)555-0554", "ZARZADZANIE",  NULL, NULL,         '1984-6-6', "RD",   1, 1, 3.00, 0.00,   1110.00, "SEKRETARKA",  1.00,   "440 Chase Blvd.",  NULL,       "Beverly Hills","CA", "90213"),
("Arlich",  "Kim",      "Y", "ZBYT",        "437-22-6788", "(603)555-8773", "HANDEL",   NULL, NULL,         '1985-3-6', NULL,   1, 1, 5.00, 20.00,  3180.00, "SPRZEDAWCA",  3.00,   "10564 Ventura Blvd.",  NULL,       "Manchester",   "NH", "03108"),
("Campbell",    "Linda",    "H", "ZBYT",        "441-22-3333", "(602)555-1974", "HANDEL",   NULL, NULL,         '1986-12-1',    NULL,   1, 0, 5.00, 25.00,  2770.00, "SPRZEDAWCA",  3.00,   "6700 Tyler Street",    NULL,       "Paragould",    "AZ", "86334"),
("Plimpton",    "Daniel",   "M", "ZBYT",        "444-22-3333", "(803)555-7150", "HANDEL",   NULL, NULL,         '1982-11-10',   "RE",   0, 0, 6.00, 5.00,   5480.00, "DYREKTOR",    4.00,   "5934 Ocean Blvd.", "Apt. 303", "Charleston",   "SC", "29401"),
("Gelson",  "George",   "G", "ADMINISTRACJA",   "445-22-3555", "(503)555-2323", "ZARZADZANIE",  NULL, "ZOTA, BRZOWA",   '1980-7-18',    "MGR",  1, 0, 8.00, 0.00,   4770.00, "VICE-PREZES", 3.00,   "P.O. Box 6045",    NULL,       "Eugene",   "OR", "97401"),
("Garnett", "Lena",     "D", "ADMINISTRACJA",   "461-22-5553", "(702)555-9121", "ZARZADZANIE",  NULL, NULL,         '1983-3-5', NULL,   1, 1, 2.00, 0.00,   1120.00, "URZENIK", 3.00,   "520 S. 8th St.",   NULL,       "Reno",     "NV", "89504"),
("Cohen",   "Larry",    "A", "ZBYT",        "551-22-3333", "(217)555-4204", "HANDEL",   NULL, NULL,         '1985-9-8', "RD",   1, 1, 5.00, 25.00,  2770.00, "SPRZEDAWCA",  3.00,   "908 Glen Oaks Ave.",   NULL,       "Decatur",  "IL", "62526"),
("Pope",    "Jan",      "L", "ZBYT",        "555-22-3333", "(717)555-2313", "HANDEL",   NULL, NULL,         '1983-10-13',   NULL,   1, 1, 5.00, 22.00,  2770.00, "SPRZEDAWCA",  1.00,   "101 Pierce St.",   NULL,       "Harrisburg",   "PA", "17101"),
("Goreman", "Vicky",    "J", "ADMINISTRACJA",   "647-22-3433", "(602)555-8801", "ZARZADZANIE",  NULL, NULL,         '1980-11-1',    "MGR",  1, 1, 7.00, 0.00,   5020.00, "VICE-PREZES", 1.00,   "203 E. 3rd St. South", NULL,       "Mesa",     "AZ", "85201"),
("Collins", "Sara",     "H", "ZBYT",        "661-22-3333", "(503)555-0953", "HANDEL",   NULL, NULL,         '1985-4-13',    NULL,   1, 0, 5.00, 20.00,  2770.00, "SPRZEDAWCA",  3.00,   "303 W. Milford St.",   NULL,       "Portland", "OR", "97219"),
("Rizzo",   "Ann",      "B", "ZBYT",        "666-22-3333", "(202)555-3810", "HANDEL",   NULL, NULL,         '1985-12-19',   NULL,   1, 1, 5.00, 0.00,   2770.00, "SPRZEDAWCA",  7.00,   "20984 Leadway Ave.",   NULL,       "Washington",   "DC", "20002"),
("Dickerson",   "Lori",     "E", "ADMINISTRACJA",   "677-82-3333", "(602)555-7100", "ZARZADZANIE",  NULL, "BRZOWA",     '1985-5-5', "ZAW",  1, 1, 7.00, 0.00,   4180.00, "DYREKTOR",    3.00,   "14565 Collins Ave.",   NULL,       "Phoenix",  "AZ", "85041"),
("Adams",   "Nathan",   "K", "ZBYT",        "703-22-3333", "(505)555-4556", "HANDEL",   NULL, NULL,         '1986-2-2', "ZAW",  1, 1, 5.00, 20.00,  2770.00, "SPRZEDAWCA",  5.00,   "980 Sarah Street", "Apt. 4302",    "Santa Fe", "NM", "87501"),
("Daniels", "Dominique",    "F", "ZBYT",        "771-22-3333", "(609)555-0911", "HANDEL",   NULL, "ZOTA",       '1984-11-11',   "RD",   1, 1, 5.00, 15.00,  2770.00, "SPRZEDAWCA",  3.00,   "5601 Grand Ave.",  NULL,       "Trenton",  "NJ", "08601"),
("Rodan",   "Bill",     "H", "ZBYT",        "777-22-3333", "(413)555-0571", "HANDEL",   NULL, NULL,         '1986-5-28',    NULL,   1, 1, 5.00, 17.00,  2770.00, "SPRZEDAWCA",  5.00,   "18097 Bryant Blvd.",   NULL,       "Northampton",  "MA", "01060"),
("Hamby",   "Mary",     "C", "ADMINISTRACJA",   "861-22-3333", "(713)555-0059", "ZARZADZANIE",  NULL, NULL,         '1985-2-13',    NULL,   1, 1, 2.00, 0.00,   1060.00, "URZENIK", 5.00,   "345 Sherman St.",  NULL,       "Houston",  "TX", "77095"),
("Dean",    "Michelle", "W", "ADMINISTRACJA",   "861-28-3983", "(301)555-3193", "ZARZADZANIE",  NULL, "SREBRNA",    '1983-4-12',    NULL,   1 ,1, 3.00, 0.00,   1310.00, "SEKRETARKA",  3.00,   "854 Rushmore Ave.",    NULL,       "Baltimore",    "MD", "21201"),
("DeBello", "Todd",     "S", "ZBYT",        "881-22-3333", "(504)555-3737", "HANDEL",   NULL, NULL,         '1983-2-2', "ZAW",  1, 1, 5.00, 20.00,  2770.00, "SPRZEDAWCA",  3.00,   "4564 Benedict Canyon", NULL,       "New Orleans",  "LA", "70175"),
("Skye",    "Jim",      "D", "ZBYT",        "888-22-3333", "(401)555-3131", "HANDEL",   NULL, NULL,         '1983-2-22',    NULL,   0, 0, 5.00, 10.00,  2770.00, "SPRZEDAWCA",  4.00,   "6043 White Oak Blvd.", "Apt. 501", "Providence",   "RI", "02903"),
("Keegan",  "Marilyn",  "D", "ADMINISTRACJA",   "897-22-3333", "(213)555-5922", "ZARZADZANIE",  NULL, NULL,         '1983-3-18',    NULL,   1, 1, 3.00, 0.00,   1480.00, "SEKRETARKA",  5.00,   "6045 Vineland Blvd.",  "Apt. 1201",    "Hollywood",    "CA", "90028"),
("Bicksby", "Hank",     "F", "ZBYT",        "899-02-3333", "(602)555-1278", "HANDEL",   NULL, NULL,         '1985-11-1',    "RD",   1, 0, 5.00, 20.00,  2770.00, "SPRZEDAWCA",  4.50,   "4101 Peonia Road", NULL,       "Flagstaff",    "AZ", "86001"),
("Newman",  "Robert",   "A", "ADMINISTRACJA",   "971-22-3333", "(214)555-0919", "ZARZADZANIE",  NULL, NULL,         '1981-10-12',   "MGR",  1, 1, 6.00, 0.00,   4430.00, "DYREKTOR",    7.00,   "2310 Lacewood Drive",  NULL,       "Garland",  "TX", "75044"),
("Zambini", "Rick",     "J", "ADMINISTRACJA",   "978-22-4444", "(208)555-1945", "ZARZADZANIE",  NULL, NULL,         '1980-1-1', "MGR",  1, 1, 9.00, 0.00,   6730.00, "PREZES",  13.00,  "108 Prairie Lane", NULL,       "Idaho Falls",  "ID", "83403"),
("Drasin",  "Pedro",    "E", "ZBYT",        "991-22-3333", "(203)555-1522", "HANDEL",   NULL, NULL,         '1982-4-4', NULL,   0, 0, 5.00, 20.00,  2770.00, "SPRZEDAWCA",  3.00,   "12804 Sunburst Ave.",  NULL,       "Hartford", "CT", "06103"),
("Youngblood",  "Dick",     "P", "ZBYT",        "999-22-3333", "(513)555-3228", "HANDEL",   NULL, NULL,         '1982-11-25',   NULL,   0, 0, 5.00, 5.00,   2770.00, "SPRZEDAWCA",  3.00,   "7100 Fulton Place",    NULL,       "Cincinnati",   "OH", "45214");
 
 
CREATE TABLE klient(
id_klienta        char(6) not null primary key,
klient            char(30),
nazwisko          char(15),
imie              char(15),
adres             char(30),
miasto            char(20),
stan              char(2),
kod               char(10),
telefon           char(13),
transakcje        blob
);
 
INSERT INTO klient VALUES
("A00001", "WRIGHT & SONS, LTD.",   "Wright",   "Fred",     "3232 48th St.",        "New York", "NY",   "10092",    "(212)555-7474", NULL),
("L00001", "BAILEY & BAILEY",       "Bailey",   "Sandra",   "5132 Livingston Dr.",      "Long Beach",   "CA",   "90801",    "(213)555-1104", NULL),
("C00001", "L. G. BLUM & ASSOCIATES",   "Martinez", "Ric",      "4818 Allendale Ave.",      "Santa Fe", "NM",   "87501",    "(505)555-3232", NULL),
("L00002", "SAWYER LONGFELLOWS",    "Peters",   "Kimberly", "12300 N. Elm St.",     "Dallas",   "TX",   "75277",    "(214)555-5603", NULL),
("A00005", "SMITH ASSOCIATES",      "Yamada",   "George J.",    "7500 Santa Monica Blvd.",  "Los Angeles",  "CA",   "90055-1319",   "(213)555-4300", NULL),
("C00002", "TIMMONS & CASEY, LTD.", "Timmons",  "Gene",     "310-2090 Comex St.",       "Vancouver",    "BC",   "V6G 1E8",  "(604)555-7644", NULL),
("B12000", "VOLTAGE IMPORTS",       "Maxwell",  "Florence", "8506 Habana Ave.",     "Tampa",    "FL",   "33614",    "(813)555-5522", NULL),
("A10025", "PUBLIC EVENTS",     "Beckman",  "Riener",   "332 S. Michigan Ave.",     "Pasadena", "CA",   "91125-0001",   "(818)555-3842", NULL);
 
 
CREATE TABLE transak(
id_klienta       char(6) not null,
data_trans       date,
id_towaru        char(10) not null,
ilosc            float(7,2),
nr_zamow         char(5) not null,
uwagi            blob,
id_pracown       char(11) not null,
faktura          char(1),
PRIMARY KEY (id_towaru, nr_zamow)
);
 
INSERT INTO transak VALUES
("A00001", '1989-3-10', "C-111-6000", 1.00,  "46088", NULL, "771-22-3333", 0),
("A00001", '1990-7-24', "C-222-1000", 5.00,  "44444", NULL, "111-22-5555", 0),
("A00001", '1991-2-16', "C-222-1000", 5.00,  "43002", NULL, "771-22-3333", 1),
("A00001", '1989-3-4',  "C-222-2010", 3.00,  "70005", NULL, "661-22-3333", 0),
("A00005", '1990-3-5',  "C-111-6000", 5.00,  "70010", NULL, "661-22-3333", 0),
("A00005", '1990-3-2',  "C-500-6050", 15.00, "44084", NULL, "771-22-3333", 0),
("C00001", '1990-1-10', "C-111-6015", 1.00,  "49030", NULL, "991-22-3333", 0),
("C00001", '1990-2-11', "C-111-8000", 10.00, "53002", NULL, "111-22-3333", 1),
("C00001", '1990-1-28', "C-222-1000", 7.00,  "49567", NULL, "111-22-5555", 0),
("C00001", '1991-2-11', "C-222-2000", 2.00,  "53002", NULL, "991-22-3333", 1),
("C00001", '1990-2-2',  "C-300-4010", 1.00,  "51043", NULL, "111-22-5555", 1),
("C00001", '1990-3-2',  "C-300-4010", 5.00,  "55501", NULL, "991-22-3333", 0),
("C00001", '1990-2-12', "C-700-4030", 5.00,  "53143", NULL, "111-22-3333", 1),
("L00001", '1989-1-29', "C-222-1000", 4.00,  "50226", NULL, "111-22-3333", 0),
("L00001", '1990-3-1',  "C-222-3000", 1.00,  "54331", NULL, "111-22-5555", 0),
("L00001", '1991-4-11', "C-300-4010", 1.00,  "57050", NULL, "111-22-5555", 0);