<?php
  require_once("./scripts/connect.php");
  $userExistError = '';
  $passwordError = '';
  $rpasswordError = '';
  $loginError = '';
  if (isset($_GET["user"])) $userExistError = $_GET["user"];
  if (isset($_GET["pass"])) $passwordError = $_GET["pass"];
  if (isset($_GET["rep"])) $rpasswordError = $_GET["rep"];
  if (isset($_GET["login"])) $loginError = $_GET["login"];

 ?>
 <div class="row mt-5 mr-0">
   <div class="col-xs-12 col-md-6">
     <div class="tile">
       <h2>Login to your account</h2>
       <form action="./scripts/authenticate.php" class="login formP" method="post">
          <input type="text" name="email" placeholder="e-mail"><br>
          <input type="password" name="password" placeholder="password"><br>
          <div class="bg-danger"><?php echo $loginError ?></div>
          <!-- not implemeted yet -->
          <a href="#" class="accent" style="margin-left:10%;">I had forgotten my password.</a>
          <input type="submit" name="loginButton" value="Sign in">
       </form>
     </div>
   </div>
   <div class="col-xs-12 col-md-6">
     <div class="tile">
       <h2>Create new account</h2>
       <form action="./scripts/register.php" class="login formP" method="post">
         <div class="bg-danger"><?php echo $userExistError ?></div>
         <input type="text" name="email" placeholder="e-mail"><br>
         <div class="bg-danger"><?php echo $passwordError ?></div>
         <input type="password" name="password" placeholder="password"><br>
         <div class="bg-danger"><?php echo $rpasswordError ?></div>
         <input type="password" name="rpassword" placeholder="repeat password"><br>
         <input type="submit" name="createButton" value="Sign in">
       </form>
     </div>
   </div>
 </div>
