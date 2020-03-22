#include <iostream>
#include <fstream>
#include <string>
#include <time.h>
#include <iomanip>

using namespace std;

int main(int argc, char *argv[])
{
    cout << "START!!!" << endl;
    clock_t start, end;
    double time, sum = 0;
    int count = 5;

    for (int i = 0; i < count; i++) {
        start = clock();

        ifstream ifs("/fixtures/sample.csv");
        ofstream ofs("./sample.csv");
        const int SIZE = 1024;
        char buffer[SIZE];
        
        while (ifs.getline(buffer, SIZE)) {
            // ofs.write(buffer, SIZE);
        }

        end = clock();
        time = (double) (end - start) / CLOCKS_PER_SEC;
        cout << "Time Result: ";
        cout << fixed << setprecision(4) << time << endl;
        sum += time;
    }

    cout << "Average: ";
    cout << fixed << setprecision(4) << sum / count << endl;

    return 0;
}