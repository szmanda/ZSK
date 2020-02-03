#include <iostream>

using namespace std;

void minAndMax(double t[], int n, double &min, double &max);

int minAndMaxRek(double t[], int left, int right, double &min, double &max);

int main()
{
	int n=9;
	double * tab = new double[n]{1.2,5,7,3.02,5,9,-2,-6,10};

	double min, max;

	minAndMax(tab,n,min,max);
	cout<<min<<", "<<max<<endl;

	min=0;
	max=0;

	minAndMaxRek(tab,0,n-1,min,max);
	cout<<min<<", "<<max<<endl;


	return 0;
}


void minAndMax(double t[], int n, double &min, double &max)
{
	int len = n, i = 2;
	if (n%2) len -= 2; else len--; // podzielenie na 2 równe czesci wymaga parzystej liczby
	if (t[0] <= t[1]){
		min = t[0];
		max = t[1];
	}else{
		min = t[1];
		max = t[0];
	}
	while (i < len){
		if (t[i] <= t[i+1]){ // metoda dziel i zwyciezaj polega na podziale tabeli na 2 mniejsze a nastepnie znalezienia ekstremów z tablicy o której wiadomo ze w niej sie pojawi
			if (t[i] < min) min = t[i];// tablica parzystych indesow
			if (t[i+1] > max) max = t[i+1];// tablica indeksow nieparzystych
		}else{
			if (t[i+1] < min) min = t[i+1]; // nieparz.
			if (t[i] > max) max = t[i]; // parz.
		}
		i += 2;
	}
	if (n%2) // w przypadku nieparzystego n ostatni element zostje porównany osobno
	{
	//	if (t[n-1] < min) min = t[n-1];
	//	if (t[n-1] > max) max = t[n-1];
		min = (t[n-1]<min) ? t[n-1] : min;
		max = (t[n-1]>max) ? t[n-1] : max;
	}
}


int minAndMaxRek(double t[], int left, int right, double &min, double &max)
{
	if (left==right){
		// minimum i maks. tablicy 1 elem.
		min = t[left];
		max = t[right];
		return 0;
	}
	if (left==right-1){
		// minimum i maks. tablicy 2 elem.
		if (t[left]<=t[right]){
			min = t[left];
			max = t[right];
			return 0;
		}
	}
	// dzielenie tablicy na pol
	double min1, max1, min2, max2;
	minAndMaxRek(t,left,(left+right)/2,min1,max1);
	minAndMaxRek(t,(left+right)/2+1,right,min2,max2);

	min = (min1<=min2) ? min1 : min2;
	max = (max1>=max2) ? max1 : max2;

	return 0;
}
