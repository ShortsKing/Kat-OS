/* This program reads settings.txt, and based on line 1 (shell vs. desktop)
 * executes either the shell program, or continues by forking and executing 
 * a desktop program, while also launching the applications program and 
 * managing everything from the background.
 * 
 * i am currently tied up in other business. wouldn't mind some help (*COUGH* joseph *COUGH*)
 */
//heeheehee
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

char readSetting(char setting[]; int s_len;){
  FILE* ptr;
  char str[20000];
  ptr = fopen("config.txt", "a+");
 
  if (NULL == ptr) {
      printf("config.txt can't be opened \n Please try rebooting");
  }
 
  fgets(str, 20000, ptr);
  fclose(ptr);
  
  int i = 0;
  while(true){
    if(str[i] == setting[0]){
      int x = 1; ++i;
      while(true){
        if(str[i] != setting[x]){break;}
        if(s_len-1 == x){
          ++i;
          if(str(i) == '='){
            ++i;
            return str[i];
          }
        } ++i; ++x;
      }
    } ++i;
  }
}

int main(){
  char ShellOrDesktop = readSetting("Shell/Desktop", 13);
  switch(ShellOrDesktop){
    case 's': exec("Shell");
    case 'S': exec("Shell");
    case 'd': exec("Desk");
    case 'D': exec("Desk");
  }
}
