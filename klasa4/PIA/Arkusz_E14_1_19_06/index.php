<!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Sklep papierniczy</title>
  </head>
  <body>
    <?php

      // skrypt 1
      $connect = mysqli_connect("localhost","root","","sklep"); //$connect przechowuje id połączenia
      mysqli_set_charset($connect,"utf8"); //informacja dla php o kodowaniu bazy, żeby można było odczytywać znaki diakrytyczne

      // napiać kwerende na phpmyadmin, wykonać, wybrać 'utwórz kod php'
      $sql = "SELECT `nazwa` FROM `towary` WHERE `promocja` = 1";
      $result = mysqli_query($connect, $sql);

      echo "<ul>";
      // mysqli_fetch_row($result) zwraca wiersze indeksowane numerami
      // mysqli_fetch_assoc() zwraca wiersz w formie tablicy assocjacyjnej.
      while ($row = mysqli_fetch_assoc($result)) {
        echo "<li>",$row["nazwa"]," $row[nazwa]","</li>";
      }
      echo "</ul>";

      mysqli_close($connect);


      // skrypt 2
      ?>

    <form method="post">
      <select name="towar">
        <option value="c">Czekolada</option>
        <option value="g">Grześki</option>
        <option value="w">Wafle</option>
        <option value="b">Baton</option>
      </select>
      <input type="submit" name="button" value="WYBIERZ">
    </form>

      <?php
      if (isset($_POST["towar"])) {
        $towar = $_POST["towar"];
        switch ($_POST["towar"]) {
          case "c":
            $towar = "Czekolada";
            break;
          case "g":
            $towar = "Grześki";
            break;
          case "w":
            $towar = "Wafle";
            break;
          case "b":
            $towar = "Baton";
            break;
        }
        echo $towar;
      }

      $sql = "SELECT `cena` FROM `towary` WHERE `nazwa` = \"Cienkopis\"";
      // $sql = "SELECT `cena` FROM `towary` WHERE `nazwa` = \'Cienkopis\'"; wyrzuca błąd gdy apostrofy
      $sql = str_replace("Cienkopis",$towar,$sql);
      echo "<br>",$sql;

      $connect = mysqli_connect("localhost","root","","sklep");
      mysqli_set_charset($connect,"utf8");

      $result = mysqli_query($connect,$sql);

      $row = mysqli_fetch_assoc($result);

      echo "<br> cena: ",$row["cena"];

      $promotion = round($row["cena"]*0.85,2);

      echo "<br> promocja: ",$promotion;



     ?>
  </body>
</html>
