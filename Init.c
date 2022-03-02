#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

main() {
   pid_t pid;
   char *const parmList[] = {"/bin/ls", "-l", "/u/userid/dirname", NULL};

   if ((pid = fork()) == -1)
     printf("fork error\nKat-OS is Inoperable");
   else if (pid == 0) {
      execv("/Kat-OS/Kat-OS", parmList);
      printf("Return not expected. Must be an execv error.n");
   }
}
