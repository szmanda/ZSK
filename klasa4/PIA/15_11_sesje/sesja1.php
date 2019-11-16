<?php
  session_start();
  $_SESSION["name"] = "JAnusz_29";
 ?>
 <!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Strona startowa</title>
  </head>
  <body>
    <h1>Strona startowa</h1>
    <hr>
    <h2>Witamy
    <?php
      echo $_SESSION["name"]; // nieznna zmienna, dlatego dodaję nagłówek
     ?>
    na stronie</h2>
    <?php
      echo "identyfikator sesji: ",session_id();
     ?>
    <br><a href="./sesja2.php">Strona druga</a>

  </body>
</html>
