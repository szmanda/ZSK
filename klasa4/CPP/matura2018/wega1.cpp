#include <iostream>
#include <fstream>

using namespace std;

int main(){

  //dane:
  int n = 1000;
  string slowa[1000];
  //wczytanie danych
  fstream plik;
  plik.open("sygnaly.txt");
  for (int i = 0; i < 1000; i++) {
    plik>>slowa[i];
  }
  plik.close();
  plik.open("wyniki4.txt",ios::app);
  plik<<"Zadanie1\n";
  for (int i=0; i<n; i++){
    if ((i+1)%40==0){
      //co czterdzieste słowo
      string s = slowa[i];
      plik<<s[9];
    }
  }
  plik<<endl;
  plik.close();

  return 0;
}
