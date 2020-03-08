#include <iostream>

using namespace std;

int main()
{
    // wypisywanie w kolejnosci podanej i odwrotnej
    int a[3];
    for (size_t i = 0; i < 3; i++) {
      cin>>a[i];
    }
    for (size_t i = 0; i < 3; i++) {
      cout<<a[i];
      if (i<2)cout<<" ";
      else cout<<"\n";
    }
    for (size_t i = 0; i < 3; i++) {
      cout<<a[2-i];
      if (i<2)cout<<" ";
      else cout<<"\n";
    }
    return 0;

}
