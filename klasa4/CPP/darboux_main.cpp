#include <iostream>
#include <cmath>

using namespace std;

double fun(double x,double tab[],int len){
    double wynik=0;
    /*for (int i = 0; i<len; i++){
        wynik += tab[i]*pow(x,len-i);
    }*/
    return 3*pow(x,11) + 2*pow(x,7) + -34*pow(x,4)+20;
}

double fun(double x){
    return 3*pow(x,11) + 2*pow(x,7) + -34*pow(x,4)+20;
}

double funRek(double x,double y){
    if (fun(x)*fun(y)){
        if ((y-x)<0.00001)
            cout<<"funkcja przyjmuje wartosc 0 w przedz: <"<<x<<";"<<y<<">";
        else
            funRek(x,x+(x-y)/2);
            funRek(x+(x-y)/2,y);
    }
    return 0;
}

int main()
{
    cout<<"Tw darboux"<<endl;
    double start = -100, stop=100;
    double ile=10000;

    cout<<"podaj wspolczynniki dla x^n:\n";


    double step = (stop-start)/ile;
    double cursor = start;

    double tab[3] = {1,2,3};
    int len = 3;

    while(cursor<stop){
        if (fun(cursor,tab,len)*fun(cursor+step,tab,len)<=0)
            cout<<"funkcja przeciela os OX w przedziale <"<<cursor<<";"<<cursor+step<<">\n";
        cursor+=step;
    }

    funRek(-100,100);


    return 0;
}
