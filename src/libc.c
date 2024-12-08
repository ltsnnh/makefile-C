int i;

int libcPow(int a, int b)
{
    int retVal = a;

    for (i = 1; i < b; i++)
    {
        retVal *= a;
    }

    return retVal;
}
