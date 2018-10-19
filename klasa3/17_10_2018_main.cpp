#include <iostream>

using namespace std;

int fib(int a){
    if (a<=1) return 1;
    else if (a>1) return fib(a-1)+fib(a-2);
}
int iter(int a){
    int w=1;
    int y=1;
    for (int i = 1; i<a;i++){
        int x=w;
        w+=y;
        y=x;
    }
    return w;
}


int main()
{
    cout<<"Ciag fibonaciego"<<endl;
    cout<<fib(25)<<endl;
    cout<<iter(25)<<endl;
    return 0;
}
