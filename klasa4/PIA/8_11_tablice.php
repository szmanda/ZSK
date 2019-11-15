<!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>tablice</title>
  </head>
  <body>
    <?php
      // tablice indeksowane numerycznie

      $colors = array('Red','Green','Blue');

      for ($i=0; $i<3; $i++){
        $elem = $i + 1;
        echo "element nr $elem jest równy: $colors[$i]<br>";
      }

      function showArray($tab) {
        for ($i=0; $i<3; $i++){
          $elem = $i + 1;
          echo "element nr $elem jest równy: $tab[$i]<br>";
        }
      }
      showArray($colors);

      echo count($colors),'<br>';
      $colors[3] = 'Magenta';

      $n = count($colors); // liczy ilość elementów tablicy
      for ($i=0; $i<$n; $i++){
        $elem = $i + 1;
        echo "element nr $elem jest równy: $colors[$i]<br>";
      }

      echo '<br>';
      foreach ($colors as $key => $value) {
        echo "element nr ".($key+1)." jest równy: $value<br>";
      }

      echo '<hr>';
      ###########################
      // tablice asocjacyjne

      $data = array(
        'imie' => 'Kinga',
        'nazwisko' => 'Nowak',
        'wiek' => 20
      );
      function showArrayAssoc($data){
        foreach ($data as $key => $value) {
          echo "$key: $value, ";
        }
        echo '<br>';
      }
      showArrayAssoc($data);
      Show($data);

      echo $data['nazwisko'];
      echo "<br>$data[nazwisko]"; // należy usunąć apostrofy inaczej błąd WHITESPACE
      echo "<br>{$data['nazwisko']}"; // nawiasy pozwalają na wykoanie kodu php w nawiasach

      // tablice wielowymiarowe

      $student  = array(
        array('Katarzyna','Nowak'),
        array('Maciej'),
        array('Piotr','Kowalski',45,23.54)
      );

      for ($i=0; $i < count($student) ; $i++) { // count w tym miejscu jest nieoptymalne
        for ($j=0; $j < count($student[$i]); $j++) {
          echo $student[$i][$j],' ';
        }
      }

      // sortowanie tablic
      echo '<hr>';
      $tab = array(10,2,1000,5,75,-4);
      function Show($tab){
        foreach ($tab as $key => $item) {
          echo "||$key : $item ";
        }
        echo "<br>";
      }
      Show($tab);
      sort($tab); // rosnąco
      Show($tab);
      rsort($tab); // malejąco

      // sortowanie tablicy asocjacyjnej
      $tabAssoc = array(
        "surname" => "Nowak",
        "name" => "Anna",
        "age" => 20
      );

      // added "$key =>" to function Show()
      // obsługa tablic asocjacyjnych

      Show($tabAssoc);
      echo "<br><br>";

      // sort($tabAssoc); // to sortowanie wywaliło klucze tablicy
      asort($tabAssoc); // sortowanie rosnąco
      Show($tabAssoc); echo "sortowanie rosnąco wg. wartości<br><br>";
      arsort($tabAssoc); // sortowanie malejąco
      Show($tabAssoc); echo "sortowanie malejąco wg. wartości<br><br>";
      ksort($tabAssoc); // sortowanie wg kluczy rosnąco
      Show($tabAssoc); echo "sortowanie rosnąco wg. klucza<br><br>";
      krsort($tabAssoc); // sortowanie wg kluczy malejąco
      Show($tabAssoc); echo "sortowanie malejąco wg. klucza<br><br>";


      // Wyświetlanie danych
      echo "vardump: ";
      var_dump($tabAssoc);
      echo "<br><br>";

      echo "print_r: ";
      print_r($tabAssoc);
      echo "<br><br>";




    ?>
  </body>
</html>
