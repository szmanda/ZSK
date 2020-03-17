#include <iostream>
#include <fstream>

using namespace std;

int main(){

  //dane:
  int n = 1000;
  string slowa[1000];
  //wczytanie danych
  fstream plik;
  plik.open("dane.txt");
  int piksele[200][320];
  for (int i=0; i<200;i++){
    for (int j = 0; j < 320; j++) {
      plik>>piksele[i][j];
    }
  }

  plik.close();
  int doUsuniecia = 0;
  for (int i=0; i<200;i++){
    bool czySpelnia = true;
    for(int j=0 ; j<=160; j++){
      if (piksele[i][j]!=piksele[i][319-j])
        czySpelnia = false;
    }
    if (czySpelnia==false) doUsuniecia++;
  }
  cout<<doUsuniecia;



  plik.open("wyniki6.txt",ios::app);
  plik<<"Zadanie2\n";
  plik<<doUsuniecia<<"\n";
  plik.close();

  return 0;
}
