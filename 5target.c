
#include <stdio.h>

int main()
{
    printf("Three Address Code:\n");
    printf("t1 = x * y\n");
    printf("t2 = t1 + z\n");
    printf("s = t2\n");

    printf("\nTarget Code:\n");
    printf("LOAD R1, x\n");
    printf("MUL R1, y\n");
    printf("ADD R1, z\n");
    printf("STORE R1, s\n");

    return 0;
}
