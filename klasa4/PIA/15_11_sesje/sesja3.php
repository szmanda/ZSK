<?php
  session_start();
  unset($_SESSION["name"])
 ?>
 <!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Strona trzecia</title>
  </head>
  <body>
    <h1>Strona druga</h1>
    <hr>
    <h2>Witamy
    <?php
      echo $_SESSION["name"]; // nieznna zmienna, dlatego dodaję nagłówek
     ?>
    na stronie</h2>
    <?php
      echo "identyfikator sesji: ",session_id();
     ?>
    <br><a href="./sesja1.php">Strona główna</a>


  </body>
</html>
