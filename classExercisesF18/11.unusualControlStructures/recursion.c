/** Illustrates some approaches to managing recursion.
 *
 * Each call to the recursive factorial functions uses BLOCK_SIZE bytes.
 * 
 * Compile: `gcc recursion.c`
 * Also, generate assembly to see compiler's translation: `gcc -S -o recursion.s recursion.c`
 * 
 * 1. Statically allocated version:
 *  Works for n = 15.
 *  Fails with stack overflow for n = 16.
 *  
 * 2. Dynamically allocated version:
 *  Works for n = 20.
 *  Fails with integer overflow (not stack overflow) for n = 21.
 *
 * Recompile with full optimization: `gcc -O3 recursion.c`
 * Also, generate assembly to see compiler's translation: `gcc -O3 -S -o recursionO.s recursion.c`
 * 
 * 1. Statically allocated version:
 *  Now works up to n = 21, too.
 *  Code is tail-recursive, so compiler can produce iterative translation.
 *  Only one call means much less stack used.
 *  Integer overflow is now the limiting factor.
 * 
 * 2. Dynamically allocated version:
 *  No change. Not tail-recursive; compiler cannot produce iterative translation. 
 */

#include <stdio.h>
#include <stdlib.h>

#define BLOCK_SIZE 524288

int calls = 0;

unsigned long factorial_static(unsigned long n) 
{
  /* use stack storage */
  int a[BLOCK_SIZE / sizeof(int)];
  
  if (n == 1)
  {
    printf("Base case for 1.\n");
    return 1;
  }
  else
  {
    printf("Recursive call %d for %lu\n", ++calls, n);
    return n * factorial_static(n - 1);
  }
}

unsigned long factorial_dynamic(unsigned long n)
{
  unsigned long result;
  
  /* use heap storage */
  int* a = (int*)malloc(BLOCK_SIZE / sizeof(int)); 
  if (a == NULL)
  {
    printf("Dynamic memory allocation failed after %d calls.\n", calls);
    exit(1);
  }
  
  if (n == 1)
  {
    printf("Base case for 1.\n");
    free(a);
    return 1;
  }
  else
  {
    printf("Recursive call %d for %lu\n", ++calls, n);
    result = n * factorial_dynamic(n - 1);
    free(a);
    return result;
  }
}

void main()
{
  unsigned long n;
  int choice;
  
  printf("\nCompute factorial(n) for what value of n? ");
  if (scanf("%lu", &n) <= 0) printf("Error reading n.\n");

  printf("1 for static allocation, or 2 for dynamic allocation? ");
  if (scanf("%d", &choice) <= 0) printf("Error reading choice.\n");
  
  if (choice == 1) printf("The factorial of %lu is %lu\n", n, factorial_static(n));
  else if (choice == 2) printf("The factorial of %lu is %lu\n", n, factorial_dynamic(n));
}
