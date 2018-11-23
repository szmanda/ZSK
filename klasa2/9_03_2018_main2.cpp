#include <iostream>

using namespace std;


int f1ObliczSume(int a)
{
    return a;
}
int f1ObliczSume (int a, int b)
{
    return a + b;
}
int f1ObliczSume (int a, int b, int c)
{
    return a + b + c;
}
void f2Wypisz (int a){
    cout<<"Liczba calkowita: "<<a<<endl;
}
void f2Wypisz (double a){
    cout<<"Liczba rzeczywista: "<<a<<endl;
}
void f2Wypisz (char a){
    cout<<"Znak: "<<a<<endl;
}
double f3Oblicz(int a, double b)
{
    return a+b;
}
double f3Oblicz(double a,double b)
{
    return a*b;
}
int f3Oblicz(int a,int b)
{
    return a+b;
}
double f3Oblicz(int a,int b,double c)
{
    return (a+b)/c;
}

int main()
{
    cout<<" T: Przeladowanie funkcji"<<endl<<endl;
    int x = 2;
    int y = 5;
    int z = 10;

    //Prze³adowanie/Przeci¹¿enie funkcji ze wzglêdu na liczbê parametrów
    cout<<"jeden arg: "<<f1ObliczSume(x)<<endl;
    cout<<"dwa arg: "<<f1ObliczSume(x,z)<<endl;
    cout<<"trzy arg: "<<f1ObliczSume(x,z,z)<<endl<<endl;

    //Prze³adowanie/Przeci¹¿enie funkcji ze wzglêdu na typ parametrów
    int a=3;
    double b=5.7;
    double g=2.21;
    char c='c';
    char tab;

    f2Wypisz(a);
    f2Wypisz(b);
    f2Wypisz(c);
    cout<<endl<<endl;

    //Prze³adowanie/Przeci¹¿enie funkcji ze wzglêdu na typ i liczbê parametrów
    cout<<"int + double = "<<f3Oblicz(a,b)<<endl;
    cout<<"int + int = "<<f3Oblicz(a,x)<<endl;
    cout<<"double + double = "<<f3Oblicz(b,g)<<endl;
    cout<<"int + int = "<<f3Oblicz(y,z)<<endl;
    cout<<"(int + int) / double = "<<f3Oblicz(y,z,g)<<endl;


    return 0;
}
