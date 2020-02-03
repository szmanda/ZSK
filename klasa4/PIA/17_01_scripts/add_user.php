<?php
if (isset($_POST['button']) && !empty($_POST['name']) && !empty($_POST['surname']) && !empty($_POST['birthdate']))
{   // isset($_POST['button']) sprawdza czy przycisk został naciśnięty
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $birthdate = $_POST['birthdate'];

    require_once("./connect.php");
    $sql = "INSERT INTO `user`(`name`,`surname`,`birthdate`) VALUES ('$name', '$surname', '$birthdate')";

    if (mysqli_query($conn,$sql)){
        echo "ok";
    }else {
        echo "blad zapytania";
    }
    mysqli_close($conn);
}
header 'location: ../17_03_bazaDanych3.php';

 ?>
