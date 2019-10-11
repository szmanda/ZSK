<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php
  if (!empty($_GET['country'])&&!empty($_GET['lang'])/*&&isset($_GET['button'])*/){
      $country = $_GET['country'];
      $lang = $_GET['lang'];

      switch ($lang) {
        case 'pl':
          $lang = 'Polska';
          break;
        case 'en':
          $lang = 'Anglia';
          break;
      }
      echo "Kraj: $country, język: $lang";
      
      }else{
        echo 'dane nie zostały przesłane';
      }
    ?>
    <form method="get">
      <input type="text" name="country" placeholder="Podaj kraj" autofocus><br><br>
        <input type="radio" name="lang" value="pl" checked>polski
        <input type="radio" name="lang" value="en">angielski<br><br>
        <input type="submit" name="button" value="Zatwierdź">
    </form>
  </body>
</html>
