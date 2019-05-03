/* Demonstrates C's pointer arithmetic features.
 *
 * A pointer is a variable that holds an address instead of a data value.
 *
 * C allows pointer arithmetic: calculations using memory addresses.
 *
 * This is very powerful and flexible; dangerous if misused.
 *
 * In C, strings are zero-terminated character arrays.
 *
 * Here are alternate string copy routines.
 *
 */

#include <stdio.h>

/* Copy strings using array indexing. */
void strcpy1(char dest[], char src[])
{
	int i = 0;

	do
	{
		dest[i] = src[i];
	} while (src[i++] != '\0');
}

/* Copy strings using array indexing (terse). */
void strcpy2(char dest[], char src[])
{
	int i = 0;

	while (dest[i] = src[i++]) ;
}

/* Copy strings using pointer arithmetic. */
void strcpy3(char dest[], char src[])
{
	do
	{
		*dest = *src;
		dest++;
		src++;
	} while (*(src - 1) != '\0');
}

/* Copy strings using pointer arithmetic (terse). */
void strcpy4(char dest[], char src[])
{
	while (*dest++ = *src++) ;
}

void main()
{
	char str1[] = "hello";
	char str2[] = "world";
	
	int choice;
	printf("This program illustrates four different string copy routines.\n");
	printf("Pick a number run a routine.\n\n");
	printf("\t1 Array indexing\n");
	printf("\t2 Array indexing (terse)\n");
	printf("\t3 Pointer arithmetic\n");
	printf("\t4 Pointer arithmetic (terse)\n");
	printf("\nEnter 1-4: ");
	scanf("%d", &choice);
	
	printf("Before: %s, %s\n", str1, str2);
	
	switch (choice) {
		case 1: strcpy1(str2, str1); break;
		case 2: strcpy2(str2, str1); break;
		case 3: strcpy3(str2, str1); break;
		case 4: strcpy4(str2, str1); break;
	}
	
	printf("After:  %s, %s\n", str1, str2);
}

