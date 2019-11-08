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
        'nazwisklo' => 'Nowak',
        'wiek' => 20
      );
      function showArrayAssoc($data){
        foreach ($data as $key => $value) {
          echo "$key: $value, ";
        }
        echo '<br>';
      }
      showArrayAssoc($data);

      echo $data['nazwisko'];
      echo "<br>$data[nazwisko]"; // należy usunąć apostrofy inaczej błąd WHITESPACE
      echo "<br>{$data['nazwisko']}"; // nawiasy pozwalają na wykoanie kodu php w nawiasach

      // tablice wielowymiarowe

      $student  = array(
        array('Katarzyna','Nowak'),
        array('Katarzyna'),
        array('Katarzyna','Nowak',45,23.54)
      );

      for ($i=0; $i < count($student) ; $i++) { // count w tym miejscu jest nieoptymalne
        for ($j=0; $j < count($student[$i]); $j++) {
          echo $student[$i][$j],' ';
        }
      }

    ?>
  </body>
</html>
