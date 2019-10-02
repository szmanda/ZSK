#include <iostream>

using namespace std;

int main() {
  int a, x, y;

  cout<<"## Obliczanie sumy liczb nie badacych dzielnikami liczby [a],";
  cout<<"w zakresie ([x];[y]) ##\n## [a],[x],[y] naleza do caakowitych, [a]<[x]<[y] ##\n";
  cout<<"Podaj liczbe [a]: ";
  cin>>a;
  cout<<"Podaj liczbe [x]: ";
  cin>>x;
  cout<<"Podaj liczbe [y]: ";
  cin>>y;

  int podzX = x%a + x;
  if (podzX==x) podzX += 3;
  int podzY = y - (y%a);
  if (podzY==y) podzY -= 3;

  cout<<podzX<<"\n";
  cout<<podzY<<"\n";

  // n-ty el. ciagu = podzX + (podzN - 1)*a
  int podzN = (podzY - podzX + a)/a;
  cout<<podzN<<"\n";
  //suma elementow podzielnych przez a
  int podzSuma = podzN * (podzX + podzY)/2.0;
  // suma wszystkich liczb całkowitych z podanego zakresu
  int allSuma = ((x+y)/2.0)*(y-x-1); // (!!!) musi być float (2.0), inaczej wynik jest przekłamany

  cout<<allSuma<<"\n";
  cout<<podzSuma<<"\n";
  int wynik = allSuma - podzSuma;

  cout<<"Suma wszystkich tych liczb to: "<<wynik<<"\n";



  return 0;
}
