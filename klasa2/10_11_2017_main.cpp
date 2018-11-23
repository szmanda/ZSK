#include <iostream>

using namespace std;

int main()
{
    int n=-4;
    for (int i=0;i<7;i++){
        cout<<n<<" ";
        n+=3;
        }
    cout<<"\n\n";

    n=-4;
    for (int i=0;i<7;i++){
        if (n!=2&&n!=8) {
        cout<<n<<" ";
        }
        n+=3;
        }
    cout<<"\n\n";

    n=12;
    for (int i=0;i<7;i++){
        cout<<n<<" ";
        n-=4;
    }

    cout<<"\n\n";

    n=12;
    for (int i=0;i<6;i++){
        cout<<n<<" ";
        if (n==4) n-=8;
        else n-=4;
    }

    cout<<"\n\n";

    return 0;
}
