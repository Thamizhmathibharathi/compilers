
#include <stdio.h>

int main()
{
    printf("Target Code:\n");

    printf("MOV R1, 0\n");
    printf("STORE R1, i\n");

    printf("MOV R1, 200\n");
    printf("STORE R1, t1\n");

    printf("L1:\n");
    printf("LOAD R1, i\n");
    printf("CMP R1, 10\n");
    printf("JGE L3\n");

    printf("LOAD R1, t1\n");
    printf("STORE R1, r\n");

    printf("LOAD R1, b\n");
    printf("MUL R1, c\n");
    printf("STORE R1, t2\n");

    printf("LOAD R1, a\n");
    printf("ADD R1, t2\n");
    printf("STORE R1, p\n");

    printf("LOAD R1, i\n");
    printf("ADD R1, 1\n");
    printf("STORE R1, i\n");

    printf("JMP L1\n");
    printf("L3:\n");
    printf("HALT\n");

    return 0;
}
