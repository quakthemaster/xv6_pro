#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{		
  int length_of_job, pid;

  if(argc < 3 ){
      printf(2, "Usage: nice pid length\n" );
      exit();
  }
  pid = atoi ( argv[1] );
  length_of_job = atoi ( argv[2] );
  if ( length_of_job < 0 || length_of_job > 20 ) {
      printf(2, "Invalid length (0-20)!\n" );
      exit();
  }
  chpr( pid, length_of_job );

  exit();
}

