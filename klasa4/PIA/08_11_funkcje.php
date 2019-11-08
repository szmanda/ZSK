<!DOCTYPE html>
<html lang="pl" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php
      function wartosc($a):string { // rzutowanie na typ string
        if ($a < 0) {
          return 'ujemna';
        } else if ($a == 0) {
          return 'zero';
        } else {
          return 'dodatnia';
        }
      }

      echo wartosc(5);
      echo gettype(wartosc(5));

      function getValue():int { // rzutownaie na typ int
        return 20.55;
      }
      echo getValue();
      echo '<hr>';

      //zasieg zmiennych
      $x = 10;
      function Show(){
        echo "wartosc zmiennej \$x wynosi: $x<br>"; //undefined
        echo $GLOBALS['x'].'<br>'; // dostęp do zmiennej globalnej wewnątrz funckji
        echo "wartosc zmiennej \$x wynosi: $GLOBALS[x]<br>";
      }
      Show();

      $y = 20;
      function Show1(){
        global $y;
        echo "Wartość zmiennej \$y wynosi: $y<hr>";
      }
      Show1();

      #####################################
      // funkscje statyczne

      function sum(){
        $number = 10;
        echo "\$number wynosi: $number<br>";
        $number +=10;
        //echo "\$number wynosi: $number<br>";
      }
      sum(); // 10
      sum(); // 10
      echo "<br>";

      function sum1(){
        static $number = 10; // funkcja zapamiętuje watrość z poprzedniego wywołania
        echo "\$number wynosi: $number<br>";
        $number +=10;
        //echo "\$number wynosi: $number<br>";
      }
      sum1(); // 10
      sum1(); // 20
      sum1(); // 30


      #####################################
      // argumenty
      function add($x, $y=1){ // static nie możliwe do użycia w argumentach
        return $x + $y;
      }
      $z = 20;

      echo add($z),'<br>';
      echo add(2,4),'<br>';
      echo add($z,$z),'<br>';

      function multi(float $x, int $y) { // argumenty zostaną zrzutowane do danych typów
        return $x * $y;
      }
      echo multi(3,4),'<br>'; //12
      echo multi(2.5,4),'<br>'; //10
      echo multi(4,2.5),'<br>'; //8

    ?>
  </body>
</html>
