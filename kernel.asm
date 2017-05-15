
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4 0f                	in     $0xf,%al

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc d0 b5 10 80       	mov    $0x8010b5d0,%esp
8010002d:	b8 a0 2e 10 80       	mov    $0x80102ea0,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 c0 6d 10 80       	push   $0x80106dc0
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 45 41 00 00       	call   801041a0 <initlock>
8010005b:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
80100062:	fc 10 80 
80100065:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
80100092:	68 c7 6d 10 80       	push   $0x80106dc7
80100097:	50                   	push   %eax
80100098:	e8 f3 3f 00 00       	call   80104090 <initsleeplock>
8010009d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
801000b6:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 e0 b5 10 80       	push   $0x8010b5e0
801000e4:	e8 37 41 00 00       	call   80104220 <acquire>
801000e9:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 b5 10 80       	push   $0x8010b5e0
80100162:	e8 e9 41 00 00       	call   80104350 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 5e 3f 00 00       	call   801040d0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 8d 1f 00 00       	call   80102110 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 ce 6d 10 80       	push   $0x80106dce
80100198:	e8 c3 01 00 00       	call   80100360 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 bd 3f 00 00       	call   80104170 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 47 1f 00 00       	jmp    80102110 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 df 6d 10 80       	push   $0x80106ddf
801001d1:	e8 8a 01 00 00       	call   80100360 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 7c 3f 00 00       	call   80104170 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 2c 3f 00 00       	call   80104130 <releasesleep>
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 10 40 00 00       	call   80104220 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100237:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
8010024f:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 ef 40 00 00       	jmp    80104350 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 e6 6d 10 80       	push   $0x80106de6
80100269:	e8 f2 00 00 00       	call   80100360 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 1c             	sub    $0x1c,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	89 3c 24             	mov    %edi,(%esp)
80100282:	e8 f9 14 00 00       	call   80101780 <iunlock>
  target = n;
  acquire(&cons.lock);
80100287:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028e:	e8 8d 3f 00 00       	call   80104220 <acquire>
  while(n > 0){
80100293:	8b 55 10             	mov    0x10(%ebp),%edx
80100296:	85 d2                	test   %edx,%edx
80100298:	0f 8e bc 00 00 00    	jle    8010035a <consoleread+0xea>
8010029e:	8b 5d 10             	mov    0x10(%ebp),%ebx
801002a1:	eb 26                	jmp    801002c9 <consoleread+0x59>
801002a3:	90                   	nop
801002a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(input.r == input.w){
      if(proc->killed){
801002a8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002ae:	8b 40 24             	mov    0x24(%eax),%eax
801002b1:	85 c0                	test   %eax,%eax
801002b3:	75 73                	jne    80100328 <consoleread+0xb8>
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b5:	c7 44 24 04 20 a5 10 	movl   $0x8010a520,0x4(%esp)
801002bc:	80 
801002bd:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
801002c4:	e8 77 3a 00 00       	call   80103d40 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c9:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002ce:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d4:	74 d2                	je     801002a8 <consoleread+0x38>
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
801002d6:	8d 50 01             	lea    0x1(%eax),%edx
801002d9:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
801002df:	89 c2                	mov    %eax,%edx
801002e1:	83 e2 7f             	and    $0x7f,%edx
801002e4:	0f b6 8a 40 ff 10 80 	movzbl -0x7fef00c0(%edx),%ecx
801002eb:	0f be d1             	movsbl %cl,%edx
    if(c == C('D')){  // EOF
801002ee:	83 fa 04             	cmp    $0x4,%edx
801002f1:	74 56                	je     80100349 <consoleread+0xd9>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
801002f3:	83 c6 01             	add    $0x1,%esi
    --n;
801002f6:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
801002f9:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
801002fc:	88 4e ff             	mov    %cl,-0x1(%esi)
    --n;
    if(c == '\n')
801002ff:	74 52                	je     80100353 <consoleread+0xe3>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100301:	85 db                	test   %ebx,%ebx
80100303:	75 c4                	jne    801002c9 <consoleread+0x59>
80100305:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
80100308:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010030f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100312:	e8 39 40 00 00       	call   80104350 <release>
  ilock(ip);
80100317:	89 3c 24             	mov    %edi,(%esp)
8010031a:	e8 91 13 00 00       	call   801016b0 <ilock>
8010031f:	8b 45 e4             	mov    -0x1c(%ebp),%eax

  return target - n;
80100322:	eb 1d                	jmp    80100341 <consoleread+0xd1>
80100324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
      if(proc->killed){
        release(&cons.lock);
80100328:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010032f:	e8 1c 40 00 00       	call   80104350 <release>
        ilock(ip);
80100334:	89 3c 24             	mov    %edi,(%esp)
80100337:	e8 74 13 00 00       	call   801016b0 <ilock>
        return -1;
8010033c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
80100341:	83 c4 1c             	add    $0x1c,%esp
80100344:	5b                   	pop    %ebx
80100345:	5e                   	pop    %esi
80100346:	5f                   	pop    %edi
80100347:	5d                   	pop    %ebp
80100348:	c3                   	ret    
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
80100349:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010034c:	76 05                	jbe    80100353 <consoleread+0xe3>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
8010034e:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100353:	8b 45 10             	mov    0x10(%ebp),%eax
80100356:	29 d8                	sub    %ebx,%eax
80100358:	eb ae                	jmp    80100308 <consoleread+0x98>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
8010035a:	31 c0                	xor    %eax,%eax
8010035c:	eb aa                	jmp    80100308 <consoleread+0x98>
8010035e:	66 90                	xchg   %ax,%ax

80100360 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100360:	55                   	push   %ebp
80100361:	89 e5                	mov    %esp,%ebp
80100363:	56                   	push   %esi
80100364:	53                   	push   %ebx
80100365:	83 ec 40             	sub    $0x40,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100368:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
80100369:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
8010036f:	8d 5d d0             	lea    -0x30(%ebp),%ebx
{
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
80100372:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100379:	00 00 00 
8010037c:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
8010037f:	0f b6 00             	movzbl (%eax),%eax
80100382:	c7 04 24 ed 6d 10 80 	movl   $0x80106ded,(%esp)
80100389:	89 44 24 04          	mov    %eax,0x4(%esp)
8010038d:	e8 be 02 00 00       	call   80100650 <cprintf>
  cprintf(s);
80100392:	8b 45 08             	mov    0x8(%ebp),%eax
80100395:	89 04 24             	mov    %eax,(%esp)
80100398:	e8 b3 02 00 00       	call   80100650 <cprintf>
  cprintf("\n");
8010039d:	c7 04 24 e6 72 10 80 	movl   $0x801072e6,(%esp)
801003a4:	e8 a7 02 00 00       	call   80100650 <cprintf>
  getcallerpcs(&s, pcs);
801003a9:	8d 45 08             	lea    0x8(%ebp),%eax
801003ac:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801003b0:	89 04 24             	mov    %eax,(%esp)
801003b3:	e8 08 3e 00 00       	call   801041c0 <getcallerpcs>
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003b8:	8b 03                	mov    (%ebx),%eax
801003ba:	83 c3 04             	add    $0x4,%ebx
801003bd:	c7 04 24 09 6e 10 80 	movl   $0x80106e09,(%esp)
801003c4:	89 44 24 04          	mov    %eax,0x4(%esp)
801003c8:	e8 83 02 00 00       	call   80100650 <cprintf>
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003cd:	39 f3                	cmp    %esi,%ebx
801003cf:	75 e7                	jne    801003b8 <panic+0x58>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003d1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003d8:	00 00 00 
801003db:	eb fe                	jmp    801003db <panic+0x7b>
801003dd:	8d 76 00             	lea    0x0(%esi),%esi

801003e0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003e0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003e6:	85 d2                	test   %edx,%edx
801003e8:	74 06                	je     801003f0 <consputc+0x10>
801003ea:	fa                   	cli    
801003eb:	eb fe                	jmp    801003eb <consputc+0xb>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
801003f0:	55                   	push   %ebp
801003f1:	89 e5                	mov    %esp,%ebp
801003f3:	57                   	push   %edi
801003f4:	56                   	push   %esi
801003f5:	53                   	push   %ebx
801003f6:	89 c3                	mov    %eax,%ebx
801003f8:	83 ec 1c             	sub    $0x1c,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
801003fb:	3d 00 01 00 00       	cmp    $0x100,%eax
80100400:	0f 84 ac 00 00 00    	je     801004b2 <consputc+0xd2>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100406:	89 04 24             	mov    %eax,(%esp)
80100409:	e8 e2 54 00 00       	call   801058f0 <uartputc>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010040e:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100413:	b8 0e 00 00 00       	mov    $0xe,%eax
80100418:	89 fa                	mov    %edi,%edx
8010041a:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010041b:	be d5 03 00 00       	mov    $0x3d5,%esi
80100420:	89 f2                	mov    %esi,%edx
80100422:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100423:	0f b6 c8             	movzbl %al,%ecx
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100426:	89 fa                	mov    %edi,%edx
80100428:	c1 e1 08             	shl    $0x8,%ecx
8010042b:	b8 0f 00 00 00       	mov    $0xf,%eax
80100430:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100431:	89 f2                	mov    %esi,%edx
80100433:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
80100434:	0f b6 c0             	movzbl %al,%eax
80100437:	09 c1                	or     %eax,%ecx

  if(c == '\n')
80100439:	83 fb 0a             	cmp    $0xa,%ebx
8010043c:	0f 84 0d 01 00 00    	je     8010054f <consputc+0x16f>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100442:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
80100448:	0f 84 e8 00 00 00    	je     80100536 <consputc+0x156>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
8010044e:	0f b6 db             	movzbl %bl,%ebx
80100451:	80 cf 07             	or     $0x7,%bh
80100454:	8d 79 01             	lea    0x1(%ecx),%edi
80100457:	66 89 9c 09 00 80 0b 	mov    %bx,-0x7ff48000(%ecx,%ecx,1)
8010045e:	80 

  if(pos < 0 || pos > 25*80)
8010045f:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
80100465:	0f 87 bf 00 00 00    	ja     8010052a <consputc+0x14a>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
8010046b:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100471:	7f 68                	jg     801004db <consputc+0xfb>
80100473:	89 f8                	mov    %edi,%eax
80100475:	89 fb                	mov    %edi,%ebx
80100477:	c1 e8 08             	shr    $0x8,%eax
8010047a:	89 c6                	mov    %eax,%esi
8010047c:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100483:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100488:	b8 0e 00 00 00       	mov    $0xe,%eax
8010048d:	89 fa                	mov    %edi,%edx
8010048f:	ee                   	out    %al,(%dx)
80100490:	89 f0                	mov    %esi,%eax
80100492:	b2 d5                	mov    $0xd5,%dl
80100494:	ee                   	out    %al,(%dx)
80100495:	b8 0f 00 00 00       	mov    $0xf,%eax
8010049a:	89 fa                	mov    %edi,%edx
8010049c:	ee                   	out    %al,(%dx)
8010049d:	89 d8                	mov    %ebx,%eax
8010049f:	b2 d5                	mov    $0xd5,%dl
801004a1:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004a2:	b8 20 07 00 00       	mov    $0x720,%eax
801004a7:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004aa:	83 c4 1c             	add    $0x1c,%esp
801004ad:	5b                   	pop    %ebx
801004ae:	5e                   	pop    %esi
801004af:	5f                   	pop    %edi
801004b0:	5d                   	pop    %ebp
801004b1:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004b2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004b9:	e8 32 54 00 00       	call   801058f0 <uartputc>
801004be:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004c5:	e8 26 54 00 00       	call   801058f0 <uartputc>
801004ca:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004d1:	e8 1a 54 00 00       	call   801058f0 <uartputc>
801004d6:	e9 33 ff ff ff       	jmp    8010040e <consputc+0x2e>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004db:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
801004e2:	00 
    pos -= 80;
801004e3:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004e6:	c7 44 24 04 a0 80 0b 	movl   $0x800b80a0,0x4(%esp)
801004ed:	80 
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801004ee:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f5:	c7 04 24 00 80 0b 80 	movl   $0x800b8000,(%esp)
801004fc:	e8 4f 3f 00 00       	call   80104450 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100501:	b8 d0 07 00 00       	mov    $0x7d0,%eax
80100506:	29 f8                	sub    %edi,%eax
80100508:	01 c0                	add    %eax,%eax
8010050a:	89 34 24             	mov    %esi,(%esp)
8010050d:	89 44 24 08          	mov    %eax,0x8(%esp)
80100511:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100518:	00 
80100519:	e8 82 3e 00 00       	call   801043a0 <memset>
8010051e:	89 f1                	mov    %esi,%ecx
80100520:	be 07 00 00 00       	mov    $0x7,%esi
80100525:	e9 59 ff ff ff       	jmp    80100483 <consputc+0xa3>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010052a:	c7 04 24 0d 6e 10 80 	movl   $0x80106e0d,(%esp)
80100531:	e8 2a fe ff ff       	call   80100360 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
80100536:	85 c9                	test   %ecx,%ecx
80100538:	8d 79 ff             	lea    -0x1(%ecx),%edi
8010053b:	0f 85 1e ff ff ff    	jne    8010045f <consputc+0x7f>
80100541:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
80100546:	31 db                	xor    %ebx,%ebx
80100548:	31 f6                	xor    %esi,%esi
8010054a:	e9 34 ff ff ff       	jmp    80100483 <consputc+0xa3>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
8010054f:	89 c8                	mov    %ecx,%eax
80100551:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100556:	f7 ea                	imul   %edx
80100558:	c1 ea 05             	shr    $0x5,%edx
8010055b:	8d 04 92             	lea    (%edx,%edx,4),%eax
8010055e:	c1 e0 04             	shl    $0x4,%eax
80100561:	8d 78 50             	lea    0x50(%eax),%edi
80100564:	e9 f6 fe ff ff       	jmp    8010045f <consputc+0x7f>
80100569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100570 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100570:	55                   	push   %ebp
80100571:	89 e5                	mov    %esp,%ebp
80100573:	57                   	push   %edi
80100574:	56                   	push   %esi
80100575:	89 d6                	mov    %edx,%esi
80100577:	53                   	push   %ebx
80100578:	83 ec 1c             	sub    $0x1c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010057b:	85 c9                	test   %ecx,%ecx
8010057d:	74 61                	je     801005e0 <printint+0x70>
8010057f:	85 c0                	test   %eax,%eax
80100581:	79 5d                	jns    801005e0 <printint+0x70>
    x = -xx;
80100583:	f7 d8                	neg    %eax
80100585:	bf 01 00 00 00       	mov    $0x1,%edi
  else
    x = xx;

  i = 0;
8010058a:	31 c9                	xor    %ecx,%ecx
8010058c:	eb 04                	jmp    80100592 <printint+0x22>
8010058e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
80100590:	89 d9                	mov    %ebx,%ecx
80100592:	31 d2                	xor    %edx,%edx
80100594:	f7 f6                	div    %esi
80100596:	8d 59 01             	lea    0x1(%ecx),%ebx
80100599:	0f b6 92 38 6e 10 80 	movzbl -0x7fef91c8(%edx),%edx
  }while((x /= base) != 0);
801005a0:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005a2:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
  }while((x /= base) != 0);
801005a6:	75 e8                	jne    80100590 <printint+0x20>

  if(sign)
801005a8:	85 ff                	test   %edi,%edi
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005aa:	89 d8                	mov    %ebx,%eax
  }while((x /= base) != 0);

  if(sign)
801005ac:	74 08                	je     801005b6 <printint+0x46>
    buf[i++] = '-';
801005ae:	8d 59 02             	lea    0x2(%ecx),%ebx
801005b1:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
801005b6:	83 eb 01             	sub    $0x1,%ebx
801005b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    consputc(buf[i]);
801005c0:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005c5:	83 eb 01             	sub    $0x1,%ebx
    consputc(buf[i]);
801005c8:	e8 13 fe ff ff       	call   801003e0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005cd:	83 fb ff             	cmp    $0xffffffff,%ebx
801005d0:	75 ee                	jne    801005c0 <printint+0x50>
    consputc(buf[i]);
}
801005d2:	83 c4 1c             	add    $0x1c,%esp
801005d5:	5b                   	pop    %ebx
801005d6:	5e                   	pop    %esi
801005d7:	5f                   	pop    %edi
801005d8:	5d                   	pop    %ebp
801005d9:	c3                   	ret    
801005da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
  else
    x = xx;
801005e0:	31 ff                	xor    %edi,%edi
801005e2:	eb a6                	jmp    8010058a <printint+0x1a>
801005e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801005f0 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
801005f0:	55                   	push   %ebp
801005f1:	89 e5                	mov    %esp,%ebp
801005f3:	57                   	push   %edi
801005f4:	56                   	push   %esi
801005f5:	53                   	push   %ebx
801005f6:	83 ec 1c             	sub    $0x1c,%esp
  int i;

  iunlock(ip);
801005f9:	8b 45 08             	mov    0x8(%ebp),%eax
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
801005fc:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
801005ff:	89 04 24             	mov    %eax,(%esp)
80100602:	e8 79 11 00 00       	call   80101780 <iunlock>
  acquire(&cons.lock);
80100607:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010060e:	e8 0d 3c 00 00       	call   80104220 <acquire>
80100613:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100616:	85 f6                	test   %esi,%esi
80100618:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010061b:	7e 12                	jle    8010062f <consolewrite+0x3f>
8010061d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100620:	0f b6 07             	movzbl (%edi),%eax
80100623:	83 c7 01             	add    $0x1,%edi
80100626:	e8 b5 fd ff ff       	call   801003e0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010062b:	39 df                	cmp    %ebx,%edi
8010062d:	75 f1                	jne    80100620 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010062f:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100636:	e8 15 3d 00 00       	call   80104350 <release>
  ilock(ip);
8010063b:	8b 45 08             	mov    0x8(%ebp),%eax
8010063e:	89 04 24             	mov    %eax,(%esp)
80100641:	e8 6a 10 00 00       	call   801016b0 <ilock>

  return n;
}
80100646:	83 c4 1c             	add    $0x1c,%esp
80100649:	89 f0                	mov    %esi,%eax
8010064b:	5b                   	pop    %ebx
8010064c:	5e                   	pop    %esi
8010064d:	5f                   	pop    %edi
8010064e:	5d                   	pop    %ebp
8010064f:	c3                   	ret    

80100650 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100650:	55                   	push   %ebp
80100651:	89 e5                	mov    %esp,%ebp
80100653:	57                   	push   %edi
80100654:	56                   	push   %esi
80100655:	53                   	push   %ebx
80100656:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100659:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010065e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100660:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100663:	0f 85 27 01 00 00    	jne    80100790 <cprintf+0x140>
    acquire(&cons.lock);

  if (fmt == 0)
80100669:	8b 45 08             	mov    0x8(%ebp),%eax
8010066c:	85 c0                	test   %eax,%eax
8010066e:	89 c1                	mov    %eax,%ecx
80100670:	0f 84 2b 01 00 00    	je     801007a1 <cprintf+0x151>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100676:	0f b6 00             	movzbl (%eax),%eax
80100679:	31 db                	xor    %ebx,%ebx
8010067b:	89 cf                	mov    %ecx,%edi
8010067d:	8d 75 0c             	lea    0xc(%ebp),%esi
80100680:	85 c0                	test   %eax,%eax
80100682:	75 4c                	jne    801006d0 <cprintf+0x80>
80100684:	eb 5f                	jmp    801006e5 <cprintf+0x95>
80100686:	66 90                	xchg   %ax,%ax
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
80100688:	83 c3 01             	add    $0x1,%ebx
8010068b:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
8010068f:	85 d2                	test   %edx,%edx
80100691:	74 52                	je     801006e5 <cprintf+0x95>
      break;
    switch(c){
80100693:	83 fa 70             	cmp    $0x70,%edx
80100696:	74 72                	je     8010070a <cprintf+0xba>
80100698:	7f 66                	jg     80100700 <cprintf+0xb0>
8010069a:	83 fa 25             	cmp    $0x25,%edx
8010069d:	8d 76 00             	lea    0x0(%esi),%esi
801006a0:	0f 84 a2 00 00 00    	je     80100748 <cprintf+0xf8>
801006a6:	83 fa 64             	cmp    $0x64,%edx
801006a9:	75 7d                	jne    80100728 <cprintf+0xd8>
    case 'd':
      printint(*argp++, 10, 1);
801006ab:	8d 46 04             	lea    0x4(%esi),%eax
801006ae:	b9 01 00 00 00       	mov    $0x1,%ecx
801006b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006b6:	8b 06                	mov    (%esi),%eax
801006b8:	ba 0a 00 00 00       	mov    $0xa,%edx
801006bd:	e8 ae fe ff ff       	call   80100570 <printint>
801006c2:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006c5:	83 c3 01             	add    $0x1,%ebx
801006c8:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006cc:	85 c0                	test   %eax,%eax
801006ce:	74 15                	je     801006e5 <cprintf+0x95>
    if(c != '%'){
801006d0:	83 f8 25             	cmp    $0x25,%eax
801006d3:	74 b3                	je     80100688 <cprintf+0x38>
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
      consputc(c);
801006d5:	e8 06 fd ff ff       	call   801003e0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006da:	83 c3 01             	add    $0x1,%ebx
801006dd:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e1:	85 c0                	test   %eax,%eax
801006e3:	75 eb                	jne    801006d0 <cprintf+0x80>
      consputc(c);
      break;
    }
  }

  if(locking)
801006e5:	8b 45 e0             	mov    -0x20(%ebp),%eax
801006e8:	85 c0                	test   %eax,%eax
801006ea:	74 0c                	je     801006f8 <cprintf+0xa8>
    release(&cons.lock);
801006ec:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801006f3:	e8 58 3c 00 00       	call   80104350 <release>
}
801006f8:	83 c4 1c             	add    $0x1c,%esp
801006fb:	5b                   	pop    %ebx
801006fc:	5e                   	pop    %esi
801006fd:	5f                   	pop    %edi
801006fe:	5d                   	pop    %ebp
801006ff:	c3                   	ret    
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100700:	83 fa 73             	cmp    $0x73,%edx
80100703:	74 53                	je     80100758 <cprintf+0x108>
80100705:	83 fa 78             	cmp    $0x78,%edx
80100708:	75 1e                	jne    80100728 <cprintf+0xd8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010070a:	8d 46 04             	lea    0x4(%esi),%eax
8010070d:	31 c9                	xor    %ecx,%ecx
8010070f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100712:	8b 06                	mov    (%esi),%eax
80100714:	ba 10 00 00 00       	mov    $0x10,%edx
80100719:	e8 52 fe ff ff       	call   80100570 <printint>
8010071e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100721:	eb a2                	jmp    801006c5 <cprintf+0x75>
80100723:	90                   	nop
80100724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100728:	b8 25 00 00 00       	mov    $0x25,%eax
8010072d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100730:	e8 ab fc ff ff       	call   801003e0 <consputc>
      consputc(c);
80100735:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100738:	89 d0                	mov    %edx,%eax
8010073a:	e8 a1 fc ff ff       	call   801003e0 <consputc>
8010073f:	eb 99                	jmp    801006da <cprintf+0x8a>
80100741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	e8 8e fc ff ff       	call   801003e0 <consputc>
      break;
80100752:	e9 6e ff ff ff       	jmp    801006c5 <cprintf+0x75>
80100757:	90                   	nop
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100758:	8d 46 04             	lea    0x4(%esi),%eax
8010075b:	8b 36                	mov    (%esi),%esi
8010075d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100760:	b8 20 6e 10 80       	mov    $0x80106e20,%eax
80100765:	85 f6                	test   %esi,%esi
80100767:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
8010076a:	0f be 06             	movsbl (%esi),%eax
8010076d:	84 c0                	test   %al,%al
8010076f:	74 16                	je     80100787 <cprintf+0x137>
80100771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100778:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
8010077b:	e8 60 fc ff ff       	call   801003e0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
80100780:	0f be 06             	movsbl (%esi),%eax
80100783:	84 c0                	test   %al,%al
80100785:	75 f1                	jne    80100778 <cprintf+0x128>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100787:	8b 75 e4             	mov    -0x1c(%ebp),%esi
8010078a:	e9 36 ff ff ff       	jmp    801006c5 <cprintf+0x75>
8010078f:	90                   	nop
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
80100790:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100797:	e8 84 3a 00 00       	call   80104220 <acquire>
8010079c:	e9 c8 fe ff ff       	jmp    80100669 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007a1:	c7 04 24 27 6e 10 80 	movl   $0x80106e27,(%esp)
801007a8:	e8 b3 fb ff ff       	call   80100360 <panic>
801007ad:	8d 76 00             	lea    0x0(%esi),%esi

801007b0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007b0:	55                   	push   %ebp
801007b1:	89 e5                	mov    %esp,%ebp
801007b3:	57                   	push   %edi
801007b4:	56                   	push   %esi
  int c, doprocdump = 0;
801007b5:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007b7:	53                   	push   %ebx
801007b8:	83 ec 1c             	sub    $0x1c,%esp
801007bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007be:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801007c5:	e8 56 3a 00 00       	call   80104220 <acquire>
801007ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  while((c = getc()) >= 0){
801007d0:	ff d3                	call   *%ebx
801007d2:	85 c0                	test   %eax,%eax
801007d4:	89 c7                	mov    %eax,%edi
801007d6:	78 48                	js     80100820 <consoleintr+0x70>
    switch(c){
801007d8:	83 ff 10             	cmp    $0x10,%edi
801007db:	0f 84 2f 01 00 00    	je     80100910 <consoleintr+0x160>
801007e1:	7e 5d                	jle    80100840 <consoleintr+0x90>
801007e3:	83 ff 15             	cmp    $0x15,%edi
801007e6:	0f 84 d4 00 00 00    	je     801008c0 <consoleintr+0x110>
801007ec:	83 ff 7f             	cmp    $0x7f,%edi
801007ef:	90                   	nop
801007f0:	75 53                	jne    80100845 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
801007f2:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
801007f7:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801007fd:	74 d1                	je     801007d0 <consoleintr+0x20>
        input.e--;
801007ff:	83 e8 01             	sub    $0x1,%eax
80100802:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100807:	b8 00 01 00 00       	mov    $0x100,%eax
8010080c:	e8 cf fb ff ff       	call   801003e0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100811:	ff d3                	call   *%ebx
80100813:	85 c0                	test   %eax,%eax
80100815:	89 c7                	mov    %eax,%edi
80100817:	79 bf                	jns    801007d8 <consoleintr+0x28>
80100819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100820:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100827:	e8 24 3b 00 00       	call   80104350 <release>
  if(doprocdump) {
8010082c:	85 f6                	test   %esi,%esi
8010082e:	0f 85 ec 00 00 00    	jne    80100920 <consoleintr+0x170>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100834:	83 c4 1c             	add    $0x1c,%esp
80100837:	5b                   	pop    %ebx
80100838:	5e                   	pop    %esi
80100839:	5f                   	pop    %edi
8010083a:	5d                   	pop    %ebp
8010083b:	c3                   	ret    
8010083c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100840:	83 ff 08             	cmp    $0x8,%edi
80100843:	74 ad                	je     801007f2 <consoleintr+0x42>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100845:	85 ff                	test   %edi,%edi
80100847:	74 87                	je     801007d0 <consoleintr+0x20>
80100849:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010084e:	89 c2                	mov    %eax,%edx
80100850:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100856:	83 fa 7f             	cmp    $0x7f,%edx
80100859:	0f 87 71 ff ff ff    	ja     801007d0 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010085f:	8d 50 01             	lea    0x1(%eax),%edx
80100862:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
80100865:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
80100868:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
8010086e:	0f 84 b8 00 00 00    	je     8010092c <consoleintr+0x17c>
        input.buf[input.e++ % INPUT_BUF] = c;
80100874:	89 f9                	mov    %edi,%ecx
80100876:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
        consputc(c);
8010087c:	89 f8                	mov    %edi,%eax
8010087e:	e8 5d fb ff ff       	call   801003e0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
80100883:	83 ff 04             	cmp    $0x4,%edi
80100886:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010088b:	74 19                	je     801008a6 <consoleintr+0xf6>
8010088d:	83 ff 0a             	cmp    $0xa,%edi
80100890:	74 14                	je     801008a6 <consoleintr+0xf6>
80100892:	8b 0d c0 ff 10 80    	mov    0x8010ffc0,%ecx
80100898:	8d 91 80 00 00 00    	lea    0x80(%ecx),%edx
8010089e:	39 d0                	cmp    %edx,%eax
801008a0:	0f 85 2a ff ff ff    	jne    801007d0 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008a6:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ad:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
          wakeup(&input.r);
801008b2:	e8 29 36 00 00       	call   80103ee0 <wakeup>
801008b7:	e9 14 ff ff ff       	jmp    801007d0 <consoleintr+0x20>
801008bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
801008c0:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
801008c5:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801008cb:	75 2b                	jne    801008f8 <consoleintr+0x148>
801008cd:	e9 fe fe ff ff       	jmp    801007d0 <consoleintr+0x20>
801008d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
801008d8:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
801008dd:	b8 00 01 00 00       	mov    $0x100,%eax
801008e2:	e8 f9 fa ff ff       	call   801003e0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
801008e7:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
801008ec:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801008f2:	0f 84 d8 fe ff ff    	je     801007d0 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
801008f8:	83 e8 01             	sub    $0x1,%eax
801008fb:	89 c2                	mov    %eax,%edx
801008fd:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100900:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
80100907:	75 cf                	jne    801008d8 <consoleintr+0x128>
80100909:	e9 c2 fe ff ff       	jmp    801007d0 <consoleintr+0x20>
8010090e:	66 90                	xchg   %ax,%ax
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100910:	be 01 00 00 00       	mov    $0x1,%esi
80100915:	e9 b6 fe ff ff       	jmp    801007d0 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100920:	83 c4 1c             	add    $0x1c,%esp
80100923:	5b                   	pop    %ebx
80100924:	5e                   	pop    %esi
80100925:	5f                   	pop    %edi
80100926:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100927:	e9 94 36 00 00       	jmp    80103fc0 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010092c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
        consputc(c);
80100933:	b8 0a 00 00 00       	mov    $0xa,%eax
80100938:	e8 a3 fa ff ff       	call   801003e0 <consputc>
8010093d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100942:	e9 5f ff ff ff       	jmp    801008a6 <consoleintr+0xf6>
80100947:	89 f6                	mov    %esi,%esi
80100949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100950 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
80100950:	55                   	push   %ebp
80100951:	89 e5                	mov    %esp,%ebp
80100953:	83 ec 18             	sub    $0x18,%esp
  initlock(&cons.lock, "console");
80100956:	c7 44 24 04 30 6e 10 	movl   $0x80106e30,0x4(%esp)
8010095d:	80 
8010095e:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100965:	e8 36 38 00 00       	call   801041a0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
8010096a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
80100971:	c7 05 8c 09 11 80 f0 	movl   $0x801005f0,0x8011098c
80100978:	05 10 80 
  devsw[CONSOLE].read = consoleread;
8010097b:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
80100982:	02 10 80 
  cons.locking = 1;
80100985:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
8010098c:	00 00 00 

  picenable(IRQ_KBD);
8010098f:	e8 ac 28 00 00       	call   80103240 <picenable>
  ioapicenable(IRQ_KBD, 0);
80100994:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010099b:	00 
8010099c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801009a3:	e8 08 19 00 00       	call   801022b0 <ioapicenable>
}
801009a8:	c9                   	leave  
801009a9:	c3                   	ret    
801009aa:	66 90                	xchg   %ax,%ax
801009ac:	66 90                	xchg   %ax,%ax
801009ae:	66 90                	xchg   %ax,%ax

801009b0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009b0:	55                   	push   %ebp
801009b1:	89 e5                	mov    %esp,%ebp
801009b3:	57                   	push   %edi
801009b4:	56                   	push   %esi
801009b5:	53                   	push   %ebx
801009b6:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  begin_op();
801009bc:	e8 cf 21 00 00       	call   80102b90 <begin_op>

  if((ip = namei(path)) == 0){
801009c1:	8b 45 08             	mov    0x8(%ebp),%eax
801009c4:	89 04 24             	mov    %eax,(%esp)
801009c7:	e8 14 15 00 00       	call   80101ee0 <namei>
801009cc:	85 c0                	test   %eax,%eax
801009ce:	89 c3                	mov    %eax,%ebx
801009d0:	74 37                	je     80100a09 <exec+0x59>
    end_op();
    return -1;
  }
  ilock(ip);
801009d2:	89 04 24             	mov    %eax,(%esp)
801009d5:	e8 d6 0c 00 00       	call   801016b0 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
801009da:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
801009e0:	c7 44 24 0c 34 00 00 	movl   $0x34,0xc(%esp)
801009e7:	00 
801009e8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801009ef:	00 
801009f0:	89 44 24 04          	mov    %eax,0x4(%esp)
801009f4:	89 1c 24             	mov    %ebx,(%esp)
801009f7:	e8 44 0f 00 00       	call   80101940 <readi>
801009fc:	83 f8 34             	cmp    $0x34,%eax
801009ff:	74 1f                	je     80100a20 <exec+0x70>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a01:	89 1c 24             	mov    %ebx,(%esp)
80100a04:	e8 e7 0e 00 00       	call   801018f0 <iunlockput>
    end_op();
80100a09:	e8 f2 21 00 00       	call   80102c00 <end_op>
  }
  return -1;
80100a0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a13:	81 c4 1c 01 00 00    	add    $0x11c,%esp
80100a19:	5b                   	pop    %ebx
80100a1a:	5e                   	pop    %esi
80100a1b:	5f                   	pop    %edi
80100a1c:	5d                   	pop    %ebp
80100a1d:	c3                   	ret    
80100a1e:	66 90                	xchg   %ax,%ax
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a20:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a27:	45 4c 46 
80100a2a:	75 d5                	jne    80100a01 <exec+0x51>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a2c:	e8 3f 5d 00 00       	call   80106770 <setupkvm>
80100a31:	85 c0                	test   %eax,%eax
80100a33:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a39:	74 c6                	je     80100a01 <exec+0x51>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a3b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a42:	00 
80100a43:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi

  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
80100a49:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a50:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a53:	0f 84 da 00 00 00    	je     80100b33 <exec+0x183>
80100a59:	31 ff                	xor    %edi,%edi
80100a5b:	eb 18                	jmp    80100a75 <exec+0xc5>
80100a5d:	8d 76 00             	lea    0x0(%esi),%esi
80100a60:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100a67:	83 c7 01             	add    $0x1,%edi
80100a6a:	83 c6 20             	add    $0x20,%esi
80100a6d:	39 f8                	cmp    %edi,%eax
80100a6f:	0f 8e be 00 00 00    	jle    80100b33 <exec+0x183>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100a75:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100a7b:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
80100a82:	00 
80100a83:	89 74 24 08          	mov    %esi,0x8(%esp)
80100a87:	89 44 24 04          	mov    %eax,0x4(%esp)
80100a8b:	89 1c 24             	mov    %ebx,(%esp)
80100a8e:	e8 ad 0e 00 00       	call   80101940 <readi>
80100a93:	83 f8 20             	cmp    $0x20,%eax
80100a96:	0f 85 84 00 00 00    	jne    80100b20 <exec+0x170>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100a9c:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100aa3:	75 bb                	jne    80100a60 <exec+0xb0>
      continue;
    if(ph.memsz < ph.filesz)
80100aa5:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100aab:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ab1:	72 6d                	jb     80100b20 <exec+0x170>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100ab3:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ab9:	72 65                	jb     80100b20 <exec+0x170>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100abb:	89 44 24 08          	mov    %eax,0x8(%esp)
80100abf:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100ac5:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ac9:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100acf:	89 04 24             	mov    %eax,(%esp)
80100ad2:	e8 69 5f 00 00       	call   80106a40 <allocuvm>
80100ad7:	85 c0                	test   %eax,%eax
80100ad9:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100adf:	74 3f                	je     80100b20 <exec+0x170>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100ae1:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100ae7:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100aec:	75 32                	jne    80100b20 <exec+0x170>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100aee:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
80100af4:	89 44 24 04          	mov    %eax,0x4(%esp)
80100af8:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100afe:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80100b02:	89 54 24 10          	mov    %edx,0x10(%esp)
80100b06:	8b 95 08 ff ff ff    	mov    -0xf8(%ebp),%edx
80100b0c:	89 04 24             	mov    %eax,(%esp)
80100b0f:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100b13:	e8 68 5e 00 00       	call   80106980 <loaduvm>
80100b18:	85 c0                	test   %eax,%eax
80100b1a:	0f 89 40 ff ff ff    	jns    80100a60 <exec+0xb0>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b20:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b26:	89 04 24             	mov    %eax,(%esp)
80100b29:	e8 22 60 00 00       	call   80106b50 <freevm>
80100b2e:	e9 ce fe ff ff       	jmp    80100a01 <exec+0x51>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b33:	89 1c 24             	mov    %ebx,(%esp)
80100b36:	e8 b5 0d 00 00       	call   801018f0 <iunlockput>
80100b3b:	90                   	nop
80100b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  end_op();
80100b40:	e8 bb 20 00 00       	call   80102c00 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b45:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b4b:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b50:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b55:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b5b:	89 44 24 04          	mov    %eax,0x4(%esp)
80100b5f:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b65:	89 54 24 08          	mov    %edx,0x8(%esp)
80100b69:	89 04 24             	mov    %eax,(%esp)
80100b6c:	e8 cf 5e 00 00       	call   80106a40 <allocuvm>
80100b71:	85 c0                	test   %eax,%eax
80100b73:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b79:	75 18                	jne    80100b93 <exec+0x1e3>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b7b:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b81:	89 04 24             	mov    %eax,(%esp)
80100b84:	e8 c7 5f 00 00       	call   80106b50 <freevm>
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100b89:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b8e:	e9 80 fe ff ff       	jmp    80100a13 <exec+0x63>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100b93:	8b 9d ec fe ff ff    	mov    -0x114(%ebp),%ebx
80100b99:	89 d8                	mov    %ebx,%eax
80100b9b:	2d 00 20 00 00       	sub    $0x2000,%eax
80100ba0:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ba4:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100baa:	89 04 24             	mov    %eax,(%esp)
80100bad:	e8 1e 60 00 00       	call   80106bd0 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bb2:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bb5:	8b 00                	mov    (%eax),%eax
80100bb7:	85 c0                	test   %eax,%eax
80100bb9:	0f 84 66 01 00 00    	je     80100d25 <exec+0x375>
80100bbf:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100bc2:	31 f6                	xor    %esi,%esi
80100bc4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80100bc7:	89 f2                	mov    %esi,%edx
80100bc9:	89 fe                	mov    %edi,%esi
80100bcb:	89 d7                	mov    %edx,%edi
80100bcd:	83 c1 04             	add    $0x4,%ecx
80100bd0:	eb 0e                	jmp    80100be0 <exec+0x230>
80100bd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100bd8:	83 c1 04             	add    $0x4,%ecx
    if(argc >= MAXARG)
80100bdb:	83 ff 20             	cmp    $0x20,%edi
80100bde:	74 9b                	je     80100b7b <exec+0x1cb>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100be0:	89 04 24             	mov    %eax,(%esp)
80100be3:	89 8d f0 fe ff ff    	mov    %ecx,-0x110(%ebp)
80100be9:	e8 f2 39 00 00       	call   801045e0 <strlen>
80100bee:	f7 d0                	not    %eax
80100bf0:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bf2:	8b 06                	mov    (%esi),%eax

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100bf4:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bf7:	89 04 24             	mov    %eax,(%esp)
80100bfa:	e8 e1 39 00 00       	call   801045e0 <strlen>
80100bff:	83 c0 01             	add    $0x1,%eax
80100c02:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c06:	8b 06                	mov    (%esi),%eax
80100c08:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100c0c:	89 44 24 08          	mov    %eax,0x8(%esp)
80100c10:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100c16:	89 04 24             	mov    %eax,(%esp)
80100c19:	e8 12 61 00 00       	call   80106d30 <copyout>
80100c1e:	85 c0                	test   %eax,%eax
80100c20:	0f 88 55 ff ff ff    	js     80100b7b <exec+0x1cb>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c26:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c2c:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c32:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c39:	83 c7 01             	add    $0x1,%edi
80100c3c:	8b 01                	mov    (%ecx),%eax
80100c3e:	89 ce                	mov    %ecx,%esi
80100c40:	85 c0                	test   %eax,%eax
80100c42:	75 94                	jne    80100bd8 <exec+0x228>
80100c44:	89 fe                	mov    %edi,%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c46:	8d 04 b5 04 00 00 00 	lea    0x4(,%esi,4),%eax
80100c4d:	89 d9                	mov    %ebx,%ecx
80100c4f:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100c51:	83 c0 0c             	add    $0xc,%eax
80100c54:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c56:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c5a:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100c60:	89 54 24 08          	mov    %edx,0x8(%esp)
80100c64:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c68:	c7 84 b5 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%esi,4)
80100c6f:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c73:	89 04 24             	mov    %eax,(%esp)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
80100c76:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c7d:	ff ff ff 
  ustack[1] = argc;
80100c80:	89 b5 5c ff ff ff    	mov    %esi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c86:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c8c:	e8 9f 60 00 00       	call   80106d30 <copyout>
80100c91:	85 c0                	test   %eax,%eax
80100c93:	0f 88 e2 fe ff ff    	js     80100b7b <exec+0x1cb>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100c99:	8b 45 08             	mov    0x8(%ebp),%eax
80100c9c:	0f b6 10             	movzbl (%eax),%edx
80100c9f:	84 d2                	test   %dl,%dl
80100ca1:	74 19                	je     80100cbc <exec+0x30c>
80100ca3:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100ca6:	83 c0 01             	add    $0x1,%eax
    if(*s == '/')
      last = s+1;
80100ca9:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cac:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100caf:	0f 44 c8             	cmove  %eax,%ecx
80100cb2:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cb5:	84 d2                	test   %dl,%dl
80100cb7:	75 f0                	jne    80100ca9 <exec+0x2f9>
80100cb9:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
80100cbc:	8b 45 08             	mov    0x8(%ebp),%eax
80100cbf:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80100cc6:	00 
80100cc7:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ccb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cd1:	83 c0 6c             	add    $0x6c,%eax
80100cd4:	89 04 24             	mov    %eax,(%esp)
80100cd7:	e8 c4 38 00 00       	call   801045a0 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100cdc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  proc->pgdir = pgdir;
80100ce2:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100ce8:	8b 70 04             	mov    0x4(%eax),%esi
  proc->pgdir = pgdir;
80100ceb:	89 48 04             	mov    %ecx,0x4(%eax)
  proc->sz = sz;
80100cee:	8b 8d ec fe ff ff    	mov    -0x114(%ebp),%ecx
80100cf4:	89 08                	mov    %ecx,(%eax)
  proc->tf->eip = elf.entry;  // main
80100cf6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cfc:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100d02:	8b 50 18             	mov    0x18(%eax),%edx
80100d05:	89 4a 38             	mov    %ecx,0x38(%edx)
  proc->tf->esp = sp;
80100d08:	8b 50 18             	mov    0x18(%eax),%edx
80100d0b:	89 5a 44             	mov    %ebx,0x44(%edx)
  switchuvm(proc);
80100d0e:	89 04 24             	mov    %eax,(%esp)
80100d11:	e8 1a 5b 00 00       	call   80106830 <switchuvm>
  freevm(oldpgdir);
80100d16:	89 34 24             	mov    %esi,(%esp)
80100d19:	e8 32 5e 00 00       	call   80106b50 <freevm>
  return 0;
80100d1e:	31 c0                	xor    %eax,%eax
80100d20:	e9 ee fc ff ff       	jmp    80100a13 <exec+0x63>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100d25:	8b 9d ec fe ff ff    	mov    -0x114(%ebp),%ebx
80100d2b:	31 f6                	xor    %esi,%esi
80100d2d:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100d33:	e9 0e ff ff ff       	jmp    80100c46 <exec+0x296>
80100d38:	66 90                	xchg   %ax,%ax
80100d3a:	66 90                	xchg   %ax,%ax
80100d3c:	66 90                	xchg   %ax,%ax
80100d3e:	66 90                	xchg   %ax,%ax

80100d40 <fileinit>:
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	83 ec 10             	sub    $0x10,%esp
80100d46:	68 49 6e 10 80       	push   $0x80106e49
80100d4b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d50:	e8 4b 34 00 00       	call   801041a0 <initlock>
80100d55:	83 c4 10             	add    $0x10,%esp
80100d58:	c9                   	leave  
80100d59:	c3                   	ret    
80100d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d60 <filealloc>:
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	53                   	push   %ebx
80100d64:	bb 14 00 11 80       	mov    $0x80110014,%ebx
80100d69:	83 ec 10             	sub    $0x10,%esp
80100d6c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d71:	e8 aa 34 00 00       	call   80104220 <acquire>
80100d76:	83 c4 10             	add    $0x10,%esp
80100d79:	eb 10                	jmp    80100d8b <filealloc+0x2b>
80100d7b:	90                   	nop
80100d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d80:	83 c3 18             	add    $0x18,%ebx
80100d83:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100d89:	74 25                	je     80100db0 <filealloc+0x50>
80100d8b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d8e:	85 c0                	test   %eax,%eax
80100d90:	75 ee                	jne    80100d80 <filealloc+0x20>
80100d92:	83 ec 0c             	sub    $0xc,%esp
80100d95:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100d9c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100da1:	e8 aa 35 00 00       	call   80104350 <release>
80100da6:	89 d8                	mov    %ebx,%eax
80100da8:	83 c4 10             	add    $0x10,%esp
80100dab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dae:	c9                   	leave  
80100daf:	c3                   	ret    
80100db0:	83 ec 0c             	sub    $0xc,%esp
80100db3:	68 e0 ff 10 80       	push   $0x8010ffe0
80100db8:	e8 93 35 00 00       	call   80104350 <release>
80100dbd:	83 c4 10             	add    $0x10,%esp
80100dc0:	31 c0                	xor    %eax,%eax
80100dc2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dc5:	c9                   	leave  
80100dc6:	c3                   	ret    
80100dc7:	89 f6                	mov    %esi,%esi
80100dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100dd0 <filedup>:
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	53                   	push   %ebx
80100dd4:	83 ec 10             	sub    $0x10,%esp
80100dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dda:	68 e0 ff 10 80       	push   $0x8010ffe0
80100ddf:	e8 3c 34 00 00       	call   80104220 <acquire>
80100de4:	8b 43 04             	mov    0x4(%ebx),%eax
80100de7:	83 c4 10             	add    $0x10,%esp
80100dea:	85 c0                	test   %eax,%eax
80100dec:	7e 1a                	jle    80100e08 <filedup+0x38>
80100dee:	83 c0 01             	add    $0x1,%eax
80100df1:	83 ec 0c             	sub    $0xc,%esp
80100df4:	89 43 04             	mov    %eax,0x4(%ebx)
80100df7:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dfc:	e8 4f 35 00 00       	call   80104350 <release>
80100e01:	89 d8                	mov    %ebx,%eax
80100e03:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e06:	c9                   	leave  
80100e07:	c3                   	ret    
80100e08:	83 ec 0c             	sub    $0xc,%esp
80100e0b:	68 50 6e 10 80       	push   $0x80106e50
80100e10:	e8 4b f5 ff ff       	call   80100360 <panic>
80100e15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <fileclose>:
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	57                   	push   %edi
80100e24:	56                   	push   %esi
80100e25:	53                   	push   %ebx
80100e26:	83 ec 28             	sub    $0x28,%esp
80100e29:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e2c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e31:	e8 ea 33 00 00       	call   80104220 <acquire>
80100e36:	8b 47 04             	mov    0x4(%edi),%eax
80100e39:	83 c4 10             	add    $0x10,%esp
80100e3c:	85 c0                	test   %eax,%eax
80100e3e:	0f 8e 9b 00 00 00    	jle    80100edf <fileclose+0xbf>
80100e44:	83 e8 01             	sub    $0x1,%eax
80100e47:	85 c0                	test   %eax,%eax
80100e49:	89 47 04             	mov    %eax,0x4(%edi)
80100e4c:	74 1a                	je     80100e68 <fileclose+0x48>
80100e4e:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
80100e55:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e58:	5b                   	pop    %ebx
80100e59:	5e                   	pop    %esi
80100e5a:	5f                   	pop    %edi
80100e5b:	5d                   	pop    %ebp
80100e5c:	e9 ef 34 00 00       	jmp    80104350 <release>
80100e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e68:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e6c:	8b 1f                	mov    (%edi),%ebx
80100e6e:	83 ec 0c             	sub    $0xc,%esp
80100e71:	8b 77 0c             	mov    0xc(%edi),%esi
80100e74:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e7a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e7d:	8b 47 10             	mov    0x10(%edi),%eax
80100e80:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e85:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e88:	e8 c3 34 00 00       	call   80104350 <release>
80100e8d:	83 c4 10             	add    $0x10,%esp
80100e90:	83 fb 01             	cmp    $0x1,%ebx
80100e93:	74 13                	je     80100ea8 <fileclose+0x88>
80100e95:	83 fb 02             	cmp    $0x2,%ebx
80100e98:	74 26                	je     80100ec0 <fileclose+0xa0>
80100e9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e9d:	5b                   	pop    %ebx
80100e9e:	5e                   	pop    %esi
80100e9f:	5f                   	pop    %edi
80100ea0:	5d                   	pop    %ebp
80100ea1:	c3                   	ret    
80100ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100ea8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100eac:	83 ec 08             	sub    $0x8,%esp
80100eaf:	53                   	push   %ebx
80100eb0:	56                   	push   %esi
80100eb1:	e8 4a 25 00 00       	call   80103400 <pipeclose>
80100eb6:	83 c4 10             	add    $0x10,%esp
80100eb9:	eb df                	jmp    80100e9a <fileclose+0x7a>
80100ebb:	90                   	nop
80100ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ec0:	e8 cb 1c 00 00       	call   80102b90 <begin_op>
80100ec5:	83 ec 0c             	sub    $0xc,%esp
80100ec8:	ff 75 e0             	pushl  -0x20(%ebp)
80100ecb:	e8 f0 08 00 00       	call   801017c0 <iput>
80100ed0:	83 c4 10             	add    $0x10,%esp
80100ed3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ed6:	5b                   	pop    %ebx
80100ed7:	5e                   	pop    %esi
80100ed8:	5f                   	pop    %edi
80100ed9:	5d                   	pop    %ebp
80100eda:	e9 21 1d 00 00       	jmp    80102c00 <end_op>
80100edf:	83 ec 0c             	sub    $0xc,%esp
80100ee2:	68 58 6e 10 80       	push   $0x80106e58
80100ee7:	e8 74 f4 ff ff       	call   80100360 <panic>
80100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ef0 <filestat>:
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	53                   	push   %ebx
80100ef4:	83 ec 04             	sub    $0x4,%esp
80100ef7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100efa:	83 3b 02             	cmpl   $0x2,(%ebx)
80100efd:	75 31                	jne    80100f30 <filestat+0x40>
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	ff 73 10             	pushl  0x10(%ebx)
80100f05:	e8 a6 07 00 00       	call   801016b0 <ilock>
80100f0a:	58                   	pop    %eax
80100f0b:	5a                   	pop    %edx
80100f0c:	ff 75 0c             	pushl  0xc(%ebp)
80100f0f:	ff 73 10             	pushl  0x10(%ebx)
80100f12:	e8 f9 09 00 00       	call   80101910 <stati>
80100f17:	59                   	pop    %ecx
80100f18:	ff 73 10             	pushl  0x10(%ebx)
80100f1b:	e8 60 08 00 00       	call   80101780 <iunlock>
80100f20:	83 c4 10             	add    $0x10,%esp
80100f23:	31 c0                	xor    %eax,%eax
80100f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f28:	c9                   	leave  
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f40 <fileread>:
80100f40:	55                   	push   %ebp
80100f41:	89 e5                	mov    %esp,%ebp
80100f43:	57                   	push   %edi
80100f44:	56                   	push   %esi
80100f45:	53                   	push   %ebx
80100f46:	83 ec 0c             	sub    $0xc,%esp
80100f49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f4f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f52:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f56:	74 60                	je     80100fb8 <fileread+0x78>
80100f58:	8b 03                	mov    (%ebx),%eax
80100f5a:	83 f8 01             	cmp    $0x1,%eax
80100f5d:	74 41                	je     80100fa0 <fileread+0x60>
80100f5f:	83 f8 02             	cmp    $0x2,%eax
80100f62:	75 5b                	jne    80100fbf <fileread+0x7f>
80100f64:	83 ec 0c             	sub    $0xc,%esp
80100f67:	ff 73 10             	pushl  0x10(%ebx)
80100f6a:	e8 41 07 00 00       	call   801016b0 <ilock>
80100f6f:	57                   	push   %edi
80100f70:	ff 73 14             	pushl  0x14(%ebx)
80100f73:	56                   	push   %esi
80100f74:	ff 73 10             	pushl  0x10(%ebx)
80100f77:	e8 c4 09 00 00       	call   80101940 <readi>
80100f7c:	83 c4 20             	add    $0x20,%esp
80100f7f:	85 c0                	test   %eax,%eax
80100f81:	89 c6                	mov    %eax,%esi
80100f83:	7e 03                	jle    80100f88 <fileread+0x48>
80100f85:	01 43 14             	add    %eax,0x14(%ebx)
80100f88:	83 ec 0c             	sub    $0xc,%esp
80100f8b:	ff 73 10             	pushl  0x10(%ebx)
80100f8e:	e8 ed 07 00 00       	call   80101780 <iunlock>
80100f93:	83 c4 10             	add    $0x10,%esp
80100f96:	89 f0                	mov    %esi,%eax
80100f98:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f9b:	5b                   	pop    %ebx
80100f9c:	5e                   	pop    %esi
80100f9d:	5f                   	pop    %edi
80100f9e:	5d                   	pop    %ebp
80100f9f:	c3                   	ret    
80100fa0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fa3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fa6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fa9:	5b                   	pop    %ebx
80100faa:	5e                   	pop    %esi
80100fab:	5f                   	pop    %edi
80100fac:	5d                   	pop    %ebp
80100fad:	e9 fe 25 00 00       	jmp    801035b0 <piperead>
80100fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fbd:	eb d9                	jmp    80100f98 <fileread+0x58>
80100fbf:	83 ec 0c             	sub    $0xc,%esp
80100fc2:	68 62 6e 10 80       	push   $0x80106e62
80100fc7:	e8 94 f3 ff ff       	call   80100360 <panic>
80100fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fd0 <filewrite>:
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	57                   	push   %edi
80100fd4:	56                   	push   %esi
80100fd5:	53                   	push   %ebx
80100fd6:	83 ec 1c             	sub    $0x1c,%esp
80100fd9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fdc:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fdf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100fe3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fe6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100fec:	0f 84 aa 00 00 00    	je     8010109c <filewrite+0xcc>
80100ff2:	8b 06                	mov    (%esi),%eax
80100ff4:	83 f8 01             	cmp    $0x1,%eax
80100ff7:	0f 84 c2 00 00 00    	je     801010bf <filewrite+0xef>
80100ffd:	83 f8 02             	cmp    $0x2,%eax
80101000:	0f 85 d8 00 00 00    	jne    801010de <filewrite+0x10e>
80101006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101009:	31 ff                	xor    %edi,%edi
8010100b:	85 c0                	test   %eax,%eax
8010100d:	7f 34                	jg     80101043 <filewrite+0x73>
8010100f:	e9 9c 00 00 00       	jmp    801010b0 <filewrite+0xe0>
80101014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101018:	01 46 14             	add    %eax,0x14(%esi)
8010101b:	83 ec 0c             	sub    $0xc,%esp
8010101e:	ff 76 10             	pushl  0x10(%esi)
80101021:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101024:	e8 57 07 00 00       	call   80101780 <iunlock>
80101029:	e8 d2 1b 00 00       	call   80102c00 <end_op>
8010102e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101031:	83 c4 10             	add    $0x10,%esp
80101034:	39 d8                	cmp    %ebx,%eax
80101036:	0f 85 95 00 00 00    	jne    801010d1 <filewrite+0x101>
8010103c:	01 c7                	add    %eax,%edi
8010103e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101041:	7e 6d                	jle    801010b0 <filewrite+0xe0>
80101043:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101046:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010104b:	29 fb                	sub    %edi,%ebx
8010104d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101053:	0f 4f d8             	cmovg  %eax,%ebx
80101056:	e8 35 1b 00 00       	call   80102b90 <begin_op>
8010105b:	83 ec 0c             	sub    $0xc,%esp
8010105e:	ff 76 10             	pushl  0x10(%esi)
80101061:	e8 4a 06 00 00       	call   801016b0 <ilock>
80101066:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101069:	53                   	push   %ebx
8010106a:	ff 76 14             	pushl  0x14(%esi)
8010106d:	01 f8                	add    %edi,%eax
8010106f:	50                   	push   %eax
80101070:	ff 76 10             	pushl  0x10(%esi)
80101073:	e8 c8 09 00 00       	call   80101a40 <writei>
80101078:	83 c4 20             	add    $0x20,%esp
8010107b:	85 c0                	test   %eax,%eax
8010107d:	7f 99                	jg     80101018 <filewrite+0x48>
8010107f:	83 ec 0c             	sub    $0xc,%esp
80101082:	ff 76 10             	pushl  0x10(%esi)
80101085:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101088:	e8 f3 06 00 00       	call   80101780 <iunlock>
8010108d:	e8 6e 1b 00 00       	call   80102c00 <end_op>
80101092:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101095:	83 c4 10             	add    $0x10,%esp
80101098:	85 c0                	test   %eax,%eax
8010109a:	74 98                	je     80101034 <filewrite+0x64>
8010109c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010109f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010a4:	5b                   	pop    %ebx
801010a5:	5e                   	pop    %esi
801010a6:	5f                   	pop    %edi
801010a7:	5d                   	pop    %ebp
801010a8:	c3                   	ret    
801010a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010b0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010b3:	75 e7                	jne    8010109c <filewrite+0xcc>
801010b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b8:	89 f8                	mov    %edi,%eax
801010ba:	5b                   	pop    %ebx
801010bb:	5e                   	pop    %esi
801010bc:	5f                   	pop    %edi
801010bd:	5d                   	pop    %ebp
801010be:	c3                   	ret    
801010bf:	8b 46 0c             	mov    0xc(%esi),%eax
801010c2:	89 45 08             	mov    %eax,0x8(%ebp)
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	5b                   	pop    %ebx
801010c9:	5e                   	pop    %esi
801010ca:	5f                   	pop    %edi
801010cb:	5d                   	pop    %ebp
801010cc:	e9 bf 23 00 00       	jmp    80103490 <pipewrite>
801010d1:	83 ec 0c             	sub    $0xc,%esp
801010d4:	68 6b 6e 10 80       	push   $0x80106e6b
801010d9:	e8 82 f2 ff ff       	call   80100360 <panic>
801010de:	83 ec 0c             	sub    $0xc,%esp
801010e1:	68 71 6e 10 80       	push   $0x80106e71
801010e6:	e8 75 f2 ff ff       	call   80100360 <panic>
801010eb:	66 90                	xchg   %ax,%ax
801010ed:	66 90                	xchg   %ax,%ax
801010ef:	90                   	nop

801010f0 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010f0:	55                   	push   %ebp
801010f1:	89 e5                	mov    %esp,%ebp
801010f3:	57                   	push   %edi
801010f4:	56                   	push   %esi
801010f5:	53                   	push   %ebx
801010f6:	83 ec 2c             	sub    $0x2c,%esp
801010f9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801010fc:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101101:	85 c0                	test   %eax,%eax
80101103:	0f 84 8c 00 00 00    	je     80101195 <balloc+0xa5>
80101109:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101110:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101113:	89 f0                	mov    %esi,%eax
80101115:	c1 f8 0c             	sar    $0xc,%eax
80101118:	03 05 f8 09 11 80    	add    0x801109f8,%eax
8010111e:	89 44 24 04          	mov    %eax,0x4(%esp)
80101122:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101125:	89 04 24             	mov    %eax,(%esp)
80101128:	e8 a3 ef ff ff       	call   801000d0 <bread>
8010112d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101130:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101135:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101138:	31 c0                	xor    %eax,%eax
8010113a:	eb 33                	jmp    8010116f <balloc+0x7f>
8010113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101140:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101143:	89 c2                	mov    %eax,%edx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
80101145:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101147:	c1 fa 03             	sar    $0x3,%edx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010114a:	83 e1 07             	and    $0x7,%ecx
8010114d:	bf 01 00 00 00       	mov    $0x1,%edi
80101152:	d3 e7                	shl    %cl,%edi
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101154:	0f b6 5c 13 5c       	movzbl 0x5c(%ebx,%edx,1),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
80101159:	89 f9                	mov    %edi,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010115b:	0f b6 fb             	movzbl %bl,%edi
8010115e:	85 cf                	test   %ecx,%edi
80101160:	74 46                	je     801011a8 <balloc+0xb8>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101162:	83 c0 01             	add    $0x1,%eax
80101165:	83 c6 01             	add    $0x1,%esi
80101168:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010116d:	74 05                	je     80101174 <balloc+0x84>
8010116f:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80101172:	72 cc                	jb     80101140 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80101174:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101177:	89 04 24             	mov    %eax,(%esp)
8010117a:	e8 61 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010117f:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101186:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101189:	3b 05 e0 09 11 80    	cmp    0x801109e0,%eax
8010118f:	0f 82 7b ff ff ff    	jb     80101110 <balloc+0x20>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
80101195:	c7 04 24 7b 6e 10 80 	movl   $0x80106e7b,(%esp)
8010119c:	e8 bf f1 ff ff       	call   80100360 <panic>
801011a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011a8:	09 d9                	or     %ebx,%ecx
801011aa:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801011ad:	88 4c 13 5c          	mov    %cl,0x5c(%ebx,%edx,1)
        log_write(bp);
801011b1:	89 1c 24             	mov    %ebx,(%esp)
801011b4:	e8 b7 1b 00 00       	call   80102d70 <log_write>
        brelse(bp);
801011b9:	89 1c 24             	mov    %ebx,(%esp)
801011bc:	e8 1f f0 ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
801011c4:	89 74 24 04          	mov    %esi,0x4(%esp)
801011c8:	89 04 24             	mov    %eax,(%esp)
801011cb:	e8 00 ef ff ff       	call   801000d0 <bread>
  memset(bp->data, 0, BSIZE);
801011d0:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
801011d7:	00 
801011d8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801011df:	00 
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011e0:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011e2:	8d 40 5c             	lea    0x5c(%eax),%eax
801011e5:	89 04 24             	mov    %eax,(%esp)
801011e8:	e8 b3 31 00 00       	call   801043a0 <memset>
  log_write(bp);
801011ed:	89 1c 24             	mov    %ebx,(%esp)
801011f0:	e8 7b 1b 00 00       	call   80102d70 <log_write>
  brelse(bp);
801011f5:	89 1c 24             	mov    %ebx,(%esp)
801011f8:	e8 e3 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
801011fd:	83 c4 2c             	add    $0x2c,%esp
80101200:	89 f0                	mov    %esi,%eax
80101202:	5b                   	pop    %ebx
80101203:	5e                   	pop    %esi
80101204:	5f                   	pop    %edi
80101205:	5d                   	pop    %ebp
80101206:	c3                   	ret    
80101207:	89 f6                	mov    %esi,%esi
80101209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101210 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101210:	55                   	push   %ebp
80101211:	89 e5                	mov    %esp,%ebp
80101213:	57                   	push   %edi
80101214:	89 c7                	mov    %eax,%edi
80101216:	56                   	push   %esi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101217:	31 f6                	xor    %esi,%esi
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101219:	53                   	push   %ebx

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010121a:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010121f:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101222:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101229:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
8010122c:	e8 ef 2f 00 00       	call   80104220 <acquire>

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101231:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101234:	eb 14                	jmp    8010124a <iget+0x3a>
80101236:	66 90                	xchg   %ax,%ax
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101238:	85 f6                	test   %esi,%esi
8010123a:	74 3c                	je     80101278 <iget+0x68>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010123c:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101242:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101248:	74 46                	je     80101290 <iget+0x80>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
8010124a:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010124d:	85 c9                	test   %ecx,%ecx
8010124f:	7e e7                	jle    80101238 <iget+0x28>
80101251:	39 3b                	cmp    %edi,(%ebx)
80101253:	75 e3                	jne    80101238 <iget+0x28>
80101255:	39 53 04             	cmp    %edx,0x4(%ebx)
80101258:	75 de                	jne    80101238 <iget+0x28>
      ip->ref++;
8010125a:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
8010125d:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010125f:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101266:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101269:	e8 e2 30 00 00       	call   80104350 <release>
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}
8010126e:	83 c4 1c             	add    $0x1c,%esp
80101271:	89 f0                	mov    %esi,%eax
80101273:	5b                   	pop    %ebx
80101274:	5e                   	pop    %esi
80101275:	5f                   	pop    %edi
80101276:	5d                   	pop    %ebp
80101277:	c3                   	ret    
80101278:	85 c9                	test   %ecx,%ecx
8010127a:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010127d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101283:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101289:	75 bf                	jne    8010124a <iget+0x3a>
8010128b:	90                   	nop
8010128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101290:	85 f6                	test   %esi,%esi
80101292:	74 29                	je     801012bd <iget+0xad>
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
80101294:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101296:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
80101299:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
801012a0:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012a7:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801012ae:	e8 9d 30 00 00       	call   80104350 <release>

  return ip;
}
801012b3:	83 c4 1c             	add    $0x1c,%esp
801012b6:	89 f0                	mov    %esi,%eax
801012b8:	5b                   	pop    %ebx
801012b9:	5e                   	pop    %esi
801012ba:	5f                   	pop    %edi
801012bb:	5d                   	pop    %ebp
801012bc:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012bd:	c7 04 24 91 6e 10 80 	movl   $0x80106e91,(%esp)
801012c4:	e8 97 f0 ff ff       	call   80100360 <panic>
801012c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801012d0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	56                   	push   %esi
801012d5:	53                   	push   %ebx
801012d6:	89 c3                	mov    %eax,%ebx
801012d8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012db:	83 fa 0b             	cmp    $0xb,%edx
801012de:	77 18                	ja     801012f8 <bmap+0x28>
801012e0:	8d 34 90             	lea    (%eax,%edx,4),%esi
    if((addr = ip->addrs[bn]) == 0)
801012e3:	8b 46 5c             	mov    0x5c(%esi),%eax
801012e6:	85 c0                	test   %eax,%eax
801012e8:	74 66                	je     80101350 <bmap+0x80>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012ea:	83 c4 1c             	add    $0x1c,%esp
801012ed:	5b                   	pop    %ebx
801012ee:	5e                   	pop    %esi
801012ef:	5f                   	pop    %edi
801012f0:	5d                   	pop    %ebp
801012f1:	c3                   	ret    
801012f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
801012f8:	8d 72 f4             	lea    -0xc(%edx),%esi

  if(bn < NINDIRECT){
801012fb:	83 fe 7f             	cmp    $0x7f,%esi
801012fe:	77 77                	ja     80101377 <bmap+0xa7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101300:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101306:	85 c0                	test   %eax,%eax
80101308:	74 5e                	je     80101368 <bmap+0x98>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010130a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010130e:	8b 03                	mov    (%ebx),%eax
80101310:	89 04 24             	mov    %eax,(%esp)
80101313:	e8 b8 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101318:	8d 54 b0 5c          	lea    0x5c(%eax,%esi,4),%edx

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010131c:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
8010131e:	8b 32                	mov    (%edx),%esi
80101320:	85 f6                	test   %esi,%esi
80101322:	75 19                	jne    8010133d <bmap+0x6d>
      a[bn] = addr = balloc(ip->dev);
80101324:	8b 03                	mov    (%ebx),%eax
80101326:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101329:	e8 c2 fd ff ff       	call   801010f0 <balloc>
8010132e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101331:	89 02                	mov    %eax,(%edx)
80101333:	89 c6                	mov    %eax,%esi
      log_write(bp);
80101335:	89 3c 24             	mov    %edi,(%esp)
80101338:	e8 33 1a 00 00       	call   80102d70 <log_write>
    }
    brelse(bp);
8010133d:	89 3c 24             	mov    %edi,(%esp)
80101340:	e8 9b ee ff ff       	call   801001e0 <brelse>
    return addr;
  }

  panic("bmap: out of range");
}
80101345:	83 c4 1c             	add    $0x1c,%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101348:	89 f0                	mov    %esi,%eax
    return addr;
  }

  panic("bmap: out of range");
}
8010134a:	5b                   	pop    %ebx
8010134b:	5e                   	pop    %esi
8010134c:	5f                   	pop    %edi
8010134d:	5d                   	pop    %ebp
8010134e:	c3                   	ret    
8010134f:	90                   	nop
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101350:	8b 03                	mov    (%ebx),%eax
80101352:	e8 99 fd ff ff       	call   801010f0 <balloc>
80101357:	89 46 5c             	mov    %eax,0x5c(%esi)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010135a:	83 c4 1c             	add    $0x1c,%esp
8010135d:	5b                   	pop    %ebx
8010135e:	5e                   	pop    %esi
8010135f:	5f                   	pop    %edi
80101360:	5d                   	pop    %ebp
80101361:	c3                   	ret    
80101362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101368:	8b 03                	mov    (%ebx),%eax
8010136a:	e8 81 fd ff ff       	call   801010f0 <balloc>
8010136f:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
80101375:	eb 93                	jmp    8010130a <bmap+0x3a>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
80101377:	c7 04 24 a1 6e 10 80 	movl   $0x80106ea1,(%esp)
8010137e:	e8 dd ef ff ff       	call   80100360 <panic>
80101383:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101390 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
80101390:	55                   	push   %ebp
80101391:	89 e5                	mov    %esp,%ebp
80101393:	56                   	push   %esi
80101394:	53                   	push   %ebx
80101395:	83 ec 10             	sub    $0x10,%esp
  struct buf *bp;

  bp = bread(dev, 1);
80101398:	8b 45 08             	mov    0x8(%ebp),%eax
8010139b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801013a2:	00 
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801013a3:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801013a6:	89 04 24             	mov    %eax,(%esp)
801013a9:	e8 22 ed ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
801013ae:	89 34 24             	mov    %esi,(%esp)
801013b1:	c7 44 24 08 1c 00 00 	movl   $0x1c,0x8(%esp)
801013b8:	00 
void
readsb(int dev, struct superblock *sb)
{
  struct buf *bp;

  bp = bread(dev, 1);
801013b9:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013bb:	8d 40 5c             	lea    0x5c(%eax),%eax
801013be:	89 44 24 04          	mov    %eax,0x4(%esp)
801013c2:	e8 89 30 00 00       	call   80104450 <memmove>
  brelse(bp);
801013c7:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801013ca:	83 c4 10             	add    $0x10,%esp
801013cd:	5b                   	pop    %ebx
801013ce:	5e                   	pop    %esi
801013cf:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
801013d0:	e9 0b ee ff ff       	jmp    801001e0 <brelse>
801013d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801013d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013e0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801013e0:	55                   	push   %ebp
801013e1:	89 e5                	mov    %esp,%ebp
801013e3:	57                   	push   %edi
801013e4:	89 d7                	mov    %edx,%edi
801013e6:	56                   	push   %esi
801013e7:	53                   	push   %ebx
801013e8:	89 c3                	mov    %eax,%ebx
801013ea:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
801013ed:	89 04 24             	mov    %eax,(%esp)
801013f0:	c7 44 24 04 e0 09 11 	movl   $0x801109e0,0x4(%esp)
801013f7:	80 
801013f8:	e8 93 ff ff ff       	call   80101390 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
801013fd:	89 fa                	mov    %edi,%edx
801013ff:	c1 ea 0c             	shr    $0xc,%edx
80101402:	03 15 f8 09 11 80    	add    0x801109f8,%edx
80101408:	89 1c 24             	mov    %ebx,(%esp)
  bi = b % BPB;
  m = 1 << (bi % 8);
8010140b:	bb 01 00 00 00       	mov    $0x1,%ebx
{
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
80101410:	89 54 24 04          	mov    %edx,0x4(%esp)
80101414:	e8 b7 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
80101419:	89 f9                	mov    %edi,%ecx
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
8010141b:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
80101421:	89 fa                	mov    %edi,%edx
  m = 1 << (bi % 8);
80101423:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101426:	c1 fa 03             	sar    $0x3,%edx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101429:	d3 e3                	shl    %cl,%ebx
{
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
8010142b:	89 c6                	mov    %eax,%esi
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
8010142d:	0f b6 44 10 5c       	movzbl 0x5c(%eax,%edx,1),%eax
80101432:	0f b6 c8             	movzbl %al,%ecx
80101435:	85 d9                	test   %ebx,%ecx
80101437:	74 20                	je     80101459 <bfree+0x79>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101439:	f7 d3                	not    %ebx
8010143b:	21 c3                	and    %eax,%ebx
8010143d:	88 5c 16 5c          	mov    %bl,0x5c(%esi,%edx,1)
  log_write(bp);
80101441:	89 34 24             	mov    %esi,(%esp)
80101444:	e8 27 19 00 00       	call   80102d70 <log_write>
  brelse(bp);
80101449:	89 34 24             	mov    %esi,(%esp)
8010144c:	e8 8f ed ff ff       	call   801001e0 <brelse>
}
80101451:	83 c4 1c             	add    $0x1c,%esp
80101454:	5b                   	pop    %ebx
80101455:	5e                   	pop    %esi
80101456:	5f                   	pop    %edi
80101457:	5d                   	pop    %ebp
80101458:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101459:	c7 04 24 b4 6e 10 80 	movl   $0x80106eb4,(%esp)
80101460:	e8 fb ee ff ff       	call   80100360 <panic>
80101465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101470 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101470:	55                   	push   %ebp
80101471:	89 e5                	mov    %esp,%ebp
80101473:	53                   	push   %ebx
80101474:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
80101479:	83 ec 24             	sub    $0x24,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010147c:	c7 44 24 04 c7 6e 10 	movl   $0x80106ec7,0x4(%esp)
80101483:	80 
80101484:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010148b:	e8 10 2d 00 00       	call   801041a0 <initlock>
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101490:	89 1c 24             	mov    %ebx,(%esp)
80101493:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101499:	c7 44 24 04 ce 6e 10 	movl   $0x80106ece,0x4(%esp)
801014a0:	80 
801014a1:	e8 ea 2b 00 00       	call   80104090 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
801014a6:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
801014ac:	75 e2                	jne    80101490 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }
  
  readsb(dev, &sb);
801014ae:	8b 45 08             	mov    0x8(%ebp),%eax
801014b1:	c7 44 24 04 e0 09 11 	movl   $0x801109e0,0x4(%esp)
801014b8:	80 
801014b9:	89 04 24             	mov    %eax,(%esp)
801014bc:	e8 cf fe ff ff       	call   80101390 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014c1:	a1 f8 09 11 80       	mov    0x801109f8,%eax
801014c6:	c7 04 24 24 6f 10 80 	movl   $0x80106f24,(%esp)
801014cd:	89 44 24 1c          	mov    %eax,0x1c(%esp)
801014d1:	a1 f4 09 11 80       	mov    0x801109f4,%eax
801014d6:	89 44 24 18          	mov    %eax,0x18(%esp)
801014da:	a1 f0 09 11 80       	mov    0x801109f0,%eax
801014df:	89 44 24 14          	mov    %eax,0x14(%esp)
801014e3:	a1 ec 09 11 80       	mov    0x801109ec,%eax
801014e8:	89 44 24 10          	mov    %eax,0x10(%esp)
801014ec:	a1 e8 09 11 80       	mov    0x801109e8,%eax
801014f1:	89 44 24 0c          	mov    %eax,0xc(%esp)
801014f5:	a1 e4 09 11 80       	mov    0x801109e4,%eax
801014fa:	89 44 24 08          	mov    %eax,0x8(%esp)
801014fe:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101503:	89 44 24 04          	mov    %eax,0x4(%esp)
80101507:	e8 44 f1 ff ff       	call   80100650 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
8010150c:	83 c4 24             	add    $0x24,%esp
8010150f:	5b                   	pop    %ebx
80101510:	5d                   	pop    %ebp
80101511:	c3                   	ret    
80101512:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101520 <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	57                   	push   %edi
80101524:	56                   	push   %esi
80101525:	53                   	push   %ebx
80101526:	83 ec 2c             	sub    $0x2c,%esp
80101529:	8b 45 0c             	mov    0xc(%ebp),%eax
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010152c:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101533:	8b 7d 08             	mov    0x8(%ebp),%edi
80101536:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101539:	0f 86 a2 00 00 00    	jbe    801015e1 <ialloc+0xc1>
8010153f:	be 01 00 00 00       	mov    $0x1,%esi
80101544:	bb 01 00 00 00       	mov    $0x1,%ebx
80101549:	eb 1a                	jmp    80101565 <ialloc+0x45>
8010154b:	90                   	nop
8010154c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101550:	89 14 24             	mov    %edx,(%esp)
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101553:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101556:	e8 85 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010155b:	89 de                	mov    %ebx,%esi
8010155d:	3b 1d e8 09 11 80    	cmp    0x801109e8,%ebx
80101563:	73 7c                	jae    801015e1 <ialloc+0xc1>
    bp = bread(dev, IBLOCK(inum, sb));
80101565:	89 f0                	mov    %esi,%eax
80101567:	c1 e8 03             	shr    $0x3,%eax
8010156a:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101570:	89 3c 24             	mov    %edi,(%esp)
80101573:	89 44 24 04          	mov    %eax,0x4(%esp)
80101577:	e8 54 eb ff ff       	call   801000d0 <bread>
8010157c:	89 c2                	mov    %eax,%edx
    dip = (struct dinode*)bp->data + inum%IPB;
8010157e:	89 f0                	mov    %esi,%eax
80101580:	83 e0 07             	and    $0x7,%eax
80101583:	c1 e0 06             	shl    $0x6,%eax
80101586:	8d 4c 02 5c          	lea    0x5c(%edx,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010158a:	66 83 39 00          	cmpw   $0x0,(%ecx)
8010158e:	75 c0                	jne    80101550 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101590:	89 0c 24             	mov    %ecx,(%esp)
80101593:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
8010159a:	00 
8010159b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801015a2:	00 
801015a3:	89 55 dc             	mov    %edx,-0x24(%ebp)
801015a6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015a9:	e8 f2 2d 00 00       	call   801043a0 <memset>
      dip->type = type;
801015ae:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
      log_write(bp);   // mark it allocated on the disk
801015b2:	8b 55 dc             	mov    -0x24(%ebp),%edx
  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
801015b5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      log_write(bp);   // mark it allocated on the disk
801015b8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
801015bb:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801015be:	89 14 24             	mov    %edx,(%esp)
801015c1:	e8 aa 17 00 00       	call   80102d70 <log_write>
      brelse(bp);
801015c6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801015c9:	89 14 24             	mov    %edx,(%esp)
801015cc:	e8 0f ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015d1:	83 c4 2c             	add    $0x2c,%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015d4:	89 f2                	mov    %esi,%edx
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015d6:	5b                   	pop    %ebx
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015d7:	89 f8                	mov    %edi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015d9:	5e                   	pop    %esi
801015da:	5f                   	pop    %edi
801015db:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015dc:	e9 2f fc ff ff       	jmp    80101210 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015e1:	c7 04 24 d4 6e 10 80 	movl   $0x80106ed4,(%esp)
801015e8:	e8 73 ed ff ff       	call   80100360 <panic>
801015ed:	8d 76 00             	lea    0x0(%esi),%esi

801015f0 <iupdate>:
}

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
801015f0:	55                   	push   %ebp
801015f1:	89 e5                	mov    %esp,%ebp
801015f3:	56                   	push   %esi
801015f4:	53                   	push   %ebx
801015f5:	83 ec 10             	sub    $0x10,%esp
801015f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015fb:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015fe:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101601:	c1 e8 03             	shr    $0x3,%eax
80101604:	03 05 f4 09 11 80    	add    0x801109f4,%eax
8010160a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010160e:	8b 43 a4             	mov    -0x5c(%ebx),%eax
80101611:	89 04 24             	mov    %eax,(%esp)
80101614:	e8 b7 ea ff ff       	call   801000d0 <bread>
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101619:	8b 53 a8             	mov    -0x58(%ebx),%edx
8010161c:	83 e2 07             	and    $0x7,%edx
8010161f:	c1 e2 06             	shl    $0x6,%edx
80101622:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101626:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
80101628:	0f b7 43 f4          	movzwl -0xc(%ebx),%eax
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010162c:	83 c2 0c             	add    $0xc,%edx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
8010162f:	66 89 42 f4          	mov    %ax,-0xc(%edx)
  dip->major = ip->major;
80101633:	0f b7 43 f6          	movzwl -0xa(%ebx),%eax
80101637:	66 89 42 f6          	mov    %ax,-0xa(%edx)
  dip->minor = ip->minor;
8010163b:	0f b7 43 f8          	movzwl -0x8(%ebx),%eax
8010163f:	66 89 42 f8          	mov    %ax,-0x8(%edx)
  dip->nlink = ip->nlink;
80101643:	0f b7 43 fa          	movzwl -0x6(%ebx),%eax
80101647:	66 89 42 fa          	mov    %ax,-0x6(%edx)
  dip->size = ip->size;
8010164b:	8b 43 fc             	mov    -0x4(%ebx),%eax
8010164e:	89 42 fc             	mov    %eax,-0x4(%edx)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101651:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101655:	89 14 24             	mov    %edx,(%esp)
80101658:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
8010165f:	00 
80101660:	e8 eb 2d 00 00       	call   80104450 <memmove>
  log_write(bp);
80101665:	89 34 24             	mov    %esi,(%esp)
80101668:	e8 03 17 00 00       	call   80102d70 <log_write>
  brelse(bp);
8010166d:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101670:	83 c4 10             	add    $0x10,%esp
80101673:	5b                   	pop    %ebx
80101674:	5e                   	pop    %esi
80101675:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
80101676:	e9 65 eb ff ff       	jmp    801001e0 <brelse>
8010167b:	90                   	nop
8010167c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101680 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101680:	55                   	push   %ebp
80101681:	89 e5                	mov    %esp,%ebp
80101683:	53                   	push   %ebx
80101684:	83 ec 14             	sub    $0x14,%esp
80101687:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010168a:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101691:	e8 8a 2b 00 00       	call   80104220 <acquire>
  ip->ref++;
80101696:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
8010169a:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801016a1:	e8 aa 2c 00 00       	call   80104350 <release>
  return ip;
}
801016a6:	83 c4 14             	add    $0x14,%esp
801016a9:	89 d8                	mov    %ebx,%eax
801016ab:	5b                   	pop    %ebx
801016ac:	5d                   	pop    %ebp
801016ad:	c3                   	ret    
801016ae:	66 90                	xchg   %ax,%ax

801016b0 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
801016b0:	55                   	push   %ebp
801016b1:	89 e5                	mov    %esp,%ebp
801016b3:	56                   	push   %esi
801016b4:	53                   	push   %ebx
801016b5:	83 ec 10             	sub    $0x10,%esp
801016b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
801016bb:	85 db                	test   %ebx,%ebx
801016bd:	0f 84 b0 00 00 00    	je     80101773 <ilock+0xc3>
801016c3:	8b 43 08             	mov    0x8(%ebx),%eax
801016c6:	85 c0                	test   %eax,%eax
801016c8:	0f 8e a5 00 00 00    	jle    80101773 <ilock+0xc3>
    panic("ilock");

  acquiresleep(&ip->lock);
801016ce:	8d 43 0c             	lea    0xc(%ebx),%eax
801016d1:	89 04 24             	mov    %eax,(%esp)
801016d4:	e8 f7 29 00 00       	call   801040d0 <acquiresleep>

  if(!(ip->flags & I_VALID)){
801016d9:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
801016dd:	74 09                	je     801016e8 <ilock+0x38>
    brelse(bp);
    ip->flags |= I_VALID;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
801016df:	83 c4 10             	add    $0x10,%esp
801016e2:	5b                   	pop    %ebx
801016e3:	5e                   	pop    %esi
801016e4:	5d                   	pop    %ebp
801016e5:	c3                   	ret    
801016e6:	66 90                	xchg   %ax,%ax
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016e8:	8b 43 04             	mov    0x4(%ebx),%eax
801016eb:	c1 e8 03             	shr    $0x3,%eax
801016ee:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801016f4:	89 44 24 04          	mov    %eax,0x4(%esp)
801016f8:	8b 03                	mov    (%ebx),%eax
801016fa:	89 04 24             	mov    %eax,(%esp)
801016fd:	e8 ce e9 ff ff       	call   801000d0 <bread>
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101702:	8b 53 04             	mov    0x4(%ebx),%edx
80101705:	83 e2 07             	and    $0x7,%edx
80101708:	c1 e2 06             	shl    $0x6,%edx
8010170b:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010170f:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
80101711:	0f b7 02             	movzwl (%edx),%eax
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101714:	83 c2 0c             	add    $0xc,%edx
  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
80101717:	66 89 43 50          	mov    %ax,0x50(%ebx)
    ip->major = dip->major;
8010171b:	0f b7 42 f6          	movzwl -0xa(%edx),%eax
8010171f:	66 89 43 52          	mov    %ax,0x52(%ebx)
    ip->minor = dip->minor;
80101723:	0f b7 42 f8          	movzwl -0x8(%edx),%eax
80101727:	66 89 43 54          	mov    %ax,0x54(%ebx)
    ip->nlink = dip->nlink;
8010172b:	0f b7 42 fa          	movzwl -0x6(%edx),%eax
8010172f:	66 89 43 56          	mov    %ax,0x56(%ebx)
    ip->size = dip->size;
80101733:	8b 42 fc             	mov    -0x4(%edx),%eax
80101736:	89 43 58             	mov    %eax,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101739:	8d 43 5c             	lea    0x5c(%ebx),%eax
8010173c:	89 54 24 04          	mov    %edx,0x4(%esp)
80101740:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101747:	00 
80101748:	89 04 24             	mov    %eax,(%esp)
8010174b:	e8 00 2d 00 00       	call   80104450 <memmove>
    brelse(bp);
80101750:	89 34 24             	mov    %esi,(%esp)
80101753:	e8 88 ea ff ff       	call   801001e0 <brelse>
    ip->flags |= I_VALID;
80101758:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
    if(ip->type == 0)
8010175c:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101761:	0f 85 78 ff ff ff    	jne    801016df <ilock+0x2f>
      panic("ilock: no type");
80101767:	c7 04 24 ec 6e 10 80 	movl   $0x80106eec,(%esp)
8010176e:	e8 ed eb ff ff       	call   80100360 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101773:	c7 04 24 e6 6e 10 80 	movl   $0x80106ee6,(%esp)
8010177a:	e8 e1 eb ff ff       	call   80100360 <panic>
8010177f:	90                   	nop

80101780 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	56                   	push   %esi
80101784:	53                   	push   %ebx
80101785:	83 ec 10             	sub    $0x10,%esp
80101788:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
8010178b:	85 db                	test   %ebx,%ebx
8010178d:	74 24                	je     801017b3 <iunlock+0x33>
8010178f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101792:	89 34 24             	mov    %esi,(%esp)
80101795:	e8 d6 29 00 00       	call   80104170 <holdingsleep>
8010179a:	85 c0                	test   %eax,%eax
8010179c:	74 15                	je     801017b3 <iunlock+0x33>
8010179e:	8b 43 08             	mov    0x8(%ebx),%eax
801017a1:	85 c0                	test   %eax,%eax
801017a3:	7e 0e                	jle    801017b3 <iunlock+0x33>
    panic("iunlock");

  releasesleep(&ip->lock);
801017a5:	89 75 08             	mov    %esi,0x8(%ebp)
}
801017a8:	83 c4 10             	add    $0x10,%esp
801017ab:	5b                   	pop    %ebx
801017ac:	5e                   	pop    %esi
801017ad:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
801017ae:	e9 7d 29 00 00       	jmp    80104130 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
801017b3:	c7 04 24 fb 6e 10 80 	movl   $0x80106efb,(%esp)
801017ba:	e8 a1 eb ff ff       	call   80100360 <panic>
801017bf:	90                   	nop

801017c0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	57                   	push   %edi
801017c4:	56                   	push   %esi
801017c5:	53                   	push   %ebx
801017c6:	83 ec 1c             	sub    $0x1c,%esp
801017c9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&icache.lock);
801017cc:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801017d3:	e8 48 2a 00 00       	call   80104220 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
801017d8:	8b 46 08             	mov    0x8(%esi),%eax
801017db:	83 f8 01             	cmp    $0x1,%eax
801017de:	74 20                	je     80101800 <iput+0x40>
    ip->type = 0;
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
801017e0:	83 e8 01             	sub    $0x1,%eax
801017e3:	89 46 08             	mov    %eax,0x8(%esi)
  release(&icache.lock);
801017e6:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
}
801017ed:	83 c4 1c             	add    $0x1c,%esp
801017f0:	5b                   	pop    %ebx
801017f1:	5e                   	pop    %esi
801017f2:	5f                   	pop    %edi
801017f3:	5d                   	pop    %ebp
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
  release(&icache.lock);
801017f4:	e9 57 2b 00 00       	jmp    80104350 <release>
801017f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
// case it has to free the inode.
void
iput(struct inode *ip)
{
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
80101800:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
80101804:	74 da                	je     801017e0 <iput+0x20>
80101806:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
8010180b:	75 d3                	jne    801017e0 <iput+0x20>
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
8010180d:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101814:	89 f3                	mov    %esi,%ebx
80101816:	e8 35 2b 00 00       	call   80104350 <release>
8010181b:	8d 7e 30             	lea    0x30(%esi),%edi
8010181e:	eb 07                	jmp    80101827 <iput+0x67>
80101820:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101823:	39 fb                	cmp    %edi,%ebx
80101825:	74 19                	je     80101840 <iput+0x80>
    if(ip->addrs[i]){
80101827:	8b 53 5c             	mov    0x5c(%ebx),%edx
8010182a:	85 d2                	test   %edx,%edx
8010182c:	74 f2                	je     80101820 <iput+0x60>
      bfree(ip->dev, ip->addrs[i]);
8010182e:	8b 06                	mov    (%esi),%eax
80101830:	e8 ab fb ff ff       	call   801013e0 <bfree>
      ip->addrs[i] = 0;
80101835:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
8010183c:	eb e2                	jmp    80101820 <iput+0x60>
8010183e:	66 90                	xchg   %ax,%ax
    }
  }

  if(ip->addrs[NDIRECT]){
80101840:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101846:	85 c0                	test   %eax,%eax
80101848:	75 3e                	jne    80101888 <iput+0xc8>
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
8010184a:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101851:	89 34 24             	mov    %esi,(%esp)
80101854:	e8 97 fd ff ff       	call   801015f0 <iupdate>
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
    itrunc(ip);
    ip->type = 0;
80101859:	31 c0                	xor    %eax,%eax
8010185b:	66 89 46 50          	mov    %ax,0x50(%esi)
    iupdate(ip);
8010185f:	89 34 24             	mov    %esi,(%esp)
80101862:	e8 89 fd ff ff       	call   801015f0 <iupdate>
    acquire(&icache.lock);
80101867:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010186e:	e8 ad 29 00 00       	call   80104220 <acquire>
80101873:	8b 46 08             	mov    0x8(%esi),%eax
    ip->flags = 0;
80101876:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010187d:	e9 5e ff ff ff       	jmp    801017e0 <iput+0x20>
80101882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101888:	89 44 24 04          	mov    %eax,0x4(%esp)
8010188c:	8b 06                	mov    (%esi),%eax
    a = (uint*)bp->data;
    for(j = 0; j < NINDIRECT; j++){
8010188e:	31 db                	xor    %ebx,%ebx
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101890:	89 04 24             	mov    %eax,(%esp)
80101893:	e8 38 e8 ff ff       	call   801000d0 <bread>
80101898:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
8010189b:	8d 78 5c             	lea    0x5c(%eax),%edi
    for(j = 0; j < NINDIRECT; j++){
8010189e:	31 c0                	xor    %eax,%eax
801018a0:	eb 13                	jmp    801018b5 <iput+0xf5>
801018a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801018a8:	83 c3 01             	add    $0x1,%ebx
801018ab:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
801018b1:	89 d8                	mov    %ebx,%eax
801018b3:	74 10                	je     801018c5 <iput+0x105>
      if(a[j])
801018b5:	8b 14 87             	mov    (%edi,%eax,4),%edx
801018b8:	85 d2                	test   %edx,%edx
801018ba:	74 ec                	je     801018a8 <iput+0xe8>
        bfree(ip->dev, a[j]);
801018bc:	8b 06                	mov    (%esi),%eax
801018be:	e8 1d fb ff ff       	call   801013e0 <bfree>
801018c3:	eb e3                	jmp    801018a8 <iput+0xe8>
    }
    brelse(bp);
801018c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801018c8:	89 04 24             	mov    %eax,(%esp)
801018cb:	e8 10 e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018d0:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018d6:	8b 06                	mov    (%esi),%eax
801018d8:	e8 03 fb ff ff       	call   801013e0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018dd:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018e4:	00 00 00 
801018e7:	e9 5e ff ff ff       	jmp    8010184a <iput+0x8a>
801018ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801018f0 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
801018f0:	55                   	push   %ebp
801018f1:	89 e5                	mov    %esp,%ebp
801018f3:	53                   	push   %ebx
801018f4:	83 ec 14             	sub    $0x14,%esp
801018f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
801018fa:	89 1c 24             	mov    %ebx,(%esp)
801018fd:	e8 7e fe ff ff       	call   80101780 <iunlock>
  iput(ip);
80101902:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80101905:	83 c4 14             	add    $0x14,%esp
80101908:	5b                   	pop    %ebx
80101909:	5d                   	pop    %ebp
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
8010190a:	e9 b1 fe ff ff       	jmp    801017c0 <iput>
8010190f:	90                   	nop

80101910 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	8b 55 08             	mov    0x8(%ebp),%edx
80101916:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101919:	8b 0a                	mov    (%edx),%ecx
8010191b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010191e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101921:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101924:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101928:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010192b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010192f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101933:	8b 52 58             	mov    0x58(%edx),%edx
80101936:	89 50 10             	mov    %edx,0x10(%eax)
}
80101939:	5d                   	pop    %ebp
8010193a:	c3                   	ret    
8010193b:	90                   	nop
8010193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101940 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	57                   	push   %edi
80101944:	56                   	push   %esi
80101945:	53                   	push   %ebx
80101946:	83 ec 2c             	sub    $0x2c,%esp
80101949:	8b 45 0c             	mov    0xc(%ebp),%eax
8010194c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010194f:	8b 75 10             	mov    0x10(%ebp),%esi
80101952:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101955:	8b 45 14             	mov    0x14(%ebp),%eax
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101958:	66 83 7f 50 03       	cmpw   $0x3,0x50(%edi)

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
8010195d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101960:	0f 84 aa 00 00 00    	je     80101a10 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101966:	8b 47 58             	mov    0x58(%edi),%eax
80101969:	39 f0                	cmp    %esi,%eax
8010196b:	0f 82 c7 00 00 00    	jb     80101a38 <readi+0xf8>
80101971:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101974:	89 da                	mov    %ebx,%edx
80101976:	01 f2                	add    %esi,%edx
80101978:	0f 82 ba 00 00 00    	jb     80101a38 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
8010197e:	89 c1                	mov    %eax,%ecx
80101980:	29 f1                	sub    %esi,%ecx
80101982:	39 d0                	cmp    %edx,%eax
80101984:	0f 43 cb             	cmovae %ebx,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101987:	31 c0                	xor    %eax,%eax
80101989:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
8010198b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010198e:	74 70                	je     80101a00 <readi+0xc0>
80101990:	89 7d d8             	mov    %edi,-0x28(%ebp)
80101993:	89 c7                	mov    %eax,%edi
80101995:	8d 76 00             	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101998:	8b 5d d8             	mov    -0x28(%ebp),%ebx
8010199b:	89 f2                	mov    %esi,%edx
8010199d:	c1 ea 09             	shr    $0x9,%edx
801019a0:	89 d8                	mov    %ebx,%eax
801019a2:	e8 29 f9 ff ff       	call   801012d0 <bmap>
801019a7:	89 44 24 04          	mov    %eax,0x4(%esp)
801019ab:	8b 03                	mov    (%ebx),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
801019ad:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019b2:	89 04 24             	mov    %eax,(%esp)
801019b5:	e8 16 e7 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801019ba:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801019bd:	29 f9                	sub    %edi,%ecx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019bf:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019c1:	89 f0                	mov    %esi,%eax
801019c3:	25 ff 01 00 00       	and    $0x1ff,%eax
801019c8:	29 c3                	sub    %eax,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019ca:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019ce:	39 cb                	cmp    %ecx,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019d0:	89 44 24 04          	mov    %eax,0x4(%esp)
801019d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019d7:	0f 47 d9             	cmova  %ecx,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019da:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019de:	01 df                	add    %ebx,%edi
801019e0:	01 de                	add    %ebx,%esi
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019e2:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019e5:	89 04 24             	mov    %eax,(%esp)
801019e8:	e8 63 2a 00 00       	call   80104450 <memmove>
    brelse(bp);
801019ed:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019f0:	89 14 24             	mov    %edx,(%esp)
801019f3:	e8 e8 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019f8:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019fb:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801019fe:	77 98                	ja     80101998 <readi+0x58>
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101a00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a03:	83 c4 2c             	add    $0x2c,%esp
80101a06:	5b                   	pop    %ebx
80101a07:	5e                   	pop    %esi
80101a08:	5f                   	pop    %edi
80101a09:	5d                   	pop    %ebp
80101a0a:	c3                   	ret    
80101a0b:	90                   	nop
80101a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a10:	0f bf 47 52          	movswl 0x52(%edi),%eax
80101a14:	66 83 f8 09          	cmp    $0x9,%ax
80101a18:	77 1e                	ja     80101a38 <readi+0xf8>
80101a1a:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101a21:	85 c0                	test   %eax,%eax
80101a23:	74 13                	je     80101a38 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a25:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101a28:	89 75 10             	mov    %esi,0x10(%ebp)
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a2b:	83 c4 2c             	add    $0x2c,%esp
80101a2e:	5b                   	pop    %ebx
80101a2f:	5e                   	pop    %esi
80101a30:	5f                   	pop    %edi
80101a31:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a32:	ff e0                	jmp    *%eax
80101a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a3d:	eb c4                	jmp    80101a03 <readi+0xc3>
80101a3f:	90                   	nop

80101a40 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a40:	55                   	push   %ebp
80101a41:	89 e5                	mov    %esp,%ebp
80101a43:	57                   	push   %edi
80101a44:	56                   	push   %esi
80101a45:	53                   	push   %ebx
80101a46:	83 ec 2c             	sub    $0x2c,%esp
80101a49:	8b 45 08             	mov    0x8(%ebp),%eax
80101a4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a4f:	8b 4d 14             	mov    0x14(%ebp),%ecx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a52:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a57:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a5a:	8b 75 10             	mov    0x10(%ebp),%esi
80101a5d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a60:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a63:	0f 84 b7 00 00 00    	je     80101b20 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a69:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a6c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a6f:	0f 82 e3 00 00 00    	jb     80101b58 <writei+0x118>
80101a75:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101a78:	89 c8                	mov    %ecx,%eax
80101a7a:	01 f0                	add    %esi,%eax
80101a7c:	0f 82 d6 00 00 00    	jb     80101b58 <writei+0x118>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a82:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a87:	0f 87 cb 00 00 00    	ja     80101b58 <writei+0x118>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a8d:	85 c9                	test   %ecx,%ecx
80101a8f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a96:	74 77                	je     80101b0f <writei+0xcf>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a98:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a9b:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101a9d:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101aa2:	c1 ea 09             	shr    $0x9,%edx
80101aa5:	89 f8                	mov    %edi,%eax
80101aa7:	e8 24 f8 ff ff       	call   801012d0 <bmap>
80101aac:	89 44 24 04          	mov    %eax,0x4(%esp)
80101ab0:	8b 07                	mov    (%edi),%eax
80101ab2:	89 04 24             	mov    %eax,(%esp)
80101ab5:	e8 16 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101aba:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101abd:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101ac0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ac3:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ac5:	89 f0                	mov    %esi,%eax
80101ac7:	25 ff 01 00 00       	and    $0x1ff,%eax
80101acc:	29 c3                	sub    %eax,%ebx
80101ace:	39 cb                	cmp    %ecx,%ebx
80101ad0:	0f 47 d9             	cmova  %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101ad3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ad7:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101ad9:	89 54 24 04          	mov    %edx,0x4(%esp)
80101add:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101ae1:	89 04 24             	mov    %eax,(%esp)
80101ae4:	e8 67 29 00 00       	call   80104450 <memmove>
    log_write(bp);
80101ae9:	89 3c 24             	mov    %edi,(%esp)
80101aec:	e8 7f 12 00 00       	call   80102d70 <log_write>
    brelse(bp);
80101af1:	89 3c 24             	mov    %edi,(%esp)
80101af4:	e8 e7 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101af9:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101afc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101aff:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b02:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b05:	77 91                	ja     80101a98 <writei+0x58>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101b07:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b0a:	39 70 58             	cmp    %esi,0x58(%eax)
80101b0d:	72 39                	jb     80101b48 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b0f:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b12:	83 c4 2c             	add    $0x2c,%esp
80101b15:	5b                   	pop    %ebx
80101b16:	5e                   	pop    %esi
80101b17:	5f                   	pop    %edi
80101b18:	5d                   	pop    %ebp
80101b19:	c3                   	ret    
80101b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b24:	66 83 f8 09          	cmp    $0x9,%ax
80101b28:	77 2e                	ja     80101b58 <writei+0x118>
80101b2a:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101b31:	85 c0                	test   %eax,%eax
80101b33:	74 23                	je     80101b58 <writei+0x118>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b35:	89 4d 10             	mov    %ecx,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b38:	83 c4 2c             	add    $0x2c,%esp
80101b3b:	5b                   	pop    %ebx
80101b3c:	5e                   	pop    %esi
80101b3d:	5f                   	pop    %edi
80101b3e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b3f:	ff e0                	jmp    *%eax
80101b41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b48:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b4b:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b4e:	89 04 24             	mov    %eax,(%esp)
80101b51:	e8 9a fa ff ff       	call   801015f0 <iupdate>
80101b56:	eb b7                	jmp    80101b0f <writei+0xcf>
  }
  return n;
}
80101b58:	83 c4 2c             	add    $0x2c,%esp
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b5b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b60:	5b                   	pop    %ebx
80101b61:	5e                   	pop    %esi
80101b62:	5f                   	pop    %edi
80101b63:	5d                   	pop    %ebp
80101b64:	c3                   	ret    
80101b65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b70 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b70:	55                   	push   %ebp
80101b71:	89 e5                	mov    %esp,%ebp
80101b73:	83 ec 18             	sub    $0x18,%esp
  return strncmp(s, t, DIRSIZ);
80101b76:	8b 45 0c             	mov    0xc(%ebp),%eax
80101b79:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101b80:	00 
80101b81:	89 44 24 04          	mov    %eax,0x4(%esp)
80101b85:	8b 45 08             	mov    0x8(%ebp),%eax
80101b88:	89 04 24             	mov    %eax,(%esp)
80101b8b:	e8 40 29 00 00       	call   801044d0 <strncmp>
}
80101b90:	c9                   	leave  
80101b91:	c3                   	ret    
80101b92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	57                   	push   %edi
80101ba4:	56                   	push   %esi
80101ba5:	53                   	push   %ebx
80101ba6:	83 ec 2c             	sub    $0x2c,%esp
80101ba9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bac:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bb1:	0f 85 97 00 00 00    	jne    80101c4e <dirlookup+0xae>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bb7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bba:	31 ff                	xor    %edi,%edi
80101bbc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bbf:	85 d2                	test   %edx,%edx
80101bc1:	75 0d                	jne    80101bd0 <dirlookup+0x30>
80101bc3:	eb 73                	jmp    80101c38 <dirlookup+0x98>
80101bc5:	8d 76 00             	lea    0x0(%esi),%esi
80101bc8:	83 c7 10             	add    $0x10,%edi
80101bcb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bce:	76 68                	jbe    80101c38 <dirlookup+0x98>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bd0:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101bd7:	00 
80101bd8:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101bdc:	89 74 24 04          	mov    %esi,0x4(%esp)
80101be0:	89 1c 24             	mov    %ebx,(%esp)
80101be3:	e8 58 fd ff ff       	call   80101940 <readi>
80101be8:	83 f8 10             	cmp    $0x10,%eax
80101beb:	75 55                	jne    80101c42 <dirlookup+0xa2>
      panic("dirlink read");
    if(de.inum == 0)
80101bed:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bf2:	74 d4                	je     80101bc8 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101bf4:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bf7:	89 44 24 04          	mov    %eax,0x4(%esp)
80101bfb:	8b 45 0c             	mov    0xc(%ebp),%eax
80101bfe:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101c05:	00 
80101c06:	89 04 24             	mov    %eax,(%esp)
80101c09:	e8 c2 28 00 00       	call   801044d0 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101c0e:	85 c0                	test   %eax,%eax
80101c10:	75 b6                	jne    80101bc8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c12:	8b 45 10             	mov    0x10(%ebp),%eax
80101c15:	85 c0                	test   %eax,%eax
80101c17:	74 05                	je     80101c1e <dirlookup+0x7e>
        *poff = off;
80101c19:	8b 45 10             	mov    0x10(%ebp),%eax
80101c1c:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c1e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c22:	8b 03                	mov    (%ebx),%eax
80101c24:	e8 e7 f5 ff ff       	call   80101210 <iget>
    }
  }

  return 0;
}
80101c29:	83 c4 2c             	add    $0x2c,%esp
80101c2c:	5b                   	pop    %ebx
80101c2d:	5e                   	pop    %esi
80101c2e:	5f                   	pop    %edi
80101c2f:	5d                   	pop    %ebp
80101c30:	c3                   	ret    
80101c31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c38:	83 c4 2c             	add    $0x2c,%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101c3b:	31 c0                	xor    %eax,%eax
}
80101c3d:	5b                   	pop    %ebx
80101c3e:	5e                   	pop    %esi
80101c3f:	5f                   	pop    %edi
80101c40:	5d                   	pop    %ebp
80101c41:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101c42:	c7 04 24 15 6f 10 80 	movl   $0x80106f15,(%esp)
80101c49:	e8 12 e7 ff ff       	call   80100360 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c4e:	c7 04 24 03 6f 10 80 	movl   $0x80106f03,(%esp)
80101c55:	e8 06 e7 ff ff       	call   80100360 <panic>
80101c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101c60 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c60:	55                   	push   %ebp
80101c61:	89 e5                	mov    %esp,%ebp
80101c63:	57                   	push   %edi
80101c64:	89 cf                	mov    %ecx,%edi
80101c66:	56                   	push   %esi
80101c67:	53                   	push   %ebx
80101c68:	89 c3                	mov    %eax,%ebx
80101c6a:	83 ec 2c             	sub    $0x2c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c6d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c70:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c73:	0f 84 51 01 00 00    	je     80101dca <namex+0x16a>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101c79:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80101c7f:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c82:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c89:	e8 92 25 00 00       	call   80104220 <acquire>
  ip->ref++;
80101c8e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c92:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c99:	e8 b2 26 00 00       	call   80104350 <release>
80101c9e:	eb 03                	jmp    80101ca3 <namex+0x43>
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101ca0:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101ca3:	0f b6 03             	movzbl (%ebx),%eax
80101ca6:	3c 2f                	cmp    $0x2f,%al
80101ca8:	74 f6                	je     80101ca0 <namex+0x40>
    path++;
  if(*path == 0)
80101caa:	84 c0                	test   %al,%al
80101cac:	0f 84 ed 00 00 00    	je     80101d9f <namex+0x13f>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cb2:	0f b6 03             	movzbl (%ebx),%eax
80101cb5:	89 da                	mov    %ebx,%edx
80101cb7:	84 c0                	test   %al,%al
80101cb9:	0f 84 b1 00 00 00    	je     80101d70 <namex+0x110>
80101cbf:	3c 2f                	cmp    $0x2f,%al
80101cc1:	75 0f                	jne    80101cd2 <namex+0x72>
80101cc3:	e9 a8 00 00 00       	jmp    80101d70 <namex+0x110>
80101cc8:	3c 2f                	cmp    $0x2f,%al
80101cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101cd0:	74 0a                	je     80101cdc <namex+0x7c>
    path++;
80101cd2:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cd5:	0f b6 02             	movzbl (%edx),%eax
80101cd8:	84 c0                	test   %al,%al
80101cda:	75 ec                	jne    80101cc8 <namex+0x68>
80101cdc:	89 d1                	mov    %edx,%ecx
80101cde:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101ce0:	83 f9 0d             	cmp    $0xd,%ecx
80101ce3:	0f 8e 8f 00 00 00    	jle    80101d78 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101ce9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101ced:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101cf4:	00 
80101cf5:	89 3c 24             	mov    %edi,(%esp)
80101cf8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101cfb:	e8 50 27 00 00       	call   80104450 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101d00:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d03:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d05:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d08:	75 0e                	jne    80101d18 <namex+0xb8>
80101d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    path++;
80101d10:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d13:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d16:	74 f8                	je     80101d10 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d18:	89 34 24             	mov    %esi,(%esp)
80101d1b:	e8 90 f9 ff ff       	call   801016b0 <ilock>
    if(ip->type != T_DIR){
80101d20:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d25:	0f 85 85 00 00 00    	jne    80101db0 <namex+0x150>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d2b:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d2e:	85 d2                	test   %edx,%edx
80101d30:	74 09                	je     80101d3b <namex+0xdb>
80101d32:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d35:	0f 84 a5 00 00 00    	je     80101de0 <namex+0x180>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d3b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101d42:	00 
80101d43:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101d47:	89 34 24             	mov    %esi,(%esp)
80101d4a:	e8 51 fe ff ff       	call   80101ba0 <dirlookup>
80101d4f:	85 c0                	test   %eax,%eax
80101d51:	74 5d                	je     80101db0 <namex+0x150>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d53:	89 34 24             	mov    %esi,(%esp)
80101d56:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d59:	e8 22 fa ff ff       	call   80101780 <iunlock>
  iput(ip);
80101d5e:	89 34 24             	mov    %esi,(%esp)
80101d61:	e8 5a fa ff ff       	call   801017c0 <iput>
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
    }
    iunlockput(ip);
    ip = next;
80101d66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d69:	89 c6                	mov    %eax,%esi
80101d6b:	e9 33 ff ff ff       	jmp    80101ca3 <namex+0x43>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d70:	31 c9                	xor    %ecx,%ecx
80101d72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d78:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80101d7c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101d80:	89 3c 24             	mov    %edi,(%esp)
80101d83:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d86:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d89:	e8 c2 26 00 00       	call   80104450 <memmove>
    name[len] = 0;
80101d8e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d91:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d94:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d98:	89 d3                	mov    %edx,%ebx
80101d9a:	e9 66 ff ff ff       	jmp    80101d05 <namex+0xa5>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d9f:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101da2:	85 c0                	test   %eax,%eax
80101da4:	75 4c                	jne    80101df2 <namex+0x192>
80101da6:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101da8:	83 c4 2c             	add    $0x2c,%esp
80101dab:	5b                   	pop    %ebx
80101dac:	5e                   	pop    %esi
80101dad:	5f                   	pop    %edi
80101dae:	5d                   	pop    %ebp
80101daf:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101db0:	89 34 24             	mov    %esi,(%esp)
80101db3:	e8 c8 f9 ff ff       	call   80101780 <iunlock>
  iput(ip);
80101db8:	89 34 24             	mov    %esi,(%esp)
80101dbb:	e8 00 fa ff ff       	call   801017c0 <iput>
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dc0:	83 c4 2c             	add    $0x2c,%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101dc3:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dc5:	5b                   	pop    %ebx
80101dc6:	5e                   	pop    %esi
80101dc7:	5f                   	pop    %edi
80101dc8:	5d                   	pop    %ebp
80101dc9:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101dca:	ba 01 00 00 00       	mov    $0x1,%edx
80101dcf:	b8 01 00 00 00       	mov    $0x1,%eax
80101dd4:	e8 37 f4 ff ff       	call   80101210 <iget>
80101dd9:	89 c6                	mov    %eax,%esi
80101ddb:	e9 c3 fe ff ff       	jmp    80101ca3 <namex+0x43>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101de0:	89 34 24             	mov    %esi,(%esp)
80101de3:	e8 98 f9 ff ff       	call   80101780 <iunlock>
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101de8:	83 c4 2c             	add    $0x2c,%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101deb:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101ded:	5b                   	pop    %ebx
80101dee:	5e                   	pop    %esi
80101def:	5f                   	pop    %edi
80101df0:	5d                   	pop    %ebp
80101df1:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101df2:	89 34 24             	mov    %esi,(%esp)
80101df5:	e8 c6 f9 ff ff       	call   801017c0 <iput>
    return 0;
80101dfa:	31 c0                	xor    %eax,%eax
80101dfc:	eb aa                	jmp    80101da8 <namex+0x148>
80101dfe:	66 90                	xchg   %ax,%ax

80101e00 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101e00:	55                   	push   %ebp
80101e01:	89 e5                	mov    %esp,%ebp
80101e03:	57                   	push   %edi
80101e04:	56                   	push   %esi
80101e05:	53                   	push   %ebx
80101e06:	83 ec 2c             	sub    $0x2c,%esp
80101e09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e0c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e0f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101e16:	00 
80101e17:	89 1c 24             	mov    %ebx,(%esp)
80101e1a:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e1e:	e8 7d fd ff ff       	call   80101ba0 <dirlookup>
80101e23:	85 c0                	test   %eax,%eax
80101e25:	0f 85 8b 00 00 00    	jne    80101eb6 <dirlink+0xb6>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e2b:	8b 43 58             	mov    0x58(%ebx),%eax
80101e2e:	31 ff                	xor    %edi,%edi
80101e30:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e33:	85 c0                	test   %eax,%eax
80101e35:	75 13                	jne    80101e4a <dirlink+0x4a>
80101e37:	eb 35                	jmp    80101e6e <dirlink+0x6e>
80101e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e40:	8d 57 10             	lea    0x10(%edi),%edx
80101e43:	39 53 58             	cmp    %edx,0x58(%ebx)
80101e46:	89 d7                	mov    %edx,%edi
80101e48:	76 24                	jbe    80101e6e <dirlink+0x6e>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e4a:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101e51:	00 
80101e52:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101e56:	89 74 24 04          	mov    %esi,0x4(%esp)
80101e5a:	89 1c 24             	mov    %ebx,(%esp)
80101e5d:	e8 de fa ff ff       	call   80101940 <readi>
80101e62:	83 f8 10             	cmp    $0x10,%eax
80101e65:	75 5e                	jne    80101ec5 <dirlink+0xc5>
      panic("dirlink read");
    if(de.inum == 0)
80101e67:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e6c:	75 d2                	jne    80101e40 <dirlink+0x40>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e6e:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e71:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101e78:	00 
80101e79:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e7d:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e80:	89 04 24             	mov    %eax,(%esp)
80101e83:	e8 b8 26 00 00       	call   80104540 <strncpy>
  de.inum = inum;
80101e88:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e8b:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101e92:	00 
80101e93:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101e97:	89 74 24 04          	mov    %esi,0x4(%esp)
80101e9b:	89 1c 24             	mov    %ebx,(%esp)
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e9e:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ea2:	e8 99 fb ff ff       	call   80101a40 <writei>
80101ea7:	83 f8 10             	cmp    $0x10,%eax
80101eaa:	75 25                	jne    80101ed1 <dirlink+0xd1>
    panic("dirlink");

  return 0;
80101eac:	31 c0                	xor    %eax,%eax
}
80101eae:	83 c4 2c             	add    $0x2c,%esp
80101eb1:	5b                   	pop    %ebx
80101eb2:	5e                   	pop    %esi
80101eb3:	5f                   	pop    %edi
80101eb4:	5d                   	pop    %ebp
80101eb5:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101eb6:	89 04 24             	mov    %eax,(%esp)
80101eb9:	e8 02 f9 ff ff       	call   801017c0 <iput>
    return -1;
80101ebe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ec3:	eb e9                	jmp    80101eae <dirlink+0xae>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101ec5:	c7 04 24 15 6f 10 80 	movl   $0x80106f15,(%esp)
80101ecc:	e8 8f e4 ff ff       	call   80100360 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101ed1:	c7 04 24 02 75 10 80 	movl   $0x80107502,(%esp)
80101ed8:	e8 83 e4 ff ff       	call   80100360 <panic>
80101edd:	8d 76 00             	lea    0x0(%esi),%esi

80101ee0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101ee0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ee1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101ee3:	89 e5                	mov    %esp,%ebp
80101ee5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ee8:	8b 45 08             	mov    0x8(%ebp),%eax
80101eeb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101eee:	e8 6d fd ff ff       	call   80101c60 <namex>
}
80101ef3:	c9                   	leave  
80101ef4:	c3                   	ret    
80101ef5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ef9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f00 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f00:	55                   	push   %ebp
  return namex(path, 1, name);
80101f01:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101f06:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f08:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f0b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f0e:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101f0f:	e9 4c fd ff ff       	jmp    80101c60 <namex>
80101f14:	66 90                	xchg   %ax,%ax
80101f16:	66 90                	xchg   %ax,%ax
80101f18:	66 90                	xchg   %ax,%ax
80101f1a:	66 90                	xchg   %ax,%ax
80101f1c:	66 90                	xchg   %ax,%ax
80101f1e:	66 90                	xchg   %ax,%ax

80101f20 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f20:	55                   	push   %ebp
80101f21:	89 e5                	mov    %esp,%ebp
80101f23:	56                   	push   %esi
80101f24:	89 c6                	mov    %eax,%esi
80101f26:	53                   	push   %ebx
80101f27:	83 ec 10             	sub    $0x10,%esp
  if(b == 0)
80101f2a:	85 c0                	test   %eax,%eax
80101f2c:	0f 84 99 00 00 00    	je     80101fcb <idestart+0xab>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f32:	8b 48 08             	mov    0x8(%eax),%ecx
80101f35:	81 f9 e7 03 00 00    	cmp    $0x3e7,%ecx
80101f3b:	0f 87 7e 00 00 00    	ja     80101fbf <idestart+0x9f>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f41:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f46:	66 90                	xchg   %ax,%ax
80101f48:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f49:	83 e0 c0             	and    $0xffffffc0,%eax
80101f4c:	3c 40                	cmp    $0x40,%al
80101f4e:	75 f8                	jne    80101f48 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f50:	31 db                	xor    %ebx,%ebx
80101f52:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f57:	89 d8                	mov    %ebx,%eax
80101f59:	ee                   	out    %al,(%dx)
80101f5a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f5f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f64:	ee                   	out    %al,(%dx)
80101f65:	0f b6 c1             	movzbl %cl,%eax
80101f68:	b2 f3                	mov    $0xf3,%dl
80101f6a:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f6b:	89 c8                	mov    %ecx,%eax
80101f6d:	b2 f4                	mov    $0xf4,%dl
80101f6f:	c1 f8 08             	sar    $0x8,%eax
80101f72:	ee                   	out    %al,(%dx)
80101f73:	b2 f5                	mov    $0xf5,%dl
80101f75:	89 d8                	mov    %ebx,%eax
80101f77:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f78:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101f7c:	b2 f6                	mov    $0xf6,%dl
80101f7e:	83 e0 01             	and    $0x1,%eax
80101f81:	c1 e0 04             	shl    $0x4,%eax
80101f84:	83 c8 e0             	or     $0xffffffe0,%eax
80101f87:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101f88:	f6 06 04             	testb  $0x4,(%esi)
80101f8b:	75 13                	jne    80101fa0 <idestart+0x80>
80101f8d:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f92:	b8 20 00 00 00       	mov    $0x20,%eax
80101f97:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f98:	83 c4 10             	add    $0x10,%esp
80101f9b:	5b                   	pop    %ebx
80101f9c:	5e                   	pop    %esi
80101f9d:	5d                   	pop    %ebp
80101f9e:	c3                   	ret    
80101f9f:	90                   	nop
80101fa0:	b2 f7                	mov    $0xf7,%dl
80101fa2:	b8 30 00 00 00       	mov    $0x30,%eax
80101fa7:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101fa8:	b9 80 00 00 00       	mov    $0x80,%ecx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101fad:	83 c6 5c             	add    $0x5c,%esi
80101fb0:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fb5:	fc                   	cld    
80101fb6:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fb8:	83 c4 10             	add    $0x10,%esp
80101fbb:	5b                   	pop    %ebx
80101fbc:	5e                   	pop    %esi
80101fbd:	5d                   	pop    %ebp
80101fbe:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101fbf:	c7 04 24 80 6f 10 80 	movl   $0x80106f80,(%esp)
80101fc6:	e8 95 e3 ff ff       	call   80100360 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101fcb:	c7 04 24 77 6f 10 80 	movl   $0x80106f77,(%esp)
80101fd2:	e8 89 e3 ff ff       	call   80100360 <panic>
80101fd7:	89 f6                	mov    %esi,%esi
80101fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fe0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101fe0:	55                   	push   %ebp
80101fe1:	89 e5                	mov    %esp,%ebp
80101fe3:	83 ec 18             	sub    $0x18,%esp
  int i;

  initlock(&idelock, "ide");
80101fe6:	c7 44 24 04 92 6f 10 	movl   $0x80106f92,0x4(%esp)
80101fed:	80 
80101fee:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80101ff5:	e8 a6 21 00 00       	call   801041a0 <initlock>
  picenable(IRQ_IDE);
80101ffa:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102001:	e8 3a 12 00 00       	call   80103240 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102006:	a1 80 2d 11 80       	mov    0x80112d80,%eax
8010200b:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102012:	83 e8 01             	sub    $0x1,%eax
80102015:	89 44 24 04          	mov    %eax,0x4(%esp)
80102019:	e8 92 02 00 00       	call   801022b0 <ioapicenable>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010201e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102023:	90                   	nop
80102024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102028:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102029:	83 e0 c0             	and    $0xffffffc0,%eax
8010202c:	3c 40                	cmp    $0x40,%al
8010202e:	75 f8                	jne    80102028 <ideinit+0x48>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102030:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102035:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010203a:	ee                   	out    %al,(%dx)
8010203b:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102040:	b2 f7                	mov    $0xf7,%dl
80102042:	eb 09                	jmp    8010204d <ideinit+0x6d>
80102044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102048:	83 e9 01             	sub    $0x1,%ecx
8010204b:	74 0f                	je     8010205c <ideinit+0x7c>
8010204d:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
8010204e:	84 c0                	test   %al,%al
80102050:	74 f6                	je     80102048 <ideinit+0x68>
      havedisk1 = 1;
80102052:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102059:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010205c:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102061:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102066:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
80102067:	c9                   	leave  
80102068:	c3                   	ret    
80102069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102070 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102070:	55                   	push   %ebp
80102071:	89 e5                	mov    %esp,%ebp
80102073:	57                   	push   %edi
80102074:	56                   	push   %esi
80102075:	53                   	push   %ebx
80102076:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102079:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102080:	e8 9b 21 00 00       	call   80104220 <acquire>
  if((b = idequeue) == 0){
80102085:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
8010208b:	85 db                	test   %ebx,%ebx
8010208d:	74 30                	je     801020bf <ideintr+0x4f>
    release(&idelock);
    // cprintf("spurious IDE interrupt\n");
    return;
  }
  idequeue = b->qnext;
8010208f:	8b 43 58             	mov    0x58(%ebx),%eax
80102092:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102097:	8b 33                	mov    (%ebx),%esi
80102099:	f7 c6 04 00 00 00    	test   $0x4,%esi
8010209f:	74 37                	je     801020d8 <ideintr+0x68>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020a1:	83 e6 fb             	and    $0xfffffffb,%esi
801020a4:	83 ce 02             	or     $0x2,%esi
801020a7:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801020a9:	89 1c 24             	mov    %ebx,(%esp)
801020ac:	e8 2f 1e 00 00       	call   80103ee0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
801020b1:	a1 64 a5 10 80       	mov    0x8010a564,%eax
801020b6:	85 c0                	test   %eax,%eax
801020b8:	74 05                	je     801020bf <ideintr+0x4f>
    idestart(idequeue);
801020ba:	e8 61 fe ff ff       	call   80101f20 <idestart>
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
  if((b = idequeue) == 0){
    release(&idelock);
801020bf:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
801020c6:	e8 85 22 00 00       	call   80104350 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
801020cb:	83 c4 1c             	add    $0x1c,%esp
801020ce:	5b                   	pop    %ebx
801020cf:	5e                   	pop    %esi
801020d0:	5f                   	pop    %edi
801020d1:	5d                   	pop    %ebp
801020d2:	c3                   	ret    
801020d3:	90                   	nop
801020d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020d8:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020dd:	8d 76 00             	lea    0x0(%esi),%esi
801020e0:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020e1:	89 c1                	mov    %eax,%ecx
801020e3:	83 e1 c0             	and    $0xffffffc0,%ecx
801020e6:	80 f9 40             	cmp    $0x40,%cl
801020e9:	75 f5                	jne    801020e0 <ideintr+0x70>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020eb:	a8 21                	test   $0x21,%al
801020ed:	75 b2                	jne    801020a1 <ideintr+0x31>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020ef:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020f2:	b9 80 00 00 00       	mov    $0x80,%ecx
801020f7:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020fc:	fc                   	cld    
801020fd:	f3 6d                	rep insl (%dx),%es:(%edi)
801020ff:	8b 33                	mov    (%ebx),%esi
80102101:	eb 9e                	jmp    801020a1 <ideintr+0x31>
80102103:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102110 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102110:	55                   	push   %ebp
80102111:	89 e5                	mov    %esp,%ebp
80102113:	53                   	push   %ebx
80102114:	83 ec 14             	sub    $0x14,%esp
80102117:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010211a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010211d:	89 04 24             	mov    %eax,(%esp)
80102120:	e8 4b 20 00 00       	call   80104170 <holdingsleep>
80102125:	85 c0                	test   %eax,%eax
80102127:	0f 84 9e 00 00 00    	je     801021cb <iderw+0xbb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010212d:	8b 03                	mov    (%ebx),%eax
8010212f:	83 e0 06             	and    $0x6,%eax
80102132:	83 f8 02             	cmp    $0x2,%eax
80102135:	0f 84 a8 00 00 00    	je     801021e3 <iderw+0xd3>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010213b:	8b 53 04             	mov    0x4(%ebx),%edx
8010213e:	85 d2                	test   %edx,%edx
80102140:	74 0d                	je     8010214f <iderw+0x3f>
80102142:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102147:	85 c0                	test   %eax,%eax
80102149:	0f 84 88 00 00 00    	je     801021d7 <iderw+0xc7>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
8010214f:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102156:	e8 c5 20 00 00       	call   80104220 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010215b:	a1 64 a5 10 80       	mov    0x8010a564,%eax
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102160:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102167:	85 c0                	test   %eax,%eax
80102169:	75 07                	jne    80102172 <iderw+0x62>
8010216b:	eb 4e                	jmp    801021bb <iderw+0xab>
8010216d:	8d 76 00             	lea    0x0(%esi),%esi
80102170:	89 d0                	mov    %edx,%eax
80102172:	8b 50 58             	mov    0x58(%eax),%edx
80102175:	85 d2                	test   %edx,%edx
80102177:	75 f7                	jne    80102170 <iderw+0x60>
80102179:	83 c0 58             	add    $0x58,%eax
    ;
  *pp = b;
8010217c:	89 18                	mov    %ebx,(%eax)

  // Start disk if necessary.
  if(idequeue == b)
8010217e:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
80102184:	74 3c                	je     801021c2 <iderw+0xb2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102186:	8b 03                	mov    (%ebx),%eax
80102188:	83 e0 06             	and    $0x6,%eax
8010218b:	83 f8 02             	cmp    $0x2,%eax
8010218e:	74 1a                	je     801021aa <iderw+0x9a>
    sleep(b, &idelock);
80102190:	c7 44 24 04 80 a5 10 	movl   $0x8010a580,0x4(%esp)
80102197:	80 
80102198:	89 1c 24             	mov    %ebx,(%esp)
8010219b:	e8 a0 1b 00 00       	call   80103d40 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021a0:	8b 13                	mov    (%ebx),%edx
801021a2:	83 e2 06             	and    $0x6,%edx
801021a5:	83 fa 02             	cmp    $0x2,%edx
801021a8:	75 e6                	jne    80102190 <iderw+0x80>
    sleep(b, &idelock);
  }

  release(&idelock);
801021aa:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801021b1:	83 c4 14             	add    $0x14,%esp
801021b4:	5b                   	pop    %ebx
801021b5:	5d                   	pop    %ebp
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }

  release(&idelock);
801021b6:	e9 95 21 00 00       	jmp    80104350 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021bb:	b8 64 a5 10 80       	mov    $0x8010a564,%eax
801021c0:	eb ba                	jmp    8010217c <iderw+0x6c>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
801021c2:	89 d8                	mov    %ebx,%eax
801021c4:	e8 57 fd ff ff       	call   80101f20 <idestart>
801021c9:	eb bb                	jmp    80102186 <iderw+0x76>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
801021cb:	c7 04 24 96 6f 10 80 	movl   $0x80106f96,(%esp)
801021d2:	e8 89 e1 ff ff       	call   80100360 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021d7:	c7 04 24 c1 6f 10 80 	movl   $0x80106fc1,(%esp)
801021de:	e8 7d e1 ff ff       	call   80100360 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021e3:	c7 04 24 ac 6f 10 80 	movl   $0x80106fac,(%esp)
801021ea:	e8 71 e1 ff ff       	call   80100360 <panic>
801021ef:	90                   	nop

801021f0 <ioapicinit>:
801021f0:	a1 84 27 11 80       	mov    0x80112784,%eax
801021f5:	85 c0                	test   %eax,%eax
801021f7:	0f 84 a8 00 00 00    	je     801022a5 <ioapicinit+0xb5>
801021fd:	55                   	push   %ebp
801021fe:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
80102205:	00 c0 fe 
80102208:	89 e5                	mov    %esp,%ebp
8010220a:	56                   	push   %esi
8010220b:	53                   	push   %ebx
8010220c:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102213:	00 00 00 
80102216:	8b 15 54 26 11 80    	mov    0x80112654,%edx
8010221c:	8b 72 10             	mov    0x10(%edx),%esi
8010221f:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102225:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
8010222b:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80102232:	89 f0                	mov    %esi,%eax
80102234:	c1 e8 10             	shr    $0x10,%eax
80102237:	0f b6 f0             	movzbl %al,%esi
8010223a:	8b 41 10             	mov    0x10(%ecx),%eax
8010223d:	c1 e8 18             	shr    $0x18,%eax
80102240:	39 d0                	cmp    %edx,%eax
80102242:	74 16                	je     8010225a <ioapicinit+0x6a>
80102244:	83 ec 0c             	sub    $0xc,%esp
80102247:	68 e0 6f 10 80       	push   $0x80106fe0
8010224c:	e8 ff e3 ff ff       	call   80100650 <cprintf>
80102251:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102257:	83 c4 10             	add    $0x10,%esp
8010225a:	83 c6 21             	add    $0x21,%esi
8010225d:	ba 10 00 00 00       	mov    $0x10,%edx
80102262:	b8 20 00 00 00       	mov    $0x20,%eax
80102267:	89 f6                	mov    %esi,%esi
80102269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102270:	89 11                	mov    %edx,(%ecx)
80102272:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102278:	89 c3                	mov    %eax,%ebx
8010227a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102280:	83 c0 01             	add    $0x1,%eax
80102283:	89 59 10             	mov    %ebx,0x10(%ecx)
80102286:	8d 5a 01             	lea    0x1(%edx),%ebx
80102289:	83 c2 02             	add    $0x2,%edx
8010228c:	39 f0                	cmp    %esi,%eax
8010228e:	89 19                	mov    %ebx,(%ecx)
80102290:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102296:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010229d:	75 d1                	jne    80102270 <ioapicinit+0x80>
8010229f:	8d 65 f8             	lea    -0x8(%ebp),%esp
801022a2:	5b                   	pop    %ebx
801022a3:	5e                   	pop    %esi
801022a4:	5d                   	pop    %ebp
801022a5:	f3 c3                	repz ret 
801022a7:	89 f6                	mov    %esi,%esi
801022a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022b0 <ioapicenable>:
801022b0:	8b 15 84 27 11 80    	mov    0x80112784,%edx
801022b6:	55                   	push   %ebp
801022b7:	89 e5                	mov    %esp,%ebp
801022b9:	85 d2                	test   %edx,%edx
801022bb:	8b 45 08             	mov    0x8(%ebp),%eax
801022be:	74 2b                	je     801022eb <ioapicenable+0x3b>
801022c0:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022c6:	8d 50 20             	lea    0x20(%eax),%edx
801022c9:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022cd:	89 01                	mov    %eax,(%ecx)
801022cf:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022d5:	83 c0 01             	add    $0x1,%eax
801022d8:	89 51 10             	mov    %edx,0x10(%ecx)
801022db:	8b 55 0c             	mov    0xc(%ebp),%edx
801022de:	89 01                	mov    %eax,(%ecx)
801022e0:	a1 54 26 11 80       	mov    0x80112654,%eax
801022e5:	c1 e2 18             	shl    $0x18,%edx
801022e8:	89 50 10             	mov    %edx,0x10(%eax)
801022eb:	5d                   	pop    %ebp
801022ec:	c3                   	ret    
801022ed:	66 90                	xchg   %ax,%ax
801022ef:	90                   	nop

801022f0 <kfree>:
801022f0:	55                   	push   %ebp
801022f1:	89 e5                	mov    %esp,%ebp
801022f3:	53                   	push   %ebx
801022f4:	83 ec 04             	sub    $0x4,%esp
801022f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022fa:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102300:	75 70                	jne    80102372 <kfree+0x82>
80102302:	81 fb 28 56 11 80    	cmp    $0x80115628,%ebx
80102308:	72 68                	jb     80102372 <kfree+0x82>
8010230a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102310:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102315:	77 5b                	ja     80102372 <kfree+0x82>
80102317:	83 ec 04             	sub    $0x4,%esp
8010231a:	68 00 10 00 00       	push   $0x1000
8010231f:	6a 01                	push   $0x1
80102321:	53                   	push   %ebx
80102322:	e8 79 20 00 00       	call   801043a0 <memset>
80102327:	8b 15 94 26 11 80    	mov    0x80112694,%edx
8010232d:	83 c4 10             	add    $0x10,%esp
80102330:	85 d2                	test   %edx,%edx
80102332:	75 2c                	jne    80102360 <kfree+0x70>
80102334:	a1 98 26 11 80       	mov    0x80112698,%eax
80102339:	89 03                	mov    %eax,(%ebx)
8010233b:	a1 94 26 11 80       	mov    0x80112694,%eax
80102340:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
80102346:	85 c0                	test   %eax,%eax
80102348:	75 06                	jne    80102350 <kfree+0x60>
8010234a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010234d:	c9                   	leave  
8010234e:	c3                   	ret    
8010234f:	90                   	nop
80102350:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
80102357:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010235a:	c9                   	leave  
8010235b:	e9 f0 1f 00 00       	jmp    80104350 <release>
80102360:	83 ec 0c             	sub    $0xc,%esp
80102363:	68 60 26 11 80       	push   $0x80112660
80102368:	e8 b3 1e 00 00       	call   80104220 <acquire>
8010236d:	83 c4 10             	add    $0x10,%esp
80102370:	eb c2                	jmp    80102334 <kfree+0x44>
80102372:	83 ec 0c             	sub    $0xc,%esp
80102375:	68 12 70 10 80       	push   $0x80107012
8010237a:	e8 e1 df ff ff       	call   80100360 <panic>
8010237f:	90                   	nop

80102380 <freerange>:
80102380:	55                   	push   %ebp
80102381:	89 e5                	mov    %esp,%ebp
80102383:	56                   	push   %esi
80102384:	53                   	push   %ebx
80102385:	8b 45 08             	mov    0x8(%ebp),%eax
80102388:	8b 75 0c             	mov    0xc(%ebp),%esi
8010238b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102391:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102397:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010239d:	39 de                	cmp    %ebx,%esi
8010239f:	72 23                	jb     801023c4 <freerange+0x44>
801023a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801023a8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023ae:	83 ec 0c             	sub    $0xc,%esp
801023b1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023b7:	50                   	push   %eax
801023b8:	e8 33 ff ff ff       	call   801022f0 <kfree>
801023bd:	83 c4 10             	add    $0x10,%esp
801023c0:	39 f3                	cmp    %esi,%ebx
801023c2:	76 e4                	jbe    801023a8 <freerange+0x28>
801023c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023c7:	5b                   	pop    %ebx
801023c8:	5e                   	pop    %esi
801023c9:	5d                   	pop    %ebp
801023ca:	c3                   	ret    
801023cb:	90                   	nop
801023cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023d0 <kinit1>:
801023d0:	55                   	push   %ebp
801023d1:	89 e5                	mov    %esp,%ebp
801023d3:	56                   	push   %esi
801023d4:	53                   	push   %ebx
801023d5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023d8:	83 ec 08             	sub    $0x8,%esp
801023db:	68 18 70 10 80       	push   $0x80107018
801023e0:	68 60 26 11 80       	push   $0x80112660
801023e5:	e8 b6 1d 00 00       	call   801041a0 <initlock>
801023ea:	8b 45 08             	mov    0x8(%ebp),%eax
801023ed:	83 c4 10             	add    $0x10,%esp
801023f0:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
801023f7:	00 00 00 
801023fa:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102400:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102406:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010240c:	39 de                	cmp    %ebx,%esi
8010240e:	72 1c                	jb     8010242c <kinit1+0x5c>
80102410:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102416:	83 ec 0c             	sub    $0xc,%esp
80102419:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010241f:	50                   	push   %eax
80102420:	e8 cb fe ff ff       	call   801022f0 <kfree>
80102425:	83 c4 10             	add    $0x10,%esp
80102428:	39 de                	cmp    %ebx,%esi
8010242a:	73 e4                	jae    80102410 <kinit1+0x40>
8010242c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010242f:	5b                   	pop    %ebx
80102430:	5e                   	pop    %esi
80102431:	5d                   	pop    %ebp
80102432:	c3                   	ret    
80102433:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102440 <kinit2>:
80102440:	55                   	push   %ebp
80102441:	89 e5                	mov    %esp,%ebp
80102443:	56                   	push   %esi
80102444:	53                   	push   %ebx
80102445:	8b 45 08             	mov    0x8(%ebp),%eax
80102448:	8b 75 0c             	mov    0xc(%ebp),%esi
8010244b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102451:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102457:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010245d:	39 de                	cmp    %ebx,%esi
8010245f:	72 23                	jb     80102484 <kinit2+0x44>
80102461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102468:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010246e:	83 ec 0c             	sub    $0xc,%esp
80102471:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102477:	50                   	push   %eax
80102478:	e8 73 fe ff ff       	call   801022f0 <kfree>
8010247d:	83 c4 10             	add    $0x10,%esp
80102480:	39 de                	cmp    %ebx,%esi
80102482:	73 e4                	jae    80102468 <kinit2+0x28>
80102484:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
8010248b:	00 00 00 
8010248e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102491:	5b                   	pop    %ebx
80102492:	5e                   	pop    %esi
80102493:	5d                   	pop    %ebp
80102494:	c3                   	ret    
80102495:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024a0 <kalloc>:
801024a0:	55                   	push   %ebp
801024a1:	89 e5                	mov    %esp,%ebp
801024a3:	53                   	push   %ebx
801024a4:	83 ec 04             	sub    $0x4,%esp
801024a7:	a1 94 26 11 80       	mov    0x80112694,%eax
801024ac:	85 c0                	test   %eax,%eax
801024ae:	75 30                	jne    801024e0 <kalloc+0x40>
801024b0:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
801024b6:	85 db                	test   %ebx,%ebx
801024b8:	74 1c                	je     801024d6 <kalloc+0x36>
801024ba:	8b 13                	mov    (%ebx),%edx
801024bc:	89 15 98 26 11 80    	mov    %edx,0x80112698
801024c2:	85 c0                	test   %eax,%eax
801024c4:	74 10                	je     801024d6 <kalloc+0x36>
801024c6:	83 ec 0c             	sub    $0xc,%esp
801024c9:	68 60 26 11 80       	push   $0x80112660
801024ce:	e8 7d 1e 00 00       	call   80104350 <release>
801024d3:	83 c4 10             	add    $0x10,%esp
801024d6:	89 d8                	mov    %ebx,%eax
801024d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024db:	c9                   	leave  
801024dc:	c3                   	ret    
801024dd:	8d 76 00             	lea    0x0(%esi),%esi
801024e0:	83 ec 0c             	sub    $0xc,%esp
801024e3:	68 60 26 11 80       	push   $0x80112660
801024e8:	e8 33 1d 00 00       	call   80104220 <acquire>
801024ed:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
801024f3:	83 c4 10             	add    $0x10,%esp
801024f6:	a1 94 26 11 80       	mov    0x80112694,%eax
801024fb:	85 db                	test   %ebx,%ebx
801024fd:	75 bb                	jne    801024ba <kalloc+0x1a>
801024ff:	eb c1                	jmp    801024c2 <kalloc+0x22>
80102501:	66 90                	xchg   %ax,%ax
80102503:	66 90                	xchg   %ax,%ax
80102505:	66 90                	xchg   %ax,%ax
80102507:	66 90                	xchg   %ax,%ax
80102509:	66 90                	xchg   %ax,%ax
8010250b:	66 90                	xchg   %ax,%ax
8010250d:	66 90                	xchg   %ax,%ax
8010250f:	90                   	nop

80102510 <kbdgetc>:
80102510:	55                   	push   %ebp
80102511:	ba 64 00 00 00       	mov    $0x64,%edx
80102516:	89 e5                	mov    %esp,%ebp
80102518:	ec                   	in     (%dx),%al
80102519:	a8 01                	test   $0x1,%al
8010251b:	0f 84 af 00 00 00    	je     801025d0 <kbdgetc+0xc0>
80102521:	ba 60 00 00 00       	mov    $0x60,%edx
80102526:	ec                   	in     (%dx),%al
80102527:	0f b6 d0             	movzbl %al,%edx
8010252a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102530:	74 7e                	je     801025b0 <kbdgetc+0xa0>
80102532:	84 c0                	test   %al,%al
80102534:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010253a:	79 24                	jns    80102560 <kbdgetc+0x50>
8010253c:	f6 c1 40             	test   $0x40,%cl
8010253f:	75 05                	jne    80102546 <kbdgetc+0x36>
80102541:	89 c2                	mov    %eax,%edx
80102543:	83 e2 7f             	and    $0x7f,%edx
80102546:	0f b6 82 40 71 10 80 	movzbl -0x7fef8ec0(%edx),%eax
8010254d:	83 c8 40             	or     $0x40,%eax
80102550:	0f b6 c0             	movzbl %al,%eax
80102553:	f7 d0                	not    %eax
80102555:	21 c8                	and    %ecx,%eax
80102557:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
8010255c:	31 c0                	xor    %eax,%eax
8010255e:	5d                   	pop    %ebp
8010255f:	c3                   	ret    
80102560:	f6 c1 40             	test   $0x40,%cl
80102563:	74 09                	je     8010256e <kbdgetc+0x5e>
80102565:	83 c8 80             	or     $0xffffff80,%eax
80102568:	83 e1 bf             	and    $0xffffffbf,%ecx
8010256b:	0f b6 d0             	movzbl %al,%edx
8010256e:	0f b6 82 40 71 10 80 	movzbl -0x7fef8ec0(%edx),%eax
80102575:	09 c1                	or     %eax,%ecx
80102577:	0f b6 82 40 70 10 80 	movzbl -0x7fef8fc0(%edx),%eax
8010257e:	31 c1                	xor    %eax,%ecx
80102580:	89 c8                	mov    %ecx,%eax
80102582:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102588:	83 e0 03             	and    $0x3,%eax
8010258b:	83 e1 08             	and    $0x8,%ecx
8010258e:	8b 04 85 20 70 10 80 	mov    -0x7fef8fe0(,%eax,4),%eax
80102595:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80102599:	74 c3                	je     8010255e <kbdgetc+0x4e>
8010259b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010259e:	83 fa 19             	cmp    $0x19,%edx
801025a1:	77 1d                	ja     801025c0 <kbdgetc+0xb0>
801025a3:	83 e8 20             	sub    $0x20,%eax
801025a6:	5d                   	pop    %ebp
801025a7:	c3                   	ret    
801025a8:	90                   	nop
801025a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025b0:	31 c0                	xor    %eax,%eax
801025b2:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
801025b9:	5d                   	pop    %ebp
801025ba:	c3                   	ret    
801025bb:	90                   	nop
801025bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025c0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025c3:	8d 50 20             	lea    0x20(%eax),%edx
801025c6:	5d                   	pop    %ebp
801025c7:	83 f9 19             	cmp    $0x19,%ecx
801025ca:	0f 46 c2             	cmovbe %edx,%eax
801025cd:	c3                   	ret    
801025ce:	66 90                	xchg   %ax,%ax
801025d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025d5:	5d                   	pop    %ebp
801025d6:	c3                   	ret    
801025d7:	89 f6                	mov    %esi,%esi
801025d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025e0 <kbdintr>:
801025e0:	55                   	push   %ebp
801025e1:	89 e5                	mov    %esp,%ebp
801025e3:	83 ec 14             	sub    $0x14,%esp
801025e6:	68 10 25 10 80       	push   $0x80102510
801025eb:	e8 c0 e1 ff ff       	call   801007b0 <consoleintr>
801025f0:	83 c4 10             	add    $0x10,%esp
801025f3:	c9                   	leave  
801025f4:	c3                   	ret    
801025f5:	66 90                	xchg   %ax,%ax
801025f7:	66 90                	xchg   %ax,%ax
801025f9:	66 90                	xchg   %ax,%ax
801025fb:	66 90                	xchg   %ax,%ax
801025fd:	66 90                	xchg   %ax,%ax
801025ff:	90                   	nop

80102600 <fill_rtcdate>:

  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
80102600:	55                   	push   %ebp
80102601:	89 c1                	mov    %eax,%ecx
80102603:	89 e5                	mov    %esp,%ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102605:	ba 70 00 00 00       	mov    $0x70,%edx
8010260a:	53                   	push   %ebx
8010260b:	31 c0                	xor    %eax,%eax
8010260d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010260e:	bb 71 00 00 00       	mov    $0x71,%ebx
80102613:	89 da                	mov    %ebx,%edx
80102615:	ec                   	in     (%dx),%al
static uint cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
80102616:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102619:	b2 70                	mov    $0x70,%dl
8010261b:	89 01                	mov    %eax,(%ecx)
8010261d:	b8 02 00 00 00       	mov    $0x2,%eax
80102622:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102623:	89 da                	mov    %ebx,%edx
80102625:	ec                   	in     (%dx),%al
80102626:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102629:	b2 70                	mov    $0x70,%dl
8010262b:	89 41 04             	mov    %eax,0x4(%ecx)
8010262e:	b8 04 00 00 00       	mov    $0x4,%eax
80102633:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102634:	89 da                	mov    %ebx,%edx
80102636:	ec                   	in     (%dx),%al
80102637:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010263a:	b2 70                	mov    $0x70,%dl
8010263c:	89 41 08             	mov    %eax,0x8(%ecx)
8010263f:	b8 07 00 00 00       	mov    $0x7,%eax
80102644:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102645:	89 da                	mov    %ebx,%edx
80102647:	ec                   	in     (%dx),%al
80102648:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010264b:	b2 70                	mov    $0x70,%dl
8010264d:	89 41 0c             	mov    %eax,0xc(%ecx)
80102650:	b8 08 00 00 00       	mov    $0x8,%eax
80102655:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102656:	89 da                	mov    %ebx,%edx
80102658:	ec                   	in     (%dx),%al
80102659:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010265c:	b2 70                	mov    $0x70,%dl
8010265e:	89 41 10             	mov    %eax,0x10(%ecx)
80102661:	b8 09 00 00 00       	mov    $0x9,%eax
80102666:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102667:	89 da                	mov    %ebx,%edx
80102669:	ec                   	in     (%dx),%al
8010266a:	0f b6 d8             	movzbl %al,%ebx
8010266d:	89 59 14             	mov    %ebx,0x14(%ecx)
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
}
80102670:	5b                   	pop    %ebx
80102671:	5d                   	pop    %ebp
80102672:	c3                   	ret    
80102673:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102680 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
  if(!lapic)
80102680:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}
//PAGEBREAK!

void
lapicinit(void)
{
80102685:	55                   	push   %ebp
80102686:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102688:	85 c0                	test   %eax,%eax
8010268a:	0f 84 c0 00 00 00    	je     80102750 <lapicinit+0xd0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102690:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102697:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010269a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010269d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801026a4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026a7:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026aa:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801026b1:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801026b4:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026b7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801026be:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801026c1:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026c4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026cb:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026ce:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026d1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801026d8:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026db:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801026de:	8b 50 30             	mov    0x30(%eax),%edx
801026e1:	c1 ea 10             	shr    $0x10,%edx
801026e4:	80 fa 03             	cmp    $0x3,%dl
801026e7:	77 6f                	ja     80102758 <lapicinit+0xd8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026e9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026f0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026f3:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026f6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026fd:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102700:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102703:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010270a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010270d:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102710:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102717:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010271a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010271d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102724:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102727:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010272a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102731:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102734:	8b 50 20             	mov    0x20(%eax),%edx
80102737:	90                   	nop
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102738:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
8010273e:	80 e6 10             	and    $0x10,%dh
80102741:	75 f5                	jne    80102738 <lapicinit+0xb8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102743:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
8010274a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010274d:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102750:	5d                   	pop    %ebp
80102751:	c3                   	ret    
80102752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102758:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
8010275f:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102762:	8b 50 20             	mov    0x20(%eax),%edx
80102765:	eb 82                	jmp    801026e9 <lapicinit+0x69>
80102767:	89 f6                	mov    %esi,%esi
80102769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102770 <cpunum>:
  lapicw(TPR, 0);
}

int
cpunum(void)
{
80102770:	55                   	push   %ebp
80102771:	89 e5                	mov    %esp,%ebp
80102773:	56                   	push   %esi
80102774:	53                   	push   %ebx
80102775:	83 ec 10             	sub    $0x10,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80102778:	9c                   	pushf  
80102779:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
8010277a:	f6 c4 02             	test   $0x2,%ah
8010277d:	74 12                	je     80102791 <cpunum+0x21>
    static int n;
    if(n++ == 0)
8010277f:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80102784:	8d 50 01             	lea    0x1(%eax),%edx
80102787:	85 c0                	test   %eax,%eax
80102789:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
8010278f:	74 4a                	je     801027db <cpunum+0x6b>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
80102791:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102796:	85 c0                	test   %eax,%eax
80102798:	74 5d                	je     801027f7 <cpunum+0x87>
    return 0;

  apicid = lapic[ID] >> 24;
8010279a:	8b 58 20             	mov    0x20(%eax),%ebx
  for (i = 0; i < ncpu; ++i) {
8010279d:	8b 35 80 2d 11 80    	mov    0x80112d80,%esi
  }

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
801027a3:	c1 eb 18             	shr    $0x18,%ebx
  for (i = 0; i < ncpu; ++i) {
801027a6:	85 f6                	test   %esi,%esi
801027a8:	7e 56                	jle    80102800 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
801027aa:	0f b6 05 a0 27 11 80 	movzbl 0x801127a0,%eax
801027b1:	39 d8                	cmp    %ebx,%eax
801027b3:	74 42                	je     801027f7 <cpunum+0x87>
801027b5:	ba 5c 28 11 80       	mov    $0x8011285c,%edx

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
801027ba:	31 c0                	xor    %eax,%eax
801027bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027c0:	83 c0 01             	add    $0x1,%eax
801027c3:	39 f0                	cmp    %esi,%eax
801027c5:	74 39                	je     80102800 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
801027c7:	0f b6 0a             	movzbl (%edx),%ecx
801027ca:	81 c2 bc 00 00 00    	add    $0xbc,%edx
801027d0:	39 d9                	cmp    %ebx,%ecx
801027d2:	75 ec                	jne    801027c0 <cpunum+0x50>
      return i;
  }
  panic("unknown apicid\n");
}
801027d4:	83 c4 10             	add    $0x10,%esp
801027d7:	5b                   	pop    %ebx
801027d8:	5e                   	pop    %esi
801027d9:	5d                   	pop    %ebp
801027da:	c3                   	ret    
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
801027db:	8b 45 04             	mov    0x4(%ebp),%eax
801027de:	c7 04 24 40 72 10 80 	movl   $0x80107240,(%esp)
801027e5:	89 44 24 04          	mov    %eax,0x4(%esp)
801027e9:	e8 62 de ff ff       	call   80100650 <cprintf>
        __builtin_return_address(0));
  }

  if (!lapic)
801027ee:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027f3:	85 c0                	test   %eax,%eax
801027f5:	75 a3                	jne    8010279a <cpunum+0x2a>
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801027f7:	83 c4 10             	add    $0x10,%esp
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
    return 0;
801027fa:	31 c0                	xor    %eax,%eax
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801027fc:	5b                   	pop    %ebx
801027fd:	5e                   	pop    %esi
801027fe:	5d                   	pop    %ebp
801027ff:	c3                   	ret    
  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
80102800:	c7 04 24 6c 72 10 80 	movl   $0x8010726c,(%esp)
80102807:	e8 54 db ff ff       	call   80100360 <panic>
8010280c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102810 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102810:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
80102815:	55                   	push   %ebp
80102816:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102818:	85 c0                	test   %eax,%eax
8010281a:	74 0d                	je     80102829 <lapiceoi+0x19>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010281c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102823:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102826:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
80102829:	5d                   	pop    %ebp
8010282a:	c3                   	ret    
8010282b:	90                   	nop
8010282c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102830 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102830:	55                   	push   %ebp
80102831:	89 e5                	mov    %esp,%ebp
}
80102833:	5d                   	pop    %ebp
80102834:	c3                   	ret    
80102835:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102840 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102840:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102841:	ba 70 00 00 00       	mov    $0x70,%edx
80102846:	89 e5                	mov    %esp,%ebp
80102848:	b8 0f 00 00 00       	mov    $0xf,%eax
8010284d:	53                   	push   %ebx
8010284e:	8b 4d 08             	mov    0x8(%ebp),%ecx
80102851:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80102854:	ee                   	out    %al,(%dx)
80102855:	b8 0a 00 00 00       	mov    $0xa,%eax
8010285a:	b2 71                	mov    $0x71,%dl
8010285c:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
8010285d:	31 c0                	xor    %eax,%eax
8010285f:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
80102865:	89 d8                	mov    %ebx,%eax
80102867:	c1 e8 04             	shr    $0x4,%eax
8010286a:	66 a3 69 04 00 80    	mov    %ax,0x80000469
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102870:	a1 9c 26 11 80       	mov    0x8011269c,%eax
  wrv[0] = 0;
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102875:	c1 e1 18             	shl    $0x18,%ecx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102878:	c1 eb 0c             	shr    $0xc,%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010287b:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102881:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102884:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
8010288b:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010288e:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102891:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102898:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010289b:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010289e:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801028a4:	8b 50 20             	mov    0x20(%eax),%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
801028a7:	89 da                	mov    %ebx,%edx
801028a9:	80 ce 06             	or     $0x6,%dh
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801028ac:	89 90 00 03 00 00    	mov    %edx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801028b2:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801028b5:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801028bb:	8b 48 20             	mov    0x20(%eax),%ecx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801028be:	89 90 00 03 00 00    	mov    %edx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801028c4:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
801028c7:	5b                   	pop    %ebx
801028c8:	5d                   	pop    %ebp
801028c9:	c3                   	ret    
801028ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801028d0 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
801028d0:	55                   	push   %ebp
801028d1:	ba 70 00 00 00       	mov    $0x70,%edx
801028d6:	89 e5                	mov    %esp,%ebp
801028d8:	b8 0b 00 00 00       	mov    $0xb,%eax
801028dd:	57                   	push   %edi
801028de:	56                   	push   %esi
801028df:	53                   	push   %ebx
801028e0:	83 ec 4c             	sub    $0x4c,%esp
801028e3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028e4:	b2 71                	mov    $0x71,%dl
801028e6:	ec                   	in     (%dx),%al
801028e7:	88 45 b7             	mov    %al,-0x49(%ebp)
801028ea:	8d 5d b8             	lea    -0x48(%ebp),%ebx
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);

  bcd = (sb & (1 << 2)) == 0;
801028ed:	80 65 b7 04          	andb   $0x4,-0x49(%ebp)
801028f1:	8d 7d d0             	lea    -0x30(%ebp),%edi
801028f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028f8:	be 70 00 00 00       	mov    $0x70,%esi

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
801028fd:	89 d8                	mov    %ebx,%eax
801028ff:	e8 fc fc ff ff       	call   80102600 <fill_rtcdate>
80102904:	b8 0a 00 00 00       	mov    $0xa,%eax
80102909:	89 f2                	mov    %esi,%edx
8010290b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010290c:	ba 71 00 00 00       	mov    $0x71,%edx
80102911:	ec                   	in     (%dx),%al
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102912:	84 c0                	test   %al,%al
80102914:	78 e7                	js     801028fd <cmostime+0x2d>
        continue;
    fill_rtcdate(&t2);
80102916:	89 f8                	mov    %edi,%eax
80102918:	e8 e3 fc ff ff       	call   80102600 <fill_rtcdate>
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010291d:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
80102924:	00 
80102925:	89 7c 24 04          	mov    %edi,0x4(%esp)
80102929:	89 1c 24             	mov    %ebx,(%esp)
8010292c:	e8 bf 1a 00 00       	call   801043f0 <memcmp>
80102931:	85 c0                	test   %eax,%eax
80102933:	75 c3                	jne    801028f8 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102935:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80102939:	75 78                	jne    801029b3 <cmostime+0xe3>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010293b:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010293e:	89 c2                	mov    %eax,%edx
80102940:	83 e0 0f             	and    $0xf,%eax
80102943:	c1 ea 04             	shr    $0x4,%edx
80102946:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102949:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010294c:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
8010294f:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102952:	89 c2                	mov    %eax,%edx
80102954:	83 e0 0f             	and    $0xf,%eax
80102957:	c1 ea 04             	shr    $0x4,%edx
8010295a:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010295d:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102960:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102963:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102966:	89 c2                	mov    %eax,%edx
80102968:	83 e0 0f             	and    $0xf,%eax
8010296b:	c1 ea 04             	shr    $0x4,%edx
8010296e:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102971:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102974:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102977:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010297a:	89 c2                	mov    %eax,%edx
8010297c:	83 e0 0f             	and    $0xf,%eax
8010297f:	c1 ea 04             	shr    $0x4,%edx
80102982:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102985:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102988:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
8010298b:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010298e:	89 c2                	mov    %eax,%edx
80102990:	83 e0 0f             	and    $0xf,%eax
80102993:	c1 ea 04             	shr    $0x4,%edx
80102996:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102999:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010299c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
8010299f:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029a2:	89 c2                	mov    %eax,%edx
801029a4:	83 e0 0f             	and    $0xf,%eax
801029a7:	c1 ea 04             	shr    $0x4,%edx
801029aa:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029ad:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029b0:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
801029b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
801029b6:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029b9:	89 01                	mov    %eax,(%ecx)
801029bb:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029be:	89 41 04             	mov    %eax,0x4(%ecx)
801029c1:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029c4:	89 41 08             	mov    %eax,0x8(%ecx)
801029c7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029ca:	89 41 0c             	mov    %eax,0xc(%ecx)
801029cd:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029d0:	89 41 10             	mov    %eax,0x10(%ecx)
801029d3:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029d6:	89 41 14             	mov    %eax,0x14(%ecx)
  r->year += 2000;
801029d9:	81 41 14 d0 07 00 00 	addl   $0x7d0,0x14(%ecx)
}
801029e0:	83 c4 4c             	add    $0x4c,%esp
801029e3:	5b                   	pop    %ebx
801029e4:	5e                   	pop    %esi
801029e5:	5f                   	pop    %edi
801029e6:	5d                   	pop    %ebp
801029e7:	c3                   	ret    
801029e8:	66 90                	xchg   %ax,%ax
801029ea:	66 90                	xchg   %ax,%ax
801029ec:	66 90                	xchg   %ax,%ax
801029ee:	66 90                	xchg   %ax,%ax

801029f0 <install_trans>:
801029f0:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
801029f6:	85 c9                	test   %ecx,%ecx
801029f8:	0f 8e 85 00 00 00    	jle    80102a83 <install_trans+0x93>
801029fe:	55                   	push   %ebp
801029ff:	89 e5                	mov    %esp,%ebp
80102a01:	57                   	push   %edi
80102a02:	56                   	push   %esi
80102a03:	53                   	push   %ebx
80102a04:	31 db                	xor    %ebx,%ebx
80102a06:	83 ec 0c             	sub    $0xc,%esp
80102a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a10:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102a15:	83 ec 08             	sub    $0x8,%esp
80102a18:	01 d8                	add    %ebx,%eax
80102a1a:	83 c0 01             	add    $0x1,%eax
80102a1d:	50                   	push   %eax
80102a1e:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a24:	e8 a7 d6 ff ff       	call   801000d0 <bread>
80102a29:	89 c7                	mov    %eax,%edi
80102a2b:	58                   	pop    %eax
80102a2c:	5a                   	pop    %edx
80102a2d:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102a34:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a3a:	83 c3 01             	add    $0x1,%ebx
80102a3d:	e8 8e d6 ff ff       	call   801000d0 <bread>
80102a42:	89 c6                	mov    %eax,%esi
80102a44:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a47:	83 c4 0c             	add    $0xc,%esp
80102a4a:	68 00 02 00 00       	push   $0x200
80102a4f:	50                   	push   %eax
80102a50:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a53:	50                   	push   %eax
80102a54:	e8 f7 19 00 00       	call   80104450 <memmove>
80102a59:	89 34 24             	mov    %esi,(%esp)
80102a5c:	e8 3f d7 ff ff       	call   801001a0 <bwrite>
80102a61:	89 3c 24             	mov    %edi,(%esp)
80102a64:	e8 77 d7 ff ff       	call   801001e0 <brelse>
80102a69:	89 34 24             	mov    %esi,(%esp)
80102a6c:	e8 6f d7 ff ff       	call   801001e0 <brelse>
80102a71:	83 c4 10             	add    $0x10,%esp
80102a74:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102a7a:	7f 94                	jg     80102a10 <install_trans+0x20>
80102a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a7f:	5b                   	pop    %ebx
80102a80:	5e                   	pop    %esi
80102a81:	5f                   	pop    %edi
80102a82:	5d                   	pop    %ebp
80102a83:	f3 c3                	repz ret 
80102a85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a90 <write_head>:
80102a90:	55                   	push   %ebp
80102a91:	89 e5                	mov    %esp,%ebp
80102a93:	53                   	push   %ebx
80102a94:	83 ec 0c             	sub    $0xc,%esp
80102a97:	ff 35 d4 26 11 80    	pushl  0x801126d4
80102a9d:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102aa3:	e8 28 d6 ff ff       	call   801000d0 <bread>
80102aa8:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102aae:	83 c4 10             	add    $0x10,%esp
80102ab1:	89 c3                	mov    %eax,%ebx
80102ab3:	85 c9                	test   %ecx,%ecx
80102ab5:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102ab8:	7e 1f                	jle    80102ad9 <write_head+0x49>
80102aba:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102ac1:	31 d2                	xor    %edx,%edx
80102ac3:	90                   	nop
80102ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ac8:	8b 8a ec 26 11 80    	mov    -0x7feed914(%edx),%ecx
80102ace:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102ad2:	83 c2 04             	add    $0x4,%edx
80102ad5:	39 c2                	cmp    %eax,%edx
80102ad7:	75 ef                	jne    80102ac8 <write_head+0x38>
80102ad9:	83 ec 0c             	sub    $0xc,%esp
80102adc:	53                   	push   %ebx
80102add:	e8 be d6 ff ff       	call   801001a0 <bwrite>
80102ae2:	89 1c 24             	mov    %ebx,(%esp)
80102ae5:	e8 f6 d6 ff ff       	call   801001e0 <brelse>
80102aea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102aed:	c9                   	leave  
80102aee:	c3                   	ret    
80102aef:	90                   	nop

80102af0 <initlog>:
80102af0:	55                   	push   %ebp
80102af1:	89 e5                	mov    %esp,%ebp
80102af3:	53                   	push   %ebx
80102af4:	83 ec 2c             	sub    $0x2c,%esp
80102af7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102afa:	68 7c 72 10 80       	push   $0x8010727c
80102aff:	68 a0 26 11 80       	push   $0x801126a0
80102b04:	e8 97 16 00 00       	call   801041a0 <initlock>
80102b09:	58                   	pop    %eax
80102b0a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b0d:	5a                   	pop    %edx
80102b0e:	50                   	push   %eax
80102b0f:	53                   	push   %ebx
80102b10:	e8 7b e8 ff ff       	call   80101390 <readsb>
80102b15:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102b18:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102b1b:	59                   	pop    %ecx
80102b1c:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4
80102b22:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
80102b28:	a3 d4 26 11 80       	mov    %eax,0x801126d4
80102b2d:	5a                   	pop    %edx
80102b2e:	50                   	push   %eax
80102b2f:	53                   	push   %ebx
80102b30:	e8 9b d5 ff ff       	call   801000d0 <bread>
80102b35:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102b38:	83 c4 10             	add    $0x10,%esp
80102b3b:	85 c9                	test   %ecx,%ecx
80102b3d:	89 0d e8 26 11 80    	mov    %ecx,0x801126e8
80102b43:	7e 1c                	jle    80102b61 <initlog+0x71>
80102b45:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b4c:	31 d2                	xor    %edx,%edx
80102b4e:	66 90                	xchg   %ax,%ax
80102b50:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b54:	83 c2 04             	add    $0x4,%edx
80102b57:	89 8a e8 26 11 80    	mov    %ecx,-0x7feed918(%edx)
80102b5d:	39 da                	cmp    %ebx,%edx
80102b5f:	75 ef                	jne    80102b50 <initlog+0x60>
80102b61:	83 ec 0c             	sub    $0xc,%esp
80102b64:	50                   	push   %eax
80102b65:	e8 76 d6 ff ff       	call   801001e0 <brelse>
80102b6a:	e8 81 fe ff ff       	call   801029f0 <install_trans>
80102b6f:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102b76:	00 00 00 
80102b79:	e8 12 ff ff ff       	call   80102a90 <write_head>
80102b7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b81:	c9                   	leave  
80102b82:	c3                   	ret    
80102b83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b90 <begin_op>:
80102b90:	55                   	push   %ebp
80102b91:	89 e5                	mov    %esp,%ebp
80102b93:	83 ec 14             	sub    $0x14,%esp
80102b96:	68 a0 26 11 80       	push   $0x801126a0
80102b9b:	e8 80 16 00 00       	call   80104220 <acquire>
80102ba0:	83 c4 10             	add    $0x10,%esp
80102ba3:	eb 18                	jmp    80102bbd <begin_op+0x2d>
80102ba5:	8d 76 00             	lea    0x0(%esi),%esi
80102ba8:	83 ec 08             	sub    $0x8,%esp
80102bab:	68 a0 26 11 80       	push   $0x801126a0
80102bb0:	68 a0 26 11 80       	push   $0x801126a0
80102bb5:	e8 86 11 00 00       	call   80103d40 <sleep>
80102bba:	83 c4 10             	add    $0x10,%esp
80102bbd:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102bc2:	85 c0                	test   %eax,%eax
80102bc4:	75 e2                	jne    80102ba8 <begin_op+0x18>
80102bc6:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102bcb:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102bd1:	83 c0 01             	add    $0x1,%eax
80102bd4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bd7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bda:	83 fa 1e             	cmp    $0x1e,%edx
80102bdd:	7f c9                	jg     80102ba8 <begin_op+0x18>
80102bdf:	83 ec 0c             	sub    $0xc,%esp
80102be2:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102be7:	68 a0 26 11 80       	push   $0x801126a0
80102bec:	e8 5f 17 00 00       	call   80104350 <release>
80102bf1:	83 c4 10             	add    $0x10,%esp
80102bf4:	c9                   	leave  
80102bf5:	c3                   	ret    
80102bf6:	8d 76 00             	lea    0x0(%esi),%esi
80102bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c00 <end_op>:
80102c00:	55                   	push   %ebp
80102c01:	89 e5                	mov    %esp,%ebp
80102c03:	57                   	push   %edi
80102c04:	56                   	push   %esi
80102c05:	53                   	push   %ebx
80102c06:	83 ec 18             	sub    $0x18,%esp
80102c09:	68 a0 26 11 80       	push   $0x801126a0
80102c0e:	e8 0d 16 00 00       	call   80104220 <acquire>
80102c13:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102c18:	8b 1d e0 26 11 80    	mov    0x801126e0,%ebx
80102c1e:	83 c4 10             	add    $0x10,%esp
80102c21:	83 e8 01             	sub    $0x1,%eax
80102c24:	85 db                	test   %ebx,%ebx
80102c26:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102c2b:	0f 85 23 01 00 00    	jne    80102d54 <end_op+0x154>
80102c31:	85 c0                	test   %eax,%eax
80102c33:	0f 85 f7 00 00 00    	jne    80102d30 <end_op+0x130>
80102c39:	83 ec 0c             	sub    $0xc,%esp
80102c3c:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102c43:	00 00 00 
80102c46:	31 db                	xor    %ebx,%ebx
80102c48:	68 a0 26 11 80       	push   $0x801126a0
80102c4d:	e8 fe 16 00 00       	call   80104350 <release>
80102c52:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102c58:	83 c4 10             	add    $0x10,%esp
80102c5b:	85 c9                	test   %ecx,%ecx
80102c5d:	0f 8e 8a 00 00 00    	jle    80102ced <end_op+0xed>
80102c63:	90                   	nop
80102c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c68:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102c6d:	83 ec 08             	sub    $0x8,%esp
80102c70:	01 d8                	add    %ebx,%eax
80102c72:	83 c0 01             	add    $0x1,%eax
80102c75:	50                   	push   %eax
80102c76:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102c7c:	e8 4f d4 ff ff       	call   801000d0 <bread>
80102c81:	89 c6                	mov    %eax,%esi
80102c83:	58                   	pop    %eax
80102c84:	5a                   	pop    %edx
80102c85:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102c8c:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102c92:	83 c3 01             	add    $0x1,%ebx
80102c95:	e8 36 d4 ff ff       	call   801000d0 <bread>
80102c9a:	89 c7                	mov    %eax,%edi
80102c9c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c9f:	83 c4 0c             	add    $0xc,%esp
80102ca2:	68 00 02 00 00       	push   $0x200
80102ca7:	50                   	push   %eax
80102ca8:	8d 46 5c             	lea    0x5c(%esi),%eax
80102cab:	50                   	push   %eax
80102cac:	e8 9f 17 00 00       	call   80104450 <memmove>
80102cb1:	89 34 24             	mov    %esi,(%esp)
80102cb4:	e8 e7 d4 ff ff       	call   801001a0 <bwrite>
80102cb9:	89 3c 24             	mov    %edi,(%esp)
80102cbc:	e8 1f d5 ff ff       	call   801001e0 <brelse>
80102cc1:	89 34 24             	mov    %esi,(%esp)
80102cc4:	e8 17 d5 ff ff       	call   801001e0 <brelse>
80102cc9:	83 c4 10             	add    $0x10,%esp
80102ccc:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102cd2:	7c 94                	jl     80102c68 <end_op+0x68>
80102cd4:	e8 b7 fd ff ff       	call   80102a90 <write_head>
80102cd9:	e8 12 fd ff ff       	call   801029f0 <install_trans>
80102cde:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102ce5:	00 00 00 
80102ce8:	e8 a3 fd ff ff       	call   80102a90 <write_head>
80102ced:	83 ec 0c             	sub    $0xc,%esp
80102cf0:	68 a0 26 11 80       	push   $0x801126a0
80102cf5:	e8 26 15 00 00       	call   80104220 <acquire>
80102cfa:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d01:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102d08:	00 00 00 
80102d0b:	e8 d0 11 00 00       	call   80103ee0 <wakeup>
80102d10:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d17:	e8 34 16 00 00       	call   80104350 <release>
80102d1c:	83 c4 10             	add    $0x10,%esp
80102d1f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d22:	5b                   	pop    %ebx
80102d23:	5e                   	pop    %esi
80102d24:	5f                   	pop    %edi
80102d25:	5d                   	pop    %ebp
80102d26:	c3                   	ret    
80102d27:	89 f6                	mov    %esi,%esi
80102d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102d30:	83 ec 0c             	sub    $0xc,%esp
80102d33:	68 a0 26 11 80       	push   $0x801126a0
80102d38:	e8 a3 11 00 00       	call   80103ee0 <wakeup>
80102d3d:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d44:	e8 07 16 00 00       	call   80104350 <release>
80102d49:	83 c4 10             	add    $0x10,%esp
80102d4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d4f:	5b                   	pop    %ebx
80102d50:	5e                   	pop    %esi
80102d51:	5f                   	pop    %edi
80102d52:	5d                   	pop    %ebp
80102d53:	c3                   	ret    
80102d54:	83 ec 0c             	sub    $0xc,%esp
80102d57:	68 80 72 10 80       	push   $0x80107280
80102d5c:	e8 ff d5 ff ff       	call   80100360 <panic>
80102d61:	eb 0d                	jmp    80102d70 <log_write>
80102d63:	90                   	nop
80102d64:	90                   	nop
80102d65:	90                   	nop
80102d66:	90                   	nop
80102d67:	90                   	nop
80102d68:	90                   	nop
80102d69:	90                   	nop
80102d6a:	90                   	nop
80102d6b:	90                   	nop
80102d6c:	90                   	nop
80102d6d:	90                   	nop
80102d6e:	90                   	nop
80102d6f:	90                   	nop

80102d70 <log_write>:
80102d70:	55                   	push   %ebp
80102d71:	89 e5                	mov    %esp,%ebp
80102d73:	53                   	push   %ebx
80102d74:	83 ec 04             	sub    $0x4,%esp
80102d77:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102d7d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d80:	83 fa 1d             	cmp    $0x1d,%edx
80102d83:	0f 8f 97 00 00 00    	jg     80102e20 <log_write+0xb0>
80102d89:	a1 d8 26 11 80       	mov    0x801126d8,%eax
80102d8e:	83 e8 01             	sub    $0x1,%eax
80102d91:	39 c2                	cmp    %eax,%edx
80102d93:	0f 8d 87 00 00 00    	jge    80102e20 <log_write+0xb0>
80102d99:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102d9e:	85 c0                	test   %eax,%eax
80102da0:	0f 8e 87 00 00 00    	jle    80102e2d <log_write+0xbd>
80102da6:	83 ec 0c             	sub    $0xc,%esp
80102da9:	68 a0 26 11 80       	push   $0x801126a0
80102dae:	e8 6d 14 00 00       	call   80104220 <acquire>
80102db3:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102db9:	83 c4 10             	add    $0x10,%esp
80102dbc:	83 fa 00             	cmp    $0x0,%edx
80102dbf:	7e 50                	jle    80102e11 <log_write+0xa1>
80102dc1:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102dc4:	31 c0                	xor    %eax,%eax
80102dc6:	3b 0d ec 26 11 80    	cmp    0x801126ec,%ecx
80102dcc:	75 0b                	jne    80102dd9 <log_write+0x69>
80102dce:	eb 38                	jmp    80102e08 <log_write+0x98>
80102dd0:	39 0c 85 ec 26 11 80 	cmp    %ecx,-0x7feed914(,%eax,4)
80102dd7:	74 2f                	je     80102e08 <log_write+0x98>
80102dd9:	83 c0 01             	add    $0x1,%eax
80102ddc:	39 d0                	cmp    %edx,%eax
80102dde:	75 f0                	jne    80102dd0 <log_write+0x60>
80102de0:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
80102de7:	83 c2 01             	add    $0x1,%edx
80102dea:	89 15 e8 26 11 80    	mov    %edx,0x801126e8
80102df0:	83 0b 04             	orl    $0x4,(%ebx)
80102df3:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
80102dfa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dfd:	c9                   	leave  
80102dfe:	e9 4d 15 00 00       	jmp    80104350 <release>
80102e03:	90                   	nop
80102e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102e08:	89 0c 85 ec 26 11 80 	mov    %ecx,-0x7feed914(,%eax,4)
80102e0f:	eb df                	jmp    80102df0 <log_write+0x80>
80102e11:	8b 43 08             	mov    0x8(%ebx),%eax
80102e14:	a3 ec 26 11 80       	mov    %eax,0x801126ec
80102e19:	75 d5                	jne    80102df0 <log_write+0x80>
80102e1b:	eb ca                	jmp    80102de7 <log_write+0x77>
80102e1d:	8d 76 00             	lea    0x0(%esi),%esi
80102e20:	83 ec 0c             	sub    $0xc,%esp
80102e23:	68 8f 72 10 80       	push   $0x8010728f
80102e28:	e8 33 d5 ff ff       	call   80100360 <panic>
80102e2d:	83 ec 0c             	sub    $0xc,%esp
80102e30:	68 a5 72 10 80       	push   $0x801072a5
80102e35:	e8 26 d5 ff ff       	call   80100360 <panic>
80102e3a:	66 90                	xchg   %ax,%ax
80102e3c:	66 90                	xchg   %ax,%ax
80102e3e:	66 90                	xchg   %ax,%ax

80102e40 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e40:	55                   	push   %ebp
80102e41:	89 e5                	mov    %esp,%ebp
80102e43:	83 ec 18             	sub    $0x18,%esp
  cprintf("cpu%d: starting\n", cpunum());
80102e46:	e8 25 f9 ff ff       	call   80102770 <cpunum>
80102e4b:	c7 04 24 c0 72 10 80 	movl   $0x801072c0,(%esp)
80102e52:	89 44 24 04          	mov    %eax,0x4(%esp)
80102e56:	e8 f5 d7 ff ff       	call   80100650 <cprintf>
  idtinit();       // load idt register
80102e5b:	e8 c0 27 00 00       	call   80105620 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
80102e60:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e67:	b8 01 00 00 00       	mov    $0x1,%eax
80102e6c:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
80102e73:	e8 08 0c 00 00       	call   80103a80 <scheduler>
80102e78:	90                   	nop
80102e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e80 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e80:	55                   	push   %ebp
80102e81:	89 e5                	mov    %esp,%ebp
80102e83:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e86:	e8 85 39 00 00       	call   80106810 <switchkvm>
  seginit();
80102e8b:	e8 a0 37 00 00       	call   80106630 <seginit>
  lapicinit();
80102e90:	e8 eb f7 ff ff       	call   80102680 <lapicinit>
  mpmain();
80102e95:	e8 a6 ff ff ff       	call   80102e40 <mpmain>
80102e9a:	66 90                	xchg   %ax,%ax
80102e9c:	66 90                	xchg   %ax,%ax
80102e9e:	66 90                	xchg   %ax,%ax

80102ea0 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102ea0:	55                   	push   %ebp
80102ea1:	89 e5                	mov    %esp,%ebp
80102ea3:	53                   	push   %ebx
80102ea4:	83 e4 f0             	and    $0xfffffff0,%esp
80102ea7:	83 ec 10             	sub    $0x10,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102eaa:	c7 44 24 04 00 00 40 	movl   $0x80400000,0x4(%esp)
80102eb1:	80 
80102eb2:	c7 04 24 28 56 11 80 	movl   $0x80115628,(%esp)
80102eb9:	e8 12 f5 ff ff       	call   801023d0 <kinit1>
  kvmalloc();      // kernel page table
80102ebe:	e8 2d 39 00 00       	call   801067f0 <kvmalloc>
  mpinit();        // detect other processors
80102ec3:	e8 a8 01 00 00       	call   80103070 <mpinit>
  lapicinit();     // interrupt controller
80102ec8:	e8 b3 f7 ff ff       	call   80102680 <lapicinit>
80102ecd:	8d 76 00             	lea    0x0(%esi),%esi
  seginit();       // segment descriptors
80102ed0:	e8 5b 37 00 00       	call   80106630 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80102ed5:	e8 96 f8 ff ff       	call   80102770 <cpunum>
80102eda:	c7 04 24 d1 72 10 80 	movl   $0x801072d1,(%esp)
80102ee1:	89 44 24 04          	mov    %eax,0x4(%esp)
80102ee5:	e8 66 d7 ff ff       	call   80100650 <cprintf>
  picinit();       // another interrupt controller
80102eea:	e8 81 03 00 00       	call   80103270 <picinit>
  ioapicinit();    // another interrupt controller
80102eef:	e8 fc f2 ff ff       	call   801021f0 <ioapicinit>
  consoleinit();   // console hardware
80102ef4:	e8 57 da ff ff       	call   80100950 <consoleinit>
  uartinit();      // serial port
80102ef9:	e8 42 2a 00 00       	call   80105940 <uartinit>
80102efe:	66 90                	xchg   %ax,%ax
  pinit();         // process table
80102f00:	e8 ab 08 00 00       	call   801037b0 <pinit>
  tvinit();        // trap vectors
80102f05:	e8 76 26 00 00       	call   80105580 <tvinit>
  binit();         // buffer cache
80102f0a:	e8 31 d1 ff ff       	call   80100040 <binit>
80102f0f:	90                   	nop
  fileinit();      // file table
80102f10:	e8 2b de ff ff       	call   80100d40 <fileinit>
  ideinit();       // disk
80102f15:	e8 c6 f0 ff ff       	call   80101fe0 <ideinit>
  if(!ismp)
80102f1a:	a1 84 27 11 80       	mov    0x80112784,%eax
80102f1f:	85 c0                	test   %eax,%eax
80102f21:	0f 84 ca 00 00 00    	je     80102ff1 <main+0x151>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f27:	c7 44 24 08 8a 00 00 	movl   $0x8a,0x8(%esp)
80102f2e:	00 

  for(c = cpus; c < cpus+ncpu; c++){
80102f2f:	bb a0 27 11 80       	mov    $0x801127a0,%ebx

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f34:	c7 44 24 04 8c a4 10 	movl   $0x8010a48c,0x4(%esp)
80102f3b:	80 
80102f3c:	c7 04 24 00 70 00 80 	movl   $0x80007000,(%esp)
80102f43:	e8 08 15 00 00       	call   80104450 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102f48:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102f4f:	00 00 00 
80102f52:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f57:	39 d8                	cmp    %ebx,%eax
80102f59:	76 78                	jbe    80102fd3 <main+0x133>
80102f5b:	90                   	nop
80102f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == cpus+cpunum())  // We've started already.
80102f60:	e8 0b f8 ff ff       	call   80102770 <cpunum>
80102f65:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102f6b:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f70:	39 c3                	cmp    %eax,%ebx
80102f72:	74 46                	je     80102fba <main+0x11a>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f74:	e8 27 f5 ff ff       	call   801024a0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
80102f79:	c7 05 f8 6f 00 80 80 	movl   $0x80102e80,0x80006ff8
80102f80:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f83:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f8a:	90 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f8d:	05 00 10 00 00       	add    $0x1000,%eax
80102f92:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f97:	0f b6 03             	movzbl (%ebx),%eax
80102f9a:	c7 44 24 04 00 70 00 	movl   $0x7000,0x4(%esp)
80102fa1:	00 
80102fa2:	89 04 24             	mov    %eax,(%esp)
80102fa5:	e8 96 f8 ff ff       	call   80102840 <lapicstartap>
80102faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102fb0:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80102fb6:	85 c0                	test   %eax,%eax
80102fb8:	74 f6                	je     80102fb0 <main+0x110>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102fba:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102fc1:	00 00 00 
80102fc4:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
80102fca:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102fcf:	39 c3                	cmp    %eax,%ebx
80102fd1:	72 8d                	jb     80102f60 <main+0xc0>
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102fd3:	c7 44 24 04 00 00 00 	movl   $0x8e000000,0x4(%esp)
80102fda:	8e 
80102fdb:	c7 04 24 00 00 40 80 	movl   $0x80400000,(%esp)
80102fe2:	e8 59 f4 ff ff       	call   80102440 <kinit2>
  userinit();      // first user process
80102fe7:	e8 e4 07 00 00       	call   801037d0 <userinit>
  mpmain();        // finish this processor's setup
80102fec:	e8 4f fe ff ff       	call   80102e40 <mpmain>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
80102ff1:	e8 2a 25 00 00       	call   80105520 <timerinit>
80102ff6:	e9 2c ff ff ff       	jmp    80102f27 <main+0x87>
80102ffb:	66 90                	xchg   %ax,%ax
80102ffd:	66 90                	xchg   %ax,%ax
80102fff:	90                   	nop

80103000 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103000:	55                   	push   %ebp
80103001:	89 e5                	mov    %esp,%ebp
80103003:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103004:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010300a:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
8010300b:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010300e:	83 ec 10             	sub    $0x10,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80103011:	39 de                	cmp    %ebx,%esi
80103013:	73 3c                	jae    80103051 <mpsearch1+0x51>
80103015:	8d 76 00             	lea    0x0(%esi),%esi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103018:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
8010301f:	00 
80103020:	c7 44 24 04 e8 72 10 	movl   $0x801072e8,0x4(%esp)
80103027:	80 
80103028:	89 34 24             	mov    %esi,(%esp)
8010302b:	e8 c0 13 00 00       	call   801043f0 <memcmp>
80103030:	85 c0                	test   %eax,%eax
80103032:	75 16                	jne    8010304a <mpsearch1+0x4a>
80103034:	31 c9                	xor    %ecx,%ecx
80103036:	31 d2                	xor    %edx,%edx
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80103038:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010303c:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
8010303f:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103041:	83 fa 10             	cmp    $0x10,%edx
80103044:	75 f2                	jne    80103038 <mpsearch1+0x38>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103046:	84 c9                	test   %cl,%cl
80103048:	74 10                	je     8010305a <mpsearch1+0x5a>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
8010304a:	83 c6 10             	add    $0x10,%esi
8010304d:	39 f3                	cmp    %esi,%ebx
8010304f:	77 c7                	ja     80103018 <mpsearch1+0x18>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
80103051:	83 c4 10             	add    $0x10,%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80103054:	31 c0                	xor    %eax,%eax
}
80103056:	5b                   	pop    %ebx
80103057:	5e                   	pop    %esi
80103058:	5d                   	pop    %ebp
80103059:	c3                   	ret    
8010305a:	83 c4 10             	add    $0x10,%esp
8010305d:	89 f0                	mov    %esi,%eax
8010305f:	5b                   	pop    %ebx
80103060:	5e                   	pop    %esi
80103061:	5d                   	pop    %ebp
80103062:	c3                   	ret    
80103063:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103070 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103070:	55                   	push   %ebp
80103071:	89 e5                	mov    %esp,%ebp
80103073:	57                   	push   %edi
80103074:	56                   	push   %esi
80103075:	53                   	push   %ebx
80103076:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103079:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103080:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103087:	c1 e0 08             	shl    $0x8,%eax
8010308a:	09 d0                	or     %edx,%eax
8010308c:	c1 e0 04             	shl    $0x4,%eax
8010308f:	85 c0                	test   %eax,%eax
80103091:	75 1b                	jne    801030ae <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103093:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010309a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801030a1:	c1 e0 08             	shl    $0x8,%eax
801030a4:	09 d0                	or     %edx,%eax
801030a6:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
801030a9:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
801030ae:	ba 00 04 00 00       	mov    $0x400,%edx
801030b3:	e8 48 ff ff ff       	call   80103000 <mpsearch1>
801030b8:	85 c0                	test   %eax,%eax
801030ba:	89 c7                	mov    %eax,%edi
801030bc:	0f 84 4e 01 00 00    	je     80103210 <mpinit+0x1a0>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801030c2:	8b 77 04             	mov    0x4(%edi),%esi
801030c5:	85 f6                	test   %esi,%esi
801030c7:	0f 84 ce 00 00 00    	je     8010319b <mpinit+0x12b>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
801030cd:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
801030d3:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
801030da:	00 
801030db:	c7 44 24 04 ed 72 10 	movl   $0x801072ed,0x4(%esp)
801030e2:	80 
801030e3:	89 04 24             	mov    %eax,(%esp)
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
801030e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
801030e9:	e8 02 13 00 00       	call   801043f0 <memcmp>
801030ee:	85 c0                	test   %eax,%eax
801030f0:	0f 85 a5 00 00 00    	jne    8010319b <mpinit+0x12b>
    return 0;
  if(conf->version != 1 && conf->version != 4)
801030f6:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
801030fd:	3c 04                	cmp    $0x4,%al
801030ff:	0f 85 29 01 00 00    	jne    8010322e <mpinit+0x1be>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103105:	0f b7 86 04 00 00 80 	movzwl -0x7ffffffc(%esi),%eax
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010310c:	85 c0                	test   %eax,%eax
8010310e:	74 1d                	je     8010312d <mpinit+0xbd>
static uchar
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
80103110:	31 c9                	xor    %ecx,%ecx
  for(i=0; i<len; i++)
80103112:	31 d2                	xor    %edx,%edx
80103114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
80103118:	0f b6 9c 16 00 00 00 	movzbl -0x80000000(%esi,%edx,1),%ebx
8010311f:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103120:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
80103123:	01 d9                	add    %ebx,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103125:	39 d0                	cmp    %edx,%eax
80103127:	7f ef                	jg     80103118 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103129:	84 c9                	test   %cl,%cl
8010312b:	75 6e                	jne    8010319b <mpinit+0x12b>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
8010312d:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103130:	85 db                	test   %ebx,%ebx
80103132:	74 67                	je     8010319b <mpinit+0x12b>
    return;
  ismp = 1;
80103134:	c7 05 84 27 11 80 01 	movl   $0x1,0x80112784
8010313b:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
8010313e:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
80103144:	a3 9c 26 11 80       	mov    %eax,0x8011269c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103149:	0f b7 8e 04 00 00 80 	movzwl -0x7ffffffc(%esi),%ecx
80103150:	8d 86 2c 00 00 80    	lea    -0x7fffffd4(%esi),%eax
80103156:	01 d9                	add    %ebx,%ecx
80103158:	39 c8                	cmp    %ecx,%eax
8010315a:	0f 83 90 00 00 00    	jae    801031f0 <mpinit+0x180>
    switch(*p){
80103160:	80 38 04             	cmpb   $0x4,(%eax)
80103163:	77 7b                	ja     801031e0 <mpinit+0x170>
80103165:	0f b6 10             	movzbl (%eax),%edx
80103168:	ff 24 95 f4 72 10 80 	jmp    *-0x7fef8d0c(,%edx,4)
8010316f:	90                   	nop
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103170:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103173:	39 c1                	cmp    %eax,%ecx
80103175:	77 e9                	ja     80103160 <mpinit+0xf0>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp){
80103177:	a1 84 27 11 80       	mov    0x80112784,%eax
8010317c:	85 c0                	test   %eax,%eax
8010317e:	75 70                	jne    801031f0 <mpinit+0x180>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
80103180:	c7 05 80 2d 11 80 01 	movl   $0x1,0x80112d80
80103187:	00 00 00 
    lapic = 0;
8010318a:	c7 05 9c 26 11 80 00 	movl   $0x0,0x8011269c
80103191:	00 00 00 
    ioapicid = 0;
80103194:	c6 05 80 27 11 80 00 	movb   $0x0,0x80112780
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010319b:	83 c4 1c             	add    $0x1c,%esp
8010319e:	5b                   	pop    %ebx
8010319f:	5e                   	pop    %esi
801031a0:	5f                   	pop    %edi
801031a1:	5d                   	pop    %ebp
801031a2:	c3                   	ret    
801031a3:	90                   	nop
801031a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
801031a8:	8b 15 80 2d 11 80    	mov    0x80112d80,%edx
801031ae:	83 fa 07             	cmp    $0x7,%edx
801031b1:	7f 17                	jg     801031ca <mpinit+0x15a>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801031b3:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
801031b7:	69 d2 bc 00 00 00    	imul   $0xbc,%edx,%edx
        ncpu++;
801031bd:	83 05 80 2d 11 80 01 	addl   $0x1,0x80112d80
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801031c4:	88 9a a0 27 11 80    	mov    %bl,-0x7feed860(%edx)
        ncpu++;
      }
      p += sizeof(struct mpproc);
801031ca:	83 c0 14             	add    $0x14,%eax
      continue;
801031cd:	eb a4                	jmp    80103173 <mpinit+0x103>
801031cf:	90                   	nop
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
801031d0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
801031d4:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
801031d7:	88 15 80 27 11 80    	mov    %dl,0x80112780
      p += sizeof(struct mpioapic);
      continue;
801031dd:	eb 94                	jmp    80103173 <mpinit+0x103>
801031df:	90                   	nop
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
801031e0:	c7 05 84 27 11 80 00 	movl   $0x0,0x80112784
801031e7:	00 00 00 
      break;
801031ea:	eb 87                	jmp    80103173 <mpinit+0x103>
801031ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    lapic = 0;
    ioapicid = 0;
    return;
  }

  if(mp->imcrp){
801031f0:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
801031f4:	74 a5                	je     8010319b <mpinit+0x12b>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801031f6:	ba 22 00 00 00       	mov    $0x22,%edx
801031fb:	b8 70 00 00 00       	mov    $0x70,%eax
80103200:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103201:	b2 23                	mov    $0x23,%dl
80103203:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103204:	83 c8 01             	or     $0x1,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103207:	ee                   	out    %al,(%dx)
  }
}
80103208:	83 c4 1c             	add    $0x1c,%esp
8010320b:	5b                   	pop    %ebx
8010320c:	5e                   	pop    %esi
8010320d:	5f                   	pop    %edi
8010320e:	5d                   	pop    %ebp
8010320f:	c3                   	ret    
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
80103210:	ba 00 00 01 00       	mov    $0x10000,%edx
80103215:	b8 00 00 0f 00       	mov    $0xf0000,%eax
8010321a:	e8 e1 fd ff ff       	call   80103000 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010321f:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
80103221:	89 c7                	mov    %eax,%edi
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103223:	0f 85 99 fe ff ff    	jne    801030c2 <mpinit+0x52>
80103229:	e9 6d ff ff ff       	jmp    8010319b <mpinit+0x12b>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
8010322e:	3c 01                	cmp    $0x1,%al
80103230:	0f 84 cf fe ff ff    	je     80103105 <mpinit+0x95>
80103236:	e9 60 ff ff ff       	jmp    8010319b <mpinit+0x12b>
8010323b:	66 90                	xchg   %ax,%ax
8010323d:	66 90                	xchg   %ax,%ax
8010323f:	90                   	nop

80103240 <picenable>:
80103240:	55                   	push   %ebp
80103241:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
80103246:	ba 21 00 00 00       	mov    $0x21,%edx
8010324b:	89 e5                	mov    %esp,%ebp
8010324d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103250:	d3 c0                	rol    %cl,%eax
80103252:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
80103259:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
8010325f:	ee                   	out    %al,(%dx)
80103260:	ba a1 00 00 00       	mov    $0xa1,%edx
80103265:	66 c1 e8 08          	shr    $0x8,%ax
80103269:	ee                   	out    %al,(%dx)
8010326a:	5d                   	pop    %ebp
8010326b:	c3                   	ret    
8010326c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103270 <picinit>:
80103270:	55                   	push   %ebp
80103271:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103276:	89 e5                	mov    %esp,%ebp
80103278:	57                   	push   %edi
80103279:	56                   	push   %esi
8010327a:	53                   	push   %ebx
8010327b:	bb 21 00 00 00       	mov    $0x21,%ebx
80103280:	89 da                	mov    %ebx,%edx
80103282:	ee                   	out    %al,(%dx)
80103283:	b9 a1 00 00 00       	mov    $0xa1,%ecx
80103288:	89 ca                	mov    %ecx,%edx
8010328a:	ee                   	out    %al,(%dx)
8010328b:	bf 11 00 00 00       	mov    $0x11,%edi
80103290:	be 20 00 00 00       	mov    $0x20,%esi
80103295:	89 f8                	mov    %edi,%eax
80103297:	89 f2                	mov    %esi,%edx
80103299:	ee                   	out    %al,(%dx)
8010329a:	b8 20 00 00 00       	mov    $0x20,%eax
8010329f:	89 da                	mov    %ebx,%edx
801032a1:	ee                   	out    %al,(%dx)
801032a2:	b8 04 00 00 00       	mov    $0x4,%eax
801032a7:	ee                   	out    %al,(%dx)
801032a8:	b8 03 00 00 00       	mov    $0x3,%eax
801032ad:	ee                   	out    %al,(%dx)
801032ae:	bb a0 00 00 00       	mov    $0xa0,%ebx
801032b3:	89 f8                	mov    %edi,%eax
801032b5:	89 da                	mov    %ebx,%edx
801032b7:	ee                   	out    %al,(%dx)
801032b8:	b8 28 00 00 00       	mov    $0x28,%eax
801032bd:	89 ca                	mov    %ecx,%edx
801032bf:	ee                   	out    %al,(%dx)
801032c0:	b8 02 00 00 00       	mov    $0x2,%eax
801032c5:	ee                   	out    %al,(%dx)
801032c6:	b8 03 00 00 00       	mov    $0x3,%eax
801032cb:	ee                   	out    %al,(%dx)
801032cc:	bf 68 00 00 00       	mov    $0x68,%edi
801032d1:	89 f2                	mov    %esi,%edx
801032d3:	89 f8                	mov    %edi,%eax
801032d5:	ee                   	out    %al,(%dx)
801032d6:	b9 0a 00 00 00       	mov    $0xa,%ecx
801032db:	89 c8                	mov    %ecx,%eax
801032dd:	ee                   	out    %al,(%dx)
801032de:	89 f8                	mov    %edi,%eax
801032e0:	89 da                	mov    %ebx,%edx
801032e2:	ee                   	out    %al,(%dx)
801032e3:	89 c8                	mov    %ecx,%eax
801032e5:	ee                   	out    %al,(%dx)
801032e6:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
801032ed:	66 83 f8 ff          	cmp    $0xffff,%ax
801032f1:	74 10                	je     80103303 <picinit+0x93>
801032f3:	ba 21 00 00 00       	mov    $0x21,%edx
801032f8:	ee                   	out    %al,(%dx)
801032f9:	ba a1 00 00 00       	mov    $0xa1,%edx
801032fe:	66 c1 e8 08          	shr    $0x8,%ax
80103302:	ee                   	out    %al,(%dx)
80103303:	5b                   	pop    %ebx
80103304:	5e                   	pop    %esi
80103305:	5f                   	pop    %edi
80103306:	5d                   	pop    %ebp
80103307:	c3                   	ret    
80103308:	66 90                	xchg   %ax,%ax
8010330a:	66 90                	xchg   %ax,%ax
8010330c:	66 90                	xchg   %ax,%ax
8010330e:	66 90                	xchg   %ax,%ax

80103310 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103310:	55                   	push   %ebp
80103311:	89 e5                	mov    %esp,%ebp
80103313:	57                   	push   %edi
80103314:	56                   	push   %esi
80103315:	53                   	push   %ebx
80103316:	83 ec 1c             	sub    $0x1c,%esp
80103319:	8b 75 08             	mov    0x8(%ebp),%esi
8010331c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010331f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103325:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010332b:	e8 30 da ff ff       	call   80100d60 <filealloc>
80103330:	85 c0                	test   %eax,%eax
80103332:	89 06                	mov    %eax,(%esi)
80103334:	0f 84 a4 00 00 00    	je     801033de <pipealloc+0xce>
8010333a:	e8 21 da ff ff       	call   80100d60 <filealloc>
8010333f:	85 c0                	test   %eax,%eax
80103341:	89 03                	mov    %eax,(%ebx)
80103343:	0f 84 87 00 00 00    	je     801033d0 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103349:	e8 52 f1 ff ff       	call   801024a0 <kalloc>
8010334e:	85 c0                	test   %eax,%eax
80103350:	89 c7                	mov    %eax,%edi
80103352:	74 7c                	je     801033d0 <pipealloc+0xc0>
    goto bad;
  p->readopen = 1;
80103354:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010335b:	00 00 00 
  p->writeopen = 1;
8010335e:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103365:	00 00 00 
  p->nwrite = 0;
80103368:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
8010336f:	00 00 00 
  p->nread = 0;
80103372:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103379:	00 00 00 
  initlock(&p->lock, "pipe");
8010337c:	89 04 24             	mov    %eax,(%esp)
8010337f:	c7 44 24 04 08 73 10 	movl   $0x80107308,0x4(%esp)
80103386:	80 
80103387:	e8 14 0e 00 00       	call   801041a0 <initlock>
  (*f0)->type = FD_PIPE;
8010338c:	8b 06                	mov    (%esi),%eax
8010338e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103394:	8b 06                	mov    (%esi),%eax
80103396:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010339a:	8b 06                	mov    (%esi),%eax
8010339c:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
801033a0:	8b 06                	mov    (%esi),%eax
801033a2:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
801033a5:	8b 03                	mov    (%ebx),%eax
801033a7:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801033ad:	8b 03                	mov    (%ebx),%eax
801033af:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
801033b3:	8b 03                	mov    (%ebx),%eax
801033b5:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
801033b9:	8b 03                	mov    (%ebx),%eax
  return 0;
801033bb:	31 db                	xor    %ebx,%ebx
  (*f0)->writable = 0;
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
801033bd:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801033c0:	83 c4 1c             	add    $0x1c,%esp
801033c3:	89 d8                	mov    %ebx,%eax
801033c5:	5b                   	pop    %ebx
801033c6:	5e                   	pop    %esi
801033c7:	5f                   	pop    %edi
801033c8:	5d                   	pop    %ebp
801033c9:	c3                   	ret    
801033ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801033d0:	8b 06                	mov    (%esi),%eax
801033d2:	85 c0                	test   %eax,%eax
801033d4:	74 08                	je     801033de <pipealloc+0xce>
    fileclose(*f0);
801033d6:	89 04 24             	mov    %eax,(%esp)
801033d9:	e8 42 da ff ff       	call   80100e20 <fileclose>
  if(*f1)
801033de:	8b 03                	mov    (%ebx),%eax
    fileclose(*f1);
  return -1;
801033e0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
801033e5:	85 c0                	test   %eax,%eax
801033e7:	74 d7                	je     801033c0 <pipealloc+0xb0>
    fileclose(*f1);
801033e9:	89 04 24             	mov    %eax,(%esp)
801033ec:	e8 2f da ff ff       	call   80100e20 <fileclose>
  return -1;
}
801033f1:	83 c4 1c             	add    $0x1c,%esp
801033f4:	89 d8                	mov    %ebx,%eax
801033f6:	5b                   	pop    %ebx
801033f7:	5e                   	pop    %esi
801033f8:	5f                   	pop    %edi
801033f9:	5d                   	pop    %ebp
801033fa:	c3                   	ret    
801033fb:	90                   	nop
801033fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103400 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103400:	55                   	push   %ebp
80103401:	89 e5                	mov    %esp,%ebp
80103403:	56                   	push   %esi
80103404:	53                   	push   %ebx
80103405:	83 ec 10             	sub    $0x10,%esp
80103408:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010340b:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010340e:	89 1c 24             	mov    %ebx,(%esp)
80103411:	e8 0a 0e 00 00       	call   80104220 <acquire>
  if(writable){
80103416:	85 f6                	test   %esi,%esi
80103418:	74 3e                	je     80103458 <pipeclose+0x58>
    p->writeopen = 0;
    wakeup(&p->nread);
8010341a:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
80103420:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
80103427:	00 00 00 
    wakeup(&p->nread);
8010342a:	89 04 24             	mov    %eax,(%esp)
8010342d:	e8 ae 0a 00 00       	call   80103ee0 <wakeup>
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103432:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
80103438:	85 d2                	test   %edx,%edx
8010343a:	75 0a                	jne    80103446 <pipeclose+0x46>
8010343c:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103442:	85 c0                	test   %eax,%eax
80103444:	74 32                	je     80103478 <pipeclose+0x78>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103446:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80103449:	83 c4 10             	add    $0x10,%esp
8010344c:	5b                   	pop    %ebx
8010344d:	5e                   	pop    %esi
8010344e:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010344f:	e9 fc 0e 00 00       	jmp    80104350 <release>
80103454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103458:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
8010345e:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103465:	00 00 00 
    wakeup(&p->nwrite);
80103468:	89 04 24             	mov    %eax,(%esp)
8010346b:	e8 70 0a 00 00       	call   80103ee0 <wakeup>
80103470:	eb c0                	jmp    80103432 <pipeclose+0x32>
80103472:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103478:	89 1c 24             	mov    %ebx,(%esp)
8010347b:	e8 d0 0e 00 00       	call   80104350 <release>
    kfree((char*)p);
80103480:	89 5d 08             	mov    %ebx,0x8(%ebp)
  } else
    release(&p->lock);
}
80103483:	83 c4 10             	add    $0x10,%esp
80103486:	5b                   	pop    %ebx
80103487:	5e                   	pop    %esi
80103488:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103489:	e9 62 ee ff ff       	jmp    801022f0 <kfree>
8010348e:	66 90                	xchg   %ax,%ax

80103490 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103490:	55                   	push   %ebp
80103491:	89 e5                	mov    %esp,%ebp
80103493:	57                   	push   %edi
80103494:	56                   	push   %esi
80103495:	53                   	push   %ebx
80103496:	83 ec 1c             	sub    $0x1c,%esp
80103499:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  acquire(&p->lock);
8010349c:	89 3c 24             	mov    %edi,(%esp)
8010349f:	e8 7c 0d 00 00       	call   80104220 <acquire>
  for(i = 0; i < n; i++){
801034a4:	8b 45 10             	mov    0x10(%ebp),%eax
801034a7:	85 c0                	test   %eax,%eax
801034a9:	0f 8e c2 00 00 00    	jle    80103571 <pipewrite+0xe1>
801034af:	8b 45 0c             	mov    0xc(%ebp),%eax
801034b2:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
801034b8:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
801034be:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
801034c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801034c7:	03 45 10             	add    0x10(%ebp),%eax
801034ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034cd:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
801034d3:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
801034d9:	39 d1                	cmp    %edx,%ecx
801034db:	0f 85 c4 00 00 00    	jne    801035a5 <pipewrite+0x115>
      if(p->readopen == 0 || proc->killed){
801034e1:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
801034e7:	85 d2                	test   %edx,%edx
801034e9:	0f 84 a1 00 00 00    	je     80103590 <pipewrite+0x100>
801034ef:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801034f6:	8b 42 24             	mov    0x24(%edx),%eax
801034f9:	85 c0                	test   %eax,%eax
801034fb:	74 22                	je     8010351f <pipewrite+0x8f>
801034fd:	e9 8e 00 00 00       	jmp    80103590 <pipewrite+0x100>
80103502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103508:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
8010350e:	85 c0                	test   %eax,%eax
80103510:	74 7e                	je     80103590 <pipewrite+0x100>
80103512:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103518:	8b 48 24             	mov    0x24(%eax),%ecx
8010351b:	85 c9                	test   %ecx,%ecx
8010351d:	75 71                	jne    80103590 <pipewrite+0x100>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
8010351f:	89 34 24             	mov    %esi,(%esp)
80103522:	e8 b9 09 00 00       	call   80103ee0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103527:	89 7c 24 04          	mov    %edi,0x4(%esp)
8010352b:	89 1c 24             	mov    %ebx,(%esp)
8010352e:	e8 0d 08 00 00       	call   80103d40 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103533:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103539:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
8010353f:	05 00 02 00 00       	add    $0x200,%eax
80103544:	39 c2                	cmp    %eax,%edx
80103546:	74 c0                	je     80103508 <pipewrite+0x78>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103548:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010354b:	8d 4a 01             	lea    0x1(%edx),%ecx
8010354e:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103554:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
8010355a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010355e:	0f b6 00             	movzbl (%eax),%eax
80103561:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103565:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103568:	3b 45 e0             	cmp    -0x20(%ebp),%eax
8010356b:	0f 85 5c ff ff ff    	jne    801034cd <pipewrite+0x3d>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103571:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
80103577:	89 14 24             	mov    %edx,(%esp)
8010357a:	e8 61 09 00 00       	call   80103ee0 <wakeup>
  release(&p->lock);
8010357f:	89 3c 24             	mov    %edi,(%esp)
80103582:	e8 c9 0d 00 00       	call   80104350 <release>
  return n;
80103587:	8b 45 10             	mov    0x10(%ebp),%eax
8010358a:	eb 11                	jmp    8010359d <pipewrite+0x10d>
8010358c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
80103590:	89 3c 24             	mov    %edi,(%esp)
80103593:	e8 b8 0d 00 00       	call   80104350 <release>
        return -1;
80103598:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
8010359d:	83 c4 1c             	add    $0x1c,%esp
801035a0:	5b                   	pop    %ebx
801035a1:	5e                   	pop    %esi
801035a2:	5f                   	pop    %edi
801035a3:	5d                   	pop    %ebp
801035a4:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801035a5:	89 ca                	mov    %ecx,%edx
801035a7:	eb 9f                	jmp    80103548 <pipewrite+0xb8>
801035a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801035b0 <piperead>:
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
{
801035b0:	55                   	push   %ebp
801035b1:	89 e5                	mov    %esp,%ebp
801035b3:	57                   	push   %edi
801035b4:	56                   	push   %esi
801035b5:	53                   	push   %ebx
801035b6:	83 ec 1c             	sub    $0x1c,%esp
801035b9:	8b 75 08             	mov    0x8(%ebp),%esi
801035bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801035bf:	89 34 24             	mov    %esi,(%esp)
801035c2:	e8 59 0c 00 00       	call   80104220 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801035c7:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
801035cd:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
801035d3:	75 5b                	jne    80103630 <piperead+0x80>
801035d5:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
801035db:	85 db                	test   %ebx,%ebx
801035dd:	74 51                	je     80103630 <piperead+0x80>
801035df:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801035e5:	eb 25                	jmp    8010360c <piperead+0x5c>
801035e7:	90                   	nop
    if(proc->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801035e8:	89 74 24 04          	mov    %esi,0x4(%esp)
801035ec:	89 1c 24             	mov    %ebx,(%esp)
801035ef:	e8 4c 07 00 00       	call   80103d40 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801035f4:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
801035fa:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
80103600:	75 2e                	jne    80103630 <piperead+0x80>
80103602:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103608:	85 d2                	test   %edx,%edx
8010360a:	74 24                	je     80103630 <piperead+0x80>
    if(proc->killed){
8010360c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103612:	8b 48 24             	mov    0x24(%eax),%ecx
80103615:	85 c9                	test   %ecx,%ecx
80103617:	74 cf                	je     801035e8 <piperead+0x38>
      release(&p->lock);
80103619:	89 34 24             	mov    %esi,(%esp)
8010361c:	e8 2f 0d 00 00       	call   80104350 <release>
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103621:	83 c4 1c             	add    $0x1c,%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(proc->killed){
      release(&p->lock);
      return -1;
80103624:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103629:	5b                   	pop    %ebx
8010362a:	5e                   	pop    %esi
8010362b:	5f                   	pop    %edi
8010362c:	5d                   	pop    %ebp
8010362d:	c3                   	ret    
8010362e:	66 90                	xchg   %ax,%ax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103630:	8b 55 10             	mov    0x10(%ebp),%edx
    if(p->nread == p->nwrite)
80103633:	31 db                	xor    %ebx,%ebx
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103635:	85 d2                	test   %edx,%edx
80103637:	7f 2b                	jg     80103664 <piperead+0xb4>
80103639:	eb 31                	jmp    8010366c <piperead+0xbc>
8010363b:	90                   	nop
8010363c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103640:	8d 48 01             	lea    0x1(%eax),%ecx
80103643:	25 ff 01 00 00       	and    $0x1ff,%eax
80103648:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010364e:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
80103653:	88 04 1f             	mov    %al,(%edi,%ebx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103656:	83 c3 01             	add    $0x1,%ebx
80103659:	3b 5d 10             	cmp    0x10(%ebp),%ebx
8010365c:	74 0e                	je     8010366c <piperead+0xbc>
    if(p->nread == p->nwrite)
8010365e:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103664:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010366a:	75 d4                	jne    80103640 <piperead+0x90>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010366c:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103672:	89 04 24             	mov    %eax,(%esp)
80103675:	e8 66 08 00 00       	call   80103ee0 <wakeup>
  release(&p->lock);
8010367a:	89 34 24             	mov    %esi,(%esp)
8010367d:	e8 ce 0c 00 00       	call   80104350 <release>
  return i;
}
80103682:	83 c4 1c             	add    $0x1c,%esp
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
80103685:	89 d8                	mov    %ebx,%eax
}
80103687:	5b                   	pop    %ebx
80103688:	5e                   	pop    %esi
80103689:	5f                   	pop    %edi
8010368a:	5d                   	pop    %ebp
8010368b:	c3                   	ret    
8010368c:	66 90                	xchg   %ax,%ax
8010368e:	66 90                	xchg   %ax,%ax

80103690 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103694:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103699:	83 ec 14             	sub    $0x14,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010369c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801036a3:	e8 78 0b 00 00       	call   80104220 <acquire>
801036a8:	eb 11                	jmp    801036bb <allocproc+0x2b>
801036aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801036b0:	83 eb 80             	sub    $0xffffff80,%ebx
801036b3:	81 fb d4 4d 11 80    	cmp    $0x80114dd4,%ebx
801036b9:	74 7d                	je     80103738 <allocproc+0xa8>
    if(p->state == UNUSED)
801036bb:	8b 43 0c             	mov    0xc(%ebx),%eax
801036be:	85 c0                	test   %eax,%eax
801036c0:	75 ee                	jne    801036b0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801036c2:	a1 08 a0 10 80       	mov    0x8010a008,%eax

  release(&ptable.lock);
801036c7:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801036ce:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
801036d5:	8d 50 01             	lea    0x1(%eax),%edx
801036d8:	89 15 08 a0 10 80    	mov    %edx,0x8010a008
801036de:	89 43 10             	mov    %eax,0x10(%ebx)

  release(&ptable.lock);
801036e1:	e8 6a 0c 00 00       	call   80104350 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801036e6:	e8 b5 ed ff ff       	call   801024a0 <kalloc>
801036eb:	85 c0                	test   %eax,%eax
801036ed:	89 43 08             	mov    %eax,0x8(%ebx)
801036f0:	74 5a                	je     8010374c <allocproc+0xbc>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801036f2:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
801036f8:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801036fd:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103700:	c7 40 14 6d 55 10 80 	movl   $0x8010556d,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103707:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
8010370e:	00 
8010370f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80103716:	00 
80103717:	89 04 24             	mov    %eax,(%esp)
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
8010371a:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010371d:	e8 7e 0c 00 00       	call   801043a0 <memset>
  p->context->eip = (uint)forkret;
80103722:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103725:	c7 40 10 60 37 10 80 	movl   $0x80103760,0x10(%eax)

  return p;
8010372c:	89 d8                	mov    %ebx,%eax
}
8010372e:	83 c4 14             	add    $0x14,%esp
80103731:	5b                   	pop    %ebx
80103732:	5d                   	pop    %ebp
80103733:	c3                   	ret    
80103734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103738:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
8010373f:	e8 0c 0c 00 00       	call   80104350 <release>
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103744:	83 c4 14             	add    $0x14,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;
80103747:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103749:	5b                   	pop    %ebx
8010374a:	5d                   	pop    %ebp
8010374b:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
8010374c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103753:	eb d9                	jmp    8010372e <allocproc+0x9e>
80103755:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103760 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103760:	55                   	push   %ebp
80103761:	89 e5                	mov    %esp,%ebp
80103763:	83 ec 18             	sub    $0x18,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103766:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
8010376d:	e8 de 0b 00 00       	call   80104350 <release>

  if (first) {
80103772:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103777:	85 c0                	test   %eax,%eax
80103779:	75 05                	jne    80103780 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010377b:	c9                   	leave  
8010377c:	c3                   	ret    
8010377d:	8d 76 00             	lea    0x0(%esi),%esi
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103780:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103787:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
8010378e:	00 00 00 
    iinit(ROOTDEV);
80103791:	e8 da dc ff ff       	call   80101470 <iinit>
    initlog(ROOTDEV);
80103796:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010379d:	e8 4e f3 ff ff       	call   80102af0 <initlog>
  }

  // Return to "caller", actually trapret (see allocproc).
}
801037a2:	c9                   	leave  
801037a3:	c3                   	ret    
801037a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037b0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801037b0:	55                   	push   %ebp
801037b1:	89 e5                	mov    %esp,%ebp
801037b3:	83 ec 18             	sub    $0x18,%esp
  initlock(&ptable.lock, "ptable");
801037b6:	c7 44 24 04 0d 73 10 	movl   $0x8010730d,0x4(%esp)
801037bd:	80 
801037be:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801037c5:	e8 d6 09 00 00       	call   801041a0 <initlock>
}
801037ca:	c9                   	leave  
801037cb:	c3                   	ret    
801037cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037d0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	53                   	push   %ebx
801037d4:	83 ec 14             	sub    $0x14,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801037d7:	e8 b4 fe ff ff       	call   80103690 <allocproc>
801037dc:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
801037de:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
  if((p->pgdir = setupkvm()) == 0)
801037e3:	e8 88 2f 00 00       	call   80106770 <setupkvm>
801037e8:	85 c0                	test   %eax,%eax
801037ea:	89 43 04             	mov    %eax,0x4(%ebx)
801037ed:	0f 84 d4 00 00 00    	je     801038c7 <userinit+0xf7>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801037f3:	89 04 24             	mov    %eax,(%esp)
801037f6:	c7 44 24 08 2c 00 00 	movl   $0x2c,0x8(%esp)
801037fd:	00 
801037fe:	c7 44 24 04 60 a4 10 	movl   $0x8010a460,0x4(%esp)
80103805:	80 
80103806:	e8 f5 30 00 00       	call   80106900 <inituvm>
  p->sz = PGSIZE;
8010380b:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103811:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
80103818:	00 
80103819:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80103820:	00 
80103821:	8b 43 18             	mov    0x18(%ebx),%eax
80103824:	89 04 24             	mov    %eax,(%esp)
80103827:	e8 74 0b 00 00       	call   801043a0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010382c:	8b 43 18             	mov    0x18(%ebx),%eax
8010382f:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103834:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103839:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010383d:	8b 43 18             	mov    0x18(%ebx),%eax
80103840:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103844:	8b 43 18             	mov    0x18(%ebx),%eax
80103847:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010384b:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
8010384f:	8b 43 18             	mov    0x18(%ebx),%eax
80103852:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103856:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010385a:	8b 43 18             	mov    0x18(%ebx),%eax
8010385d:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103864:	8b 43 18             	mov    0x18(%ebx),%eax
80103867:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
8010386e:	8b 43 18             	mov    0x18(%ebx),%eax
80103871:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103878:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010387b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103882:	00 
80103883:	c7 44 24 04 2d 73 10 	movl   $0x8010732d,0x4(%esp)
8010388a:	80 
8010388b:	89 04 24             	mov    %eax,(%esp)
8010388e:	e8 0d 0d 00 00       	call   801045a0 <safestrcpy>
  p->cwd = namei("/");
80103893:	c7 04 24 36 73 10 80 	movl   $0x80107336,(%esp)
8010389a:	e8 41 e6 ff ff       	call   80101ee0 <namei>
8010389f:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
801038a2:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801038a9:	e8 72 09 00 00       	call   80104220 <acquire>

  p->state = RUNNABLE;
801038ae:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
801038b5:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801038bc:	e8 8f 0a 00 00       	call   80104350 <release>
}
801038c1:	83 c4 14             	add    $0x14,%esp
801038c4:	5b                   	pop    %ebx
801038c5:	5d                   	pop    %ebp
801038c6:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
801038c7:	c7 04 24 14 73 10 80 	movl   $0x80107314,(%esp)
801038ce:	e8 8d ca ff ff       	call   80100360 <panic>
801038d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801038d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801038e0 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801038e0:	55                   	push   %ebp
801038e1:	89 e5                	mov    %esp,%ebp
801038e3:	83 ec 18             	sub    $0x18,%esp
  uint sz;

  sz = proc->sz;
801038e6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801038ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint sz;

  sz = proc->sz;
801038f0:	8b 02                	mov    (%edx),%eax
  if(n > 0){
801038f2:	83 f9 00             	cmp    $0x0,%ecx
801038f5:	7e 39                	jle    80103930 <growproc+0x50>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
801038f7:	01 c1                	add    %eax,%ecx
801038f9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
801038fd:	89 44 24 04          	mov    %eax,0x4(%esp)
80103901:	8b 42 04             	mov    0x4(%edx),%eax
80103904:	89 04 24             	mov    %eax,(%esp)
80103907:	e8 34 31 00 00       	call   80106a40 <allocuvm>
8010390c:	85 c0                	test   %eax,%eax
8010390e:	74 40                	je     80103950 <growproc+0x70>
80103910:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
80103917:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
80103919:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010391f:	89 04 24             	mov    %eax,(%esp)
80103922:	e8 09 2f 00 00       	call   80106830 <switchuvm>
  return 0;
80103927:	31 c0                	xor    %eax,%eax
}
80103929:	c9                   	leave  
8010392a:	c3                   	ret    
8010392b:	90                   	nop
8010392c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103930:	74 e5                	je     80103917 <growproc+0x37>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80103932:	01 c1                	add    %eax,%ecx
80103934:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80103938:	89 44 24 04          	mov    %eax,0x4(%esp)
8010393c:	8b 42 04             	mov    0x4(%edx),%eax
8010393f:	89 04 24             	mov    %eax,(%esp)
80103942:	e8 e9 31 00 00       	call   80106b30 <deallocuvm>
80103947:	85 c0                	test   %eax,%eax
80103949:	75 c5                	jne    80103910 <growproc+0x30>
8010394b:	90                   	nop
8010394c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint sz;

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
80103950:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}
80103955:	c9                   	leave  
80103956:	c3                   	ret    
80103957:	89 f6                	mov    %esi,%esi
80103959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103960 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103960:	55                   	push   %ebp
80103961:	89 e5                	mov    %esp,%ebp
80103963:	57                   	push   %edi
80103964:	56                   	push   %esi
80103965:	53                   	push   %ebx
80103966:	83 ec 1c             	sub    $0x1c,%esp
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
80103969:	e8 22 fd ff ff       	call   80103690 <allocproc>
8010396e:	85 c0                	test   %eax,%eax
80103970:	89 c3                	mov    %eax,%ebx
80103972:	0f 84 d5 00 00 00    	je     80103a4d <fork+0xed>
    return -1;
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
80103978:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010397e:	8b 10                	mov    (%eax),%edx
80103980:	89 54 24 04          	mov    %edx,0x4(%esp)
80103984:	8b 40 04             	mov    0x4(%eax),%eax
80103987:	89 04 24             	mov    %eax,(%esp)
8010398a:	e8 71 32 00 00       	call   80106c00 <copyuvm>
8010398f:	85 c0                	test   %eax,%eax
80103991:	89 43 04             	mov    %eax,0x4(%ebx)
80103994:	0f 84 ba 00 00 00    	je     80103a54 <fork+0xf4>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
8010399a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  np->parent = proc;
  *np->tf = *proc->tf;
801039a0:	b9 13 00 00 00       	mov    $0x13,%ecx
801039a5:	8b 7b 18             	mov    0x18(%ebx),%edi
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
801039a8:	8b 00                	mov    (%eax),%eax
801039aa:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
801039ac:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801039b2:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
801039b5:	8b 70 18             	mov    0x18(%eax),%esi
801039b8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039ba:	31 f6                	xor    %esi,%esi
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
801039bc:	8b 43 18             	mov    0x18(%ebx),%eax
801039bf:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801039c6:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
801039cd:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
801039d0:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
801039d4:	85 c0                	test   %eax,%eax
801039d6:	74 13                	je     801039eb <fork+0x8b>
      np->ofile[i] = filedup(proc->ofile[i]);
801039d8:	89 04 24             	mov    %eax,(%esp)
801039db:	e8 f0 d3 ff ff       	call   80100dd0 <filedup>
801039e0:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
801039e4:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039eb:	83 c6 01             	add    $0x1,%esi
801039ee:	83 fe 10             	cmp    $0x10,%esi
801039f1:	75 dd                	jne    801039d0 <fork+0x70>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
801039f3:	8b 42 68             	mov    0x68(%edx),%eax
801039f6:	89 04 24             	mov    %eax,(%esp)
801039f9:	e8 82 dc ff ff       	call   80101680 <idup>
801039fe:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103a01:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a07:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103a0e:	00 
80103a0f:	83 c0 6c             	add    $0x6c,%eax
80103a12:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a16:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103a19:	89 04 24             	mov    %eax,(%esp)
80103a1c:	e8 7f 0b 00 00       	call   801045a0 <safestrcpy>

  pid = np->pid;
80103a21:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
80103a24:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103a2b:	e8 f0 07 00 00       	call   80104220 <acquire>

  np->state = RUNNABLE;
80103a30:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103a37:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103a3e:	e8 0d 09 00 00       	call   80104350 <release>

  return pid;
80103a43:	89 f0                	mov    %esi,%eax
}
80103a45:	83 c4 1c             	add    $0x1c,%esp
80103a48:	5b                   	pop    %ebx
80103a49:	5e                   	pop    %esi
80103a4a:	5f                   	pop    %edi
80103a4b:	5d                   	pop    %ebp
80103a4c:	c3                   	ret    
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103a4d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a52:	eb f1                	jmp    80103a45 <fork+0xe5>
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
80103a54:	8b 43 08             	mov    0x8(%ebx),%eax
80103a57:	89 04 24             	mov    %eax,(%esp)
80103a5a:	e8 91 e8 ff ff       	call   801022f0 <kfree>
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
80103a5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
80103a64:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103a6b:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103a72:	eb d1                	jmp    80103a45 <fork+0xe5>
80103a74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103a7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103a80 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103a80:	55                   	push   %ebp
80103a81:	89 e5                	mov    %esp,%ebp
80103a83:	53                   	push   %ebx
80103a84:	83 ec 14             	sub    $0x14,%esp
80103a87:	90                   	nop
}

static inline void
sti(void)
{
  asm volatile("sti");
80103a88:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a89:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a90:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a95:	e8 86 07 00 00       	call   80104220 <acquire>
80103a9a:	eb 0f                	jmp    80103aab <scheduler+0x2b>
80103a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103aa0:	83 eb 80             	sub    $0xffffff80,%ebx
80103aa3:	81 fb d4 4d 11 80    	cmp    $0x80114dd4,%ebx
80103aa9:	74 6d                	je     80103b18 <scheduler+0x98>
      if(p->state != RUNNABLE)
80103aab:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103aaf:	75 ef                	jne    80103aa0 <scheduler+0x20>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103ab1:	89 1c 24             	mov    %ebx,(%esp)
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
80103ab4:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
      switchuvm(p);
80103abb:	e8 70 2d 00 00       	call   80106830 <switchuvm>
      p->state = RUNNING;
      cprintf("Process %s with pid %d running\n", p->name, p->pid);
80103ac0:	8b 43 10             	mov    0x10(%ebx),%eax
80103ac3:	c7 04 24 e0 73 10 80 	movl   $0x801073e0,(%esp)
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103aca:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      cprintf("Process %s with pid %d running\n", p->name, p->pid);
80103ad1:	89 44 24 08          	mov    %eax,0x8(%esp)
80103ad5:	8d 43 6c             	lea    0x6c(%ebx),%eax
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ad8:	83 eb 80             	sub    $0xffffff80,%ebx
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
      p->state = RUNNING;
      cprintf("Process %s with pid %d running\n", p->name, p->pid);
80103adb:	89 44 24 04          	mov    %eax,0x4(%esp)
80103adf:	e8 6c cb ff ff       	call   80100650 <cprintf>
      swtch(&cpu->scheduler, p->context);
80103ae4:	8b 43 9c             	mov    -0x64(%ebx),%eax
80103ae7:	89 44 24 04          	mov    %eax,0x4(%esp)
80103aeb:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103af1:	83 c0 04             	add    $0x4,%eax
80103af4:	89 04 24             	mov    %eax,(%esp)
80103af7:	e8 ff 0a 00 00       	call   801045fb <swtch>
      switchkvm();
80103afc:	e8 0f 2d 00 00       	call   80106810 <switchkvm>
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b01:	81 fb d4 4d 11 80    	cmp    $0x80114dd4,%ebx
      swtch(&cpu->scheduler, p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103b07:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103b0e:	00 00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b12:	75 97                	jne    80103aab <scheduler+0x2b>
80103b14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
    }
    release(&ptable.lock);
80103b18:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103b1f:	e8 2c 08 00 00       	call   80104350 <release>

  }
80103b24:	e9 5f ff ff ff       	jmp    80103a88 <scheduler+0x8>
80103b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103b30 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103b30:	55                   	push   %ebp
80103b31:	89 e5                	mov    %esp,%ebp
80103b33:	53                   	push   %ebx
80103b34:	83 ec 14             	sub    $0x14,%esp
  int intena;

  if(!holding(&ptable.lock))
80103b37:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103b3e:	e8 6d 07 00 00       	call   801042b0 <holding>
80103b43:	85 c0                	test   %eax,%eax
80103b45:	74 4d                	je     80103b94 <sched+0x64>
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
80103b47:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103b4d:	83 b8 ac 00 00 00 01 	cmpl   $0x1,0xac(%eax)
80103b54:	75 62                	jne    80103bb8 <sched+0x88>
    panic("sched locks");
  if(proc->state == RUNNING)
80103b56:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103b5d:	83 7a 0c 04          	cmpl   $0x4,0xc(%edx)
80103b61:	74 49                	je     80103bac <sched+0x7c>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b63:	9c                   	pushf  
80103b64:	59                   	pop    %ecx
    panic("sched running");
  if(readeflags()&FL_IF)
80103b65:	80 e5 02             	and    $0x2,%ch
80103b68:	75 36                	jne    80103ba0 <sched+0x70>
    panic("sched interruptible");
  intena = cpu->intena;
80103b6a:	8b 98 b0 00 00 00    	mov    0xb0(%eax),%ebx
  swtch(&proc->context, cpu->scheduler);
80103b70:	83 c2 1c             	add    $0x1c,%edx
80103b73:	8b 40 04             	mov    0x4(%eax),%eax
80103b76:	89 14 24             	mov    %edx,(%esp)
80103b79:	89 44 24 04          	mov    %eax,0x4(%esp)
80103b7d:	e8 79 0a 00 00       	call   801045fb <swtch>
  cpu->intena = intena;
80103b82:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103b88:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103b8e:	83 c4 14             	add    $0x14,%esp
80103b91:	5b                   	pop    %ebx
80103b92:	5d                   	pop    %ebp
80103b93:	c3                   	ret    
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103b94:	c7 04 24 38 73 10 80 	movl   $0x80107338,(%esp)
80103b9b:	e8 c0 c7 ff ff       	call   80100360 <panic>
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103ba0:	c7 04 24 64 73 10 80 	movl   $0x80107364,(%esp)
80103ba7:	e8 b4 c7 ff ff       	call   80100360 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
80103bac:	c7 04 24 56 73 10 80 	movl   $0x80107356,(%esp)
80103bb3:	e8 a8 c7 ff ff       	call   80100360 <panic>
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
80103bb8:	c7 04 24 4a 73 10 80 	movl   $0x8010734a,(%esp)
80103bbf:	e8 9c c7 ff ff       	call   80100360 <panic>
80103bc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103bca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103bd0 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103bd0:	55                   	push   %ebp
80103bd1:	89 e5                	mov    %esp,%ebp
80103bd3:	56                   	push   %esi
80103bd4:	53                   	push   %ebx
  struct proc *p;
  int fd;

  if(proc == initproc)
80103bd5:	31 db                	xor    %ebx,%ebx
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103bd7:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  int fd;

  if(proc == initproc)
80103bda:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103be1:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
80103be7:	0f 84 01 01 00 00    	je     80103cee <exit+0x11e>
80103bed:	8d 76 00             	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
80103bf0:	8d 73 08             	lea    0x8(%ebx),%esi
80103bf3:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103bf7:	85 c0                	test   %eax,%eax
80103bf9:	74 17                	je     80103c12 <exit+0x42>
      fileclose(proc->ofile[fd]);
80103bfb:	89 04 24             	mov    %eax,(%esp)
80103bfe:	e8 1d d2 ff ff       	call   80100e20 <fileclose>
      proc->ofile[fd] = 0;
80103c03:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103c0a:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103c11:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103c12:	83 c3 01             	add    $0x1,%ebx
80103c15:	83 fb 10             	cmp    $0x10,%ebx
80103c18:	75 d6                	jne    80103bf0 <exit+0x20>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
80103c1a:	e8 71 ef ff ff       	call   80102b90 <begin_op>
  iput(proc->cwd);
80103c1f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103c25:	8b 40 68             	mov    0x68(%eax),%eax
80103c28:	89 04 24             	mov    %eax,(%esp)
80103c2b:	e8 90 db ff ff       	call   801017c0 <iput>
  end_op();
80103c30:	e8 cb ef ff ff       	call   80102c00 <end_op>
  proc->cwd = 0;
80103c35:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103c3b:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103c42:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103c49:	e8 d2 05 00 00       	call   80104220 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103c4e:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c55:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103c5a:	8b 51 14             	mov    0x14(%ecx),%edx
80103c5d:	eb 0b                	jmp    80103c6a <exit+0x9a>
80103c5f:	90                   	nop
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c60:	83 e8 80             	sub    $0xffffff80,%eax
80103c63:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103c68:	74 1c                	je     80103c86 <exit+0xb6>
    if(p->state == SLEEPING && p->chan == chan)
80103c6a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c6e:	75 f0                	jne    80103c60 <exit+0x90>
80103c70:	3b 50 20             	cmp    0x20(%eax),%edx
80103c73:	75 eb                	jne    80103c60 <exit+0x90>
      p->state = RUNNABLE;
80103c75:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c7c:	83 e8 80             	sub    $0xffffff80,%eax
80103c7f:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103c84:	75 e4                	jne    80103c6a <exit+0x9a>
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103c86:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103c8c:	ba d4 2d 11 80       	mov    $0x80112dd4,%edx
80103c91:	eb 10                	jmp    80103ca3 <exit+0xd3>
80103c93:	90                   	nop
80103c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c98:	83 ea 80             	sub    $0xffffff80,%edx
80103c9b:	81 fa d4 4d 11 80    	cmp    $0x80114dd4,%edx
80103ca1:	74 33                	je     80103cd6 <exit+0x106>
    if(p->parent == proc){
80103ca3:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103ca6:	75 f0                	jne    80103c98 <exit+0xc8>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103ca8:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103cac:	89 5a 14             	mov    %ebx,0x14(%edx)
      if(p->state == ZOMBIE)
80103caf:	75 e7                	jne    80103c98 <exit+0xc8>
80103cb1:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103cb6:	eb 0a                	jmp    80103cc2 <exit+0xf2>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cb8:	83 e8 80             	sub    $0xffffff80,%eax
80103cbb:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103cc0:	74 d6                	je     80103c98 <exit+0xc8>
    if(p->state == SLEEPING && p->chan == chan)
80103cc2:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103cc6:	75 f0                	jne    80103cb8 <exit+0xe8>
80103cc8:	3b 58 20             	cmp    0x20(%eax),%ebx
80103ccb:	75 eb                	jne    80103cb8 <exit+0xe8>
      p->state = RUNNABLE;
80103ccd:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103cd4:	eb e2                	jmp    80103cb8 <exit+0xe8>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80103cd6:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103cdd:	e8 4e fe ff ff       	call   80103b30 <sched>
  panic("zombie exit");
80103ce2:	c7 04 24 85 73 10 80 	movl   $0x80107385,(%esp)
80103ce9:	e8 72 c6 ff ff       	call   80100360 <panic>
{
  struct proc *p;
  int fd;

  if(proc == initproc)
    panic("init exiting");
80103cee:	c7 04 24 78 73 10 80 	movl   $0x80107378,(%esp)
80103cf5:	e8 66 c6 ff ff       	call   80100360 <panic>
80103cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103d00 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103d00:	55                   	push   %ebp
80103d01:	89 e5                	mov    %esp,%ebp
80103d03:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103d06:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103d0d:	e8 0e 05 00 00       	call   80104220 <acquire>
  proc->state = RUNNABLE;
80103d12:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d18:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103d1f:	e8 0c fe ff ff       	call   80103b30 <sched>
  release(&ptable.lock);
80103d24:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103d2b:	e8 20 06 00 00       	call   80104350 <release>
}
80103d30:	c9                   	leave  
80103d31:	c3                   	ret    
80103d32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d40 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103d40:	55                   	push   %ebp
80103d41:	89 e5                	mov    %esp,%ebp
80103d43:	56                   	push   %esi
80103d44:	53                   	push   %ebx
80103d45:	83 ec 10             	sub    $0x10,%esp
  if(proc == 0)
80103d48:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103d4e:	8b 75 08             	mov    0x8(%ebp),%esi
80103d51:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103d54:	85 c0                	test   %eax,%eax
80103d56:	0f 84 8b 00 00 00    	je     80103de7 <sleep+0xa7>
    panic("sleep");

  if(lk == 0)
80103d5c:	85 db                	test   %ebx,%ebx
80103d5e:	74 7b                	je     80103ddb <sleep+0x9b>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103d60:	81 fb a0 2d 11 80    	cmp    $0x80112da0,%ebx
80103d66:	74 50                	je     80103db8 <sleep+0x78>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103d68:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103d6f:	e8 ac 04 00 00       	call   80104220 <acquire>
    release(lk);
80103d74:	89 1c 24             	mov    %ebx,(%esp)
80103d77:	e8 d4 05 00 00       	call   80104350 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80103d7c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d82:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103d85:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103d8c:	e8 9f fd ff ff       	call   80103b30 <sched>

  // Tidy up.
  proc->chan = 0;
80103d91:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d97:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103d9e:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103da5:	e8 a6 05 00 00       	call   80104350 <release>
    acquire(lk);
80103daa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
}
80103dad:	83 c4 10             	add    $0x10,%esp
80103db0:	5b                   	pop    %ebx
80103db1:	5e                   	pop    %esi
80103db2:	5d                   	pop    %ebp
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103db3:	e9 68 04 00 00       	jmp    80104220 <acquire>
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
80103db8:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103dbb:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103dc2:	e8 69 fd ff ff       	call   80103b30 <sched>

  // Tidy up.
  proc->chan = 0;
80103dc7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103dcd:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103dd4:	83 c4 10             	add    $0x10,%esp
80103dd7:	5b                   	pop    %ebx
80103dd8:	5e                   	pop    %esi
80103dd9:	5d                   	pop    %ebp
80103dda:	c3                   	ret    
{
  if(proc == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103ddb:	c7 04 24 97 73 10 80 	movl   $0x80107397,(%esp)
80103de2:	e8 79 c5 ff ff       	call   80100360 <panic>
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");
80103de7:	c7 04 24 91 73 10 80 	movl   $0x80107391,(%esp)
80103dee:	e8 6d c5 ff ff       	call   80100360 <panic>
80103df3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103e00 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103e00:	55                   	push   %ebp
80103e01:	89 e5                	mov    %esp,%ebp
80103e03:	56                   	push   %esi
80103e04:	53                   	push   %ebx
80103e05:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80103e08:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103e0f:	e8 0c 04 00 00       	call   80104220 <acquire>
80103e14:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103e1a:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e1c:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103e21:	eb 10                	jmp    80103e33 <wait+0x33>
80103e23:	90                   	nop
80103e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e28:	83 eb 80             	sub    $0xffffff80,%ebx
80103e2b:	81 fb d4 4d 11 80    	cmp    $0x80114dd4,%ebx
80103e31:	74 1d                	je     80103e50 <wait+0x50>
      if(p->parent != proc)
80103e33:	39 43 14             	cmp    %eax,0x14(%ebx)
80103e36:	75 f0                	jne    80103e28 <wait+0x28>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103e38:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e3c:	74 2f                	je     80103e6d <wait+0x6d>

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e3e:	83 eb 80             	sub    $0xffffff80,%ebx
      if(p->parent != proc)
        continue;
      havekids = 1;
80103e41:	ba 01 00 00 00       	mov    $0x1,%edx

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e46:	81 fb d4 4d 11 80    	cmp    $0x80114dd4,%ebx
80103e4c:	75 e5                	jne    80103e33 <wait+0x33>
80103e4e:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
80103e50:	85 d2                	test   %edx,%edx
80103e52:	74 6e                	je     80103ec2 <wait+0xc2>
80103e54:	8b 50 24             	mov    0x24(%eax),%edx
80103e57:	85 d2                	test   %edx,%edx
80103e59:	75 67                	jne    80103ec2 <wait+0xc2>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80103e5b:	c7 44 24 04 a0 2d 11 	movl   $0x80112da0,0x4(%esp)
80103e62:	80 
80103e63:	89 04 24             	mov    %eax,(%esp)
80103e66:	e8 d5 fe ff ff       	call   80103d40 <sleep>
  }
80103e6b:	eb a7                	jmp    80103e14 <wait+0x14>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103e6d:	8b 43 08             	mov    0x8(%ebx),%eax
      if(p->parent != proc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103e70:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103e73:	89 04 24             	mov    %eax,(%esp)
80103e76:	e8 75 e4 ff ff       	call   801022f0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103e7b:	8b 43 04             	mov    0x4(%ebx),%eax
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103e7e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103e85:	89 04 24             	mov    %eax,(%esp)
80103e88:	e8 c3 2c 00 00       	call   80106b50 <freevm>
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
80103e8d:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
80103e94:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103e9b:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103ea2:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103ea6:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103ead:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103eb4:	e8 97 04 00 00       	call   80104350 <release>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103eb9:	83 c4 10             	add    $0x10,%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103ebc:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ebe:	5b                   	pop    %ebx
80103ebf:	5e                   	pop    %esi
80103ec0:	5d                   	pop    %ebp
80103ec1:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
80103ec2:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103ec9:	e8 82 04 00 00       	call   80104350 <release>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ece:	83 c4 10             	add    $0x10,%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
80103ed1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ed6:	5b                   	pop    %ebx
80103ed7:	5e                   	pop    %esi
80103ed8:	5d                   	pop    %ebp
80103ed9:	c3                   	ret    
80103eda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103ee0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103ee0:	55                   	push   %ebp
80103ee1:	89 e5                	mov    %esp,%ebp
80103ee3:	53                   	push   %ebx
80103ee4:	83 ec 14             	sub    $0x14,%esp
80103ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103eea:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103ef1:	e8 2a 03 00 00       	call   80104220 <acquire>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ef6:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103efb:	eb 0d                	jmp    80103f0a <wakeup+0x2a>
80103efd:	8d 76 00             	lea    0x0(%esi),%esi
80103f00:	83 e8 80             	sub    $0xffffff80,%eax
80103f03:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103f08:	74 1e                	je     80103f28 <wakeup+0x48>
    if(p->state == SLEEPING && p->chan == chan)
80103f0a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f0e:	75 f0                	jne    80103f00 <wakeup+0x20>
80103f10:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f13:	75 eb                	jne    80103f00 <wakeup+0x20>
      p->state = RUNNABLE;
80103f15:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f1c:	83 e8 80             	sub    $0xffffff80,%eax
80103f1f:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103f24:	75 e4                	jne    80103f0a <wakeup+0x2a>
80103f26:	66 90                	xchg   %ax,%ax
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f28:	c7 45 08 a0 2d 11 80 	movl   $0x80112da0,0x8(%ebp)
}
80103f2f:	83 c4 14             	add    $0x14,%esp
80103f32:	5b                   	pop    %ebx
80103f33:	5d                   	pop    %ebp
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f34:	e9 17 04 00 00       	jmp    80104350 <release>
80103f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103f40 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103f40:	55                   	push   %ebp
80103f41:	89 e5                	mov    %esp,%ebp
80103f43:	53                   	push   %ebx
80103f44:	83 ec 14             	sub    $0x14,%esp
80103f47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103f4a:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103f51:	e8 ca 02 00 00       	call   80104220 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f56:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103f5b:	eb 0d                	jmp    80103f6a <kill+0x2a>
80103f5d:	8d 76 00             	lea    0x0(%esi),%esi
80103f60:	83 e8 80             	sub    $0xffffff80,%eax
80103f63:	3d d4 4d 11 80       	cmp    $0x80114dd4,%eax
80103f68:	74 36                	je     80103fa0 <kill+0x60>
    if(p->pid == pid){
80103f6a:	39 58 10             	cmp    %ebx,0x10(%eax)
80103f6d:	75 f1                	jne    80103f60 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f6f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80103f73:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f7a:	74 14                	je     80103f90 <kill+0x50>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103f7c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103f83:	e8 c8 03 00 00       	call   80104350 <release>
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
80103f88:	83 c4 14             	add    $0x14,%esp
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
80103f8b:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103f8d:	5b                   	pop    %ebx
80103f8e:	5d                   	pop    %ebp
80103f8f:	c3                   	ret    
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80103f90:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103f97:	eb e3                	jmp    80103f7c <kill+0x3c>
80103f99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80103fa0:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103fa7:	e8 a4 03 00 00       	call   80104350 <release>
  return -1;
}
80103fac:	83 c4 14             	add    $0x14,%esp
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
80103faf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103fb4:	5b                   	pop    %ebx
80103fb5:	5d                   	pop    %ebp
80103fb6:	c3                   	ret    
80103fb7:	89 f6                	mov    %esi,%esi
80103fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fc0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103fc0:	55                   	push   %ebp
80103fc1:	89 e5                	mov    %esp,%ebp
80103fc3:	57                   	push   %edi
80103fc4:	56                   	push   %esi
80103fc5:	53                   	push   %ebx
80103fc6:	bb 40 2e 11 80       	mov    $0x80112e40,%ebx
80103fcb:	83 ec 4c             	sub    $0x4c,%esp
80103fce:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103fd1:	eb 20                	jmp    80103ff3 <procdump+0x33>
80103fd3:	90                   	nop
80103fd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80103fd8:	c7 04 24 e6 72 10 80 	movl   $0x801072e6,(%esp)
80103fdf:	e8 6c c6 ff ff       	call   80100650 <cprintf>
80103fe4:	83 eb 80             	sub    $0xffffff80,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fe7:	81 fb 40 4e 11 80    	cmp    $0x80114e40,%ebx
80103fed:	0f 84 8d 00 00 00    	je     80104080 <procdump+0xc0>
    if(p->state == UNUSED)
80103ff3:	8b 43 a0             	mov    -0x60(%ebx),%eax
80103ff6:	85 c0                	test   %eax,%eax
80103ff8:	74 ea                	je     80103fe4 <procdump+0x24>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103ffa:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80103ffd:	ba a8 73 10 80       	mov    $0x801073a8,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104002:	77 11                	ja     80104015 <procdump+0x55>
80104004:	8b 14 85 00 74 10 80 	mov    -0x7fef8c00(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
8010400b:	b8 a8 73 10 80       	mov    $0x801073a8,%eax
80104010:	85 d2                	test   %edx,%edx
80104012:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104015:	8b 43 a4             	mov    -0x5c(%ebx),%eax
80104018:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
8010401c:	89 54 24 08          	mov    %edx,0x8(%esp)
80104020:	c7 04 24 ac 73 10 80 	movl   $0x801073ac,(%esp)
80104027:	89 44 24 04          	mov    %eax,0x4(%esp)
8010402b:	e8 20 c6 ff ff       	call   80100650 <cprintf>
    if(p->state == SLEEPING){
80104030:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80104034:	75 a2                	jne    80103fd8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104036:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104039:	89 44 24 04          	mov    %eax,0x4(%esp)
8010403d:	8b 43 b0             	mov    -0x50(%ebx),%eax
80104040:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104043:	8b 40 0c             	mov    0xc(%eax),%eax
80104046:	83 c0 08             	add    $0x8,%eax
80104049:	89 04 24             	mov    %eax,(%esp)
8010404c:	e8 6f 01 00 00       	call   801041c0 <getcallerpcs>
80104051:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104058:	8b 17                	mov    (%edi),%edx
8010405a:	85 d2                	test   %edx,%edx
8010405c:	0f 84 76 ff ff ff    	je     80103fd8 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104062:	89 54 24 04          	mov    %edx,0x4(%esp)
80104066:	83 c7 04             	add    $0x4,%edi
80104069:	c7 04 24 09 6e 10 80 	movl   $0x80106e09,(%esp)
80104070:	e8 db c5 ff ff       	call   80100650 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104075:	39 f7                	cmp    %esi,%edi
80104077:	75 df                	jne    80104058 <procdump+0x98>
80104079:	e9 5a ff ff ff       	jmp    80103fd8 <procdump+0x18>
8010407e:	66 90                	xchg   %ax,%ax
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104080:	83 c4 4c             	add    $0x4c,%esp
80104083:	5b                   	pop    %ebx
80104084:	5e                   	pop    %esi
80104085:	5f                   	pop    %edi
80104086:	5d                   	pop    %ebp
80104087:	c3                   	ret    
80104088:	66 90                	xchg   %ax,%ax
8010408a:	66 90                	xchg   %ax,%ax
8010408c:	66 90                	xchg   %ax,%ax
8010408e:	66 90                	xchg   %ax,%ax

80104090 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	53                   	push   %ebx
80104094:	83 ec 14             	sub    $0x14,%esp
80104097:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010409a:	c7 44 24 04 18 74 10 	movl   $0x80107418,0x4(%esp)
801040a1:	80 
801040a2:	8d 43 04             	lea    0x4(%ebx),%eax
801040a5:	89 04 24             	mov    %eax,(%esp)
801040a8:	e8 f3 00 00 00       	call   801041a0 <initlock>
  lk->name = name;
801040ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801040b0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801040b6:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
801040bd:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
801040c0:	83 c4 14             	add    $0x14,%esp
801040c3:	5b                   	pop    %ebx
801040c4:	5d                   	pop    %ebp
801040c5:	c3                   	ret    
801040c6:	8d 76 00             	lea    0x0(%esi),%esi
801040c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040d0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801040d0:	55                   	push   %ebp
801040d1:	89 e5                	mov    %esp,%ebp
801040d3:	56                   	push   %esi
801040d4:	53                   	push   %ebx
801040d5:	83 ec 10             	sub    $0x10,%esp
801040d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801040db:	8d 73 04             	lea    0x4(%ebx),%esi
801040de:	89 34 24             	mov    %esi,(%esp)
801040e1:	e8 3a 01 00 00       	call   80104220 <acquire>
  while (lk->locked) {
801040e6:	8b 13                	mov    (%ebx),%edx
801040e8:	85 d2                	test   %edx,%edx
801040ea:	74 16                	je     80104102 <acquiresleep+0x32>
801040ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sleep(lk, &lk->lk);
801040f0:	89 74 24 04          	mov    %esi,0x4(%esp)
801040f4:	89 1c 24             	mov    %ebx,(%esp)
801040f7:	e8 44 fc ff ff       	call   80103d40 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
801040fc:	8b 03                	mov    (%ebx),%eax
801040fe:	85 c0                	test   %eax,%eax
80104100:	75 ee                	jne    801040f0 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104102:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = proc->pid;
80104108:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010410e:	8b 40 10             	mov    0x10(%eax),%eax
80104111:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104114:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104117:	83 c4 10             	add    $0x10,%esp
8010411a:	5b                   	pop    %ebx
8010411b:	5e                   	pop    %esi
8010411c:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = proc->pid;
  release(&lk->lk);
8010411d:	e9 2e 02 00 00       	jmp    80104350 <release>
80104122:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104130 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104130:	55                   	push   %ebp
80104131:	89 e5                	mov    %esp,%ebp
80104133:	56                   	push   %esi
80104134:	53                   	push   %ebx
80104135:	83 ec 10             	sub    $0x10,%esp
80104138:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
8010413b:	8d 73 04             	lea    0x4(%ebx),%esi
8010413e:	89 34 24             	mov    %esi,(%esp)
80104141:	e8 da 00 00 00       	call   80104220 <acquire>
  lk->locked = 0;
80104146:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010414c:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104153:	89 1c 24             	mov    %ebx,(%esp)
80104156:	e8 85 fd ff ff       	call   80103ee0 <wakeup>
  release(&lk->lk);
8010415b:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010415e:	83 c4 10             	add    $0x10,%esp
80104161:	5b                   	pop    %ebx
80104162:	5e                   	pop    %esi
80104163:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104164:	e9 e7 01 00 00       	jmp    80104350 <release>
80104169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104170 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104170:	55                   	push   %ebp
80104171:	89 e5                	mov    %esp,%ebp
80104173:	56                   	push   %esi
80104174:	53                   	push   %ebx
80104175:	83 ec 10             	sub    $0x10,%esp
80104178:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010417b:	8d 73 04             	lea    0x4(%ebx),%esi
8010417e:	89 34 24             	mov    %esi,(%esp)
80104181:	e8 9a 00 00 00       	call   80104220 <acquire>
  r = lk->locked;
80104186:	8b 1b                	mov    (%ebx),%ebx
  release(&lk->lk);
80104188:	89 34 24             	mov    %esi,(%esp)
8010418b:	e8 c0 01 00 00       	call   80104350 <release>
  return r;
}
80104190:	83 c4 10             	add    $0x10,%esp
80104193:	89 d8                	mov    %ebx,%eax
80104195:	5b                   	pop    %ebx
80104196:	5e                   	pop    %esi
80104197:	5d                   	pop    %ebp
80104198:	c3                   	ret    
80104199:	66 90                	xchg   %ax,%ax
8010419b:	66 90                	xchg   %ax,%ax
8010419d:	66 90                	xchg   %ax,%ax
8010419f:	90                   	nop

801041a0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801041a0:	55                   	push   %ebp
801041a1:	89 e5                	mov    %esp,%ebp
801041a3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801041a6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801041a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
801041af:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
801041b2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801041b9:	5d                   	pop    %ebp
801041ba:	c3                   	ret    
801041bb:	90                   	nop
801041bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801041c0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801041c0:	55                   	push   %ebp
801041c1:	89 e5                	mov    %esp,%ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801041c3:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801041c6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801041c9:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801041ca:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
801041cd:	31 c0                	xor    %eax,%eax
801041cf:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801041d0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801041d6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801041dc:	77 1a                	ja     801041f8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801041de:	8b 5a 04             	mov    0x4(%edx),%ebx
801041e1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801041e4:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801041e7:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801041e9:	83 f8 0a             	cmp    $0xa,%eax
801041ec:	75 e2                	jne    801041d0 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801041ee:	5b                   	pop    %ebx
801041ef:	5d                   	pop    %ebp
801041f0:	c3                   	ret    
801041f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801041f8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801041ff:	83 c0 01             	add    $0x1,%eax
80104202:	83 f8 0a             	cmp    $0xa,%eax
80104205:	74 e7                	je     801041ee <getcallerpcs+0x2e>
    pcs[i] = 0;
80104207:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010420e:	83 c0 01             	add    $0x1,%eax
80104211:	83 f8 0a             	cmp    $0xa,%eax
80104214:	75 e2                	jne    801041f8 <getcallerpcs+0x38>
80104216:	eb d6                	jmp    801041ee <getcallerpcs+0x2e>
80104218:	90                   	nop
80104219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104220 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104220:	55                   	push   %ebp
80104221:	89 e5                	mov    %esp,%ebp
80104223:	83 ec 18             	sub    $0x18,%esp
80104226:	9c                   	pushf  
80104227:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104228:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
80104229:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010422f:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
80104235:	85 d2                	test   %edx,%edx
80104237:	75 0c                	jne    80104245 <acquire+0x25>
    cpu->intena = eflags & FL_IF;
80104239:	81 e1 00 02 00 00    	and    $0x200,%ecx
8010423f:	89 88 b0 00 00 00    	mov    %ecx,0xb0(%eax)
  cpu->ncli += 1;
80104245:	83 c2 01             	add    $0x1,%edx
80104248:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
8010424e:	8b 55 08             	mov    0x8(%ebp),%edx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104251:	8b 0a                	mov    (%edx),%ecx
80104253:	85 c9                	test   %ecx,%ecx
80104255:	74 05                	je     8010425c <acquire+0x3c>
80104257:	3b 42 08             	cmp    0x8(%edx),%eax
8010425a:	74 3e                	je     8010429a <acquire+0x7a>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
8010425c:	b9 01 00 00 00       	mov    $0x1,%ecx
80104261:	eb 08                	jmp    8010426b <acquire+0x4b>
80104263:	90                   	nop
80104264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104268:	8b 55 08             	mov    0x8(%ebp),%edx
8010426b:	89 c8                	mov    %ecx,%eax
8010426d:	f0 87 02             	lock xchg %eax,(%edx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
80104270:	85 c0                	test   %eax,%eax
80104272:	75 f4                	jne    80104268 <acquire+0x48>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
80104274:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104279:	8b 45 08             	mov    0x8(%ebp),%eax
8010427c:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  getcallerpcs(&lk, lk->pcs);
80104283:	83 c0 0c             	add    $0xc,%eax
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104286:	89 50 fc             	mov    %edx,-0x4(%eax)
  getcallerpcs(&lk, lk->pcs);
80104289:	89 44 24 04          	mov    %eax,0x4(%esp)
8010428d:	8d 45 08             	lea    0x8(%ebp),%eax
80104290:	89 04 24             	mov    %eax,(%esp)
80104293:	e8 28 ff ff ff       	call   801041c0 <getcallerpcs>
}
80104298:	c9                   	leave  
80104299:	c3                   	ret    
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
8010429a:	c7 04 24 23 74 10 80 	movl   $0x80107423,(%esp)
801042a1:	e8 ba c0 ff ff       	call   80100360 <panic>
801042a6:	8d 76 00             	lea    0x0(%esi),%esi
801042a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042b0 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
801042b0:	55                   	push   %ebp
  return lock->locked && lock->cpu == cpu;
801042b1:	31 c0                	xor    %eax,%eax
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
801042b3:	89 e5                	mov    %esp,%ebp
801042b5:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
801042b8:	8b 0a                	mov    (%edx),%ecx
801042ba:	85 c9                	test   %ecx,%ecx
801042bc:	74 0f                	je     801042cd <holding+0x1d>
801042be:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801042c4:	39 42 08             	cmp    %eax,0x8(%edx)
801042c7:	0f 94 c0             	sete   %al
801042ca:	0f b6 c0             	movzbl %al,%eax
}
801042cd:	5d                   	pop    %ebp
801042ce:	c3                   	ret    
801042cf:	90                   	nop

801042d0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
801042d0:	55                   	push   %ebp
801042d1:	89 e5                	mov    %esp,%ebp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801042d3:	9c                   	pushf  
801042d4:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
801042d5:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801042d6:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801042dc:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
801042e2:	85 d2                	test   %edx,%edx
801042e4:	75 0c                	jne    801042f2 <pushcli+0x22>
    cpu->intena = eflags & FL_IF;
801042e6:	81 e1 00 02 00 00    	and    $0x200,%ecx
801042ec:	89 88 b0 00 00 00    	mov    %ecx,0xb0(%eax)
  cpu->ncli += 1;
801042f2:	83 c2 01             	add    $0x1,%edx
801042f5:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
}
801042fb:	5d                   	pop    %ebp
801042fc:	c3                   	ret    
801042fd:	8d 76 00             	lea    0x0(%esi),%esi

80104300 <popcli>:

void
popcli(void)
{
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	83 ec 18             	sub    $0x18,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104306:	9c                   	pushf  
80104307:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104308:	f6 c4 02             	test   $0x2,%ah
8010430b:	75 34                	jne    80104341 <popcli+0x41>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
8010430d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104313:	8b 88 ac 00 00 00    	mov    0xac(%eax),%ecx
80104319:	8d 51 ff             	lea    -0x1(%ecx),%edx
8010431c:	85 d2                	test   %edx,%edx
8010431e:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
80104324:	78 0f                	js     80104335 <popcli+0x35>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
80104326:	75 0b                	jne    80104333 <popcli+0x33>
80104328:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
8010432e:	85 c0                	test   %eax,%eax
80104330:	74 01                	je     80104333 <popcli+0x33>
}

static inline void
sti(void)
{
  asm volatile("sti");
80104332:	fb                   	sti    
    sti();
}
80104333:	c9                   	leave  
80104334:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
    panic("popcli");
80104335:	c7 04 24 42 74 10 80 	movl   $0x80107442,(%esp)
8010433c:	e8 1f c0 ff ff       	call   80100360 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
80104341:	c7 04 24 2b 74 10 80 	movl   $0x8010742b,(%esp)
80104348:	e8 13 c0 ff ff       	call   80100360 <panic>
8010434d:	8d 76 00             	lea    0x0(%esi),%esi

80104350 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
80104350:	55                   	push   %ebp
80104351:	89 e5                	mov    %esp,%ebp
80104353:	83 ec 18             	sub    $0x18,%esp
80104356:	8b 45 08             	mov    0x8(%ebp),%eax

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104359:	8b 10                	mov    (%eax),%edx
8010435b:	85 d2                	test   %edx,%edx
8010435d:	74 0c                	je     8010436b <release+0x1b>
8010435f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104366:	39 50 08             	cmp    %edx,0x8(%eax)
80104369:	74 0d                	je     80104378 <release+0x28>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
8010436b:	c7 04 24 49 74 10 80 	movl   $0x80107449,(%esp)
80104372:	e8 e9 bf ff ff       	call   80100360 <panic>
80104377:	90                   	nop

  lk->pcs[0] = 0;
80104378:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
8010437f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
80104386:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010438b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  popcli();
}
80104391:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
80104392:	e9 69 ff ff ff       	jmp    80104300 <popcli>
80104397:	66 90                	xchg   %ax,%ax
80104399:	66 90                	xchg   %ax,%ax
8010439b:	66 90                	xchg   %ax,%ax
8010439d:	66 90                	xchg   %ax,%ax
8010439f:	90                   	nop

801043a0 <memset>:
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	57                   	push   %edi
801043a4:	53                   	push   %ebx
801043a5:	8b 55 08             	mov    0x8(%ebp),%edx
801043a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
801043ab:	f6 c2 03             	test   $0x3,%dl
801043ae:	75 05                	jne    801043b5 <memset+0x15>
801043b0:	f6 c1 03             	test   $0x3,%cl
801043b3:	74 13                	je     801043c8 <memset+0x28>
801043b5:	89 d7                	mov    %edx,%edi
801043b7:	8b 45 0c             	mov    0xc(%ebp),%eax
801043ba:	fc                   	cld    
801043bb:	f3 aa                	rep stos %al,%es:(%edi)
801043bd:	5b                   	pop    %ebx
801043be:	89 d0                	mov    %edx,%eax
801043c0:	5f                   	pop    %edi
801043c1:	5d                   	pop    %ebp
801043c2:	c3                   	ret    
801043c3:	90                   	nop
801043c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043c8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801043cc:	c1 e9 02             	shr    $0x2,%ecx
801043cf:	89 fb                	mov    %edi,%ebx
801043d1:	89 f8                	mov    %edi,%eax
801043d3:	c1 e3 18             	shl    $0x18,%ebx
801043d6:	c1 e0 10             	shl    $0x10,%eax
801043d9:	09 d8                	or     %ebx,%eax
801043db:	09 f8                	or     %edi,%eax
801043dd:	c1 e7 08             	shl    $0x8,%edi
801043e0:	09 f8                	or     %edi,%eax
801043e2:	89 d7                	mov    %edx,%edi
801043e4:	fc                   	cld    
801043e5:	f3 ab                	rep stos %eax,%es:(%edi)
801043e7:	5b                   	pop    %ebx
801043e8:	89 d0                	mov    %edx,%eax
801043ea:	5f                   	pop    %edi
801043eb:	5d                   	pop    %ebp
801043ec:	c3                   	ret    
801043ed:	8d 76 00             	lea    0x0(%esi),%esi

801043f0 <memcmp>:
801043f0:	55                   	push   %ebp
801043f1:	89 e5                	mov    %esp,%ebp
801043f3:	57                   	push   %edi
801043f4:	56                   	push   %esi
801043f5:	8b 45 10             	mov    0x10(%ebp),%eax
801043f8:	53                   	push   %ebx
801043f9:	8b 75 0c             	mov    0xc(%ebp),%esi
801043fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043ff:	85 c0                	test   %eax,%eax
80104401:	74 29                	je     8010442c <memcmp+0x3c>
80104403:	0f b6 13             	movzbl (%ebx),%edx
80104406:	0f b6 0e             	movzbl (%esi),%ecx
80104409:	38 d1                	cmp    %dl,%cl
8010440b:	75 2b                	jne    80104438 <memcmp+0x48>
8010440d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104410:	31 c0                	xor    %eax,%eax
80104412:	eb 14                	jmp    80104428 <memcmp+0x38>
80104414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104418:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010441d:	83 c0 01             	add    $0x1,%eax
80104420:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104424:	38 ca                	cmp    %cl,%dl
80104426:	75 10                	jne    80104438 <memcmp+0x48>
80104428:	39 f8                	cmp    %edi,%eax
8010442a:	75 ec                	jne    80104418 <memcmp+0x28>
8010442c:	5b                   	pop    %ebx
8010442d:	31 c0                	xor    %eax,%eax
8010442f:	5e                   	pop    %esi
80104430:	5f                   	pop    %edi
80104431:	5d                   	pop    %ebp
80104432:	c3                   	ret    
80104433:	90                   	nop
80104434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104438:	0f b6 c2             	movzbl %dl,%eax
8010443b:	5b                   	pop    %ebx
8010443c:	29 c8                	sub    %ecx,%eax
8010443e:	5e                   	pop    %esi
8010443f:	5f                   	pop    %edi
80104440:	5d                   	pop    %ebp
80104441:	c3                   	ret    
80104442:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104450 <memmove>:
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	56                   	push   %esi
80104454:	53                   	push   %ebx
80104455:	8b 45 08             	mov    0x8(%ebp),%eax
80104458:	8b 75 0c             	mov    0xc(%ebp),%esi
8010445b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010445e:	39 c6                	cmp    %eax,%esi
80104460:	73 2e                	jae    80104490 <memmove+0x40>
80104462:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104465:	39 c8                	cmp    %ecx,%eax
80104467:	73 27                	jae    80104490 <memmove+0x40>
80104469:	85 db                	test   %ebx,%ebx
8010446b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010446e:	74 17                	je     80104487 <memmove+0x37>
80104470:	29 d9                	sub    %ebx,%ecx
80104472:	89 cb                	mov    %ecx,%ebx
80104474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104478:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010447c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010447f:	83 ea 01             	sub    $0x1,%edx
80104482:	83 fa ff             	cmp    $0xffffffff,%edx
80104485:	75 f1                	jne    80104478 <memmove+0x28>
80104487:	5b                   	pop    %ebx
80104488:	5e                   	pop    %esi
80104489:	5d                   	pop    %ebp
8010448a:	c3                   	ret    
8010448b:	90                   	nop
8010448c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104490:	31 d2                	xor    %edx,%edx
80104492:	85 db                	test   %ebx,%ebx
80104494:	74 f1                	je     80104487 <memmove+0x37>
80104496:	8d 76 00             	lea    0x0(%esi),%esi
80104499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801044a0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
801044a4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801044a7:	83 c2 01             	add    $0x1,%edx
801044aa:	39 d3                	cmp    %edx,%ebx
801044ac:	75 f2                	jne    801044a0 <memmove+0x50>
801044ae:	5b                   	pop    %ebx
801044af:	5e                   	pop    %esi
801044b0:	5d                   	pop    %ebp
801044b1:	c3                   	ret    
801044b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044c0 <memcpy>:
801044c0:	55                   	push   %ebp
801044c1:	89 e5                	mov    %esp,%ebp
801044c3:	5d                   	pop    %ebp
801044c4:	eb 8a                	jmp    80104450 <memmove>
801044c6:	8d 76 00             	lea    0x0(%esi),%esi
801044c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044d0 <strncmp>:
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	57                   	push   %edi
801044d4:	56                   	push   %esi
801044d5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801044d8:	53                   	push   %ebx
801044d9:	8b 7d 08             	mov    0x8(%ebp),%edi
801044dc:	8b 75 0c             	mov    0xc(%ebp),%esi
801044df:	85 c9                	test   %ecx,%ecx
801044e1:	74 37                	je     8010451a <strncmp+0x4a>
801044e3:	0f b6 17             	movzbl (%edi),%edx
801044e6:	0f b6 1e             	movzbl (%esi),%ebx
801044e9:	84 d2                	test   %dl,%dl
801044eb:	74 3f                	je     8010452c <strncmp+0x5c>
801044ed:	38 d3                	cmp    %dl,%bl
801044ef:	75 3b                	jne    8010452c <strncmp+0x5c>
801044f1:	8d 47 01             	lea    0x1(%edi),%eax
801044f4:	01 cf                	add    %ecx,%edi
801044f6:	eb 1b                	jmp    80104513 <strncmp+0x43>
801044f8:	90                   	nop
801044f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104500:	0f b6 10             	movzbl (%eax),%edx
80104503:	84 d2                	test   %dl,%dl
80104505:	74 21                	je     80104528 <strncmp+0x58>
80104507:	0f b6 19             	movzbl (%ecx),%ebx
8010450a:	83 c0 01             	add    $0x1,%eax
8010450d:	89 ce                	mov    %ecx,%esi
8010450f:	38 da                	cmp    %bl,%dl
80104511:	75 19                	jne    8010452c <strncmp+0x5c>
80104513:	39 c7                	cmp    %eax,%edi
80104515:	8d 4e 01             	lea    0x1(%esi),%ecx
80104518:	75 e6                	jne    80104500 <strncmp+0x30>
8010451a:	5b                   	pop    %ebx
8010451b:	31 c0                	xor    %eax,%eax
8010451d:	5e                   	pop    %esi
8010451e:	5f                   	pop    %edi
8010451f:	5d                   	pop    %ebp
80104520:	c3                   	ret    
80104521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104528:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
8010452c:	0f b6 c2             	movzbl %dl,%eax
8010452f:	29 d8                	sub    %ebx,%eax
80104531:	5b                   	pop    %ebx
80104532:	5e                   	pop    %esi
80104533:	5f                   	pop    %edi
80104534:	5d                   	pop    %ebp
80104535:	c3                   	ret    
80104536:	8d 76 00             	lea    0x0(%esi),%esi
80104539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104540 <strncpy>:
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	56                   	push   %esi
80104544:	53                   	push   %ebx
80104545:	8b 45 08             	mov    0x8(%ebp),%eax
80104548:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010454b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010454e:	89 c2                	mov    %eax,%edx
80104550:	eb 19                	jmp    8010456b <strncpy+0x2b>
80104552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104558:	83 c3 01             	add    $0x1,%ebx
8010455b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010455f:	83 c2 01             	add    $0x1,%edx
80104562:	84 c9                	test   %cl,%cl
80104564:	88 4a ff             	mov    %cl,-0x1(%edx)
80104567:	74 09                	je     80104572 <strncpy+0x32>
80104569:	89 f1                	mov    %esi,%ecx
8010456b:	85 c9                	test   %ecx,%ecx
8010456d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104570:	7f e6                	jg     80104558 <strncpy+0x18>
80104572:	31 c9                	xor    %ecx,%ecx
80104574:	85 f6                	test   %esi,%esi
80104576:	7e 17                	jle    8010458f <strncpy+0x4f>
80104578:	90                   	nop
80104579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104580:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104584:	89 f3                	mov    %esi,%ebx
80104586:	83 c1 01             	add    $0x1,%ecx
80104589:	29 cb                	sub    %ecx,%ebx
8010458b:	85 db                	test   %ebx,%ebx
8010458d:	7f f1                	jg     80104580 <strncpy+0x40>
8010458f:	5b                   	pop    %ebx
80104590:	5e                   	pop    %esi
80104591:	5d                   	pop    %ebp
80104592:	c3                   	ret    
80104593:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045a0 <safestrcpy>:
801045a0:	55                   	push   %ebp
801045a1:	89 e5                	mov    %esp,%ebp
801045a3:	56                   	push   %esi
801045a4:	53                   	push   %ebx
801045a5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801045a8:	8b 45 08             	mov    0x8(%ebp),%eax
801045ab:	8b 55 0c             	mov    0xc(%ebp),%edx
801045ae:	85 c9                	test   %ecx,%ecx
801045b0:	7e 26                	jle    801045d8 <safestrcpy+0x38>
801045b2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801045b6:	89 c1                	mov    %eax,%ecx
801045b8:	eb 17                	jmp    801045d1 <safestrcpy+0x31>
801045ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045c0:	83 c2 01             	add    $0x1,%edx
801045c3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801045c7:	83 c1 01             	add    $0x1,%ecx
801045ca:	84 db                	test   %bl,%bl
801045cc:	88 59 ff             	mov    %bl,-0x1(%ecx)
801045cf:	74 04                	je     801045d5 <safestrcpy+0x35>
801045d1:	39 f2                	cmp    %esi,%edx
801045d3:	75 eb                	jne    801045c0 <safestrcpy+0x20>
801045d5:	c6 01 00             	movb   $0x0,(%ecx)
801045d8:	5b                   	pop    %ebx
801045d9:	5e                   	pop    %esi
801045da:	5d                   	pop    %ebp
801045db:	c3                   	ret    
801045dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801045e0 <strlen>:
801045e0:	55                   	push   %ebp
801045e1:	31 c0                	xor    %eax,%eax
801045e3:	89 e5                	mov    %esp,%ebp
801045e5:	8b 55 08             	mov    0x8(%ebp),%edx
801045e8:	80 3a 00             	cmpb   $0x0,(%edx)
801045eb:	74 0c                	je     801045f9 <strlen+0x19>
801045ed:	8d 76 00             	lea    0x0(%esi),%esi
801045f0:	83 c0 01             	add    $0x1,%eax
801045f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801045f7:	75 f7                	jne    801045f0 <strlen+0x10>
801045f9:	5d                   	pop    %ebp
801045fa:	c3                   	ret    

801045fb <swtch>:
801045fb:	8b 44 24 04          	mov    0x4(%esp),%eax
801045ff:	8b 54 24 08          	mov    0x8(%esp),%edx
80104603:	55                   	push   %ebp
80104604:	53                   	push   %ebx
80104605:	56                   	push   %esi
80104606:	57                   	push   %edi
80104607:	89 20                	mov    %esp,(%eax)
80104609:	89 d4                	mov    %edx,%esp
8010460b:	5f                   	pop    %edi
8010460c:	5e                   	pop    %esi
8010460d:	5b                   	pop    %ebx
8010460e:	5d                   	pop    %ebp
8010460f:	c3                   	ret    

80104610 <fetchint>:

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104610:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104617:	55                   	push   %ebp
80104618:	89 e5                	mov    %esp,%ebp
8010461a:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
8010461d:	8b 12                	mov    (%edx),%edx
8010461f:	39 c2                	cmp    %eax,%edx
80104621:	76 15                	jbe    80104638 <fetchint+0x28>
80104623:	8d 48 04             	lea    0x4(%eax),%ecx
80104626:	39 ca                	cmp    %ecx,%edx
80104628:	72 0e                	jb     80104638 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
8010462a:	8b 10                	mov    (%eax),%edx
8010462c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010462f:	89 10                	mov    %edx,(%eax)
  return 0;
80104631:	31 c0                	xor    %eax,%eax
}
80104633:	5d                   	pop    %ebp
80104634:	c3                   	ret    
80104635:	8d 76 00             	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104638:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
8010463d:	5d                   	pop    %ebp
8010463e:	c3                   	ret    
8010463f:	90                   	nop

80104640 <fetchstr>:
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
80104640:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104646:	55                   	push   %ebp
80104647:	89 e5                	mov    %esp,%ebp
80104649:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *s, *ep;

  if(addr >= proc->sz)
8010464c:	39 08                	cmp    %ecx,(%eax)
8010464e:	76 2c                	jbe    8010467c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104650:	8b 55 0c             	mov    0xc(%ebp),%edx
80104653:	89 c8                	mov    %ecx,%eax
80104655:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104657:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010465e:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104660:	39 d1                	cmp    %edx,%ecx
80104662:	73 18                	jae    8010467c <fetchstr+0x3c>
    if(*s == 0)
80104664:	80 39 00             	cmpb   $0x0,(%ecx)
80104667:	75 0c                	jne    80104675 <fetchstr+0x35>
80104669:	eb 1d                	jmp    80104688 <fetchstr+0x48>
8010466b:	90                   	nop
8010466c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104670:	80 38 00             	cmpb   $0x0,(%eax)
80104673:	74 13                	je     80104688 <fetchstr+0x48>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104675:	83 c0 01             	add    $0x1,%eax
80104678:	39 c2                	cmp    %eax,%edx
8010467a:	77 f4                	ja     80104670 <fetchstr+0x30>
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
    return -1;
8010467c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}
80104681:	5d                   	pop    %ebp
80104682:	c3                   	ret    
80104683:	90                   	nop
80104684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
80104688:	29 c8                	sub    %ecx,%eax
  return -1;
}
8010468a:	5d                   	pop    %ebp
8010468b:	c3                   	ret    
8010468c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104690 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104690:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104697:	55                   	push   %ebp
80104698:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
8010469a:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010469d:	8b 42 18             	mov    0x18(%edx),%eax

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801046a0:	8b 12                	mov    (%edx),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801046a2:	8b 40 44             	mov    0x44(%eax),%eax
801046a5:	8d 04 88             	lea    (%eax,%ecx,4),%eax
801046a8:	8d 48 04             	lea    0x4(%eax),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801046ab:	39 d1                	cmp    %edx,%ecx
801046ad:	73 19                	jae    801046c8 <argint+0x38>
801046af:	8d 48 08             	lea    0x8(%eax),%ecx
801046b2:	39 ca                	cmp    %ecx,%edx
801046b4:	72 12                	jb     801046c8 <argint+0x38>
    return -1;
  *ip = *(int*)(addr);
801046b6:	8b 50 04             	mov    0x4(%eax),%edx
801046b9:	8b 45 0c             	mov    0xc(%ebp),%eax
801046bc:	89 10                	mov    %edx,(%eax)
  return 0;
801046be:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
801046c0:	5d                   	pop    %ebp
801046c1:	c3                   	ret    
801046c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
801046c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
801046cd:	5d                   	pop    %ebp
801046ce:	c3                   	ret    
801046cf:	90                   	nop

801046d0 <argptr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801046d0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
801046d6:	55                   	push   %ebp
801046d7:	89 e5                	mov    %esp,%ebp
801046d9:	53                   	push   %ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801046da:	8b 4d 08             	mov    0x8(%ebp),%ecx
801046dd:	8b 50 18             	mov    0x18(%eax),%edx
801046e0:	8b 52 44             	mov    0x44(%edx),%edx
801046e3:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801046e6:	8b 10                	mov    (%eax),%edx
argptr(int n, char **pp, int size)
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
801046e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801046ed:	8d 59 04             	lea    0x4(%ecx),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801046f0:	39 d3                	cmp    %edx,%ebx
801046f2:	73 25                	jae    80104719 <argptr+0x49>
801046f4:	8d 59 08             	lea    0x8(%ecx),%ebx
801046f7:	39 da                	cmp    %ebx,%edx
801046f9:	72 1e                	jb     80104719 <argptr+0x49>
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
801046fb:	8b 5d 10             	mov    0x10(%ebp),%ebx
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
801046fe:	8b 49 04             	mov    0x4(%ecx),%ecx
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104701:	85 db                	test   %ebx,%ebx
80104703:	78 14                	js     80104719 <argptr+0x49>
80104705:	39 d1                	cmp    %edx,%ecx
80104707:	73 10                	jae    80104719 <argptr+0x49>
80104709:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010470c:	01 cb                	add    %ecx,%ebx
8010470e:	39 d3                	cmp    %edx,%ebx
80104710:	77 07                	ja     80104719 <argptr+0x49>
    return -1;
  *pp = (char*)i;
80104712:	8b 45 0c             	mov    0xc(%ebp),%eax
80104715:	89 08                	mov    %ecx,(%eax)
  return 0;
80104717:	31 c0                	xor    %eax,%eax
}
80104719:	5b                   	pop    %ebx
8010471a:	5d                   	pop    %ebp
8010471b:	c3                   	ret    
8010471c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104720 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104720:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104726:	55                   	push   %ebp
80104727:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104729:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010472c:	8b 50 18             	mov    0x18(%eax),%edx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010472f:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104731:	8b 52 44             	mov    0x44(%edx),%edx
80104734:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104737:	8d 4a 04             	lea    0x4(%edx),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010473a:	39 c1                	cmp    %eax,%ecx
8010473c:	73 07                	jae    80104745 <argstr+0x25>
8010473e:	8d 4a 08             	lea    0x8(%edx),%ecx
80104741:	39 c8                	cmp    %ecx,%eax
80104743:	73 0b                	jae    80104750 <argstr+0x30>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104745:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
8010474a:	5d                   	pop    %ebp
8010474b:	c3                   	ret    
8010474c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104750:	8b 4a 04             	mov    0x4(%edx),%ecx
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
80104753:	39 c1                	cmp    %eax,%ecx
80104755:	73 ee                	jae    80104745 <argstr+0x25>
    return -1;
  *pp = (char*)addr;
80104757:	8b 55 0c             	mov    0xc(%ebp),%edx
8010475a:	89 c8                	mov    %ecx,%eax
8010475c:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
8010475e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104765:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104767:	39 d1                	cmp    %edx,%ecx
80104769:	73 da                	jae    80104745 <argstr+0x25>
    if(*s == 0)
8010476b:	80 39 00             	cmpb   $0x0,(%ecx)
8010476e:	75 12                	jne    80104782 <argstr+0x62>
80104770:	eb 1e                	jmp    80104790 <argstr+0x70>
80104772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104778:	80 38 00             	cmpb   $0x0,(%eax)
8010477b:	90                   	nop
8010477c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104780:	74 0e                	je     80104790 <argstr+0x70>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104782:	83 c0 01             	add    $0x1,%eax
80104785:	39 c2                	cmp    %eax,%edx
80104787:	77 ef                	ja     80104778 <argstr+0x58>
80104789:	eb ba                	jmp    80104745 <argstr+0x25>
8010478b:	90                   	nop
8010478c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(*s == 0)
      return s - *pp;
80104790:	29 c8                	sub    %ecx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104792:	5d                   	pop    %ebp
80104793:	c3                   	ret    
80104794:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010479a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801047a0 <syscall>:
[SYS_random] sys_random, // This is the change I have made for the xorshift
};

void
syscall(void)
{
801047a0:	55                   	push   %ebp
801047a1:	89 e5                	mov    %esp,%ebp
801047a3:	53                   	push   %ebx
801047a4:	83 ec 14             	sub    $0x14,%esp
  int num;

  num = proc->tf->eax;
801047a7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801047ae:	8b 5a 18             	mov    0x18(%edx),%ebx
801047b1:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
801047b4:	8d 48 ff             	lea    -0x1(%eax),%ecx
801047b7:	83 f9 15             	cmp    $0x15,%ecx
801047ba:	77 1c                	ja     801047d8 <syscall+0x38>
801047bc:	8b 0c 85 80 74 10 80 	mov    -0x7fef8b80(,%eax,4),%ecx
801047c3:	85 c9                	test   %ecx,%ecx
801047c5:	74 11                	je     801047d8 <syscall+0x38>
    proc->tf->eax = syscalls[num]();
801047c7:	ff d1                	call   *%ecx
801047c9:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
801047cc:	83 c4 14             	add    $0x14,%esp
801047cf:	5b                   	pop    %ebx
801047d0:	5d                   	pop    %ebp
801047d1:	c3                   	ret    
801047d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801047d8:	89 44 24 0c          	mov    %eax,0xc(%esp)
            proc->pid, proc->name, num);
801047dc:	8d 42 6c             	lea    0x6c(%edx),%eax
801047df:	89 44 24 08          	mov    %eax,0x8(%esp)

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801047e3:	8b 42 10             	mov    0x10(%edx),%eax
801047e6:	c7 04 24 51 74 10 80 	movl   $0x80107451,(%esp)
801047ed:	89 44 24 04          	mov    %eax,0x4(%esp)
801047f1:	e8 5a be ff ff       	call   80100650 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
801047f6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801047fc:	8b 40 18             	mov    0x18(%eax),%eax
801047ff:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104806:	83 c4 14             	add    $0x14,%esp
80104809:	5b                   	pop    %ebx
8010480a:	5d                   	pop    %ebp
8010480b:	c3                   	ret    
8010480c:	66 90                	xchg   %ax,%ax
8010480e:	66 90                	xchg   %ax,%ax

80104810 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104810:	55                   	push   %ebp
80104811:	89 e5                	mov    %esp,%ebp
80104813:	57                   	push   %edi
80104814:	56                   	push   %esi
80104815:	53                   	push   %ebx
80104816:	83 ec 4c             	sub    $0x4c,%esp
80104819:	89 4d c0             	mov    %ecx,-0x40(%ebp)
8010481c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
8010481f:	8d 5d da             	lea    -0x26(%ebp),%ebx
80104822:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104826:	89 04 24             	mov    %eax,(%esp)
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104829:	89 55 c4             	mov    %edx,-0x3c(%ebp)
8010482c:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
8010482f:	e8 cc d6 ff ff       	call   80101f00 <nameiparent>
80104834:	85 c0                	test   %eax,%eax
80104836:	89 c7                	mov    %eax,%edi
80104838:	0f 84 da 00 00 00    	je     80104918 <create+0x108>
    return 0;
  ilock(dp);
8010483e:	89 04 24             	mov    %eax,(%esp)
80104841:	e8 6a ce ff ff       	call   801016b0 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104846:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104849:	89 44 24 08          	mov    %eax,0x8(%esp)
8010484d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104851:	89 3c 24             	mov    %edi,(%esp)
80104854:	e8 47 d3 ff ff       	call   80101ba0 <dirlookup>
80104859:	85 c0                	test   %eax,%eax
8010485b:	89 c6                	mov    %eax,%esi
8010485d:	74 41                	je     801048a0 <create+0x90>
    iunlockput(dp);
8010485f:	89 3c 24             	mov    %edi,(%esp)
80104862:	e8 89 d0 ff ff       	call   801018f0 <iunlockput>
    ilock(ip);
80104867:	89 34 24             	mov    %esi,(%esp)
8010486a:	e8 41 ce ff ff       	call   801016b0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
8010486f:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104874:	75 12                	jne    80104888 <create+0x78>
80104876:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
8010487b:	89 f0                	mov    %esi,%eax
8010487d:	75 09                	jne    80104888 <create+0x78>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
8010487f:	83 c4 4c             	add    $0x4c,%esp
80104882:	5b                   	pop    %ebx
80104883:	5e                   	pop    %esi
80104884:	5f                   	pop    %edi
80104885:	5d                   	pop    %ebp
80104886:	c3                   	ret    
80104887:	90                   	nop
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104888:	89 34 24             	mov    %esi,(%esp)
8010488b:	e8 60 d0 ff ff       	call   801018f0 <iunlockput>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104890:	83 c4 4c             	add    $0x4c,%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104893:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104895:	5b                   	pop    %ebx
80104896:	5e                   	pop    %esi
80104897:	5f                   	pop    %edi
80104898:	5d                   	pop    %ebp
80104899:	c3                   	ret    
8010489a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
801048a0:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
801048a4:	89 44 24 04          	mov    %eax,0x4(%esp)
801048a8:	8b 07                	mov    (%edi),%eax
801048aa:	89 04 24             	mov    %eax,(%esp)
801048ad:	e8 6e cc ff ff       	call   80101520 <ialloc>
801048b2:	85 c0                	test   %eax,%eax
801048b4:	89 c6                	mov    %eax,%esi
801048b6:	0f 84 bf 00 00 00    	je     8010497b <create+0x16b>
    panic("create: ialloc");

  ilock(ip);
801048bc:	89 04 24             	mov    %eax,(%esp)
801048bf:	e8 ec cd ff ff       	call   801016b0 <ilock>
  ip->major = major;
801048c4:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
801048c8:	66 89 46 52          	mov    %ax,0x52(%esi)
  ip->minor = minor;
801048cc:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
801048d0:	66 89 46 54          	mov    %ax,0x54(%esi)
  ip->nlink = 1;
801048d4:	b8 01 00 00 00       	mov    $0x1,%eax
801048d9:	66 89 46 56          	mov    %ax,0x56(%esi)
  iupdate(ip);
801048dd:	89 34 24             	mov    %esi,(%esp)
801048e0:	e8 0b cd ff ff       	call   801015f0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
801048e5:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
801048ea:	74 34                	je     80104920 <create+0x110>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
801048ec:	8b 46 04             	mov    0x4(%esi),%eax
801048ef:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801048f3:	89 3c 24             	mov    %edi,(%esp)
801048f6:	89 44 24 08          	mov    %eax,0x8(%esp)
801048fa:	e8 01 d5 ff ff       	call   80101e00 <dirlink>
801048ff:	85 c0                	test   %eax,%eax
80104901:	78 6c                	js     8010496f <create+0x15f>
    panic("create: dirlink");

  iunlockput(dp);
80104903:	89 3c 24             	mov    %edi,(%esp)
80104906:	e8 e5 cf ff ff       	call   801018f0 <iunlockput>

  return ip;
}
8010490b:	83 c4 4c             	add    $0x4c,%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
8010490e:	89 f0                	mov    %esi,%eax
}
80104910:	5b                   	pop    %ebx
80104911:	5e                   	pop    %esi
80104912:	5f                   	pop    %edi
80104913:	5d                   	pop    %ebp
80104914:	c3                   	ret    
80104915:	8d 76 00             	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104918:	31 c0                	xor    %eax,%eax
8010491a:	e9 60 ff ff ff       	jmp    8010487f <create+0x6f>
8010491f:	90                   	nop
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104920:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104925:	89 3c 24             	mov    %edi,(%esp)
80104928:	e8 c3 cc ff ff       	call   801015f0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
8010492d:	8b 46 04             	mov    0x4(%esi),%eax
80104930:	c7 44 24 04 f8 74 10 	movl   $0x801074f8,0x4(%esp)
80104937:	80 
80104938:	89 34 24             	mov    %esi,(%esp)
8010493b:	89 44 24 08          	mov    %eax,0x8(%esp)
8010493f:	e8 bc d4 ff ff       	call   80101e00 <dirlink>
80104944:	85 c0                	test   %eax,%eax
80104946:	78 1b                	js     80104963 <create+0x153>
80104948:	8b 47 04             	mov    0x4(%edi),%eax
8010494b:	c7 44 24 04 f7 74 10 	movl   $0x801074f7,0x4(%esp)
80104952:	80 
80104953:	89 34 24             	mov    %esi,(%esp)
80104956:	89 44 24 08          	mov    %eax,0x8(%esp)
8010495a:	e8 a1 d4 ff ff       	call   80101e00 <dirlink>
8010495f:	85 c0                	test   %eax,%eax
80104961:	79 89                	jns    801048ec <create+0xdc>
      panic("create dots");
80104963:	c7 04 24 eb 74 10 80 	movl   $0x801074eb,(%esp)
8010496a:	e8 f1 b9 ff ff       	call   80100360 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
8010496f:	c7 04 24 fa 74 10 80 	movl   $0x801074fa,(%esp)
80104976:	e8 e5 b9 ff ff       	call   80100360 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
8010497b:	c7 04 24 dc 74 10 80 	movl   $0x801074dc,(%esp)
80104982:	e8 d9 b9 ff ff       	call   80100360 <panic>
80104987:	89 f6                	mov    %esi,%esi
80104989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104990 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104990:	55                   	push   %ebp
80104991:	89 e5                	mov    %esp,%ebp
80104993:	56                   	push   %esi
80104994:	89 c6                	mov    %eax,%esi
80104996:	53                   	push   %ebx
80104997:	89 d3                	mov    %edx,%ebx
80104999:	83 ec 20             	sub    $0x20,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
8010499c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010499f:	89 44 24 04          	mov    %eax,0x4(%esp)
801049a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801049aa:	e8 e1 fc ff ff       	call   80104690 <argint>
801049af:	85 c0                	test   %eax,%eax
801049b1:	78 35                	js     801049e8 <argfd.constprop.0+0x58>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
801049b3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
801049b6:	83 f9 0f             	cmp    $0xf,%ecx
801049b9:	77 2d                	ja     801049e8 <argfd.constprop.0+0x58>
801049bb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801049c1:	8b 44 88 28          	mov    0x28(%eax,%ecx,4),%eax
801049c5:	85 c0                	test   %eax,%eax
801049c7:	74 1f                	je     801049e8 <argfd.constprop.0+0x58>
    return -1;
  if(pfd)
801049c9:	85 f6                	test   %esi,%esi
801049cb:	74 02                	je     801049cf <argfd.constprop.0+0x3f>
    *pfd = fd;
801049cd:	89 0e                	mov    %ecx,(%esi)
  if(pf)
801049cf:	85 db                	test   %ebx,%ebx
801049d1:	74 0d                	je     801049e0 <argfd.constprop.0+0x50>
    *pf = f;
801049d3:	89 03                	mov    %eax,(%ebx)
  return 0;
801049d5:	31 c0                	xor    %eax,%eax
}
801049d7:	83 c4 20             	add    $0x20,%esp
801049da:	5b                   	pop    %ebx
801049db:	5e                   	pop    %esi
801049dc:	5d                   	pop    %ebp
801049dd:	c3                   	ret    
801049de:	66 90                	xchg   %ax,%ax
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
801049e0:	31 c0                	xor    %eax,%eax
801049e2:	eb f3                	jmp    801049d7 <argfd.constprop.0+0x47>
801049e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
801049e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049ed:	eb e8                	jmp    801049d7 <argfd.constprop.0+0x47>
801049ef:	90                   	nop

801049f0 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
801049f0:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
801049f1:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
801049f3:	89 e5                	mov    %esp,%ebp
801049f5:	53                   	push   %ebx
801049f6:	83 ec 24             	sub    $0x24,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
801049f9:	8d 55 f4             	lea    -0xc(%ebp),%edx
801049fc:	e8 8f ff ff ff       	call   80104990 <argfd.constprop.0>
80104a01:	85 c0                	test   %eax,%eax
80104a03:	78 1b                	js     80104a20 <sys_dup+0x30>
    return -1;
  if((fd=fdalloc(f)) < 0)
80104a05:	8b 55 f4             	mov    -0xc(%ebp),%edx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104a08:	31 db                	xor    %ebx,%ebx
80104a0a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    if(proc->ofile[fd] == 0){
80104a10:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104a14:	85 c9                	test   %ecx,%ecx
80104a16:	74 18                	je     80104a30 <sys_dup+0x40>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104a18:	83 c3 01             	add    $0x1,%ebx
80104a1b:	83 fb 10             	cmp    $0x10,%ebx
80104a1e:	75 f0                	jne    80104a10 <sys_dup+0x20>
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104a20:	83 c4 24             	add    $0x24,%esp
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104a23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104a28:	5b                   	pop    %ebx
80104a29:	5d                   	pop    %ebp
80104a2a:	c3                   	ret    
80104a2b:	90                   	nop
80104a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80104a30:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104a34:	89 14 24             	mov    %edx,(%esp)
80104a37:	e8 94 c3 ff ff       	call   80100dd0 <filedup>
  return fd;
}
80104a3c:	83 c4 24             	add    $0x24,%esp
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
80104a3f:	89 d8                	mov    %ebx,%eax
}
80104a41:	5b                   	pop    %ebx
80104a42:	5d                   	pop    %ebp
80104a43:	c3                   	ret    
80104a44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104a50 <sys_read>:

int
sys_read(void)
{
80104a50:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104a51:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104a53:	89 e5                	mov    %esp,%ebp
80104a55:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104a58:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104a5b:	e8 30 ff ff ff       	call   80104990 <argfd.constprop.0>
80104a60:	85 c0                	test   %eax,%eax
80104a62:	78 54                	js     80104ab8 <sys_read+0x68>
80104a64:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104a67:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a6b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104a72:	e8 19 fc ff ff       	call   80104690 <argint>
80104a77:	85 c0                	test   %eax,%eax
80104a79:	78 3d                	js     80104ab8 <sys_read+0x68>
80104a7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104a7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104a85:	89 44 24 08          	mov    %eax,0x8(%esp)
80104a89:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a8c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a90:	e8 3b fc ff ff       	call   801046d0 <argptr>
80104a95:	85 c0                	test   %eax,%eax
80104a97:	78 1f                	js     80104ab8 <sys_read+0x68>
    return -1;
  return fileread(f, p, n);
80104a99:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104a9c:	89 44 24 08          	mov    %eax,0x8(%esp)
80104aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104aa3:	89 44 24 04          	mov    %eax,0x4(%esp)
80104aa7:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104aaa:	89 04 24             	mov    %eax,(%esp)
80104aad:	e8 8e c4 ff ff       	call   80100f40 <fileread>
}
80104ab2:	c9                   	leave  
80104ab3:	c3                   	ret    
80104ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104ab8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104abd:	c9                   	leave  
80104abe:	c3                   	ret    
80104abf:	90                   	nop

80104ac0 <sys_write>:

int
sys_write(void)
{
80104ac0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104ac1:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104ac3:	89 e5                	mov    %esp,%ebp
80104ac5:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104ac8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104acb:	e8 c0 fe ff ff       	call   80104990 <argfd.constprop.0>
80104ad0:	85 c0                	test   %eax,%eax
80104ad2:	78 54                	js     80104b28 <sys_write+0x68>
80104ad4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104ad7:	89 44 24 04          	mov    %eax,0x4(%esp)
80104adb:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104ae2:	e8 a9 fb ff ff       	call   80104690 <argint>
80104ae7:	85 c0                	test   %eax,%eax
80104ae9:	78 3d                	js     80104b28 <sys_write+0x68>
80104aeb:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104aee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104af5:	89 44 24 08          	mov    %eax,0x8(%esp)
80104af9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104afc:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b00:	e8 cb fb ff ff       	call   801046d0 <argptr>
80104b05:	85 c0                	test   %eax,%eax
80104b07:	78 1f                	js     80104b28 <sys_write+0x68>
    return -1;
  return filewrite(f, p, n);
80104b09:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104b0c:	89 44 24 08          	mov    %eax,0x8(%esp)
80104b10:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104b13:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b17:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104b1a:	89 04 24             	mov    %eax,(%esp)
80104b1d:	e8 ae c4 ff ff       	call   80100fd0 <filewrite>
}
80104b22:	c9                   	leave  
80104b23:	c3                   	ret    
80104b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104b28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104b2d:	c9                   	leave  
80104b2e:	c3                   	ret    
80104b2f:	90                   	nop

80104b30 <sys_close>:

int
sys_close(void)
{
80104b30:	55                   	push   %ebp
80104b31:	89 e5                	mov    %esp,%ebp
80104b33:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104b36:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104b39:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b3c:	e8 4f fe ff ff       	call   80104990 <argfd.constprop.0>
80104b41:	85 c0                	test   %eax,%eax
80104b43:	78 23                	js     80104b68 <sys_close+0x38>
    return -1;
  proc->ofile[fd] = 0;
80104b45:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104b48:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b4e:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104b55:	00 
  fileclose(f);
80104b56:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104b59:	89 04 24             	mov    %eax,(%esp)
80104b5c:	e8 bf c2 ff ff       	call   80100e20 <fileclose>
  return 0;
80104b61:	31 c0                	xor    %eax,%eax
}
80104b63:	c9                   	leave  
80104b64:	c3                   	ret    
80104b65:	8d 76 00             	lea    0x0(%esi),%esi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104b68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  proc->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104b6d:	c9                   	leave  
80104b6e:	c3                   	ret    
80104b6f:	90                   	nop

80104b70 <sys_fstat>:

int
sys_fstat(void)
{
80104b70:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104b71:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104b73:	89 e5                	mov    %esp,%ebp
80104b75:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104b78:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104b7b:	e8 10 fe ff ff       	call   80104990 <argfd.constprop.0>
80104b80:	85 c0                	test   %eax,%eax
80104b82:	78 34                	js     80104bb8 <sys_fstat+0x48>
80104b84:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b87:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
80104b8e:	00 
80104b8f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b93:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104b9a:	e8 31 fb ff ff       	call   801046d0 <argptr>
80104b9f:	85 c0                	test   %eax,%eax
80104ba1:	78 15                	js     80104bb8 <sys_fstat+0x48>
    return -1;
  return filestat(f, st);
80104ba3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104ba6:	89 44 24 04          	mov    %eax,0x4(%esp)
80104baa:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104bad:	89 04 24             	mov    %eax,(%esp)
80104bb0:	e8 3b c3 ff ff       	call   80100ef0 <filestat>
}
80104bb5:	c9                   	leave  
80104bb6:	c3                   	ret    
80104bb7:	90                   	nop
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104bb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104bbd:	c9                   	leave  
80104bbe:	c3                   	ret    
80104bbf:	90                   	nop

80104bc0 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104bc0:	55                   	push   %ebp
80104bc1:	89 e5                	mov    %esp,%ebp
80104bc3:	57                   	push   %edi
80104bc4:	56                   	push   %esi
80104bc5:	53                   	push   %ebx
80104bc6:	83 ec 3c             	sub    $0x3c,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104bc9:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104bcc:	89 44 24 04          	mov    %eax,0x4(%esp)
80104bd0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104bd7:	e8 44 fb ff ff       	call   80104720 <argstr>
80104bdc:	85 c0                	test   %eax,%eax
80104bde:	0f 88 e6 00 00 00    	js     80104cca <sys_link+0x10a>
80104be4:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104be7:	89 44 24 04          	mov    %eax,0x4(%esp)
80104beb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104bf2:	e8 29 fb ff ff       	call   80104720 <argstr>
80104bf7:	85 c0                	test   %eax,%eax
80104bf9:	0f 88 cb 00 00 00    	js     80104cca <sys_link+0x10a>
    return -1;

  begin_op();
80104bff:	e8 8c df ff ff       	call   80102b90 <begin_op>
  if((ip = namei(old)) == 0){
80104c04:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80104c07:	89 04 24             	mov    %eax,(%esp)
80104c0a:	e8 d1 d2 ff ff       	call   80101ee0 <namei>
80104c0f:	85 c0                	test   %eax,%eax
80104c11:	89 c3                	mov    %eax,%ebx
80104c13:	0f 84 ac 00 00 00    	je     80104cc5 <sys_link+0x105>
    end_op();
    return -1;
  }

  ilock(ip);
80104c19:	89 04 24             	mov    %eax,(%esp)
80104c1c:	e8 8f ca ff ff       	call   801016b0 <ilock>
  if(ip->type == T_DIR){
80104c21:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104c26:	0f 84 91 00 00 00    	je     80104cbd <sys_link+0xfd>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104c2c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104c31:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104c34:	89 1c 24             	mov    %ebx,(%esp)
80104c37:	e8 b4 c9 ff ff       	call   801015f0 <iupdate>
  iunlock(ip);
80104c3c:	89 1c 24             	mov    %ebx,(%esp)
80104c3f:	e8 3c cb ff ff       	call   80101780 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104c44:	8b 45 d0             	mov    -0x30(%ebp),%eax
80104c47:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104c4b:	89 04 24             	mov    %eax,(%esp)
80104c4e:	e8 ad d2 ff ff       	call   80101f00 <nameiparent>
80104c53:	85 c0                	test   %eax,%eax
80104c55:	89 c6                	mov    %eax,%esi
80104c57:	74 4f                	je     80104ca8 <sys_link+0xe8>
    goto bad;
  ilock(dp);
80104c59:	89 04 24             	mov    %eax,(%esp)
80104c5c:	e8 4f ca ff ff       	call   801016b0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104c61:	8b 03                	mov    (%ebx),%eax
80104c63:	39 06                	cmp    %eax,(%esi)
80104c65:	75 39                	jne    80104ca0 <sys_link+0xe0>
80104c67:	8b 43 04             	mov    0x4(%ebx),%eax
80104c6a:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104c6e:	89 34 24             	mov    %esi,(%esp)
80104c71:	89 44 24 08          	mov    %eax,0x8(%esp)
80104c75:	e8 86 d1 ff ff       	call   80101e00 <dirlink>
80104c7a:	85 c0                	test   %eax,%eax
80104c7c:	78 22                	js     80104ca0 <sys_link+0xe0>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104c7e:	89 34 24             	mov    %esi,(%esp)
80104c81:	e8 6a cc ff ff       	call   801018f0 <iunlockput>
  iput(ip);
80104c86:	89 1c 24             	mov    %ebx,(%esp)
80104c89:	e8 32 cb ff ff       	call   801017c0 <iput>

  end_op();
80104c8e:	e8 6d df ff ff       	call   80102c00 <end_op>
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104c93:	83 c4 3c             	add    $0x3c,%esp
  iunlockput(dp);
  iput(ip);

  end_op();

  return 0;
80104c96:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104c98:	5b                   	pop    %ebx
80104c99:	5e                   	pop    %esi
80104c9a:	5f                   	pop    %edi
80104c9b:	5d                   	pop    %ebp
80104c9c:	c3                   	ret    
80104c9d:	8d 76 00             	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104ca0:	89 34 24             	mov    %esi,(%esp)
80104ca3:	e8 48 cc ff ff       	call   801018f0 <iunlockput>
  end_op();

  return 0;

bad:
  ilock(ip);
80104ca8:	89 1c 24             	mov    %ebx,(%esp)
80104cab:	e8 00 ca ff ff       	call   801016b0 <ilock>
  ip->nlink--;
80104cb0:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104cb5:	89 1c 24             	mov    %ebx,(%esp)
80104cb8:	e8 33 c9 ff ff       	call   801015f0 <iupdate>
  iunlockput(ip);
80104cbd:	89 1c 24             	mov    %ebx,(%esp)
80104cc0:	e8 2b cc ff ff       	call   801018f0 <iunlockput>
  end_op();
80104cc5:	e8 36 df ff ff       	call   80102c00 <end_op>
  return -1;
}
80104cca:	83 c4 3c             	add    $0x3c,%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104ccd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104cd2:	5b                   	pop    %ebx
80104cd3:	5e                   	pop    %esi
80104cd4:	5f                   	pop    %edi
80104cd5:	5d                   	pop    %ebp
80104cd6:	c3                   	ret    
80104cd7:	89 f6                	mov    %esi,%esi
80104cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ce0 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104ce0:	55                   	push   %ebp
80104ce1:	89 e5                	mov    %esp,%ebp
80104ce3:	57                   	push   %edi
80104ce4:	56                   	push   %esi
80104ce5:	53                   	push   %ebx
80104ce6:	83 ec 5c             	sub    $0x5c,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104ce9:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104cec:	89 44 24 04          	mov    %eax,0x4(%esp)
80104cf0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104cf7:	e8 24 fa ff ff       	call   80104720 <argstr>
80104cfc:	85 c0                	test   %eax,%eax
80104cfe:	0f 88 76 01 00 00    	js     80104e7a <sys_unlink+0x19a>
    return -1;

  begin_op();
80104d04:	e8 87 de ff ff       	call   80102b90 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104d09:	8b 45 c0             	mov    -0x40(%ebp),%eax
80104d0c:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104d0f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104d13:	89 04 24             	mov    %eax,(%esp)
80104d16:	e8 e5 d1 ff ff       	call   80101f00 <nameiparent>
80104d1b:	85 c0                	test   %eax,%eax
80104d1d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104d20:	0f 84 4f 01 00 00    	je     80104e75 <sys_unlink+0x195>
    end_op();
    return -1;
  }

  ilock(dp);
80104d26:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104d29:	89 34 24             	mov    %esi,(%esp)
80104d2c:	e8 7f c9 ff ff       	call   801016b0 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104d31:	c7 44 24 04 f8 74 10 	movl   $0x801074f8,0x4(%esp)
80104d38:	80 
80104d39:	89 1c 24             	mov    %ebx,(%esp)
80104d3c:	e8 2f ce ff ff       	call   80101b70 <namecmp>
80104d41:	85 c0                	test   %eax,%eax
80104d43:	0f 84 21 01 00 00    	je     80104e6a <sys_unlink+0x18a>
80104d49:	c7 44 24 04 f7 74 10 	movl   $0x801074f7,0x4(%esp)
80104d50:	80 
80104d51:	89 1c 24             	mov    %ebx,(%esp)
80104d54:	e8 17 ce ff ff       	call   80101b70 <namecmp>
80104d59:	85 c0                	test   %eax,%eax
80104d5b:	0f 84 09 01 00 00    	je     80104e6a <sys_unlink+0x18a>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80104d61:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104d64:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104d68:	89 44 24 08          	mov    %eax,0x8(%esp)
80104d6c:	89 34 24             	mov    %esi,(%esp)
80104d6f:	e8 2c ce ff ff       	call   80101ba0 <dirlookup>
80104d74:	85 c0                	test   %eax,%eax
80104d76:	89 c3                	mov    %eax,%ebx
80104d78:	0f 84 ec 00 00 00    	je     80104e6a <sys_unlink+0x18a>
    goto bad;
  ilock(ip);
80104d7e:	89 04 24             	mov    %eax,(%esp)
80104d81:	e8 2a c9 ff ff       	call   801016b0 <ilock>

  if(ip->nlink < 1)
80104d86:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104d8b:	0f 8e 24 01 00 00    	jle    80104eb5 <sys_unlink+0x1d5>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80104d91:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d96:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104d99:	74 7d                	je     80104e18 <sys_unlink+0x138>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
80104d9b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80104da2:	00 
80104da3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104daa:	00 
80104dab:	89 34 24             	mov    %esi,(%esp)
80104dae:	e8 ed f5 ff ff       	call   801043a0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104db3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80104db6:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80104dbd:	00 
80104dbe:	89 74 24 04          	mov    %esi,0x4(%esp)
80104dc2:	89 44 24 08          	mov    %eax,0x8(%esp)
80104dc6:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104dc9:	89 04 24             	mov    %eax,(%esp)
80104dcc:	e8 6f cc ff ff       	call   80101a40 <writei>
80104dd1:	83 f8 10             	cmp    $0x10,%eax
80104dd4:	0f 85 cf 00 00 00    	jne    80104ea9 <sys_unlink+0x1c9>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80104dda:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ddf:	0f 84 a3 00 00 00    	je     80104e88 <sys_unlink+0x1a8>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
80104de5:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104de8:	89 04 24             	mov    %eax,(%esp)
80104deb:	e8 00 cb ff ff       	call   801018f0 <iunlockput>

  ip->nlink--;
80104df0:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104df5:	89 1c 24             	mov    %ebx,(%esp)
80104df8:	e8 f3 c7 ff ff       	call   801015f0 <iupdate>
  iunlockput(ip);
80104dfd:	89 1c 24             	mov    %ebx,(%esp)
80104e00:	e8 eb ca ff ff       	call   801018f0 <iunlockput>

  end_op();
80104e05:	e8 f6 dd ff ff       	call   80102c00 <end_op>

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104e0a:	83 c4 5c             	add    $0x5c,%esp
  iupdate(ip);
  iunlockput(ip);

  end_op();

  return 0;
80104e0d:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104e0f:	5b                   	pop    %ebx
80104e10:	5e                   	pop    %esi
80104e11:	5f                   	pop    %edi
80104e12:	5d                   	pop    %ebp
80104e13:	c3                   	ret    
80104e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104e18:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104e1c:	0f 86 79 ff ff ff    	jbe    80104d9b <sys_unlink+0xbb>
80104e22:	bf 20 00 00 00       	mov    $0x20,%edi
80104e27:	eb 15                	jmp    80104e3e <sys_unlink+0x15e>
80104e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104e30:	8d 57 10             	lea    0x10(%edi),%edx
80104e33:	3b 53 58             	cmp    0x58(%ebx),%edx
80104e36:	0f 83 5f ff ff ff    	jae    80104d9b <sys_unlink+0xbb>
80104e3c:	89 d7                	mov    %edx,%edi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104e3e:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80104e45:	00 
80104e46:	89 7c 24 08          	mov    %edi,0x8(%esp)
80104e4a:	89 74 24 04          	mov    %esi,0x4(%esp)
80104e4e:	89 1c 24             	mov    %ebx,(%esp)
80104e51:	e8 ea ca ff ff       	call   80101940 <readi>
80104e56:	83 f8 10             	cmp    $0x10,%eax
80104e59:	75 42                	jne    80104e9d <sys_unlink+0x1bd>
      panic("isdirempty: readi");
    if(de.inum != 0)
80104e5b:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104e60:	74 ce                	je     80104e30 <sys_unlink+0x150>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80104e62:	89 1c 24             	mov    %ebx,(%esp)
80104e65:	e8 86 ca ff ff       	call   801018f0 <iunlockput>
  end_op();

  return 0;

bad:
  iunlockput(dp);
80104e6a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104e6d:	89 04 24             	mov    %eax,(%esp)
80104e70:	e8 7b ca ff ff       	call   801018f0 <iunlockput>
  end_op();
80104e75:	e8 86 dd ff ff       	call   80102c00 <end_op>
  return -1;
}
80104e7a:	83 c4 5c             	add    $0x5c,%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80104e7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e82:	5b                   	pop    %ebx
80104e83:	5e                   	pop    %esi
80104e84:	5f                   	pop    %edi
80104e85:	5d                   	pop    %ebp
80104e86:	c3                   	ret    
80104e87:	90                   	nop

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104e88:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104e8b:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80104e90:	89 04 24             	mov    %eax,(%esp)
80104e93:	e8 58 c7 ff ff       	call   801015f0 <iupdate>
80104e98:	e9 48 ff ff ff       	jmp    80104de5 <sys_unlink+0x105>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
80104e9d:	c7 04 24 1c 75 10 80 	movl   $0x8010751c,(%esp)
80104ea4:	e8 b7 b4 ff ff       	call   80100360 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80104ea9:	c7 04 24 2e 75 10 80 	movl   $0x8010752e,(%esp)
80104eb0:	e8 ab b4 ff ff       	call   80100360 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80104eb5:	c7 04 24 0a 75 10 80 	movl   $0x8010750a,(%esp)
80104ebc:	e8 9f b4 ff ff       	call   80100360 <panic>
80104ec1:	eb 0d                	jmp    80104ed0 <sys_open>
80104ec3:	90                   	nop
80104ec4:	90                   	nop
80104ec5:	90                   	nop
80104ec6:	90                   	nop
80104ec7:	90                   	nop
80104ec8:	90                   	nop
80104ec9:	90                   	nop
80104eca:	90                   	nop
80104ecb:	90                   	nop
80104ecc:	90                   	nop
80104ecd:	90                   	nop
80104ece:	90                   	nop
80104ecf:	90                   	nop

80104ed0 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80104ed0:	55                   	push   %ebp
80104ed1:	89 e5                	mov    %esp,%ebp
80104ed3:	57                   	push   %edi
80104ed4:	56                   	push   %esi
80104ed5:	53                   	push   %ebx
80104ed6:	83 ec 2c             	sub    $0x2c,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104ed9:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104edc:	89 44 24 04          	mov    %eax,0x4(%esp)
80104ee0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104ee7:	e8 34 f8 ff ff       	call   80104720 <argstr>
80104eec:	85 c0                	test   %eax,%eax
80104eee:	0f 88 81 00 00 00    	js     80104f75 <sys_open+0xa5>
80104ef4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104ef7:	89 44 24 04          	mov    %eax,0x4(%esp)
80104efb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104f02:	e8 89 f7 ff ff       	call   80104690 <argint>
80104f07:	85 c0                	test   %eax,%eax
80104f09:	78 6a                	js     80104f75 <sys_open+0xa5>
    return -1;

  begin_op();
80104f0b:	e8 80 dc ff ff       	call   80102b90 <begin_op>

  if(omode & O_CREATE){
80104f10:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80104f14:	75 72                	jne    80104f88 <sys_open+0xb8>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80104f16:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104f19:	89 04 24             	mov    %eax,(%esp)
80104f1c:	e8 bf cf ff ff       	call   80101ee0 <namei>
80104f21:	85 c0                	test   %eax,%eax
80104f23:	89 c7                	mov    %eax,%edi
80104f25:	74 49                	je     80104f70 <sys_open+0xa0>
      end_op();
      return -1;
    }
    ilock(ip);
80104f27:	89 04 24             	mov    %eax,(%esp)
80104f2a:	e8 81 c7 ff ff       	call   801016b0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80104f2f:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80104f34:	0f 84 ae 00 00 00    	je     80104fe8 <sys_open+0x118>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80104f3a:	e8 21 be ff ff       	call   80100d60 <filealloc>
80104f3f:	85 c0                	test   %eax,%eax
80104f41:	89 c6                	mov    %eax,%esi
80104f43:	74 23                	je     80104f68 <sys_open+0x98>
80104f45:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104f4c:	31 db                	xor    %ebx,%ebx
80104f4e:	66 90                	xchg   %ax,%ax
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80104f50:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
80104f54:	85 c0                	test   %eax,%eax
80104f56:	74 50                	je     80104fa8 <sys_open+0xd8>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104f58:	83 c3 01             	add    $0x1,%ebx
80104f5b:	83 fb 10             	cmp    $0x10,%ebx
80104f5e:	75 f0                	jne    80104f50 <sys_open+0x80>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80104f60:	89 34 24             	mov    %esi,(%esp)
80104f63:	e8 b8 be ff ff       	call   80100e20 <fileclose>
    iunlockput(ip);
80104f68:	89 3c 24             	mov    %edi,(%esp)
80104f6b:	e8 80 c9 ff ff       	call   801018f0 <iunlockput>
    end_op();
80104f70:	e8 8b dc ff ff       	call   80102c00 <end_op>
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80104f75:	83 c4 2c             	add    $0x2c,%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
80104f78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80104f7d:	5b                   	pop    %ebx
80104f7e:	5e                   	pop    %esi
80104f7f:	5f                   	pop    %edi
80104f80:	5d                   	pop    %ebp
80104f81:	c3                   	ret    
80104f82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80104f88:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104f8b:	31 c9                	xor    %ecx,%ecx
80104f8d:	ba 02 00 00 00       	mov    $0x2,%edx
80104f92:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104f99:	e8 72 f8 ff ff       	call   80104810 <create>
    if(ip == 0){
80104f9e:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80104fa0:	89 c7                	mov    %eax,%edi
    if(ip == 0){
80104fa2:	75 96                	jne    80104f3a <sys_open+0x6a>
80104fa4:	eb ca                	jmp    80104f70 <sys_open+0xa0>
80104fa6:	66 90                	xchg   %ax,%ax
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80104fa8:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80104fac:	89 3c 24             	mov    %edi,(%esp)
80104faf:	e8 cc c7 ff ff       	call   80101780 <iunlock>
  end_op();
80104fb4:	e8 47 dc ff ff       	call   80102c00 <end_op>

  f->type = FD_INODE;
80104fb9:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80104fbf:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
80104fc2:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
80104fc5:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
80104fcc:	89 d0                	mov    %edx,%eax
80104fce:	83 e0 01             	and    $0x1,%eax
80104fd1:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104fd4:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80104fd7:	88 46 08             	mov    %al,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
80104fda:	89 d8                	mov    %ebx,%eax

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104fdc:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
}
80104fe0:	83 c4 2c             	add    $0x2c,%esp
80104fe3:	5b                   	pop    %ebx
80104fe4:	5e                   	pop    %esi
80104fe5:	5f                   	pop    %edi
80104fe6:	5d                   	pop    %ebp
80104fe7:	c3                   	ret    
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80104fe8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104feb:	85 d2                	test   %edx,%edx
80104fed:	0f 84 47 ff ff ff    	je     80104f3a <sys_open+0x6a>
80104ff3:	e9 70 ff ff ff       	jmp    80104f68 <sys_open+0x98>
80104ff8:	90                   	nop
80104ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105000 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105000:	55                   	push   %ebp
80105001:	89 e5                	mov    %esp,%ebp
80105003:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105006:	e8 85 db ff ff       	call   80102b90 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010500b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010500e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105012:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105019:	e8 02 f7 ff ff       	call   80104720 <argstr>
8010501e:	85 c0                	test   %eax,%eax
80105020:	78 2e                	js     80105050 <sys_mkdir+0x50>
80105022:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105025:	31 c9                	xor    %ecx,%ecx
80105027:	ba 01 00 00 00       	mov    $0x1,%edx
8010502c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105033:	e8 d8 f7 ff ff       	call   80104810 <create>
80105038:	85 c0                	test   %eax,%eax
8010503a:	74 14                	je     80105050 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010503c:	89 04 24             	mov    %eax,(%esp)
8010503f:	e8 ac c8 ff ff       	call   801018f0 <iunlockput>
  end_op();
80105044:	e8 b7 db ff ff       	call   80102c00 <end_op>
  return 0;
80105049:	31 c0                	xor    %eax,%eax
}
8010504b:	c9                   	leave  
8010504c:	c3                   	ret    
8010504d:	8d 76 00             	lea    0x0(%esi),%esi
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105050:	e8 ab db ff ff       	call   80102c00 <end_op>
    return -1;
80105055:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010505a:	c9                   	leave  
8010505b:	c3                   	ret    
8010505c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105060 <sys_mknod>:

int
sys_mknod(void)
{
80105060:	55                   	push   %ebp
80105061:	89 e5                	mov    %esp,%ebp
80105063:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105066:	e8 25 db ff ff       	call   80102b90 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010506b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010506e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105072:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105079:	e8 a2 f6 ff ff       	call   80104720 <argstr>
8010507e:	85 c0                	test   %eax,%eax
80105080:	78 5e                	js     801050e0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105082:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105085:	89 44 24 04          	mov    %eax,0x4(%esp)
80105089:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105090:	e8 fb f5 ff ff       	call   80104690 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
80105095:	85 c0                	test   %eax,%eax
80105097:	78 47                	js     801050e0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105099:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010509c:	89 44 24 04          	mov    %eax,0x4(%esp)
801050a0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
801050a7:	e8 e4 f5 ff ff       	call   80104690 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
801050ac:	85 c0                	test   %eax,%eax
801050ae:	78 30                	js     801050e0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
801050b0:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801050b4:	ba 03 00 00 00       	mov    $0x3,%edx
     (ip = create(path, T_DEV, major, minor)) == 0){
801050b9:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801050bd:	89 04 24             	mov    %eax,(%esp)
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801050c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
801050c3:	e8 48 f7 ff ff       	call   80104810 <create>
801050c8:	85 c0                	test   %eax,%eax
801050ca:	74 14                	je     801050e0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
801050cc:	89 04 24             	mov    %eax,(%esp)
801050cf:	e8 1c c8 ff ff       	call   801018f0 <iunlockput>
  end_op();
801050d4:	e8 27 db ff ff       	call   80102c00 <end_op>
  return 0;
801050d9:	31 c0                	xor    %eax,%eax
}
801050db:	c9                   	leave  
801050dc:	c3                   	ret    
801050dd:	8d 76 00             	lea    0x0(%esi),%esi
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
801050e0:	e8 1b db ff ff       	call   80102c00 <end_op>
    return -1;
801050e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
801050ea:	c9                   	leave  
801050eb:	c3                   	ret    
801050ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801050f0 <sys_chdir>:

int
sys_chdir(void)
{
801050f0:	55                   	push   %ebp
801050f1:	89 e5                	mov    %esp,%ebp
801050f3:	53                   	push   %ebx
801050f4:	83 ec 24             	sub    $0x24,%esp
  char *path;
  struct inode *ip;

  begin_op();
801050f7:	e8 94 da ff ff       	call   80102b90 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801050fc:	8d 45 f4             	lea    -0xc(%ebp),%eax
801050ff:	89 44 24 04          	mov    %eax,0x4(%esp)
80105103:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010510a:	e8 11 f6 ff ff       	call   80104720 <argstr>
8010510f:	85 c0                	test   %eax,%eax
80105111:	78 5a                	js     8010516d <sys_chdir+0x7d>
80105113:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105116:	89 04 24             	mov    %eax,(%esp)
80105119:	e8 c2 cd ff ff       	call   80101ee0 <namei>
8010511e:	85 c0                	test   %eax,%eax
80105120:	89 c3                	mov    %eax,%ebx
80105122:	74 49                	je     8010516d <sys_chdir+0x7d>
    end_op();
    return -1;
  }
  ilock(ip);
80105124:	89 04 24             	mov    %eax,(%esp)
80105127:	e8 84 c5 ff ff       	call   801016b0 <ilock>
  if(ip->type != T_DIR){
8010512c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
    iunlockput(ip);
80105131:	89 1c 24             	mov    %ebx,(%esp)
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
80105134:	75 32                	jne    80105168 <sys_chdir+0x78>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105136:	e8 45 c6 ff ff       	call   80101780 <iunlock>
  iput(proc->cwd);
8010513b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105141:	8b 40 68             	mov    0x68(%eax),%eax
80105144:	89 04 24             	mov    %eax,(%esp)
80105147:	e8 74 c6 ff ff       	call   801017c0 <iput>
  end_op();
8010514c:	e8 af da ff ff       	call   80102c00 <end_op>
  proc->cwd = ip;
80105151:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105157:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
}
8010515a:	83 c4 24             	add    $0x24,%esp
  }
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
  return 0;
8010515d:	31 c0                	xor    %eax,%eax
}
8010515f:	5b                   	pop    %ebx
80105160:	5d                   	pop    %ebp
80105161:	c3                   	ret    
80105162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
80105168:	e8 83 c7 ff ff       	call   801018f0 <iunlockput>
    end_op();
8010516d:	e8 8e da ff ff       	call   80102c00 <end_op>
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
  return 0;
}
80105172:	83 c4 24             	add    $0x24,%esp
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
    end_op();
    return -1;
80105175:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
  return 0;
}
8010517a:	5b                   	pop    %ebx
8010517b:	5d                   	pop    %ebp
8010517c:	c3                   	ret    
8010517d:	8d 76 00             	lea    0x0(%esi),%esi

80105180 <sys_exec>:

int
sys_exec(void)
{
80105180:	55                   	push   %ebp
80105181:	89 e5                	mov    %esp,%ebp
80105183:	57                   	push   %edi
80105184:	56                   	push   %esi
80105185:	53                   	push   %ebx
80105186:	81 ec ac 00 00 00    	sub    $0xac,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
8010518c:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
80105192:	89 44 24 04          	mov    %eax,0x4(%esp)
80105196:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010519d:	e8 7e f5 ff ff       	call   80104720 <argstr>
801051a2:	85 c0                	test   %eax,%eax
801051a4:	0f 88 84 00 00 00    	js     8010522e <sys_exec+0xae>
801051aa:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801051b0:	89 44 24 04          	mov    %eax,0x4(%esp)
801051b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801051bb:	e8 d0 f4 ff ff       	call   80104690 <argint>
801051c0:	85 c0                	test   %eax,%eax
801051c2:	78 6a                	js     8010522e <sys_exec+0xae>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
801051c4:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  for(i=0;; i++){
801051ca:	31 db                	xor    %ebx,%ebx
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
801051cc:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
801051d3:	00 
801051d4:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
801051da:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801051e1:	00 
801051e2:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801051e8:	89 04 24             	mov    %eax,(%esp)
801051eb:	e8 b0 f1 ff ff       	call   801043a0 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801051f0:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801051f6:	89 7c 24 04          	mov    %edi,0x4(%esp)
801051fa:	8d 04 98             	lea    (%eax,%ebx,4),%eax
801051fd:	89 04 24             	mov    %eax,(%esp)
80105200:	e8 0b f4 ff ff       	call   80104610 <fetchint>
80105205:	85 c0                	test   %eax,%eax
80105207:	78 25                	js     8010522e <sys_exec+0xae>
      return -1;
    if(uarg == 0){
80105209:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
8010520f:	85 c0                	test   %eax,%eax
80105211:	74 2d                	je     80105240 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105213:	89 74 24 04          	mov    %esi,0x4(%esp)
80105217:	89 04 24             	mov    %eax,(%esp)
8010521a:	e8 21 f4 ff ff       	call   80104640 <fetchstr>
8010521f:	85 c0                	test   %eax,%eax
80105221:	78 0b                	js     8010522e <sys_exec+0xae>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
80105223:	83 c3 01             	add    $0x1,%ebx
80105226:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
80105229:	83 fb 20             	cmp    $0x20,%ebx
8010522c:	75 c2                	jne    801051f0 <sys_exec+0x70>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
8010522e:	81 c4 ac 00 00 00    	add    $0xac,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
80105234:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105239:	5b                   	pop    %ebx
8010523a:	5e                   	pop    %esi
8010523b:	5f                   	pop    %edi
8010523c:	5d                   	pop    %ebp
8010523d:	c3                   	ret    
8010523e:	66 90                	xchg   %ax,%ax
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105240:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105246:	89 44 24 04          	mov    %eax,0x4(%esp)
8010524a:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105250:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105257:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
8010525b:	89 04 24             	mov    %eax,(%esp)
8010525e:	e8 4d b7 ff ff       	call   801009b0 <exec>
}
80105263:	81 c4 ac 00 00 00    	add    $0xac,%esp
80105269:	5b                   	pop    %ebx
8010526a:	5e                   	pop    %esi
8010526b:	5f                   	pop    %edi
8010526c:	5d                   	pop    %ebp
8010526d:	c3                   	ret    
8010526e:	66 90                	xchg   %ax,%ax

80105270 <sys_pipe>:

int
sys_pipe(void)
{
80105270:	55                   	push   %ebp
80105271:	89 e5                	mov    %esp,%ebp
80105273:	57                   	push   %edi
80105274:	56                   	push   %esi
80105275:	53                   	push   %ebx
80105276:	83 ec 2c             	sub    $0x2c,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105279:	8d 45 dc             	lea    -0x24(%ebp),%eax
8010527c:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
80105283:	00 
80105284:	89 44 24 04          	mov    %eax,0x4(%esp)
80105288:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010528f:	e8 3c f4 ff ff       	call   801046d0 <argptr>
80105294:	85 c0                	test   %eax,%eax
80105296:	78 7a                	js     80105312 <sys_pipe+0xa2>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105298:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010529b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010529f:	8d 45 e0             	lea    -0x20(%ebp),%eax
801052a2:	89 04 24             	mov    %eax,(%esp)
801052a5:	e8 66 e0 ff ff       	call   80103310 <pipealloc>
801052aa:	85 c0                	test   %eax,%eax
801052ac:	78 64                	js     80105312 <sys_pipe+0xa2>
801052ae:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801052b5:	31 c0                	xor    %eax,%eax
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801052b7:	8b 5d e0             	mov    -0x20(%ebp),%ebx
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
801052ba:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
801052be:	85 d2                	test   %edx,%edx
801052c0:	74 16                	je     801052d8 <sys_pipe+0x68>
801052c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801052c8:	83 c0 01             	add    $0x1,%eax
801052cb:	83 f8 10             	cmp    $0x10,%eax
801052ce:	74 2f                	je     801052ff <sys_pipe+0x8f>
    if(proc->ofile[fd] == 0){
801052d0:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
801052d4:	85 d2                	test   %edx,%edx
801052d6:	75 f0                	jne    801052c8 <sys_pipe+0x58>
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801052d8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801052db:	8d 70 08             	lea    0x8(%eax),%esi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801052de:	31 d2                	xor    %edx,%edx
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801052e0:	89 5c b1 08          	mov    %ebx,0x8(%ecx,%esi,4)
801052e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
801052e8:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
801052ed:	74 31                	je     80105320 <sys_pipe+0xb0>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801052ef:	83 c2 01             	add    $0x1,%edx
801052f2:	83 fa 10             	cmp    $0x10,%edx
801052f5:	75 f1                	jne    801052e8 <sys_pipe+0x78>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
801052f7:	c7 44 b1 08 00 00 00 	movl   $0x0,0x8(%ecx,%esi,4)
801052fe:	00 
    fileclose(rf);
801052ff:	89 1c 24             	mov    %ebx,(%esp)
80105302:	e8 19 bb ff ff       	call   80100e20 <fileclose>
    fileclose(wf);
80105307:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010530a:	89 04 24             	mov    %eax,(%esp)
8010530d:	e8 0e bb ff ff       	call   80100e20 <fileclose>
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
80105312:	83 c4 2c             	add    $0x2c,%esp
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
80105315:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
8010531a:	5b                   	pop    %ebx
8010531b:	5e                   	pop    %esi
8010531c:	5f                   	pop    %edi
8010531d:	5d                   	pop    %ebp
8010531e:	c3                   	ret    
8010531f:	90                   	nop
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105320:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105324:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80105327:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
80105329:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010532c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
}
8010532f:	83 c4 2c             	add    $0x2c,%esp
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
80105332:	31 c0                	xor    %eax,%eax
}
80105334:	5b                   	pop    %ebx
80105335:	5e                   	pop    %esi
80105336:	5f                   	pop    %edi
80105337:	5d                   	pop    %ebp
80105338:	c3                   	ret    
80105339:	66 90                	xchg   %ax,%ax
8010533b:	66 90                	xchg   %ax,%ax
8010533d:	66 90                	xchg   %ax,%ax
8010533f:	90                   	nop

80105340 <sys_fork>:
#include "proc.h"

#define static unsigned int seed=7;
int
sys_fork(void)
{
80105340:	55                   	push   %ebp
80105341:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105343:	5d                   	pop    %ebp

#define static unsigned int seed=7;
int
sys_fork(void)
{
  return fork();
80105344:	e9 17 e6 ff ff       	jmp    80103960 <fork>
80105349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105350 <sys_exit>:
}

int
sys_exit(void)
{
80105350:	55                   	push   %ebp
80105351:	89 e5                	mov    %esp,%ebp
80105353:	83 ec 08             	sub    $0x8,%esp
  exit();
80105356:	e8 75 e8 ff ff       	call   80103bd0 <exit>
  return 0;  // not reached
}
8010535b:	31 c0                	xor    %eax,%eax
8010535d:	c9                   	leave  
8010535e:	c3                   	ret    
8010535f:	90                   	nop

80105360 <sys_wait>:

int
sys_wait(void)
{
80105360:	55                   	push   %ebp
80105361:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105363:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105364:	e9 97 ea ff ff       	jmp    80103e00 <wait>
80105369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105370 <sys_kill>:
}

int
sys_kill(void)
{
80105370:	55                   	push   %ebp
80105371:	89 e5                	mov    %esp,%ebp
80105373:	83 ec 28             	sub    $0x28,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105376:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105379:	89 44 24 04          	mov    %eax,0x4(%esp)
8010537d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105384:	e8 07 f3 ff ff       	call   80104690 <argint>
80105389:	85 c0                	test   %eax,%eax
8010538b:	78 13                	js     801053a0 <sys_kill+0x30>
    return -1;
  return kill(pid);
8010538d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105390:	89 04 24             	mov    %eax,(%esp)
80105393:	e8 a8 eb ff ff       	call   80103f40 <kill>
}
80105398:	c9                   	leave  
80105399:	c3                   	ret    
8010539a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
801053a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
801053a5:	c9                   	leave  
801053a6:	c3                   	ret    
801053a7:	89 f6                	mov    %esi,%esi
801053a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801053b0 <sys_getpid>:

int
sys_getpid(void)
{
  return proc->pid;
801053b0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return kill(pid);
}

int
sys_getpid(void)
{
801053b6:	55                   	push   %ebp
801053b7:	89 e5                	mov    %esp,%ebp
  return proc->pid;
}
801053b9:	5d                   	pop    %ebp
}

int
sys_getpid(void)
{
  return proc->pid;
801053ba:	8b 40 10             	mov    0x10(%eax),%eax
}
801053bd:	c3                   	ret    
801053be:	66 90                	xchg   %ax,%ax

801053c0 <sys_sbrk>:

int
sys_sbrk(void)
{
801053c0:	55                   	push   %ebp
801053c1:	89 e5                	mov    %esp,%ebp
801053c3:	53                   	push   %ebx
801053c4:	83 ec 24             	sub    $0x24,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
801053c7:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053ca:	89 44 24 04          	mov    %eax,0x4(%esp)
801053ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801053d5:	e8 b6 f2 ff ff       	call   80104690 <argint>
801053da:	85 c0                	test   %eax,%eax
801053dc:	78 22                	js     80105400 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
801053de:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
801053e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
801053e7:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801053e9:	89 14 24             	mov    %edx,(%esp)
801053ec:	e8 ef e4 ff ff       	call   801038e0 <growproc>
801053f1:	85 c0                	test   %eax,%eax
801053f3:	78 0b                	js     80105400 <sys_sbrk+0x40>
    return -1;
  return addr;
801053f5:	89 d8                	mov    %ebx,%eax
}
801053f7:	83 c4 24             	add    $0x24,%esp
801053fa:	5b                   	pop    %ebx
801053fb:	5d                   	pop    %ebp
801053fc:	c3                   	ret    
801053fd:	8d 76 00             	lea    0x0(%esi),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
80105400:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105405:	eb f0                	jmp    801053f7 <sys_sbrk+0x37>
80105407:	89 f6                	mov    %esi,%esi
80105409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105410 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
80105410:	55                   	push   %ebp
80105411:	89 e5                	mov    %esp,%ebp
80105413:	53                   	push   %ebx
80105414:	83 ec 24             	sub    $0x24,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105417:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010541a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010541e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105425:	e8 66 f2 ff ff       	call   80104690 <argint>
8010542a:	85 c0                	test   %eax,%eax
8010542c:	78 7e                	js     801054ac <sys_sleep+0x9c>
    return -1;
  acquire(&tickslock);
8010542e:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
80105435:	e8 e6 ed ff ff       	call   80104220 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010543a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
8010543d:	8b 1d 20 56 11 80    	mov    0x80115620,%ebx
  while(ticks - ticks0 < n){
80105443:	85 d2                	test   %edx,%edx
80105445:	75 29                	jne    80105470 <sys_sleep+0x60>
80105447:	eb 4f                	jmp    80105498 <sys_sleep+0x88>
80105449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105450:	c7 44 24 04 e0 4d 11 	movl   $0x80114de0,0x4(%esp)
80105457:	80 
80105458:	c7 04 24 20 56 11 80 	movl   $0x80115620,(%esp)
8010545f:	e8 dc e8 ff ff       	call   80103d40 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105464:	a1 20 56 11 80       	mov    0x80115620,%eax
80105469:	29 d8                	sub    %ebx,%eax
8010546b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010546e:	73 28                	jae    80105498 <sys_sleep+0x88>
    if(proc->killed){
80105470:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105476:	8b 40 24             	mov    0x24(%eax),%eax
80105479:	85 c0                	test   %eax,%eax
8010547b:	74 d3                	je     80105450 <sys_sleep+0x40>
      release(&tickslock);
8010547d:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
80105484:	e8 c7 ee ff ff       	call   80104350 <release>
      return -1;
80105489:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
8010548e:	83 c4 24             	add    $0x24,%esp
80105491:	5b                   	pop    %ebx
80105492:	5d                   	pop    %ebp
80105493:	c3                   	ret    
80105494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105498:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
8010549f:	e8 ac ee ff ff       	call   80104350 <release>
  return 0;
}
801054a4:	83 c4 24             	add    $0x24,%esp
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
801054a7:	31 c0                	xor    %eax,%eax
}
801054a9:	5b                   	pop    %ebx
801054aa:	5d                   	pop    %ebp
801054ab:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
801054ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054b1:	eb db                	jmp    8010548e <sys_sleep+0x7e>
801054b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801054b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801054c0 <sys_random>:
  return 0;
}
//I am adding this syscall
static unsigned int sys_random(void)
{
  seed ^= seed << 13;//13
801054c0:	8b 15 0c a0 10 80    	mov    0x8010a00c,%edx
  release(&tickslock);
  return 0;
}
//I am adding this syscall
static unsigned int sys_random(void)
{
801054c6:	55                   	push   %ebp
801054c7:	89 e5                	mov    %esp,%ebp
  seed ^= seed << 13;//13
  seed ^= seed >> 17;//17
  seed ^= seed << 5;//5
  return seed;
}
801054c9:	5d                   	pop    %ebp
  return 0;
}
//I am adding this syscall
static unsigned int sys_random(void)
{
  seed ^= seed << 13;//13
801054ca:	89 d0                	mov    %edx,%eax
801054cc:	c1 e0 0d             	shl    $0xd,%eax
801054cf:	31 d0                	xor    %edx,%eax
  seed ^= seed >> 17;//17
801054d1:	89 c2                	mov    %eax,%edx
801054d3:	c1 ea 11             	shr    $0x11,%edx
801054d6:	31 c2                	xor    %eax,%edx
  seed ^= seed << 5;//5
801054d8:	89 d0                	mov    %edx,%eax
801054da:	c1 e0 05             	shl    $0x5,%eax
801054dd:	31 d0                	xor    %edx,%eax
801054df:	a3 0c a0 10 80       	mov    %eax,0x8010a00c
  return seed;
}
801054e4:	c3                   	ret    
801054e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801054e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801054f0 <sys_uptime>:
	
// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	53                   	push   %ebx
801054f4:	83 ec 14             	sub    $0x14,%esp
  uint xticks;

  acquire(&tickslock);
801054f7:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
801054fe:	e8 1d ed ff ff       	call   80104220 <acquire>
  xticks = ticks;
80105503:	8b 1d 20 56 11 80    	mov    0x80115620,%ebx
  release(&tickslock);
80105509:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
80105510:	e8 3b ee ff ff       	call   80104350 <release>
  return xticks;
}
80105515:	83 c4 14             	add    $0x14,%esp
80105518:	89 d8                	mov    %ebx,%eax
8010551a:	5b                   	pop    %ebx
8010551b:	5d                   	pop    %ebp
8010551c:	c3                   	ret    
8010551d:	66 90                	xchg   %ax,%ax
8010551f:	90                   	nop

80105520 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
80105520:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105521:	ba 43 00 00 00       	mov    $0x43,%edx
80105526:	89 e5                	mov    %esp,%ebp
80105528:	b8 34 00 00 00       	mov    $0x34,%eax
8010552d:	83 ec 18             	sub    $0x18,%esp
80105530:	ee                   	out    %al,(%dx)
80105531:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
80105536:	b2 40                	mov    $0x40,%dl
80105538:	ee                   	out    %al,(%dx)
80105539:	b8 2e 00 00 00       	mov    $0x2e,%eax
8010553e:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
8010553f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105546:	e8 f5 dc ff ff       	call   80103240 <picenable>
}
8010554b:	c9                   	leave  
8010554c:	c3                   	ret    

8010554d <alltraps>:
8010554d:	1e                   	push   %ds
8010554e:	06                   	push   %es
8010554f:	0f a0                	push   %fs
80105551:	0f a8                	push   %gs
80105553:	60                   	pusha  
80105554:	66 b8 10 00          	mov    $0x10,%ax
80105558:	8e d8                	mov    %eax,%ds
8010555a:	8e c0                	mov    %eax,%es
8010555c:	66 b8 18 00          	mov    $0x18,%ax
80105560:	8e e0                	mov    %eax,%fs
80105562:	8e e8                	mov    %eax,%gs
80105564:	54                   	push   %esp
80105565:	e8 e6 00 00 00       	call   80105650 <trap>
8010556a:	83 c4 04             	add    $0x4,%esp

8010556d <trapret>:
8010556d:	61                   	popa   
8010556e:	0f a9                	pop    %gs
80105570:	0f a1                	pop    %fs
80105572:	07                   	pop    %es
80105573:	1f                   	pop    %ds
80105574:	83 c4 08             	add    $0x8,%esp
80105577:	cf                   	iret   
80105578:	66 90                	xchg   %ax,%ax
8010557a:	66 90                	xchg   %ax,%ax
8010557c:	66 90                	xchg   %ax,%ax
8010557e:	66 90                	xchg   %ax,%ax

80105580 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105580:	31 c0                	xor    %eax,%eax
80105582:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105588:	8b 14 85 10 a0 10 80 	mov    -0x7fef5ff0(,%eax,4),%edx
8010558f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105594:	66 89 0c c5 22 4e 11 	mov    %cx,-0x7feeb1de(,%eax,8)
8010559b:	80 
8010559c:	c6 04 c5 24 4e 11 80 	movb   $0x0,-0x7feeb1dc(,%eax,8)
801055a3:	00 
801055a4:	c6 04 c5 25 4e 11 80 	movb   $0x8e,-0x7feeb1db(,%eax,8)
801055ab:	8e 
801055ac:	66 89 14 c5 20 4e 11 	mov    %dx,-0x7feeb1e0(,%eax,8)
801055b3:	80 
801055b4:	c1 ea 10             	shr    $0x10,%edx
801055b7:	66 89 14 c5 26 4e 11 	mov    %dx,-0x7feeb1da(,%eax,8)
801055be:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801055bf:	83 c0 01             	add    $0x1,%eax
801055c2:	3d 00 01 00 00       	cmp    $0x100,%eax
801055c7:	75 bf                	jne    80105588 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801055c9:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801055ca:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801055cf:	89 e5                	mov    %esp,%ebp
801055d1:	83 ec 18             	sub    $0x18,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801055d4:	a1 10 a1 10 80       	mov    0x8010a110,%eax

  initlock(&tickslock, "time");
801055d9:	c7 44 24 04 3d 75 10 	movl   $0x8010753d,0x4(%esp)
801055e0:	80 
801055e1:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801055e8:	66 89 15 22 50 11 80 	mov    %dx,0x80115022
801055ef:	66 a3 20 50 11 80    	mov    %ax,0x80115020
801055f5:	c1 e8 10             	shr    $0x10,%eax
801055f8:	c6 05 24 50 11 80 00 	movb   $0x0,0x80115024
801055ff:	c6 05 25 50 11 80 ef 	movb   $0xef,0x80115025
80105606:	66 a3 26 50 11 80    	mov    %ax,0x80115026

  initlock(&tickslock, "time");
8010560c:	e8 8f eb ff ff       	call   801041a0 <initlock>
}
80105611:	c9                   	leave  
80105612:	c3                   	ret    
80105613:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105620 <idtinit>:

void
idtinit(void)
{
80105620:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105621:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105626:	89 e5                	mov    %esp,%ebp
80105628:	83 ec 10             	sub    $0x10,%esp
8010562b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010562f:	b8 20 4e 11 80       	mov    $0x80114e20,%eax
80105634:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105638:	c1 e8 10             	shr    $0x10,%eax
8010563b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010563f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105642:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105645:	c9                   	leave  
80105646:	c3                   	ret    
80105647:	89 f6                	mov    %esi,%esi
80105649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105650 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105650:	55                   	push   %ebp
80105651:	89 e5                	mov    %esp,%ebp
80105653:	57                   	push   %edi
80105654:	56                   	push   %esi
80105655:	53                   	push   %ebx
80105656:	83 ec 2c             	sub    $0x2c,%esp
80105659:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
8010565c:	8b 43 30             	mov    0x30(%ebx),%eax
8010565f:	83 f8 40             	cmp    $0x40,%eax
80105662:	0f 84 00 01 00 00    	je     80105768 <trap+0x118>
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105668:	83 e8 20             	sub    $0x20,%eax
8010566b:	83 f8 1f             	cmp    $0x1f,%eax
8010566e:	77 60                	ja     801056d0 <trap+0x80>
80105670:	ff 24 85 e4 75 10 80 	jmp    *-0x7fef8a1c(,%eax,4)
80105677:	90                   	nop
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
80105678:	e8 f3 d0 ff ff       	call   80102770 <cpunum>
8010567d:	85 c0                	test   %eax,%eax
8010567f:	90                   	nop
80105680:	0f 84 d2 01 00 00    	je     80105858 <trap+0x208>
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
80105686:	e8 85 d1 ff ff       	call   80102810 <lapiceoi>
8010568b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105691:	85 c0                	test   %eax,%eax
80105693:	74 2d                	je     801056c2 <trap+0x72>
80105695:	8b 50 24             	mov    0x24(%eax),%edx
80105698:	85 d2                	test   %edx,%edx
8010569a:	0f 85 9c 00 00 00    	jne    8010573c <trap+0xec>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
801056a0:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801056a4:	0f 84 86 01 00 00    	je     80105830 <trap+0x1e0>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801056aa:	8b 40 24             	mov    0x24(%eax),%eax
801056ad:	85 c0                	test   %eax,%eax
801056af:	74 11                	je     801056c2 <trap+0x72>
801056b1:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
801056b5:	83 e0 03             	and    $0x3,%eax
801056b8:	66 83 f8 03          	cmp    $0x3,%ax
801056bc:	0f 84 d0 00 00 00    	je     80105792 <trap+0x142>
    exit();
}
801056c2:	83 c4 2c             	add    $0x2c,%esp
801056c5:	5b                   	pop    %ebx
801056c6:	5e                   	pop    %esi
801056c7:	5f                   	pop    %edi
801056c8:	5d                   	pop    %ebp
801056c9:	c3                   	ret    
801056ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
801056d0:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
801056d7:	85 c9                	test   %ecx,%ecx
801056d9:	0f 84 a9 01 00 00    	je     80105888 <trap+0x238>
801056df:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
801056e3:	0f 84 9f 01 00 00    	je     80105888 <trap+0x238>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
801056e9:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801056ec:	8b 73 38             	mov    0x38(%ebx),%esi
801056ef:	e8 7c d0 ff ff       	call   80102770 <cpunum>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
801056f4:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801056fb:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
801056ff:	89 74 24 18          	mov    %esi,0x18(%esp)
80105703:	89 44 24 14          	mov    %eax,0x14(%esp)
80105707:	8b 43 34             	mov    0x34(%ebx),%eax
8010570a:	89 44 24 10          	mov    %eax,0x10(%esp)
8010570e:	8b 43 30             	mov    0x30(%ebx),%eax
80105711:	89 44 24 0c          	mov    %eax,0xc(%esp)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105715:	8d 42 6c             	lea    0x6c(%edx),%eax
80105718:	89 44 24 08          	mov    %eax,0x8(%esp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010571c:	8b 42 10             	mov    0x10(%edx),%eax
8010571f:	c7 04 24 a0 75 10 80 	movl   $0x801075a0,(%esp)
80105726:	89 44 24 04          	mov    %eax,0x4(%esp)
8010572a:	e8 21 af ff ff       	call   80100650 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
8010572f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105735:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
8010573c:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105740:	83 e2 03             	and    $0x3,%edx
80105743:	66 83 fa 03          	cmp    $0x3,%dx
80105747:	0f 85 53 ff ff ff    	jne    801056a0 <trap+0x50>
    exit();
8010574d:	e8 7e e4 ff ff       	call   80103bd0 <exit>

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105752:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105758:	85 c0                	test   %eax,%eax
8010575a:	0f 85 40 ff ff ff    	jne    801056a0 <trap+0x50>
80105760:	e9 5d ff ff ff       	jmp    801056c2 <trap+0x72>
80105765:	8d 76 00             	lea    0x0(%esi),%esi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
80105768:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010576e:	8b 70 24             	mov    0x24(%eax),%esi
80105771:	85 f6                	test   %esi,%esi
80105773:	0f 85 a7 00 00 00    	jne    80105820 <trap+0x1d0>
      exit();
    proc->tf = tf;
80105779:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
8010577c:	e8 1f f0 ff ff       	call   801047a0 <syscall>
    if(proc->killed)
80105781:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105787:	8b 58 24             	mov    0x24(%eax),%ebx
8010578a:	85 db                	test   %ebx,%ebx
8010578c:	0f 84 30 ff ff ff    	je     801056c2 <trap+0x72>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80105792:	83 c4 2c             	add    $0x2c,%esp
80105795:	5b                   	pop    %ebx
80105796:	5e                   	pop    %esi
80105797:	5f                   	pop    %edi
80105798:	5d                   	pop    %ebp
    if(proc->killed)
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
80105799:	e9 32 e4 ff ff       	jmp    80103bd0 <exit>
8010579e:	66 90                	xchg   %ax,%ax
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
801057a0:	e8 3b ce ff ff       	call   801025e0 <kbdintr>
    lapiceoi();
801057a5:	e8 66 d0 ff ff       	call   80102810 <lapiceoi>
801057aa:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
801057b0:	e9 dc fe ff ff       	jmp    80105691 <trap+0x41>
801057b5:	8d 76 00             	lea    0x0(%esi),%esi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
801057b8:	e8 b3 c8 ff ff       	call   80102070 <ideintr>
    lapiceoi();
801057bd:	e8 4e d0 ff ff       	call   80102810 <lapiceoi>
801057c2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
801057c8:	e9 c4 fe ff ff       	jmp    80105691 <trap+0x41>
801057cd:	8d 76 00             	lea    0x0(%esi),%esi
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
801057d0:	e8 1b 02 00 00       	call   801059f0 <uartintr>
    lapiceoi();
801057d5:	e8 36 d0 ff ff       	call   80102810 <lapiceoi>
801057da:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
801057e0:	e9 ac fe ff ff       	jmp    80105691 <trap+0x41>
801057e5:	8d 76 00             	lea    0x0(%esi),%esi
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
801057e8:	8b 7b 38             	mov    0x38(%ebx),%edi
801057eb:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
801057ef:	e8 7c cf ff ff       	call   80102770 <cpunum>
801057f4:	c7 04 24 48 75 10 80 	movl   $0x80107548,(%esp)
801057fb:	89 7c 24 0c          	mov    %edi,0xc(%esp)
801057ff:	89 74 24 08          	mov    %esi,0x8(%esp)
80105803:	89 44 24 04          	mov    %eax,0x4(%esp)
80105807:	e8 44 ae ff ff       	call   80100650 <cprintf>
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
8010580c:	e8 ff cf ff ff       	call   80102810 <lapiceoi>
80105811:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
80105817:	e9 75 fe ff ff       	jmp    80105691 <trap+0x41>
8010581c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit();
80105820:	e8 ab e3 ff ff       	call   80103bd0 <exit>
80105825:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010582b:	e9 49 ff ff ff       	jmp    80105779 <trap+0x129>
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105830:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105834:	0f 85 70 fe ff ff    	jne    801056aa <trap+0x5a>
    yield();
8010583a:	e8 c1 e4 ff ff       	call   80103d00 <yield>

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
8010583f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105845:	85 c0                	test   %eax,%eax
80105847:	0f 85 5d fe ff ff    	jne    801056aa <trap+0x5a>
8010584d:	e9 70 fe ff ff       	jmp    801056c2 <trap+0x72>
80105852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
80105858:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
8010585f:	e8 bc e9 ff ff       	call   80104220 <acquire>
      ticks++;
      wakeup(&ticks);
80105864:	c7 04 24 20 56 11 80 	movl   $0x80115620,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
8010586b:	83 05 20 56 11 80 01 	addl   $0x1,0x80115620
      wakeup(&ticks);
80105872:	e8 69 e6 ff ff       	call   80103ee0 <wakeup>
      release(&tickslock);
80105877:	c7 04 24 e0 4d 11 80 	movl   $0x80114de0,(%esp)
8010587e:	e8 cd ea ff ff       	call   80104350 <release>
80105883:	e9 fe fd ff ff       	jmp    80105686 <trap+0x36>
80105888:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
8010588b:	8b 73 38             	mov    0x38(%ebx),%esi
8010588e:	e8 dd ce ff ff       	call   80102770 <cpunum>
80105893:	89 7c 24 10          	mov    %edi,0x10(%esp)
80105897:	89 74 24 0c          	mov    %esi,0xc(%esp)
8010589b:	89 44 24 08          	mov    %eax,0x8(%esp)
8010589f:	8b 43 30             	mov    0x30(%ebx),%eax
801058a2:	c7 04 24 6c 75 10 80 	movl   $0x8010756c,(%esp)
801058a9:	89 44 24 04          	mov    %eax,0x4(%esp)
801058ad:	e8 9e ad ff ff       	call   80100650 <cprintf>
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
801058b2:	c7 04 24 42 75 10 80 	movl   $0x80107542,(%esp)
801058b9:	e8 a2 aa ff ff       	call   80100360 <panic>
801058be:	66 90                	xchg   %ax,%ax

801058c0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
801058c0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
801058c5:	55                   	push   %ebp
801058c6:	89 e5                	mov    %esp,%ebp
  if(!uart)
801058c8:	85 c0                	test   %eax,%eax
801058ca:	74 14                	je     801058e0 <uartgetc+0x20>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801058cc:	ba fd 03 00 00       	mov    $0x3fd,%edx
801058d1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
801058d2:	a8 01                	test   $0x1,%al
801058d4:	74 0a                	je     801058e0 <uartgetc+0x20>
801058d6:	b2 f8                	mov    $0xf8,%dl
801058d8:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
801058d9:	0f b6 c0             	movzbl %al,%eax
}
801058dc:	5d                   	pop    %ebp
801058dd:	c3                   	ret    
801058de:	66 90                	xchg   %ax,%ax

static int
uartgetc(void)
{
  if(!uart)
    return -1;
801058e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
801058e5:	5d                   	pop    %ebp
801058e6:	c3                   	ret    
801058e7:	89 f6                	mov    %esi,%esi
801058e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058f0 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
801058f0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
801058f5:	85 c0                	test   %eax,%eax
801058f7:	74 3f                	je     80105938 <uartputc+0x48>
    uartputc(*p);
}

void
uartputc(int c)
{
801058f9:	55                   	push   %ebp
801058fa:	89 e5                	mov    %esp,%ebp
801058fc:	56                   	push   %esi
801058fd:	be fd 03 00 00       	mov    $0x3fd,%esi
80105902:	53                   	push   %ebx
  int i;

  if(!uart)
80105903:	bb 80 00 00 00       	mov    $0x80,%ebx
    uartputc(*p);
}

void
uartputc(int c)
{
80105908:	83 ec 10             	sub    $0x10,%esp
8010590b:	eb 14                	jmp    80105921 <uartputc+0x31>
8010590d:	8d 76 00             	lea    0x0(%esi),%esi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105910:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
80105917:	e8 14 cf ff ff       	call   80102830 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
8010591c:	83 eb 01             	sub    $0x1,%ebx
8010591f:	74 07                	je     80105928 <uartputc+0x38>
80105921:	89 f2                	mov    %esi,%edx
80105923:	ec                   	in     (%dx),%al
80105924:	a8 20                	test   $0x20,%al
80105926:	74 e8                	je     80105910 <uartputc+0x20>
    microdelay(10);
  outb(COM1+0, c);
80105928:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010592c:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105931:	ee                   	out    %al,(%dx)
}
80105932:	83 c4 10             	add    $0x10,%esp
80105935:	5b                   	pop    %ebx
80105936:	5e                   	pop    %esi
80105937:	5d                   	pop    %ebp
80105938:	f3 c3                	repz ret 
8010593a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105940 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105940:	55                   	push   %ebp
80105941:	31 c9                	xor    %ecx,%ecx
80105943:	89 e5                	mov    %esp,%ebp
80105945:	89 c8                	mov    %ecx,%eax
80105947:	57                   	push   %edi
80105948:	bf fa 03 00 00       	mov    $0x3fa,%edi
8010594d:	56                   	push   %esi
8010594e:	89 fa                	mov    %edi,%edx
80105950:	53                   	push   %ebx
80105951:	83 ec 1c             	sub    $0x1c,%esp
80105954:	ee                   	out    %al,(%dx)
80105955:	be fb 03 00 00       	mov    $0x3fb,%esi
8010595a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
8010595f:	89 f2                	mov    %esi,%edx
80105961:	ee                   	out    %al,(%dx)
80105962:	b8 0c 00 00 00       	mov    $0xc,%eax
80105967:	b2 f8                	mov    $0xf8,%dl
80105969:	ee                   	out    %al,(%dx)
8010596a:	bb f9 03 00 00       	mov    $0x3f9,%ebx
8010596f:	89 c8                	mov    %ecx,%eax
80105971:	89 da                	mov    %ebx,%edx
80105973:	ee                   	out    %al,(%dx)
80105974:	b8 03 00 00 00       	mov    $0x3,%eax
80105979:	89 f2                	mov    %esi,%edx
8010597b:	ee                   	out    %al,(%dx)
8010597c:	b2 fc                	mov    $0xfc,%dl
8010597e:	89 c8                	mov    %ecx,%eax
80105980:	ee                   	out    %al,(%dx)
80105981:	b8 01 00 00 00       	mov    $0x1,%eax
80105986:	89 da                	mov    %ebx,%edx
80105988:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105989:	b2 fd                	mov    $0xfd,%dl
8010598b:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
8010598c:	3c ff                	cmp    $0xff,%al
8010598e:	74 52                	je     801059e2 <uartinit+0xa2>
    return;
  uart = 1;
80105990:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105997:	00 00 00 
8010599a:	89 fa                	mov    %edi,%edx
8010599c:	ec                   	in     (%dx),%al
8010599d:	b2 f8                	mov    $0xf8,%dl
8010599f:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
801059a0:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
801059a7:	bb 64 76 10 80       	mov    $0x80107664,%ebx

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
801059ac:	e8 8f d8 ff ff       	call   80103240 <picenable>
  ioapicenable(IRQ_COM1, 0);
801059b1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801059b8:	00 
801059b9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
801059c0:	e8 eb c8 ff ff       	call   801022b0 <ioapicenable>

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
801059c5:	b8 78 00 00 00       	mov    $0x78,%eax
801059ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    uartputc(*p);
801059d0:	89 04 24             	mov    %eax,(%esp)
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
801059d3:	83 c3 01             	add    $0x1,%ebx
    uartputc(*p);
801059d6:	e8 15 ff ff ff       	call   801058f0 <uartputc>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
801059db:	0f be 03             	movsbl (%ebx),%eax
801059de:	84 c0                	test   %al,%al
801059e0:	75 ee                	jne    801059d0 <uartinit+0x90>
    uartputc(*p);
}
801059e2:	83 c4 1c             	add    $0x1c,%esp
801059e5:	5b                   	pop    %ebx
801059e6:	5e                   	pop    %esi
801059e7:	5f                   	pop    %edi
801059e8:	5d                   	pop    %ebp
801059e9:	c3                   	ret    
801059ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801059f0 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
801059f0:	55                   	push   %ebp
801059f1:	89 e5                	mov    %esp,%ebp
801059f3:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
801059f6:	c7 04 24 c0 58 10 80 	movl   $0x801058c0,(%esp)
801059fd:	e8 ae ad ff ff       	call   801007b0 <consoleintr>
}
80105a02:	c9                   	leave  
80105a03:	c3                   	ret    

80105a04 <vector0>:
80105a04:	6a 00                	push   $0x0
80105a06:	6a 00                	push   $0x0
80105a08:	e9 40 fb ff ff       	jmp    8010554d <alltraps>

80105a0d <vector1>:
80105a0d:	6a 00                	push   $0x0
80105a0f:	6a 01                	push   $0x1
80105a11:	e9 37 fb ff ff       	jmp    8010554d <alltraps>

80105a16 <vector2>:
80105a16:	6a 00                	push   $0x0
80105a18:	6a 02                	push   $0x2
80105a1a:	e9 2e fb ff ff       	jmp    8010554d <alltraps>

80105a1f <vector3>:
80105a1f:	6a 00                	push   $0x0
80105a21:	6a 03                	push   $0x3
80105a23:	e9 25 fb ff ff       	jmp    8010554d <alltraps>

80105a28 <vector4>:
80105a28:	6a 00                	push   $0x0
80105a2a:	6a 04                	push   $0x4
80105a2c:	e9 1c fb ff ff       	jmp    8010554d <alltraps>

80105a31 <vector5>:
80105a31:	6a 00                	push   $0x0
80105a33:	6a 05                	push   $0x5
80105a35:	e9 13 fb ff ff       	jmp    8010554d <alltraps>

80105a3a <vector6>:
80105a3a:	6a 00                	push   $0x0
80105a3c:	6a 06                	push   $0x6
80105a3e:	e9 0a fb ff ff       	jmp    8010554d <alltraps>

80105a43 <vector7>:
80105a43:	6a 00                	push   $0x0
80105a45:	6a 07                	push   $0x7
80105a47:	e9 01 fb ff ff       	jmp    8010554d <alltraps>

80105a4c <vector8>:
80105a4c:	6a 08                	push   $0x8
80105a4e:	e9 fa fa ff ff       	jmp    8010554d <alltraps>

80105a53 <vector9>:
80105a53:	6a 00                	push   $0x0
80105a55:	6a 09                	push   $0x9
80105a57:	e9 f1 fa ff ff       	jmp    8010554d <alltraps>

80105a5c <vector10>:
80105a5c:	6a 0a                	push   $0xa
80105a5e:	e9 ea fa ff ff       	jmp    8010554d <alltraps>

80105a63 <vector11>:
80105a63:	6a 0b                	push   $0xb
80105a65:	e9 e3 fa ff ff       	jmp    8010554d <alltraps>

80105a6a <vector12>:
80105a6a:	6a 0c                	push   $0xc
80105a6c:	e9 dc fa ff ff       	jmp    8010554d <alltraps>

80105a71 <vector13>:
80105a71:	6a 0d                	push   $0xd
80105a73:	e9 d5 fa ff ff       	jmp    8010554d <alltraps>

80105a78 <vector14>:
80105a78:	6a 0e                	push   $0xe
80105a7a:	e9 ce fa ff ff       	jmp    8010554d <alltraps>

80105a7f <vector15>:
80105a7f:	6a 00                	push   $0x0
80105a81:	6a 0f                	push   $0xf
80105a83:	e9 c5 fa ff ff       	jmp    8010554d <alltraps>

80105a88 <vector16>:
80105a88:	6a 00                	push   $0x0
80105a8a:	6a 10                	push   $0x10
80105a8c:	e9 bc fa ff ff       	jmp    8010554d <alltraps>

80105a91 <vector17>:
80105a91:	6a 11                	push   $0x11
80105a93:	e9 b5 fa ff ff       	jmp    8010554d <alltraps>

80105a98 <vector18>:
80105a98:	6a 00                	push   $0x0
80105a9a:	6a 12                	push   $0x12
80105a9c:	e9 ac fa ff ff       	jmp    8010554d <alltraps>

80105aa1 <vector19>:
80105aa1:	6a 00                	push   $0x0
80105aa3:	6a 13                	push   $0x13
80105aa5:	e9 a3 fa ff ff       	jmp    8010554d <alltraps>

80105aaa <vector20>:
80105aaa:	6a 00                	push   $0x0
80105aac:	6a 14                	push   $0x14
80105aae:	e9 9a fa ff ff       	jmp    8010554d <alltraps>

80105ab3 <vector21>:
80105ab3:	6a 00                	push   $0x0
80105ab5:	6a 15                	push   $0x15
80105ab7:	e9 91 fa ff ff       	jmp    8010554d <alltraps>

80105abc <vector22>:
80105abc:	6a 00                	push   $0x0
80105abe:	6a 16                	push   $0x16
80105ac0:	e9 88 fa ff ff       	jmp    8010554d <alltraps>

80105ac5 <vector23>:
80105ac5:	6a 00                	push   $0x0
80105ac7:	6a 17                	push   $0x17
80105ac9:	e9 7f fa ff ff       	jmp    8010554d <alltraps>

80105ace <vector24>:
80105ace:	6a 00                	push   $0x0
80105ad0:	6a 18                	push   $0x18
80105ad2:	e9 76 fa ff ff       	jmp    8010554d <alltraps>

80105ad7 <vector25>:
80105ad7:	6a 00                	push   $0x0
80105ad9:	6a 19                	push   $0x19
80105adb:	e9 6d fa ff ff       	jmp    8010554d <alltraps>

80105ae0 <vector26>:
80105ae0:	6a 00                	push   $0x0
80105ae2:	6a 1a                	push   $0x1a
80105ae4:	e9 64 fa ff ff       	jmp    8010554d <alltraps>

80105ae9 <vector27>:
80105ae9:	6a 00                	push   $0x0
80105aeb:	6a 1b                	push   $0x1b
80105aed:	e9 5b fa ff ff       	jmp    8010554d <alltraps>

80105af2 <vector28>:
80105af2:	6a 00                	push   $0x0
80105af4:	6a 1c                	push   $0x1c
80105af6:	e9 52 fa ff ff       	jmp    8010554d <alltraps>

80105afb <vector29>:
80105afb:	6a 00                	push   $0x0
80105afd:	6a 1d                	push   $0x1d
80105aff:	e9 49 fa ff ff       	jmp    8010554d <alltraps>

80105b04 <vector30>:
80105b04:	6a 00                	push   $0x0
80105b06:	6a 1e                	push   $0x1e
80105b08:	e9 40 fa ff ff       	jmp    8010554d <alltraps>

80105b0d <vector31>:
80105b0d:	6a 00                	push   $0x0
80105b0f:	6a 1f                	push   $0x1f
80105b11:	e9 37 fa ff ff       	jmp    8010554d <alltraps>

80105b16 <vector32>:
80105b16:	6a 00                	push   $0x0
80105b18:	6a 20                	push   $0x20
80105b1a:	e9 2e fa ff ff       	jmp    8010554d <alltraps>

80105b1f <vector33>:
80105b1f:	6a 00                	push   $0x0
80105b21:	6a 21                	push   $0x21
80105b23:	e9 25 fa ff ff       	jmp    8010554d <alltraps>

80105b28 <vector34>:
80105b28:	6a 00                	push   $0x0
80105b2a:	6a 22                	push   $0x22
80105b2c:	e9 1c fa ff ff       	jmp    8010554d <alltraps>

80105b31 <vector35>:
80105b31:	6a 00                	push   $0x0
80105b33:	6a 23                	push   $0x23
80105b35:	e9 13 fa ff ff       	jmp    8010554d <alltraps>

80105b3a <vector36>:
80105b3a:	6a 00                	push   $0x0
80105b3c:	6a 24                	push   $0x24
80105b3e:	e9 0a fa ff ff       	jmp    8010554d <alltraps>

80105b43 <vector37>:
80105b43:	6a 00                	push   $0x0
80105b45:	6a 25                	push   $0x25
80105b47:	e9 01 fa ff ff       	jmp    8010554d <alltraps>

80105b4c <vector38>:
80105b4c:	6a 00                	push   $0x0
80105b4e:	6a 26                	push   $0x26
80105b50:	e9 f8 f9 ff ff       	jmp    8010554d <alltraps>

80105b55 <vector39>:
80105b55:	6a 00                	push   $0x0
80105b57:	6a 27                	push   $0x27
80105b59:	e9 ef f9 ff ff       	jmp    8010554d <alltraps>

80105b5e <vector40>:
80105b5e:	6a 00                	push   $0x0
80105b60:	6a 28                	push   $0x28
80105b62:	e9 e6 f9 ff ff       	jmp    8010554d <alltraps>

80105b67 <vector41>:
80105b67:	6a 00                	push   $0x0
80105b69:	6a 29                	push   $0x29
80105b6b:	e9 dd f9 ff ff       	jmp    8010554d <alltraps>

80105b70 <vector42>:
80105b70:	6a 00                	push   $0x0
80105b72:	6a 2a                	push   $0x2a
80105b74:	e9 d4 f9 ff ff       	jmp    8010554d <alltraps>

80105b79 <vector43>:
80105b79:	6a 00                	push   $0x0
80105b7b:	6a 2b                	push   $0x2b
80105b7d:	e9 cb f9 ff ff       	jmp    8010554d <alltraps>

80105b82 <vector44>:
80105b82:	6a 00                	push   $0x0
80105b84:	6a 2c                	push   $0x2c
80105b86:	e9 c2 f9 ff ff       	jmp    8010554d <alltraps>

80105b8b <vector45>:
80105b8b:	6a 00                	push   $0x0
80105b8d:	6a 2d                	push   $0x2d
80105b8f:	e9 b9 f9 ff ff       	jmp    8010554d <alltraps>

80105b94 <vector46>:
80105b94:	6a 00                	push   $0x0
80105b96:	6a 2e                	push   $0x2e
80105b98:	e9 b0 f9 ff ff       	jmp    8010554d <alltraps>

80105b9d <vector47>:
80105b9d:	6a 00                	push   $0x0
80105b9f:	6a 2f                	push   $0x2f
80105ba1:	e9 a7 f9 ff ff       	jmp    8010554d <alltraps>

80105ba6 <vector48>:
80105ba6:	6a 00                	push   $0x0
80105ba8:	6a 30                	push   $0x30
80105baa:	e9 9e f9 ff ff       	jmp    8010554d <alltraps>

80105baf <vector49>:
80105baf:	6a 00                	push   $0x0
80105bb1:	6a 31                	push   $0x31
80105bb3:	e9 95 f9 ff ff       	jmp    8010554d <alltraps>

80105bb8 <vector50>:
80105bb8:	6a 00                	push   $0x0
80105bba:	6a 32                	push   $0x32
80105bbc:	e9 8c f9 ff ff       	jmp    8010554d <alltraps>

80105bc1 <vector51>:
80105bc1:	6a 00                	push   $0x0
80105bc3:	6a 33                	push   $0x33
80105bc5:	e9 83 f9 ff ff       	jmp    8010554d <alltraps>

80105bca <vector52>:
80105bca:	6a 00                	push   $0x0
80105bcc:	6a 34                	push   $0x34
80105bce:	e9 7a f9 ff ff       	jmp    8010554d <alltraps>

80105bd3 <vector53>:
80105bd3:	6a 00                	push   $0x0
80105bd5:	6a 35                	push   $0x35
80105bd7:	e9 71 f9 ff ff       	jmp    8010554d <alltraps>

80105bdc <vector54>:
80105bdc:	6a 00                	push   $0x0
80105bde:	6a 36                	push   $0x36
80105be0:	e9 68 f9 ff ff       	jmp    8010554d <alltraps>

80105be5 <vector55>:
80105be5:	6a 00                	push   $0x0
80105be7:	6a 37                	push   $0x37
80105be9:	e9 5f f9 ff ff       	jmp    8010554d <alltraps>

80105bee <vector56>:
80105bee:	6a 00                	push   $0x0
80105bf0:	6a 38                	push   $0x38
80105bf2:	e9 56 f9 ff ff       	jmp    8010554d <alltraps>

80105bf7 <vector57>:
80105bf7:	6a 00                	push   $0x0
80105bf9:	6a 39                	push   $0x39
80105bfb:	e9 4d f9 ff ff       	jmp    8010554d <alltraps>

80105c00 <vector58>:
80105c00:	6a 00                	push   $0x0
80105c02:	6a 3a                	push   $0x3a
80105c04:	e9 44 f9 ff ff       	jmp    8010554d <alltraps>

80105c09 <vector59>:
80105c09:	6a 00                	push   $0x0
80105c0b:	6a 3b                	push   $0x3b
80105c0d:	e9 3b f9 ff ff       	jmp    8010554d <alltraps>

80105c12 <vector60>:
80105c12:	6a 00                	push   $0x0
80105c14:	6a 3c                	push   $0x3c
80105c16:	e9 32 f9 ff ff       	jmp    8010554d <alltraps>

80105c1b <vector61>:
80105c1b:	6a 00                	push   $0x0
80105c1d:	6a 3d                	push   $0x3d
80105c1f:	e9 29 f9 ff ff       	jmp    8010554d <alltraps>

80105c24 <vector62>:
80105c24:	6a 00                	push   $0x0
80105c26:	6a 3e                	push   $0x3e
80105c28:	e9 20 f9 ff ff       	jmp    8010554d <alltraps>

80105c2d <vector63>:
80105c2d:	6a 00                	push   $0x0
80105c2f:	6a 3f                	push   $0x3f
80105c31:	e9 17 f9 ff ff       	jmp    8010554d <alltraps>

80105c36 <vector64>:
80105c36:	6a 00                	push   $0x0
80105c38:	6a 40                	push   $0x40
80105c3a:	e9 0e f9 ff ff       	jmp    8010554d <alltraps>

80105c3f <vector65>:
80105c3f:	6a 00                	push   $0x0
80105c41:	6a 41                	push   $0x41
80105c43:	e9 05 f9 ff ff       	jmp    8010554d <alltraps>

80105c48 <vector66>:
80105c48:	6a 00                	push   $0x0
80105c4a:	6a 42                	push   $0x42
80105c4c:	e9 fc f8 ff ff       	jmp    8010554d <alltraps>

80105c51 <vector67>:
80105c51:	6a 00                	push   $0x0
80105c53:	6a 43                	push   $0x43
80105c55:	e9 f3 f8 ff ff       	jmp    8010554d <alltraps>

80105c5a <vector68>:
80105c5a:	6a 00                	push   $0x0
80105c5c:	6a 44                	push   $0x44
80105c5e:	e9 ea f8 ff ff       	jmp    8010554d <alltraps>

80105c63 <vector69>:
80105c63:	6a 00                	push   $0x0
80105c65:	6a 45                	push   $0x45
80105c67:	e9 e1 f8 ff ff       	jmp    8010554d <alltraps>

80105c6c <vector70>:
80105c6c:	6a 00                	push   $0x0
80105c6e:	6a 46                	push   $0x46
80105c70:	e9 d8 f8 ff ff       	jmp    8010554d <alltraps>

80105c75 <vector71>:
80105c75:	6a 00                	push   $0x0
80105c77:	6a 47                	push   $0x47
80105c79:	e9 cf f8 ff ff       	jmp    8010554d <alltraps>

80105c7e <vector72>:
80105c7e:	6a 00                	push   $0x0
80105c80:	6a 48                	push   $0x48
80105c82:	e9 c6 f8 ff ff       	jmp    8010554d <alltraps>

80105c87 <vector73>:
80105c87:	6a 00                	push   $0x0
80105c89:	6a 49                	push   $0x49
80105c8b:	e9 bd f8 ff ff       	jmp    8010554d <alltraps>

80105c90 <vector74>:
80105c90:	6a 00                	push   $0x0
80105c92:	6a 4a                	push   $0x4a
80105c94:	e9 b4 f8 ff ff       	jmp    8010554d <alltraps>

80105c99 <vector75>:
80105c99:	6a 00                	push   $0x0
80105c9b:	6a 4b                	push   $0x4b
80105c9d:	e9 ab f8 ff ff       	jmp    8010554d <alltraps>

80105ca2 <vector76>:
80105ca2:	6a 00                	push   $0x0
80105ca4:	6a 4c                	push   $0x4c
80105ca6:	e9 a2 f8 ff ff       	jmp    8010554d <alltraps>

80105cab <vector77>:
80105cab:	6a 00                	push   $0x0
80105cad:	6a 4d                	push   $0x4d
80105caf:	e9 99 f8 ff ff       	jmp    8010554d <alltraps>

80105cb4 <vector78>:
80105cb4:	6a 00                	push   $0x0
80105cb6:	6a 4e                	push   $0x4e
80105cb8:	e9 90 f8 ff ff       	jmp    8010554d <alltraps>

80105cbd <vector79>:
80105cbd:	6a 00                	push   $0x0
80105cbf:	6a 4f                	push   $0x4f
80105cc1:	e9 87 f8 ff ff       	jmp    8010554d <alltraps>

80105cc6 <vector80>:
80105cc6:	6a 00                	push   $0x0
80105cc8:	6a 50                	push   $0x50
80105cca:	e9 7e f8 ff ff       	jmp    8010554d <alltraps>

80105ccf <vector81>:
80105ccf:	6a 00                	push   $0x0
80105cd1:	6a 51                	push   $0x51
80105cd3:	e9 75 f8 ff ff       	jmp    8010554d <alltraps>

80105cd8 <vector82>:
80105cd8:	6a 00                	push   $0x0
80105cda:	6a 52                	push   $0x52
80105cdc:	e9 6c f8 ff ff       	jmp    8010554d <alltraps>

80105ce1 <vector83>:
80105ce1:	6a 00                	push   $0x0
80105ce3:	6a 53                	push   $0x53
80105ce5:	e9 63 f8 ff ff       	jmp    8010554d <alltraps>

80105cea <vector84>:
80105cea:	6a 00                	push   $0x0
80105cec:	6a 54                	push   $0x54
80105cee:	e9 5a f8 ff ff       	jmp    8010554d <alltraps>

80105cf3 <vector85>:
80105cf3:	6a 00                	push   $0x0
80105cf5:	6a 55                	push   $0x55
80105cf7:	e9 51 f8 ff ff       	jmp    8010554d <alltraps>

80105cfc <vector86>:
80105cfc:	6a 00                	push   $0x0
80105cfe:	6a 56                	push   $0x56
80105d00:	e9 48 f8 ff ff       	jmp    8010554d <alltraps>

80105d05 <vector87>:
80105d05:	6a 00                	push   $0x0
80105d07:	6a 57                	push   $0x57
80105d09:	e9 3f f8 ff ff       	jmp    8010554d <alltraps>

80105d0e <vector88>:
80105d0e:	6a 00                	push   $0x0
80105d10:	6a 58                	push   $0x58
80105d12:	e9 36 f8 ff ff       	jmp    8010554d <alltraps>

80105d17 <vector89>:
80105d17:	6a 00                	push   $0x0
80105d19:	6a 59                	push   $0x59
80105d1b:	e9 2d f8 ff ff       	jmp    8010554d <alltraps>

80105d20 <vector90>:
80105d20:	6a 00                	push   $0x0
80105d22:	6a 5a                	push   $0x5a
80105d24:	e9 24 f8 ff ff       	jmp    8010554d <alltraps>

80105d29 <vector91>:
80105d29:	6a 00                	push   $0x0
80105d2b:	6a 5b                	push   $0x5b
80105d2d:	e9 1b f8 ff ff       	jmp    8010554d <alltraps>

80105d32 <vector92>:
80105d32:	6a 00                	push   $0x0
80105d34:	6a 5c                	push   $0x5c
80105d36:	e9 12 f8 ff ff       	jmp    8010554d <alltraps>

80105d3b <vector93>:
80105d3b:	6a 00                	push   $0x0
80105d3d:	6a 5d                	push   $0x5d
80105d3f:	e9 09 f8 ff ff       	jmp    8010554d <alltraps>

80105d44 <vector94>:
80105d44:	6a 00                	push   $0x0
80105d46:	6a 5e                	push   $0x5e
80105d48:	e9 00 f8 ff ff       	jmp    8010554d <alltraps>

80105d4d <vector95>:
80105d4d:	6a 00                	push   $0x0
80105d4f:	6a 5f                	push   $0x5f
80105d51:	e9 f7 f7 ff ff       	jmp    8010554d <alltraps>

80105d56 <vector96>:
80105d56:	6a 00                	push   $0x0
80105d58:	6a 60                	push   $0x60
80105d5a:	e9 ee f7 ff ff       	jmp    8010554d <alltraps>

80105d5f <vector97>:
80105d5f:	6a 00                	push   $0x0
80105d61:	6a 61                	push   $0x61
80105d63:	e9 e5 f7 ff ff       	jmp    8010554d <alltraps>

80105d68 <vector98>:
80105d68:	6a 00                	push   $0x0
80105d6a:	6a 62                	push   $0x62
80105d6c:	e9 dc f7 ff ff       	jmp    8010554d <alltraps>

80105d71 <vector99>:
80105d71:	6a 00                	push   $0x0
80105d73:	6a 63                	push   $0x63
80105d75:	e9 d3 f7 ff ff       	jmp    8010554d <alltraps>

80105d7a <vector100>:
80105d7a:	6a 00                	push   $0x0
80105d7c:	6a 64                	push   $0x64
80105d7e:	e9 ca f7 ff ff       	jmp    8010554d <alltraps>

80105d83 <vector101>:
80105d83:	6a 00                	push   $0x0
80105d85:	6a 65                	push   $0x65
80105d87:	e9 c1 f7 ff ff       	jmp    8010554d <alltraps>

80105d8c <vector102>:
80105d8c:	6a 00                	push   $0x0
80105d8e:	6a 66                	push   $0x66
80105d90:	e9 b8 f7 ff ff       	jmp    8010554d <alltraps>

80105d95 <vector103>:
80105d95:	6a 00                	push   $0x0
80105d97:	6a 67                	push   $0x67
80105d99:	e9 af f7 ff ff       	jmp    8010554d <alltraps>

80105d9e <vector104>:
80105d9e:	6a 00                	push   $0x0
80105da0:	6a 68                	push   $0x68
80105da2:	e9 a6 f7 ff ff       	jmp    8010554d <alltraps>

80105da7 <vector105>:
80105da7:	6a 00                	push   $0x0
80105da9:	6a 69                	push   $0x69
80105dab:	e9 9d f7 ff ff       	jmp    8010554d <alltraps>

80105db0 <vector106>:
80105db0:	6a 00                	push   $0x0
80105db2:	6a 6a                	push   $0x6a
80105db4:	e9 94 f7 ff ff       	jmp    8010554d <alltraps>

80105db9 <vector107>:
80105db9:	6a 00                	push   $0x0
80105dbb:	6a 6b                	push   $0x6b
80105dbd:	e9 8b f7 ff ff       	jmp    8010554d <alltraps>

80105dc2 <vector108>:
80105dc2:	6a 00                	push   $0x0
80105dc4:	6a 6c                	push   $0x6c
80105dc6:	e9 82 f7 ff ff       	jmp    8010554d <alltraps>

80105dcb <vector109>:
80105dcb:	6a 00                	push   $0x0
80105dcd:	6a 6d                	push   $0x6d
80105dcf:	e9 79 f7 ff ff       	jmp    8010554d <alltraps>

80105dd4 <vector110>:
80105dd4:	6a 00                	push   $0x0
80105dd6:	6a 6e                	push   $0x6e
80105dd8:	e9 70 f7 ff ff       	jmp    8010554d <alltraps>

80105ddd <vector111>:
80105ddd:	6a 00                	push   $0x0
80105ddf:	6a 6f                	push   $0x6f
80105de1:	e9 67 f7 ff ff       	jmp    8010554d <alltraps>

80105de6 <vector112>:
80105de6:	6a 00                	push   $0x0
80105de8:	6a 70                	push   $0x70
80105dea:	e9 5e f7 ff ff       	jmp    8010554d <alltraps>

80105def <vector113>:
80105def:	6a 00                	push   $0x0
80105df1:	6a 71                	push   $0x71
80105df3:	e9 55 f7 ff ff       	jmp    8010554d <alltraps>

80105df8 <vector114>:
80105df8:	6a 00                	push   $0x0
80105dfa:	6a 72                	push   $0x72
80105dfc:	e9 4c f7 ff ff       	jmp    8010554d <alltraps>

80105e01 <vector115>:
80105e01:	6a 00                	push   $0x0
80105e03:	6a 73                	push   $0x73
80105e05:	e9 43 f7 ff ff       	jmp    8010554d <alltraps>

80105e0a <vector116>:
80105e0a:	6a 00                	push   $0x0
80105e0c:	6a 74                	push   $0x74
80105e0e:	e9 3a f7 ff ff       	jmp    8010554d <alltraps>

80105e13 <vector117>:
80105e13:	6a 00                	push   $0x0
80105e15:	6a 75                	push   $0x75
80105e17:	e9 31 f7 ff ff       	jmp    8010554d <alltraps>

80105e1c <vector118>:
80105e1c:	6a 00                	push   $0x0
80105e1e:	6a 76                	push   $0x76
80105e20:	e9 28 f7 ff ff       	jmp    8010554d <alltraps>

80105e25 <vector119>:
80105e25:	6a 00                	push   $0x0
80105e27:	6a 77                	push   $0x77
80105e29:	e9 1f f7 ff ff       	jmp    8010554d <alltraps>

80105e2e <vector120>:
80105e2e:	6a 00                	push   $0x0
80105e30:	6a 78                	push   $0x78
80105e32:	e9 16 f7 ff ff       	jmp    8010554d <alltraps>

80105e37 <vector121>:
80105e37:	6a 00                	push   $0x0
80105e39:	6a 79                	push   $0x79
80105e3b:	e9 0d f7 ff ff       	jmp    8010554d <alltraps>

80105e40 <vector122>:
80105e40:	6a 00                	push   $0x0
80105e42:	6a 7a                	push   $0x7a
80105e44:	e9 04 f7 ff ff       	jmp    8010554d <alltraps>

80105e49 <vector123>:
80105e49:	6a 00                	push   $0x0
80105e4b:	6a 7b                	push   $0x7b
80105e4d:	e9 fb f6 ff ff       	jmp    8010554d <alltraps>

80105e52 <vector124>:
80105e52:	6a 00                	push   $0x0
80105e54:	6a 7c                	push   $0x7c
80105e56:	e9 f2 f6 ff ff       	jmp    8010554d <alltraps>

80105e5b <vector125>:
80105e5b:	6a 00                	push   $0x0
80105e5d:	6a 7d                	push   $0x7d
80105e5f:	e9 e9 f6 ff ff       	jmp    8010554d <alltraps>

80105e64 <vector126>:
80105e64:	6a 00                	push   $0x0
80105e66:	6a 7e                	push   $0x7e
80105e68:	e9 e0 f6 ff ff       	jmp    8010554d <alltraps>

80105e6d <vector127>:
80105e6d:	6a 00                	push   $0x0
80105e6f:	6a 7f                	push   $0x7f
80105e71:	e9 d7 f6 ff ff       	jmp    8010554d <alltraps>

80105e76 <vector128>:
80105e76:	6a 00                	push   $0x0
80105e78:	68 80 00 00 00       	push   $0x80
80105e7d:	e9 cb f6 ff ff       	jmp    8010554d <alltraps>

80105e82 <vector129>:
80105e82:	6a 00                	push   $0x0
80105e84:	68 81 00 00 00       	push   $0x81
80105e89:	e9 bf f6 ff ff       	jmp    8010554d <alltraps>

80105e8e <vector130>:
80105e8e:	6a 00                	push   $0x0
80105e90:	68 82 00 00 00       	push   $0x82
80105e95:	e9 b3 f6 ff ff       	jmp    8010554d <alltraps>

80105e9a <vector131>:
80105e9a:	6a 00                	push   $0x0
80105e9c:	68 83 00 00 00       	push   $0x83
80105ea1:	e9 a7 f6 ff ff       	jmp    8010554d <alltraps>

80105ea6 <vector132>:
80105ea6:	6a 00                	push   $0x0
80105ea8:	68 84 00 00 00       	push   $0x84
80105ead:	e9 9b f6 ff ff       	jmp    8010554d <alltraps>

80105eb2 <vector133>:
80105eb2:	6a 00                	push   $0x0
80105eb4:	68 85 00 00 00       	push   $0x85
80105eb9:	e9 8f f6 ff ff       	jmp    8010554d <alltraps>

80105ebe <vector134>:
80105ebe:	6a 00                	push   $0x0
80105ec0:	68 86 00 00 00       	push   $0x86
80105ec5:	e9 83 f6 ff ff       	jmp    8010554d <alltraps>

80105eca <vector135>:
80105eca:	6a 00                	push   $0x0
80105ecc:	68 87 00 00 00       	push   $0x87
80105ed1:	e9 77 f6 ff ff       	jmp    8010554d <alltraps>

80105ed6 <vector136>:
80105ed6:	6a 00                	push   $0x0
80105ed8:	68 88 00 00 00       	push   $0x88
80105edd:	e9 6b f6 ff ff       	jmp    8010554d <alltraps>

80105ee2 <vector137>:
80105ee2:	6a 00                	push   $0x0
80105ee4:	68 89 00 00 00       	push   $0x89
80105ee9:	e9 5f f6 ff ff       	jmp    8010554d <alltraps>

80105eee <vector138>:
80105eee:	6a 00                	push   $0x0
80105ef0:	68 8a 00 00 00       	push   $0x8a
80105ef5:	e9 53 f6 ff ff       	jmp    8010554d <alltraps>

80105efa <vector139>:
80105efa:	6a 00                	push   $0x0
80105efc:	68 8b 00 00 00       	push   $0x8b
80105f01:	e9 47 f6 ff ff       	jmp    8010554d <alltraps>

80105f06 <vector140>:
80105f06:	6a 00                	push   $0x0
80105f08:	68 8c 00 00 00       	push   $0x8c
80105f0d:	e9 3b f6 ff ff       	jmp    8010554d <alltraps>

80105f12 <vector141>:
80105f12:	6a 00                	push   $0x0
80105f14:	68 8d 00 00 00       	push   $0x8d
80105f19:	e9 2f f6 ff ff       	jmp    8010554d <alltraps>

80105f1e <vector142>:
80105f1e:	6a 00                	push   $0x0
80105f20:	68 8e 00 00 00       	push   $0x8e
80105f25:	e9 23 f6 ff ff       	jmp    8010554d <alltraps>

80105f2a <vector143>:
80105f2a:	6a 00                	push   $0x0
80105f2c:	68 8f 00 00 00       	push   $0x8f
80105f31:	e9 17 f6 ff ff       	jmp    8010554d <alltraps>

80105f36 <vector144>:
80105f36:	6a 00                	push   $0x0
80105f38:	68 90 00 00 00       	push   $0x90
80105f3d:	e9 0b f6 ff ff       	jmp    8010554d <alltraps>

80105f42 <vector145>:
80105f42:	6a 00                	push   $0x0
80105f44:	68 91 00 00 00       	push   $0x91
80105f49:	e9 ff f5 ff ff       	jmp    8010554d <alltraps>

80105f4e <vector146>:
80105f4e:	6a 00                	push   $0x0
80105f50:	68 92 00 00 00       	push   $0x92
80105f55:	e9 f3 f5 ff ff       	jmp    8010554d <alltraps>

80105f5a <vector147>:
80105f5a:	6a 00                	push   $0x0
80105f5c:	68 93 00 00 00       	push   $0x93
80105f61:	e9 e7 f5 ff ff       	jmp    8010554d <alltraps>

80105f66 <vector148>:
80105f66:	6a 00                	push   $0x0
80105f68:	68 94 00 00 00       	push   $0x94
80105f6d:	e9 db f5 ff ff       	jmp    8010554d <alltraps>

80105f72 <vector149>:
80105f72:	6a 00                	push   $0x0
80105f74:	68 95 00 00 00       	push   $0x95
80105f79:	e9 cf f5 ff ff       	jmp    8010554d <alltraps>

80105f7e <vector150>:
80105f7e:	6a 00                	push   $0x0
80105f80:	68 96 00 00 00       	push   $0x96
80105f85:	e9 c3 f5 ff ff       	jmp    8010554d <alltraps>

80105f8a <vector151>:
80105f8a:	6a 00                	push   $0x0
80105f8c:	68 97 00 00 00       	push   $0x97
80105f91:	e9 b7 f5 ff ff       	jmp    8010554d <alltraps>

80105f96 <vector152>:
80105f96:	6a 00                	push   $0x0
80105f98:	68 98 00 00 00       	push   $0x98
80105f9d:	e9 ab f5 ff ff       	jmp    8010554d <alltraps>

80105fa2 <vector153>:
80105fa2:	6a 00                	push   $0x0
80105fa4:	68 99 00 00 00       	push   $0x99
80105fa9:	e9 9f f5 ff ff       	jmp    8010554d <alltraps>

80105fae <vector154>:
80105fae:	6a 00                	push   $0x0
80105fb0:	68 9a 00 00 00       	push   $0x9a
80105fb5:	e9 93 f5 ff ff       	jmp    8010554d <alltraps>

80105fba <vector155>:
80105fba:	6a 00                	push   $0x0
80105fbc:	68 9b 00 00 00       	push   $0x9b
80105fc1:	e9 87 f5 ff ff       	jmp    8010554d <alltraps>

80105fc6 <vector156>:
80105fc6:	6a 00                	push   $0x0
80105fc8:	68 9c 00 00 00       	push   $0x9c
80105fcd:	e9 7b f5 ff ff       	jmp    8010554d <alltraps>

80105fd2 <vector157>:
80105fd2:	6a 00                	push   $0x0
80105fd4:	68 9d 00 00 00       	push   $0x9d
80105fd9:	e9 6f f5 ff ff       	jmp    8010554d <alltraps>

80105fde <vector158>:
80105fde:	6a 00                	push   $0x0
80105fe0:	68 9e 00 00 00       	push   $0x9e
80105fe5:	e9 63 f5 ff ff       	jmp    8010554d <alltraps>

80105fea <vector159>:
80105fea:	6a 00                	push   $0x0
80105fec:	68 9f 00 00 00       	push   $0x9f
80105ff1:	e9 57 f5 ff ff       	jmp    8010554d <alltraps>

80105ff6 <vector160>:
80105ff6:	6a 00                	push   $0x0
80105ff8:	68 a0 00 00 00       	push   $0xa0
80105ffd:	e9 4b f5 ff ff       	jmp    8010554d <alltraps>

80106002 <vector161>:
80106002:	6a 00                	push   $0x0
80106004:	68 a1 00 00 00       	push   $0xa1
80106009:	e9 3f f5 ff ff       	jmp    8010554d <alltraps>

8010600e <vector162>:
8010600e:	6a 00                	push   $0x0
80106010:	68 a2 00 00 00       	push   $0xa2
80106015:	e9 33 f5 ff ff       	jmp    8010554d <alltraps>

8010601a <vector163>:
8010601a:	6a 00                	push   $0x0
8010601c:	68 a3 00 00 00       	push   $0xa3
80106021:	e9 27 f5 ff ff       	jmp    8010554d <alltraps>

80106026 <vector164>:
80106026:	6a 00                	push   $0x0
80106028:	68 a4 00 00 00       	push   $0xa4
8010602d:	e9 1b f5 ff ff       	jmp    8010554d <alltraps>

80106032 <vector165>:
80106032:	6a 00                	push   $0x0
80106034:	68 a5 00 00 00       	push   $0xa5
80106039:	e9 0f f5 ff ff       	jmp    8010554d <alltraps>

8010603e <vector166>:
8010603e:	6a 00                	push   $0x0
80106040:	68 a6 00 00 00       	push   $0xa6
80106045:	e9 03 f5 ff ff       	jmp    8010554d <alltraps>

8010604a <vector167>:
8010604a:	6a 00                	push   $0x0
8010604c:	68 a7 00 00 00       	push   $0xa7
80106051:	e9 f7 f4 ff ff       	jmp    8010554d <alltraps>

80106056 <vector168>:
80106056:	6a 00                	push   $0x0
80106058:	68 a8 00 00 00       	push   $0xa8
8010605d:	e9 eb f4 ff ff       	jmp    8010554d <alltraps>

80106062 <vector169>:
80106062:	6a 00                	push   $0x0
80106064:	68 a9 00 00 00       	push   $0xa9
80106069:	e9 df f4 ff ff       	jmp    8010554d <alltraps>

8010606e <vector170>:
8010606e:	6a 00                	push   $0x0
80106070:	68 aa 00 00 00       	push   $0xaa
80106075:	e9 d3 f4 ff ff       	jmp    8010554d <alltraps>

8010607a <vector171>:
8010607a:	6a 00                	push   $0x0
8010607c:	68 ab 00 00 00       	push   $0xab
80106081:	e9 c7 f4 ff ff       	jmp    8010554d <alltraps>

80106086 <vector172>:
80106086:	6a 00                	push   $0x0
80106088:	68 ac 00 00 00       	push   $0xac
8010608d:	e9 bb f4 ff ff       	jmp    8010554d <alltraps>

80106092 <vector173>:
80106092:	6a 00                	push   $0x0
80106094:	68 ad 00 00 00       	push   $0xad
80106099:	e9 af f4 ff ff       	jmp    8010554d <alltraps>

8010609e <vector174>:
8010609e:	6a 00                	push   $0x0
801060a0:	68 ae 00 00 00       	push   $0xae
801060a5:	e9 a3 f4 ff ff       	jmp    8010554d <alltraps>

801060aa <vector175>:
801060aa:	6a 00                	push   $0x0
801060ac:	68 af 00 00 00       	push   $0xaf
801060b1:	e9 97 f4 ff ff       	jmp    8010554d <alltraps>

801060b6 <vector176>:
801060b6:	6a 00                	push   $0x0
801060b8:	68 b0 00 00 00       	push   $0xb0
801060bd:	e9 8b f4 ff ff       	jmp    8010554d <alltraps>

801060c2 <vector177>:
801060c2:	6a 00                	push   $0x0
801060c4:	68 b1 00 00 00       	push   $0xb1
801060c9:	e9 7f f4 ff ff       	jmp    8010554d <alltraps>

801060ce <vector178>:
801060ce:	6a 00                	push   $0x0
801060d0:	68 b2 00 00 00       	push   $0xb2
801060d5:	e9 73 f4 ff ff       	jmp    8010554d <alltraps>

801060da <vector179>:
801060da:	6a 00                	push   $0x0
801060dc:	68 b3 00 00 00       	push   $0xb3
801060e1:	e9 67 f4 ff ff       	jmp    8010554d <alltraps>

801060e6 <vector180>:
801060e6:	6a 00                	push   $0x0
801060e8:	68 b4 00 00 00       	push   $0xb4
801060ed:	e9 5b f4 ff ff       	jmp    8010554d <alltraps>

801060f2 <vector181>:
801060f2:	6a 00                	push   $0x0
801060f4:	68 b5 00 00 00       	push   $0xb5
801060f9:	e9 4f f4 ff ff       	jmp    8010554d <alltraps>

801060fe <vector182>:
801060fe:	6a 00                	push   $0x0
80106100:	68 b6 00 00 00       	push   $0xb6
80106105:	e9 43 f4 ff ff       	jmp    8010554d <alltraps>

8010610a <vector183>:
8010610a:	6a 00                	push   $0x0
8010610c:	68 b7 00 00 00       	push   $0xb7
80106111:	e9 37 f4 ff ff       	jmp    8010554d <alltraps>

80106116 <vector184>:
80106116:	6a 00                	push   $0x0
80106118:	68 b8 00 00 00       	push   $0xb8
8010611d:	e9 2b f4 ff ff       	jmp    8010554d <alltraps>

80106122 <vector185>:
80106122:	6a 00                	push   $0x0
80106124:	68 b9 00 00 00       	push   $0xb9
80106129:	e9 1f f4 ff ff       	jmp    8010554d <alltraps>

8010612e <vector186>:
8010612e:	6a 00                	push   $0x0
80106130:	68 ba 00 00 00       	push   $0xba
80106135:	e9 13 f4 ff ff       	jmp    8010554d <alltraps>

8010613a <vector187>:
8010613a:	6a 00                	push   $0x0
8010613c:	68 bb 00 00 00       	push   $0xbb
80106141:	e9 07 f4 ff ff       	jmp    8010554d <alltraps>

80106146 <vector188>:
80106146:	6a 00                	push   $0x0
80106148:	68 bc 00 00 00       	push   $0xbc
8010614d:	e9 fb f3 ff ff       	jmp    8010554d <alltraps>

80106152 <vector189>:
80106152:	6a 00                	push   $0x0
80106154:	68 bd 00 00 00       	push   $0xbd
80106159:	e9 ef f3 ff ff       	jmp    8010554d <alltraps>

8010615e <vector190>:
8010615e:	6a 00                	push   $0x0
80106160:	68 be 00 00 00       	push   $0xbe
80106165:	e9 e3 f3 ff ff       	jmp    8010554d <alltraps>

8010616a <vector191>:
8010616a:	6a 00                	push   $0x0
8010616c:	68 bf 00 00 00       	push   $0xbf
80106171:	e9 d7 f3 ff ff       	jmp    8010554d <alltraps>

80106176 <vector192>:
80106176:	6a 00                	push   $0x0
80106178:	68 c0 00 00 00       	push   $0xc0
8010617d:	e9 cb f3 ff ff       	jmp    8010554d <alltraps>

80106182 <vector193>:
80106182:	6a 00                	push   $0x0
80106184:	68 c1 00 00 00       	push   $0xc1
80106189:	e9 bf f3 ff ff       	jmp    8010554d <alltraps>

8010618e <vector194>:
8010618e:	6a 00                	push   $0x0
80106190:	68 c2 00 00 00       	push   $0xc2
80106195:	e9 b3 f3 ff ff       	jmp    8010554d <alltraps>

8010619a <vector195>:
8010619a:	6a 00                	push   $0x0
8010619c:	68 c3 00 00 00       	push   $0xc3
801061a1:	e9 a7 f3 ff ff       	jmp    8010554d <alltraps>

801061a6 <vector196>:
801061a6:	6a 00                	push   $0x0
801061a8:	68 c4 00 00 00       	push   $0xc4
801061ad:	e9 9b f3 ff ff       	jmp    8010554d <alltraps>

801061b2 <vector197>:
801061b2:	6a 00                	push   $0x0
801061b4:	68 c5 00 00 00       	push   $0xc5
801061b9:	e9 8f f3 ff ff       	jmp    8010554d <alltraps>

801061be <vector198>:
801061be:	6a 00                	push   $0x0
801061c0:	68 c6 00 00 00       	push   $0xc6
801061c5:	e9 83 f3 ff ff       	jmp    8010554d <alltraps>

801061ca <vector199>:
801061ca:	6a 00                	push   $0x0
801061cc:	68 c7 00 00 00       	push   $0xc7
801061d1:	e9 77 f3 ff ff       	jmp    8010554d <alltraps>

801061d6 <vector200>:
801061d6:	6a 00                	push   $0x0
801061d8:	68 c8 00 00 00       	push   $0xc8
801061dd:	e9 6b f3 ff ff       	jmp    8010554d <alltraps>

801061e2 <vector201>:
801061e2:	6a 00                	push   $0x0
801061e4:	68 c9 00 00 00       	push   $0xc9
801061e9:	e9 5f f3 ff ff       	jmp    8010554d <alltraps>

801061ee <vector202>:
801061ee:	6a 00                	push   $0x0
801061f0:	68 ca 00 00 00       	push   $0xca
801061f5:	e9 53 f3 ff ff       	jmp    8010554d <alltraps>

801061fa <vector203>:
801061fa:	6a 00                	push   $0x0
801061fc:	68 cb 00 00 00       	push   $0xcb
80106201:	e9 47 f3 ff ff       	jmp    8010554d <alltraps>

80106206 <vector204>:
80106206:	6a 00                	push   $0x0
80106208:	68 cc 00 00 00       	push   $0xcc
8010620d:	e9 3b f3 ff ff       	jmp    8010554d <alltraps>

80106212 <vector205>:
80106212:	6a 00                	push   $0x0
80106214:	68 cd 00 00 00       	push   $0xcd
80106219:	e9 2f f3 ff ff       	jmp    8010554d <alltraps>

8010621e <vector206>:
8010621e:	6a 00                	push   $0x0
80106220:	68 ce 00 00 00       	push   $0xce
80106225:	e9 23 f3 ff ff       	jmp    8010554d <alltraps>

8010622a <vector207>:
8010622a:	6a 00                	push   $0x0
8010622c:	68 cf 00 00 00       	push   $0xcf
80106231:	e9 17 f3 ff ff       	jmp    8010554d <alltraps>

80106236 <vector208>:
80106236:	6a 00                	push   $0x0
80106238:	68 d0 00 00 00       	push   $0xd0
8010623d:	e9 0b f3 ff ff       	jmp    8010554d <alltraps>

80106242 <vector209>:
80106242:	6a 00                	push   $0x0
80106244:	68 d1 00 00 00       	push   $0xd1
80106249:	e9 ff f2 ff ff       	jmp    8010554d <alltraps>

8010624e <vector210>:
8010624e:	6a 00                	push   $0x0
80106250:	68 d2 00 00 00       	push   $0xd2
80106255:	e9 f3 f2 ff ff       	jmp    8010554d <alltraps>

8010625a <vector211>:
8010625a:	6a 00                	push   $0x0
8010625c:	68 d3 00 00 00       	push   $0xd3
80106261:	e9 e7 f2 ff ff       	jmp    8010554d <alltraps>

80106266 <vector212>:
80106266:	6a 00                	push   $0x0
80106268:	68 d4 00 00 00       	push   $0xd4
8010626d:	e9 db f2 ff ff       	jmp    8010554d <alltraps>

80106272 <vector213>:
80106272:	6a 00                	push   $0x0
80106274:	68 d5 00 00 00       	push   $0xd5
80106279:	e9 cf f2 ff ff       	jmp    8010554d <alltraps>

8010627e <vector214>:
8010627e:	6a 00                	push   $0x0
80106280:	68 d6 00 00 00       	push   $0xd6
80106285:	e9 c3 f2 ff ff       	jmp    8010554d <alltraps>

8010628a <vector215>:
8010628a:	6a 00                	push   $0x0
8010628c:	68 d7 00 00 00       	push   $0xd7
80106291:	e9 b7 f2 ff ff       	jmp    8010554d <alltraps>

80106296 <vector216>:
80106296:	6a 00                	push   $0x0
80106298:	68 d8 00 00 00       	push   $0xd8
8010629d:	e9 ab f2 ff ff       	jmp    8010554d <alltraps>

801062a2 <vector217>:
801062a2:	6a 00                	push   $0x0
801062a4:	68 d9 00 00 00       	push   $0xd9
801062a9:	e9 9f f2 ff ff       	jmp    8010554d <alltraps>

801062ae <vector218>:
801062ae:	6a 00                	push   $0x0
801062b0:	68 da 00 00 00       	push   $0xda
801062b5:	e9 93 f2 ff ff       	jmp    8010554d <alltraps>

801062ba <vector219>:
801062ba:	6a 00                	push   $0x0
801062bc:	68 db 00 00 00       	push   $0xdb
801062c1:	e9 87 f2 ff ff       	jmp    8010554d <alltraps>

801062c6 <vector220>:
801062c6:	6a 00                	push   $0x0
801062c8:	68 dc 00 00 00       	push   $0xdc
801062cd:	e9 7b f2 ff ff       	jmp    8010554d <alltraps>

801062d2 <vector221>:
801062d2:	6a 00                	push   $0x0
801062d4:	68 dd 00 00 00       	push   $0xdd
801062d9:	e9 6f f2 ff ff       	jmp    8010554d <alltraps>

801062de <vector222>:
801062de:	6a 00                	push   $0x0
801062e0:	68 de 00 00 00       	push   $0xde
801062e5:	e9 63 f2 ff ff       	jmp    8010554d <alltraps>

801062ea <vector223>:
801062ea:	6a 00                	push   $0x0
801062ec:	68 df 00 00 00       	push   $0xdf
801062f1:	e9 57 f2 ff ff       	jmp    8010554d <alltraps>

801062f6 <vector224>:
801062f6:	6a 00                	push   $0x0
801062f8:	68 e0 00 00 00       	push   $0xe0
801062fd:	e9 4b f2 ff ff       	jmp    8010554d <alltraps>

80106302 <vector225>:
80106302:	6a 00                	push   $0x0
80106304:	68 e1 00 00 00       	push   $0xe1
80106309:	e9 3f f2 ff ff       	jmp    8010554d <alltraps>

8010630e <vector226>:
8010630e:	6a 00                	push   $0x0
80106310:	68 e2 00 00 00       	push   $0xe2
80106315:	e9 33 f2 ff ff       	jmp    8010554d <alltraps>

8010631a <vector227>:
8010631a:	6a 00                	push   $0x0
8010631c:	68 e3 00 00 00       	push   $0xe3
80106321:	e9 27 f2 ff ff       	jmp    8010554d <alltraps>

80106326 <vector228>:
80106326:	6a 00                	push   $0x0
80106328:	68 e4 00 00 00       	push   $0xe4
8010632d:	e9 1b f2 ff ff       	jmp    8010554d <alltraps>

80106332 <vector229>:
80106332:	6a 00                	push   $0x0
80106334:	68 e5 00 00 00       	push   $0xe5
80106339:	e9 0f f2 ff ff       	jmp    8010554d <alltraps>

8010633e <vector230>:
8010633e:	6a 00                	push   $0x0
80106340:	68 e6 00 00 00       	push   $0xe6
80106345:	e9 03 f2 ff ff       	jmp    8010554d <alltraps>

8010634a <vector231>:
8010634a:	6a 00                	push   $0x0
8010634c:	68 e7 00 00 00       	push   $0xe7
80106351:	e9 f7 f1 ff ff       	jmp    8010554d <alltraps>

80106356 <vector232>:
80106356:	6a 00                	push   $0x0
80106358:	68 e8 00 00 00       	push   $0xe8
8010635d:	e9 eb f1 ff ff       	jmp    8010554d <alltraps>

80106362 <vector233>:
80106362:	6a 00                	push   $0x0
80106364:	68 e9 00 00 00       	push   $0xe9
80106369:	e9 df f1 ff ff       	jmp    8010554d <alltraps>

8010636e <vector234>:
8010636e:	6a 00                	push   $0x0
80106370:	68 ea 00 00 00       	push   $0xea
80106375:	e9 d3 f1 ff ff       	jmp    8010554d <alltraps>

8010637a <vector235>:
8010637a:	6a 00                	push   $0x0
8010637c:	68 eb 00 00 00       	push   $0xeb
80106381:	e9 c7 f1 ff ff       	jmp    8010554d <alltraps>

80106386 <vector236>:
80106386:	6a 00                	push   $0x0
80106388:	68 ec 00 00 00       	push   $0xec
8010638d:	e9 bb f1 ff ff       	jmp    8010554d <alltraps>

80106392 <vector237>:
80106392:	6a 00                	push   $0x0
80106394:	68 ed 00 00 00       	push   $0xed
80106399:	e9 af f1 ff ff       	jmp    8010554d <alltraps>

8010639e <vector238>:
8010639e:	6a 00                	push   $0x0
801063a0:	68 ee 00 00 00       	push   $0xee
801063a5:	e9 a3 f1 ff ff       	jmp    8010554d <alltraps>

801063aa <vector239>:
801063aa:	6a 00                	push   $0x0
801063ac:	68 ef 00 00 00       	push   $0xef
801063b1:	e9 97 f1 ff ff       	jmp    8010554d <alltraps>

801063b6 <vector240>:
801063b6:	6a 00                	push   $0x0
801063b8:	68 f0 00 00 00       	push   $0xf0
801063bd:	e9 8b f1 ff ff       	jmp    8010554d <alltraps>

801063c2 <vector241>:
801063c2:	6a 00                	push   $0x0
801063c4:	68 f1 00 00 00       	push   $0xf1
801063c9:	e9 7f f1 ff ff       	jmp    8010554d <alltraps>

801063ce <vector242>:
801063ce:	6a 00                	push   $0x0
801063d0:	68 f2 00 00 00       	push   $0xf2
801063d5:	e9 73 f1 ff ff       	jmp    8010554d <alltraps>

801063da <vector243>:
801063da:	6a 00                	push   $0x0
801063dc:	68 f3 00 00 00       	push   $0xf3
801063e1:	e9 67 f1 ff ff       	jmp    8010554d <alltraps>

801063e6 <vector244>:
801063e6:	6a 00                	push   $0x0
801063e8:	68 f4 00 00 00       	push   $0xf4
801063ed:	e9 5b f1 ff ff       	jmp    8010554d <alltraps>

801063f2 <vector245>:
801063f2:	6a 00                	push   $0x0
801063f4:	68 f5 00 00 00       	push   $0xf5
801063f9:	e9 4f f1 ff ff       	jmp    8010554d <alltraps>

801063fe <vector246>:
801063fe:	6a 00                	push   $0x0
80106400:	68 f6 00 00 00       	push   $0xf6
80106405:	e9 43 f1 ff ff       	jmp    8010554d <alltraps>

8010640a <vector247>:
8010640a:	6a 00                	push   $0x0
8010640c:	68 f7 00 00 00       	push   $0xf7
80106411:	e9 37 f1 ff ff       	jmp    8010554d <alltraps>

80106416 <vector248>:
80106416:	6a 00                	push   $0x0
80106418:	68 f8 00 00 00       	push   $0xf8
8010641d:	e9 2b f1 ff ff       	jmp    8010554d <alltraps>

80106422 <vector249>:
80106422:	6a 00                	push   $0x0
80106424:	68 f9 00 00 00       	push   $0xf9
80106429:	e9 1f f1 ff ff       	jmp    8010554d <alltraps>

8010642e <vector250>:
8010642e:	6a 00                	push   $0x0
80106430:	68 fa 00 00 00       	push   $0xfa
80106435:	e9 13 f1 ff ff       	jmp    8010554d <alltraps>

8010643a <vector251>:
8010643a:	6a 00                	push   $0x0
8010643c:	68 fb 00 00 00       	push   $0xfb
80106441:	e9 07 f1 ff ff       	jmp    8010554d <alltraps>

80106446 <vector252>:
80106446:	6a 00                	push   $0x0
80106448:	68 fc 00 00 00       	push   $0xfc
8010644d:	e9 fb f0 ff ff       	jmp    8010554d <alltraps>

80106452 <vector253>:
80106452:	6a 00                	push   $0x0
80106454:	68 fd 00 00 00       	push   $0xfd
80106459:	e9 ef f0 ff ff       	jmp    8010554d <alltraps>

8010645e <vector254>:
8010645e:	6a 00                	push   $0x0
80106460:	68 fe 00 00 00       	push   $0xfe
80106465:	e9 e3 f0 ff ff       	jmp    8010554d <alltraps>

8010646a <vector255>:
8010646a:	6a 00                	push   $0x0
8010646c:	68 ff 00 00 00       	push   $0xff
80106471:	e9 d7 f0 ff ff       	jmp    8010554d <alltraps>
80106476:	66 90                	xchg   %ax,%ax
80106478:	66 90                	xchg   %ax,%ax
8010647a:	66 90                	xchg   %ax,%ax
8010647c:	66 90                	xchg   %ax,%ax
8010647e:	66 90                	xchg   %ax,%ax

80106480 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106480:	55                   	push   %ebp
80106481:	89 e5                	mov    %esp,%ebp
80106483:	57                   	push   %edi
80106484:	56                   	push   %esi
80106485:	89 d6                	mov    %edx,%esi
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106487:	c1 ea 16             	shr    $0x16,%edx
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010648a:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
8010648b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010648e:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106491:	8b 1f                	mov    (%edi),%ebx
80106493:	f6 c3 01             	test   $0x1,%bl
80106496:	74 28                	je     801064c0 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106498:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010649e:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801064a4:	c1 ee 0a             	shr    $0xa,%esi
}
801064a7:	83 c4 1c             	add    $0x1c,%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801064aa:	89 f2                	mov    %esi,%edx
801064ac:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801064b2:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
801064b5:	5b                   	pop    %ebx
801064b6:	5e                   	pop    %esi
801064b7:	5f                   	pop    %edi
801064b8:	5d                   	pop    %ebp
801064b9:	c3                   	ret    
801064ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
801064c0:	85 c9                	test   %ecx,%ecx
801064c2:	74 34                	je     801064f8 <walkpgdir+0x78>
801064c4:	e8 d7 bf ff ff       	call   801024a0 <kalloc>
801064c9:	85 c0                	test   %eax,%eax
801064cb:	89 c3                	mov    %eax,%ebx
801064cd:	74 29                	je     801064f8 <walkpgdir+0x78>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
801064cf:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801064d6:	00 
801064d7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801064de:	00 
801064df:	89 04 24             	mov    %eax,(%esp)
801064e2:	e8 b9 de ff ff       	call   801043a0 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
801064e7:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801064ed:	83 c8 07             	or     $0x7,%eax
801064f0:	89 07                	mov    %eax,(%edi)
801064f2:	eb b0                	jmp    801064a4 <walkpgdir+0x24>
801064f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
  return &pgtab[PTX(va)];
}
801064f8:	83 c4 1c             	add    $0x1c,%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
801064fb:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801064fd:	5b                   	pop    %ebx
801064fe:	5e                   	pop    %esi
801064ff:	5f                   	pop    %edi
80106500:	5d                   	pop    %ebp
80106501:	c3                   	ret    
80106502:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106510 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106510:	55                   	push   %ebp
80106511:	89 e5                	mov    %esp,%ebp
80106513:	57                   	push   %edi
80106514:	56                   	push   %esi
80106515:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106516:	89 d3                	mov    %edx,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106518:	83 ec 1c             	sub    $0x1c,%esp
8010651b:	8b 7d 08             	mov    0x8(%ebp),%edi
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
8010651e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106524:	89 45 e0             	mov    %eax,-0x20(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106527:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
8010652b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010652e:	83 4d 0c 01          	orl    $0x1,0xc(%ebp)
{
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106532:	81 65 e4 00 f0 ff ff 	andl   $0xfffff000,-0x1c(%ebp)
80106539:	29 df                	sub    %ebx,%edi
8010653b:	eb 18                	jmp    80106555 <mappages+0x45>
8010653d:	8d 76 00             	lea    0x0(%esi),%esi
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106540:	f6 00 01             	testb  $0x1,(%eax)
80106543:	75 3d                	jne    80106582 <mappages+0x72>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106545:	0b 75 0c             	or     0xc(%ebp),%esi
    if(a == last)
80106548:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010654b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010654d:	74 29                	je     80106578 <mappages+0x68>
      break;
    a += PGSIZE;
8010654f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106555:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106558:	b9 01 00 00 00       	mov    $0x1,%ecx
8010655d:	89 da                	mov    %ebx,%edx
8010655f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106562:	e8 19 ff ff ff       	call   80106480 <walkpgdir>
80106567:	85 c0                	test   %eax,%eax
80106569:	75 d5                	jne    80106540 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
8010656b:	83 c4 1c             	add    $0x1c,%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
8010656e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106573:	5b                   	pop    %ebx
80106574:	5e                   	pop    %esi
80106575:	5f                   	pop    %edi
80106576:	5d                   	pop    %ebp
80106577:	c3                   	ret    
80106578:	83 c4 1c             	add    $0x1c,%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
8010657b:	31 c0                	xor    %eax,%eax
}
8010657d:	5b                   	pop    %ebx
8010657e:	5e                   	pop    %esi
8010657f:	5f                   	pop    %edi
80106580:	5d                   	pop    %ebp
80106581:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
80106582:	c7 04 24 6c 76 10 80 	movl   $0x8010766c,(%esp)
80106589:	e8 d2 9d ff ff       	call   80100360 <panic>
8010658e:	66 90                	xchg   %ax,%ax

80106590 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106590:	55                   	push   %ebp
80106591:	89 e5                	mov    %esp,%ebp
80106593:	57                   	push   %edi
80106594:	89 c7                	mov    %eax,%edi
80106596:	56                   	push   %esi
80106597:	89 d6                	mov    %edx,%esi
80106599:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
8010659a:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801065a0:	83 ec 1c             	sub    $0x1c,%esp
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801065a3:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
801065a9:	39 d3                	cmp    %edx,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801065ab:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801065ae:	72 3b                	jb     801065eb <deallocuvm.part.0+0x5b>
801065b0:	eb 5e                	jmp    80106610 <deallocuvm.part.0+0x80>
801065b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
801065b8:	8b 10                	mov    (%eax),%edx
801065ba:	f6 c2 01             	test   $0x1,%dl
801065bd:	74 22                	je     801065e1 <deallocuvm.part.0+0x51>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
801065bf:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801065c5:	74 54                	je     8010661b <deallocuvm.part.0+0x8b>
        panic("kfree");
      char *v = P2V(pa);
801065c7:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
801065cd:	89 14 24             	mov    %edx,(%esp)
801065d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801065d3:	e8 18 bd ff ff       	call   801022f0 <kfree>
      *pte = 0;
801065d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801065db:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801065e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801065e7:	39 f3                	cmp    %esi,%ebx
801065e9:	73 25                	jae    80106610 <deallocuvm.part.0+0x80>
    pte = walkpgdir(pgdir, (char*)a, 0);
801065eb:	31 c9                	xor    %ecx,%ecx
801065ed:	89 da                	mov    %ebx,%edx
801065ef:	89 f8                	mov    %edi,%eax
801065f1:	e8 8a fe ff ff       	call   80106480 <walkpgdir>
    if(!pte)
801065f6:	85 c0                	test   %eax,%eax
801065f8:	75 be                	jne    801065b8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
801065fa:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106600:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106606:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010660c:	39 f3                	cmp    %esi,%ebx
8010660e:	72 db                	jb     801065eb <deallocuvm.part.0+0x5b>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106610:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106613:	83 c4 1c             	add    $0x1c,%esp
80106616:	5b                   	pop    %ebx
80106617:	5e                   	pop    %esi
80106618:	5f                   	pop    %edi
80106619:	5d                   	pop    %ebp
8010661a:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
8010661b:	c7 04 24 12 70 10 80 	movl   $0x80107012,(%esp)
80106622:	e8 39 9d ff ff       	call   80100360 <panic>
80106627:	89 f6                	mov    %esi,%esi
80106629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106630 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106630:	55                   	push   %ebp
80106631:	89 e5                	mov    %esp,%ebp
80106633:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106636:	e8 35 c1 ff ff       	call   80102770 <cpunum>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010663b:	31 c9                	xor    %ecx,%ecx
8010663d:	ba ff ff ff ff       	mov    $0xffffffff,%edx

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106642:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106648:	05 a0 27 11 80       	add    $0x801127a0,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010664d:	66 89 50 78          	mov    %dx,0x78(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106651:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106656:	66 89 48 7a          	mov    %cx,0x7a(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010665a:	31 c9                	xor    %ecx,%ecx
8010665c:	66 89 90 80 00 00 00 	mov    %dx,0x80(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106663:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106668:	66 89 88 82 00 00 00 	mov    %cx,0x82(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010666f:	31 c9                	xor    %ecx,%ecx
80106671:	66 89 90 90 00 00 00 	mov    %dx,0x90(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106678:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010667d:	66 89 88 92 00 00 00 	mov    %cx,0x92(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106684:	31 c9                	xor    %ecx,%ecx
80106686:	66 89 90 98 00 00 00 	mov    %dx,0x98(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
8010668d:	8d 90 b4 00 00 00    	lea    0xb4(%eax),%edx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106693:	66 89 88 9a 00 00 00 	mov    %cx,0x9a(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
8010669a:	31 c9                	xor    %ecx,%ecx
8010669c:	66 89 88 88 00 00 00 	mov    %cx,0x88(%eax)
801066a3:	89 d1                	mov    %edx,%ecx
801066a5:	c1 e9 10             	shr    $0x10,%ecx
801066a8:	66 89 90 8a 00 00 00 	mov    %dx,0x8a(%eax)
801066af:	c1 ea 18             	shr    $0x18,%edx
801066b2:	88 88 8c 00 00 00    	mov    %cl,0x8c(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801066b8:	b9 37 00 00 00       	mov    $0x37,%ecx
801066bd:	88 90 8f 00 00 00    	mov    %dl,0x8f(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
801066c3:	8d 50 70             	lea    0x70(%eax),%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801066c6:	c6 40 7d 9a          	movb   $0x9a,0x7d(%eax)
801066ca:	c6 40 7e cf          	movb   $0xcf,0x7e(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801066ce:	c6 80 85 00 00 00 92 	movb   $0x92,0x85(%eax)
801066d5:	c6 80 86 00 00 00 cf 	movb   $0xcf,0x86(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801066dc:	c6 80 95 00 00 00 fa 	movb   $0xfa,0x95(%eax)
801066e3:	c6 80 96 00 00 00 cf 	movb   $0xcf,0x96(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801066ea:	c6 80 9d 00 00 00 f2 	movb   $0xf2,0x9d(%eax)
801066f1:	c6 80 9e 00 00 00 cf 	movb   $0xcf,0x9e(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
801066f8:	c6 80 8d 00 00 00 92 	movb   $0x92,0x8d(%eax)
801066ff:	c6 80 8e 00 00 00 c0 	movb   $0xc0,0x8e(%eax)
80106706:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  pd[1] = (uint)p;
8010670a:	66 89 55 f4          	mov    %dx,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
8010670e:	c1 ea 10             	shr    $0x10,%edx
80106711:	66 89 55 f6          	mov    %dx,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106715:	8d 55 f2             	lea    -0xe(%ebp),%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106718:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
8010671c:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106720:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
80106727:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010672e:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
80106735:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
8010673c:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
80106743:	c6 80 9f 00 00 00 00 	movb   $0x0,0x9f(%eax)
8010674a:	0f 01 12             	lgdtl  (%edx)
}

static inline void
loadgs(ushort v)
{
  asm volatile("movw %0, %%gs" : : "r" (v));
8010674d:	ba 18 00 00 00       	mov    $0x18,%edx
80106752:	8e ea                	mov    %edx,%gs
  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
80106754:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
8010675b:	00 00 00 00 

  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
8010675f:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  proc = 0;
}
80106765:	c9                   	leave  
80106766:	c3                   	ret    
80106767:	89 f6                	mov    %esi,%esi
80106769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106770 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106770:	55                   	push   %ebp
80106771:	89 e5                	mov    %esp,%ebp
80106773:	56                   	push   %esi
80106774:	53                   	push   %ebx
80106775:	83 ec 10             	sub    $0x10,%esp
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106778:	e8 23 bd ff ff       	call   801024a0 <kalloc>
8010677d:	85 c0                	test   %eax,%eax
8010677f:	89 c6                	mov    %eax,%esi
80106781:	74 55                	je     801067d8 <setupkvm+0x68>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106783:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010678a:	00 
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010678b:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106790:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106797:	00 
80106798:	89 04 24             	mov    %eax,(%esp)
8010679b:	e8 00 dc ff ff       	call   801043a0 <memset>
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
801067a0:	8b 53 0c             	mov    0xc(%ebx),%edx
801067a3:	8b 43 04             	mov    0x4(%ebx),%eax
801067a6:	8b 4b 08             	mov    0x8(%ebx),%ecx
801067a9:	89 54 24 04          	mov    %edx,0x4(%esp)
801067ad:	8b 13                	mov    (%ebx),%edx
801067af:	89 04 24             	mov    %eax,(%esp)
801067b2:	29 c1                	sub    %eax,%ecx
801067b4:	89 f0                	mov    %esi,%eax
801067b6:	e8 55 fd ff ff       	call   80106510 <mappages>
801067bb:	85 c0                	test   %eax,%eax
801067bd:	78 19                	js     801067d8 <setupkvm+0x68>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
801067bf:	83 c3 10             	add    $0x10,%ebx
801067c2:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
801067c8:	72 d6                	jb     801067a0 <setupkvm+0x30>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
801067ca:	83 c4 10             	add    $0x10,%esp
801067cd:	89 f0                	mov    %esi,%eax
801067cf:	5b                   	pop    %ebx
801067d0:	5e                   	pop    %esi
801067d1:	5d                   	pop    %ebp
801067d2:	c3                   	ret    
801067d3:	90                   	nop
801067d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801067d8:	83 c4 10             	add    $0x10,%esp
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
801067db:	31 c0                	xor    %eax,%eax
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
801067dd:	5b                   	pop    %ebx
801067de:	5e                   	pop    %esi
801067df:	5d                   	pop    %ebp
801067e0:	c3                   	ret    
801067e1:	eb 0d                	jmp    801067f0 <kvmalloc>
801067e3:	90                   	nop
801067e4:	90                   	nop
801067e5:	90                   	nop
801067e6:	90                   	nop
801067e7:	90                   	nop
801067e8:	90                   	nop
801067e9:	90                   	nop
801067ea:	90                   	nop
801067eb:	90                   	nop
801067ec:	90                   	nop
801067ed:	90                   	nop
801067ee:	90                   	nop
801067ef:	90                   	nop

801067f0 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
801067f0:	55                   	push   %ebp
801067f1:	89 e5                	mov    %esp,%ebp
801067f3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
801067f6:	e8 75 ff ff ff       	call   80106770 <setupkvm>
801067fb:	a3 24 56 11 80       	mov    %eax,0x80115624
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106800:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106805:	0f 22 d8             	mov    %eax,%cr3
void
kvmalloc(void)
{
  kpgdir = setupkvm();
  switchkvm();
}
80106808:	c9                   	leave  
80106809:	c3                   	ret    
8010680a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106810 <switchkvm>:
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106810:	a1 24 56 11 80       	mov    0x80115624,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106815:	55                   	push   %ebp
80106816:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106818:	05 00 00 00 80       	add    $0x80000000,%eax
8010681d:	0f 22 d8             	mov    %eax,%cr3
}
80106820:	5d                   	pop    %ebp
80106821:	c3                   	ret    
80106822:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106830 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106830:	55                   	push   %ebp
80106831:	89 e5                	mov    %esp,%ebp
80106833:	53                   	push   %ebx
80106834:	83 ec 14             	sub    $0x14,%esp
80106837:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
8010683a:	85 db                	test   %ebx,%ebx
8010683c:	0f 84 94 00 00 00    	je     801068d6 <switchuvm+0xa6>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80106842:	8b 43 08             	mov    0x8(%ebx),%eax
80106845:	85 c0                	test   %eax,%eax
80106847:	0f 84 a1 00 00 00    	je     801068ee <switchuvm+0xbe>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
8010684d:	8b 43 04             	mov    0x4(%ebx),%eax
80106850:	85 c0                	test   %eax,%eax
80106852:	0f 84 8a 00 00 00    	je     801068e2 <switchuvm+0xb2>
    panic("switchuvm: no pgdir");

  pushcli();
80106858:	e8 73 da ff ff       	call   801042d0 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
8010685d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106863:	b9 67 00 00 00       	mov    $0x67,%ecx
80106868:	8d 50 08             	lea    0x8(%eax),%edx
8010686b:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106872:	89 d1                	mov    %edx,%ecx
80106874:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
8010687b:	c1 ea 18             	shr    $0x18,%edx
8010687e:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106884:	c1 e9 10             	shr    $0x10,%ecx
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106887:	ba 10 00 00 00       	mov    $0x10,%edx
8010688c:	66 89 50 10          	mov    %dx,0x10(%eax)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106890:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
80106896:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
8010689d:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
801068a4:	8b 4b 08             	mov    0x8(%ebx),%ecx
801068a7:	8d 91 00 10 00 00    	lea    0x1000(%ecx),%edx
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
801068ad:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
801068b2:	89 50 0c             	mov    %edx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
801068b5:	66 89 48 6e          	mov    %cx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
801068b9:	b8 30 00 00 00       	mov    $0x30,%eax
801068be:	0f 00 d8             	ltr    %ax
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
801068c1:	8b 43 04             	mov    0x4(%ebx),%eax
801068c4:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
801068c9:	0f 22 d8             	mov    %eax,%cr3
  popcli();
}
801068cc:	83 c4 14             	add    $0x14,%esp
801068cf:	5b                   	pop    %ebx
801068d0:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
801068d1:	e9 2a da ff ff       	jmp    80104300 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
801068d6:	c7 04 24 72 76 10 80 	movl   $0x80107672,(%esp)
801068dd:	e8 7e 9a ff ff       	call   80100360 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
801068e2:	c7 04 24 9d 76 10 80 	movl   $0x8010769d,(%esp)
801068e9:	e8 72 9a ff ff       	call   80100360 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
801068ee:	c7 04 24 88 76 10 80 	movl   $0x80107688,(%esp)
801068f5:	e8 66 9a ff ff       	call   80100360 <panic>
801068fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106900 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106900:	55                   	push   %ebp
80106901:	89 e5                	mov    %esp,%ebp
80106903:	57                   	push   %edi
80106904:	56                   	push   %esi
80106905:	53                   	push   %ebx
80106906:	83 ec 1c             	sub    $0x1c,%esp
80106909:	8b 75 10             	mov    0x10(%ebp),%esi
8010690c:	8b 45 08             	mov    0x8(%ebp),%eax
8010690f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106912:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106918:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
8010691b:	77 54                	ja     80106971 <inituvm+0x71>
    panic("inituvm: more than a page");
  mem = kalloc();
8010691d:	e8 7e bb ff ff       	call   801024a0 <kalloc>
  memset(mem, 0, PGSIZE);
80106922:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106929:	00 
8010692a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106931:	00 
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106932:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106934:	89 04 24             	mov    %eax,(%esp)
80106937:	e8 64 da ff ff       	call   801043a0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
8010693c:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106942:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106947:	89 04 24             	mov    %eax,(%esp)
8010694a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010694d:	31 d2                	xor    %edx,%edx
8010694f:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
80106956:	00 
80106957:	e8 b4 fb ff ff       	call   80106510 <mappages>
  memmove(mem, init, sz);
8010695c:	89 75 10             	mov    %esi,0x10(%ebp)
8010695f:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106962:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106965:	83 c4 1c             	add    $0x1c,%esp
80106968:	5b                   	pop    %ebx
80106969:	5e                   	pop    %esi
8010696a:	5f                   	pop    %edi
8010696b:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
8010696c:	e9 df da ff ff       	jmp    80104450 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106971:	c7 04 24 b1 76 10 80 	movl   $0x801076b1,(%esp)
80106978:	e8 e3 99 ff ff       	call   80100360 <panic>
8010697d:	8d 76 00             	lea    0x0(%esi),%esi

80106980 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106980:	55                   	push   %ebp
80106981:	89 e5                	mov    %esp,%ebp
80106983:	57                   	push   %edi
80106984:	56                   	push   %esi
80106985:	53                   	push   %ebx
80106986:	83 ec 1c             	sub    $0x1c,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106989:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106990:	0f 85 98 00 00 00    	jne    80106a2e <loaduvm+0xae>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106996:	8b 75 18             	mov    0x18(%ebp),%esi
80106999:	31 db                	xor    %ebx,%ebx
8010699b:	85 f6                	test   %esi,%esi
8010699d:	75 1a                	jne    801069b9 <loaduvm+0x39>
8010699f:	eb 77                	jmp    80106a18 <loaduvm+0x98>
801069a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069a8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801069ae:	81 ee 00 10 00 00    	sub    $0x1000,%esi
801069b4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
801069b7:	76 5f                	jbe    80106a18 <loaduvm+0x98>
801069b9:	8b 55 0c             	mov    0xc(%ebp),%edx
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
801069bc:	31 c9                	xor    %ecx,%ecx
801069be:	8b 45 08             	mov    0x8(%ebp),%eax
801069c1:	01 da                	add    %ebx,%edx
801069c3:	e8 b8 fa ff ff       	call   80106480 <walkpgdir>
801069c8:	85 c0                	test   %eax,%eax
801069ca:	74 56                	je     80106a22 <loaduvm+0xa2>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
801069cc:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
801069ce:	bf 00 10 00 00       	mov    $0x1000,%edi
801069d3:	8b 4d 14             	mov    0x14(%ebp),%ecx
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
801069d6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
801069db:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
801069e1:	0f 42 fe             	cmovb  %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
801069e4:	05 00 00 00 80       	add    $0x80000000,%eax
801069e9:	89 44 24 04          	mov    %eax,0x4(%esp)
801069ed:	8b 45 10             	mov    0x10(%ebp),%eax
801069f0:	01 d9                	add    %ebx,%ecx
801069f2:	89 7c 24 0c          	mov    %edi,0xc(%esp)
801069f6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
801069fa:	89 04 24             	mov    %eax,(%esp)
801069fd:	e8 3e af ff ff       	call   80101940 <readi>
80106a02:	39 f8                	cmp    %edi,%eax
80106a04:	74 a2                	je     801069a8 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106a06:	83 c4 1c             	add    $0x1c,%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106a09:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106a0e:	5b                   	pop    %ebx
80106a0f:	5e                   	pop    %esi
80106a10:	5f                   	pop    %edi
80106a11:	5d                   	pop    %ebp
80106a12:	c3                   	ret    
80106a13:	90                   	nop
80106a14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106a18:	83 c4 1c             	add    $0x1c,%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106a1b:	31 c0                	xor    %eax,%eax
}
80106a1d:	5b                   	pop    %ebx
80106a1e:	5e                   	pop    %esi
80106a1f:	5f                   	pop    %edi
80106a20:	5d                   	pop    %ebp
80106a21:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106a22:	c7 04 24 cb 76 10 80 	movl   $0x801076cb,(%esp)
80106a29:	e8 32 99 ff ff       	call   80100360 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106a2e:	c7 04 24 6c 77 10 80 	movl   $0x8010776c,(%esp)
80106a35:	e8 26 99 ff ff       	call   80100360 <panic>
80106a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106a40 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106a40:	55                   	push   %ebp
80106a41:	89 e5                	mov    %esp,%ebp
80106a43:	57                   	push   %edi
80106a44:	56                   	push   %esi
80106a45:	53                   	push   %ebx
80106a46:	83 ec 1c             	sub    $0x1c,%esp
80106a49:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106a4c:	85 ff                	test   %edi,%edi
80106a4e:	0f 88 7e 00 00 00    	js     80106ad2 <allocuvm+0x92>
    return 0;
  if(newsz < oldsz)
80106a54:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106a57:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106a5a:	72 78                	jb     80106ad4 <allocuvm+0x94>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106a5c:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106a62:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106a68:	39 df                	cmp    %ebx,%edi
80106a6a:	77 4a                	ja     80106ab6 <allocuvm+0x76>
80106a6c:	eb 72                	jmp    80106ae0 <allocuvm+0xa0>
80106a6e:	66 90                	xchg   %ax,%ax
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106a70:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106a77:	00 
80106a78:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106a7f:	00 
80106a80:	89 04 24             	mov    %eax,(%esp)
80106a83:	e8 18 d9 ff ff       	call   801043a0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106a88:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106a8e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106a93:	89 04 24             	mov    %eax,(%esp)
80106a96:	8b 45 08             	mov    0x8(%ebp),%eax
80106a99:	89 da                	mov    %ebx,%edx
80106a9b:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
80106aa2:	00 
80106aa3:	e8 68 fa ff ff       	call   80106510 <mappages>
80106aa8:	85 c0                	test   %eax,%eax
80106aaa:	78 44                	js     80106af0 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106aac:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ab2:	39 df                	cmp    %ebx,%edi
80106ab4:	76 2a                	jbe    80106ae0 <allocuvm+0xa0>
    mem = kalloc();
80106ab6:	e8 e5 b9 ff ff       	call   801024a0 <kalloc>
    if(mem == 0){
80106abb:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106abd:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106abf:	75 af                	jne    80106a70 <allocuvm+0x30>
      cprintf("allocuvm out of memory\n");
80106ac1:	c7 04 24 e9 76 10 80 	movl   $0x801076e9,(%esp)
80106ac8:	e8 83 9b ff ff       	call   80100650 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106acd:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106ad0:	77 48                	ja     80106b1a <allocuvm+0xda>
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106ad2:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106ad4:	83 c4 1c             	add    $0x1c,%esp
80106ad7:	5b                   	pop    %ebx
80106ad8:	5e                   	pop    %esi
80106ad9:	5f                   	pop    %edi
80106ada:	5d                   	pop    %ebp
80106adb:	c3                   	ret    
80106adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106ae0:	83 c4 1c             	add    $0x1c,%esp
80106ae3:	89 f8                	mov    %edi,%eax
80106ae5:	5b                   	pop    %ebx
80106ae6:	5e                   	pop    %esi
80106ae7:	5f                   	pop    %edi
80106ae8:	5d                   	pop    %ebp
80106ae9:	c3                   	ret    
80106aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106af0:	c7 04 24 01 77 10 80 	movl   $0x80107701,(%esp)
80106af7:	e8 54 9b ff ff       	call   80100650 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106afc:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106aff:	76 0d                	jbe    80106b0e <allocuvm+0xce>
80106b01:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106b04:	89 fa                	mov    %edi,%edx
80106b06:	8b 45 08             	mov    0x8(%ebp),%eax
80106b09:	e8 82 fa ff ff       	call   80106590 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106b0e:	89 34 24             	mov    %esi,(%esp)
80106b11:	e8 da b7 ff ff       	call   801022f0 <kfree>
      return 0;
80106b16:	31 c0                	xor    %eax,%eax
80106b18:	eb ba                	jmp    80106ad4 <allocuvm+0x94>
80106b1a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106b1d:	89 fa                	mov    %edi,%edx
80106b1f:	8b 45 08             	mov    0x8(%ebp),%eax
80106b22:	e8 69 fa ff ff       	call   80106590 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106b27:	31 c0                	xor    %eax,%eax
80106b29:	eb a9                	jmp    80106ad4 <allocuvm+0x94>
80106b2b:	90                   	nop
80106b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106b30 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106b30:	55                   	push   %ebp
80106b31:	89 e5                	mov    %esp,%ebp
80106b33:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b36:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106b39:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106b3c:	39 d1                	cmp    %edx,%ecx
80106b3e:	73 08                	jae    80106b48 <deallocuvm+0x18>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106b40:	5d                   	pop    %ebp
80106b41:	e9 4a fa ff ff       	jmp    80106590 <deallocuvm.part.0>
80106b46:	66 90                	xchg   %ax,%ax
80106b48:	89 d0                	mov    %edx,%eax
80106b4a:	5d                   	pop    %ebp
80106b4b:	c3                   	ret    
80106b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106b50 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106b50:	55                   	push   %ebp
80106b51:	89 e5                	mov    %esp,%ebp
80106b53:	56                   	push   %esi
80106b54:	53                   	push   %ebx
80106b55:	83 ec 10             	sub    $0x10,%esp
80106b58:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106b5b:	85 f6                	test   %esi,%esi
80106b5d:	74 59                	je     80106bb8 <freevm+0x68>
80106b5f:	31 c9                	xor    %ecx,%ecx
80106b61:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106b66:	89 f0                	mov    %esi,%eax
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106b68:	31 db                	xor    %ebx,%ebx
80106b6a:	e8 21 fa ff ff       	call   80106590 <deallocuvm.part.0>
80106b6f:	eb 12                	jmp    80106b83 <freevm+0x33>
80106b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b78:	83 c3 01             	add    $0x1,%ebx
80106b7b:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80106b81:	74 27                	je     80106baa <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106b83:	8b 14 9e             	mov    (%esi,%ebx,4),%edx
80106b86:	f6 c2 01             	test   $0x1,%dl
80106b89:	74 ed                	je     80106b78 <freevm+0x28>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106b8b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106b91:	83 c3 01             	add    $0x1,%ebx
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106b94:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
80106b9a:	89 14 24             	mov    %edx,(%esp)
80106b9d:	e8 4e b7 ff ff       	call   801022f0 <kfree>
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106ba2:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80106ba8:	75 d9                	jne    80106b83 <freevm+0x33>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106baa:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106bad:	83 c4 10             	add    $0x10,%esp
80106bb0:	5b                   	pop    %ebx
80106bb1:	5e                   	pop    %esi
80106bb2:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106bb3:	e9 38 b7 ff ff       	jmp    801022f0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106bb8:	c7 04 24 1d 77 10 80 	movl   $0x8010771d,(%esp)
80106bbf:	e8 9c 97 ff ff       	call   80100360 <panic>
80106bc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106bd0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106bd0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106bd1:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106bd3:	89 e5                	mov    %esp,%ebp
80106bd5:	83 ec 18             	sub    $0x18,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106bd8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106bdb:	8b 45 08             	mov    0x8(%ebp),%eax
80106bde:	e8 9d f8 ff ff       	call   80106480 <walkpgdir>
  if(pte == 0)
80106be3:	85 c0                	test   %eax,%eax
80106be5:	74 05                	je     80106bec <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106be7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106bea:	c9                   	leave  
80106beb:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106bec:	c7 04 24 2e 77 10 80 	movl   $0x8010772e,(%esp)
80106bf3:	e8 68 97 ff ff       	call   80100360 <panic>
80106bf8:	90                   	nop
80106bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106c00 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106c00:	55                   	push   %ebp
80106c01:	89 e5                	mov    %esp,%ebp
80106c03:	57                   	push   %edi
80106c04:	56                   	push   %esi
80106c05:	53                   	push   %ebx
80106c06:	83 ec 2c             	sub    $0x2c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106c09:	e8 62 fb ff ff       	call   80106770 <setupkvm>
80106c0e:	85 c0                	test   %eax,%eax
80106c10:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106c13:	0f 84 b2 00 00 00    	je     80106ccb <copyuvm+0xcb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106c19:	8b 45 0c             	mov    0xc(%ebp),%eax
80106c1c:	85 c0                	test   %eax,%eax
80106c1e:	0f 84 9c 00 00 00    	je     80106cc0 <copyuvm+0xc0>
80106c24:	31 db                	xor    %ebx,%ebx
80106c26:	eb 48                	jmp    80106c70 <copyuvm+0x70>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106c28:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106c2e:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106c35:	00 
80106c36:	89 7c 24 04          	mov    %edi,0x4(%esp)
80106c3a:	89 04 24             	mov    %eax,(%esp)
80106c3d:	e8 0e d8 ff ff       	call   80104450 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80106c42:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106c45:	8d 96 00 00 00 80    	lea    -0x80000000(%esi),%edx
80106c4b:	89 14 24             	mov    %edx,(%esp)
80106c4e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c53:	89 da                	mov    %ebx,%edx
80106c55:	89 44 24 04          	mov    %eax,0x4(%esp)
80106c59:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106c5c:	e8 af f8 ff ff       	call   80106510 <mappages>
80106c61:	85 c0                	test   %eax,%eax
80106c63:	78 41                	js     80106ca6 <copyuvm+0xa6>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106c65:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c6b:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
80106c6e:	76 50                	jbe    80106cc0 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106c70:	8b 45 08             	mov    0x8(%ebp),%eax
80106c73:	31 c9                	xor    %ecx,%ecx
80106c75:	89 da                	mov    %ebx,%edx
80106c77:	e8 04 f8 ff ff       	call   80106480 <walkpgdir>
80106c7c:	85 c0                	test   %eax,%eax
80106c7e:	74 5b                	je     80106cdb <copyuvm+0xdb>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106c80:	8b 30                	mov    (%eax),%esi
80106c82:	f7 c6 01 00 00 00    	test   $0x1,%esi
80106c88:	74 45                	je     80106ccf <copyuvm+0xcf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106c8a:	89 f7                	mov    %esi,%edi
    flags = PTE_FLAGS(*pte);
80106c8c:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
80106c92:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106c95:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
80106c9b:	e8 00 b8 ff ff       	call   801024a0 <kalloc>
80106ca0:	85 c0                	test   %eax,%eax
80106ca2:	89 c6                	mov    %eax,%esi
80106ca4:	75 82                	jne    80106c28 <copyuvm+0x28>
      goto bad;
  }
  return d;

bad:
  freevm(d);
80106ca6:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106ca9:	89 04 24             	mov    %eax,(%esp)
80106cac:	e8 9f fe ff ff       	call   80106b50 <freevm>
  return 0;
80106cb1:	31 c0                	xor    %eax,%eax
}
80106cb3:	83 c4 2c             	add    $0x2c,%esp
80106cb6:	5b                   	pop    %ebx
80106cb7:	5e                   	pop    %esi
80106cb8:	5f                   	pop    %edi
80106cb9:	5d                   	pop    %ebp
80106cba:	c3                   	ret    
80106cbb:	90                   	nop
80106cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106cc0:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106cc3:	83 c4 2c             	add    $0x2c,%esp
80106cc6:	5b                   	pop    %ebx
80106cc7:	5e                   	pop    %esi
80106cc8:	5f                   	pop    %edi
80106cc9:	5d                   	pop    %ebp
80106cca:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106ccb:	31 c0                	xor    %eax,%eax
80106ccd:	eb e4                	jmp    80106cb3 <copyuvm+0xb3>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106ccf:	c7 04 24 52 77 10 80 	movl   $0x80107752,(%esp)
80106cd6:	e8 85 96 ff ff       	call   80100360 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106cdb:	c7 04 24 38 77 10 80 	movl   $0x80107738,(%esp)
80106ce2:	e8 79 96 ff ff       	call   80100360 <panic>
80106ce7:	89 f6                	mov    %esi,%esi
80106ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cf0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106cf0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106cf1:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106cf3:	89 e5                	mov    %esp,%ebp
80106cf5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106cf8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106cfb:	8b 45 08             	mov    0x8(%ebp),%eax
80106cfe:	e8 7d f7 ff ff       	call   80106480 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106d03:	8b 00                	mov    (%eax),%eax
80106d05:	89 c2                	mov    %eax,%edx
80106d07:	83 e2 05             	and    $0x5,%edx
    return 0;
  if((*pte & PTE_U) == 0)
80106d0a:	83 fa 05             	cmp    $0x5,%edx
80106d0d:	75 11                	jne    80106d20 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106d0f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d14:	05 00 00 00 80       	add    $0x80000000,%eax
}
80106d19:	c9                   	leave  
80106d1a:	c3                   	ret    
80106d1b:	90                   	nop
80106d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80106d20:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80106d22:	c9                   	leave  
80106d23:	c3                   	ret    
80106d24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106d30 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106d30:	55                   	push   %ebp
80106d31:	89 e5                	mov    %esp,%ebp
80106d33:	57                   	push   %edi
80106d34:	56                   	push   %esi
80106d35:	53                   	push   %ebx
80106d36:	83 ec 1c             	sub    $0x1c,%esp
80106d39:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106d3c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106d3f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106d42:	85 db                	test   %ebx,%ebx
80106d44:	75 3a                	jne    80106d80 <copyout+0x50>
80106d46:	eb 68                	jmp    80106db0 <copyout+0x80>
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106d48:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106d4b:	89 f2                	mov    %esi,%edx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106d4d:	89 7c 24 04          	mov    %edi,0x4(%esp)
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106d51:	29 ca                	sub    %ecx,%edx
80106d53:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106d59:	39 da                	cmp    %ebx,%edx
80106d5b:	0f 47 d3             	cmova  %ebx,%edx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106d5e:	29 f1                	sub    %esi,%ecx
80106d60:	01 c8                	add    %ecx,%eax
80106d62:	89 54 24 08          	mov    %edx,0x8(%esp)
80106d66:	89 04 24             	mov    %eax,(%esp)
80106d69:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106d6c:	e8 df d6 ff ff       	call   80104450 <memmove>
    len -= n;
    buf += n;
80106d71:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    va = va0 + PGSIZE;
80106d74:	8d 8e 00 10 00 00    	lea    0x1000(%esi),%ecx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80106d7a:	01 d7                	add    %edx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106d7c:	29 d3                	sub    %edx,%ebx
80106d7e:	74 30                	je     80106db0 <copyout+0x80>
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
80106d80:	8b 45 08             	mov    0x8(%ebp),%eax
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
80106d83:	89 ce                	mov    %ecx,%esi
80106d85:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106d8b:	89 74 24 04          	mov    %esi,0x4(%esp)
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
80106d8f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    pa0 = uva2ka(pgdir, (char*)va0);
80106d92:	89 04 24             	mov    %eax,(%esp)
80106d95:	e8 56 ff ff ff       	call   80106cf0 <uva2ka>
    if(pa0 == 0)
80106d9a:	85 c0                	test   %eax,%eax
80106d9c:	75 aa                	jne    80106d48 <copyout+0x18>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106d9e:	83 c4 1c             	add    $0x1c,%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80106da1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106da6:	5b                   	pop    %ebx
80106da7:	5e                   	pop    %esi
80106da8:	5f                   	pop    %edi
80106da9:	5d                   	pop    %ebp
80106daa:	c3                   	ret    
80106dab:	90                   	nop
80106dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106db0:	83 c4 1c             	add    $0x1c,%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
80106db3:	31 c0                	xor    %eax,%eax
}
80106db5:	5b                   	pop    %ebx
80106db6:	5e                   	pop    %esi
80106db7:	5f                   	pop    %edi
80106db8:	5d                   	pop    %ebp
80106db9:	c3                   	ret    
