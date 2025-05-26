/**
 * @file main.c
 *
 * @brief Enter the coordinates of a series of points, then find the pair of
 *        points that are farthest apart.
 *
 */

#include <stdio.h>
#include "libc.h"

int main(void)
{
    int numberPoints = 0;
    float x[100], y[100];
    int i = 0, j = 0;
    int point1 = 0;
    int point2 = 1;
    float dMax = 0;
    float d = 0;

    while (numberPoints < 2)
    {
        printf("Enter number of points (>= 2): ");
        scanf("%d", &numberPoints);
        if (numberPoints < 2)
        {
            printf("Number of point = %d < 2\n", numberPoints);
        }
    }

    for (i = 0; i < numberPoints; i++)
    {
        printf("Enter coordinates x, y of point number %d:\n", i + 1);
        printf("x%d = ",i + 1);
        scanf("%f", &x[i]);
        printf("y%d = ",i + 1);
        scanf("%f", &y[i]);
    }

    dMax = EuclideanDistance(x, y, point1, point2);

    for (i = 0; i < numberPoints; i++)
    {
        for (j = i + 1; j < numberPoints; j++)
        {
            d = EuclideanDistance(x, y, i, j);
            if (d > dMax)
            {
                dMax = d;
                point1 = i;
                point2 = j;
            }
        }
    }

    printf("Longest distance = %.3f between point %d [%.2f,%.2f] and point %d [%.2f,%.2f]\n", \
        dMax, point1 + 1, x[point1], y[point1], point2 + 1, x[point2], y[point2]);

    return 0;
}
