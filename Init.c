/* Init is first program launched by the kernel, compiled from Init.c
 * You can change the first program run by the kernel by adding "init=/location/of/init" 
 * Init.c launches four executable which manage the four sectors of the operating system from this point on
 */

#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

void exec(char path[], ) {
   pid_t pid; //i think pid_t relies on sys/types.h? just a guess, based on the name (types.h)
   char *const parmList[] = {NULL};

   if ((pid = fork()) == -1) printf("fork error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power"); //Check if fork failed
   else if (pid == 0) {
      execv(path, parmList); //runs main() function in program located at $path with arguments $parmList, which should be a NULL terminated string
      printf("Return not expected. Must be an execv error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power"); //This will only run if execv() failed, because execv() should terminate the existing process
   }
}

void Init() {
   exec(/Kat-OS/Kat-OS); //execute /Kat-OS/Kat-OS
   exec(/Kat-OS/User); //execute /Kat-OS/User
}

main() {
   Init(); //Call Init()
   kill(getpid()); //Kill the current process
   printf("An Error has Occured at the End of Init.C"); //this shouldnt run, and its clear there has been an error if it doesnt work
   return 0; //last resort attempt to kill the program
   printf("Init.c has Failed to Terminate"); //Init.c gives up trying to commit suicide
}

// Init.c is DONE!!
