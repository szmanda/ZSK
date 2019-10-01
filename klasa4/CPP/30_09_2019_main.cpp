#include <iostream>
#include <cstdlib>
#include <fstream>

using namespace std;

int main()
{
    cout<<"korzystanie z plikow zewnetrznych"<<endl;

    ofstream zapis("wyjscie.txt");
    zapis<<3<<" "<<-20;
    zapis.close();

    int a = 4;
    float b = 8.5;

    ofstream wyj("ala.txt");    // (1) utworzenie obiektu wyj z otwarciem pliku ala.txt
    wyj<<a<<endl<<b;
    wyj.close();
    //wyj.open("ala.txt"); // ponowne otwarcie pliku usuwa wcze�niejsz� zawarto��
    //wyj.close();
    wyj.open("zosia.txt");
    wyj<<endl<<endl<<99;
    wyj.close();

    // stronka do matury mai2.edu.pl


    char nazwa[50]; //tablica znak�w na nazw� nowego pliku
    cout<<"Podaj nazwe pliku jaki chcesz utworzyc\n";
    cin>>nazwa;     //pobranie nazwy od usera
    ofstream wyniki(nazwa);     // otwarcie/utworzenie pliku
    wyniki<<'s';    // do pliku dopiszemyt liter� s
    wyniki.close();

    //kontrola błędów
    wyniki.open("out.txt");
    if(!wyniki){
        cout<<"nie można otworzyć pliku";
        return 1;
    }
    else{
        wyniki.close();
    }

    //odczyt z pliku
    plik.open("ala.txt", ios::in);
    if(plik.good() == true)
    {
        while(!plik.eof())
        {
            getline(plik, linia);
            cout << linia << endl; //wyświetlenie linii
        }
        plik.close();
    }


    /*  zadanie domowe (projekt)
        napisać w czymkolwiek byle bez kodu sortowanie bombelkowe i przez wybór
        np w excelu. prace przesłać na email. */

    return 0;
}
