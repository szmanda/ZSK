<?php
  session_start();
 ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <?php require_once("./styles/styles.html") ?>
    <title>Tech Speaking</title>
  </head>
  <body class="back-secondary">
    <?php require("structure/header.php");?>

    <div class="divider" style="margin-bottom: 1vh;"></div>

    <h1 style="font-size: 6.2vw;">We are pleased to invite you</h1>
    <h2 style="font-size: 4.4vw; text-align:">for an exploration of ever so welcoming Tech Speak language learning web page</h2>

    <div class="divider"></div>

    <div class="row">
      <div class="col-xs-12 col-xl-12 px-4 pt-2">
        <div class="tile">
          <h1 class="g" style="text-align: center; font-size:4vw;"><?php echo "second lang" ?></h1>
          <h2 class="g" style="font-size: 8vw;">_ __ ________</h2>
          <div id="grid">

          </div>

        </div>
      </div>
    </div>
    <script src="./scripts/grid.js"></script>
    <script>
      GenerateGrid("web application","aplikacja internetowa");
    </script>


    <?php
    require("structure/footer.html");
    require_once("./styles/scripts.html");
    ?>
  </body>
</html>
