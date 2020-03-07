#include <iostream>

using namespace std;

int main()
{
    int input,seconds,minutes,hours;
    cin>>input;
    hours = input/60/60;
    input%=60*60;
    minutes = input/60;
    input%=60;
    seconds = input;
    cout<<hours<<"g"<<minutes<<"m"<<seconds<<"s";
    return 0;
}
