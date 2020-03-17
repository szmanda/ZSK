#include <iostream>
#include <fstream>

using namespace std;

int dzielnik(int a, int b){
  while(a!=b){
    if (a>b) a-=b;
    else b-=a;
  }
  return a;
}

int main()
{
  ifstream file;
  file.open("liczby.txt");
  fstream out;
  out.open("wyniki.txt",ios::app);
  cout<<"Zadanie 3.\n";

  int liczby[500];
  int c = 0;
  for (size_t i = 0; i < 500; i++) {
    file>>liczby[i];
  }
  int nwd = 1, pierwszy = 0, dlugosc = 0;
  int pierwszyLocal = 0, dlugoscLocal = 0, nwdLocal = 1;
  for (size_t i = 1; i < 500; i++) {
    if (nwdLocal==1){
      i = pierwszyLocal+1; //czy ta linia jest potrzebna?
      pierwszyLocal = i;
      nwdLocal = liczby[i];
    }
    if (dzielnik(nwdLocal,liczby[i])>1) dlugoscLocal++;
    else dlugoscLocal = 0;

    if (dlugoscLocal>dlugosc){
      pierwszy = pierwszyLocal;
      dlugosc = dlugoscLocal;
      nwd = nwdLocal;
    }

    nwdLocal = dzielnik(nwdLocal,liczby[i]);
  }
  cout<<liczby[pierwszy]<<"\n"<<dlugosc<<"\n"<<nwd;

  out.close();
  file.close();

  return 0;
}
