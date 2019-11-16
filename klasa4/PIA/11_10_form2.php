<?php
  if (!empty($_POST['name'])){
    echo $_POST['name'];
  }else{
    ?>
      <form method="post">
        <input type="text" name="name" placeholder="Imię" autofocus>
        <input type="submit" value="Zatwierdź">
      </form>
    <?php
  }
?>
