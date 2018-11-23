#include <iostream>

using namespace std;

int a; //zmienna globalna
void f1Oblicz1 (void);
void f2Oblicz2 (void);
void f2Oblicz2v2 (void);
void f3Oblicz3 (int &z);
void f4Oblicz4 (int z);

int main()
{
    cout<<" T: CD Zasiegi zmiennych"<<endl<<endl;
    a=0;
    cout<<"a w main: "<<a<<endl;//a=0
    f1Oblicz1();//a=10
    cout<<"a w main: "<<a<<endl;//a=0
    f2Oblicz2();//a=20
    cout<<"a w main: "<<a<<endl;//a=20
    f2Oblicz2v2();
    cout<<"a w main: "<<a<<endl;//a=24
    f3Oblicz3(a);//a=-5
    cout<<"a w main: "<<a<<endl;//a=-5
    f4Oblicz4(a);//a=-7
    cout<<"a w main: "<<a<<endl;//a=-5

    return 0;
}

void f1Oblicz1 (void)
{
    int a;
    a=10;
    cout<<"a w f1Oblicz1() : "<<a<<endl;

}
void f2Oblicz2 (void)
{
    a=20;
    cout<<"a w f2Oblicz2() : "<<a<<endl;
}
void f2Oblicz2v2 (void)
{
    a=24;
    cout<<"a w f2Oblicz2v2() c1 : "<<a<<endl;\
    int a=26;
    cout<<"a w f2Oblicz2v2() c2 : "<<a<<endl;
}
void f3Oblicz3 (int &z)
{
    z=-5;
    cout<<"a w f3Oblicz3() : "<<z<<endl;
}
void f4Oblicz4 (int z)
{
    z=-7;
    cout<<"a w f3Oblicz3() : "<<z<<endl;
}
