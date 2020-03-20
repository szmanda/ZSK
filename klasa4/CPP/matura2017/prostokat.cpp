#include <iostream>

using namespace std;

int main()
{
  // dane:
  int n, p;
  cin>>n>>p;
  int * A = new int [n];
  for (int i = 0; i < n; i++) {
    cin>>A[i];
  }
  int * B = new int [n];
  int c = 0;
  {
    int i = 0;
    while (A[i]%p!=0&&i<n){
      B[c++] = A[i];
      i++;
    }
  }
  int maxA = 0, maxB = 0;
  for (int i=0; i<c; i++){
    if (B[i]>B[maxA]) maxA=i;
  }
  maxB = (maxA==0) ? 1 : 0;
  for (int i=0; i<c && i!=maxA; i++){
    if (B[i]>B[maxB]) maxB=i;
  }
  cout<< B[maxA]*B[maxB];

  return 0;
}
