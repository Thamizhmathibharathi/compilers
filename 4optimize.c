
#include <stdio.h>

int main()
{
    printf("Before Optimization:\n");
    printf("L1: t1 = n * 4\n");
    printf("if m < t1 goto L2\n");
    printf("goto L3\n");
    printf("L2: t2 = 16 * 5\n");
    printf("r = t2\n");
    printf("t3 = x * y\n");
    printf("t4 = t3 + z\n");
    printf("s = t4\n");
    printf("t5 = m + s\n");
    printf("t = t5\n");
    printf("goto L1\n");
    printf("L3:\n");

    printf("\nAfter Code Motion Optimization:\n");
    printf("t1 = 80\n");
    printf("L1: t2 = n * 4\n");
    printf("if m < t2 goto L2\n");
    printf("goto L3\n");
    printf("L2: r = t1\n");
    printf("t3 = x * y\n");
    printf("t4 = t3 + z\n");
    printf("s = t4\n");
    printf("t5 = m + s\n");
    printf("t = t5\n");
    printf("goto L1\n");
    printf("L3:\n");

    return 0;
}
