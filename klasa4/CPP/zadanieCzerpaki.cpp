#include <iostream>
#include <stdlib.h>
#include <windows.h>

using namespace std;

int naCzerpA,wyCzerpA,naCzerpB,wyCzerpB;

void NapelnijCzerpA();
void NapelnijCzerpB();
void WylejCzerpA(int a);
void WylejCzerpB(int a);
bool Nalej(int tab[],int rozmiar, int *docelowa,int ruchyModulo);

int main()
{
    cout<<"ZADANIE CZERPAKI"<<endl;
    naCzerpA = 0;
    naCzerpB = 0;
    wyCzerpA = 0;
    wyCzerpB = 0;


    int czerpakA, czerpakB, docelowa;
    cout<<"Podaj rozmiar wiekszego czerpaka: ";
    cin>>czerpakA;
    cout<<"Podaj rozmiar mniejszego czerpaka:";
    cin>>czerpakB;
    cout<<"Pojemnosc docelowa:";
    cin>>docelowa;

    if (czerpakA<czerpakB){
        int pom = czerpakA;
        czerpakA = czerpakB;
        czerpakB = pom;
    }

    int * wielkosciAtomowe;

    int roznica = czerpakA - czerpakB;

    int ruchyModulo = 0;
    int rozmiar = 3;

    cout<<"Mozliwe wielkosci atomowe to: "<<czerpakA<<", "<<czerpakB<<", "<<roznica;
    if (czerpakA!=czerpakB){
        ruchyModulo = czerpakA/czerpakB;
        int modulo = (czerpakB*(ruchyModulo+1))%czerpakA;
        rozmiar = 4;
        wielkosciAtomowe = new int[4]{czerpakA,czerpakB,roznica,modulo};
        cout<<", "<<modulo<<endl;
    }
    else {
        wielkosciAtomowe = new int [3]{czerpakA,czerpakB,roznica};
    }

    while(true){
        if (Nalej(wielkosciAtomowe,rozmiar,&docelowa,ruchyModulo))
            break;
    }
    cout<<"\n\nPodsumowanie:\n";
    cout<<"\tnapelnienia duzego czerpaka: "<<naCzerpA<<endl;
    cout<<"\tnapelnienia malego czerpaka: "<<naCzerpB<<endl;
    cout<<"\twylewania z duzego czerpaka: "<<wyCzerpA<<endl;
    cout<<"\twylewania z malego czerpaka: "<<wyCzerpB<<endl;

    return 0;
}

void NapelnijCzerpA(){
    naCzerpA++;
    cout<<"\n\tNapelniono wiekszy czerpak";
}
void NapelnijCzerpB(){
    naCzerpB++;
    cout<<"\n\tNapelniono mniejszy czerpak";
}
void WylejCzerpA(int a = 0){
    wyCzerpA++;
    cout<<"\n\tWlano zawartosc wiekszego czerpaka";
    if (a) cout<<" do mniejszego czerpaka";
}
void WylejCzerpB(int a = 0){
    wyCzerpB++;
    cout<<"\n\tWlano zawartosc mniejszego czerpaka";
    if (a) cout<<" do wiekszego czerpaka";
}

bool Nalej(int tab[],int rozmiar, int *docelowa,int ruchyModulo){
    int i=rozmiar;
    do{
        i--;
        //cout<<"\n tab["<<i<<"] = "<<tab[i]<<" docelowa = "<<*docelowa; //
        Sleep(500);
    }while (tab[i-1]<=*docelowa&&i>0);
    cout<<"\n   przelewam do docelowa = "<<*docelowa<<", tab["<<i<<"] = "<<tab[i]; //
    switch (i){
        case 0:
            *docelowa-=tab[i];
            NapelnijCzerpA();
            WylejCzerpA();
            break;
        case 1:
            *docelowa-=tab[i];
            NapelnijCzerpB();
            WylejCzerpB();
            break;
        case 2:
            *docelowa-=tab[i];
            NapelnijCzerpB();
            WylejCzerpB(1);
            WylejCzerpB();
            break;
        case 3:
            *docelowa-=tab[i];
            for (int i = 0; i<=ruchyModulo; i++){
                NapelnijCzerpB();
                WylejCzerpB(1);
            }
            WylejCzerpB();
            break;
        default:
            cout<<"\nunhandled exception! i = "<<i;
    }
    if (*docelowa>0) return false;
    if (*docelowa==0) cout<<"\n\t --- Napelnianie zakonczone sukcesem";
    else cout<<"\n\t --- Napelnianie nie powiodlo sie, docelowa = "<<*docelowa;
    return true;
}
