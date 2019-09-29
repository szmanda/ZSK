<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    Początek pliku
      <?php
        include('./27_09_dolaczaniePliku/plik.php');
        // include('./dołączanie_pliku/plBŁĄDik.php'); wyswietla warning ale plik dalej sie wykonuje
        include_once('./27_09_dolaczaniePliku/plik.php'); //dołącza jeśli nie dołączył wcześniej

        require('./27_09_dolaczaniePliku/plik.php');
        // require('./dołączanie_pliku/plBŁĄDik.php'); wyswietla warning i fatal error, wykonywanie pliku jest przerywane
        require_once('./27_09_dolaczaniePliku/plik.php');
      ?>
    Koniec pliku
  </body>
</html>
