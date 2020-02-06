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


    <div class="row">
      <div class="col-xs-12 col-xl-12 p-5">
        <div class="tile">
          <h1 style="text-align: center; font-size:3.5vw;"><?php echo "second lang" ?></h1>
          <h2 style="font-size: 8vw;">_ __ ________</h2>
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
