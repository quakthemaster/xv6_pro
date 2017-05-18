#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "stdint.h"
int main()
{
	int rand;
	rand = random();
	printf(1," The random number is %d\n",rand);
	exit();
	return(0);

}
