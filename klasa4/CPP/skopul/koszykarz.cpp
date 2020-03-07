#include <iostream>

using namespace std;

int main()
{
    //dane:
    int k, w, m;
    cin>>k>>w>>m;
    // k - wysokosc startowa
    // w - zadana wysokosc
    // m = krok

    //wynik:
    int r=0;
    // r - ilość kroków

    while (w-k>m*r) r++;

    cout<<r;


    return 0;
}
