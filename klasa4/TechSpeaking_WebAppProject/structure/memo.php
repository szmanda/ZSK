<div class="wynik"></div>
<div class="mainMemo">
</div>

<script src="./scripts/memo.js"></script>
<script>
let que = [];
let ans = [];

<?php
  $idlang1 = 1;
  $idlang2 = 2;
  $count = 12;

  require("./scripts/connect.php");

  $sql = "SELECT a.`id_word` AS id, a.`word` AS word, a.`definition` AS def,"
      . " b.`id_word` AS idtrans, b.`word` AS trans, b.`definition` AS deftrans\n"
      . "FROM `word` a\n"
      . "INNER JOIN `word` b\n"
      . "	ON a.`id_translation` = b.`id_word`\n"
      . "WHERE a.`id_lang`=$idlang1 AND b.`id_lang`=$idlang2\n"
      . "ORDER BY RAND()\n"
      . "LIMIT $count";


  $result = mysqli_query($conn,$sql);
  $i = 0;

  while ($row = mysqli_fetch_assoc($result)){
  echo "que[$i] = \"".$row["word"]."\";\n";
  echo "ans[$i] = \"".$row["trans"]."\";\n";
    $i++;
  }
?>
  console.log(<?php echo $i; ?>);
  StartMemoGame(que,ans);

</script>
