#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

void Kat-OS() {
   pid_t pid;
   char *const parmList[] = {NULL};

   if ((pid = fork()) == -1) printf("fork error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power"); //Check if fork failed
   else if (pid == 0) {
      execv("/Kat-OS/Kat-OS", parmList); 
      printf("Return not expected. Must be an execv error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power");
   }
}

void Shell() {
   pid_t pid;
   char *const parmList[] = {NULL};

   if ((pid = fork()) == -1) printf("fork error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power"); //Check if fork failed
   else if (pid == 0) {
      execv("/Kat-OS/Shell", parmList); 
      printf("Return not expected. Must be an execv error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power");
   }
}

void User() {
   pid_t pid;
   char *const parmList[] = {NULL};

   if ((pid = fork()) == -1) printf("fork error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power"); //Check if fork failed
   else if (pid == 0) {
      execv("/Kat-OS/User", parmList); 
      printf("Return not expected. Must be an execv error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power");
   }
}

void Programs() {
   pid_t pid;
   char *const parmList[] = {NULL};

   if ((pid = fork()) == -1) printf("fork error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power"); //Check if fork failed
   else if (pid == 0) {
      execv("/Kat-OS/Programs", parmList); 
      printf("Return not expected. Must be an execv error\nKat-OS has been Rendered Inoperable\n\nPlease Cut Power");
   }
}

void Init() {
   Kat-OS();
   Shell();
   User();
   Programs();
}

main() {
   Init();
}
