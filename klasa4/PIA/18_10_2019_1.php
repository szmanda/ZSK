<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>formularze2</title>
  </head>
  <body>
    <?php
      // *link*?surname=value
      if (!empty($_GET["surname"])){
        $surname = $_GET["surname"];
        echo "Cześć, $surname";
      } else {
        // przekierowanie na stronę z formularzem
        header('location: ./18_10_2019_form.php');
      }
    ?>
    <hr>
    <form action="18_10_2019_2.php" method="get">
      <input type="radio" name="country" value="pl"> Polska
      <input type="radio" name="country" value="de"> Deutschland
      <input type="radio" name="country" value="us"> United States
      <input type="hidden" name="surname" value="<?php echo $surname ?>">
      <input type="submit" value="Dalej">
    </form>


  </body>
</html>
