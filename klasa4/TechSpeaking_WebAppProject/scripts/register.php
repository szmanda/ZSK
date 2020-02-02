<?php
$url="../draft.php?";
if (isset($_POST['createButton']) && !empty($_POST['password']) && !empty($_POST['rpassword']) && !empty($_POST['email']))
{
  $email = $_POST["email"];
  $password = $_POST["password"];

  if (mb_strlen($password)<8)
  $url .= 'pass=Your password has to contain at least 8 characters.&';
  if ($password!=$_POST["rpassword"])
  $url .= 'rep=Passwords does not match.&';

  // check for the same e-mail in database
  require_once("./connect.php");
  $sql = "SELECT * FROM `stduser` WHERE `email`=\"$email\"";
  $result = mysqli_query($conn,$sql);
  if ($result->num_rows===0){
    //no such user
    if($password==$_POST["rpassword"]&&mb_strlen($password)>=8)
    {
      //creating new user
    }

  }else{
    $url .= 'user=Account with a given e-mail address already exists.&';
  }
  mysqli_close($conn);
}
header("location: $url");
 ?>
