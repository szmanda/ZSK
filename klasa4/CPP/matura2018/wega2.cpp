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
  // najróżniejsze slowo (index)
  int najrozniejsze = 0;
  // ilosc różnych liter
  int ilosc = 0;

  for (int i=0; i<n; i++){
    // tablica liter
    bool litery[40] = {false};
    int ile = 0;
    string s = slowa[i];
    for (int j=0; j<s.length();j++){
      if (litery[s[j]-'A']==false){
        litery[s[j]-'A']=true;
        ile++;
      }
    }
    if (ile>ilosc) {
      najrozniejsze = i;
      ilosc = ile;
    }
  }
  plik.close();
  plik.open("wyniki4.txt",ios::app);
  plik<<"Zadanie2\n";
  plik<<slowa[najrozniejsze]<<" "<<ilosc<<"\n";



  return 0;
}
