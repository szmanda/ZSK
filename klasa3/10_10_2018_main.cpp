#include <iostream>
#include <cmath>

using namespace std;

int nrcounter(int a){

    int wynik = 0;
    while (a!=0){
    wynik += a%10;
    a/=10;
    }
    return wynik;
}

int main()
{
    std::cout<<nrcounter(12345)<<endl;

    std::cout<<"------\nZmienne i wskazniki\n\n";

    int *wskaznik;
    int zmienna = 123;
    wskaznik = &zmienna;

    cout<<wskaznik<<endl;
    cout<<&wskaznik<<endl;
    cout<<*wskaznik<<endl;
    cout<<zmienna<<endl;
    cout<<&zmienna<<endl;
    // cout<<&zmienna<<endl; doesnt exist

    cout<<"------\nTablice Dynamiczne\n\n";

    int * tablica = new int [5];
    tablica[0] = 11;
    tablica[1] = 22;
    tablica[2] = 33;
    tablica[3] = 44;
    tablica[4] = 55;


    cout<<tablica[0]<<endl;
    // cout<<*tablica[0]<<endl; desnt exist
    cout<<&tablica[0]<<endl;
    cout<<&tablica[1]<<endl;
    cout<<&tablica[2]<<endl;

    cout<<std::hex<<&tablica[1]-&tablica[0]<<std::dec; // =1


    wskaznik = &tablica[0] + 1;
    // rownoznaczne z:
    *wskaznik = tablica[0+1];

    cout<<"\n\n   wskaznik: "<<*wskaznik<<endl;





    //(a>b) ? jeœli prawda : jeœli fa³sz ;
    // if (a>b) jeœli prawda else jeœli fa³sz


    return 0;
}
