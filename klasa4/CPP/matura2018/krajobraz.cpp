#include <iostream>

using namespace std;


int main()
{
  // Dane:
  int n;
  cin>>n;
  int * x = new int [n];
  int * y = new int [n];
  for (int i = 0; i < n; i++) {
    cin>>x[i]>>y[i];
  }
  int lewy = 0;
  for (int i = 0; i<n ;i++)
  {
    if (x[lewy]/y[lewy]>x[i]/y[i]){
      lewy = i;
    }
  }
  char out = lewy+'A';
  cout<<out<<"("<<x[lewy]<<","<<y[lewy]<<")";
  return 0;
}
