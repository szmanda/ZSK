#include <iostream>

using namespace std;

int main()
{
    // tabele dynamiczne 2 wymiarowe
    int d; //ilość wierszy
    cin>>d;
    int ** kasztany = new int * [d];
    for (size_t i = 0; i < d; i++) {
      int n; //kolumny; // pierwsza kolumna zawiera dlugosc krotki
      cin>>n;
      kasztany[i] = new int[n+1];
      kasztany[i][0] = n;
      for (size_t j = 1; j < n+1; j++) {
        cin>>kasztany[i][j];
      }
    }


    for (size_t i = 0; i < d; i++) {
      int sum = 0; //suma wszystkich argumentów w krotce
      for (size_t j = 1; j < kasztany[i][0]+1; j++) {
        sum+=kasztany[i][j];
      }
      cout<<sum<<endl;
    }

    return 0;

}
