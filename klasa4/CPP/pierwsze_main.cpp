#include <iostream>
#include <math.h>
#include <windows.h>

using namespace std;

bool tab[1000000];

int main()
{
    int sqr = 1000;

    for (int i=0; i<sqr*sqr;i++)
        tab[i] = true;

    for (int i=2; i<sqr; i++){
        //cout<<"pentla dla i="<<i<<endl;
        //Sleep(5000);
        if (tab[i] == true){
            for (int j=i+1; j<sqr*sqr; j++){
                //cout<<"pentla dla j="<<j<<endl;
                if (j%i==0){
                    tab[j]=false;
                    //cout<<"zamiana dla <<"<<j<<"\n";
                }
            }
        }
    }
    for (int i=2; i<sqr*sqr; i++){
        if (tab[i]==true){
            cout<<i<<endl;
        }
    }
    int p=0,q=0;
    for (int i=sqr*sqr; i>2; i--){
        if (tab[i]==true){
            if (p!=0){
                q=
                break;
            }
        }
    }




    return 0;
}
