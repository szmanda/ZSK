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
<<<<<<< HEAD
      //$sql = "INSERT INTO `stduser`(`email`, `password`, `id_status`) VALUES (\'$email\',\'$password\',NULL)";
=======
<<<<<<< HEAD
      $sql = "INSERT INTO `stduser`(`email`, `password`, `id_status`) VALUES (\'$email\',\'$password\',NULL)";
=======
>>>>>>> d8fda414db8241d3c565a2ccc5093b1816f462e5
>>>>>>> e6eb9c76b4605fb9e3507c8c9f236076f973c945
    }

  }else{
    $url .= 'user=Account with a given e-mail address already exists.&';
  }
  mysqli_close($conn);
}
header("location: $url");
 ?>
