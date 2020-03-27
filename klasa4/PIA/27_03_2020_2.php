<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php
    require("./27_03_2020.php");
    $animal1 = new Animal("Chordata","Mammalia","Carnivora","Felidae","Felis","Felis catus",);
    $animal1->ShowAll();
    $animal2 = new Animal("Chordata","Mammalia","Carnivora","Canidae","Canis","Canis Lupus",);
    $animal2->ShowAll();
    ?>
  </body>
</html>
