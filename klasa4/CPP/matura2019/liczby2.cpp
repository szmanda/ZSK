#include <iostream>
#include <fstream>

using namespace std;

int silnia(int a){
  int wynik=1;
  for (int i = a; i > 1; i--) {
    wynik*=i;
  }
  return wynik;
}

int main()
{

    ifstream file;
    file.open("liczby.txt");
    fstream out;
    out.open("wyniki.txt",ios::app);
    out<<"Zadanie 2.\n";
    int liczba = 0;
    while(file>>liczba){
      int wynik = 0;
      int a = liczba;
      while(a>0){
        wynik+=silnia(a%10);
        a/=10;
      }
      if (liczba==wynik) out<<wynik<<endl;
    }
    out.close();
    file.close();
    return 0;
}
