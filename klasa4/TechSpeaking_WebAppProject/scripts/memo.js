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
  let tabA = [0,0,0,0,0,0,0,0,0];
  let tabB = ['🎈','b','c','d','e','f','g','h','i'];

  //let myCard = SpawnMemo("memoCard","div",mainMemo);
  //let cardContent = SpawnMemo("","p",myCard);
  //cardContent.innerHTML = "sss"
  let s = CreateCard("ss");

  let allCards = [];
  for (let i=0; i<18; i++){
    let rand;
    do{
      rand = getRandomInt(0,9);
    }while(tabA[rand]>=2);
    tabA[rand]++;
    allCards[i] = CreateCard(tabB[rand]);
  }




  console.log();

};
