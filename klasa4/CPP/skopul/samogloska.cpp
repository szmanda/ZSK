#include <iostream>

using namespace std;

int main()
{
    // program sprawdza czy na wejściu podano samogłoskę
    char samogloski[6] = {'a','e','i','o','u','y'};

    char litera;
    cin>>litera;
    bool czySamo = false;
    for (size_t i = 0; i < 6; i++) {
      if (litera==samogloski[i]){
        czySamo = true;
        break;
      }
    }
    if (czySamo) cout<<"tak";
    else cout<<"nie";

    return 0;

}
