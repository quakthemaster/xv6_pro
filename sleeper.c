#include "types.h"
#include "stat.h"
#include "user.h"

void stoi(int argc ,char *argv[]){
		
		int timer = 0, i =0;
		while(argv[i] != '\0'){
			if(argv[i] >= '0' && argv[i] <= '9'){
            			timer = timer*10 + argv[i] - '0';
        		}
			 else {	break; }
        		i++;
    		}
		for(i = 1; i < argc; i++){
			printf(1,"Hello,Nice to meet you %d\n",timer); 
			}
		exit();
}

