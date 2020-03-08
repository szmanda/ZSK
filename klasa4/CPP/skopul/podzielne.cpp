#include <iostream>

using namespace std;

int main()
{
    // ile liczb z przedzialu <a,b> jest podzielne przez k
    int a,b,k;
    cin>>a>>b>>k;
    int count = 0;
    for (size_t i = a; i <= b; i++) {
      count += (i%k==0) ? 1 : 0;
    }
    cout<<count;

    return 0;

}
