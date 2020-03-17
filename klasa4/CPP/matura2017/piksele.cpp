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
  int max = 0;
  for (int i = 0; i<200; i++) {
    for (int j=0; j<320;j++) {
      int jasnosc = piksele[i][j];
      int local = 1;
      for(int k=i+1; k<200; k++){
        if (piksele[k][j]==jasnosc){
          local++;
        }
        else{
          break;
        }
      }
      if (local>max) max = local;
    }
  }

  cout<<max;


  plik.open("wyniki6.txt",ios::app);
  plik<<"Zadanie4\n";
  plik<<max<<"\n";
  plik.close();

  return 0;
}
