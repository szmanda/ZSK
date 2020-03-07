#include <iostream>

using namespace std;

int main()
{
    int n;
    cin>>n;

    int * dzielniki = new int[n];

    int t=0; //ilosc dzielnikow
    for (int i = 1; i<=n;i++){
        if (n%i==0){
            cout<<i<<endl;
            dzielniki[t++] = i;
        }
    }

    return 0;
}
