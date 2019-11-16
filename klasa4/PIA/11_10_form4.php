<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <!--
    Użytkownik podaje dane z klawiatury w polach:
    textarea, text, oraz number
    Wyczyść dane z białych znaków.
    Ogranicz pole textarea do 50 znaków.
    wyświet dane z texarea zwracając uwagę na znaki break
    formularz dodaj z drugiego pliku o nazwie 11_10_form5.php -->
    <?php
    include "11_10_form5.php";

    if (!empty($_POST['description'])&&!empty($_POST['text'])&&!empty($_POST['number'])){
      $description = $_POST['description'];
      $texnumber = $_POST['texnumber'];
      $number = $_POST['number'];
    }else{
      echo "dane nie zostały przesłane";
    }

    ?>


  </body>
</html>
