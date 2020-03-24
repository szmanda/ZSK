<?php
  session_start();
 ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <?php require_once("./styles/styles.html") ?>
    <title>Tech Speaking</title>
  </head>
  <body class="back-secondary">
    <?php require("structure/header.php");?>

    <div class="divider" style="margin-bottom: 1vh;"></div>

    <h1 style="font-size: 6.2vw;">We are pleased to invite you</h1>
    <h2 style="font-size: 4.4vw; text-align:">for an exploration of ever so welcoming Tech Speak language learning web page</h2>

    <div class="divider"></div>

    <?php
    include("./structure/grid.php");
     ?>

    <div class="divider"></div>

    <?php
    include("structure/footer.html");
    require_once("./styles/scripts.html");
    ?>
  </body>
</html>
