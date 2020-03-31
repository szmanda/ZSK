<header>


  <nav class="navbar navbar-expand-md navbar-dark back-secondary">
  <a class="navbar-brand" href="./index.php">
    Tech Speaking
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
  <ul class="navbar-nav mr-auto">
    <!-- ACTIVE ELEMENT -->
    <li class="nav-item active">
      <a class="nav-link" href="./index.php">Home<span class="sr-only">(current)</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="./memo.php">Memory</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="./grid.php">Grid</a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Learn
      </a>
      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <a class="dropdown-item" href="./memo.php">Memory</a>
        <a class="dropdown-item" href="./grid.php">Grid</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="./stat.php">Stats</a>
      </div>
    </li>
  </ul>
  </div>
  <div id="loginStatus">
    <?php
    if (isset($_SESSION["email"])){
      $email = explode('@',$_SESSION["email"])[0];
      echo <<< EMAIL
      <ul style="list-style-type:none;">
      <li class="nav-item dropdown">
        <a style="padding:0px;" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          $email
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="./index.php">Home</a>
          <a class="dropdown-item" href="./stat.php">Stats</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="./scripts/logoff.php">Sign out</a>
        </div>
      </li>
      </ul>
EMAIL;
    } else {
      echo '<a href="./loginForm.php">sign up | sign in</a>';
    }
     ?>
  </div>
  </nav>

</header>
