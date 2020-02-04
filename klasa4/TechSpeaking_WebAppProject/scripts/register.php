<?php
$url="../loginForm.php?";
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

      $hash = password_hash($password, PASSWORD_ARGON2ID, ['memory_cost' => 1<<12, 'time_cost' => 2, 'threads' => 2]);

      $sql = "INSERT INTO `stduser`(`email`, `password`, `id_status`) VALUES (\"$email\",\"$hash\",NULL)";
      if (mysqli_query($conn,$sql)){
          $url = "../confirmEmail.php";
      }
    }

  }else{
    $url .= 'user=Account with a given e-mail address already exists.&';
  }
  mysqli_close($conn);
}
header("location: $url");
 ?>
