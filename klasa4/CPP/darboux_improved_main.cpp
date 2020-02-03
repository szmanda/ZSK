#include <iostream>
#include <cmath>

using namespace std;

// zgodnie z wymaganiem, dla maksymalnego stopnia wielomianu = 11
double wspolczynniki[12];

double fun(double x){
    double result = 0;
    for (int i=0; i<12; i++)
        result += wspolczynniki[i]*pow(x,i);
    return result;
}
double pochodna(double x){
    double result = 0;
    for (int i=1; i<12; i++)
        result += wspolczynniki[i]*i*pow(x,i-1);
    return result;
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
    else if(pochodna(x)*pochodna(y)<=0)
        {
        if (((y-x)<=0.0000001)&&(abs(fun(x))<0.1)){
            cout<<"\tfunkcja przyjmuje wartosc 0 w przedz: <"<<x<<";"<<y<<">\n";
        }
        else if ((y-x)<=0.0000001){
            cout<<"\tfunkcja nie przyjmuje wartosci 0 w powyzszym przedziale, natomiast ma ekstremum w przedziale: <"<<x<<";"<<y<<">\n";
            return 0;
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
    double ile=100;

    cout<<"Podaj wspolczynniki wielomianu dla x^n:\n";
    for (int i=0;i<12;i++){
        cout<<"n = "<<i<<" , wspolczynnik: ";
        cin>>wspolczynniki[i];
    }

    double step = (stop-start)/ile;
    double cursor = start;

    double tab[3] = {1,2,3};
    int len = 3;

    while(cursor<stop){
        if (fun(cursor)*fun(cursor+step*0.9999)<=0){
            cout<<"\n\nfunkcja przeciela os OX w przedziale <"<<cursor<<";"<<cursor+step<<">\n";
            cout<<"     -- rekurencyjne zwiekszenie dokladnosci:\n";
            funRek(cursor,cursor+step);
        }
        else if (pochodna(cursor)*pochodna(cursor+step*0.9999)<=0){
            cout<<"\n\nfunkcja ma ekstremum w przedziale <"<<cursor<<";"<<cursor+step<<">\n";
            cout<<"     -- rekurencyjne zwiekszenie dokladnosci:\n";
            funRek(cursor,cursor+step);
        }
        cursor+=step;
    }
    return 0;
}
