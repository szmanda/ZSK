#include <iostream>
#include <iomanip> //konwersje
#include <cmath>

using namespace std;

int main(){
    cout<<"Silnia 0!=1 3!=1*2*3=6\n\n";
    int n, i=2, silnia=1;
    cout<<"podaj calkowite n: ";
    cin>>n;
    while(i<=n){
        silnia*=i;
        i++;
    }
    cout<<"silnia = "<<silnia<<endl<<endl<<endl;


    //nie działą
    /*
    cout<<"Liczba doskonala: \n 6=1+2+3 \n 28=1+2+4+6+7+14\n\n";
    cout<<"liczba ktora jest suma wszystkich swoich dzialnikow\n\n";

    int m;
    cout<<"podaj calkowite m: ";
    cin>>m;

    i=1;
    int suma=1;
    while(i<m==0){
        if(m%i==0){
            suma+=i;
        }
        i++;
    }
    if(suma==m){
        cout<<">> doskonala\n\n\n";
    }
    else{
        cout<<">> niedoskonala\n\n\n";
    }
    */

    //konwersje dec, hec, oct;
    int k=100;
    cout<<"k = "<<k<<"\n";
    cout<<"konwersja systemow liczbowych\n";
    cout<<"szesnastkowy: "<<hex<<k<<endl;
    cout<<"dziesietny"<<dec<<k<<endl;
    cout<<"osemkowy: "<<oct<<k<<endl;
    cout<<"liczba k zapisana na 8 znakach: ";
    cout<<"\n8 znakow:"<<setfill('0')<<setw(8)<<k;
    cout<<"\n"<<fixed<<setprecision(3)<<k;

    zadanie domowe:
    zamień podaną z klawiatury liczbę na systemy
    liczbowe:
        binarny, dziesiętny szesnastkowy, ósemkowy, siódemkowy:
            ze switch

    Uzytkownik podaje z klawiatury adres ip, zamień na liczbę
    binarną i uzupełnij każdy oktet do ośmiu znaków.

    return 0;
}
