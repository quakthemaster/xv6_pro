
#include "types.h"
#include "stat.h"
#include "user.h"


int sleeper_program(int argc, char *argv[])
{
	int i;
	int number = 0;
	i=0;
	char *string_input;
	string_input = argv[1];
	while(string_input[i] != '\0'){
        if(string_input[i] >= '0' && string_input[i] <= '9'){
            number = number*10 + string_input[i] - '0';
        } else {
            break;
        }
        i++;
    }
	printf(1,"%d",number+1);
	return number;
	exit();
	
}

