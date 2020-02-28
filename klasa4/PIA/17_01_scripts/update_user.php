<?php
if (isset($_POST['button']) && !empty($_POST['name']) && !empty($_POST['surname']) && !empty($_POST['birthday']) && !empty($_POST['id']))
{   // isset($_POST['button']) sprawdza czy przycisk został naciśnięty
    $id = $_POST['id'];
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $birthday = $_POST['birthday'];
    $color = (isset($_POST['color'])) ? $_POST['color'] : 0;

    require_once("./connect.php");
    $sql = "UPDATE `user` SET `name` = '$name', `surname` = '$surname',`birthday` = '$birthday',`color` = '$color' WHERE `id` = $id";
    if (mysqli_query($conn,$sql)){
        echo "ok";
    }else {
        echo "blad zapytania";
    }
    mysqli_close($conn);
}
header('location: ../17_01_bazaDanych3.php');

 ?>
