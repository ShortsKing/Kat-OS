#include <iostream>
#include <unistd.h>
#include <cctype>
using namespace std;

unsigned int second = 1000000;
char CatOrHuman = NULL

int main() {
	cout << "Hello World\n";
	usleep(5 * second); //sleeps for 5 second
	cout << "JUST KIDDING!!\n";
	cout << "Cat or Human? (H/C): ";
	cin >> toupper(CatOrHuman);
}
