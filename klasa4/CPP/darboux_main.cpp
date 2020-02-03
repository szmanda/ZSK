#include <iostream>
#include <cmath>

using namespace std;

double fun(double x){
    return 3*pow(x,11) + 2*pow(x,7) + -34*pow(x,4)+20;
}

double funRek(double x,double y){
    double step = (y-x)/2;
    //cout<<"x="<<x<<" y="<<y<<endl;
    if (fun(x)*fun(y)<=0){
        if ((y-x)<=0.0000001){
            cout<<"\tfunkcja przyjmuje wartosc 0 w przedz: <"<<x<<";"<<y<<">\n";
        }
        else{
            funRek(x+step,y);
            funRek(x,x+step);
        }
    }
    return 0;
}

int main()
{
    cout<<"Tw darboux"<<endl;
    double start = -100, stop=100;
    double ile=1000;


    double step = (stop-start)/ile;
    double cursor = start;

    double tab[3] = {1,2,3};
    int len = 3;

    while(cursor<stop){
        if (fun(cursor)*fun(cursor+step)<=0){
            cout<<"\n\nfunkcja przeciela os OX w przedziale <"<<cursor<<";"<<cursor+step<<">\n";
            cout<<"     -- rekurencyjne zwiekszenie dokladnosci:\n";
            funRek(cursor,cursor+step);
        }

        cursor+=step;
    }


    return 0;
}
