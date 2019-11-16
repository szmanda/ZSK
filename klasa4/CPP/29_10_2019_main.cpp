#include <iostream>
#include <vector>
#include <ctime>
#include <cstdlib>
#include <cmath>


using namespace std;

int main()
{
    cout<<"Vectors in c++!"<<endl;

    // adding new vector
    vector<int> abc;

    // inerting new value to the vector
    abc.push_back(1);
    abc.push_back(1);
    abc.push_back(1);

    // foreach loop (if error occured: Range-based 'for' loops are not allowed in C++98 mode)
    // for this to work in CodeBlocks there is a compiler flag: -std=c++11 needed
    for (int a : abc){
        cout<<a<<":";
    }
    cout<<"\t"<<abc.size()<<"\n";


    // Task 1
    // Generate vector with random numbers (value between 10f and 1000f
    int howManyNumbers = 100;
    float startValue = 10, endValue = 100000;
    int precision = 1;

    // libraries ctime, cstdlib needed
    srand(time(NULL));

    vector<float> baseVector;

    float valueRange = endValue - startValue;
    for (int i = 0; i < howManyNumbers; i++){
        float currentValue = rand()%(int)(valueRange*pow(10,precision))+startValue;
        currentValue /= (float)pow(10,precision);
        baseVector.push_back(currentValue);
    }
    for (float a : baseVector){
        cout<<a<<":";
    }







    return 0;
}
