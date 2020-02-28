<?php
  if (isset($_GET['id'])){
    $id = $_GET['id'];
    require_once('./connect.php');
    $sql = "DELETE FROM `user` WHERE `user`.`id` = $id";

    if (mysqli_query($conn,$sql)){
      header('location: ../17_01_bazaDanych3.php');
    }else{
      // obsługa błedu
    }
  }
 ?>
