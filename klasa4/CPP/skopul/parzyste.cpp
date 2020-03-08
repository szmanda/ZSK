#include <iostream>

using namespace std;

int main()
{
    // program określa dla n liczb calkowitych ich parzystosc
    int n;
    cin>>n;
    int * a = new int[n];
    for (size_t i = 0; i < n; i++) {
      cin>>a[i];
    }
    for (size_t i = 0; i < n; i++) {
      if (a[i]%2==0) cout<<"parzysta"<<endl;
      else cout<<"nieparzysta"<<endl;
    }
    return 0;

}
