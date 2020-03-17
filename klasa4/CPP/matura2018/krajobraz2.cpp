#include <iostream>

using namespace std;


int main()
{
  // Dane:
  int n;
  cin>>n;
  float * x = new float [n];
  float * y = new float [n];
  for (int i = 0; i < n; i++) {
    cin>>x[i]>>y[i];
  }
  for (int i = 0; i < n-1; i++) {
    int lewy = i;
    for (int j = i+1; j<n; j++)
    {
      if ((x[lewy]/y[lewy])>(x[j]/y[j])){ //uwaga dzielenie (float!!!)
        lewy = j;
      }
    }
    swap(x[lewy],x[i]);
    swap(y[lewy],y[i]);
  }
  for (int i = 0; i < n; i++) {
    cout<<x[i]<<","<<y[i]<<endl;
  }

  return 0;
}
