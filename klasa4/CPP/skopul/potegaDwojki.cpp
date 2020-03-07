#include <iostream>

using namespace std;

int main()
{
    int n;
    cin>>n;
    int potega = 1;
    do{
        cout<<potega<<endl;
        potega*=2;
    }while(potega<n);
}
