#include <iostream>

using namespace std;

int main()
{
    int n;
    cin>>n;

    int ** budynki = new int * [n];
    for (size_t i = 0; i < n; i++) {
      budynki[i] = new int[2];
    }
    for (size_t i = 0; i < n; i++) {
      cin>>budynki[i][0]>>budynki[i][1]; //dlugosc, wysokosc;
    }
    int iloscPlakatow = 1;
    int wys=budynki[0][1];

    // cout<<"wysokosc startowa: "<<wys<<endl;
    for (int i = 1; i < n; i++) {
      // cout<<"Dla budynku: "<<budynki[i][1]<<"\n";
      if (budynki[i-1][1]==budynki[i][1]) {
        iloscPlakatow+=0;
        // cout<<"niedodano-ta sama wysokosc co poprzedni\n";
      }
      else if (wys==budynki[i][1]){
        iloscPlakatow+=0;
        // cout<<"niedodano-wysokosc nizsza\n";
      }
      else {
        if (budynki[i-1][1]>budynki[i][1]){
          wys = budynki[i][1];
          //cout<<"zmieniono wyskosc na: "<<wys<<endl;
        }
        iloscPlakatow++;
      }
    }
    cout<<iloscPlakatow;


    return 0;
}
