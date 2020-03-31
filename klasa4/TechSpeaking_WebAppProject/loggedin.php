<?php
  session_start();
  require_once("./values.php");

  if (isset($_SESSION["email"])){
    $authanticated = true;
  }
  else{
    header("location: ./loginForm.php");
  }
 ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <?php require_once("./styles/styles.html") ?>
    <title>Tech Speaking</title>
    <style>
    a{
      text-decoration: none; !important
    }
      .tile h2{
        font-size: calc(20px + 3vw);
        margin-bottom: 50px;
        text-align: left;
        margin-left:0px;
      }
      .tile:hover{
        transition: 0.2s;
        box-shadow: inset 0 0 40px -10px var(--accent);
        border-color: var(--accent);
      }
    </style>
  </head>
  <body class="back-secondary">
    <?php
    require("structure/header.php");
    ?>
    <h1><br>Choose what do you want to do next:</h1>
    <div class="divider"></div>

    <!-- tiles -->
    <div style="width:90%; margin-left:5%; margin-right:5%; transition: 50s"
    <div class="row mt-5 mr-0">
      <div class="col-xs-12 col-md-6 col-xl-4">
        <a href="grid.php">
        <div class="tile">
          <h2>Play Grid</h2>
        </div>
        </a>
      </div>
      <div class="col-xs-12 col-md-6 col-xl-4">
        <a href="memo.php">
        <div class="tile">
          <h2>Play Memory</h2>
        </div>
        </a>
      </div>
      <div class="col-xs-12 col-xl-4">
        <a href="./stat.php">
        <div class="tile">
          <h2>Check Stats</h2>
        </div>
        </a>
      </div>
    </div>


    <?php
    require("structure/footer.html");
    require_once("./styles/scripts.html"); ?>
  </body>
</html>
