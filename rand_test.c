#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "stdint.h"

//The program for next process birth time
int nextprocessbirthtime(int a, int b ){
	int sc_rand;
	int sc_rand1;
	uint8_t rand;
	rand = random();
	sc_rand = (rand/256)*(b-a) ;
	sc_rand1 = a + sc_rand;
	return(sc_rand1);
}

//The program for processRuntime
int processruntime(int a , int b){
	int sc_rand;
	int sc_rand1;
	uint8_t rand;
	rand = random();
	sc_rand = (rand/256)*(b-a) ;
	sc_rand1 = a + sc_rand;
	return(sc_rand1);
}


//The main program
int main(int argc, char *argv[])
{
	int minp_time,maxp_time,minp_runtime,maxp_runtime,maxnum_process,nexttime,runtime;
	minp_time = atoi(argv[1]);
	maxp_time = atoi(argv[2]);
	minp_runtime = atoi(argv[3]);
	maxp_runtime = atoi(argv[4]);
	maxnum_process = atoi(argv[5]);
	nexttime = nextprocessbirthtime(minp_time, maxp_time );
	runtime = nextprocessbirthtime(minp_runtime, maxp_runtime );
	printf(1,"%d,%d,%d,%d,%d,%d,%d\n",minp_time,maxp_time,minp_runtime,maxp_runtime,maxnum_process,nexttime,runtime);
	
	exit();
	return(0);

}


