console.log("grid.js");

var word;
var solved;
var sqr = 1;

function GenerateGrid(mWord,mQuestion){
  word = mWord;
  solved = 0;
  document.querySelector("h1").innerText = mQuestion;
  let answer = document.querySelector("h2");
  answer.innerHTML = "-";

  while (sqr**2<word.length) sqr++;

  let tab = [];
  for (var i = 0; i < sqr; i++) {
    let pom = [];
    for (var j = 0; j < sqr; j++) {
      pom[j] = '';
    }
    tab[i] = pom;
  }

  // filling tab[][]
  let characters = "abcdefghijklmnoprstuwxyz";
  count = 0;
  do{
    let x = Math.floor(Math.random() * 100)%sqr;
    let y = Math.floor(Math.random() * 100)%sqr;
    if (tab[x][y]!='') continue;
    if (count<word.length){
      tab[x][y] = word.split("")[count];
      console.log("x=",x,", y=",y,", a[",count,"]=",word.split("")[count]);
    }
    else{
      console.log(count);
      let c = Math.floor(Math.random() * 100)%26;
      let char = characters.charAt(c);
      tab[x][y] = char;
    }
    count++;
  }while(count<sqr**2);

  // writing tab[][]
  let out = document.querySelector("#grid");
  let width = 100/sqr;
  out.innerHTML = '';
  for (var i = 0; i < sqr; i++) {
    out.innerHTML += '<div class="gridRow"></div>';
    for (var j = 0; j < sqr; j++) {
      document.querySelectorAll("div.gridRow")[i].innerHTML += '<div class="gridLetter" onclick="LetterClicked(this)" style="width:'+width+'%;">'+tab[i][j]+'</div>';
    }
  }
}

function LetterClicked(b){
  let letter = b.innerHTML;
  let answer = document.querySelector("h2");
  let width = 100/sqr;

  if (word.split("")[solved]==letter){
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
