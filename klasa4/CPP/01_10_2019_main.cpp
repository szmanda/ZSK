#include <iostream>
#include <ctime>
#include <stdlib.h>

using namespace std;

int main()
{
    cout<<"Sortowanie"<<endl;

    srand(time(NULL));

    int tab[10];
    for (int i=0; i<10; i++){
        tab[i] = rand()%100+1;
    }

    int sortedTab[10];
    for (int i=0; i<10; i++){
        sortedTab[i] = tab[i];
    }

    // sortowanie przez wstawianie:
    int licznikZamian = 0;

    for (int i=1; i<10; i++){ //wykonuje n-1 kroków, gdzie n to liczba sortowanych el.
      int j=i;
      // w każdym kroku uwzględniane jest n+1 elementow,
      // każdy nowy jest wstawiany, na odpowiadające mu miejsce
      while ((sortedTab[j]>sortedTab[j-1])&&(j>0)){
        licznikZamian += 1;
        int pom = sortedTab[j-1];
        sortedTab[j-1] = sortedTab[j];
        sortedTab[j] = pom;
        j--;
      }
      cout<<"tab: ";
      for (int j=0;j<10;j++){
        cout<<sortedTab[j]<<", ";
      }
      cout<<endl;
    }
    cout<<"posortowano dokonujac "<<licznikZamian<<" zamian elementow"<<endl;

    return 0;
}
