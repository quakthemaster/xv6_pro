#include "types.h"
#include "user.h"
#include "stat.h"
int main(void)
{
	int a;
	a =5;
	printf(1,"I am initiating the system call");

	a = random();
	printf(1,"%d\n",a);
	return(0);
}
