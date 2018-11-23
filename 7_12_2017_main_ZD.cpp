#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <ctime>

using namespace std;

void ZgadnijHaslo()
{
    cout << "-=zgadnij haslo=-" << endl;

    int licznik = 1;
    string haslo = "zsk";
    string proba;

    while (licznik<=3)
    {
        cout<<"podaj haslo; ";
        cin>>proba;
        if (proba==haslo)
        {
            cout<<"\n\n\n odgadles haslo w "<<licznik<<" probie";
            break;
        }
        licznik++;
    }
    if (proba!=haslo) cout<<"NIE ODGADLES HASLA, ZBYT WIELE PROB";
}

void LosujLiczby()
{
    cout << "\n\n\n-=losowanie liczb=-" << endl;

    srand(time( NULL));
    int liczby[3], m;
    for (int i=0;i<3;i++)
    {
        liczby[i]=rand()%567;
        cout<<liczby[i]<<"   ";
    }

    m=liczby[0];
    for (int i=1;i<3;i++)
    {
        if (m<liczby[i])
        {
            m=liczby[i];
        }
    }
    cout<<"\n"<<m;
}

int main()
{
    cout<<"wybierz opcje:\n[1]zgadnij haslo\n[2]losuj liczby\n\n";
    char opcja;
    cin>>opcja;
    switch (opcja) {
    case '1':
        ZgadnijHaslo();
        break;
    case '2':
        LosujLiczby();
        break;
    default:
        cout<<"niepoprawna opcja";
    }
    return 0;
}
