#include <iostream>

using namespace std;

void ZadanieC(){
    cout<<"\n Zadanie C\n";
    int start, stop;
    cin>>start>>stop;

    if (stop%2==0) stop-1;
    for (int i=start;i<=stop;i++){
        if(i<stop){
            cout<<i;
            if(i<stop){
                cout<<",";
            }
        }
    }
}

int main()
{
    cout<<"Zadania z kartkowki o petlach"<<endl;
    cout<<"\n Zadanie 1a\n";

    //ciag
    int na=-3, nam=24, nai=3;
    for (na;na<=nam;na+=nai){
        if ((na!=3)&&(na!=18)){
            cout<<na;
            if (na<nam){
                cout<<",";
            }
            else{
                cout<<"\n\n";
            }
        }
    }

    cout<<"\n Zadanie 1a\n";

    //ciag
    na=-3, nam=24, nai=3;
    for (na;na<=nam;na+=nai){
        if ((na!=3)&&(na%2!=0)){
            cout<<na;
            if (na<21){
                cout<<",";
            }
            else{
                cout<<"";
            }
        }

    }


    ZadanieC();

    return 0;
}
