#include <iostream>
#include <iomanip>
using namespace std;

int Avone (){
    double a;
    long double b;
    int c1;
    unsigned int c2;
    long int c3;
    long long int c4;
    char d;
    bool e;

    cout<<" -=rozmiary zmiennych=-";
    cout<<"\n double: "<<sizeof(a);
    cout<<"\n long double: "<<sizeof(b);
    cout<<"\n int: "<<sizeof(c1);
    cout<<"\n unsigned int: "<<sizeof(c2);
    cout<<"\n long int: "<<sizeof(c3);
    cout<<"\n long long int: "<<sizeof(c4);
    cout<<"\n char: "<<sizeof(d);
    cout<<"\n bool: "<<sizeof(e)<<endl;

    return 0;
}

int Avtwo(){
    bool prawda=true;
    int c=5;
    int zmienna1;
    for (zmienna1=10; zmienna1<100; zmienna1+=5){
        cout<<zmienna1<<" ";
    }
    cout<<endl;
    for (zmienna1=10; zmienna1<100; zmienna1+=5){
        //setw z biblioteki IOMANIP rezerwuje ilosc miejsc wyswiatlania dla zmiennych
        cout<<setw(6)<<zmienna1;
        if (zmienna1==50) break;
    }
    return 0;
}

int Avtree(){

    int x=1;
    for (int i=0; i<5; i++){
        cout<<"podaj wartosc zmiennej x: ";
        cin>>x;
        if (x%2==0) break;
    }
    return 0;
}

int Avfour(){
    int k=0;
    while (k<20){
        k++;
        if (k==4 || k==15) continue;
        cout<<setw(3)<<k;
    }

    int a, b;
    cout<<"\n\n\n od jakiej wartosci wyswietlic liczby parzyste: ";
    cin>>a;
    cout<<" do jakiej wartosci wyswietlic liczby parzyste: ";
    cin>>b;

    if (a>b){
        cout<<"bledne dane";
        return 0;
    }
    cout<<"\n   "
    while (a<=b){
        a++;
        if (a%2==1) continue;
        cout<<a<<" ";
    }

    return 0;
}

int main()
{

    //data types
    double a, b;
    int c;
    char d;



    a=5;
    b=5;
    a=a--;
    cout<<"\n -=operacje przypisania=-\na: "<<a;
    c=5;
    cout<<"\nc: "<<c;
    d='z'; //d="z"; -> blad
    cout<<"\nd: "<<d;
    a=b*3.5;
    cout<<"\na: "<<a;
    d='p';
    cout<<"\nd: "<<d;
    c=-5;
    cout<<"\nc: "<<c<<endl<<endl;

    Avone();
    cout<<endl<<endl;
    Avtwo();
    cout<<endl<<endl;
    Avtree();
    cout<<endl<<endl;
    Avfour();
    cout<<endl<<endl;


    return 0;
}
