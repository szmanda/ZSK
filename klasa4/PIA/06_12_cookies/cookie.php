<?php
  setcookie("imie","Janusz");
  setcookie("wiek",30);
  setcookie("nazwisko","Kowalski",time()+60*60*24);
  setcookie("imie","", time()-1); // usuwanie ciastka

  echo $_COOKIE["nazwisko"];
?>
