#include <iostream>
#include <windows.h>

using namespace std;

long silnia(long a);
long silniapodwojna(long a);
long silniawielokrotna(long a, int b);
void latawiec(int a, char b);
void animation(){
    int a=10;
    while (a>0){
        latawiec (a,'&');
        a--;
        Sleep(30 + a*a*a/ 5);
        system("cls");
    }
}

int main(){
    animation();
    cout<<silnia(9)<<endl;
    cout<<silniapodwojna(9)<<endl;


    return 0;
}

long silnia(long a){
    if (a<=1) return 1;
    else return a*(silnia(a-1));
}

long silniapodwojna(long a){
    if (a<=1) return 1;
    else return a*(silnia(a-2));
}

long silniawielkorotna(long a, int b){
    if (a<=0) return 1;
    else if (a<b) return a;
    else return a*(silnia(a-b));
}

void latawiec(int a, char b){
    for (int i=0; i<=a; i++){
        for (int j=0; j<=(2*a)+1; j++){
            if ((j==a+i+1)||(j==a-i)) cout<<b;
            else cout<<' ';
        }
        cout<<endl;
    }
    for (int i=a; i>=0; i--){
        for (int j=0; j<=(2*a)+1; j++){
            if ((j==a+i+1)||(j==a-i)) cout<<b;
            else cout<<' ';
        }
        cout<<endl;
    }
}
