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
            <a href="./17_01_scripts/del_user.php?id=$row[id]">Usuń</a>
          </td>
          <td>
            <a href="./17_01_bazaDanych3.php?id_update=$row[id]">Aktualizuj</a>
          </td>
        </tr>
ROW;
      }
      echo "</table>";
     ?>

     <h3>Dodawanie użytkownika</h3>
     <form action="./17_01_scripts/add_user.php" method="post">
         <input type="text" name="name">
         <input type="text" name="surname">
         <input type="date" name="birthdate">
         <input type="submit" name="button" value="Dodaj Użytkownika">
     </form>

     <?php
        if (isset($_GET["id_update"])) {
            $id_update = $_GET["id_update"];
            $sql = "SELECT * FROM `user` WHERE `id` = '$id_update'";
            $result = mysqli_query($conn, $sql);
            $user = mysqli_fetch_assoc($result);

            echo <<< UPDATE
            <h3>Aktualizacja użytkownika</h3>
            <form action="./17_01_scripts/add_user.php" method="post">
                <input type="text" name="name" value="$user[name]">
                <input type="text" name="surname" value="$user[surname]">
                <input type="date" name="birthdate" value="$user[birthdate]">
                <input type="submit" name="button" value="Dodaj Użytkownika">
            </form>
UPDATE;

        }


        mysqli_close($conn);
      ?>

  </body>
</html>
