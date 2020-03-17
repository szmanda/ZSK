#include <iostream>
#include <fstream>
#include <cmath>

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

  int ile = 0;

  for (int i = 0; i < 200; i++) {
    for (int j = 0; j < 320; j++) {
      bool czyKontr = false;
      //kolumna
      if(i!=0){
        if(abs(piksele[i-1][j]-piksele[i][j])>128) czyKontr=true;
      }
      if(i!=199){
        if(abs(piksele[i+1][j]-piksele[i][j])>128) czyKontr=true;
      }
      //wiersz
      if(j!=0){
        if(abs(piksele[i][j-1]-piksele[i][j])>128) czyKontr=true;
      }
      if(j!=319){
        if(abs(piksele[i][j+1]-piksele[i][j])>128) czyKontr=true;
      }
      //przypadek ogólny:
      //if(abs(piksele[i+1][j]-piksele[i][j])>128) czyKontr=true; //kolumna
      //if(abs(piksele[i-1][j]-piksele[i][j])>128) czyKontr=true;
      //if(abs(piksele[i][j+1]-piksele[i][j])>128) czyKontr=true; //wiersz
      //if(abs(piksele[i][j-1]-piksele[i][j])>128) czyKontr=true;
      if (czyKontr) ile++;
    }
  }
  cout<<ile;

  plik.open("wyniki6.txt",ios::app);
  plik<<"Zadanie3\n";
  plik<<ile<<"\n";
  plik.close();

  return 0;
}
