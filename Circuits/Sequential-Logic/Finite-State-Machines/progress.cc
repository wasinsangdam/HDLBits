#include <iostream>
#define MAX 182
using namespace std;

int main (int argc, char* argv[]) {

    double cur = (double) atoi(argv[1]);
    double total = (double) MAX;

    cout << fixed;
    cout.precision(1);

    cout << cur / total * 100.0 << "% (" << argv[1] << "/" << MAX << ")\n";
    cout << "Remain : " << (int) (MAX - cur) << "\n";

}