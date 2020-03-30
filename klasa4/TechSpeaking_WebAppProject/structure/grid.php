<div class="wynik"></div>
<div class="row">
  <div class="col-xs-12 col-xl-12 pt-2 px-4">
    <div class="tile">
      <h1 class="g" style="text-align: center; font-size:3.5vw;"><?php echo "second lang" ?></h1>
      <h2 class="g" style="font-size: 8vw;">_ __ ________</h2>
      <div id="grid">

      </div>

    </div>
  </div>
</div>
<script src="./scripts/grid.js"></script>
<script>
  let que,ans;
  <?php
    require_once("./scripts/connect.php");

    $sql = "SELECT a.`id_word` AS id, a.`word` AS word, a.`definition` AS def,"
        . " b.`id_word` AS idtrans, b.`word` AS trans, b.`definition` AS deftrans\n"
        . "FROM `word` a\n"
        . "INNER JOIN `word` b\n"
        . "	ON a.`id_translation` = b.`id_word`\n"
        . "ORDER BY RAND()\n"
        . "LIMIT 1";

    $result = mysqli_query($conn,$sql);

    while ($row = mysqli_fetch_assoc($result)){
    echo "que = \"".$row["word"]."\";\n";
    echo "ans = \"".$row["trans"]."\";\n";
    }
  ?>
  GenerateGrid(que,ans);
</script>
