#include <iostream>

using namespace std;

int main()
{
    int odleglosc, dl1, dl2;
    cin>>odleglosc>>dl1>>dl2;
    bool tura = true; // true- kazik, false- adrian

    while (odleglosc>0){
        if (tura) odleglosc-=dl1;
        else odleglosc-=dl2;
        tura = !tura;
    }
    if (tura) cout<<1;
    else cout<<0;

    return 0;
}
