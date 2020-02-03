<!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Baza</title>
    <link rel="stylesheet" href="css/10_01_style.css">
  </head>
  <body>
    <h3>baza komis - tabela user</h3>

    <?php
      echo <<< SQL
      Wyświetl w liście numerowanej Imiona i nazwiska osób z tabeli user
      do połączenia wykorzystaj nowo dodanego użytkownika o nazwie jakub,
      dodaj hasło bezpieczne wygenerowane za pomocą phpmyadmin, połączenia
      z bazą dodaj do nowego pliku, dodaj mu uprawnienia specyficzne do tabeli
      User i pól imie, nazwisko.
SQL;

      $conn = mysqli_connect("localhost","jakub","Gfj3BOAU3rXRmyei","komis");
      mysqli_set_charset($conn,"utf8");
      $sql = "SELECT `name`,`surname` FROM `User`";

      $result = mysqli_query($conn,$sql);
      mysqli_close($conn);

      echo "<ol>";
      while($row = mysqli_fetch_assoc($result)){
        echo "<li>$row[name], $row[surname]</li>";
      }
      echo "</ol>";

      echo <<< SQL
      CREATE USER `jakub`@`localhost` IDENTIFIED VIA mysql_native_password
      USING '***';

      GRANT USAGE ON *.* TO 'jakub'@'localhost' REQUIRE NONE
      WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

      GRANT SELECT (`name`, `surname`) ON `komis`.`user` TO 'jakub'@'localhost';
SQL;
     ?>

  </body>
</html>
