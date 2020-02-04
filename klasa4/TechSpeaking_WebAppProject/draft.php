<?php
  // COOKIES
  setcookie("test",0,time()+60*60*24);
  $_COOKIE["test"] = 6;
  // SESSION
  session_start();
  $_SESSION["test"] = 0;
  //echo session_id();
  require_once("./values.php")
 ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <?php require_once("./styles/styles.html") ?>
    <title>Tech Speaking</title>
  </head>
  <body class="back-secondary">
    <?php
    require("structure/header.php");
    //require("structure/newWordForm.php");
    require("structure/grid.php");

    //echo phpversion();

    require("structure/login.php");
    require("structure/footer.html");
    ?>


    <?php
    require_once("./styles/scripts.html"); ?>
  </body>
</html>
