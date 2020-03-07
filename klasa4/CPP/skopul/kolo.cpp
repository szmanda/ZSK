#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    double r;
    cin>>r;

    double PI = 3.1415;

    cout<<round(PI*r*r*1000)/1000<<endl;
    cout<<round(2*PI*r*1000)/1000<<endl;
    return 0;
}
