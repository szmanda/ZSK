function getRandomInt(min, max) {
  return Math.floor(Math.random() * Math.floor(max-min+1))+min;
}
function SpawnMemo(ClassName = "",type = "div",node = document.body) {
  let newObj = document.createElement(type);
  newObj.className = ClassName;
  return node.appendChild(newObj);
}
function HideCard(card){
  card.style.transform = " rotateY(180deg)";
  setTimeout(()=>{card.firstChild.hidden=true;},250);
  card.addEventListener("click", ttt);
}
function ShowCard(card){
  card.style.transform = " rotateY(0deg)";
  setTimeout(()=>{card.firstChild.hidden=false;},250);
  card.removeEventListener("click", ttt);
}
function CreateCard(str){
  let mainMemo = document.querySelector(".mainMemo");
  let obj = SpawnMemo("memoCard","div",mainMemo);
  let txt = SpawnMemo("","p",obj);
  txt.hidden=true;
  txt.innerText=str;
  return obj;
}
let activeTile = null;
function ttt(e){
  let teraz = e.target;
  let a = activeTile;
  ShowCard(teraz);
  if(activeTile==null){
    activeTile = teraz;
  }
  else if(activeTile!==teraz){
    // dziwne rzeczy
    if(activeTile.val == teraz.val){
      activeTile.className += " memoCardUnactive";
      teraz.className += " memoCardUnactive";
    }
    else{
      setTimeout(()=>{HideCard(teraz);HideCard(a)},1000);
    }
    activeTile = null;
  }
}
function StartMemoGame(tabQue,tabAns){ // 12 elements
  let tabA = [0,0,0,0,0,0,0,0,0,0,0,0];

  let allCards = [];
  for (let i=0; i<24; i++){
    let rand;
    do{
      rand = getRandomInt(0,11);
    }while(tabA[rand]>=2);
    tabA[rand]++;
    if (tabA[rand]==1)
      allCards[i] = CreateCard(tabQue[rand]);
    else
      allCards[i] = CreateCard(tabAns[rand]);
    allCards[i].val = rand;
  }
  for (let i=0; i<24; i++){
    allCards[i].addEventListener("click", ttt);
  }
}

window.onload = ()=>{
  //tabQue = ["☘️","🗝️","🌻","🚓","🚋","🍉","🍌","⚽","🛥️","🧯","💡","🚆"];
  //tabAns = ["☘️a","🗝a️","🌻a","🚓a","🚋a","🍉a","🍌a","⚽a","🛥a️","🧯a","💡a","🚆a"];
  //StartMemoGame(tabQue,tabAns);

};
