#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int main(void)
{
    printf("START!!\n");
    clock_t start, end;
    start = clock();

    char *fname = "/fixtures/sample.csv";
    char *ofname = "./sample.csv";
    FILE *fp = fopen(fname, "r");
    FILE *ofp = fopen(ofname, "w");

    char buffer[1024];
    while (fgets(buffer, 1024, fp)) {
        char* tmp = strdup(buffer);
        fprintf(ofp, "%s", tmp);
        free(tmp);
    }

    fclose(fp);
    fclose(ofp);

    end = clock();
    printf("Time Result: %.4f\n", (double) (end - start) / CLOCKS_PER_SEC);

    return 0;
}
