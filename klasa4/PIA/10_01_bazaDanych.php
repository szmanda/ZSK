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
      $conn = mysqli_connect("localhost","anna","zaq1@WSX","komis");
      mysqli_set_charset($conn,"utf8");
      $sql = "SELECT `name`,`surname`,`birthdate` FROM `User`";

      $result = mysqli_query($conn,$sql);
      mysqli_close($conn);

      echo <<< TABLE
      <table>
        <tr>
          <th>Imię</th>
          <th>Nazwisko</th>
          <th>Data urodzenia</th>
        </tr>
TABLE;

      while($row = mysqli_fetch_assoc($result)){
        echo <<< ROW
        <tr>
          <td>$row[name]</td>
          <td>$row[surname]</td>
          <td>$row[birthdate]</td>
        </tr>
ROW;
      }

      echo "</table>";

      echo <<< SQL
      -- konto użytkownika:
      CREATE USER `anna`@`localhost` IDENTIFIED VIA mysql_native_password USING `zaq1@WSX`
      -- Uprawniania dla użytkownika:
      GRANT SELECT (`name`, `surname`, `birthdate`) ON `komis`.`user` TO 'anna'@'localhost'
SQL;
     ?>

  </body>
</html>
