#include <iostream>

using namespace std;

int ilePlakatow;

int findMinimum(int * tab, int start, int stop){
  if (stop-start==0){
    return start;
  }
  else if (stop-start==1){
    if (tab[start]>tab[stop]) return stop;
    else return start;
  }
  else{
    int a = findMinimum(tab,start,start+(stop-start)/2-1);
    //cout<<"---\nwywolanie dla "<<start<<" oraz "<<start+(stop-start)/2-1<<"zwrocilo "<<a<<"\n";
    int b = findMinimum(tab,start+(stop-start)/2,stop);
    //cout<<"wywolanie dla "<<start+(stop-start)/2<<" oraz "<<stop<<"zwrocilo "<<b<<"\n";
    if (tab[a]<=tab[b]) return a;
    else return b;
  }
}
int findMaximum(int * tab, int start, int stop){
  int max = start;
  for (size_t i = start+1; i < stop; i++) {
    if (tab[i]>tab[max]) max = i;
  }
  return max;
}

int liczPlakaty(int * tab, int start, int stop){
  //cout<<"dla start,stop: "<<start<<","<<stop<<"\n\t";
  if (findMinimum(tab,start,stop)>=findMaximum(tab,start,stop)){ //czubek budynkow
    //cout<<"dla "<<findMinimum(tab,start,stop)<<"osiagnieto czubek\n";
    //cout<<"WYNIK+1\n";
    ilePlakatow++; //global
    //cout<<ilePlakatow<<endl;
    return 1;
  }else{
    int minVal = tab[findMinimum(tab,start,stop)];
    //cout<<minVal<<"\n\t";

    //tablica indeksów minimów
    int * minima = new int [stop-start];
    int n=0;
    for (size_t i = start; i < stop; i++) {
      if (tab[i]==minVal){
        minima[n++] = i;
        //cout<<"min-"<<i;
      }
    }
    int wynik=1;
    // przypadki miedzy minimami
    //cout<<"n="<<n<<endl;
    for (int i =0; i<=n-2; i++) {
      //cout<<"klasyczne: i="<<i<<" n-2="<<n-2;
      wynik+= liczPlakaty(tab,minima[i]+1,minima[i+1]-1);
      ilePlakatow++;
      //cout<<ilePlakatow<<endl;
      i++;
    }
    // przypadki skrajne
    if (minima[n-1]!=stop){
      wynik+= liczPlakaty(tab,minima[n-1]+1,stop);
      ilePlakatow++;
      //cout<<ilePlakatow<<endl;
    }
    if (start!=minima[0]){
      wynik+= liczPlakaty(tab,start,minima[0]-1);
      ilePlakatow++;
      //cout<<ilePlakatow<<endl;
    }
    return wynik;
  }
}

int main()
{
    int n;
    cin>>n;
    ilePlakatow =0;

    int * budynki = new int [n];
    int szerokosc; //nie istotna
    for (size_t i = 0; i < n; i++) {
      cin>>szerokosc>>budynki[i];
    }
    liczPlakaty(budynki,0,n-1);
    cout<<ilePlakatow;

    // int minim = budynki[findMinimum(budynki,0,n-1)];
    // int poprz=0;
    // for (size_t i = 0; i < n; i++) {
    //   if(budynki[i]==minim)
    //   {
    //     if (budynki[i-1]!=budynki[i]&&budynki[i+1]!=budynki[i]){
    //       int m = budynki[findMinimum(budynki,poprz,i-1)];
    //       int n = budynki[findMinimum(budynki,i+1,n)];
    //       poprz=i+1;
    //     } else if (budynki[i-1]==budynki[i]){
    //       int m = budynki[findMinimum(budynki,i+1,n)];
    //     } else if (budynki[i+1]==budynki[i]){
    //       int m = budynki[findMinimum(budynki,poprz,i-1)]
    //     }
    //
    //
    //   }
    //   else(
    //     iloscPlakatow++;
    //   )
    // }



    return 0;
}
