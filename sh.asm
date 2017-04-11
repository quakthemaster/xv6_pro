
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 e4 f0             	and    $0xfffffff0,%esp
       6:	83 ec 10             	sub    $0x10,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
       9:	eb 0e                	jmp    19 <main+0x19>
       b:	90                   	nop
       c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      10:	83 f8 02             	cmp    $0x2,%eax
      13:	0f 8f cd 00 00 00    	jg     e6 <main+0xe6>
{
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      19:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
      20:	00 
      21:	c7 04 24 2b 13 00 00 	movl   $0x132b,(%esp)
      28:	e8 15 0e 00 00       	call   e42 <open>
      2d:	85 c0                	test   %eax,%eax
      2f:	79 df                	jns    10 <main+0x10>
      31:	eb 23                	jmp    56 <main+0x56>
      33:	90                   	nop
      34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      38:	80 3d 42 19 00 00 20 	cmpb   $0x20,0x1942
      3f:	90                   	nop
      40:	74 60                	je     a2 <main+0xa2>
      42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      48:	e8 43 01 00 00       	call   190 <fork1>
      4d:	85 c0                	test   %eax,%eax
      4f:	74 38                	je     89 <main+0x89>
      runcmd(parsecmd(buf));
    wait();
      51:	e8 b4 0d 00 00       	call   e0a <wait>
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      56:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
      5d:	00 
      5e:	c7 04 24 40 19 00 00 	movl   $0x1940,(%esp)
      65:	e8 96 00 00 00       	call   100 <getcmd>
      6a:	85 c0                	test   %eax,%eax
      6c:	78 2f                	js     9d <main+0x9d>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      6e:	80 3d 40 19 00 00 63 	cmpb   $0x63,0x1940
      75:	75 d1                	jne    48 <main+0x48>
      77:	80 3d 41 19 00 00 64 	cmpb   $0x64,0x1941
      7e:	74 b8                	je     38 <main+0x38>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      80:	e8 0b 01 00 00       	call   190 <fork1>
      85:	85 c0                	test   %eax,%eax
      87:	75 c8                	jne    51 <main+0x51>
      runcmd(parsecmd(buf));
      89:	c7 04 24 40 19 00 00 	movl   $0x1940,(%esp)
      90:	e8 ab 0a 00 00       	call   b40 <parsecmd>
      95:	89 04 24             	mov    %eax,(%esp)
      98:	e8 13 01 00 00       	call   1b0 <runcmd>
    wait();
  }
  exit();
      9d:	e8 60 0d 00 00       	call   e02 <exit>

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      a2:	c7 04 24 40 19 00 00 	movl   $0x1940,(%esp)
      a9:	e8 92 0b 00 00       	call   c40 <strlen>
      if(chdir(buf+3) < 0)
      ae:	c7 04 24 43 19 00 00 	movl   $0x1943,(%esp)

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      b5:	c6 80 3f 19 00 00 00 	movb   $0x0,0x193f(%eax)
      if(chdir(buf+3) < 0)
      bc:	e8 b1 0d 00 00       	call   e72 <chdir>
      c1:	85 c0                	test   %eax,%eax
      c3:	79 91                	jns    56 <main+0x56>
        printf(2, "cannot cd %s\n", buf+3);
      c5:	c7 44 24 08 43 19 00 	movl   $0x1943,0x8(%esp)
      cc:	00 
      cd:	c7 44 24 04 33 13 00 	movl   $0x1333,0x4(%esp)
      d4:	00 
      d5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      dc:	e8 6f 0e 00 00       	call   f50 <printf>
      e1:	e9 70 ff ff ff       	jmp    56 <main+0x56>
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      e6:	89 04 24             	mov    %eax,(%esp)
      e9:	e8 3c 0d 00 00       	call   e2a <close>
      ee:	66 90                	xchg   %ax,%ax
      break;
      f0:	e9 61 ff ff ff       	jmp    56 <main+0x56>
      f5:	66 90                	xchg   %ax,%ax
      f7:	66 90                	xchg   %ax,%ax
      f9:	66 90                	xchg   %ax,%ax
      fb:	66 90                	xchg   %ax,%ax
      fd:	66 90                	xchg   %ax,%ax
      ff:	90                   	nop

00000100 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	56                   	push   %esi
     104:	53                   	push   %ebx
     105:	83 ec 10             	sub    $0x10,%esp
     108:	8b 5d 08             	mov    0x8(%ebp),%ebx
     10b:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$Sanidhya_Shubhankur_AV224$ ");
     10e:	c7 44 24 04 70 12 00 	movl   $0x1270,0x4(%esp)
     115:	00 
     116:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     11d:	e8 2e 0e 00 00       	call   f50 <printf>
  memset(buf, 0, nbuf);
     122:	89 74 24 08          	mov    %esi,0x8(%esp)
     126:	89 1c 24             	mov    %ebx,(%esp)
     129:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     130:	00 
     131:	e8 3a 0b 00 00       	call   c70 <memset>
  gets(buf, nbuf);
     136:	89 74 24 04          	mov    %esi,0x4(%esp)
     13a:	89 1c 24             	mov    %ebx,(%esp)
     13d:	e8 8e 0b 00 00       	call   cd0 <gets>
  if(buf[0] == 0) // EOF
     142:	31 c0                	xor    %eax,%eax
     144:	80 3b 00             	cmpb   $0x0,(%ebx)
     147:	0f 94 c0             	sete   %al
    return -1;
  return 0;
}
     14a:	83 c4 10             	add    $0x10,%esp
     14d:	5b                   	pop    %ebx
getcmd(char *buf, int nbuf)
{
  printf(2, "$Sanidhya_Shubhankur_AV224$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
     14e:	f7 d8                	neg    %eax
    return -1;
  return 0;
}
     150:	5e                   	pop    %esi
     151:	5d                   	pop    %ebp
     152:	c3                   	ret    
     153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <panic>:
  exit();
}

void
panic(char *s)
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     166:	8b 45 08             	mov    0x8(%ebp),%eax
     169:	c7 44 24 04 27 13 00 	movl   $0x1327,0x4(%esp)
     170:	00 
     171:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     178:	89 44 24 08          	mov    %eax,0x8(%esp)
     17c:	e8 cf 0d 00 00       	call   f50 <printf>
  exit();
     181:	e8 7c 0c 00 00       	call   e02 <exit>
     186:	8d 76 00             	lea    0x0(%esi),%esi
     189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <fork1>:
}

int
fork1(void)
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 18             	sub    $0x18,%esp
  int pid;

  pid = fork();
     196:	e8 5f 0c 00 00       	call   dfa <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
    panic("fork");
  return pid;
}
     1a0:	c9                   	leave  
     1a1:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     1a2:	c7 04 24 8d 12 00 00 	movl   $0x128d,(%esp)
     1a9:	e8 b2 ff ff ff       	call   160 <panic>
     1ae:	66 90                	xchg   %ax,%ax

000001b0 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 24             	sub    $0x24,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 5f                	je     21d <runcmd+0x6d>
    exit();

  switch(cmd->type){
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	0f 87 e7 00 00 00    	ja     2ae <runcmd+0xfe>
     1c7:	8b 03                	mov    (%ebx),%eax
     1c9:	ff 24 85 44 13 00 00 	jmp    *0x1344(,%eax,4)
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     1d0:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1d3:	89 04 24             	mov    %eax,(%esp)
     1d6:	e8 37 0c 00 00       	call   e12 <pipe>
     1db:	85 c0                	test   %eax,%eax
     1dd:	0f 88 d7 00 00 00    	js     2ba <runcmd+0x10a>
      panic("pipe");
    if(fork1() == 0){
     1e3:	e8 a8 ff ff ff       	call   190 <fork1>
     1e8:	85 c0                	test   %eax,%eax
     1ea:	0f 84 2e 01 00 00    	je     31e <runcmd+0x16e>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     1f0:	e8 9b ff ff ff       	call   190 <fork1>
     1f5:	85 c0                	test   %eax,%eax
     1f7:	0f 84 e9 00 00 00    	je     2e6 <runcmd+0x136>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     1fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     200:	89 04 24             	mov    %eax,(%esp)
     203:	e8 22 0c 00 00       	call   e2a <close>
    close(p[1]);
     208:	8b 45 f4             	mov    -0xc(%ebp),%eax
     20b:	89 04 24             	mov    %eax,(%esp)
     20e:	e8 17 0c 00 00       	call   e2a <close>
    wait();
     213:	e8 f2 0b 00 00       	call   e0a <wait>
    wait();
     218:	e8 ed 0b 00 00       	call   e0a <wait>
     21d:	8d 76 00             	lea    0x0(%esi),%esi
  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
      exit();
     220:	e8 dd 0b 00 00       	call   e02 <exit>
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     225:	e8 66 ff ff ff       	call   190 <fork1>
     22a:	85 c0                	test   %eax,%eax
     22c:	75 ef                	jne    21d <runcmd+0x6d>
     22e:	66 90                	xchg   %ax,%ax
     230:	eb 71                	jmp    2a3 <runcmd+0xf3>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     232:	8b 43 04             	mov    0x4(%ebx),%eax
     235:	85 c0                	test   %eax,%eax
     237:	74 e4                	je     21d <runcmd+0x6d>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     239:	8d 53 04             	lea    0x4(%ebx),%edx
     23c:	89 54 24 04          	mov    %edx,0x4(%esp)
     240:	89 04 24             	mov    %eax,(%esp)
     243:	e8 f2 0b 00 00       	call   e3a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     248:	8b 43 04             	mov    0x4(%ebx),%eax
     24b:	c7 44 24 04 99 12 00 	movl   $0x1299,0x4(%esp)
     252:	00 
     253:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     25a:	89 44 24 08          	mov    %eax,0x8(%esp)
     25e:	e8 ed 0c 00 00       	call   f50 <printf>
    break;
     263:	eb b8                	jmp    21d <runcmd+0x6d>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     265:	e8 26 ff ff ff       	call   190 <fork1>
     26a:	85 c0                	test   %eax,%eax
     26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     270:	74 31                	je     2a3 <runcmd+0xf3>
      runcmd(lcmd->left);
    wait();
     272:	e8 93 0b 00 00       	call   e0a <wait>
    runcmd(lcmd->right);
     277:	8b 43 08             	mov    0x8(%ebx),%eax
     27a:	89 04 24             	mov    %eax,(%esp)
     27d:	e8 2e ff ff ff       	call   1b0 <runcmd>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     282:	8b 43 14             	mov    0x14(%ebx),%eax
     285:	89 04 24             	mov    %eax,(%esp)
     288:	e8 9d 0b 00 00       	call   e2a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     28d:	8b 43 10             	mov    0x10(%ebx),%eax
     290:	89 44 24 04          	mov    %eax,0x4(%esp)
     294:	8b 43 08             	mov    0x8(%ebx),%eax
     297:	89 04 24             	mov    %eax,(%esp)
     29a:	e8 a3 0b 00 00       	call   e42 <open>
     29f:	85 c0                	test   %eax,%eax
     2a1:	78 23                	js     2c6 <runcmd+0x116>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     2a3:	8b 43 04             	mov    0x4(%ebx),%eax
     2a6:	89 04 24             	mov    %eax,(%esp)
     2a9:	e8 02 ff ff ff       	call   1b0 <runcmd>
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");
     2ae:	c7 04 24 92 12 00 00 	movl   $0x1292,(%esp)
     2b5:	e8 a6 fe ff ff       	call   160 <panic>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     2ba:	c7 04 24 b9 12 00 00 	movl   $0x12b9,(%esp)
     2c1:	e8 9a fe ff ff       	call   160 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     2c6:	8b 43 08             	mov    0x8(%ebx),%eax
     2c9:	c7 44 24 04 a9 12 00 	movl   $0x12a9,0x4(%esp)
     2d0:	00 
     2d1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2d8:	89 44 24 08          	mov    %eax,0x8(%esp)
     2dc:	e8 6f 0c 00 00       	call   f50 <printf>
     2e1:	e9 37 ff ff ff       	jmp    21d <runcmd+0x6d>
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
     2e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     2ed:	e8 38 0b 00 00       	call   e2a <close>
      dup(p[0]);
     2f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     2f5:	89 04 24             	mov    %eax,(%esp)
     2f8:	e8 7d 0b 00 00       	call   e7a <dup>
      close(p[0]);
     2fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     300:	89 04 24             	mov    %eax,(%esp)
     303:	e8 22 0b 00 00       	call   e2a <close>
      close(p[1]);
     308:	8b 45 f4             	mov    -0xc(%ebp),%eax
     30b:	89 04 24             	mov    %eax,(%esp)
     30e:	e8 17 0b 00 00       	call   e2a <close>
      runcmd(pcmd->right);
     313:	8b 43 08             	mov    0x8(%ebx),%eax
     316:	89 04 24             	mov    %eax,(%esp)
     319:	e8 92 fe ff ff       	call   1b0 <runcmd>
  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
     31e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     325:	e8 00 0b 00 00       	call   e2a <close>
      dup(p[1]);
     32a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     32d:	89 04 24             	mov    %eax,(%esp)
     330:	e8 45 0b 00 00       	call   e7a <dup>
      close(p[0]);
     335:	8b 45 f0             	mov    -0x10(%ebp),%eax
     338:	89 04 24             	mov    %eax,(%esp)
     33b:	e8 ea 0a 00 00       	call   e2a <close>
      close(p[1]);
     340:	8b 45 f4             	mov    -0xc(%ebp),%eax
     343:	89 04 24             	mov    %eax,(%esp)
     346:	e8 df 0a 00 00       	call   e2a <close>
      runcmd(pcmd->left);
     34b:	8b 43 04             	mov    0x4(%ebx),%eax
     34e:	89 04 24             	mov    %eax,(%esp)
     351:	e8 5a fe ff ff       	call   1b0 <runcmd>
     356:	8d 76 00             	lea    0x0(%esi),%esi
     359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	53                   	push   %ebx
     364:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     367:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     36e:	e8 0d 0e 00 00       	call   1180 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     373:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     37a:	00 
     37b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     382:	00 
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     383:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     385:	89 04 24             	mov    %eax,(%esp)
     388:	e8 e3 08 00 00       	call   c70 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     38d:	89 d8                	mov    %ebx,%eax
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
     38f:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     395:	83 c4 14             	add    $0x14,%esp
     398:	5b                   	pop    %ebx
     399:	5d                   	pop    %ebp
     39a:	c3                   	ret    
     39b:	90                   	nop
     39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a7:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     3ae:	e8 cd 0d 00 00       	call   1180 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3b3:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     3ba:	00 
     3bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3c2:	00 
     3c3:	89 04 24             	mov    %eax,(%esp)
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3c8:	e8 a3 08 00 00       	call   c70 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     3cd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     3d0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     3d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3dc:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     3df:	8b 45 10             	mov    0x10(%ebp),%eax
     3e2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3e5:	8b 45 14             	mov    0x14(%ebp),%eax
     3e8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3eb:	8b 45 18             	mov    0x18(%ebp),%eax
     3ee:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3f1:	83 c4 14             	add    $0x14,%esp
     3f4:	89 d8                	mov    %ebx,%eax
     3f6:	5b                   	pop    %ebx
     3f7:	5d                   	pop    %ebp
     3f8:	c3                   	ret    
     3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     407:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     40e:	e8 6d 0d 00 00       	call   1180 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     413:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     41a:	00 
     41b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     422:	00 
     423:	89 04 24             	mov    %eax,(%esp)
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     426:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     428:	e8 43 08 00 00       	call   c70 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     42d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     430:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     436:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     439:	8b 45 0c             	mov    0xc(%ebp),%eax
     43c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     43f:	83 c4 14             	add    $0x14,%esp
     442:	89 d8                	mov    %ebx,%eax
     444:	5b                   	pop    %ebx
     445:	5d                   	pop    %ebp
     446:	c3                   	ret    
     447:	89 f6                	mov    %esi,%esi
     449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000450 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	53                   	push   %ebx
     454:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     457:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     45e:	e8 1d 0d 00 00       	call   1180 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     463:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     46a:	00 
     46b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     472:	00 
     473:	89 04 24             	mov    %eax,(%esp)
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     476:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     478:	e8 f3 07 00 00       	call   c70 <memset>
  cmd->type = LIST;
  cmd->left = left;
     47d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     480:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     486:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     489:	8b 45 0c             	mov    0xc(%ebp),%eax
     48c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     48f:	83 c4 14             	add    $0x14,%esp
     492:	89 d8                	mov    %ebx,%eax
     494:	5b                   	pop    %ebx
     495:	5d                   	pop    %ebp
     496:	c3                   	ret    
     497:	89 f6                	mov    %esi,%esi
     499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4a0:	55                   	push   %ebp
     4a1:	89 e5                	mov    %esp,%ebp
     4a3:	53                   	push   %ebx
     4a4:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4a7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     4ae:	e8 cd 0c 00 00       	call   1180 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     4b3:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     4ba:	00 
     4bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4c2:	00 
     4c3:	89 04 24             	mov    %eax,(%esp)
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4c6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4c8:	e8 a3 07 00 00       	call   c70 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     4cd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     4d0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     4d6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     4d9:	83 c4 14             	add    $0x14,%esp
     4dc:	89 d8                	mov    %ebx,%eax
     4de:	5b                   	pop    %ebx
     4df:	5d                   	pop    %ebp
     4e0:	c3                   	ret    
     4e1:	eb 0d                	jmp    4f0 <gettoken>
     4e3:	90                   	nop
     4e4:	90                   	nop
     4e5:	90                   	nop
     4e6:	90                   	nop
     4e7:	90                   	nop
     4e8:	90                   	nop
     4e9:	90                   	nop
     4ea:	90                   	nop
     4eb:	90                   	nop
     4ec:	90                   	nop
     4ed:	90                   	nop
     4ee:	90                   	nop
     4ef:	90                   	nop

000004f0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	57                   	push   %edi
     4f4:	56                   	push   %esi
     4f5:	53                   	push   %ebx
     4f6:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     4f9:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     4fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     4ff:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
     502:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     504:	39 df                	cmp    %ebx,%edi
     506:	72 0f                	jb     517 <gettoken+0x27>
     508:	eb 24                	jmp    52e <gettoken+0x3e>
     50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     510:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     513:	39 df                	cmp    %ebx,%edi
     515:	74 17                	je     52e <gettoken+0x3e>
     517:	0f be 07             	movsbl (%edi),%eax
     51a:	c7 04 24 30 19 00 00 	movl   $0x1930,(%esp)
     521:	89 44 24 04          	mov    %eax,0x4(%esp)
     525:	e8 66 07 00 00       	call   c90 <strchr>
     52a:	85 c0                	test   %eax,%eax
     52c:	75 e2                	jne    510 <gettoken+0x20>
    s++;
  if(q)
     52e:	85 f6                	test   %esi,%esi
     530:	74 02                	je     534 <gettoken+0x44>
    *q = s;
     532:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     534:	0f b6 0f             	movzbl (%edi),%ecx
     537:	0f be f1             	movsbl %cl,%esi
  switch(*s){
     53a:	80 f9 29             	cmp    $0x29,%cl
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
     53d:	89 f0                	mov    %esi,%eax
  switch(*s){
     53f:	7f 4f                	jg     590 <gettoken+0xa0>
     541:	80 f9 28             	cmp    $0x28,%cl
     544:	7d 55                	jge    59b <gettoken+0xab>
     546:	84 c9                	test   %cl,%cl
     548:	0f 85 ca 00 00 00    	jne    618 <gettoken+0x128>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     54e:	8b 45 14             	mov    0x14(%ebp),%eax
     551:	85 c0                	test   %eax,%eax
     553:	74 05                	je     55a <gettoken+0x6a>
    *eq = s;
     555:	8b 45 14             	mov    0x14(%ebp),%eax
     558:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     55a:	39 df                	cmp    %ebx,%edi
     55c:	72 09                	jb     567 <gettoken+0x77>
     55e:	eb 1e                	jmp    57e <gettoken+0x8e>
    s++;
     560:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     563:	39 df                	cmp    %ebx,%edi
     565:	74 17                	je     57e <gettoken+0x8e>
     567:	0f be 07             	movsbl (%edi),%eax
     56a:	c7 04 24 30 19 00 00 	movl   $0x1930,(%esp)
     571:	89 44 24 04          	mov    %eax,0x4(%esp)
     575:	e8 16 07 00 00       	call   c90 <strchr>
     57a:	85 c0                	test   %eax,%eax
     57c:	75 e2                	jne    560 <gettoken+0x70>
    s++;
  *ps = s;
     57e:	8b 45 08             	mov    0x8(%ebp),%eax
     581:	89 38                	mov    %edi,(%eax)
  return ret;
}
     583:	83 c4 1c             	add    $0x1c,%esp
     586:	89 f0                	mov    %esi,%eax
     588:	5b                   	pop    %ebx
     589:	5e                   	pop    %esi
     58a:	5f                   	pop    %edi
     58b:	5d                   	pop    %ebp
     58c:	c3                   	ret    
     58d:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     590:	80 f9 3e             	cmp    $0x3e,%cl
     593:	75 0b                	jne    5a0 <gettoken+0xb0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     595:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     599:	74 6d                	je     608 <gettoken+0x118>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     59b:	83 c7 01             	add    $0x1,%edi
     59e:	eb ae                	jmp    54e <gettoken+0x5e>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     5a0:	7f 56                	jg     5f8 <gettoken+0x108>
     5a2:	83 e9 3b             	sub    $0x3b,%ecx
     5a5:	80 f9 01             	cmp    $0x1,%cl
     5a8:	76 f1                	jbe    59b <gettoken+0xab>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5aa:	39 fb                	cmp    %edi,%ebx
     5ac:	77 2b                	ja     5d9 <gettoken+0xe9>
     5ae:	66 90                	xchg   %ax,%ax
     5b0:	eb 3b                	jmp    5ed <gettoken+0xfd>
     5b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     5b8:	0f be 07             	movsbl (%edi),%eax
     5bb:	c7 04 24 28 19 00 00 	movl   $0x1928,(%esp)
     5c2:	89 44 24 04          	mov    %eax,0x4(%esp)
     5c6:	e8 c5 06 00 00       	call   c90 <strchr>
     5cb:	85 c0                	test   %eax,%eax
     5cd:	75 1e                	jne    5ed <gettoken+0xfd>
      s++;
     5cf:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5d2:	39 df                	cmp    %ebx,%edi
     5d4:	74 17                	je     5ed <gettoken+0xfd>
     5d6:	0f be 07             	movsbl (%edi),%eax
     5d9:	89 44 24 04          	mov    %eax,0x4(%esp)
     5dd:	c7 04 24 30 19 00 00 	movl   $0x1930,(%esp)
     5e4:	e8 a7 06 00 00       	call   c90 <strchr>
     5e9:	85 c0                	test   %eax,%eax
     5eb:	74 cb                	je     5b8 <gettoken+0xc8>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     5ed:	be 61 00 00 00       	mov    $0x61,%esi
     5f2:	e9 57 ff ff ff       	jmp    54e <gettoken+0x5e>
     5f7:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     5f8:	80 f9 7c             	cmp    $0x7c,%cl
     5fb:	74 9e                	je     59b <gettoken+0xab>
     5fd:	8d 76 00             	lea    0x0(%esi),%esi
     600:	eb a8                	jmp    5aa <gettoken+0xba>
     602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     608:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     60b:	be 2b 00 00 00       	mov    $0x2b,%esi
     610:	e9 39 ff ff ff       	jmp    54e <gettoken+0x5e>
     615:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     618:	80 f9 26             	cmp    $0x26,%cl
     61b:	75 8d                	jne    5aa <gettoken+0xba>
     61d:	e9 79 ff ff ff       	jmp    59b <gettoken+0xab>
     622:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000630 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	57                   	push   %edi
     634:	56                   	push   %esi
     635:	53                   	push   %ebx
     636:	83 ec 1c             	sub    $0x1c,%esp
     639:	8b 7d 08             	mov    0x8(%ebp),%edi
     63c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     63f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     641:	39 f3                	cmp    %esi,%ebx
     643:	72 0a                	jb     64f <peek+0x1f>
     645:	eb 1f                	jmp    666 <peek+0x36>
     647:	90                   	nop
    s++;
     648:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     64b:	39 f3                	cmp    %esi,%ebx
     64d:	74 17                	je     666 <peek+0x36>
     64f:	0f be 03             	movsbl (%ebx),%eax
     652:	c7 04 24 30 19 00 00 	movl   $0x1930,(%esp)
     659:	89 44 24 04          	mov    %eax,0x4(%esp)
     65d:	e8 2e 06 00 00       	call   c90 <strchr>
     662:	85 c0                	test   %eax,%eax
     664:	75 e2                	jne    648 <peek+0x18>
    s++;
  *ps = s;
     666:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     668:	0f be 13             	movsbl (%ebx),%edx
     66b:	31 c0                	xor    %eax,%eax
     66d:	84 d2                	test   %dl,%dl
     66f:	74 17                	je     688 <peek+0x58>
     671:	8b 45 10             	mov    0x10(%ebp),%eax
     674:	89 54 24 04          	mov    %edx,0x4(%esp)
     678:	89 04 24             	mov    %eax,(%esp)
     67b:	e8 10 06 00 00       	call   c90 <strchr>
     680:	85 c0                	test   %eax,%eax
     682:	0f 95 c0             	setne  %al
     685:	0f b6 c0             	movzbl %al,%eax
}
     688:	83 c4 1c             	add    $0x1c,%esp
     68b:	5b                   	pop    %ebx
     68c:	5e                   	pop    %esi
     68d:	5f                   	pop    %edi
     68e:	5d                   	pop    %ebp
     68f:	c3                   	ret    

00000690 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     690:	55                   	push   %ebp
     691:	89 e5                	mov    %esp,%ebp
     693:	57                   	push   %edi
     694:	56                   	push   %esi
     695:	53                   	push   %ebx
     696:	83 ec 3c             	sub    $0x3c,%esp
     699:	8b 75 0c             	mov    0xc(%ebp),%esi
     69c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     69f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6a0:	c7 44 24 08 db 12 00 	movl   $0x12db,0x8(%esp)
     6a7:	00 
     6a8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     6ac:	89 34 24             	mov    %esi,(%esp)
     6af:	e8 7c ff ff ff       	call   630 <peek>
     6b4:	85 c0                	test   %eax,%eax
     6b6:	0f 84 9c 00 00 00    	je     758 <parseredirs+0xc8>
    tok = gettoken(ps, es, 0, 0);
     6bc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     6c3:	00 
     6c4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     6cb:	00 
     6cc:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     6d0:	89 34 24             	mov    %esi,(%esp)
     6d3:	e8 18 fe ff ff       	call   4f0 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     6d8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     6dc:	89 34 24             	mov    %esi,(%esp)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
     6df:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     6e1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     6e4:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6e8:	8d 45 e0             	lea    -0x20(%ebp),%eax
     6eb:	89 44 24 08          	mov    %eax,0x8(%esp)
     6ef:	e8 fc fd ff ff       	call   4f0 <gettoken>
     6f4:	83 f8 61             	cmp    $0x61,%eax
     6f7:	75 6a                	jne    763 <parseredirs+0xd3>
      panic("missing file for redirection");
    switch(tok){
     6f9:	83 ff 3c             	cmp    $0x3c,%edi
     6fc:	74 42                	je     740 <parseredirs+0xb0>
     6fe:	83 ff 3e             	cmp    $0x3e,%edi
     701:	74 05                	je     708 <parseredirs+0x78>
     703:	83 ff 2b             	cmp    $0x2b,%edi
     706:	75 98                	jne    6a0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     708:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     70f:	00 
     710:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     717:	00 
     718:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     71b:	89 44 24 08          	mov    %eax,0x8(%esp)
     71f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     722:	89 44 24 04          	mov    %eax,0x4(%esp)
     726:	8b 45 08             	mov    0x8(%ebp),%eax
     729:	89 04 24             	mov    %eax,(%esp)
     72c:	e8 6f fc ff ff       	call   3a0 <redircmd>
     731:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     734:	e9 67 ff ff ff       	jmp    6a0 <parseredirs+0x10>
     739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     740:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     747:	00 
     748:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     74f:	00 
     750:	eb c6                	jmp    718 <parseredirs+0x88>
     752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     758:	8b 45 08             	mov    0x8(%ebp),%eax
     75b:	83 c4 3c             	add    $0x3c,%esp
     75e:	5b                   	pop    %ebx
     75f:	5e                   	pop    %esi
     760:	5f                   	pop    %edi
     761:	5d                   	pop    %ebp
     762:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     763:	c7 04 24 be 12 00 00 	movl   $0x12be,(%esp)
     76a:	e8 f1 f9 ff ff       	call   160 <panic>
     76f:	90                   	nop

00000770 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     770:	55                   	push   %ebp
     771:	89 e5                	mov    %esp,%ebp
     773:	57                   	push   %edi
     774:	56                   	push   %esi
     775:	53                   	push   %ebx
     776:	83 ec 3c             	sub    $0x3c,%esp
     779:	8b 75 08             	mov    0x8(%ebp),%esi
     77c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     77f:	c7 44 24 08 de 12 00 	movl   $0x12de,0x8(%esp)
     786:	00 
     787:	89 34 24             	mov    %esi,(%esp)
     78a:	89 7c 24 04          	mov    %edi,0x4(%esp)
     78e:	e8 9d fe ff ff       	call   630 <peek>
     793:	85 c0                	test   %eax,%eax
     795:	0f 85 a5 00 00 00    	jne    840 <parseexec+0xd0>
    return parseblock(ps, es);

  ret = execcmd();
     79b:	e8 c0 fb ff ff       	call   360 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7a0:	89 7c 24 08          	mov    %edi,0x8(%esp)
     7a4:	89 74 24 04          	mov    %esi,0x4(%esp)
     7a8:	89 04 24             	mov    %eax,(%esp)
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     7ab:	89 c3                	mov    %eax,%ebx
     7ad:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7b0:	e8 db fe ff ff       	call   690 <parseredirs>
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     7b5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  ret = parseredirs(ret, ps, es);
     7bc:	89 45 d0             	mov    %eax,-0x30(%ebp)
  while(!peek(ps, es, "|)&;")){
     7bf:	eb 1d                	jmp    7de <parseexec+0x6e>
     7c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7cb:	89 7c 24 08          	mov    %edi,0x8(%esp)
     7cf:	89 74 24 04          	mov    %esi,0x4(%esp)
     7d3:	89 04 24             	mov    %eax,(%esp)
     7d6:	e8 b5 fe ff ff       	call   690 <parseredirs>
     7db:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     7de:	c7 44 24 08 f5 12 00 	movl   $0x12f5,0x8(%esp)
     7e5:	00 
     7e6:	89 7c 24 04          	mov    %edi,0x4(%esp)
     7ea:	89 34 24             	mov    %esi,(%esp)
     7ed:	e8 3e fe ff ff       	call   630 <peek>
     7f2:	85 c0                	test   %eax,%eax
     7f4:	75 62                	jne    858 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7f6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7f9:	89 44 24 0c          	mov    %eax,0xc(%esp)
     7fd:	8d 45 e0             	lea    -0x20(%ebp),%eax
     800:	89 44 24 08          	mov    %eax,0x8(%esp)
     804:	89 7c 24 04          	mov    %edi,0x4(%esp)
     808:	89 34 24             	mov    %esi,(%esp)
     80b:	e8 e0 fc ff ff       	call   4f0 <gettoken>
     810:	85 c0                	test   %eax,%eax
     812:	74 44                	je     858 <parseexec+0xe8>
      break;
    if(tok != 'a')
     814:	83 f8 61             	cmp    $0x61,%eax
     817:	75 61                	jne    87a <parseexec+0x10a>
      panic("syntax");
    cmd->argv[argc] = q;
     819:	8b 45 e0             	mov    -0x20(%ebp),%eax
     81c:	83 c3 04             	add    $0x4,%ebx
    cmd->eargv[argc] = eq;
    argc++;
     81f:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     823:	89 03                	mov    %eax,(%ebx)
    cmd->eargv[argc] = eq;
     825:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     828:	89 43 28             	mov    %eax,0x28(%ebx)
    argc++;
    if(argc >= MAXARGS)
     82b:	83 7d d4 0a          	cmpl   $0xa,-0x2c(%ebp)
     82f:	75 97                	jne    7c8 <parseexec+0x58>
      panic("too many args");
     831:	c7 04 24 e7 12 00 00 	movl   $0x12e7,(%esp)
     838:	e8 23 f9 ff ff       	call   160 <panic>
     83d:	8d 76 00             	lea    0x0(%esi),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     840:	89 7c 24 04          	mov    %edi,0x4(%esp)
     844:	89 34 24             	mov    %esi,(%esp)
     847:	e8 84 01 00 00       	call   9d0 <parseblock>
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     84c:	83 c4 3c             	add    $0x3c,%esp
     84f:	5b                   	pop    %ebx
     850:	5e                   	pop    %esi
     851:	5f                   	pop    %edi
     852:	5d                   	pop    %ebp
     853:	c3                   	ret    
     854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     858:	8b 45 cc             	mov    -0x34(%ebp),%eax
     85b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     85e:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     861:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     868:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  return ret;
     86f:	8b 45 d0             	mov    -0x30(%ebp),%eax
}
     872:	83 c4 3c             	add    $0x3c,%esp
     875:	5b                   	pop    %ebx
     876:	5e                   	pop    %esi
     877:	5f                   	pop    %edi
     878:	5d                   	pop    %ebp
     879:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     87a:	c7 04 24 e0 12 00 00 	movl   $0x12e0,(%esp)
     881:	e8 da f8 ff ff       	call   160 <panic>
     886:	8d 76 00             	lea    0x0(%esi),%esi
     889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000890 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	57                   	push   %edi
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	83 ec 1c             	sub    $0x1c,%esp
     899:	8b 5d 08             	mov    0x8(%ebp),%ebx
     89c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     89f:	89 1c 24             	mov    %ebx,(%esp)
     8a2:	89 74 24 04          	mov    %esi,0x4(%esp)
     8a6:	e8 c5 fe ff ff       	call   770 <parseexec>
  if(peek(ps, es, "|")){
     8ab:	c7 44 24 08 fa 12 00 	movl   $0x12fa,0x8(%esp)
     8b2:	00 
     8b3:	89 74 24 04          	mov    %esi,0x4(%esp)
     8b7:	89 1c 24             	mov    %ebx,(%esp)
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     8ba:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     8bc:	e8 6f fd ff ff       	call   630 <peek>
     8c1:	85 c0                	test   %eax,%eax
     8c3:	75 0b                	jne    8d0 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     8c5:	83 c4 1c             	add    $0x1c,%esp
     8c8:	89 f8                	mov    %edi,%eax
     8ca:	5b                   	pop    %ebx
     8cb:	5e                   	pop    %esi
     8cc:	5f                   	pop    %edi
     8cd:	5d                   	pop    %ebp
     8ce:	c3                   	ret    
     8cf:	90                   	nop
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     8d0:	89 74 24 04          	mov    %esi,0x4(%esp)
     8d4:	89 1c 24             	mov    %ebx,(%esp)
     8d7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8de:	00 
     8df:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8e6:	00 
     8e7:	e8 04 fc ff ff       	call   4f0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8ec:	89 74 24 04          	mov    %esi,0x4(%esp)
     8f0:	89 1c 24             	mov    %ebx,(%esp)
     8f3:	e8 98 ff ff ff       	call   890 <parsepipe>
     8f8:	89 7d 08             	mov    %edi,0x8(%ebp)
     8fb:	89 45 0c             	mov    %eax,0xc(%ebp)
  }
  return cmd;
}
     8fe:	83 c4 1c             	add    $0x1c,%esp
     901:	5b                   	pop    %ebx
     902:	5e                   	pop    %esi
     903:	5f                   	pop    %edi
     904:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     905:	e9 f6 fa ff ff       	jmp    400 <pipecmd>
     90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000910 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     910:	55                   	push   %ebp
     911:	89 e5                	mov    %esp,%ebp
     913:	57                   	push   %edi
     914:	56                   	push   %esi
     915:	53                   	push   %ebx
     916:	83 ec 1c             	sub    $0x1c,%esp
     919:	8b 5d 08             	mov    0x8(%ebp),%ebx
     91c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     91f:	89 1c 24             	mov    %ebx,(%esp)
     922:	89 74 24 04          	mov    %esi,0x4(%esp)
     926:	e8 65 ff ff ff       	call   890 <parsepipe>
     92b:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     92d:	eb 27                	jmp    956 <parseline+0x46>
     92f:	90                   	nop
    gettoken(ps, es, 0, 0);
     930:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     937:	00 
     938:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     93f:	00 
     940:	89 74 24 04          	mov    %esi,0x4(%esp)
     944:	89 1c 24             	mov    %ebx,(%esp)
     947:	e8 a4 fb ff ff       	call   4f0 <gettoken>
    cmd = backcmd(cmd);
     94c:	89 3c 24             	mov    %edi,(%esp)
     94f:	e8 4c fb ff ff       	call   4a0 <backcmd>
     954:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     956:	c7 44 24 08 fc 12 00 	movl   $0x12fc,0x8(%esp)
     95d:	00 
     95e:	89 74 24 04          	mov    %esi,0x4(%esp)
     962:	89 1c 24             	mov    %ebx,(%esp)
     965:	e8 c6 fc ff ff       	call   630 <peek>
     96a:	85 c0                	test   %eax,%eax
     96c:	75 c2                	jne    930 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     96e:	c7 44 24 08 f8 12 00 	movl   $0x12f8,0x8(%esp)
     975:	00 
     976:	89 74 24 04          	mov    %esi,0x4(%esp)
     97a:	89 1c 24             	mov    %ebx,(%esp)
     97d:	e8 ae fc ff ff       	call   630 <peek>
     982:	85 c0                	test   %eax,%eax
     984:	75 0a                	jne    990 <parseline+0x80>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     986:	83 c4 1c             	add    $0x1c,%esp
     989:	89 f8                	mov    %edi,%eax
     98b:	5b                   	pop    %ebx
     98c:	5e                   	pop    %esi
     98d:	5f                   	pop    %edi
     98e:	5d                   	pop    %ebp
     98f:	c3                   	ret    
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     990:	89 74 24 04          	mov    %esi,0x4(%esp)
     994:	89 1c 24             	mov    %ebx,(%esp)
     997:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     99e:	00 
     99f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     9a6:	00 
     9a7:	e8 44 fb ff ff       	call   4f0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9ac:	89 74 24 04          	mov    %esi,0x4(%esp)
     9b0:	89 1c 24             	mov    %ebx,(%esp)
     9b3:	e8 58 ff ff ff       	call   910 <parseline>
     9b8:	89 7d 08             	mov    %edi,0x8(%ebp)
     9bb:	89 45 0c             	mov    %eax,0xc(%ebp)
  }
  return cmd;
}
     9be:	83 c4 1c             	add    $0x1c,%esp
     9c1:	5b                   	pop    %ebx
     9c2:	5e                   	pop    %esi
     9c3:	5f                   	pop    %edi
     9c4:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     9c5:	e9 86 fa ff ff       	jmp    450 <listcmd>
     9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009d0 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	57                   	push   %edi
     9d4:	56                   	push   %esi
     9d5:	53                   	push   %ebx
     9d6:	83 ec 1c             	sub    $0x1c,%esp
     9d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     9dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     9df:	c7 44 24 08 de 12 00 	movl   $0x12de,0x8(%esp)
     9e6:	00 
     9e7:	89 1c 24             	mov    %ebx,(%esp)
     9ea:	89 74 24 04          	mov    %esi,0x4(%esp)
     9ee:	e8 3d fc ff ff       	call   630 <peek>
     9f3:	85 c0                	test   %eax,%eax
     9f5:	74 76                	je     a6d <parseblock+0x9d>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     9f7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9fe:	00 
     9ff:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a06:	00 
     a07:	89 74 24 04          	mov    %esi,0x4(%esp)
     a0b:	89 1c 24             	mov    %ebx,(%esp)
     a0e:	e8 dd fa ff ff       	call   4f0 <gettoken>
  cmd = parseline(ps, es);
     a13:	89 74 24 04          	mov    %esi,0x4(%esp)
     a17:	89 1c 24             	mov    %ebx,(%esp)
     a1a:	e8 f1 fe ff ff       	call   910 <parseline>
  if(!peek(ps, es, ")"))
     a1f:	c7 44 24 08 1a 13 00 	movl   $0x131a,0x8(%esp)
     a26:	00 
     a27:	89 74 24 04          	mov    %esi,0x4(%esp)
     a2b:	89 1c 24             	mov    %ebx,(%esp)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     a2e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a30:	e8 fb fb ff ff       	call   630 <peek>
     a35:	85 c0                	test   %eax,%eax
     a37:	74 40                	je     a79 <parseblock+0xa9>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     a39:	89 74 24 04          	mov    %esi,0x4(%esp)
     a3d:	89 1c 24             	mov    %ebx,(%esp)
     a40:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a47:	00 
     a48:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a4f:	00 
     a50:	e8 9b fa ff ff       	call   4f0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a55:	89 74 24 08          	mov    %esi,0x8(%esp)
     a59:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     a5d:	89 3c 24             	mov    %edi,(%esp)
     a60:	e8 2b fc ff ff       	call   690 <parseredirs>
  return cmd;
}
     a65:	83 c4 1c             	add    $0x1c,%esp
     a68:	5b                   	pop    %ebx
     a69:	5e                   	pop    %esi
     a6a:	5f                   	pop    %edi
     a6b:	5d                   	pop    %ebp
     a6c:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     a6d:	c7 04 24 fe 12 00 00 	movl   $0x12fe,(%esp)
     a74:	e8 e7 f6 ff ff       	call   160 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     a79:	c7 04 24 09 13 00 00 	movl   $0x1309,(%esp)
     a80:	e8 db f6 ff ff       	call   160 <panic>
     a85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a90 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a90:	55                   	push   %ebp
     a91:	89 e5                	mov    %esp,%ebp
     a93:	53                   	push   %ebx
     a94:	83 ec 14             	sub    $0x14,%esp
     a97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a9a:	85 db                	test   %ebx,%ebx
     a9c:	0f 84 8e 00 00 00    	je     b30 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
     aa2:	83 3b 05             	cmpl   $0x5,(%ebx)
     aa5:	77 49                	ja     af0 <nulterminate+0x60>
     aa7:	8b 03                	mov    (%ebx),%eax
     aa9:	ff 24 85 5c 13 00 00 	jmp    *0x135c(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ab0:	8b 43 04             	mov    0x4(%ebx),%eax
     ab3:	89 04 24             	mov    %eax,(%esp)
     ab6:	e8 d5 ff ff ff       	call   a90 <nulterminate>
    nulterminate(lcmd->right);
     abb:	8b 43 08             	mov    0x8(%ebx),%eax
     abe:	89 04 24             	mov    %eax,(%esp)
     ac1:	e8 ca ff ff ff       	call   a90 <nulterminate>
    break;
     ac6:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ac8:	83 c4 14             	add    $0x14,%esp
     acb:	5b                   	pop    %ebx
     acc:	5d                   	pop    %ebp
     acd:	c3                   	ret    
     ace:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     ad0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     ad3:	89 d8                	mov    %ebx,%eax
     ad5:	85 c9                	test   %ecx,%ecx
     ad7:	74 17                	je     af0 <nulterminate+0x60>
     ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
     ae0:	8b 50 2c             	mov    0x2c(%eax),%edx
     ae3:	83 c0 04             	add    $0x4,%eax
     ae6:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     ae9:	8b 50 04             	mov    0x4(%eax),%edx
     aec:	85 d2                	test   %edx,%edx
     aee:	75 f0                	jne    ae0 <nulterminate+0x50>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     af0:	83 c4 14             	add    $0x14,%esp
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     af3:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     af5:	5b                   	pop    %ebx
     af6:	5d                   	pop    %ebp
     af7:	c3                   	ret    
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     af8:	8b 43 04             	mov    0x4(%ebx),%eax
     afb:	89 04 24             	mov    %eax,(%esp)
     afe:	e8 8d ff ff ff       	call   a90 <nulterminate>
    break;
  }
  return cmd;
}
     b03:	83 c4 14             	add    $0x14,%esp
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
     b06:	89 d8                	mov    %ebx,%eax
  }
  return cmd;
}
     b08:	5b                   	pop    %ebx
     b09:	5d                   	pop    %ebp
     b0a:	c3                   	ret    
     b0b:	90                   	nop
     b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     b10:	8b 43 04             	mov    0x4(%ebx),%eax
     b13:	89 04 24             	mov    %eax,(%esp)
     b16:	e8 75 ff ff ff       	call   a90 <nulterminate>
    *rcmd->efile = 0;
     b1b:	8b 43 0c             	mov    0xc(%ebx),%eax
     b1e:	c6 00 00             	movb   $0x0,(%eax)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     b21:	83 c4 14             	add    $0x14,%esp

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
    break;
     b24:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     b26:	5b                   	pop    %ebx
     b27:	5d                   	pop    %ebp
     b28:	c3                   	ret    
     b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
     b30:	31 c0                	xor    %eax,%eax
     b32:	eb 94                	jmp    ac8 <nulterminate+0x38>
     b34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b40 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	56                   	push   %esi
     b44:	53                   	push   %ebx
     b45:	83 ec 10             	sub    $0x10,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     b48:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b4b:	89 1c 24             	mov    %ebx,(%esp)
     b4e:	e8 ed 00 00 00       	call   c40 <strlen>
     b53:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b55:	8d 45 08             	lea    0x8(%ebp),%eax
     b58:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     b5c:	89 04 24             	mov    %eax,(%esp)
     b5f:	e8 ac fd ff ff       	call   910 <parseline>
  peek(&s, es, "");
     b64:	c7 44 24 08 a8 12 00 	movl   $0x12a8,0x8(%esp)
     b6b:	00 
     b6c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
     b70:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b72:	8d 45 08             	lea    0x8(%ebp),%eax
     b75:	89 04 24             	mov    %eax,(%esp)
     b78:	e8 b3 fa ff ff       	call   630 <peek>
  if(s != es){
     b7d:	8b 45 08             	mov    0x8(%ebp),%eax
     b80:	39 d8                	cmp    %ebx,%eax
     b82:	75 11                	jne    b95 <parsecmd+0x55>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     b84:	89 34 24             	mov    %esi,(%esp)
     b87:	e8 04 ff ff ff       	call   a90 <nulterminate>
  return cmd;
}
     b8c:	83 c4 10             	add    $0x10,%esp
     b8f:	89 f0                	mov    %esi,%eax
     b91:	5b                   	pop    %ebx
     b92:	5e                   	pop    %esi
     b93:	5d                   	pop    %ebp
     b94:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     b95:	89 44 24 08          	mov    %eax,0x8(%esp)
     b99:	c7 44 24 04 1c 13 00 	movl   $0x131c,0x4(%esp)
     ba0:	00 
     ba1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     ba8:	e8 a3 03 00 00       	call   f50 <printf>
    panic("syntax");
     bad:	c7 04 24 e0 12 00 00 	movl   $0x12e0,(%esp)
     bb4:	e8 a7 f5 ff ff       	call   160 <panic>
     bb9:	66 90                	xchg   %ax,%ax
     bbb:	66 90                	xchg   %ax,%ax
     bbd:	66 90                	xchg   %ax,%ax
     bbf:	90                   	nop

00000bc0 <strcpy>:
     bc0:	55                   	push   %ebp
     bc1:	89 e5                	mov    %esp,%ebp
     bc3:	53                   	push   %ebx
     bc4:	8b 45 08             	mov    0x8(%ebp),%eax
     bc7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     bca:	89 c2                	mov    %eax,%edx
     bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bd0:	83 c1 01             	add    $0x1,%ecx
     bd3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     bd7:	83 c2 01             	add    $0x1,%edx
     bda:	84 db                	test   %bl,%bl
     bdc:	88 5a ff             	mov    %bl,-0x1(%edx)
     bdf:	75 ef                	jne    bd0 <strcpy+0x10>
     be1:	5b                   	pop    %ebx
     be2:	5d                   	pop    %ebp
     be3:	c3                   	ret    
     be4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     bea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000bf0 <strcmp>:
     bf0:	55                   	push   %ebp
     bf1:	89 e5                	mov    %esp,%ebp
     bf3:	56                   	push   %esi
     bf4:	53                   	push   %ebx
     bf5:	8b 55 08             	mov    0x8(%ebp),%edx
     bf8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     bfb:	0f b6 02             	movzbl (%edx),%eax
     bfe:	0f b6 19             	movzbl (%ecx),%ebx
     c01:	84 c0                	test   %al,%al
     c03:	75 1e                	jne    c23 <strcmp+0x33>
     c05:	eb 29                	jmp    c30 <strcmp+0x40>
     c07:	89 f6                	mov    %esi,%esi
     c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     c10:	83 c2 01             	add    $0x1,%edx
     c13:	0f b6 02             	movzbl (%edx),%eax
     c16:	8d 71 01             	lea    0x1(%ecx),%esi
     c19:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     c1d:	84 c0                	test   %al,%al
     c1f:	74 0f                	je     c30 <strcmp+0x40>
     c21:	89 f1                	mov    %esi,%ecx
     c23:	38 d8                	cmp    %bl,%al
     c25:	74 e9                	je     c10 <strcmp+0x20>
     c27:	29 d8                	sub    %ebx,%eax
     c29:	5b                   	pop    %ebx
     c2a:	5e                   	pop    %esi
     c2b:	5d                   	pop    %ebp
     c2c:	c3                   	ret    
     c2d:	8d 76 00             	lea    0x0(%esi),%esi
     c30:	31 c0                	xor    %eax,%eax
     c32:	29 d8                	sub    %ebx,%eax
     c34:	5b                   	pop    %ebx
     c35:	5e                   	pop    %esi
     c36:	5d                   	pop    %ebp
     c37:	c3                   	ret    
     c38:	90                   	nop
     c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c40 <strlen>:
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c46:	80 39 00             	cmpb   $0x0,(%ecx)
     c49:	74 12                	je     c5d <strlen+0x1d>
     c4b:	31 d2                	xor    %edx,%edx
     c4d:	8d 76 00             	lea    0x0(%esi),%esi
     c50:	83 c2 01             	add    $0x1,%edx
     c53:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     c57:	89 d0                	mov    %edx,%eax
     c59:	75 f5                	jne    c50 <strlen+0x10>
     c5b:	5d                   	pop    %ebp
     c5c:	c3                   	ret    
     c5d:	31 c0                	xor    %eax,%eax
     c5f:	5d                   	pop    %ebp
     c60:	c3                   	ret    
     c61:	eb 0d                	jmp    c70 <memset>
     c63:	90                   	nop
     c64:	90                   	nop
     c65:	90                   	nop
     c66:	90                   	nop
     c67:	90                   	nop
     c68:	90                   	nop
     c69:	90                   	nop
     c6a:	90                   	nop
     c6b:	90                   	nop
     c6c:	90                   	nop
     c6d:	90                   	nop
     c6e:	90                   	nop
     c6f:	90                   	nop

00000c70 <memset>:
     c70:	55                   	push   %ebp
     c71:	89 e5                	mov    %esp,%ebp
     c73:	57                   	push   %edi
     c74:	8b 55 08             	mov    0x8(%ebp),%edx
     c77:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c7a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c7d:	89 d7                	mov    %edx,%edi
     c7f:	fc                   	cld    
     c80:	f3 aa                	rep stos %al,%es:(%edi)
     c82:	89 d0                	mov    %edx,%eax
     c84:	5f                   	pop    %edi
     c85:	5d                   	pop    %ebp
     c86:	c3                   	ret    
     c87:	89 f6                	mov    %esi,%esi
     c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c90 <strchr>:
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	53                   	push   %ebx
     c94:	8b 45 08             	mov    0x8(%ebp),%eax
     c97:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     c9a:	0f b6 10             	movzbl (%eax),%edx
     c9d:	84 d2                	test   %dl,%dl
     c9f:	74 1d                	je     cbe <strchr+0x2e>
     ca1:	38 d3                	cmp    %dl,%bl
     ca3:	89 d9                	mov    %ebx,%ecx
     ca5:	75 0d                	jne    cb4 <strchr+0x24>
     ca7:	eb 17                	jmp    cc0 <strchr+0x30>
     ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cb0:	38 ca                	cmp    %cl,%dl
     cb2:	74 0c                	je     cc0 <strchr+0x30>
     cb4:	83 c0 01             	add    $0x1,%eax
     cb7:	0f b6 10             	movzbl (%eax),%edx
     cba:	84 d2                	test   %dl,%dl
     cbc:	75 f2                	jne    cb0 <strchr+0x20>
     cbe:	31 c0                	xor    %eax,%eax
     cc0:	5b                   	pop    %ebx
     cc1:	5d                   	pop    %ebp
     cc2:	c3                   	ret    
     cc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cd0 <gets>:
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	57                   	push   %edi
     cd4:	56                   	push   %esi
     cd5:	53                   	push   %ebx
     cd6:	31 f6                	xor    %esi,%esi
     cd8:	8d 7d e7             	lea    -0x19(%ebp),%edi
     cdb:	83 ec 1c             	sub    $0x1c,%esp
     cde:	eb 29                	jmp    d09 <gets+0x39>
     ce0:	83 ec 04             	sub    $0x4,%esp
     ce3:	6a 01                	push   $0x1
     ce5:	57                   	push   %edi
     ce6:	6a 00                	push   $0x0
     ce8:	e8 2d 01 00 00       	call   e1a <read>
     ced:	83 c4 10             	add    $0x10,%esp
     cf0:	85 c0                	test   %eax,%eax
     cf2:	7e 1d                	jle    d11 <gets+0x41>
     cf4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     cf8:	8b 55 08             	mov    0x8(%ebp),%edx
     cfb:	89 de                	mov    %ebx,%esi
     cfd:	3c 0a                	cmp    $0xa,%al
     cff:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
     d03:	74 1b                	je     d20 <gets+0x50>
     d05:	3c 0d                	cmp    $0xd,%al
     d07:	74 17                	je     d20 <gets+0x50>
     d09:	8d 5e 01             	lea    0x1(%esi),%ebx
     d0c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d0f:	7c cf                	jl     ce0 <gets+0x10>
     d11:	8b 45 08             	mov    0x8(%ebp),%eax
     d14:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
     d18:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d1b:	5b                   	pop    %ebx
     d1c:	5e                   	pop    %esi
     d1d:	5f                   	pop    %edi
     d1e:	5d                   	pop    %ebp
     d1f:	c3                   	ret    
     d20:	8b 45 08             	mov    0x8(%ebp),%eax
     d23:	89 de                	mov    %ebx,%esi
     d25:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
     d29:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d2c:	5b                   	pop    %ebx
     d2d:	5e                   	pop    %esi
     d2e:	5f                   	pop    %edi
     d2f:	5d                   	pop    %ebp
     d30:	c3                   	ret    
     d31:	eb 0d                	jmp    d40 <stat>
     d33:	90                   	nop
     d34:	90                   	nop
     d35:	90                   	nop
     d36:	90                   	nop
     d37:	90                   	nop
     d38:	90                   	nop
     d39:	90                   	nop
     d3a:	90                   	nop
     d3b:	90                   	nop
     d3c:	90                   	nop
     d3d:	90                   	nop
     d3e:	90                   	nop
     d3f:	90                   	nop

00000d40 <stat>:
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	56                   	push   %esi
     d44:	53                   	push   %ebx
     d45:	83 ec 08             	sub    $0x8,%esp
     d48:	6a 00                	push   $0x0
     d4a:	ff 75 08             	pushl  0x8(%ebp)
     d4d:	e8 f0 00 00 00       	call   e42 <open>
     d52:	83 c4 10             	add    $0x10,%esp
     d55:	85 c0                	test   %eax,%eax
     d57:	78 27                	js     d80 <stat+0x40>
     d59:	83 ec 08             	sub    $0x8,%esp
     d5c:	ff 75 0c             	pushl  0xc(%ebp)
     d5f:	89 c3                	mov    %eax,%ebx
     d61:	50                   	push   %eax
     d62:	e8 f3 00 00 00       	call   e5a <fstat>
     d67:	89 c6                	mov    %eax,%esi
     d69:	89 1c 24             	mov    %ebx,(%esp)
     d6c:	e8 b9 00 00 00       	call   e2a <close>
     d71:	83 c4 10             	add    $0x10,%esp
     d74:	89 f0                	mov    %esi,%eax
     d76:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d79:	5b                   	pop    %ebx
     d7a:	5e                   	pop    %esi
     d7b:	5d                   	pop    %ebp
     d7c:	c3                   	ret    
     d7d:	8d 76 00             	lea    0x0(%esi),%esi
     d80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     d85:	eb ef                	jmp    d76 <stat+0x36>
     d87:	89 f6                	mov    %esi,%esi
     d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d90 <atoi>:
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	53                   	push   %ebx
     d94:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d97:	0f be 11             	movsbl (%ecx),%edx
     d9a:	8d 42 d0             	lea    -0x30(%edx),%eax
     d9d:	3c 09                	cmp    $0x9,%al
     d9f:	b8 00 00 00 00       	mov    $0x0,%eax
     da4:	77 1f                	ja     dc5 <atoi+0x35>
     da6:	8d 76 00             	lea    0x0(%esi),%esi
     da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     db0:	8d 04 80             	lea    (%eax,%eax,4),%eax
     db3:	83 c1 01             	add    $0x1,%ecx
     db6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
     dba:	0f be 11             	movsbl (%ecx),%edx
     dbd:	8d 5a d0             	lea    -0x30(%edx),%ebx
     dc0:	80 fb 09             	cmp    $0x9,%bl
     dc3:	76 eb                	jbe    db0 <atoi+0x20>
     dc5:	5b                   	pop    %ebx
     dc6:	5d                   	pop    %ebp
     dc7:	c3                   	ret    
     dc8:	90                   	nop
     dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000dd0 <memmove>:
     dd0:	55                   	push   %ebp
     dd1:	89 e5                	mov    %esp,%ebp
     dd3:	56                   	push   %esi
     dd4:	53                   	push   %ebx
     dd5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     dd8:	8b 45 08             	mov    0x8(%ebp),%eax
     ddb:	8b 75 0c             	mov    0xc(%ebp),%esi
     dde:	85 db                	test   %ebx,%ebx
     de0:	7e 14                	jle    df6 <memmove+0x26>
     de2:	31 d2                	xor    %edx,%edx
     de4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     de8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     dec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     def:	83 c2 01             	add    $0x1,%edx
     df2:	39 da                	cmp    %ebx,%edx
     df4:	75 f2                	jne    de8 <memmove+0x18>
     df6:	5b                   	pop    %ebx
     df7:	5e                   	pop    %esi
     df8:	5d                   	pop    %ebp
     df9:	c3                   	ret    

00000dfa <fork>:
     dfa:	b8 01 00 00 00       	mov    $0x1,%eax
     dff:	cd 40                	int    $0x40
     e01:	c3                   	ret    

00000e02 <exit>:
     e02:	b8 02 00 00 00       	mov    $0x2,%eax
     e07:	cd 40                	int    $0x40
     e09:	c3                   	ret    

00000e0a <wait>:
     e0a:	b8 03 00 00 00       	mov    $0x3,%eax
     e0f:	cd 40                	int    $0x40
     e11:	c3                   	ret    

00000e12 <pipe>:
     e12:	b8 04 00 00 00       	mov    $0x4,%eax
     e17:	cd 40                	int    $0x40
     e19:	c3                   	ret    

00000e1a <read>:
     e1a:	b8 05 00 00 00       	mov    $0x5,%eax
     e1f:	cd 40                	int    $0x40
     e21:	c3                   	ret    

00000e22 <write>:
     e22:	b8 10 00 00 00       	mov    $0x10,%eax
     e27:	cd 40                	int    $0x40
     e29:	c3                   	ret    

00000e2a <close>:
     e2a:	b8 15 00 00 00       	mov    $0x15,%eax
     e2f:	cd 40                	int    $0x40
     e31:	c3                   	ret    

00000e32 <kill>:
     e32:	b8 06 00 00 00       	mov    $0x6,%eax
     e37:	cd 40                	int    $0x40
     e39:	c3                   	ret    

00000e3a <exec>:
     e3a:	b8 07 00 00 00       	mov    $0x7,%eax
     e3f:	cd 40                	int    $0x40
     e41:	c3                   	ret    

00000e42 <open>:
     e42:	b8 0f 00 00 00       	mov    $0xf,%eax
     e47:	cd 40                	int    $0x40
     e49:	c3                   	ret    

00000e4a <mknod>:
     e4a:	b8 11 00 00 00       	mov    $0x11,%eax
     e4f:	cd 40                	int    $0x40
     e51:	c3                   	ret    

00000e52 <unlink>:
     e52:	b8 12 00 00 00       	mov    $0x12,%eax
     e57:	cd 40                	int    $0x40
     e59:	c3                   	ret    

00000e5a <fstat>:
     e5a:	b8 08 00 00 00       	mov    $0x8,%eax
     e5f:	cd 40                	int    $0x40
     e61:	c3                   	ret    

00000e62 <link>:
     e62:	b8 13 00 00 00       	mov    $0x13,%eax
     e67:	cd 40                	int    $0x40
     e69:	c3                   	ret    

00000e6a <mkdir>:
     e6a:	b8 14 00 00 00       	mov    $0x14,%eax
     e6f:	cd 40                	int    $0x40
     e71:	c3                   	ret    

00000e72 <chdir>:
     e72:	b8 09 00 00 00       	mov    $0x9,%eax
     e77:	cd 40                	int    $0x40
     e79:	c3                   	ret    

00000e7a <dup>:
     e7a:	b8 0a 00 00 00       	mov    $0xa,%eax
     e7f:	cd 40                	int    $0x40
     e81:	c3                   	ret    

00000e82 <getpid>:
     e82:	b8 0b 00 00 00       	mov    $0xb,%eax
     e87:	cd 40                	int    $0x40
     e89:	c3                   	ret    

00000e8a <sbrk>:
     e8a:	b8 0c 00 00 00       	mov    $0xc,%eax
     e8f:	cd 40                	int    $0x40
     e91:	c3                   	ret    

00000e92 <sleep>:
     e92:	b8 0d 00 00 00       	mov    $0xd,%eax
     e97:	cd 40                	int    $0x40
     e99:	c3                   	ret    

00000e9a <uptime>:
     e9a:	b8 0e 00 00 00       	mov    $0xe,%eax
     e9f:	cd 40                	int    $0x40
     ea1:	c3                   	ret    
     ea2:	66 90                	xchg   %ax,%ax
     ea4:	66 90                	xchg   %ax,%ax
     ea6:	66 90                	xchg   %ax,%ax
     ea8:	66 90                	xchg   %ax,%ax
     eaa:	66 90                	xchg   %ax,%ax
     eac:	66 90                	xchg   %ax,%ax
     eae:	66 90                	xchg   %ax,%ax

00000eb0 <printint>:
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
     eb6:	89 c6                	mov    %eax,%esi
     eb8:	83 ec 3c             	sub    $0x3c,%esp
     ebb:	8b 5d 08             	mov    0x8(%ebp),%ebx
     ebe:	85 db                	test   %ebx,%ebx
     ec0:	74 7e                	je     f40 <printint+0x90>
     ec2:	89 d0                	mov    %edx,%eax
     ec4:	c1 e8 1f             	shr    $0x1f,%eax
     ec7:	84 c0                	test   %al,%al
     ec9:	74 75                	je     f40 <printint+0x90>
     ecb:	89 d0                	mov    %edx,%eax
     ecd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
     ed4:	f7 d8                	neg    %eax
     ed6:	89 75 c0             	mov    %esi,-0x40(%ebp)
     ed9:	31 ff                	xor    %edi,%edi
     edb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     ede:	89 ce                	mov    %ecx,%esi
     ee0:	eb 08                	jmp    eea <printint+0x3a>
     ee2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ee8:	89 cf                	mov    %ecx,%edi
     eea:	31 d2                	xor    %edx,%edx
     eec:	8d 4f 01             	lea    0x1(%edi),%ecx
     eef:	f7 f6                	div    %esi
     ef1:	0f b6 92 7c 13 00 00 	movzbl 0x137c(%edx),%edx
     ef8:	85 c0                	test   %eax,%eax
     efa:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
     efd:	75 e9                	jne    ee8 <printint+0x38>
     eff:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     f02:	8b 75 c0             	mov    -0x40(%ebp),%esi
     f05:	85 c0                	test   %eax,%eax
     f07:	74 08                	je     f11 <printint+0x61>
     f09:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     f0e:	8d 4f 02             	lea    0x2(%edi),%ecx
     f11:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     f15:	8d 76 00             	lea    0x0(%esi),%esi
     f18:	0f b6 07             	movzbl (%edi),%eax
     f1b:	83 ec 04             	sub    $0x4,%esp
     f1e:	83 ef 01             	sub    $0x1,%edi
     f21:	6a 01                	push   $0x1
     f23:	53                   	push   %ebx
     f24:	56                   	push   %esi
     f25:	88 45 d7             	mov    %al,-0x29(%ebp)
     f28:	e8 f5 fe ff ff       	call   e22 <write>
     f2d:	83 c4 10             	add    $0x10,%esp
     f30:	39 df                	cmp    %ebx,%edi
     f32:	75 e4                	jne    f18 <printint+0x68>
     f34:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f37:	5b                   	pop    %ebx
     f38:	5e                   	pop    %esi
     f39:	5f                   	pop    %edi
     f3a:	5d                   	pop    %ebp
     f3b:	c3                   	ret    
     f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f40:	89 d0                	mov    %edx,%eax
     f42:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     f49:	eb 8b                	jmp    ed6 <printint+0x26>
     f4b:	90                   	nop
     f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f50 <printf>:
     f50:	55                   	push   %ebp
     f51:	89 e5                	mov    %esp,%ebp
     f53:	57                   	push   %edi
     f54:	56                   	push   %esi
     f55:	53                   	push   %ebx
     f56:	8d 45 10             	lea    0x10(%ebp),%eax
     f59:	83 ec 2c             	sub    $0x2c,%esp
     f5c:	8b 75 0c             	mov    0xc(%ebp),%esi
     f5f:	8b 7d 08             	mov    0x8(%ebp),%edi
     f62:	89 45 d0             	mov    %eax,-0x30(%ebp)
     f65:	0f b6 1e             	movzbl (%esi),%ebx
     f68:	83 c6 01             	add    $0x1,%esi
     f6b:	84 db                	test   %bl,%bl
     f6d:	0f 84 b0 00 00 00    	je     1023 <printf+0xd3>
     f73:	31 d2                	xor    %edx,%edx
     f75:	eb 39                	jmp    fb0 <printf+0x60>
     f77:	89 f6                	mov    %esi,%esi
     f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     f80:	83 f8 25             	cmp    $0x25,%eax
     f83:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f86:	ba 25 00 00 00       	mov    $0x25,%edx
     f8b:	74 18                	je     fa5 <printf+0x55>
     f8d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     f90:	83 ec 04             	sub    $0x4,%esp
     f93:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     f96:	6a 01                	push   $0x1
     f98:	50                   	push   %eax
     f99:	57                   	push   %edi
     f9a:	e8 83 fe ff ff       	call   e22 <write>
     f9f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     fa2:	83 c4 10             	add    $0x10,%esp
     fa5:	83 c6 01             	add    $0x1,%esi
     fa8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     fac:	84 db                	test   %bl,%bl
     fae:	74 73                	je     1023 <printf+0xd3>
     fb0:	85 d2                	test   %edx,%edx
     fb2:	0f be cb             	movsbl %bl,%ecx
     fb5:	0f b6 c3             	movzbl %bl,%eax
     fb8:	74 c6                	je     f80 <printf+0x30>
     fba:	83 fa 25             	cmp    $0x25,%edx
     fbd:	75 e6                	jne    fa5 <printf+0x55>
     fbf:	83 f8 64             	cmp    $0x64,%eax
     fc2:	0f 84 f8 00 00 00    	je     10c0 <printf+0x170>
     fc8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     fce:	83 f9 70             	cmp    $0x70,%ecx
     fd1:	74 5d                	je     1030 <printf+0xe0>
     fd3:	83 f8 73             	cmp    $0x73,%eax
     fd6:	0f 84 84 00 00 00    	je     1060 <printf+0x110>
     fdc:	83 f8 63             	cmp    $0x63,%eax
     fdf:	0f 84 ea 00 00 00    	je     10cf <printf+0x17f>
     fe5:	83 f8 25             	cmp    $0x25,%eax
     fe8:	0f 84 c2 00 00 00    	je     10b0 <printf+0x160>
     fee:	8d 45 e7             	lea    -0x19(%ebp),%eax
     ff1:	83 ec 04             	sub    $0x4,%esp
     ff4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     ff8:	6a 01                	push   $0x1
     ffa:	50                   	push   %eax
     ffb:	57                   	push   %edi
     ffc:	e8 21 fe ff ff       	call   e22 <write>
    1001:	83 c4 0c             	add    $0xc,%esp
    1004:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1007:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    100a:	6a 01                	push   $0x1
    100c:	50                   	push   %eax
    100d:	57                   	push   %edi
    100e:	83 c6 01             	add    $0x1,%esi
    1011:	e8 0c fe ff ff       	call   e22 <write>
    1016:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    101a:	83 c4 10             	add    $0x10,%esp
    101d:	31 d2                	xor    %edx,%edx
    101f:	84 db                	test   %bl,%bl
    1021:	75 8d                	jne    fb0 <printf+0x60>
    1023:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1026:	5b                   	pop    %ebx
    1027:	5e                   	pop    %esi
    1028:	5f                   	pop    %edi
    1029:	5d                   	pop    %ebp
    102a:	c3                   	ret    
    102b:	90                   	nop
    102c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	b9 10 00 00 00       	mov    $0x10,%ecx
    1038:	6a 00                	push   $0x0
    103a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    103d:	89 f8                	mov    %edi,%eax
    103f:	8b 13                	mov    (%ebx),%edx
    1041:	e8 6a fe ff ff       	call   eb0 <printint>
    1046:	89 d8                	mov    %ebx,%eax
    1048:	83 c4 10             	add    $0x10,%esp
    104b:	31 d2                	xor    %edx,%edx
    104d:	83 c0 04             	add    $0x4,%eax
    1050:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1053:	e9 4d ff ff ff       	jmp    fa5 <printf+0x55>
    1058:	90                   	nop
    1059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1060:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1063:	8b 18                	mov    (%eax),%ebx
    1065:	83 c0 04             	add    $0x4,%eax
    1068:	89 45 d0             	mov    %eax,-0x30(%ebp)
    106b:	b8 74 13 00 00       	mov    $0x1374,%eax
    1070:	85 db                	test   %ebx,%ebx
    1072:	0f 44 d8             	cmove  %eax,%ebx
    1075:	0f b6 03             	movzbl (%ebx),%eax
    1078:	84 c0                	test   %al,%al
    107a:	74 23                	je     109f <printf+0x14f>
    107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1080:	88 45 e3             	mov    %al,-0x1d(%ebp)
    1083:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1086:	83 ec 04             	sub    $0x4,%esp
    1089:	6a 01                	push   $0x1
    108b:	83 c3 01             	add    $0x1,%ebx
    108e:	50                   	push   %eax
    108f:	57                   	push   %edi
    1090:	e8 8d fd ff ff       	call   e22 <write>
    1095:	0f b6 03             	movzbl (%ebx),%eax
    1098:	83 c4 10             	add    $0x10,%esp
    109b:	84 c0                	test   %al,%al
    109d:	75 e1                	jne    1080 <printf+0x130>
    109f:	31 d2                	xor    %edx,%edx
    10a1:	e9 ff fe ff ff       	jmp    fa5 <printf+0x55>
    10a6:	8d 76 00             	lea    0x0(%esi),%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    10b6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    10b9:	6a 01                	push   $0x1
    10bb:	e9 4c ff ff ff       	jmp    100c <printf+0xbc>
    10c0:	83 ec 0c             	sub    $0xc,%esp
    10c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    10c8:	6a 01                	push   $0x1
    10ca:	e9 6b ff ff ff       	jmp    103a <printf+0xea>
    10cf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    10d2:	83 ec 04             	sub    $0x4,%esp
    10d5:	8b 03                	mov    (%ebx),%eax
    10d7:	6a 01                	push   $0x1
    10d9:	88 45 e4             	mov    %al,-0x1c(%ebp)
    10dc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    10df:	50                   	push   %eax
    10e0:	57                   	push   %edi
    10e1:	e8 3c fd ff ff       	call   e22 <write>
    10e6:	e9 5b ff ff ff       	jmp    1046 <printf+0xf6>
    10eb:	66 90                	xchg   %ax,%ax
    10ed:	66 90                	xchg   %ax,%ax
    10ef:	90                   	nop

000010f0 <free>:
    10f0:	55                   	push   %ebp
    10f1:	a1 a4 19 00 00       	mov    0x19a4,%eax
    10f6:	89 e5                	mov    %esp,%ebp
    10f8:	57                   	push   %edi
    10f9:	56                   	push   %esi
    10fa:	53                   	push   %ebx
    10fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    10fe:	8b 10                	mov    (%eax),%edx
    1100:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1103:	39 c8                	cmp    %ecx,%eax
    1105:	73 19                	jae    1120 <free+0x30>
    1107:	89 f6                	mov    %esi,%esi
    1109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1110:	39 d1                	cmp    %edx,%ecx
    1112:	72 1c                	jb     1130 <free+0x40>
    1114:	39 d0                	cmp    %edx,%eax
    1116:	73 18                	jae    1130 <free+0x40>
    1118:	89 d0                	mov    %edx,%eax
    111a:	39 c8                	cmp    %ecx,%eax
    111c:	8b 10                	mov    (%eax),%edx
    111e:	72 f0                	jb     1110 <free+0x20>
    1120:	39 d0                	cmp    %edx,%eax
    1122:	72 f4                	jb     1118 <free+0x28>
    1124:	39 d1                	cmp    %edx,%ecx
    1126:	73 f0                	jae    1118 <free+0x28>
    1128:	90                   	nop
    1129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1130:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1133:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1136:	39 d7                	cmp    %edx,%edi
    1138:	74 19                	je     1153 <free+0x63>
    113a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    113d:	8b 50 04             	mov    0x4(%eax),%edx
    1140:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1143:	39 f1                	cmp    %esi,%ecx
    1145:	74 23                	je     116a <free+0x7a>
    1147:	89 08                	mov    %ecx,(%eax)
    1149:	a3 a4 19 00 00       	mov    %eax,0x19a4
    114e:	5b                   	pop    %ebx
    114f:	5e                   	pop    %esi
    1150:	5f                   	pop    %edi
    1151:	5d                   	pop    %ebp
    1152:	c3                   	ret    
    1153:	03 72 04             	add    0x4(%edx),%esi
    1156:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1159:	8b 10                	mov    (%eax),%edx
    115b:	8b 12                	mov    (%edx),%edx
    115d:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1160:	8b 50 04             	mov    0x4(%eax),%edx
    1163:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1166:	39 f1                	cmp    %esi,%ecx
    1168:	75 dd                	jne    1147 <free+0x57>
    116a:	03 53 fc             	add    -0x4(%ebx),%edx
    116d:	a3 a4 19 00 00       	mov    %eax,0x19a4
    1172:	89 50 04             	mov    %edx,0x4(%eax)
    1175:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1178:	89 10                	mov    %edx,(%eax)
    117a:	5b                   	pop    %ebx
    117b:	5e                   	pop    %esi
    117c:	5f                   	pop    %edi
    117d:	5d                   	pop    %ebp
    117e:	c3                   	ret    
    117f:	90                   	nop

00001180 <malloc>:
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
    1185:	53                   	push   %ebx
    1186:	83 ec 0c             	sub    $0xc,%esp
    1189:	8b 45 08             	mov    0x8(%ebp),%eax
    118c:	8b 15 a4 19 00 00    	mov    0x19a4,%edx
    1192:	8d 78 07             	lea    0x7(%eax),%edi
    1195:	c1 ef 03             	shr    $0x3,%edi
    1198:	83 c7 01             	add    $0x1,%edi
    119b:	85 d2                	test   %edx,%edx
    119d:	0f 84 a3 00 00 00    	je     1246 <malloc+0xc6>
    11a3:	8b 02                	mov    (%edx),%eax
    11a5:	8b 48 04             	mov    0x4(%eax),%ecx
    11a8:	39 cf                	cmp    %ecx,%edi
    11aa:	76 74                	jbe    1220 <malloc+0xa0>
    11ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    11b2:	be 00 10 00 00       	mov    $0x1000,%esi
    11b7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    11be:	0f 43 f7             	cmovae %edi,%esi
    11c1:	ba 00 80 00 00       	mov    $0x8000,%edx
    11c6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    11cc:	0f 46 da             	cmovbe %edx,%ebx
    11cf:	eb 10                	jmp    11e1 <malloc+0x61>
    11d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11d8:	8b 02                	mov    (%edx),%eax
    11da:	8b 48 04             	mov    0x4(%eax),%ecx
    11dd:	39 cf                	cmp    %ecx,%edi
    11df:	76 3f                	jbe    1220 <malloc+0xa0>
    11e1:	39 05 a4 19 00 00    	cmp    %eax,0x19a4
    11e7:	89 c2                	mov    %eax,%edx
    11e9:	75 ed                	jne    11d8 <malloc+0x58>
    11eb:	83 ec 0c             	sub    $0xc,%esp
    11ee:	53                   	push   %ebx
    11ef:	e8 96 fc ff ff       	call   e8a <sbrk>
    11f4:	83 c4 10             	add    $0x10,%esp
    11f7:	83 f8 ff             	cmp    $0xffffffff,%eax
    11fa:	74 1c                	je     1218 <malloc+0x98>
    11fc:	89 70 04             	mov    %esi,0x4(%eax)
    11ff:	83 ec 0c             	sub    $0xc,%esp
    1202:	83 c0 08             	add    $0x8,%eax
    1205:	50                   	push   %eax
    1206:	e8 e5 fe ff ff       	call   10f0 <free>
    120b:	8b 15 a4 19 00 00    	mov    0x19a4,%edx
    1211:	83 c4 10             	add    $0x10,%esp
    1214:	85 d2                	test   %edx,%edx
    1216:	75 c0                	jne    11d8 <malloc+0x58>
    1218:	31 c0                	xor    %eax,%eax
    121a:	eb 1c                	jmp    1238 <malloc+0xb8>
    121c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1220:	39 cf                	cmp    %ecx,%edi
    1222:	74 1c                	je     1240 <malloc+0xc0>
    1224:	29 f9                	sub    %edi,%ecx
    1226:	89 48 04             	mov    %ecx,0x4(%eax)
    1229:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    122c:	89 78 04             	mov    %edi,0x4(%eax)
    122f:	89 15 a4 19 00 00    	mov    %edx,0x19a4
    1235:	83 c0 08             	add    $0x8,%eax
    1238:	8d 65 f4             	lea    -0xc(%ebp),%esp
    123b:	5b                   	pop    %ebx
    123c:	5e                   	pop    %esi
    123d:	5f                   	pop    %edi
    123e:	5d                   	pop    %ebp
    123f:	c3                   	ret    
    1240:	8b 08                	mov    (%eax),%ecx
    1242:	89 0a                	mov    %ecx,(%edx)
    1244:	eb e9                	jmp    122f <malloc+0xaf>
    1246:	c7 05 a4 19 00 00 a8 	movl   $0x19a8,0x19a4
    124d:	19 00 00 
    1250:	c7 05 a8 19 00 00 a8 	movl   $0x19a8,0x19a8
    1257:	19 00 00 
    125a:	b8 a8 19 00 00       	mov    $0x19a8,%eax
    125f:	c7 05 ac 19 00 00 00 	movl   $0x0,0x19ac
    1266:	00 00 00 
    1269:	e9 3e ff ff ff       	jmp    11ac <malloc+0x2c>