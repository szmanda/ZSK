#include <iostream>

using namespace std;

int a = 5; //zmianna globalna

void f1(void){
    cout<<"Pierwsza funkcja\n";
}
void f2(int a, int b){
    cout<<"\nDruga funkcja\n";
    cout<<"suma: "<<a+b;
}
int f3(int a, int b){
    cout<<"Trzecia funkcja\n";
    return a+b;
}
int f4(int liczba){
    liczba*=2;
    return liczba;
}
void copyMain1(void){

    cout<<"\n\n\nFUNKCJE\n";
    f1();

    f2(5,8);

    cout<<"\nSuma funkcji 3 jest rowna: "<<f3(5,8)<<endl;
    if (f3(5,8)%2==0)
    cout<<"nie ";
    cout<<"jest parzysta\n";

    int dlugosc = 5;
    dlugosc = f4(dlugosc);
    cout<<"\ndlugosc*2 = "<<dlugosc<<endl;
}

int f5(void){
    int b = 2; //zmienna lokalna
    return a+b;
}
int f6(int a){
    return a;
}
void f7(int *n){ //wskaznik
    *n=*n *10;
    cout<<"wartosc zmiennej wewnatrz funkcji7: "<<*n<<endl;
}
void f8(int n){
    n=n*10;
    cout<<"wartosc zmiennej wewnatrz funkcji8: "<<n<<endl;
}
void f9(int &n){ //referencje
    n*=2;
    cout<<"Wewnatrz funkcji: "<<n;
}

int main(){
    cout<<"T: Funkcje, Wskazniki, Zasieg zmiennych, Referencje\n\n";

    copyMain1();

    int c = 3; //zmienna lokalna

    //wskazniki!!!
    cout<<"\n\n\nWSKAZNIKI\n";
    int x = 5;
    int y = 5;
    f7(&x);
    cout<<"wartosc zmiennej x na zewnatrz funkcji: "<<x<<endl;
    f8(y);
    cout<<"wartosc zmiennej y na zewnatrz funkcji: "<<y<<endl;

    cout<<"\n\n\nREFERENCJE\n";
    int z = 5;
    f9(z);
    cout<<"\nNa zewnatrz funkcji: "<<z;


    return 0;
}
