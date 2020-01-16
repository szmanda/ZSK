#include <iostream>
#include <math.h>
#include <windows.h>
#include <stdlib.h>
#include <ctime>

using namespace std;

bool tab[1000000];

int nwd(int a, int b){
    if (a>b){
        if (b==0) return a;
        return nwd(b,a%b);
    }
    if (a==0) return b;
    return nwd(a,b%a);
}

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
            //cout<<i<<endl;
        }
    }
    int p=0,q=0;
    srand(time(NULL));
    int los = rand()%sqr;
    cout<<"\n"<<los<<endl;
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
    for (int i=q-50;i>2;i--){
        if (nwd(n,i)==1) {
            e = i;
            break;
        }
    }

    cout<<"e="<<e<<endl;

    int d;

    for (int i=n-1;i>2;i--){
        if ((e*i)%n==1){
            d = i;
            break;
        }
    }
    cout<<"d="<<d<<endl;

    // szyfrowanie wiadomoœci

    //klucz publiczby (e,n)
    //klucz prywatny (d,n)

    // proces szyfrowania wiadomoœci
    // 1. Otrzymujesz od adresata klucz publiczny (e,n)
    // 2. zamieniasz wiasomoœæ na liczby naturalne t spelniajace warunek 0 < t < n
    double t = 77;
    // 3. szyfrowanie ka¿dej liczby t za pomoc¹ poni¿szej operacji:

    double c = pow(t,e)%n;




    return 0;
}
