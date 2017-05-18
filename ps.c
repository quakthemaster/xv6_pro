#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
 int i;
  i =cps(); 
  printf(1,"The number of processes to be scheduled is %d",i,i);

  exit();
}

