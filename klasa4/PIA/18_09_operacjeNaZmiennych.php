<!Doctype html>
<html>
  <head>
    <meta charset="utf-8">
  </head>
  <body>
    <?php
      //potęgowanie
      $potega = 2**10;
      echo $potega,'<br>';

      //operatory bitowe:
      //  pojedyncze znaki: and &, or |, not ~, xor ^, przesunięcie bitowe: >>, <<

      $x = 0b1010; //10
      $x = $x>>1; //5 (101)
      $x = $x<<2; //(10100)
      echo $x;


      ###########################

    $x = 1;
    $y = 1;

    $wynik = $x <=> $y; //dla x>y 1 dla x=y 0, dla y>x -1;

    echo $wynik;
    ?>
  </body>
</html>
