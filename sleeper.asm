
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
  40:	c7 44 24 04 76 07 00 	movl   $0x776,0x4(%esp)
  47:	00 
  48:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  4f:	e8 bc 03 00 00       	call   410 <printf>

	i = timer;
	while(i)
  54:	85 db                	test   %ebx,%ebx
  56:	74 0a                	je     62 <sleeper_program+0x62>
	{
	wait();
  58:	e8 6d 02 00 00       	call   2ca <wait>
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
  62:	c7 44 24 04 93 07 00 	movl   $0x793,0x4(%esp)
  69:	00 
  6a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  71:	e8 9a 03 00 00       	call   410 <printf>
	exit();
  76:	e8 47 02 00 00       	call   2c2 <exit>
        }
        i++;
    }	
	int clock_freq =177203;
	int timer  = clock_freq * number;
	printf(0,"The timer is for %d seconds\n",number);
  7b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  82:	00 
  83:	c7 44 24 04 76 07 00 	movl   $0x776,0x4(%esp)
  8a:	00 
  8b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  92:	e8 79 03 00 00       	call   410 <printf>
  97:	eb c9                	jmp    62 <sleeper_program+0x62>
  99:	66 90                	xchg   %ax,%ax
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  a9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  aa:	89 c2                	mov    %eax,%edx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b0:	83 c1 01             	add    $0x1,%ecx
  b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  b7:	83 c2 01             	add    $0x1,%edx
  ba:	84 db                	test   %bl,%bl
  bc:	88 5a ff             	mov    %bl,-0x1(%edx)
  bf:	75 ef                	jne    b0 <strcpy+0x10>
    ;
  return os;
}
  c1:	5b                   	pop    %ebx
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    
  c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 55 08             	mov    0x8(%ebp),%edx
  d6:	53                   	push   %ebx
  d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  da:	0f b6 02             	movzbl (%edx),%eax
  dd:	84 c0                	test   %al,%al
  df:	74 2d                	je     10e <strcmp+0x3e>
  e1:	0f b6 19             	movzbl (%ecx),%ebx
  e4:	38 d8                	cmp    %bl,%al
  e6:	74 0e                	je     f6 <strcmp+0x26>
  e8:	eb 2b                	jmp    115 <strcmp+0x45>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f0:	38 c8                	cmp    %cl,%al
  f2:	75 15                	jne    109 <strcmp+0x39>
    p++, q++;
  f4:	89 d9                	mov    %ebx,%ecx
  f6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  fc:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ff:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 103:	84 c0                	test   %al,%al
 105:	75 e9                	jne    f0 <strcmp+0x20>
 107:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 109:	29 c8                	sub    %ecx,%eax
}
 10b:	5b                   	pop    %ebx
 10c:	5d                   	pop    %ebp
 10d:	c3                   	ret    
 10e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 111:	31 c0                	xor    %eax,%eax
 113:	eb f4                	jmp    109 <strcmp+0x39>
 115:	0f b6 cb             	movzbl %bl,%ecx
 118:	eb ef                	jmp    109 <strcmp+0x39>
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000120 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 126:	80 39 00             	cmpb   $0x0,(%ecx)
 129:	74 12                	je     13d <strlen+0x1d>
 12b:	31 d2                	xor    %edx,%edx
 12d:	8d 76 00             	lea    0x0(%esi),%esi
 130:	83 c2 01             	add    $0x1,%edx
 133:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 137:	89 d0                	mov    %edx,%eax
 139:	75 f5                	jne    130 <strlen+0x10>
    ;
  return n;
}
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 13d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
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

void*
memset(void *dst, int c, uint n)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 55 08             	mov    0x8(%ebp),%edx
 156:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 157:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 15d:	89 d7                	mov    %edx,%edi
 15f:	fc                   	cld    
 160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 162:	89 d0                	mov    %edx,%eax
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <strchr>:

char*
strchr(const char *s, char c)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	53                   	push   %ebx
 177:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 17a:	0f b6 18             	movzbl (%eax),%ebx
 17d:	84 db                	test   %bl,%bl
 17f:	74 1d                	je     19e <strchr+0x2e>
    if(*s == c)
 181:	38 d3                	cmp    %dl,%bl
 183:	89 d1                	mov    %edx,%ecx
 185:	75 0d                	jne    194 <strchr+0x24>
 187:	eb 17                	jmp    1a0 <strchr+0x30>
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	38 ca                	cmp    %cl,%dl
 192:	74 0c                	je     1a0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 194:	83 c0 01             	add    $0x1,%eax
 197:	0f b6 10             	movzbl (%eax),%edx
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 19e:	31 c0                	xor    %eax,%eax
}
 1a0:	5b                   	pop    %ebx
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    
 1a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <gets>:

char*
gets(char *buf, int max)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b5:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 1b7:	53                   	push   %ebx
 1b8:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1bb:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1be:	eb 31                	jmp    1f1 <gets+0x41>
    cc = read(0, &c, 1);
 1c0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1c7:	00 
 1c8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1d3:	e8 02 01 00 00       	call   2da <read>
    if(cc < 1)
 1d8:	85 c0                	test   %eax,%eax
 1da:	7e 1d                	jle    1f9 <gets+0x49>
      break;
    buf[i++] = c;
 1dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e0:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1e2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 1e5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1e7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1eb:	74 0c                	je     1f9 <gets+0x49>
 1ed:	3c 0a                	cmp    $0xa,%al
 1ef:	74 08                	je     1f9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f7:	7c c7                	jl     1c0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1f9:	8b 45 08             	mov    0x8(%ebp),%eax
 1fc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 200:	83 c4 2c             	add    $0x2c,%esp
 203:	5b                   	pop    %ebx
 204:	5e                   	pop    %esi
 205:	5f                   	pop    %edi
 206:	5d                   	pop    %ebp
 207:	c3                   	ret    
 208:	90                   	nop
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000210 <stat>:

int
stat(char *n, struct stat *st)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
 215:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 218:	8b 45 08             	mov    0x8(%ebp),%eax
 21b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 222:	00 
 223:	89 04 24             	mov    %eax,(%esp)
 226:	e8 d7 00 00 00       	call   302 <open>
  if(fd < 0)
 22b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 22d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 22f:	78 27                	js     258 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 231:	8b 45 0c             	mov    0xc(%ebp),%eax
 234:	89 1c 24             	mov    %ebx,(%esp)
 237:	89 44 24 04          	mov    %eax,0x4(%esp)
 23b:	e8 da 00 00 00       	call   31a <fstat>
  close(fd);
 240:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 243:	89 c6                	mov    %eax,%esi
  close(fd);
 245:	e8 a0 00 00 00       	call   2ea <close>
  return r;
 24a:	89 f0                	mov    %esi,%eax
}
 24c:	83 c4 10             	add    $0x10,%esp
 24f:	5b                   	pop    %ebx
 250:	5e                   	pop    %esi
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	90                   	nop
 254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 258:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 25d:	eb ed                	jmp    24c <stat+0x3c>
 25f:	90                   	nop

00000260 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 4d 08             	mov    0x8(%ebp),%ecx
 266:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 267:	0f be 11             	movsbl (%ecx),%edx
 26a:	8d 42 d0             	lea    -0x30(%edx),%eax
 26d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 26f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 274:	77 17                	ja     28d <atoi+0x2d>
 276:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 278:	83 c1 01             	add    $0x1,%ecx
 27b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 27e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 282:	0f be 11             	movsbl (%ecx),%edx
 285:	8d 5a d0             	lea    -0x30(%edx),%ebx
 288:	80 fb 09             	cmp    $0x9,%bl
 28b:	76 eb                	jbe    278 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 28d:	5b                   	pop    %ebx
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret    

00000290 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 290:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 291:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 293:	89 e5                	mov    %esp,%ebp
 295:	56                   	push   %esi
 296:	8b 45 08             	mov    0x8(%ebp),%eax
 299:	53                   	push   %ebx
 29a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 29d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a0:	85 db                	test   %ebx,%ebx
 2a2:	7e 12                	jle    2b6 <memmove+0x26>
 2a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2af:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b2:	39 da                	cmp    %ebx,%edx
 2b4:	75 f2                	jne    2a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5d                   	pop    %ebp
 2b9:	c3                   	ret    

000002ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ba:	b8 01 00 00 00       	mov    $0x1,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <exit>:
SYSCALL(exit)
 2c2:	b8 02 00 00 00       	mov    $0x2,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <wait>:
SYSCALL(wait)
 2ca:	b8 03 00 00 00       	mov    $0x3,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <pipe>:
SYSCALL(pipe)
 2d2:	b8 04 00 00 00       	mov    $0x4,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <read>:
SYSCALL(read)
 2da:	b8 05 00 00 00       	mov    $0x5,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <write>:
SYSCALL(write)
 2e2:	b8 10 00 00 00       	mov    $0x10,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <close>:
SYSCALL(close)
 2ea:	b8 15 00 00 00       	mov    $0x15,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <kill>:
SYSCALL(kill)
 2f2:	b8 06 00 00 00       	mov    $0x6,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <exec>:
SYSCALL(exec)
 2fa:	b8 07 00 00 00       	mov    $0x7,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <open>:
SYSCALL(open)
 302:	b8 0f 00 00 00       	mov    $0xf,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <mknod>:
SYSCALL(mknod)
 30a:	b8 11 00 00 00       	mov    $0x11,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <unlink>:
SYSCALL(unlink)
 312:	b8 12 00 00 00       	mov    $0x12,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <fstat>:
SYSCALL(fstat)
 31a:	b8 08 00 00 00       	mov    $0x8,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <link>:
SYSCALL(link)
 322:	b8 13 00 00 00       	mov    $0x13,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <mkdir>:
SYSCALL(mkdir)
 32a:	b8 14 00 00 00       	mov    $0x14,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <chdir>:
SYSCALL(chdir)
 332:	b8 09 00 00 00       	mov    $0x9,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <dup>:
SYSCALL(dup)
 33a:	b8 0a 00 00 00       	mov    $0xa,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <getpid>:
SYSCALL(getpid)
 342:	b8 0b 00 00 00       	mov    $0xb,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <random>:
SYSCALL(random)  // This is the system call that we are adding for XOR_SHIFT
 34a:	b8 16 00 00 00       	mov    $0x16,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <sbrk>:
SYSCALL(sbrk)
 352:	b8 0c 00 00 00       	mov    $0xc,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <sleep>:
SYSCALL(sleep)
 35a:	b8 0d 00 00 00       	mov    $0xd,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <uptime>:
SYSCALL(uptime)
 362:	b8 0e 00 00 00       	mov    $0xe,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    
 36a:	66 90                	xchg   %ax,%ax
 36c:	66 90                	xchg   %ax,%ax
 36e:	66 90                	xchg   %ax,%ax

00000370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	89 c6                	mov    %eax,%esi
 377:	53                   	push   %ebx
 378:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 37b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 37e:	85 db                	test   %ebx,%ebx
 380:	74 09                	je     38b <printint+0x1b>
 382:	89 d0                	mov    %edx,%eax
 384:	c1 e8 1f             	shr    $0x1f,%eax
 387:	84 c0                	test   %al,%al
 389:	75 75                	jne    400 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 38b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 38d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 394:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 397:	31 ff                	xor    %edi,%edi
 399:	89 ce                	mov    %ecx,%esi
 39b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 39e:	eb 02                	jmp    3a2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 3a0:	89 cf                	mov    %ecx,%edi
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	f7 f6                	div    %esi
 3a6:	8d 4f 01             	lea    0x1(%edi),%ecx
 3a9:	0f b6 92 b3 07 00 00 	movzbl 0x7b3(%edx),%edx
  }while((x /= base) != 0);
 3b0:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3b2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3b5:	75 e9                	jne    3a0 <printint+0x30>
  if(neg)
 3b7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3ba:	89 c8                	mov    %ecx,%eax
 3bc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 3bf:	85 d2                	test   %edx,%edx
 3c1:	74 08                	je     3cb <printint+0x5b>
    buf[i++] = '-';
 3c3:	8d 4f 02             	lea    0x2(%edi),%ecx
 3c6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 3cb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3ce:	66 90                	xchg   %ax,%ax
 3d0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 3d5:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3d8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3df:	00 
 3e0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3e4:	89 34 24             	mov    %esi,(%esp)
 3e7:	88 45 d7             	mov    %al,-0x29(%ebp)
 3ea:	e8 f3 fe ff ff       	call   2e2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3ef:	83 ff ff             	cmp    $0xffffffff,%edi
 3f2:	75 dc                	jne    3d0 <printint+0x60>
    putc(fd, buf[i]);
}
 3f4:	83 c4 4c             	add    $0x4c,%esp
 3f7:	5b                   	pop    %ebx
 3f8:	5e                   	pop    %esi
 3f9:	5f                   	pop    %edi
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 400:	89 d0                	mov    %edx,%eax
 402:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 404:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 40b:	eb 87                	jmp    394 <printint+0x24>
 40d:	8d 76 00             	lea    0x0(%esi),%esi

00000410 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 414:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 416:	56                   	push   %esi
 417:	53                   	push   %ebx
 418:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 41b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 41e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 421:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 424:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 427:	0f b6 13             	movzbl (%ebx),%edx
 42a:	83 c3 01             	add    $0x1,%ebx
 42d:	84 d2                	test   %dl,%dl
 42f:	75 39                	jne    46a <printf+0x5a>
 431:	e9 c2 00 00 00       	jmp    4f8 <printf+0xe8>
 436:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 438:	83 fa 25             	cmp    $0x25,%edx
 43b:	0f 84 bf 00 00 00    	je     500 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 441:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 444:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 44b:	00 
 44c:	89 44 24 04          	mov    %eax,0x4(%esp)
 450:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 453:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 456:	e8 87 fe ff ff       	call   2e2 <write>
 45b:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 45e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 462:	84 d2                	test   %dl,%dl
 464:	0f 84 8e 00 00 00    	je     4f8 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 46a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 46c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 46f:	74 c7                	je     438 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 471:	83 ff 25             	cmp    $0x25,%edi
 474:	75 e5                	jne    45b <printf+0x4b>
      if(c == 'd'){
 476:	83 fa 64             	cmp    $0x64,%edx
 479:	0f 84 31 01 00 00    	je     5b0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 47f:	25 f7 00 00 00       	and    $0xf7,%eax
 484:	83 f8 70             	cmp    $0x70,%eax
 487:	0f 84 83 00 00 00    	je     510 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 48d:	83 fa 73             	cmp    $0x73,%edx
 490:	0f 84 a2 00 00 00    	je     538 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 496:	83 fa 63             	cmp    $0x63,%edx
 499:	0f 84 35 01 00 00    	je     5d4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 49f:	83 fa 25             	cmp    $0x25,%edx
 4a2:	0f 84 e0 00 00 00    	je     588 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4a8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4ab:	83 c3 01             	add    $0x1,%ebx
 4ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4b5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4b6:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4bc:	89 34 24             	mov    %esi,(%esp)
 4bf:	89 55 d0             	mov    %edx,-0x30(%ebp)
 4c2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 4c6:	e8 17 fe ff ff       	call   2e2 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4cb:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4ce:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4d1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4d8:	00 
 4d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4dd:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4e3:	e8 fa fd ff ff       	call   2e2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4ec:	84 d2                	test   %dl,%dl
 4ee:	0f 85 76 ff ff ff    	jne    46a <printf+0x5a>
 4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4f8:	83 c4 3c             	add    $0x3c,%esp
 4fb:	5b                   	pop    %ebx
 4fc:	5e                   	pop    %esi
 4fd:	5f                   	pop    %edi
 4fe:	5d                   	pop    %ebp
 4ff:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 500:	bf 25 00 00 00       	mov    $0x25,%edi
 505:	e9 51 ff ff ff       	jmp    45b <printf+0x4b>
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 510:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 513:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 518:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 51a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 521:	8b 10                	mov    (%eax),%edx
 523:	89 f0                	mov    %esi,%eax
 525:	e8 46 fe ff ff       	call   370 <printint>
        ap++;
 52a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 52e:	e9 28 ff ff ff       	jmp    45b <printf+0x4b>
 533:	90                   	nop
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 538:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 53b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 53f:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 541:	b8 ac 07 00 00       	mov    $0x7ac,%eax
 546:	85 ff                	test   %edi,%edi
 548:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 54b:	0f b6 07             	movzbl (%edi),%eax
 54e:	84 c0                	test   %al,%al
 550:	74 2a                	je     57c <printf+0x16c>
 552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 558:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 55b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 55e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 561:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 568:	00 
 569:	89 44 24 04          	mov    %eax,0x4(%esp)
 56d:	89 34 24             	mov    %esi,(%esp)
 570:	e8 6d fd ff ff       	call   2e2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 575:	0f b6 07             	movzbl (%edi),%eax
 578:	84 c0                	test   %al,%al
 57a:	75 dc                	jne    558 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 57c:	31 ff                	xor    %edi,%edi
 57e:	e9 d8 fe ff ff       	jmp    45b <printf+0x4b>
 583:	90                   	nop
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 588:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 58b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 58d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 594:	00 
 595:	89 44 24 04          	mov    %eax,0x4(%esp)
 599:	89 34 24             	mov    %esi,(%esp)
 59c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 5a0:	e8 3d fd ff ff       	call   2e2 <write>
 5a5:	e9 b1 fe ff ff       	jmp    45b <printf+0x4b>
 5aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5b8:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5c2:	8b 10                	mov    (%eax),%edx
 5c4:	89 f0                	mov    %esi,%eax
 5c6:	e8 a5 fd ff ff       	call   370 <printint>
        ap++;
 5cb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5cf:	e9 87 fe ff ff       	jmp    45b <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5d7:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5d9:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5db:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5e2:	00 
 5e3:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5e6:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5e9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f0:	e8 ed fc ff ff       	call   2e2 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 5f5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5f9:	e9 5d fe ff ff       	jmp    45b <printf+0x4b>
 5fe:	66 90                	xchg   %ax,%ax

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	a1 28 0a 00 00       	mov    0xa28,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 60e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 610:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 613:	39 d0                	cmp    %edx,%eax
 615:	72 11                	jb     628 <free+0x28>
 617:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 618:	39 c8                	cmp    %ecx,%eax
 61a:	72 04                	jb     620 <free+0x20>
 61c:	39 ca                	cmp    %ecx,%edx
 61e:	72 10                	jb     630 <free+0x30>
 620:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 622:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 624:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 626:	73 f0                	jae    618 <free+0x18>
 628:	39 ca                	cmp    %ecx,%edx
 62a:	72 04                	jb     630 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62c:	39 c8                	cmp    %ecx,%eax
 62e:	72 f0                	jb     620 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 630:	8b 73 fc             	mov    -0x4(%ebx),%esi
 633:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 636:	39 cf                	cmp    %ecx,%edi
 638:	74 1e                	je     658 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 63a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 63d:	8b 48 04             	mov    0x4(%eax),%ecx
 640:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 643:	39 f2                	cmp    %esi,%edx
 645:	74 28                	je     66f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 647:	89 10                	mov    %edx,(%eax)
  freep = p;
 649:	a3 28 0a 00 00       	mov    %eax,0xa28
}
 64e:	5b                   	pop    %ebx
 64f:	5e                   	pop    %esi
 650:	5f                   	pop    %edi
 651:	5d                   	pop    %ebp
 652:	c3                   	ret    
 653:	90                   	nop
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 658:	03 71 04             	add    0x4(%ecx),%esi
 65b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 65e:	8b 08                	mov    (%eax),%ecx
 660:	8b 09                	mov    (%ecx),%ecx
 662:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 665:	8b 48 04             	mov    0x4(%eax),%ecx
 668:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 66b:	39 f2                	cmp    %esi,%edx
 66d:	75 d8                	jne    647 <free+0x47>
    p->s.size += bp->s.size;
 66f:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 672:	a3 28 0a 00 00       	mov    %eax,0xa28
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 677:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 67a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 67d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 67f:	5b                   	pop    %ebx
 680:	5e                   	pop    %esi
 681:	5f                   	pop    %edi
 682:	5d                   	pop    %ebp
 683:	c3                   	ret    
 684:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 68a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000690 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 699:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 69c:	8b 1d 28 0a 00 00    	mov    0xa28,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a2:	8d 48 07             	lea    0x7(%eax),%ecx
 6a5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 6a8:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6aa:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 6ad:	0f 84 9b 00 00 00    	je     74e <malloc+0xbe>
 6b3:	8b 13                	mov    (%ebx),%edx
 6b5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6b8:	39 fe                	cmp    %edi,%esi
 6ba:	76 64                	jbe    720 <malloc+0x90>
 6bc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6c3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 6c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6cb:	eb 0e                	jmp    6db <malloc+0x4b>
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6d2:	8b 78 04             	mov    0x4(%eax),%edi
 6d5:	39 fe                	cmp    %edi,%esi
 6d7:	76 4f                	jbe    728 <malloc+0x98>
 6d9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6db:	3b 15 28 0a 00 00    	cmp    0xa28,%edx
 6e1:	75 ed                	jne    6d0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 6ec:	bf 00 10 00 00       	mov    $0x1000,%edi
 6f1:	0f 43 fe             	cmovae %esi,%edi
 6f4:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6f7:	89 04 24             	mov    %eax,(%esp)
 6fa:	e8 53 fc ff ff       	call   352 <sbrk>
  if(p == (char*)-1)
 6ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 702:	74 18                	je     71c <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 704:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 707:	83 c0 08             	add    $0x8,%eax
 70a:	89 04 24             	mov    %eax,(%esp)
 70d:	e8 ee fe ff ff       	call   600 <free>
  return freep;
 712:	8b 15 28 0a 00 00    	mov    0xa28,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 718:	85 d2                	test   %edx,%edx
 71a:	75 b4                	jne    6d0 <malloc+0x40>
        return 0;
 71c:	31 c0                	xor    %eax,%eax
 71e:	eb 20                	jmp    740 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 720:	89 d0                	mov    %edx,%eax
 722:	89 da                	mov    %ebx,%edx
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 728:	39 fe                	cmp    %edi,%esi
 72a:	74 1c                	je     748 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 72c:	29 f7                	sub    %esi,%edi
 72e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 731:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 734:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 737:	89 15 28 0a 00 00    	mov    %edx,0xa28
      return (void*)(p + 1);
 73d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 740:	83 c4 1c             	add    $0x1c,%esp
 743:	5b                   	pop    %ebx
 744:	5e                   	pop    %esi
 745:	5f                   	pop    %edi
 746:	5d                   	pop    %ebp
 747:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 748:	8b 08                	mov    (%eax),%ecx
 74a:	89 0a                	mov    %ecx,(%edx)
 74c:	eb e9                	jmp    737 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 74e:	c7 05 28 0a 00 00 2c 	movl   $0xa2c,0xa28
 755:	0a 00 00 
    base.s.size = 0;
 758:	ba 2c 0a 00 00       	mov    $0xa2c,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 75d:	c7 05 2c 0a 00 00 2c 	movl   $0xa2c,0xa2c
 764:	0a 00 00 
    base.s.size = 0;
 767:	c7 05 30 0a 00 00 00 	movl   $0x0,0xa30
 76e:	00 00 00 
 771:	e9 46 ff ff ff       	jmp    6bc <malloc+0x2c>
