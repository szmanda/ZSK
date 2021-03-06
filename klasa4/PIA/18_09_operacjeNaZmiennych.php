<!Doctype html>
<html>
  <head>
    <meta charset="utf-8">
  </head>
  <body>
    <?php
      // potęgowanie
      $potega = 2**10;
      echo $potega,'<br>';

      // operatory bitowe:
      // pojedyncze znaki: and &, or |, not ~, xor ^, przesunięcie bitowe: >>, <<

      $x = 0b1010; //10
      $x = $x>>1; //5 (101)
      $x = $x<<2; //(10100)
      echo $x;
    ###########################
    $x = 1;
    $y = 1.0;

    $wynik = $x <=> $y; //dla x>y 1 dla x=y 0, dla y>x -1;

    echo $wynik;
    ############################
    if ($x==$y){
      echo "Identyczna";
    } else{
      echo "Różna";
    }

    echo gettype($x),'<br>'; //integer
    echo gettype($y),'<hr>'; //double
    ############################
    $x = 2;
    echo $x++;  // =2
    echo ++$x;  // =4
    echo $x;  // =4
    $y = $x++;
    echo $y; // =4
    $y = ++$x; // =6
    echo ++$y,'<hr>';  // =7
    ###########################
    // operatory rzutowania
    // bool, int, float, string
    // array, object, unset

    $text1 = '123abc';
    $text2 = 1;
    $text3 = 1;
    $text4;

    $x1 = (int)$text1;
    echo $x1,'<br>';

    $x2 = (bool)$text2;
    echo $x2,'<br>';

    $x3 = (unset)$text3;
    echo $x3,'<br>';
    echo gettype($x3),'<br>';

    echo $text4; // Notice
    echo gettype($text4); //Null

    echo '<hr>';

    //rozmiar typu integer
    echo PHP_INT_SIZE,'<hr>'; // =8 (bajtow)

    //kontrola typu zmiennych
    $x = 'tekst';
    echo is_string($x1); // 1
    echo is_null($x1); // false
    echo is_int($x1); // false
    echo is_bool($x1); // false
    echo is_float($x1); // false


  #############################
  //zmienna superglobalne
  //$_GET, $_POST, $_COOKIE, $_FILES, $_SESSION, $_SERVER

  echo $_SERVER['SERVER_PORT'],'<br>';  // 80
  echo $_SERVER['SERVER_NAME'],'<br>';  // 127.0.0.1
  echo $_SERVER['SERVER_NAME'],'<br>';
  echo $_SERVER['SERVER_PROTOCOL'],'<br>'; // HTTP/1.1
  echo $_SERVER['DOCUMENT_ROOT'],'<br>'; // C:/xampp/htdocs

  //$localFile = $SERVER['DOCUMENT_ROOT'].$_SERVER['SCRIPT_NAME'].'<br>';
  $localFile = $_SERVER['DOCUMENT_ROOT'];
  $localFile .= $_SERVER['SCRIPT_NAME'].'<br>';

  //stałe
  // nazwy z dużych liter
  define('NAME','Janusz');
  echo NAME;

  define('name','Janusz');
  echo name;

  define('SURNAME','Janusz',true);
  echo suRNamE;

  ##############################
  //stałe predefiniowane

  echo PHP_VERSION;

  //MOŻLIWE PORÓWNANIE STRING Z float
  if (PHP_VERSION > 5.6)
    echo 'Nowa wersja php';
  else
    echo 'stara wersja php';

  echo PHP_OS;
  echo __LINE__; //wskazuje numer lini
  echo __FILE__; //ścieżka do pliku
  echo __DIR__; //ścieżka do folderu

    ?>
  </body>
</html>
