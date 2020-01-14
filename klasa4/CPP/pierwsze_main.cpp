#include <iostream>
#include <math.h>
#include <windows.h>
#include <stdlib.h>
#include <ctime>

using namespace std;

bool tab[1000000];

int nwd(int a, int b){
    if (b==0) return a;
    return nwd(b,a%b);
}

int main()
{
    srand(time(NULL));

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
            //cout<<i<<endl;
        }
    }
    int p=0,q=0;
    int los = rand()%sqr;
    for (int i=los+sqr; i>2; i--){
        if (tab[i]==true){
            if (p!=0){
                q = i;
                break;
            } else {
                p = i;
                i = i-los;
            }
        }
    }
    cout<<"p="<<p<<endl;
    cout<<"q="<<q<<endl;

    int n = (p-1)*(q-1);
    cout<<"n="<<n<<endl;

    int e;
    // e jest bledne
    for (int i=sqr;i>2;i--){
        if (nwd(n,i)==1) {
            e = i;
            break;
        }
    }

    cout<<"e="<<e<<endl;

    int d;

    for (int i=n-1;i>2;i--){
        if ((e*i)%n==0){
            d = i;
            break;
        }
    }
    cout<<"d="<<d<<endl;


    return 0;
}
