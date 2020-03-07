#include <iostream>

using namespace std;

int main()
{
    int n;
    cin>>n;
    int rewers=0;

    for (int i=0;i<n;i++){
        int pom;
        cin>>pom;
        rewers+=pom;
    }
    if (n-rewers>rewers) cout<<rewers;
    else cout<<n-rewers;

    return 0;
}
