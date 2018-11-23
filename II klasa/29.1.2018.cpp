#include <iostream>

using namespace std;

int main()
{
    /*int a;
    while (a>=0){
        cout<<"Podaj a<0;";
        cin>>a;
    }


    for (int i=0;i<10;i++){
        if (i!=6)
        cout<<i<<endl;
        else
        cout<<"szesc"<<endl;
    }


    //podzielne przez 2,alt: if(i%2==0)
    for (int i=0;i<=30;i+=2){
        cout<<i<<endl;
    }

    //prostokat
    int i, j, wiersze, ilosc;
    char symbol;
    cout<<"podaj kolejno ilosc wierszy, ilosc znakow, znak"<<endl;
    cin>>wiersze>>ilosc>>symbol;

    for(i=0; i<wiersze; i<i++){
        for(j=0;j<ilosc;j++){
            cout<<symbol;
        }
        cout<<endl;
    }
    */

    //wyœwietlanie wszystkich liczb calkowytycz miêdzy podanymi
    int x, y;
    cout<<"Podaj x i y;";
    cin>>x>>y;
    if (x<y){
        for(x++;x<y;x++){
            cout<<x;
            if (x%2==0){
                cout<<" - l.parzysta"<<endl;
            }
            else{
                cout<<" - l.nieparzysta"<<endl;
            }
        }
    }
    else{
        cout<<"zle dane";
    }







    return 0;
}
