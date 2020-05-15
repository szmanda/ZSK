#include <iostream>

using namespace std;

int main() {
  int x, s;
  cin>>x>>s;
  int ilosc = 0;
  while(x>0){
    ilosc++;
    if (s>1){
      x-=s;
      s/=2;
    }else
    x--;
  }
  cout<<ilosc;
  return 0;
}
