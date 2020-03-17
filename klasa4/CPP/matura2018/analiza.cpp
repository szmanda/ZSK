#include <iostream>

using namespace std;


int main()
{
  // Dane:
  int n;
  cin>>n;
  int p=1, q=n;
  while (p < q){
    int s = (p+q)/2;
    if (s*s*s<n)
      p = s+1;
    else
      q = s;
  }
  cout<<p;
  return 0;
}
