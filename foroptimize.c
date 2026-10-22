
#include <stdio.h>

int main()
{
    printf("Before Optimization:\n");
    printf("i = 0\n");
    printf("L1: if i < 10 goto L2\n");
    printf("goto L3\n");
    printf("L2: t1 = 10 * 20\n");
    printf("r = t1\n");
    printf("t2 = b * c\n");
    printf("t3 = a + t2\n");
    printf("p = t3\n");
    printf("i = i + 1\n");
    printf("goto L1\n");
    printf("L3:\n");

    printf("\nAfter Optimization:\n");
    printf("i = 0\n");
    printf("t1 = 200\n");
    printf("L1: if i < 10 goto L2\n");
    printf("goto L3\n");
    printf("L2: r = t1\n");
    printf("t2 = b * c\n");
    printf("t3 = a + t2\n");
    printf("p = t3\n");
    printf("i = i + 1\n");
    printf("goto L1\n");
    printf("L3:\n");

    return 0;
}
