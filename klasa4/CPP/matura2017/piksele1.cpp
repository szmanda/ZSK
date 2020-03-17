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
  int piksel;
  int min = 255;
  int max = 0;
  while (plik>>piksel){
    if (piksel<min) min = piksel;
    if (piksel>max) max = piksel;
  }
  plik.close();
  plik.open("wyniki6.txt",ios::app);
  plik<<"Zadanie1\n";
  plik<<max<<" "<<min<<endl;
  plik.close();

  return 0;
}
