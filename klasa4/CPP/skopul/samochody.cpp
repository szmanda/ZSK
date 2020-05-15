#include <iostream>

using namespace std;

int main() {
  int ile;
  cin>>ile;
  bool * samochody = new bool[ile];
  for (int i = 0; i < ile; i++) {
    cin>>samochody[i];
  }

  int suma = 0, wschod = 0, zachod = 0;
  for (int i = 0, j = ile-1 ; i < ile; i++, j--) {
    if (samochody[i]==0){
      wschod++;
    }
    else {
      suma+=wschod;
      wschod = 0;
    }
    if (samochody[j]==1){
      zachod++;
    }
    else {
      suma+=zachod;
      zachod = 0;
    }
  }
  cout<<suma;

  return 0;
}
