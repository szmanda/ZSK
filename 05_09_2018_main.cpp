#include <iostream>

using namespace std;


void abc (int a){
    for (int i=0 ; i<=a ; i++){
        for (int j=0 ; j<=i ; j++){
            cout<<'X';
        }
        cout<<"\n";
    }
    cout<<endl;
}

void bcd (int a){
    int b = 5;
    a<b ? cout<<"lower than 5" : cout<<"xD";

    cout<<endl;
}

int main(){
    cout<<"Square field calculator"<<endl;
    int a;
    cin>>a;
    cout<<"output: "<<a*a<<endl;

    if ((a>=3)&&(a<10)){
    abc(a);
    for (int i=0 ; i<=a ; i++) cout<<i;
    }
    bcd(a);
    return 0;
}
