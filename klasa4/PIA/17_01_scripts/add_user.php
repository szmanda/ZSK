<?php
if (isset($_POST['button']) && !empty($_POST['name']) && !empty($_POST['surname']) && !empty($_POST['birthday']))
{   // isset($_POST['button']) sprawdza czy przycisk został naciśnięty
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $birthday = $_POST['birthday'];
    $color = (isset($_POST['color'])) ? $_POST['color'] : NULL;

    require_once("./connect.php");
    $sql = "INSERT INTO `user`(`name`,`surname`,`birthday`,`color`) VALUES ('$name', '$surname', '$birthday', '$color')";

    if (mysqli_query($conn,$sql)){
        echo "ok";
    }else {
        echo "blad zapytania";
    }
    mysqli_close($conn);
}
header('location: ../17_01_bazaDanych3.php');

 ?>
