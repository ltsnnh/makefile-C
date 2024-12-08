#include <stdio.h>
#include "libc.h"

int a = 2, b = 3;

int main(void)
{
    printf("%d\n", libcPow(a, b));

    return 0;
}
