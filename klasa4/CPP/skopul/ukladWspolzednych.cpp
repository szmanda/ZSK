#include <iostream>

using namespace std;

int main()
{
    double x,y;
    cin>>x>>y;
    if (x*y>0)
        if (x>0) cout<<"I";
        else cout<<"III";
    else if (x*y<0)
        if (x>0) cout<<"IV";
        else cout<<"II";
    else if (x==0)
        if (x==y)
            cout<<"0";
        else
            cout<<"OY";
    else
        cout<<"OX";
    return 0;
}
