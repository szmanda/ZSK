#include <iostream>
#include <math.h>

using namespace std;

int main()
{
	// dany znak a, w kodzie 16 tkowym:
	char a = 'B';
	int wart;
	if (a >= 'A')
		wart = a - 'A' + 10;
	else
		wart = a - '0';

	cout << wart;

	// dla liczb 6 cyfr. szesnastkowych
	string s = "2C45F4";
	//char b[6] = "2C45F4";
	wart = 0;
	for (int i = 0; i < 6; i++)
	{
		int w = (s[i] >= 'A') ? s[i] - 'A' + 10 : s[i] - '0';
		wart += w * pow(16, 5 - i);
	}
	// dla liczb o dowolnej liczbie cyfr dla systemu o podstawie b
	s = "43F8";
	int b = 16;
	wart = 0;
	int n = 0;
	while (s[n] != '\0') n++;
	for (int i = 0; i < n; i++)
	{
		int w = (s[i] >= 'A') ? s[i] - 'A' + 10 : s[i] - '0';
		wart += w * pow(b, n - i - 1);
	}
	cout << endl << wart<<endl;
	
	// zliczanie wartości za pomocą schematu Hornera:
	// (((s[0]*b + s[1])*b + s[2])*b + s[3])...
	n = 0;
	if (s[n]!=0){
	wart = (s[n]>='A') ? s[n]-'A'+10 : s[n]-'0';
	 while (s[++n]!='\0'){
		int w = (s[n]>='A') ? s[n]-'A'+10 : s[n]-'0';
		wart = wart*b + w;
 	}
	}
	cout << endl << wart;
	
	return 0;
}