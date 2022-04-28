/* This program reads settings.txt, and based on line 1 (shell vs. desktop)
 * executes either the shell program, or continues by forking and executing 
 * a desktop program, while also launching the applications program and 
 * managing everything from the background.
 * 
 * i am currently tied up in other business. wouldn't mind some help (*COUGH* joseph *COUGH*)
 */

#include <stdio.h>

char readSetting(char setting[]; int s_len;){
  FILE* ptr;
  char str[20000];
  ptr = fopen("test.txt", "a+");
 
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
        if(str[i] != setting[x]){ //check if
          break;
        } ++i; ++x;
      }
    } ++i;
  }
}

int main(){
  char readSetting(1);
  
}
