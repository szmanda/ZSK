-- import data to word TABLE
INSERT INTO `word` (`id_word`, `word`, `definition`, `id_translation`, `id_lang`, `id_category`) VALUES
('1', 'programowanie obiektowe', 'paradygmat programowania, w którym programy definiuje się za pomocą obiektów – elementów łączących dane i procedury', '2', '2', NULL),
('2', 'object oriented programming', 'Object-oriented programming is a programming paradigm based on the concept of objects, which can contain data, in the form of fields, and code, in the form of procedures', '1', '1', NULL),
('3', 'układ scalony', 'zminiaturyzowany układ elektroniczny wykonany najczęściej w technologii monolitycznej na bazie monokryształu półprzewodnikowego, zwykle krzemu.', '4', '2', NULL),
('4', 'integrated circuit', 'a set of electronic circuits on one small flat piece (or chip) of semiconductor material that is normally silicon', '3', '1', NULL),
('5', 'informatyka', 'dziedzina nauk ścisłych i techniki zajmująca się przetwarzaniem informacji, w tym metodami ich przetwarzania oraz technologiami wytwarzania układów je przetwarzających.', '6', '2', NULL),
('6', 'computer science', 'the study of processes that interact with data and that can be represented as data in the form of programs.', '5', '1', NULL),
('7', 'big data', 'termin odnoszący się do dużych, zmiennych i różnorodnych zbiorów danych, których przetwarzanie i analiza jest trudna, ale jednocześnie wartościowa, ponieważ może prowadzić do zdobycia nowej wiedzy', '8', '2', NULL),
('8', 'big data', 'a field that treats ways to analyze, systematically extract information from, or otherwise deal with data sets that are too large or complex to be dealt with by traditional data-processing application software.', '7', '1', NULL),
('9', 'uczenie maszynowe', 'dziedzina wchodząca w skład nauk zajmujących się problematyką Sztucznej inteligencji, jest to nauka interdyscyplinarna ze szczególnym uwzględnieniem takich dziedzin jak informatyka, robotyka i statystyka.', '10', '2', NULL),
('10', 'machine learning', 'the scientific study of algorithms and statistical models that computer systems use to perform a specific task without using explicit instructions, relying on patterns and inference instead.', '9', '1', NULL),
('11', 'wywołanie (funkcji)', '', '12', '2', NULL),
('12', 'invokation', '', '11', '1', NULL);
