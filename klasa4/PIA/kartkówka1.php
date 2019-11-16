<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <form method="post">
      Podaj imię <input type="text" name="imie">
      Podaj imię <input type="number" name="wiek">
      <input type="submit" value="Wyślij">
    </form>
    <?php
      if (isset($_POST["imie"])&&null!==$_POST["wiek"]){
        $imie = $_POST["imie"];
        $wiek = $_POST["wiek"];

        $klucze = array('ZSK','ZSŁ');
        $censore = array('*#####*');

        $poprawaImie = str_replace($klucze,$censore,$imie);
        echo "Dane przed sprawdzeniem: $imie, $wiek";
        echo "Dane po poprawieniu: $poprawaImie, $wiek";

        echo '<hr>';

        echo "Dane przed poprawą: $imie, $wiek";
        $imieN = ucfirst(mb_strtolower(trim($imie)));
        echo "Dane po poprawie:$imieN, $wiek";


      }
    ?>
  </body>
</html>
