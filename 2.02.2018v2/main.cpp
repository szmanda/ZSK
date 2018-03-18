//FUNKCJE czesc 1
#include <iostream>
using namespace std;

int Suma1(void){
    int a=4, b=3;
    return a+b;
}
int Suma2(void){
    int a=4, b=3;
    cout<<"\n suma wynosi: "<<a+b;
}


int main()
{
    cout<<"\n suma wynosi: "<<Suma1();
    Suma2();
    return 0;
}
