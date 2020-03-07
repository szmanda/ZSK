#include <iostream>

using namespace std;

int main()
{
    int n;
    cin>>n;
    int current;
    int wynik=0;
    for (int i=0;i<n;i++){
        cin>>current;
        if (current==6)wynik++;
    }
    cout<<wynik;

    return 0;
}
