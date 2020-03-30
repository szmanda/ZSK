<?php
  session_start();

  if (isset($_SESSION["email"]) && !empty($_GET["p"]) && !empty($_GET["r"])) {
    $authanticated = true;
  }
  else{
    header("location: ../index.php");
  }

  require_once("./connect.php");
  $email = $_SESSION["email"];
  $points = intval($_GET["p"]);
  $url = $_GET["r"];
  $sql = "UPDATE `stduser` SET `points` = `points`+$points WHERE `email`=\"$email\"";
  $result = mysqli_query($conn,$sql);
  header("location: $url");
 ?>
