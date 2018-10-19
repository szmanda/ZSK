#include <iostream>

using namespace std;

int bezwzgledna(int a);
bool zaprzyjaznione(int a, int b);
bool odwrotna(int a);
void faktoryzacja(int a);

int main(){
    return 0;
}

int bezwzgledna(int a){
    if (a<0) return -a; else return a;
}

bool zaprzyjaznione(int a, int b){
    int sumaA = 0;
    int sumaB = 0;
    for (int i=1;i<a;i++){
        if((a%i)==0)sumaA+=i;
    }
    for (int i=1;i<b;i++){
        if((b%i)==0)sumaB+=i;
    }
    return (sumaA==sumaB);
}

bool odwrotna(int a){
    int odwr=0/10;
    while (a>0){
        odwr = odwr*10 + (a%10);
        a=a/10;
    }
    cout<<odwr;
    return (odwr==a);
}
void faktoryzacja(int a){
    for (int i=2;i<a;){
        if((a%i)==0) {
            cout<<i<<endl;
            a=a/i;
        }
        else i++;
    }
    cout<<a<<endl;
    cout<<1<<endl;
}
