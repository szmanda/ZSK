<!Doctype html>
<html>
  <head>
    <meta charset="utf-8">
  </head>
  <body>
    <?php
      $imie = "Janusz";
      $imie1 = "Janusz";
      $imię = "Janusz";

      echo "$imie";
      echo 'imie';

      echo '<br> Imię: '.$imie.'<br>'; //wolniejsze
      echo '<br> Imię: ',$imie,'<hr>'; //szybsze

    //typ integer
      $calkowita = 10;
      $hex = 0xA4;
      $oct = 020;
      $bin = 0b1010;

      echo $hex; //echo zamienia hex na decymalna i analogicznie z pozozstałymi
      echo '<hr>';

    //składnia heredoc
    $name = 'Kasia';
    $city = 'Poznan';

    // w heredoc uwaga na spacje obok etykiet, może wywalać syntax error
    echo <<< E
    Heredoc<br>
    Twoje misto $city<hr>
    E;

    $text = <<< ETYKIETA
    Heredoc<br>
    Twoje imię: $name<br>
    Twoje misto $city<hr>
    ETYKIETA;

    echo $text;

    //składnia nowdoc
    echo <<< 'X'
    Nowdoc<br>
    Twoje misto $city<hr>
    X;

      /* E dokumentator - program do twprzenia dokumentacji
      Edycja skrótów w atomie ctrl+,
      Ctrl+Shift+K  - usuwa linię
      */
    ?>
  </body>
</html>
