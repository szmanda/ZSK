#include <iostream>
#include <fstream>

using namespace std;

bool czyPotega(int a){
  while (a!=1){
    if (a%3!=0) return false;
    a/=3;
  }
  return true;
}

int main()
{
    fstream file;
    file.open("liczby.txt");
    int licznik = 0;
    int liczba = 0;
    while(file>>liczba){
      if (czyPotega(liczba)) licznik++;
    }
    file.close();

    file.open("wyniki.txt",ios::app);
    file<<"Zadanie 1."<<endl;
    file<<licznik<<endl;
    file.close();
    return 0;
}
