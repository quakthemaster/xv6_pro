#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "stdint.h"
int main(int argc, char *argv[])
{
	int sc_rand;
	int sc_rand1;
	uint8_t rand;
	int a,b;
	a = atoi(argv[1]);
	b = atoi(argv[2]);
	rand = random();
	sc_rand = (rand%256);
	sc_rand1 = a + sc_rand;
	printf(1,"\nA IS %d and B is %d and The random number is %d\t and the random number is %d\n",a,b,sc_rand1,rand);
	exit();
	return(0);

}
