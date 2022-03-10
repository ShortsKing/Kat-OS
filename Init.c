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
   exec();
   exec();
   exec();
   exec();
}
main() {
   Init();
}
