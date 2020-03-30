#include <iostream>
#include <fstream>

using namespace std;

int main()
{
    int plansza[20][20];
    string robot[1000];
    int seria[1000] = {0};
    int maxSeria = 0;

    fstream pl;
    pl.open("plansza.txt");
    for (int i = 0; i < 20; i++) {
      for (int j = 0; j < 20; j++) {
        pl>>plansza[i][j];
      }
    }
    pl.close();
    fstream rob;
    rob.open("robot.txt");
    for (int i = 0; i < 1000; i++) {
        rob>>robot[i];
    }
    rob.close();

    int disqualified = 0;
    int maxIndex = 0;
    int max = -1;
    for (size_t i = 0; i < 1000; i++) {
      int x=0, y=0, wynik = plansza[0][0];
      //cout<<"\t"<<robot[i].length();
      int seriaLocal = 0;
      for (size_t j = 0; j < robot[i].length(); j++) {
        if (robot[i][j] == 'N'){y--;seriaLocal=0;}
        else if (robot[i][j] == 'S'){y++;seriaLocal=0;}
        else if (robot[i][j] == 'W'){x--;seriaLocal++;}
        else if (robot[i][j] == 'E'){x++;seriaLocal++;}

        if (x>=0 && x<20 && y>=0 && y<20) wynik+=plansza[y][x];
        else{
          wynik =- 1;
          disqualified++;
          break;
        }
        if (seriaLocal > seria[i]) seria[i] = seriaLocal;
      }
      if (seria[i]>maxSeria){
        maxSeria=seria[i];
      }

      if (wynik > max){
        max = wynik;
        maxIndex = i;
      }
    }
    fstream file;
    file.open("wyniki.txt",ios::app);
    file<<"Zadanie 1."<<endl;
    file<< disqualified << "\n";
    file<<"Zadanie 2."<<endl;
    file << maxIndex + 1 << "\t" << max;



    file<<"Zadanie 3."<<endl;
    file<<"(z pominięciem zdyskfalifikowanych)\n"
    for (int i = 0; i < 1000; i++) {
      if (seria[i] >= maxSeria)
        file << i + 1 << "\n";
    }
    file<<maxSeria;
    file<<endl;
    file.close();
    return 0;
}
