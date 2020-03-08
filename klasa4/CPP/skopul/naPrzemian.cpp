#include <iostream>

using namespace std;

int main()
{
    // program określa dla n liczb calkowitych ich parzystosc
    int n;
    cin>>n;
    int * a = new int[n];
    for (size_t i = 0; i < n; i++) {
      cin>>a[i];
    }
    // parzyste
    for (size_t i = 0; i < n; i+=2) {
      cout<<a[i];
      if (i<n-2) cout<<" ";
      else cout<<endl;
    }
    // nieparzyste
    for (size_t i = 1; i < n; i+=2) {
      cout<<a[i];
      if (i<n-2) cout<<" ";
      else cout<<endl;
    }
    return 0;
}
