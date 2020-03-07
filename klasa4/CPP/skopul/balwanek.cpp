#include <iostream>

using namespace std;

double pow(double x,int y){
    double wynik = 1;
    for (int i=0; i<y;i++) wynik*=x;
    return wynik;
}

int main()
{
    int x,k;
    cin>>x>>k;
    double litry, q=2;
    //1/4k, 1/2k, k, 2k, 4k
    litry = k * (1-pow(q,3))/(1-q);
    int i =1;
    if (litry>x)
    do{
        litry = k/pow(q,i) * (1-pow(q,3))/(1-q);
        i++;
    }while(litry>x);
    cout<<litry*1000;

    return 0;
}
