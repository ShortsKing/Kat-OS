// C Program to design a shell in Linux
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
  
#define MAXCOM 1000 // max number of letters to be supported
#define MAXLIST 100 // max number of commands to be supported
  
// Clearing the shell using escape sequences
#define clear() printf("\033[H\033[J")
  
// Greeting shell during startup
void init_shell()
{
    clear();
    printf("\n\n\n\n******************"
        "************************");
    printf("\n\n\n\t**** WELCOM TO KAT-OS****");
    printf("\n\n\t-FOR THE KOOT_KOOT-");
    printf("\n\n\n\n*******************"
        "***********************");
    char* username = getenv("USER");
    printf("\n\n\nUSER is: @%s", username);
    printf("\n");
    sleep(1);
    clear();
}
  
// Function to take input

 int takeInput(char* str) {
  char str;
  printf("\n>>>");
  scanf("%d", &str);
  return str;
}
  
int main() {
  init_shell();
  while(1) {
    char[] command = takeInput();
    if (fork() == 0) {
          // Newly spawned child Process. This will be taken over by "ls -l"
          int status_code = execvp("/Shell/" + command, null);
    
          printf("ls -l has taken control of this child process. This won't execute unless it terminates abnormally!\n");
    
          if (status_code == -1) {
              printf("Terminated Incorrectly\n");
              return 1;
          }
    }
    //try executing /shell/$command
    //return error if it doesnt work
    //start over
  }
  return 0;
}
