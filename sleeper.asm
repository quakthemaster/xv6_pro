
_sleeper:     file format elf32-i386


Disassembly of section .text:

00000000 <sleeper_program>:
#include "stat.h"
#include "user.h"


void sleeper_program(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 14             	sub    $0x14,%esp
	int i;
	long int number = 0;
	i=0;
	char *string_input;
	string_input = argv[1];
   7:	8b 45 0c             	mov    0xc(%ebp),%eax
   a:	8b 48 04             	mov    0x4(%eax),%ecx
	while(string_input[i] != '\0'){
   d:	0f be 11             	movsbl (%ecx),%edx
  10:	8d 42 d0             	lea    -0x30(%edx),%eax
  13:	3c 09                	cmp    $0x9,%al
  15:	77 64                	ja     7b <sleeper_program+0x7b>
  17:	83 c1 01             	add    $0x1,%ecx


void sleeper_program(int argc, char *argv[])
{
	int i;
	long int number = 0;
  1a:	31 c0                	xor    %eax,%eax
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	i=0;
	char *string_input;
	string_input = argv[1];
	while(string_input[i] != '\0'){
        if(string_input[i] >= '0' && string_input[i] <= '9'){
            number = number*10 + string_input[i] - '0';
  20:	8d 04 80             	lea    (%eax,%eax,4),%eax
  23:	83 c1 01             	add    $0x1,%ecx
  26:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
	int i;
	long int number = 0;
	i=0;
	char *string_input;
	string_input = argv[1];
	while(string_input[i] != '\0'){
  2a:	0f be 51 ff          	movsbl -0x1(%ecx),%edx
  2e:	8d 5a d0             	lea    -0x30(%edx),%ebx
  31:	80 fb 09             	cmp    $0x9,%bl
  34:	76 ea                	jbe    20 <sleeper_program+0x20>
            break;
        }
        i++;
    }	
	int clock_freq =177203;
	int timer  = clock_freq * number;
  36:	69 d8 33 b4 02 00    	imul   $0x2b433,%eax,%ebx
	printf(0,"The timer is for %d seconds\n",number);
  3c:	89 44 24 08          	mov    %eax,0x8(%esp)
  40:	c7 44 24 04 50 07 00 	movl   $0x750,0x4(%esp)
  47:	00 
  48:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  4f:	e8 dc 03 00 00       	call   430 <printf>

	i = timer;
	while(i)
  54:	85 db                	test   %ebx,%ebx
  56:	74 0a                	je     62 <sleeper_program+0x62>
	{
	wait();
  58:	e8 8d 02 00 00       	call   2ea <wait>
	int clock_freq =177203;
	int timer  = clock_freq * number;
	printf(0,"The timer is for %d seconds\n",number);

	i = timer;
	while(i)
  5d:	83 eb 01             	sub    $0x1,%ebx
  60:	75 f6                	jne    58 <sleeper_program+0x58>
	{
	wait();
	i--;
	}
	printf(1,"The waiting time is out\n");
  62:	c7 44 24 04 6d 07 00 	movl   $0x76d,0x4(%esp)
  69:	00 
  6a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  71:	e8 ba 03 00 00       	call   430 <printf>
	exit();
  76:	e8 67 02 00 00       	call   2e2 <exit>
        }
        i++;
    }	
	int clock_freq =177203;
	int timer  = clock_freq * number;
	printf(0,"The timer is for %d seconds\n",number);
  7b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  82:	00 
  83:	c7 44 24 04 50 07 00 	movl   $0x750,0x4(%esp)
  8a:	00 
  8b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  92:	e8 99 03 00 00       	call   430 <printf>
  97:	eb c9                	jmp    62 <sleeper_program+0x62>
  99:	66 90                	xchg   %ax,%ax
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <strcpy>:
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  aa:	89 c2                	mov    %eax,%edx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b0:	83 c1 01             	add    $0x1,%ecx
  b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  b7:	83 c2 01             	add    $0x1,%edx
  ba:	84 db                	test   %bl,%bl
  bc:	88 5a ff             	mov    %bl,-0x1(%edx)
  bf:	75 ef                	jne    b0 <strcpy+0x10>
  c1:	5b                   	pop    %ebx
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    
  c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000d0 <strcmp>:
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	56                   	push   %esi
  d4:	53                   	push   %ebx
  d5:	8b 55 08             	mov    0x8(%ebp),%edx
  d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  db:	0f b6 02             	movzbl (%edx),%eax
  de:	0f b6 19             	movzbl (%ecx),%ebx
  e1:	84 c0                	test   %al,%al
  e3:	75 1e                	jne    103 <strcmp+0x33>
  e5:	eb 29                	jmp    110 <strcmp+0x40>
  e7:	89 f6                	mov    %esi,%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  f0:	83 c2 01             	add    $0x1,%edx
  f3:	0f b6 02             	movzbl (%edx),%eax
  f6:	8d 71 01             	lea    0x1(%ecx),%esi
  f9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  fd:	84 c0                	test   %al,%al
  ff:	74 0f                	je     110 <strcmp+0x40>
 101:	89 f1                	mov    %esi,%ecx
 103:	38 d8                	cmp    %bl,%al
 105:	74 e9                	je     f0 <strcmp+0x20>
 107:	29 d8                	sub    %ebx,%eax
 109:	5b                   	pop    %ebx
 10a:	5e                   	pop    %esi
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	31 c0                	xor    %eax,%eax
 112:	29 d8                	sub    %ebx,%eax
 114:	5b                   	pop    %ebx
 115:	5e                   	pop    %esi
 116:	5d                   	pop    %ebp
 117:	c3                   	ret    
 118:	90                   	nop
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000120 <strlen>:
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 4d 08             	mov    0x8(%ebp),%ecx
 126:	80 39 00             	cmpb   $0x0,(%ecx)
 129:	74 12                	je     13d <strlen+0x1d>
 12b:	31 d2                	xor    %edx,%edx
 12d:	8d 76 00             	lea    0x0(%esi),%esi
 130:	83 c2 01             	add    $0x1,%edx
 133:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 137:	89 d0                	mov    %edx,%eax
 139:	75 f5                	jne    130 <strlen+0x10>
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    
 13d:	31 c0                	xor    %eax,%eax
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    
 141:	eb 0d                	jmp    150 <memset>
 143:	90                   	nop
 144:	90                   	nop
 145:	90                   	nop
 146:	90                   	nop
 147:	90                   	nop
 148:	90                   	nop
 149:	90                   	nop
 14a:	90                   	nop
 14b:	90                   	nop
 14c:	90                   	nop
 14d:	90                   	nop
 14e:	90                   	nop
 14f:	90                   	nop

00000150 <memset>:
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 15d:	89 d7                	mov    %edx,%edi
 15f:	fc                   	cld    
 160:	f3 aa                	rep stos %al,%es:(%edi)
 162:	89 d0                	mov    %edx,%eax
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <strchr>:
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 17a:	0f b6 10             	movzbl (%eax),%edx
 17d:	84 d2                	test   %dl,%dl
 17f:	74 1d                	je     19e <strchr+0x2e>
 181:	38 d3                	cmp    %dl,%bl
 183:	89 d9                	mov    %ebx,%ecx
 185:	75 0d                	jne    194 <strchr+0x24>
 187:	eb 17                	jmp    1a0 <strchr+0x30>
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	38 ca                	cmp    %cl,%dl
 192:	74 0c                	je     1a0 <strchr+0x30>
 194:	83 c0 01             	add    $0x1,%eax
 197:	0f b6 10             	movzbl (%eax),%edx
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strchr+0x20>
 19e:	31 c0                	xor    %eax,%eax
 1a0:	5b                   	pop    %ebx
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    
 1a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <gets>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
 1b5:	53                   	push   %ebx
 1b6:	31 f6                	xor    %esi,%esi
 1b8:	8d 7d e7             	lea    -0x19(%ebp),%edi
 1bb:	83 ec 1c             	sub    $0x1c,%esp
 1be:	eb 29                	jmp    1e9 <gets+0x39>
 1c0:	83 ec 04             	sub    $0x4,%esp
 1c3:	6a 01                	push   $0x1
 1c5:	57                   	push   %edi
 1c6:	6a 00                	push   $0x0
 1c8:	e8 2d 01 00 00       	call   2fa <read>
 1cd:	83 c4 10             	add    $0x10,%esp
 1d0:	85 c0                	test   %eax,%eax
 1d2:	7e 1d                	jle    1f1 <gets+0x41>
 1d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
 1db:	89 de                	mov    %ebx,%esi
 1dd:	3c 0a                	cmp    $0xa,%al
 1df:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 1e3:	74 1b                	je     200 <gets+0x50>
 1e5:	3c 0d                	cmp    $0xd,%al
 1e7:	74 17                	je     200 <gets+0x50>
 1e9:	8d 5e 01             	lea    0x1(%esi),%ebx
 1ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ef:	7c cf                	jl     1c0 <gets+0x10>
 1f1:	8b 45 08             	mov    0x8(%ebp),%eax
 1f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 1f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fb:	5b                   	pop    %ebx
 1fc:	5e                   	pop    %esi
 1fd:	5f                   	pop    %edi
 1fe:	5d                   	pop    %ebp
 1ff:	c3                   	ret    
 200:	8b 45 08             	mov    0x8(%ebp),%eax
 203:	89 de                	mov    %ebx,%esi
 205:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 209:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20c:	5b                   	pop    %ebx
 20d:	5e                   	pop    %esi
 20e:	5f                   	pop    %edi
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
 211:	eb 0d                	jmp    220 <stat>
 213:	90                   	nop
 214:	90                   	nop
 215:	90                   	nop
 216:	90                   	nop
 217:	90                   	nop
 218:	90                   	nop
 219:	90                   	nop
 21a:	90                   	nop
 21b:	90                   	nop
 21c:	90                   	nop
 21d:	90                   	nop
 21e:	90                   	nop
 21f:	90                   	nop

00000220 <stat>:
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
 225:	83 ec 08             	sub    $0x8,%esp
 228:	6a 00                	push   $0x0
 22a:	ff 75 08             	pushl  0x8(%ebp)
 22d:	e8 f0 00 00 00       	call   322 <open>
 232:	83 c4 10             	add    $0x10,%esp
 235:	85 c0                	test   %eax,%eax
 237:	78 27                	js     260 <stat+0x40>
 239:	83 ec 08             	sub    $0x8,%esp
 23c:	ff 75 0c             	pushl  0xc(%ebp)
 23f:	89 c3                	mov    %eax,%ebx
 241:	50                   	push   %eax
 242:	e8 f3 00 00 00       	call   33a <fstat>
 247:	89 c6                	mov    %eax,%esi
 249:	89 1c 24             	mov    %ebx,(%esp)
 24c:	e8 b9 00 00 00       	call   30a <close>
 251:	83 c4 10             	add    $0x10,%esp
 254:	89 f0                	mov    %esi,%eax
 256:	8d 65 f8             	lea    -0x8(%ebp),%esp
 259:	5b                   	pop    %ebx
 25a:	5e                   	pop    %esi
 25b:	5d                   	pop    %ebp
 25c:	c3                   	ret    
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 265:	eb ef                	jmp    256 <stat+0x36>
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <atoi>:
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 4d 08             	mov    0x8(%ebp),%ecx
 277:	0f be 11             	movsbl (%ecx),%edx
 27a:	8d 42 d0             	lea    -0x30(%edx),%eax
 27d:	3c 09                	cmp    $0x9,%al
 27f:	b8 00 00 00 00       	mov    $0x0,%eax
 284:	77 1f                	ja     2a5 <atoi+0x35>
 286:	8d 76 00             	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 290:	8d 04 80             	lea    (%eax,%eax,4),%eax
 293:	83 c1 01             	add    $0x1,%ecx
 296:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 29a:	0f be 11             	movsbl (%ecx),%edx
 29d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2a0:	80 fb 09             	cmp    $0x9,%bl
 2a3:	76 eb                	jbe    290 <atoi+0x20>
 2a5:	5b                   	pop    %ebx
 2a6:	5d                   	pop    %ebp
 2a7:	c3                   	ret    
 2a8:	90                   	nop
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002b0 <memmove>:
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
 2b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	8b 75 0c             	mov    0xc(%ebp),%esi
 2be:	85 db                	test   %ebx,%ebx
 2c0:	7e 14                	jle    2d6 <memmove+0x26>
 2c2:	31 d2                	xor    %edx,%edx
 2c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2cf:	83 c2 01             	add    $0x1,%edx
 2d2:	39 da                	cmp    %ebx,%edx
 2d4:	75 f2                	jne    2c8 <memmove+0x18>
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5d                   	pop    %ebp
 2d9:	c3                   	ret    

000002da <fork>:
 2da:	b8 01 00 00 00       	mov    $0x1,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <exit>:
 2e2:	b8 02 00 00 00       	mov    $0x2,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <wait>:
 2ea:	b8 03 00 00 00       	mov    $0x3,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <pipe>:
 2f2:	b8 04 00 00 00       	mov    $0x4,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <read>:
 2fa:	b8 05 00 00 00       	mov    $0x5,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <write>:
 302:	b8 10 00 00 00       	mov    $0x10,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <close>:
 30a:	b8 15 00 00 00       	mov    $0x15,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <kill>:
 312:	b8 06 00 00 00       	mov    $0x6,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <exec>:
 31a:	b8 07 00 00 00       	mov    $0x7,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <open>:
 322:	b8 0f 00 00 00       	mov    $0xf,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <mknod>:
 32a:	b8 11 00 00 00       	mov    $0x11,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <unlink>:
 332:	b8 12 00 00 00       	mov    $0x12,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <fstat>:
 33a:	b8 08 00 00 00       	mov    $0x8,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <link>:
 342:	b8 13 00 00 00       	mov    $0x13,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <mkdir>:
 34a:	b8 14 00 00 00       	mov    $0x14,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <chdir>:
 352:	b8 09 00 00 00       	mov    $0x9,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <dup>:
 35a:	b8 0a 00 00 00       	mov    $0xa,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <getpid>:
 362:	b8 0b 00 00 00       	mov    $0xb,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <sbrk>:
 36a:	b8 0c 00 00 00       	mov    $0xc,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <sleep>:
 372:	b8 0d 00 00 00       	mov    $0xd,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <uptime>:
 37a:	b8 0e 00 00 00       	mov    $0xe,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    
 382:	66 90                	xchg   %ax,%ax
 384:	66 90                	xchg   %ax,%ax
 386:	66 90                	xchg   %ax,%ax
 388:	66 90                	xchg   %ax,%ax
 38a:	66 90                	xchg   %ax,%ax
 38c:	66 90                	xchg   %ax,%ax
 38e:	66 90                	xchg   %ax,%ax

00000390 <printint>:
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
 396:	89 c6                	mov    %eax,%esi
 398:	83 ec 3c             	sub    $0x3c,%esp
 39b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 39e:	85 db                	test   %ebx,%ebx
 3a0:	74 7e                	je     420 <printint+0x90>
 3a2:	89 d0                	mov    %edx,%eax
 3a4:	c1 e8 1f             	shr    $0x1f,%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	74 75                	je     420 <printint+0x90>
 3ab:	89 d0                	mov    %edx,%eax
 3ad:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3b4:	f7 d8                	neg    %eax
 3b6:	89 75 c0             	mov    %esi,-0x40(%ebp)
 3b9:	31 ff                	xor    %edi,%edi
 3bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3be:	89 ce                	mov    %ecx,%esi
 3c0:	eb 08                	jmp    3ca <printint+0x3a>
 3c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3c8:	89 cf                	mov    %ecx,%edi
 3ca:	31 d2                	xor    %edx,%edx
 3cc:	8d 4f 01             	lea    0x1(%edi),%ecx
 3cf:	f7 f6                	div    %esi
 3d1:	0f b6 92 90 07 00 00 	movzbl 0x790(%edx),%edx
 3d8:	85 c0                	test   %eax,%eax
 3da:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 3dd:	75 e9                	jne    3c8 <printint+0x38>
 3df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3e2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3e5:	85 c0                	test   %eax,%eax
 3e7:	74 08                	je     3f1 <printint+0x61>
 3e9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3ee:	8d 4f 02             	lea    0x2(%edi),%ecx
 3f1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 3f5:	8d 76 00             	lea    0x0(%esi),%esi
 3f8:	0f b6 07             	movzbl (%edi),%eax
 3fb:	83 ec 04             	sub    $0x4,%esp
 3fe:	83 ef 01             	sub    $0x1,%edi
 401:	6a 01                	push   $0x1
 403:	53                   	push   %ebx
 404:	56                   	push   %esi
 405:	88 45 d7             	mov    %al,-0x29(%ebp)
 408:	e8 f5 fe ff ff       	call   302 <write>
 40d:	83 c4 10             	add    $0x10,%esp
 410:	39 df                	cmp    %ebx,%edi
 412:	75 e4                	jne    3f8 <printint+0x68>
 414:	8d 65 f4             	lea    -0xc(%ebp),%esp
 417:	5b                   	pop    %ebx
 418:	5e                   	pop    %esi
 419:	5f                   	pop    %edi
 41a:	5d                   	pop    %ebp
 41b:	c3                   	ret    
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 420:	89 d0                	mov    %edx,%eax
 422:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 429:	eb 8b                	jmp    3b6 <printint+0x26>
 42b:	90                   	nop
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <printf>:
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	8d 45 10             	lea    0x10(%ebp),%eax
 439:	83 ec 2c             	sub    $0x2c,%esp
 43c:	8b 75 0c             	mov    0xc(%ebp),%esi
 43f:	8b 7d 08             	mov    0x8(%ebp),%edi
 442:	89 45 d0             	mov    %eax,-0x30(%ebp)
 445:	0f b6 1e             	movzbl (%esi),%ebx
 448:	83 c6 01             	add    $0x1,%esi
 44b:	84 db                	test   %bl,%bl
 44d:	0f 84 b0 00 00 00    	je     503 <printf+0xd3>
 453:	31 d2                	xor    %edx,%edx
 455:	eb 39                	jmp    490 <printf+0x60>
 457:	89 f6                	mov    %esi,%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 460:	83 f8 25             	cmp    $0x25,%eax
 463:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 466:	ba 25 00 00 00       	mov    $0x25,%edx
 46b:	74 18                	je     485 <printf+0x55>
 46d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 470:	83 ec 04             	sub    $0x4,%esp
 473:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 476:	6a 01                	push   $0x1
 478:	50                   	push   %eax
 479:	57                   	push   %edi
 47a:	e8 83 fe ff ff       	call   302 <write>
 47f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 482:	83 c4 10             	add    $0x10,%esp
 485:	83 c6 01             	add    $0x1,%esi
 488:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 48c:	84 db                	test   %bl,%bl
 48e:	74 73                	je     503 <printf+0xd3>
 490:	85 d2                	test   %edx,%edx
 492:	0f be cb             	movsbl %bl,%ecx
 495:	0f b6 c3             	movzbl %bl,%eax
 498:	74 c6                	je     460 <printf+0x30>
 49a:	83 fa 25             	cmp    $0x25,%edx
 49d:	75 e6                	jne    485 <printf+0x55>
 49f:	83 f8 64             	cmp    $0x64,%eax
 4a2:	0f 84 f8 00 00 00    	je     5a0 <printf+0x170>
 4a8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4ae:	83 f9 70             	cmp    $0x70,%ecx
 4b1:	74 5d                	je     510 <printf+0xe0>
 4b3:	83 f8 73             	cmp    $0x73,%eax
 4b6:	0f 84 84 00 00 00    	je     540 <printf+0x110>
 4bc:	83 f8 63             	cmp    $0x63,%eax
 4bf:	0f 84 ea 00 00 00    	je     5af <printf+0x17f>
 4c5:	83 f8 25             	cmp    $0x25,%eax
 4c8:	0f 84 c2 00 00 00    	je     590 <printf+0x160>
 4ce:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4d1:	83 ec 04             	sub    $0x4,%esp
 4d4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4d8:	6a 01                	push   $0x1
 4da:	50                   	push   %eax
 4db:	57                   	push   %edi
 4dc:	e8 21 fe ff ff       	call   302 <write>
 4e1:	83 c4 0c             	add    $0xc,%esp
 4e4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4e7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4ea:	6a 01                	push   $0x1
 4ec:	50                   	push   %eax
 4ed:	57                   	push   %edi
 4ee:	83 c6 01             	add    $0x1,%esi
 4f1:	e8 0c fe ff ff       	call   302 <write>
 4f6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4fa:	83 c4 10             	add    $0x10,%esp
 4fd:	31 d2                	xor    %edx,%edx
 4ff:	84 db                	test   %bl,%bl
 501:	75 8d                	jne    490 <printf+0x60>
 503:	8d 65 f4             	lea    -0xc(%ebp),%esp
 506:	5b                   	pop    %ebx
 507:	5e                   	pop    %esi
 508:	5f                   	pop    %edi
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    
 50b:	90                   	nop
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 510:	83 ec 0c             	sub    $0xc,%esp
 513:	b9 10 00 00 00       	mov    $0x10,%ecx
 518:	6a 00                	push   $0x0
 51a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 51d:	89 f8                	mov    %edi,%eax
 51f:	8b 13                	mov    (%ebx),%edx
 521:	e8 6a fe ff ff       	call   390 <printint>
 526:	89 d8                	mov    %ebx,%eax
 528:	83 c4 10             	add    $0x10,%esp
 52b:	31 d2                	xor    %edx,%edx
 52d:	83 c0 04             	add    $0x4,%eax
 530:	89 45 d0             	mov    %eax,-0x30(%ebp)
 533:	e9 4d ff ff ff       	jmp    485 <printf+0x55>
 538:	90                   	nop
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 540:	8b 45 d0             	mov    -0x30(%ebp),%eax
 543:	8b 18                	mov    (%eax),%ebx
 545:	83 c0 04             	add    $0x4,%eax
 548:	89 45 d0             	mov    %eax,-0x30(%ebp)
 54b:	b8 86 07 00 00       	mov    $0x786,%eax
 550:	85 db                	test   %ebx,%ebx
 552:	0f 44 d8             	cmove  %eax,%ebx
 555:	0f b6 03             	movzbl (%ebx),%eax
 558:	84 c0                	test   %al,%al
 55a:	74 23                	je     57f <printf+0x14f>
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 560:	88 45 e3             	mov    %al,-0x1d(%ebp)
 563:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 566:	83 ec 04             	sub    $0x4,%esp
 569:	6a 01                	push   $0x1
 56b:	83 c3 01             	add    $0x1,%ebx
 56e:	50                   	push   %eax
 56f:	57                   	push   %edi
 570:	e8 8d fd ff ff       	call   302 <write>
 575:	0f b6 03             	movzbl (%ebx),%eax
 578:	83 c4 10             	add    $0x10,%esp
 57b:	84 c0                	test   %al,%al
 57d:	75 e1                	jne    560 <printf+0x130>
 57f:	31 d2                	xor    %edx,%edx
 581:	e9 ff fe ff ff       	jmp    485 <printf+0x55>
 586:	8d 76 00             	lea    0x0(%esi),%esi
 589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 590:	83 ec 04             	sub    $0x4,%esp
 593:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 596:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 599:	6a 01                	push   $0x1
 59b:	e9 4c ff ff ff       	jmp    4ec <printf+0xbc>
 5a0:	83 ec 0c             	sub    $0xc,%esp
 5a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5a8:	6a 01                	push   $0x1
 5aa:	e9 6b ff ff ff       	jmp    51a <printf+0xea>
 5af:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5b2:	83 ec 04             	sub    $0x4,%esp
 5b5:	8b 03                	mov    (%ebx),%eax
 5b7:	6a 01                	push   $0x1
 5b9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 5bc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5bf:	50                   	push   %eax
 5c0:	57                   	push   %edi
 5c1:	e8 3c fd ff ff       	call   302 <write>
 5c6:	e9 5b ff ff ff       	jmp    526 <printf+0xf6>
 5cb:	66 90                	xchg   %ax,%ax
 5cd:	66 90                	xchg   %ax,%ax
 5cf:	90                   	nop

000005d0 <free>:
 5d0:	55                   	push   %ebp
 5d1:	a1 20 0a 00 00       	mov    0xa20,%eax
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	53                   	push   %ebx
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5de:	8b 10                	mov    (%eax),%edx
 5e0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5e3:	39 c8                	cmp    %ecx,%eax
 5e5:	73 19                	jae    600 <free+0x30>
 5e7:	89 f6                	mov    %esi,%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5f0:	39 d1                	cmp    %edx,%ecx
 5f2:	72 1c                	jb     610 <free+0x40>
 5f4:	39 d0                	cmp    %edx,%eax
 5f6:	73 18                	jae    610 <free+0x40>
 5f8:	89 d0                	mov    %edx,%eax
 5fa:	39 c8                	cmp    %ecx,%eax
 5fc:	8b 10                	mov    (%eax),%edx
 5fe:	72 f0                	jb     5f0 <free+0x20>
 600:	39 d0                	cmp    %edx,%eax
 602:	72 f4                	jb     5f8 <free+0x28>
 604:	39 d1                	cmp    %edx,%ecx
 606:	73 f0                	jae    5f8 <free+0x28>
 608:	90                   	nop
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 610:	8b 73 fc             	mov    -0x4(%ebx),%esi
 613:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 616:	39 d7                	cmp    %edx,%edi
 618:	74 19                	je     633 <free+0x63>
 61a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 61d:	8b 50 04             	mov    0x4(%eax),%edx
 620:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 623:	39 f1                	cmp    %esi,%ecx
 625:	74 23                	je     64a <free+0x7a>
 627:	89 08                	mov    %ecx,(%eax)
 629:	a3 20 0a 00 00       	mov    %eax,0xa20
 62e:	5b                   	pop    %ebx
 62f:	5e                   	pop    %esi
 630:	5f                   	pop    %edi
 631:	5d                   	pop    %ebp
 632:	c3                   	ret    
 633:	03 72 04             	add    0x4(%edx),%esi
 636:	89 73 fc             	mov    %esi,-0x4(%ebx)
 639:	8b 10                	mov    (%eax),%edx
 63b:	8b 12                	mov    (%edx),%edx
 63d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 640:	8b 50 04             	mov    0x4(%eax),%edx
 643:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 646:	39 f1                	cmp    %esi,%ecx
 648:	75 dd                	jne    627 <free+0x57>
 64a:	03 53 fc             	add    -0x4(%ebx),%edx
 64d:	a3 20 0a 00 00       	mov    %eax,0xa20
 652:	89 50 04             	mov    %edx,0x4(%eax)
 655:	8b 53 f8             	mov    -0x8(%ebx),%edx
 658:	89 10                	mov    %edx,(%eax)
 65a:	5b                   	pop    %ebx
 65b:	5e                   	pop    %esi
 65c:	5f                   	pop    %edi
 65d:	5d                   	pop    %ebp
 65e:	c3                   	ret    
 65f:	90                   	nop

00000660 <malloc>:
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 0c             	sub    $0xc,%esp
 669:	8b 45 08             	mov    0x8(%ebp),%eax
 66c:	8b 15 20 0a 00 00    	mov    0xa20,%edx
 672:	8d 78 07             	lea    0x7(%eax),%edi
 675:	c1 ef 03             	shr    $0x3,%edi
 678:	83 c7 01             	add    $0x1,%edi
 67b:	85 d2                	test   %edx,%edx
 67d:	0f 84 a3 00 00 00    	je     726 <malloc+0xc6>
 683:	8b 02                	mov    (%edx),%eax
 685:	8b 48 04             	mov    0x4(%eax),%ecx
 688:	39 cf                	cmp    %ecx,%edi
 68a:	76 74                	jbe    700 <malloc+0xa0>
 68c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 692:	be 00 10 00 00       	mov    $0x1000,%esi
 697:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 69e:	0f 43 f7             	cmovae %edi,%esi
 6a1:	ba 00 80 00 00       	mov    $0x8000,%edx
 6a6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 6ac:	0f 46 da             	cmovbe %edx,%ebx
 6af:	eb 10                	jmp    6c1 <malloc+0x61>
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6b8:	8b 02                	mov    (%edx),%eax
 6ba:	8b 48 04             	mov    0x4(%eax),%ecx
 6bd:	39 cf                	cmp    %ecx,%edi
 6bf:	76 3f                	jbe    700 <malloc+0xa0>
 6c1:	39 05 20 0a 00 00    	cmp    %eax,0xa20
 6c7:	89 c2                	mov    %eax,%edx
 6c9:	75 ed                	jne    6b8 <malloc+0x58>
 6cb:	83 ec 0c             	sub    $0xc,%esp
 6ce:	53                   	push   %ebx
 6cf:	e8 96 fc ff ff       	call   36a <sbrk>
 6d4:	83 c4 10             	add    $0x10,%esp
 6d7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6da:	74 1c                	je     6f8 <malloc+0x98>
 6dc:	89 70 04             	mov    %esi,0x4(%eax)
 6df:	83 ec 0c             	sub    $0xc,%esp
 6e2:	83 c0 08             	add    $0x8,%eax
 6e5:	50                   	push   %eax
 6e6:	e8 e5 fe ff ff       	call   5d0 <free>
 6eb:	8b 15 20 0a 00 00    	mov    0xa20,%edx
 6f1:	83 c4 10             	add    $0x10,%esp
 6f4:	85 d2                	test   %edx,%edx
 6f6:	75 c0                	jne    6b8 <malloc+0x58>
 6f8:	31 c0                	xor    %eax,%eax
 6fa:	eb 1c                	jmp    718 <malloc+0xb8>
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 700:	39 cf                	cmp    %ecx,%edi
 702:	74 1c                	je     720 <malloc+0xc0>
 704:	29 f9                	sub    %edi,%ecx
 706:	89 48 04             	mov    %ecx,0x4(%eax)
 709:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 70c:	89 78 04             	mov    %edi,0x4(%eax)
 70f:	89 15 20 0a 00 00    	mov    %edx,0xa20
 715:	83 c0 08             	add    $0x8,%eax
 718:	8d 65 f4             	lea    -0xc(%ebp),%esp
 71b:	5b                   	pop    %ebx
 71c:	5e                   	pop    %esi
 71d:	5f                   	pop    %edi
 71e:	5d                   	pop    %ebp
 71f:	c3                   	ret    
 720:	8b 08                	mov    (%eax),%ecx
 722:	89 0a                	mov    %ecx,(%edx)
 724:	eb e9                	jmp    70f <malloc+0xaf>
 726:	c7 05 20 0a 00 00 24 	movl   $0xa24,0xa20
 72d:	0a 00 00 
 730:	c7 05 24 0a 00 00 24 	movl   $0xa24,0xa24
 737:	0a 00 00 
 73a:	b8 24 0a 00 00       	mov    $0xa24,%eax
 73f:	c7 05 28 0a 00 00 00 	movl   $0x0,0xa28
 746:	00 00 00 
 749:	e9 3e ff ff ff       	jmp    68c <malloc+0x2c>
