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
}
function ShowCard(card){
  card.style.transform = " rotateY(0deg)";
  setTimeout(()=>{card.firstChild.hidden=false;},250);
}
function CreateCard(str){
  let mainMemo = document.querySelector(".mainMemo");
  let obj = SpawnMemo("memoCard","div",mainMemo);
  let txt = SpawnMemo("","p",obj);
  txt.hidden=true;
  txt.innerText=str;
  return obj;
}

window.onload = ()=>{
  // 9 emotek
  let tabA = [0,0,0,0,0,0,0,0,0,0,0,0];
  let tabB = ["☘️","🗝️","🌻","🚓","🚋","🍉","🍌","⚽","🛥️","🧯","💡","🚆"];
  let activeTile = null;

  let allCards = [];
  for (let i=0; i<24; i++){
    let rand;
    do{
      rand = getRandomInt(0,11);
    }while(tabA[rand]>=2);
    tabA[rand]++;
    allCards[i] = CreateCard(tabB[rand]);
    allCards[i].val = rand;
  }
  for (let i = 0; i<24; i++){
    allCards[i].addEventListener("click", ttt);
  }
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
        activeTile.removeEventListener("click", ttt);
        teraz.removeEventListener("click", ttt);
      }
      else{
        setTimeout(()=>{HideCard(teraz);HideCard(a)},1000);
      }
      activeTile = null;
    }
  }



  console.log();

};
