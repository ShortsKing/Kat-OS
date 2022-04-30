#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <time.h>

void exec(char path[], ) {
   pid_t pid; //i think pid_t relies on sys/types.h? just a guess, based on the name (types.h)
   char *const parmList[] = {NULL};

   if ((pid = fork()) == -1) printf("fork error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power"); //Check if fork failed
   else if (pid == 0) {
      execv(path, parmList); //runs main() function in program located at $path with arguments $parmList, which should be a NULL terminated string
      printf("Return not expected. Must be an execv error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power"); //This will only run if execv() failed, because execv() should terminate the existing process
   }
}

void delay(int number_of_seconds)
{
    // Converting time into milli_seconds
    int milli_seconds = 1000 * number_of_seconds;
  
    // Storing start time
    clock_t start_time = clock();
  
    // looping till required time is not achieved
    while (clock() < start_time + milli_seconds);
}

char CatOrHuman = NULL

int main() {
	printf("Hello World\n");
	delay(5); //wait 5 seconds for the joke to set in ;)
	printf("JUST KIDDING!!\n");
	printf("Cat or Human? (H/C): ");
	scanf("%c", CatOrHuman);
	switch(CatOrHuman) {
		case 'c':
			exec("Kitty");
		case 'C':
			exec("Kitty");
		case 'h':
			exec("Human");
		case 'H':
			exec("Human");
	}
}

// Compile as "User"
