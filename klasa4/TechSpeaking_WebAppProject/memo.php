<?php
  session_start();
  require_once("./values.php");

  if (isset($_SESSION["email"])){
    $authanticated = true;
  }
  else{
    header("location: ./loginForm.php");
  }
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
     include("structure/memo.php");
     require("structure/footer.html");
     require_once("./styles/scripts.html");
     ?>
   </body>
 </html>
