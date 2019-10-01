#include <iostream>
#include <ctime>
#include <stdlib.h>

using namespace std;

int main()
{
    cout<<"Sortowanie"<<endl;

    srand(time(NULL));

    int tab[10]
    for (int i=0; i<10; i++){
        tab[i] = rand(%100)+1;
    }

    sortedTab[10] = tab[10];

    for (int i=0; i<10: i++){
        for (int j=i; j>0; j++){
            while (sortedTab[i]<sortedTab[j]){
                int pom = sortedTab[j];
                sortedTab[j] = sortedTab[i];
                sortedTab[i] = pom;
            }
        }
        cout<<"tablica: ";
        for (int i=0;i<10;i++){
        cout<<sortedTab[i]<<", ";
        }
        cout<<endl;
    }

    return 0;
}
