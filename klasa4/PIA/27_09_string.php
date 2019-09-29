<?php

  $text = <<< TEXT
    zsk - Zespół
    szkół
    komunikacji
TEXT;

  echo "Przed użyciem funkcji nl2br:<br> $text <br>";

  echo "<br>Po wywołanie funkcji nl2br:<br>";
  echo nl2br($text);

// zamiana na małe litery


?>
