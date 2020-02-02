<div class="row">
  <div class="col-xs-12 p-5">
    <div class="tile" id="grid">

    </div>
  </div>
  <?php
  // input from database
  $string = "mouse";
  ?>
  <script type="text/javascript">
    let word = "<?php echo $string; ?>";
    let sqr = 1;
    while (sqr**2<word.length) sqr++;
    document.querySelector("#grid").innerHTML = sqr;
    let tab;
    for (var i = 0; i < sqr; i++) {
      for (var j = 0; j < sqr; j++) {
        tab[i][j] = 'A';
      }
    }


  </script>
</div>
