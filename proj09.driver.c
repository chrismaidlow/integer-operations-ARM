#include <stdio.h>

int add( int, int);

int main()
{
  int A = 0x7fffffff, B = 0x00000002;
  int C = 0xffffffff, D = 0x00000001;
  int flag;

  result = add( A, B);

  printf( "Results:  %08x", result);

  result = add( C, D);

  printf( "Results:  %08x", result);
    
  //result = sub( A, B);

  //printf( "Results:  %08x", result);

  //result = sub( C, D);

  //printf( "Results:  %08x", result);

  return 0;
}