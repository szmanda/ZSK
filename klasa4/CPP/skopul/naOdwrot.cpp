#include <iostream>

using namespace std;

int main()
{
    int liczby[3];
    for(int i=0;i<3;i++) cin>>liczby[i];
    for(int i=0;i<3;i++) { cout<<liczby[i]; if(i<2) cout<<" ";}
    cout<<endl;
    for(int i=2;i>=0;i--) { cout<<liczby[i]; if(i>0) cout<<" ";}

    return 0;
}
