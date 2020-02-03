<div class="row">
  <div class="col-xs-12 col-xl-12 p-5">
    <div class="tile">
      <h1 style="text-align: center;"><?php echo "second lang" ?></h1>
      <h2 style="font-size:12vw;">_ __ ________</h2>
      <div id="grid">

      </div>

    </div>
  </div>
</div>


<?php
// input from database
$string = "computer mouse";
?>
<script type="text/javascript">

  let word = "<?php echo $string; ?>";
  let sqr = 1;
  while (sqr**2<word.length) sqr++;

  let tab = [];
  for (var i = 0; i < sqr; i++) {
    let pom = [];
    for (var j = 0; j < sqr; j++) {
      pom[j] = '';
    }
    tab[i] = pom;
  }
  let count = 0;
  var array = word.split("");
  let characters = "abcdefghijklmnoprstuwxyz";

  do{
    let x = Math.floor(Math.random() * 100)%sqr;
    let y = Math.floor(Math.random() * 100)%sqr;
    if (tab[x][y]!='') continue;
    if (count<word.length){
      tab[x][y] = array[count];
      console.log("x=",x,", y=",y,", a[",count,"]=",array[count]);
    }
    else{
      console.log(count);
      let c = Math.floor(Math.random() * 100)%26;
      let char = characters.charAt(c);
      tab[x][y] = char;
    }
    count++;
  }while(count<sqr**2);



  let out = document.querySelector("#grid");
  let width = 100/sqr;
  out.innerHTML = '';
  for (var i = 0; i < sqr; i++) {
    out.innerHTML += '<div class="gridRow"></div>';
    for (var j = 0; j < sqr; j++) {
      document.querySelectorAll("div.gridRow")[i].innerHTML += '<div class="gridLetter" onclick="LetterClicked(this)" style="width:'+width+'%;">'+tab[i][j]+'</div>';
    }
  }

  // before new word reset the following value
  var solved = 0;

  let answer = document.querySelector("h2");
  answer.innerHTML = "-";
  function LetterClicked(b){
    let letter = b.innerHTML;
    if (array[solved]==letter){
      if (!solved) answer.innerHTML = "";
      solved++;
      answer.innerHTML += letter;
      b.setAttribute("style",'width:'+width+'%; background-color: var(--bg-accent)');
      console.log("briliant!");
      if (solved==word.length){
        console.log("you have completed the task!");
      }
    }

  }

</script>
