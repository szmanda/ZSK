#include <iostream>

using namespace std;

int main()
{
    int a,b;
    cin>>a>>b;

    if(b==0||a==0||a*b==a+b||a*b==a-b) cout<<"NIE";
    else if (b<0){
        if (a*b>a-b){
            if (a<0) cout<<"("<<a<<")*("<<b<<")="<<a*b;
            else cout<<a<<"*("<<b<<")=("<<a*b<<")";
        }else{
            if (a<0) cout<<"("<<a<<")-("<<b<<")=("<<a-b<<")";
            else cout<<a<<"-("<<b<<")="<<a-b;
        }
    }
    else{
        if(a>0) cout<<a<<"*"<<b<<"="<<a*b;
        else if(-a>b) cout<<"("<<a<<")+"<<b<<"=("<<a+b<<")";
        else cout<<"("<<a<<")+"<<b<<a+b;
    }
    return 0;
}
