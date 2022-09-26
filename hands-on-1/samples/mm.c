/*
File:           mm.c
Last changed:   20220303 11:35:00 
Purpose:        Matrix Multiply Sequential Algorithm in C
Author:         Murilo Boratto  <muriloboratto 'at' fieb.org.br>
Usage:
HowToCompile:   gcc mm.c -o mm -fopenmp
HowToExecute:   ./mm    <size> 
                ./mm      100           
*/

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

void initializeMatrix(int *matrix, int size) //Preenche a matrix com numeros aleatorios
{
  for (int i = 0; i < size; i++)
    for (int j = 0; j < size; j++)
      matrix[i * size + j] = rand() % (10 - 1) * 1;
}

void printMatrix(int *matrix, int size) //Percorre a Matrix, printando ela
{
  for (int i = 0; i < size; i++)
  {
    for (int j = 0; j < size; j++)
      printf("%d\t", matrix[i * size + j]);
    printf("\n");
  }
  printf("\n");
}

int main (int argc, char **argv)
{
 
  //Define variaveis
  int size = atoi(argv[1]);  
  int i, j, k;
  double t1, t2;

  //Aloca matrizes
  int  *A = (int *) malloc (sizeof(int)*size*size);
  int  *B = (int *) malloc (sizeof(int)*size*size);
  int  *C = (int *) malloc (sizeof(int)*size*size);
 
  //Preenche matrizes com numeros aleatorios
  initializeMatrix(A, size);
  initializeMatrix(B, size);

  t1 = omp_get_wtime(); //Tempo quando inicia os loops
  
  //Multiplica matrizes
  #pragma omp parallel for private(i, j, k) // Comando para paralelizacao de loops 
    for(i = 0; i < size; i++)
      for(j = 0; j < size; j++)
        for(k = 0; k < size; k++)
          C[i * size + j] += A[i * size + k] * B[k * size + j];
 
  t2 = omp_get_wtime(); //Tempo quando acaba os loops
 
  //Printa matrizes
  //printMatrix(A,size);
  //printMatrix(B,size);
  //printMatrix(C,size);
 
  //Printa tamanho da matriz e tempo para multiplicacao
  printf("%d\t%f\n",size,t2-t1);

  return 0;

}

