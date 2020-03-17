#include <iostream>
#include <fstream>
#include <windows.h>

using namespace std;

int main(){
  int a =0 ;
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
  plik<<"Zadanie3\n";
  for (int i=0; i<n; i++){
    bool czyOK = true;
    string s = slowa[i];
    int min = 1000;
    int max = 0;
    for (int j=0; j<s.length();j++){
      if (s[j]<min) min = s[j];
      if (s[j]>max) max = s[j];
    }
    if (max-min<=10) {a++;
      plik<<s<<endl;}
  }
  cout<<a;
  plik.close();

  return 0;
}
