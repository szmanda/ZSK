#include <iostream>

using namespace std;

int main()
{
    //dane:
    int n;
    cin>>n;
    int * a = new int[n];
    for (int i=0; i<n; i++){
      cin>>a[i];
    }
    //algorytm:
    int start = 0, stop = n-1;
    int s;
    while (start < stop){
      s = (start+stop)/2;
      if (a[s]%2==1) start = s+1;
      else stop = s;
    }
    cout<<n-stop;



    return 0;

}
