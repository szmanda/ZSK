<?php
  //require_once("../scripts/connect.php");


 ?>
 <div class="row mt-5 mr-0">
   <div class="col-xs-12 col-md-6">
     <div class="tile">
       <h2>Login to your account</h2>
       <form class="login" method="post">
          <input type="text" name="login" placeholder="login"><br>
          <input type="password" name="password" placeholder="password"><br>
          <input type="submit" name="loginButton" value="Sign in">
       </form>
     </div>
   </div>
   <div class="col-xs-12 col-md-6">
     <div class="tile">
       <h2>Create new account</h2>
       <form class="login" method="post">
         <input type="text" name="email" placeholder="e-mail"><br>
         <input type="text" name="login" placeholder="login"><br>
         <input type="password" name="password" placeholder="password"><br>
         <input type="text" name="nick" placeholder="public nametag"><br>
         <input type="submit" name="createButton" value="Sign in">
       </form>
     </div>
   </div>
 </div>
