#include <iostream>

using namespace std;

void pisz(string s, int k, int n){
  if (s.length()==k) {
    cout<<s<<endl;
  }
  else {
    for (size_t i = 0; i < k; i++) {
      char a = i+'0';
      pisz(s+a,k,n);
    }
  }
}

int main()
{
    pisz("",3,2);
    return 0;

}
