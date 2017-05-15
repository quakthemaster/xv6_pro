#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
 int i;
  i =cps(); 
  printf(1,"The number of running process is %d and the number of sleeping process is %d\n",i,i);

  exit();
}

