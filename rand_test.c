#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "stdint.h"

//The program for next process birth time
int nextprocessbirthtime(int a, int b ){
	int sc_rand;
	int sc_rand1;
	int k;
	k =0 ;
	uint8_t rand;
	int j;
	rand = random();
	sc_rand = (rand*(b-a)) ;
	j = sc_rand %256;
	sc_rand = sc_rand - j;
	for(k=0;;k++){
	sc_rand  = sc_rand - 256;
	if(sc_rand == 0){break;}
	} 
	sc_rand1 = a + k;
	return(sc_rand1);
}

//The program for processRuntime
int processruntime(int a , int b){
	int sc_rand;
	int sc_rand1;
	int k;
	k =0 ;
	uint8_t rand;
	int j;
	rand = random();
	sc_rand = (rand*(b-a)) ;
	j = sc_rand %256;
	sc_rand = sc_rand - j;
	for(k=0;;k++){
	sc_rand  = sc_rand - 256;
	if(sc_rand == 0){break;}
	} 
	sc_rand1 = a + k;
	return(sc_rand1);
}

void sleeper_program(int number)
{
	int clock_freq =177203;
	int timer  = clock_freq * number;
	int i;	
	i = timer;
	while(i)
	{
	wait();
	i--;
	}
	exit();
	
}

//The main program
int main(int argc, char *argv[])
{
	int id;
	int x ,z;
	int k;
	int time_diff;
	int minp_time,maxp_time,minp_runtime,maxp_runtime,maxnum_process,nexttime,runtime;
	minp_time = atoi(argv[1]);
	maxp_time = atoi(argv[2]);
	minp_runtime = atoi(argv[3]);
	maxp_runtime = atoi(argv[4]);
	maxnum_process = atoi(argv[5]);
	nexttime = nextprocessbirthtime(minp_time, maxp_time );
	runtime = nextprocessbirthtime(minp_runtime, maxp_runtime );
	int t[maxnum];
//for printing
	printf(1,"%d,%d,%d,%d,%d,%d,%d\nuser program starts\n",minp_time,maxp_time,minp_runtime,maxp_runtime,maxnum_process,nexttime,runtime);
//the parent will sleep
for(k = maxnum ; k>0 ; k--){
	t[k] = uptime();
	sleeper_program(nexttime);

//after waking up it forks a child
	id = fork ();
   	if ( id < 0 ) {
       printf(1, "%d failed in fork!\n", getpid() );
    } else if ( id > 0 ) {  //parent
      printf(1, "Parent %d creating child  %d\n", getpid(), id );
      wait();
   } else {   // child
       printf(1, "Child %d created\n",getpid() );
        sleeper_program(runtime);   // child sleeps for runtime
  	exit();
	}
}
	time_diff = t[max_num] - t[0];
	printf(1,"The time difference was %d",time_diff);

	return(0);
		
}

