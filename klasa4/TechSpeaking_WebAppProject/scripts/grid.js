console.log("grid.js")

function CalculatePoints(score = 0){
  console.log("endscreen");
  let endScreen = document.querySelector(".wynik");
  endScreen.innerHTML = "<h1 style=\"font-size: 6.2vw;\">You won!</h1><h2>You earned "+score+" points!</h2>";

  let obj = document.createElement("div");
  obj.className = "gridLetter";
  let b = endScreen.appendChild(obj);
  b.innerHTML = 'get yours '+score+'<img class="coin" src="./images/coinIcon.svg" alt="c" style="margin-left:3px; width:30px;">';
  b.style.marginRight = "10%";
  b.style.marginLeft = "10%";
  b.addEventListener("click", function (){
    window.location.href = "./scripts/addPoints.php?p="+score+"&r=../grid.php";
  });
}

var word;
var solved;
var sqr = 1;

function GenerateGrid(mWord,mQuestion){
  word = mWord;
  solved = 0;
  document.querySelector("h1.g").innerText = mQuestion;
  let answer = document.querySelector("h2.g");
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
  let answer = document.querySelector("h2.g");
  let width = 100/sqr;

  if (word.split("")[solved]==letter){
    if (!solved) answer.innerHTML = "";
    solved++;
    answer.innerHTML += letter;
    b.setAttribute("style",'width:'+width+'%; background-color: var(--bg-accent)');
    console.log("briliant!");
    if (solved==word.length){
      //CalculatePoints()
      console.log("you have completed the task!");
      points = (solved/2>0) ? solved/2 : 1;
      CalculatePoints(parseInt(points))
    }
  }
}
