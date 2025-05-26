#include <math.h>

float EuclideanDistance(float* x, float* y, int point1, int point2)
{
    return sqrt(pow(x[point1] - x[point2], 2) + pow(y[point1] - y[point2], 2));
}
