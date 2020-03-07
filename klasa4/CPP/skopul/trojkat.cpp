#include <iostream>

using namespace std;

int main()
{
    int a,b,c;
    cin>>a>>b>>c;
    string out = "NIE";
    if (a+b>c&&a+c>b&&b+c>a) out = "TAK";
    cout<<out;
    return 0;
}
