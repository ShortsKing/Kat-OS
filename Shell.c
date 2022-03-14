#include <stdio.h> /*adds stdio to file*/
#include <sys/types.h> /*adds sys/types to file*/
#include <unistd.h> /*adds unistd to file*/
#include <dirent.h> /*adds dirent to file*/
int main() { /*initializes the file*/
  char str[100]; /*creates a 100 character variable*/
  
  printf("please enter a command :"); /*asks you to enter a command*/
  gets( str );
  
  printf("\nyou entered: "); /*returns what you entered*/
  puts( str );
  
  DIR *folder;

  folder = opendir(str);
  if(folder == NULL)
  {
  puts("Unable to read directory");
      return(1);
  }
  else
  {
      puts("Directory is opened!");
  }
  closedir(folder);

  return(0);
}
