#include <iostream>

using namespace std;

int a;

void f1Calculate(void);
void f2Calculate(void);
void f3Calculate(void);
void f4Calculate(void);
void f5ShortTest(void);

void f6CalculateTriangle(void){
    int x, y;
    cout<<" Square\nEnter value: ";
    cin>>x;
    cout<<"Enter value: ";
    cin>>y;
    cout<<"Field: "<<x*y/2<<endl;
}
void f7CalculateSquare(void){
    int x, y;
    cout<<" Square\nEnter value: ";
    cin>>x;
    cout<<"Enter value: ";
    cin>>y;
    cout<<"Field: "<<x*y<<endl;
}

int main()
{
    cout<<" T: Functions"<<endl<<endl;

    f5ShortTest();

    cout<<" Calculate field\n 1. triangle\n 2. square"<<endl;
    int option;
    cin>>option;
    switch (option){
    case 1:
        f6CalculateTriangle();
        break;
    case 2:
        f7CalculateSquare();
        break;
    default:
        cout<<" Error!"<<endl;
        break;
    }





    return 0;
}

void f1Calculate(void){
    int a;
    a = 5;
    cout<<"in f1Calculate: "<<a<<endl;
}
void f2Calculate(void){
    a = 4;
    cout<<"in f2Calculate: "<<a<<endl;
}
void f3Calculate(int &z){
    z=-3;
    z++;
    cout<<"in f3Calculate: "<<z<<endl;
}
void f4Calculate(int z){
    z=17;
    z=z%3;
    a++;
    cout<<"in f4Calculate: "<<z<<endl;
}
void f5ShortTest(void){
    a=3;
    cout<<" SHORT TEST\nin main: "<<a<<endl;
    f1Calculate();
    cout<<"in main: "<<a<<endl;
    f2Calculate();
    cout<<"in main: "<<a<<endl;
    f3Calculate(a);
    cout<<"in main: "<<a<<endl;
    f4Calculate(a);
    a++;
    cout<<"in main: "<<a<<endl;
}
