#include<stdio.h>


#define static unsigned int seed=7;  // 100% random seed value

static unsigned int randn(void)
{
  seed ^= seed << 13;//13
  seed ^= seed >> 17;//17
  seed ^= seed << 5;//5
  return seed;
}


 int
main(void)
{
unsigned int i;
//int val[];
unsigned int max=0;
unsigned int j;
for(j=0;j<=4294967295;j++){
i=randn();
if(max<i)max=i;
//i=i%14;
}
printf("%u\n",max);

//exit();
return 0;
}




