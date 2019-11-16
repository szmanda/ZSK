<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>formularze3</title>
  </head>
  <body>
    <?php
      echo "trzecia podstrona<hr>";
      if (!empty($_GET["surname"])){
        $surname = $_GET["surname"];
        echo $surname;
      } else {
        // przekierowanie na stronę z formularzem
        header('location: ./18_10_2019_1.php');
      }

      $country = $_GET["country"];
      echo "<hr>".$country."<br>";

      switch ($country) {
        case 'pl':
          echo "Polska";
          break;
        case 'de':
          echo "Niemcy";
          break;
        case "us":
          echo "Stany Zjednoczone";
          break;
        default:
          echo "nieznane pochodzenie";
          break;
      }

    ?>
  </body>
</html>
