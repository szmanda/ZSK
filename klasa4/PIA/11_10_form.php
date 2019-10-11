<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./css/11_10_style.css">
    <title></title>
  </head>
  <body>
    <!-- Zabezpiecz dane przed zpodaniem błędnych danych tj. białe znaki, ogranicz ilość znaków do 10 dla ienia, pierwsza litera w imieniu ma być duża a pozostałe małe.
    wyświetl dane w formacie :
      przed poprawą:
      po poprawie:
    Dane poprawione wświetl w tabeli z nagłówkami o nazwach imię oraz wiek
    dodaj arkusz styli o nazwie style.css i umieść go w folderze css -->

    <form method="post">
      <input type="text" name="username" placeholder="Podaj imię" autofocus autocomplete="off"><br><br>
      <input type="number" name="age" placeholder="Podaj wiek"><br><br>
      <input type="submit" name="button" value="Zatwierdź">
    </form><hr>

    <?php
      if (!empty($_POST['username'])&&(!empty($_POST['age']))) {
        $name = $_POST['username'];
        $age = $_POST['age'];
        $rozmiar = strlen($name);

        echo "Przed poprawą $name, $rozmiar ,$age<br>";
        $nameNew = ucfirst(strtolower(trim($name)));
        $rozmiarNew = strlen($nameNew);
        if ($rozmiarNew > 10) {
          $nameNew = substr($nameNew, 0, 10);
        }
        $rozmiarNew = strlen($nameNew);
        echo "Po poprawie: $nameNew, $rozmiarNew, $age<br>";
      }
    ?>

    <table>
      <tr>
        <th>Imię</th>
        <th>Wiek</th>
      </tr>
      <tr>
        <th><?php echo $nameNew; ?></th>
        <th><?php echo $age; ?></th>
      </tr>
    </table>

  </body>
</html>
