#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#define SIZE_MATRIX 10

int main(int argc, char **argv)
{
  int n = atoi(argv[1]);
  int block_size = atoi(argv[2]);
  int matrix[n][n], k1 = 10, k2 = 20, k3 = 30, k4 = 40, k5 = 50;
  int i, j, row, column;

  for(i = 0; i < n; i++)
  {
    for(j = 0; j < n; j++)
    {
      matrix[i][j] = 5;
      printf("%d\t", matrix[i][j]);
    }
    printf("\n");
  }

  printf("\n\n");

  omp_set_num_threads(5);

  #pragma omp parallel private(row, column)
  {
    int id = omp_get_thread_num();

    if(id == 0) 
    {
      for(row = 0; row < n; row++)
        for(column = 0; column < block_size; column++)
          matrix[row][column] *= k1;
    }else{
      if(id == 1){
        for(row = 0; row < n; row++)
          for(column = block_size; column < block_size*2; column++)
            matrix[row][column] *= k2;
      }else{
        if(id == 2){ 
          for(row = 0; row < n; row++)
            for(column = block_size*2; column < block_size*3; column++)
              matrix[row][column] *= k3;
        }else{
          if(id == 3){ 
            for(row = 0; row < n; row++)
              for(column = block_size*3; column < block_size*4; column++)
                matrix[row][column] *= k4;
          }else{
            if(id == 4){
              for(row = 0; row < n; row++)
                for(column = block_size*4; column < block_size*5; column++)
                  matrix[row][column] *= k5;
            }
          }
        }
      }
    }
  }

  for(i = 0; i < n; i++)
  {
    for(j = 0; j < n; j++)
      printf("%d\t", matrix[i][j]);
    printf("\n");
  }

  return 0;
}



