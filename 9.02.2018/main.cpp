#include <iostream>

using namespace std;

void Fun1(void){
    cout<<"tekst\ntekst dwa\n";
}

void Fun2pole(void){
    int a=10, b=20;
    cout<<"pole: "<<a*b<<endl;
}

void Fun3dodawanie(void){
    int a;
    cout<<"podaj a: ";
    cin>>a;
    int b;
    cout<<"podaj b: ";
    cin>>b;
    cout<<"Wynik dodawania: "<<a<<" + "<<b<<" = "<<a+b<<endl;
}

void Fun4modulo(void){
    int a, b;
    cout<<"podaj liczbe: ";
    cin>>a;
    cout<<"podaj dzielnik: ";
    cin>>b;
    cout<<"reszta z dzialenia to: "<<a%b<<"\n\n";
}

int Fun5dodawanie(int a, int b){
    return a+b;
}

void FunA(void){
    // przeniesione z main
    Fun1();
    Fun2pole();
    Fun3dodawanie();
    Fun4modulo();
}

int main()
{


    while(true){
    cout<<"Kalkulator:\n-1- dodawanie\n-2- reszta z dzielenia\n-3- mnozenie";
    cout<<"\n  wybor:";
    int wybor;
    cin>>wybor;
    switch (wybor){
        case 1:
            Fun2pole();
            break;
        case 2:
            Fun3dodawanie();
            break;
        case 3:
            Fun4modulo();
            break;
        case 0:
            return 0;
    }
    }

    cout<<"podaj liczby do dodania\n";
    int a1, a2;
    cin>>a1>>a2;
    cout<<"suma: "<<Fun5dodawanie(a1,a2);


    return 0;
}
