#include <iostream>
#include <cstdlib>
#include <cmath>

using namespace std;

void line(int a, string b){ //nag³owek funkcji, a/b - argument/parametr formalny
    for (int i = 0; i<a; i++){
        cout<<b;                    //cialo funkcji
    }
    cout<<endl;
}


int nwd(int a, int b);

void mytests(); //deklaracja funkcji

int main(){

    line(5," free!"); // 5,"free" - arumenty aktualne

    int wynik = nwd(72, 56);

    cout<<wynik<<endl<<endl;

    mytests();



    return 0;
}

void mytests(){ //definicja funkcji

    cout<<" -= funkcja mytest =-\n tesowanie funkcji string\n\n";

    string tescik = "arrrbcdefghijkl";

    cout<<tescik.data()<<endl;

    cout<<tescik.find("f")<<endl; //nr znaku od 0
    cout<<tescik.find_first_of("ar")<<endl; //pierwsze wyst¹pienie od numeru
    cout<<tescik.find_last_of("rb")<<endl; //ostatnie wystapienie do numeru

    string tescik2 = "arrrbchjjhfddef";

    cout<<tescik.compare(tescik2)<<endl;
}

int nwd(int a, int b){
    if (a==b) return a;
    else if (a>b) return nwd(a-b,b);
    else return nwd(b-a,a);
}
