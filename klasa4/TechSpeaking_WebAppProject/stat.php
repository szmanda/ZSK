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
      /*Style for stats*/
      .statScore{
        color: white;
        font-family: monospace;
        font-size: 35vw;
        text-align: center;
        margin-top: -15vw;
        margin-bottom: -15vw;
      }
      .statDesc{
        text-align: center;
      }
      .statImg{
        margin-top:8vw;
        width: 28vw;
      }
    </style>
  </head>
  <body class="back-secondary">
    <?php
    // get points
    require("structure/header.php");
    require("./scripts/connect.php");
    $email = $_SESSION["email"];
    $sql = "SELECT `points` FROM `stduser` WHERE `email`=\"$email\"";
    $result = mysqli_query($conn,$sql);
    $points = mysqli_fetch_row($result)[0];
    ?>
    <div><h1 class="statDesc" style="font-size: 7vw;">You have collected</h1></div>
    <div class="statScore"><?php echo $points; ?><img class="statImg" src="./images/coinIcon.svg" alt="c">
    </div><div><h1 class="statDesc" style="font-size: 5vw;">Keep playing to earn more!</h1></div>

    <?php
    require("structure/footer.html");
    require_once("./styles/scripts.html");
    ?>
  </body>
</html>
