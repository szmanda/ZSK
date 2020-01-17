<!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/10_01_style.css">
    <title>Komis</title>
  </head>
  <body>
    <h3>Użytkownicy</h3>

    <?php
      require_once("17_01_scripts/connect.php");
      require_once("17_01_scripts/function.php");

      $sql = "SELECT * FROM `user`";

      $result = mysqli_query($conn, $sql);

      echo <<< TABLE
      <table>
        <tr>
          <th>Imie</th>
          <th>Nazwisko</th>
          <th>Data urodzenia</th>
          <th>Rok urodzenia</th>
        </tr>
TABLE;

      while($row = mysqli_fetch_assoc($result)){
        $year = year($row["birthdate"]);
        // heredoc, brak apostrofów w nazwach kluczy
        echo <<< ROW
        <tr>
          <td>$row[name]</td>
          <td>$row[surname]</td>
          <td>$row[birthdate]</td>
          <td>$year</td>
          <td>
            <a href="./17_01_scripts/del_user.php?id=$row[id]">usuń</a>
          </td>
        </tr>
ROW;
      }
      echo "</table>";
     ?>

  </body>
</html>
