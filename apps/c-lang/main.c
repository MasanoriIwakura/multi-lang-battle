#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int main(void)
{
    printf("START!!\n");
    clock_t start, end;
    double time, sum = 0;
    int count = 5;

    for (int i = 0; i < count; i++)
    {
        start = clock();

        char *fname = "/fixtures/sample.csv";
        char *ofname = "./sample.csv";
        FILE *fp = fopen(fname, "r");
        FILE *ofp = fopen(ofname, "w");

        const int SIZE = 1024;
        char buffer[SIZE];
        while (fgets(buffer, SIZE, fp))
        {
            char *tmp = strdup(buffer);
            fprintf(ofp, "%s", tmp);
            free(tmp);
        }

        fclose(fp);
        fclose(ofp);

        end = clock();
        time = (double)(end - start) / CLOCKS_PER_SEC;
        printf("Time Result: %.4f\n", time);
        sum += time;
    }

    printf("C-lang Average: %.4f\n", sum / count);

    return 0;
}
