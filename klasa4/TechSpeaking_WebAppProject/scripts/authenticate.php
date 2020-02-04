<?php
$url="../loginForm.php?";
if (isset($_POST['loginButton']) && !empty($_POST['password']) && !empty($_POST['email']))
{
  $email = $_POST["email"];
  $password = $_POST["password"];

  $verified = false;



  // check for the same e-mail in database
  require_once("./connect.php");
  $sql = "SELECT `password` FROM `stduser` WHERE `email`=\"$email\"";
  $result = mysqli_query($conn,$sql);
  if ($result->num_rows===1){
    // there is given user
    $hash = mysqli_fetch_assoc($result)["password"];
    $verified = password_verify($password,$hash);

    if($verified)
    {
      // authenticated succesfully!
    }
    else{
      $url .= 'login=Enter correct password for authentication.';
    }
  }else{
    $url .= 'login=Account does not exists.';
  }
  mysqli_close($conn);
}
header("location: $url");
 ?>
