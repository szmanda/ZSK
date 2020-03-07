#include <iostream>

using namespace std;

int main()
{
    int a[3];
    cin>>a[0]>>a[1]>>a[2];
    if(a[0]==a[1]&&a[0]==a[2]) cout<<2;
    else{
        for (int i=0; i<3; i++){
            if (a[i]>a[0]){
                int pom = a[0];
                a[0] = a[i];
                a[i] = pom;
            }
        }
        if (a[1]*a[1]+a[2]*a[2]==a[0]*a[0]) cout<<1;
        else cout<<0;
    }
    return 0;
}
