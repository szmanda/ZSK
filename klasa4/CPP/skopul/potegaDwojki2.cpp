#include <iostream>

using namespace std;

int main()
{
    //program zwraca ostatnia cyfrę 2^n, 1<=n<=30000
    int n;
    cin>>n;
    // 2^1=2, 2^2=4, 2^3=8, 2^4=16, 2^5=32, ...
    if (n%4==1) cout<<2;
    else if (n%4==2) cout<<4;
    else if (n%4==3) cout<<8;
    else if (n%4==0) cout<<6;

}
