
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
8010002d:	b8 60 2e 10 80       	mov    $0x80102e60,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 14             	sub    $0x14,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	c7 44 24 04 e0 6f 10 	movl   $0x80106fe0,0x4(%esp)
80100053:	80 
80100054:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010005b:	e8 f0 42 00 00       	call   80104350 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
80100060:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx

  initlock(&bcache.lock, "bcache");

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
80100065:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
8010006c:	fc 10 80 
  bcache.head.next = &bcache.head;
8010006f:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
80100076:	fc 10 80 
80100079:	eb 09                	jmp    80100084 <binit+0x44>
8010007b:	90                   	nop
8010007c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 da                	mov    %ebx,%edx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100082:	89 c3                	mov    %eax,%ebx
80100084:	8d 43 0c             	lea    0xc(%ebx),%eax
    b->next = bcache.head.next;
80100087:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008a:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100091:	89 04 24             	mov    %eax,(%esp)
80100094:	c7 44 24 04 e7 6f 10 	movl   $0x80106fe7,0x4(%esp)
8010009b:	80 
8010009c:	e8 9f 41 00 00       	call   80104240 <initsleeplock>
    bcache.head.next->prev = b;
801000a1:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
801000a6:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a9:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000af:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b4:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000ba:	75 c4                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bc:	83 c4 14             	add    $0x14,%esp
801000bf:	5b                   	pop    %ebx
801000c0:	5d                   	pop    %ebp
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 1c             	sub    $0x1c,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000dc:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000e3:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000e6:	e8 e5 42 00 00       	call   801043d0 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000eb:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000f1:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f7:	75 12                	jne    8010010b <bread+0x3b>
801000f9:	eb 25                	jmp    80100120 <bread+0x50>
801000fb:	90                   	nop
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle some unused buffer and clean buffer
  // "clean" because B_DIRTY and not locked means log.c
  // hasn't yet committed the changes to the buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 58                	jmp    80100188 <bread+0xb8>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 4d                	je     80100188 <bread+0xb8>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100161:	e8 9a 43 00 00       	call   80104500 <release>
      acquiresleep(&b->lock);
80100166:	8d 43 0c             	lea    0xc(%ebx),%eax
80100169:	89 04 24             	mov    %eax,(%esp)
8010016c:	e8 0f 41 00 00       	call   80104280 <acquiresleep>
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if(!(b->flags & B_VALID)) {
80100171:	f6 03 02             	testb  $0x2,(%ebx)
80100174:	75 08                	jne    8010017e <bread+0xae>
    iderw(b);
80100176:	89 1c 24             	mov    %ebx,(%esp)
80100179:	e8 a2 1f 00 00       	call   80102120 <iderw>
  }
  return b;
}
8010017e:	83 c4 1c             	add    $0x1c,%esp
80100181:	89 d8                	mov    %ebx,%eax
80100183:	5b                   	pop    %ebx
80100184:	5e                   	pop    %esi
80100185:	5f                   	pop    %edi
80100186:	5d                   	pop    %ebp
80100187:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100188:	c7 04 24 ee 6f 10 80 	movl   $0x80106fee,(%esp)
8010018f:	e8 cc 01 00 00       	call   80100360 <panic>
80100194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010019a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 14             	sub    $0x14,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	89 04 24             	mov    %eax,(%esp)
801001b0:	e8 6b 41 00 00       	call   80104320 <holdingsleep>
801001b5:	85 c0                	test   %eax,%eax
801001b7:	74 10                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001b9:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bc:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001bf:	83 c4 14             	add    $0x14,%esp
801001c2:	5b                   	pop    %ebx
801001c3:	5d                   	pop    %ebp
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 57 1f 00 00       	jmp    80102120 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	c7 04 24 ff 6f 10 80 	movl   $0x80106fff,(%esp)
801001d0:	e8 8b 01 00 00       	call   80100360 <panic>
801001d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	83 ec 10             	sub    $0x10,%esp
801001e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	89 34 24             	mov    %esi,(%esp)
801001f1:	e8 2a 41 00 00       	call   80104320 <holdingsleep>
801001f6:	85 c0                	test   %eax,%eax
801001f8:	74 5b                	je     80100255 <brelse+0x75>
    panic("brelse");

  releasesleep(&b->lock);
801001fa:	89 34 24             	mov    %esi,(%esp)
801001fd:	e8 de 40 00 00       	call   801042e0 <releasesleep>

  acquire(&bcache.lock);
80100202:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100209:	e8 c2 41 00 00       	call   801043d0 <acquire>
  b->refcnt--;
  if (b->refcnt == 0) {
8010020e:	83 6b 4c 01          	subl   $0x1,0x4c(%ebx)
80100212:	75 2f                	jne    80100243 <brelse+0x63>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100214:	8b 43 54             	mov    0x54(%ebx),%eax
80100217:	8b 53 50             	mov    0x50(%ebx),%edx
8010021a:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
8010021d:	8b 43 50             	mov    0x50(%ebx),%eax
80100220:	8b 53 54             	mov    0x54(%ebx),%edx
80100223:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100226:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
    b->prev = &bcache.head;
8010022b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
80100232:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100235:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
8010023a:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
8010023d:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
  }
  
  release(&bcache.lock);
80100243:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
}
8010024a:	83 c4 10             	add    $0x10,%esp
8010024d:	5b                   	pop    %ebx
8010024e:	5e                   	pop    %esi
8010024f:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
80100250:	e9 ab 42 00 00       	jmp    80104500 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100255:	c7 04 24 06 70 10 80 	movl   $0x80107006,(%esp)
8010025c:	e8 ff 00 00 00       	call   80100360 <panic>
80100261:	66 90                	xchg   %ax,%ax
80100263:	66 90                	xchg   %ax,%ax
80100265:	66 90                	xchg   %ax,%ax
80100267:	66 90                	xchg   %ax,%ax
80100269:	66 90                	xchg   %ax,%ax
8010026b:	66 90                	xchg   %ax,%ax
8010026d:	66 90                	xchg   %ax,%ax
8010026f:	90                   	nop

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
80100282:	e8 09 15 00 00       	call   80101790 <iunlock>
  target = n;
  acquire(&cons.lock);
80100287:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028e:	e8 3d 41 00 00       	call   801043d0 <acquire>
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
801002c4:	e8 07 3c 00 00       	call   80103ed0 <sleep>

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
80100312:	e8 e9 41 00 00       	call   80104500 <release>
  ilock(ip);
80100317:	89 3c 24             	mov    %edi,(%esp)
8010031a:	e8 a1 13 00 00       	call   801016c0 <ilock>
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
8010032f:	e8 cc 41 00 00       	call   80104500 <release>
        ilock(ip);
80100334:	89 3c 24             	mov    %edi,(%esp)
80100337:	e8 84 13 00 00       	call   801016c0 <ilock>
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
80100382:	c7 04 24 0d 70 10 80 	movl   $0x8010700d,(%esp)
80100389:	89 44 24 04          	mov    %eax,0x4(%esp)
8010038d:	e8 be 02 00 00       	call   80100650 <cprintf>
  cprintf(s);
80100392:	8b 45 08             	mov    0x8(%ebp),%eax
80100395:	89 04 24             	mov    %eax,(%esp)
80100398:	e8 b3 02 00 00       	call   80100650 <cprintf>
  cprintf("\n");
8010039d:	c7 04 24 06 75 10 80 	movl   $0x80107506,(%esp)
801003a4:	e8 a7 02 00 00       	call   80100650 <cprintf>
  getcallerpcs(&s, pcs);
801003a9:	8d 45 08             	lea    0x8(%ebp),%eax
801003ac:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801003b0:	89 04 24             	mov    %eax,(%esp)
801003b3:	e8 b8 3f 00 00       	call   80104370 <getcallerpcs>
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003b8:	8b 03                	mov    (%ebx),%eax
801003ba:	83 c3 04             	add    $0x4,%ebx
801003bd:	c7 04 24 29 70 10 80 	movl   $0x80107029,(%esp)
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
80100409:	e8 f2 56 00 00       	call   80105b00 <uartputc>
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
801004b9:	e8 42 56 00 00       	call   80105b00 <uartputc>
801004be:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004c5:	e8 36 56 00 00       	call   80105b00 <uartputc>
801004ca:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004d1:	e8 2a 56 00 00       	call   80105b00 <uartputc>
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
801004fc:	e8 ff 40 00 00       	call   80104600 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100501:	b8 d0 07 00 00       	mov    $0x7d0,%eax
80100506:	29 f8                	sub    %edi,%eax
80100508:	01 c0                	add    %eax,%eax
8010050a:	89 34 24             	mov    %esi,(%esp)
8010050d:	89 44 24 08          	mov    %eax,0x8(%esp)
80100511:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100518:	00 
80100519:	e8 32 40 00 00       	call   80104550 <memset>
8010051e:	89 f1                	mov    %esi,%ecx
80100520:	be 07 00 00 00       	mov    $0x7,%esi
80100525:	e9 59 ff ff ff       	jmp    80100483 <consputc+0xa3>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010052a:	c7 04 24 2d 70 10 80 	movl   $0x8010702d,(%esp)
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
80100599:	0f b6 92 58 70 10 80 	movzbl -0x7fef8fa8(%edx),%edx
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
80100602:	e8 89 11 00 00       	call   80101790 <iunlock>
  acquire(&cons.lock);
80100607:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010060e:	e8 bd 3d 00 00       	call   801043d0 <acquire>
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
80100636:	e8 c5 3e 00 00       	call   80104500 <release>
  ilock(ip);
8010063b:	8b 45 08             	mov    0x8(%ebp),%eax
8010063e:	89 04 24             	mov    %eax,(%esp)
80100641:	e8 7a 10 00 00       	call   801016c0 <ilock>

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
801006f3:	e8 08 3e 00 00       	call   80104500 <release>
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
80100760:	b8 40 70 10 80       	mov    $0x80107040,%eax
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
80100797:	e8 34 3c 00 00       	call   801043d0 <acquire>
8010079c:	e9 c8 fe ff ff       	jmp    80100669 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007a1:	c7 04 24 47 70 10 80 	movl   $0x80107047,(%esp)
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
801007c5:	e8 06 3c 00 00       	call   801043d0 <acquire>
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
80100827:	e8 d4 3c 00 00       	call   80104500 <release>
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
801008b2:	e8 c9 37 00 00       	call   80104080 <wakeup>
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
80100927:	e9 44 38 00 00       	jmp    80104170 <procdump>
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
80100956:	c7 44 24 04 50 70 10 	movl   $0x80107050,0x4(%esp)
8010095d:	80 
8010095e:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100965:	e8 e6 39 00 00       	call   80104350 <initlock>

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
8010098f:	e8 6c 28 00 00       	call   80103200 <picenable>
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
801009c7:	e8 24 15 00 00       	call   80101ef0 <namei>
801009cc:	85 c0                	test   %eax,%eax
801009ce:	89 c3                	mov    %eax,%ebx
801009d0:	74 37                	je     80100a09 <exec+0x59>
    end_op();
    return -1;
  }
  ilock(ip);
801009d2:	89 04 24             	mov    %eax,(%esp)
801009d5:	e8 e6 0c 00 00       	call   801016c0 <ilock>
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
801009f7:	e8 54 0f 00 00       	call   80101950 <readi>
801009fc:	83 f8 34             	cmp    $0x34,%eax
801009ff:	74 1f                	je     80100a20 <exec+0x70>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a01:	89 1c 24             	mov    %ebx,(%esp)
80100a04:	e8 f7 0e 00 00       	call   80101900 <iunlockput>
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
80100a2c:	e8 4f 5f 00 00       	call   80106980 <setupkvm>
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
80100a8e:	e8 bd 0e 00 00       	call   80101950 <readi>
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
80100ad2:	e8 79 61 00 00       	call   80106c50 <allocuvm>
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
80100b13:	e8 78 60 00 00       	call   80106b90 <loaduvm>
80100b18:	85 c0                	test   %eax,%eax
80100b1a:	0f 89 40 ff ff ff    	jns    80100a60 <exec+0xb0>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b20:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b26:	89 04 24             	mov    %eax,(%esp)
80100b29:	e8 32 62 00 00       	call   80106d60 <freevm>
80100b2e:	e9 ce fe ff ff       	jmp    80100a01 <exec+0x51>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b33:	89 1c 24             	mov    %ebx,(%esp)
80100b36:	e8 c5 0d 00 00       	call   80101900 <iunlockput>
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
80100b6c:	e8 df 60 00 00       	call   80106c50 <allocuvm>
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
80100b84:	e8 d7 61 00 00       	call   80106d60 <freevm>
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
80100bad:	e8 2e 62 00 00       	call   80106de0 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bb2:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bb5:	8b 00                	mov    (%eax),%eax
80100bb7:	85 c0                	test   %eax,%eax
80100bb9:	0f 84 70 01 00 00    	je     80100d2f <exec+0x37f>
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
80100be9:	e8 a2 3b 00 00       	call   80104790 <strlen>
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
80100bfa:	e8 91 3b 00 00       	call   80104790 <strlen>
80100bff:	83 c0 01             	add    $0x1,%eax
80100c02:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c06:	8b 06                	mov    (%esi),%eax
80100c08:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100c0c:	89 44 24 08          	mov    %eax,0x8(%esp)
80100c10:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100c16:	89 04 24             	mov    %eax,(%esp)
80100c19:	e8 22 63 00 00       	call   80106f40 <copyout>
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
80100c8c:	e8 af 62 00 00       	call   80106f40 <copyout>
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
80100cd7:	e8 74 3a 00 00       	call   80104750 <safestrcpy>

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
  proc -> length_of_job =2 ;  ///sanidhya has added it
80100d0e:	c7 80 8c 00 00 00 02 	movl   $0x2,0x8c(%eax)
80100d15:	00 00 00 
  switchuvm(proc);
80100d18:	89 04 24             	mov    %eax,(%esp)
80100d1b:	e8 20 5d 00 00       	call   80106a40 <switchuvm>
  freevm(oldpgdir);
80100d20:	89 34 24             	mov    %esi,(%esp)
80100d23:	e8 38 60 00 00       	call   80106d60 <freevm>
  return 0;
80100d28:	31 c0                	xor    %eax,%eax
80100d2a:	e9 e4 fc ff ff       	jmp    80100a13 <exec+0x63>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100d2f:	8b 9d ec fe ff ff    	mov    -0x114(%ebp),%ebx
80100d35:	31 f6                	xor    %esi,%esi
80100d37:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100d3d:	e9 04 ff ff ff       	jmp    80100c46 <exec+0x296>
80100d42:	66 90                	xchg   %ax,%ax
80100d44:	66 90                	xchg   %ax,%ax
80100d46:	66 90                	xchg   %ax,%ax
80100d48:	66 90                	xchg   %ax,%ax
80100d4a:	66 90                	xchg   %ax,%ax
80100d4c:	66 90                	xchg   %ax,%ax
80100d4e:	66 90                	xchg   %ax,%ax

80100d50 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	83 ec 18             	sub    $0x18,%esp
  initlock(&ftable.lock, "ftable");
80100d56:	c7 44 24 04 69 70 10 	movl   $0x80107069,0x4(%esp)
80100d5d:	80 
80100d5e:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100d65:	e8 e6 35 00 00       	call   80104350 <initlock>
}
80100d6a:	c9                   	leave  
80100d6b:	c3                   	ret    
80100d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100d70 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d70:	55                   	push   %ebp
80100d71:	89 e5                	mov    %esp,%ebp
80100d73:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d74:	bb 14 00 11 80       	mov    $0x80110014,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d79:	83 ec 14             	sub    $0x14,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d7c:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100d83:	e8 48 36 00 00       	call   801043d0 <acquire>
80100d88:	eb 11                	jmp    80100d9b <filealloc+0x2b>
80100d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d90:	83 c3 18             	add    $0x18,%ebx
80100d93:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100d99:	74 25                	je     80100dc0 <filealloc+0x50>
    if(f->ref == 0){
80100d9b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d9e:	85 c0                	test   %eax,%eax
80100da0:	75 ee                	jne    80100d90 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100da2:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100da9:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100db0:	e8 4b 37 00 00       	call   80104500 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100db5:	83 c4 14             	add    $0x14,%esp
  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
      release(&ftable.lock);
      return f;
80100db8:	89 d8                	mov    %ebx,%eax
    }
  }
  release(&ftable.lock);
  return 0;
}
80100dba:	5b                   	pop    %ebx
80100dbb:	5d                   	pop    %ebp
80100dbc:	c3                   	ret    
80100dbd:	8d 76 00             	lea    0x0(%esi),%esi
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100dc0:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100dc7:	e8 34 37 00 00       	call   80104500 <release>
  return 0;
}
80100dcc:	83 c4 14             	add    $0x14,%esp
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
80100dcf:	31 c0                	xor    %eax,%eax
}
80100dd1:	5b                   	pop    %ebx
80100dd2:	5d                   	pop    %ebp
80100dd3:	c3                   	ret    
80100dd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100dda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100de0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100de0:	55                   	push   %ebp
80100de1:	89 e5                	mov    %esp,%ebp
80100de3:	53                   	push   %ebx
80100de4:	83 ec 14             	sub    $0x14,%esp
80100de7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dea:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100df1:	e8 da 35 00 00       	call   801043d0 <acquire>
  if(f->ref < 1)
80100df6:	8b 43 04             	mov    0x4(%ebx),%eax
80100df9:	85 c0                	test   %eax,%eax
80100dfb:	7e 1a                	jle    80100e17 <filedup+0x37>
    panic("filedup");
  f->ref++;
80100dfd:	83 c0 01             	add    $0x1,%eax
80100e00:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e03:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100e0a:	e8 f1 36 00 00       	call   80104500 <release>
  return f;
}
80100e0f:	83 c4 14             	add    $0x14,%esp
80100e12:	89 d8                	mov    %ebx,%eax
80100e14:	5b                   	pop    %ebx
80100e15:	5d                   	pop    %ebp
80100e16:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100e17:	c7 04 24 70 70 10 80 	movl   $0x80107070,(%esp)
80100e1e:	e8 3d f5 ff ff       	call   80100360 <panic>
80100e23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e30 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	57                   	push   %edi
80100e34:	56                   	push   %esi
80100e35:	53                   	push   %ebx
80100e36:	83 ec 1c             	sub    $0x1c,%esp
80100e39:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e3c:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100e43:	e8 88 35 00 00       	call   801043d0 <acquire>
  if(f->ref < 1)
80100e48:	8b 57 04             	mov    0x4(%edi),%edx
80100e4b:	85 d2                	test   %edx,%edx
80100e4d:	0f 8e 89 00 00 00    	jle    80100edc <fileclose+0xac>
    panic("fileclose");
  if(--f->ref > 0){
80100e53:	83 ea 01             	sub    $0x1,%edx
80100e56:	85 d2                	test   %edx,%edx
80100e58:	89 57 04             	mov    %edx,0x4(%edi)
80100e5b:	74 13                	je     80100e70 <fileclose+0x40>
    release(&ftable.lock);
80100e5d:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e64:	83 c4 1c             	add    $0x1c,%esp
80100e67:	5b                   	pop    %ebx
80100e68:	5e                   	pop    %esi
80100e69:	5f                   	pop    %edi
80100e6a:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e6b:	e9 90 36 00 00       	jmp    80104500 <release>
    return;
  }
  ff = *f;
80100e70:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e74:	8b 37                	mov    (%edi),%esi
80100e76:	8b 5f 0c             	mov    0xc(%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
80100e79:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e7f:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e82:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e85:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e8c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e8f:	e8 6c 36 00 00       	call   80104500 <release>

  if(ff.type == FD_PIPE)
80100e94:	83 fe 01             	cmp    $0x1,%esi
80100e97:	74 0f                	je     80100ea8 <fileclose+0x78>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100e99:	83 fe 02             	cmp    $0x2,%esi
80100e9c:	74 22                	je     80100ec0 <fileclose+0x90>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e9e:	83 c4 1c             	add    $0x1c,%esp
80100ea1:	5b                   	pop    %ebx
80100ea2:	5e                   	pop    %esi
80100ea3:	5f                   	pop    %edi
80100ea4:	5d                   	pop    %ebp
80100ea5:	c3                   	ret    
80100ea6:	66 90                	xchg   %ax,%ax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100ea8:	0f be 75 e7          	movsbl -0x19(%ebp),%esi
80100eac:	89 1c 24             	mov    %ebx,(%esp)
80100eaf:	89 74 24 04          	mov    %esi,0x4(%esp)
80100eb3:	e8 08 25 00 00       	call   801033c0 <pipeclose>
80100eb8:	eb e4                	jmp    80100e9e <fileclose+0x6e>
80100eba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100ec0:	e8 cb 1c 00 00       	call   80102b90 <begin_op>
    iput(ff.ip);
80100ec5:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100ec8:	89 04 24             	mov    %eax,(%esp)
80100ecb:	e8 00 09 00 00       	call   801017d0 <iput>
    end_op();
  }
}
80100ed0:	83 c4 1c             	add    $0x1c,%esp
80100ed3:	5b                   	pop    %ebx
80100ed4:	5e                   	pop    %esi
80100ed5:	5f                   	pop    %edi
80100ed6:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100ed7:	e9 24 1d 00 00       	jmp    80102c00 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100edc:	c7 04 24 78 70 10 80 	movl   $0x80107078,(%esp)
80100ee3:	e8 78 f4 ff ff       	call   80100360 <panic>
80100ee8:	90                   	nop
80100ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100ef0 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	53                   	push   %ebx
80100ef4:	83 ec 14             	sub    $0x14,%esp
80100ef7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100efa:	83 3b 02             	cmpl   $0x2,(%ebx)
80100efd:	75 31                	jne    80100f30 <filestat+0x40>
    ilock(f->ip);
80100eff:	8b 43 10             	mov    0x10(%ebx),%eax
80100f02:	89 04 24             	mov    %eax,(%esp)
80100f05:	e8 b6 07 00 00       	call   801016c0 <ilock>
    stati(f->ip, st);
80100f0a:	8b 45 0c             	mov    0xc(%ebp),%eax
80100f0d:	89 44 24 04          	mov    %eax,0x4(%esp)
80100f11:	8b 43 10             	mov    0x10(%ebx),%eax
80100f14:	89 04 24             	mov    %eax,(%esp)
80100f17:	e8 04 0a 00 00       	call   80101920 <stati>
    iunlock(f->ip);
80100f1c:	8b 43 10             	mov    0x10(%ebx),%eax
80100f1f:	89 04 24             	mov    %eax,(%esp)
80100f22:	e8 69 08 00 00       	call   80101790 <iunlock>
    return 0;
  }
  return -1;
}
80100f27:	83 c4 14             	add    $0x14,%esp
{
  if(f->type == FD_INODE){
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
80100f2a:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f2c:	5b                   	pop    %ebx
80100f2d:	5d                   	pop    %ebp
80100f2e:	c3                   	ret    
80100f2f:	90                   	nop
80100f30:	83 c4 14             	add    $0x14,%esp
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f38:	5b                   	pop    %ebx
80100f39:	5d                   	pop    %ebp
80100f3a:	c3                   	ret    
80100f3b:	90                   	nop
80100f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f40 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f40:	55                   	push   %ebp
80100f41:	89 e5                	mov    %esp,%ebp
80100f43:	57                   	push   %edi
80100f44:	56                   	push   %esi
80100f45:	53                   	push   %ebx
80100f46:	83 ec 1c             	sub    $0x1c,%esp
80100f49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f4f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f52:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f56:	74 68                	je     80100fc0 <fileread+0x80>
    return -1;
  if(f->type == FD_PIPE)
80100f58:	8b 03                	mov    (%ebx),%eax
80100f5a:	83 f8 01             	cmp    $0x1,%eax
80100f5d:	74 49                	je     80100fa8 <fileread+0x68>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f5f:	83 f8 02             	cmp    $0x2,%eax
80100f62:	75 63                	jne    80100fc7 <fileread+0x87>
    ilock(f->ip);
80100f64:	8b 43 10             	mov    0x10(%ebx),%eax
80100f67:	89 04 24             	mov    %eax,(%esp)
80100f6a:	e8 51 07 00 00       	call   801016c0 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f6f:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80100f73:	8b 43 14             	mov    0x14(%ebx),%eax
80100f76:	89 74 24 04          	mov    %esi,0x4(%esp)
80100f7a:	89 44 24 08          	mov    %eax,0x8(%esp)
80100f7e:	8b 43 10             	mov    0x10(%ebx),%eax
80100f81:	89 04 24             	mov    %eax,(%esp)
80100f84:	e8 c7 09 00 00       	call   80101950 <readi>
80100f89:	85 c0                	test   %eax,%eax
80100f8b:	89 c6                	mov    %eax,%esi
80100f8d:	7e 03                	jle    80100f92 <fileread+0x52>
      f->off += r;
80100f8f:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f92:	8b 43 10             	mov    0x10(%ebx),%eax
80100f95:	89 04 24             	mov    %eax,(%esp)
80100f98:	e8 f3 07 00 00       	call   80101790 <iunlock>
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f9d:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100f9f:	83 c4 1c             	add    $0x1c,%esp
80100fa2:	5b                   	pop    %ebx
80100fa3:	5e                   	pop    %esi
80100fa4:	5f                   	pop    %edi
80100fa5:	5d                   	pop    %ebp
80100fa6:	c3                   	ret    
80100fa7:	90                   	nop
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fa8:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fab:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fae:	83 c4 1c             	add    $0x1c,%esp
80100fb1:	5b                   	pop    %ebx
80100fb2:	5e                   	pop    %esi
80100fb3:	5f                   	pop    %edi
80100fb4:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fb5:	e9 b6 25 00 00       	jmp    80103570 <piperead>
80100fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100fc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fc5:	eb d8                	jmp    80100f9f <fileread+0x5f>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100fc7:	c7 04 24 82 70 10 80 	movl   $0x80107082,(%esp)
80100fce:	e8 8d f3 ff ff       	call   80100360 <panic>
80100fd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100fe0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fe0:	55                   	push   %ebp
80100fe1:	89 e5                	mov    %esp,%ebp
80100fe3:	57                   	push   %edi
80100fe4:	56                   	push   %esi
80100fe5:	53                   	push   %ebx
80100fe6:	83 ec 2c             	sub    $0x2c,%esp
80100fe9:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fec:	8b 7d 08             	mov    0x8(%ebp),%edi
80100fef:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100ff2:	8b 45 10             	mov    0x10(%ebp),%eax
  int r;

  if(f->writable == 0)
80100ff5:	80 7f 09 00          	cmpb   $0x0,0x9(%edi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100ff9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100ffc:	0f 84 ae 00 00 00    	je     801010b0 <filewrite+0xd0>
    return -1;
  if(f->type == FD_PIPE)
80101002:	8b 07                	mov    (%edi),%eax
80101004:	83 f8 01             	cmp    $0x1,%eax
80101007:	0f 84 c2 00 00 00    	je     801010cf <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010100d:	83 f8 02             	cmp    $0x2,%eax
80101010:	0f 85 d7 00 00 00    	jne    801010ed <filewrite+0x10d>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101016:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101019:	31 db                	xor    %ebx,%ebx
8010101b:	85 c0                	test   %eax,%eax
8010101d:	7f 31                	jg     80101050 <filewrite+0x70>
8010101f:	e9 9c 00 00 00       	jmp    801010c0 <filewrite+0xe0>
80101024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
      iunlock(f->ip);
80101028:	8b 4f 10             	mov    0x10(%edi),%ecx
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
8010102b:	01 47 14             	add    %eax,0x14(%edi)
8010102e:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101031:	89 0c 24             	mov    %ecx,(%esp)
80101034:	e8 57 07 00 00       	call   80101790 <iunlock>
      end_op();
80101039:	e8 c2 1b 00 00       	call   80102c00 <end_op>
8010103e:	8b 45 e0             	mov    -0x20(%ebp),%eax

      if(r < 0)
        break;
      if(r != n1)
80101041:	39 f0                	cmp    %esi,%eax
80101043:	0f 85 98 00 00 00    	jne    801010e1 <filewrite+0x101>
        panic("short filewrite");
      i += r;
80101049:	01 c3                	add    %eax,%ebx
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010104b:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
8010104e:	7e 70                	jle    801010c0 <filewrite+0xe0>
      int n1 = n - i;
80101050:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101053:	b8 00 1a 00 00       	mov    $0x1a00,%eax
80101058:	29 de                	sub    %ebx,%esi
8010105a:	81 fe 00 1a 00 00    	cmp    $0x1a00,%esi
80101060:	0f 4f f0             	cmovg  %eax,%esi
      if(n1 > max)
        n1 = max;

      begin_op();
80101063:	e8 28 1b 00 00       	call   80102b90 <begin_op>
      ilock(f->ip);
80101068:	8b 47 10             	mov    0x10(%edi),%eax
8010106b:	89 04 24             	mov    %eax,(%esp)
8010106e:	e8 4d 06 00 00       	call   801016c0 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101073:	89 74 24 0c          	mov    %esi,0xc(%esp)
80101077:	8b 47 14             	mov    0x14(%edi),%eax
8010107a:	89 44 24 08          	mov    %eax,0x8(%esp)
8010107e:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101081:	01 d8                	add    %ebx,%eax
80101083:	89 44 24 04          	mov    %eax,0x4(%esp)
80101087:	8b 47 10             	mov    0x10(%edi),%eax
8010108a:	89 04 24             	mov    %eax,(%esp)
8010108d:	e8 be 09 00 00       	call   80101a50 <writei>
80101092:	85 c0                	test   %eax,%eax
80101094:	7f 92                	jg     80101028 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
80101096:	8b 4f 10             	mov    0x10(%edi),%ecx
80101099:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010109c:	89 0c 24             	mov    %ecx,(%esp)
8010109f:	e8 ec 06 00 00       	call   80101790 <iunlock>
      end_op();
801010a4:	e8 57 1b 00 00       	call   80102c00 <end_op>

      if(r < 0)
801010a9:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010ac:	85 c0                	test   %eax,%eax
801010ae:	74 91                	je     80101041 <filewrite+0x61>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010b0:	83 c4 2c             	add    $0x2c,%esp
filewrite(struct file *f, char *addr, int n)
{
  int r;

  if(f->writable == 0)
    return -1;
801010b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010b8:	5b                   	pop    %ebx
801010b9:	5e                   	pop    %esi
801010ba:	5f                   	pop    %edi
801010bb:	5d                   	pop    %ebp
801010bc:	c3                   	ret    
801010bd:	8d 76 00             	lea    0x0(%esi),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010c0:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
801010c3:	89 d8                	mov    %ebx,%eax
801010c5:	75 e9                	jne    801010b0 <filewrite+0xd0>
  }
  panic("filewrite");
}
801010c7:	83 c4 2c             	add    $0x2c,%esp
801010ca:	5b                   	pop    %ebx
801010cb:	5e                   	pop    %esi
801010cc:	5f                   	pop    %edi
801010cd:	5d                   	pop    %ebp
801010ce:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010cf:	8b 47 0c             	mov    0xc(%edi),%eax
801010d2:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010d5:	83 c4 2c             	add    $0x2c,%esp
801010d8:	5b                   	pop    %ebx
801010d9:	5e                   	pop    %esi
801010da:	5f                   	pop    %edi
801010db:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010dc:	e9 6f 23 00 00       	jmp    80103450 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
801010e1:	c7 04 24 8b 70 10 80 	movl   $0x8010708b,(%esp)
801010e8:	e8 73 f2 ff ff       	call   80100360 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
801010ed:	c7 04 24 91 70 10 80 	movl   $0x80107091,(%esp)
801010f4:	e8 67 f2 ff ff       	call   80100360 <panic>
801010f9:	66 90                	xchg   %ax,%ax
801010fb:	66 90                	xchg   %ax,%ax
801010fd:	66 90                	xchg   %ax,%ax
801010ff:	90                   	nop

80101100 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101100:	55                   	push   %ebp
80101101:	89 e5                	mov    %esp,%ebp
80101103:	57                   	push   %edi
80101104:	56                   	push   %esi
80101105:	53                   	push   %ebx
80101106:	83 ec 2c             	sub    $0x2c,%esp
80101109:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010110c:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101111:	85 c0                	test   %eax,%eax
80101113:	0f 84 8c 00 00 00    	je     801011a5 <balloc+0xa5>
80101119:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101120:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101123:	89 f0                	mov    %esi,%eax
80101125:	c1 f8 0c             	sar    $0xc,%eax
80101128:	03 05 f8 09 11 80    	add    0x801109f8,%eax
8010112e:	89 44 24 04          	mov    %eax,0x4(%esp)
80101132:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101135:	89 04 24             	mov    %eax,(%esp)
80101138:	e8 93 ef ff ff       	call   801000d0 <bread>
8010113d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101140:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101145:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101148:	31 c0                	xor    %eax,%eax
8010114a:	eb 33                	jmp    8010117f <balloc+0x7f>
8010114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101150:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101153:	89 c2                	mov    %eax,%edx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
80101155:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101157:	c1 fa 03             	sar    $0x3,%edx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010115a:	83 e1 07             	and    $0x7,%ecx
8010115d:	bf 01 00 00 00       	mov    $0x1,%edi
80101162:	d3 e7                	shl    %cl,%edi
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101164:	0f b6 5c 13 5c       	movzbl 0x5c(%ebx,%edx,1),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
80101169:	89 f9                	mov    %edi,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010116b:	0f b6 fb             	movzbl %bl,%edi
8010116e:	85 cf                	test   %ecx,%edi
80101170:	74 46                	je     801011b8 <balloc+0xb8>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101172:	83 c0 01             	add    $0x1,%eax
80101175:	83 c6 01             	add    $0x1,%esi
80101178:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010117d:	74 05                	je     80101184 <balloc+0x84>
8010117f:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80101182:	72 cc                	jb     80101150 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80101184:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101187:	89 04 24             	mov    %eax,(%esp)
8010118a:	e8 51 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010118f:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101196:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101199:	3b 05 e0 09 11 80    	cmp    0x801109e0,%eax
8010119f:	0f 82 7b ff ff ff    	jb     80101120 <balloc+0x20>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
801011a5:	c7 04 24 9b 70 10 80 	movl   $0x8010709b,(%esp)
801011ac:	e8 af f1 ff ff       	call   80100360 <panic>
801011b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011b8:	09 d9                	or     %ebx,%ecx
801011ba:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801011bd:	88 4c 13 5c          	mov    %cl,0x5c(%ebx,%edx,1)
        log_write(bp);
801011c1:	89 1c 24             	mov    %ebx,(%esp)
801011c4:	e8 67 1b 00 00       	call   80102d30 <log_write>
        brelse(bp);
801011c9:	89 1c 24             	mov    %ebx,(%esp)
801011cc:	e8 0f f0 ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011d1:	8b 45 d8             	mov    -0x28(%ebp),%eax
801011d4:	89 74 24 04          	mov    %esi,0x4(%esp)
801011d8:	89 04 24             	mov    %eax,(%esp)
801011db:	e8 f0 ee ff ff       	call   801000d0 <bread>
  memset(bp->data, 0, BSIZE);
801011e0:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
801011e7:	00 
801011e8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801011ef:	00 
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011f0:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011f2:	8d 40 5c             	lea    0x5c(%eax),%eax
801011f5:	89 04 24             	mov    %eax,(%esp)
801011f8:	e8 53 33 00 00       	call   80104550 <memset>
  log_write(bp);
801011fd:	89 1c 24             	mov    %ebx,(%esp)
80101200:	e8 2b 1b 00 00       	call   80102d30 <log_write>
  brelse(bp);
80101205:	89 1c 24             	mov    %ebx,(%esp)
80101208:	e8 d3 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
8010120d:	83 c4 2c             	add    $0x2c,%esp
80101210:	89 f0                	mov    %esi,%eax
80101212:	5b                   	pop    %ebx
80101213:	5e                   	pop    %esi
80101214:	5f                   	pop    %edi
80101215:	5d                   	pop    %ebp
80101216:	c3                   	ret    
80101217:	89 f6                	mov    %esi,%esi
80101219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101220 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101220:	55                   	push   %ebp
80101221:	89 e5                	mov    %esp,%ebp
80101223:	57                   	push   %edi
80101224:	89 c7                	mov    %eax,%edi
80101226:	56                   	push   %esi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101227:	31 f6                	xor    %esi,%esi
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101229:	53                   	push   %ebx

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010122a:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010122f:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101232:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101239:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
8010123c:	e8 8f 31 00 00       	call   801043d0 <acquire>

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101241:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101244:	eb 14                	jmp    8010125a <iget+0x3a>
80101246:	66 90                	xchg   %ax,%ax
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101248:	85 f6                	test   %esi,%esi
8010124a:	74 3c                	je     80101288 <iget+0x68>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010124c:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101252:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101258:	74 46                	je     801012a0 <iget+0x80>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
8010125a:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010125d:	85 c9                	test   %ecx,%ecx
8010125f:	7e e7                	jle    80101248 <iget+0x28>
80101261:	39 3b                	cmp    %edi,(%ebx)
80101263:	75 e3                	jne    80101248 <iget+0x28>
80101265:	39 53 04             	cmp    %edx,0x4(%ebx)
80101268:	75 de                	jne    80101248 <iget+0x28>
      ip->ref++;
8010126a:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
8010126d:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010126f:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101276:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101279:	e8 82 32 00 00       	call   80104500 <release>
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}
8010127e:	83 c4 1c             	add    $0x1c,%esp
80101281:	89 f0                	mov    %esi,%eax
80101283:	5b                   	pop    %ebx
80101284:	5e                   	pop    %esi
80101285:	5f                   	pop    %edi
80101286:	5d                   	pop    %ebp
80101287:	c3                   	ret    
80101288:	85 c9                	test   %ecx,%ecx
8010128a:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010128d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101293:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101299:	75 bf                	jne    8010125a <iget+0x3a>
8010129b:	90                   	nop
8010129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801012a0:	85 f6                	test   %esi,%esi
801012a2:	74 29                	je     801012cd <iget+0xad>
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
801012a4:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801012a6:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801012a9:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
801012b0:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012b7:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801012be:	e8 3d 32 00 00       	call   80104500 <release>

  return ip;
}
801012c3:	83 c4 1c             	add    $0x1c,%esp
801012c6:	89 f0                	mov    %esi,%eax
801012c8:	5b                   	pop    %ebx
801012c9:	5e                   	pop    %esi
801012ca:	5f                   	pop    %edi
801012cb:	5d                   	pop    %ebp
801012cc:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012cd:	c7 04 24 b1 70 10 80 	movl   $0x801070b1,(%esp)
801012d4:	e8 87 f0 ff ff       	call   80100360 <panic>
801012d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801012e0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012e0:	55                   	push   %ebp
801012e1:	89 e5                	mov    %esp,%ebp
801012e3:	57                   	push   %edi
801012e4:	56                   	push   %esi
801012e5:	53                   	push   %ebx
801012e6:	89 c3                	mov    %eax,%ebx
801012e8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012eb:	83 fa 0b             	cmp    $0xb,%edx
801012ee:	77 18                	ja     80101308 <bmap+0x28>
801012f0:	8d 34 90             	lea    (%eax,%edx,4),%esi
    if((addr = ip->addrs[bn]) == 0)
801012f3:	8b 46 5c             	mov    0x5c(%esi),%eax
801012f6:	85 c0                	test   %eax,%eax
801012f8:	74 66                	je     80101360 <bmap+0x80>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012fa:	83 c4 1c             	add    $0x1c,%esp
801012fd:	5b                   	pop    %ebx
801012fe:	5e                   	pop    %esi
801012ff:	5f                   	pop    %edi
80101300:	5d                   	pop    %ebp
80101301:	c3                   	ret    
80101302:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101308:	8d 72 f4             	lea    -0xc(%edx),%esi

  if(bn < NINDIRECT){
8010130b:	83 fe 7f             	cmp    $0x7f,%esi
8010130e:	77 77                	ja     80101387 <bmap+0xa7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101310:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101316:	85 c0                	test   %eax,%eax
80101318:	74 5e                	je     80101378 <bmap+0x98>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010131a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010131e:	8b 03                	mov    (%ebx),%eax
80101320:	89 04 24             	mov    %eax,(%esp)
80101323:	e8 a8 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101328:	8d 54 b0 5c          	lea    0x5c(%eax,%esi,4),%edx

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010132c:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
8010132e:	8b 32                	mov    (%edx),%esi
80101330:	85 f6                	test   %esi,%esi
80101332:	75 19                	jne    8010134d <bmap+0x6d>
      a[bn] = addr = balloc(ip->dev);
80101334:	8b 03                	mov    (%ebx),%eax
80101336:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101339:	e8 c2 fd ff ff       	call   80101100 <balloc>
8010133e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101341:	89 02                	mov    %eax,(%edx)
80101343:	89 c6                	mov    %eax,%esi
      log_write(bp);
80101345:	89 3c 24             	mov    %edi,(%esp)
80101348:	e8 e3 19 00 00       	call   80102d30 <log_write>
    }
    brelse(bp);
8010134d:	89 3c 24             	mov    %edi,(%esp)
80101350:	e8 8b ee ff ff       	call   801001e0 <brelse>
    return addr;
  }

  panic("bmap: out of range");
}
80101355:	83 c4 1c             	add    $0x1c,%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101358:	89 f0                	mov    %esi,%eax
    return addr;
  }

  panic("bmap: out of range");
}
8010135a:	5b                   	pop    %ebx
8010135b:	5e                   	pop    %esi
8010135c:	5f                   	pop    %edi
8010135d:	5d                   	pop    %ebp
8010135e:	c3                   	ret    
8010135f:	90                   	nop
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101360:	8b 03                	mov    (%ebx),%eax
80101362:	e8 99 fd ff ff       	call   80101100 <balloc>
80101367:	89 46 5c             	mov    %eax,0x5c(%esi)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010136a:	83 c4 1c             	add    $0x1c,%esp
8010136d:	5b                   	pop    %ebx
8010136e:	5e                   	pop    %esi
8010136f:	5f                   	pop    %edi
80101370:	5d                   	pop    %ebp
80101371:	c3                   	ret    
80101372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101378:	8b 03                	mov    (%ebx),%eax
8010137a:	e8 81 fd ff ff       	call   80101100 <balloc>
8010137f:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
80101385:	eb 93                	jmp    8010131a <bmap+0x3a>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
80101387:	c7 04 24 c1 70 10 80 	movl   $0x801070c1,(%esp)
8010138e:	e8 cd ef ff ff       	call   80100360 <panic>
80101393:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013a0 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801013a0:	55                   	push   %ebp
801013a1:	89 e5                	mov    %esp,%ebp
801013a3:	56                   	push   %esi
801013a4:	53                   	push   %ebx
801013a5:	83 ec 10             	sub    $0x10,%esp
  struct buf *bp;

  bp = bread(dev, 1);
801013a8:	8b 45 08             	mov    0x8(%ebp),%eax
801013ab:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801013b2:	00 
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801013b3:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801013b6:	89 04 24             	mov    %eax,(%esp)
801013b9:	e8 12 ed ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
801013be:	89 34 24             	mov    %esi,(%esp)
801013c1:	c7 44 24 08 1c 00 00 	movl   $0x1c,0x8(%esp)
801013c8:	00 
void
readsb(int dev, struct superblock *sb)
{
  struct buf *bp;

  bp = bread(dev, 1);
801013c9:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013cb:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ce:	89 44 24 04          	mov    %eax,0x4(%esp)
801013d2:	e8 29 32 00 00       	call   80104600 <memmove>
  brelse(bp);
801013d7:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801013da:	83 c4 10             	add    $0x10,%esp
801013dd:	5b                   	pop    %ebx
801013de:	5e                   	pop    %esi
801013df:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
801013e0:	e9 fb ed ff ff       	jmp    801001e0 <brelse>
801013e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801013e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013f0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801013f0:	55                   	push   %ebp
801013f1:	89 e5                	mov    %esp,%ebp
801013f3:	57                   	push   %edi
801013f4:	89 d7                	mov    %edx,%edi
801013f6:	56                   	push   %esi
801013f7:	53                   	push   %ebx
801013f8:	89 c3                	mov    %eax,%ebx
801013fa:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
801013fd:	89 04 24             	mov    %eax,(%esp)
80101400:	c7 44 24 04 e0 09 11 	movl   $0x801109e0,0x4(%esp)
80101407:	80 
80101408:	e8 93 ff ff ff       	call   801013a0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
8010140d:	89 fa                	mov    %edi,%edx
8010140f:	c1 ea 0c             	shr    $0xc,%edx
80101412:	03 15 f8 09 11 80    	add    0x801109f8,%edx
80101418:	89 1c 24             	mov    %ebx,(%esp)
  bi = b % BPB;
  m = 1 << (bi % 8);
8010141b:	bb 01 00 00 00       	mov    $0x1,%ebx
{
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
80101420:	89 54 24 04          	mov    %edx,0x4(%esp)
80101424:	e8 a7 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
80101429:	89 f9                	mov    %edi,%ecx
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
8010142b:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
80101431:	89 fa                	mov    %edi,%edx
  m = 1 << (bi % 8);
80101433:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101436:	c1 fa 03             	sar    $0x3,%edx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101439:	d3 e3                	shl    %cl,%ebx
{
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
8010143b:	89 c6                	mov    %eax,%esi
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
8010143d:	0f b6 44 10 5c       	movzbl 0x5c(%eax,%edx,1),%eax
80101442:	0f b6 c8             	movzbl %al,%ecx
80101445:	85 d9                	test   %ebx,%ecx
80101447:	74 20                	je     80101469 <bfree+0x79>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101449:	f7 d3                	not    %ebx
8010144b:	21 c3                	and    %eax,%ebx
8010144d:	88 5c 16 5c          	mov    %bl,0x5c(%esi,%edx,1)
  log_write(bp);
80101451:	89 34 24             	mov    %esi,(%esp)
80101454:	e8 d7 18 00 00       	call   80102d30 <log_write>
  brelse(bp);
80101459:	89 34 24             	mov    %esi,(%esp)
8010145c:	e8 7f ed ff ff       	call   801001e0 <brelse>
}
80101461:	83 c4 1c             	add    $0x1c,%esp
80101464:	5b                   	pop    %ebx
80101465:	5e                   	pop    %esi
80101466:	5f                   	pop    %edi
80101467:	5d                   	pop    %ebp
80101468:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101469:	c7 04 24 d4 70 10 80 	movl   $0x801070d4,(%esp)
80101470:	e8 eb ee ff ff       	call   80100360 <panic>
80101475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101480 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101480:	55                   	push   %ebp
80101481:	89 e5                	mov    %esp,%ebp
80101483:	53                   	push   %ebx
80101484:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
80101489:	83 ec 24             	sub    $0x24,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010148c:	c7 44 24 04 e7 70 10 	movl   $0x801070e7,0x4(%esp)
80101493:	80 
80101494:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010149b:	e8 b0 2e 00 00       	call   80104350 <initlock>
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
801014a0:	89 1c 24             	mov    %ebx,(%esp)
801014a3:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014a9:	c7 44 24 04 ee 70 10 	movl   $0x801070ee,0x4(%esp)
801014b0:	80 
801014b1:	e8 8a 2d 00 00       	call   80104240 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
801014b6:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
801014bc:	75 e2                	jne    801014a0 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }
  
  readsb(dev, &sb);
801014be:	8b 45 08             	mov    0x8(%ebp),%eax
801014c1:	c7 44 24 04 e0 09 11 	movl   $0x801109e0,0x4(%esp)
801014c8:	80 
801014c9:	89 04 24             	mov    %eax,(%esp)
801014cc:	e8 cf fe ff ff       	call   801013a0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014d1:	a1 f8 09 11 80       	mov    0x801109f8,%eax
801014d6:	c7 04 24 44 71 10 80 	movl   $0x80107144,(%esp)
801014dd:	89 44 24 1c          	mov    %eax,0x1c(%esp)
801014e1:	a1 f4 09 11 80       	mov    0x801109f4,%eax
801014e6:	89 44 24 18          	mov    %eax,0x18(%esp)
801014ea:	a1 f0 09 11 80       	mov    0x801109f0,%eax
801014ef:	89 44 24 14          	mov    %eax,0x14(%esp)
801014f3:	a1 ec 09 11 80       	mov    0x801109ec,%eax
801014f8:	89 44 24 10          	mov    %eax,0x10(%esp)
801014fc:	a1 e8 09 11 80       	mov    0x801109e8,%eax
80101501:	89 44 24 0c          	mov    %eax,0xc(%esp)
80101505:	a1 e4 09 11 80       	mov    0x801109e4,%eax
8010150a:	89 44 24 08          	mov    %eax,0x8(%esp)
8010150e:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101513:	89 44 24 04          	mov    %eax,0x4(%esp)
80101517:	e8 34 f1 ff ff       	call   80100650 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
8010151c:	83 c4 24             	add    $0x24,%esp
8010151f:	5b                   	pop    %ebx
80101520:	5d                   	pop    %ebp
80101521:	c3                   	ret    
80101522:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101530 <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101530:	55                   	push   %ebp
80101531:	89 e5                	mov    %esp,%ebp
80101533:	57                   	push   %edi
80101534:	56                   	push   %esi
80101535:	53                   	push   %ebx
80101536:	83 ec 2c             	sub    $0x2c,%esp
80101539:	8b 45 0c             	mov    0xc(%ebp),%eax
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010153c:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101543:	8b 7d 08             	mov    0x8(%ebp),%edi
80101546:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101549:	0f 86 a2 00 00 00    	jbe    801015f1 <ialloc+0xc1>
8010154f:	be 01 00 00 00       	mov    $0x1,%esi
80101554:	bb 01 00 00 00       	mov    $0x1,%ebx
80101559:	eb 1a                	jmp    80101575 <ialloc+0x45>
8010155b:	90                   	nop
8010155c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101560:	89 14 24             	mov    %edx,(%esp)
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101563:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101566:	e8 75 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010156b:	89 de                	mov    %ebx,%esi
8010156d:	3b 1d e8 09 11 80    	cmp    0x801109e8,%ebx
80101573:	73 7c                	jae    801015f1 <ialloc+0xc1>
    bp = bread(dev, IBLOCK(inum, sb));
80101575:	89 f0                	mov    %esi,%eax
80101577:	c1 e8 03             	shr    $0x3,%eax
8010157a:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101580:	89 3c 24             	mov    %edi,(%esp)
80101583:	89 44 24 04          	mov    %eax,0x4(%esp)
80101587:	e8 44 eb ff ff       	call   801000d0 <bread>
8010158c:	89 c2                	mov    %eax,%edx
    dip = (struct dinode*)bp->data + inum%IPB;
8010158e:	89 f0                	mov    %esi,%eax
80101590:	83 e0 07             	and    $0x7,%eax
80101593:	c1 e0 06             	shl    $0x6,%eax
80101596:	8d 4c 02 5c          	lea    0x5c(%edx,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010159a:	66 83 39 00          	cmpw   $0x0,(%ecx)
8010159e:	75 c0                	jne    80101560 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
801015a0:	89 0c 24             	mov    %ecx,(%esp)
801015a3:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
801015aa:	00 
801015ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801015b2:	00 
801015b3:	89 55 dc             	mov    %edx,-0x24(%ebp)
801015b6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015b9:	e8 92 2f 00 00       	call   80104550 <memset>
      dip->type = type;
801015be:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
      log_write(bp);   // mark it allocated on the disk
801015c2:	8b 55 dc             	mov    -0x24(%ebp),%edx
  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
801015c5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      log_write(bp);   // mark it allocated on the disk
801015c8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
801015cb:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801015ce:	89 14 24             	mov    %edx,(%esp)
801015d1:	e8 5a 17 00 00       	call   80102d30 <log_write>
      brelse(bp);
801015d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801015d9:	89 14 24             	mov    %edx,(%esp)
801015dc:	e8 ff eb ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015e1:	83 c4 2c             	add    $0x2c,%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015e4:	89 f2                	mov    %esi,%edx
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015e6:	5b                   	pop    %ebx
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015e7:	89 f8                	mov    %edi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015e9:	5e                   	pop    %esi
801015ea:	5f                   	pop    %edi
801015eb:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015ec:	e9 2f fc ff ff       	jmp    80101220 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015f1:	c7 04 24 f4 70 10 80 	movl   $0x801070f4,(%esp)
801015f8:	e8 63 ed ff ff       	call   80100360 <panic>
801015fd:	8d 76 00             	lea    0x0(%esi),%esi

80101600 <iupdate>:
}

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
80101600:	55                   	push   %ebp
80101601:	89 e5                	mov    %esp,%ebp
80101603:	56                   	push   %esi
80101604:	53                   	push   %ebx
80101605:	83 ec 10             	sub    $0x10,%esp
80101608:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010160b:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010160e:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101611:	c1 e8 03             	shr    $0x3,%eax
80101614:	03 05 f4 09 11 80    	add    0x801109f4,%eax
8010161a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010161e:	8b 43 a4             	mov    -0x5c(%ebx),%eax
80101621:	89 04 24             	mov    %eax,(%esp)
80101624:	e8 a7 ea ff ff       	call   801000d0 <bread>
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101629:	8b 53 a8             	mov    -0x58(%ebx),%edx
8010162c:	83 e2 07             	and    $0x7,%edx
8010162f:	c1 e2 06             	shl    $0x6,%edx
80101632:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101636:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
80101638:	0f b7 43 f4          	movzwl -0xc(%ebx),%eax
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010163c:	83 c2 0c             	add    $0xc,%edx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
8010163f:	66 89 42 f4          	mov    %ax,-0xc(%edx)
  dip->major = ip->major;
80101643:	0f b7 43 f6          	movzwl -0xa(%ebx),%eax
80101647:	66 89 42 f6          	mov    %ax,-0xa(%edx)
  dip->minor = ip->minor;
8010164b:	0f b7 43 f8          	movzwl -0x8(%ebx),%eax
8010164f:	66 89 42 f8          	mov    %ax,-0x8(%edx)
  dip->nlink = ip->nlink;
80101653:	0f b7 43 fa          	movzwl -0x6(%ebx),%eax
80101657:	66 89 42 fa          	mov    %ax,-0x6(%edx)
  dip->size = ip->size;
8010165b:	8b 43 fc             	mov    -0x4(%ebx),%eax
8010165e:	89 42 fc             	mov    %eax,-0x4(%edx)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101661:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101665:	89 14 24             	mov    %edx,(%esp)
80101668:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
8010166f:	00 
80101670:	e8 8b 2f 00 00       	call   80104600 <memmove>
  log_write(bp);
80101675:	89 34 24             	mov    %esi,(%esp)
80101678:	e8 b3 16 00 00       	call   80102d30 <log_write>
  brelse(bp);
8010167d:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101680:	83 c4 10             	add    $0x10,%esp
80101683:	5b                   	pop    %ebx
80101684:	5e                   	pop    %esi
80101685:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
80101686:	e9 55 eb ff ff       	jmp    801001e0 <brelse>
8010168b:	90                   	nop
8010168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101690 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101690:	55                   	push   %ebp
80101691:	89 e5                	mov    %esp,%ebp
80101693:	53                   	push   %ebx
80101694:	83 ec 14             	sub    $0x14,%esp
80101697:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010169a:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801016a1:	e8 2a 2d 00 00       	call   801043d0 <acquire>
  ip->ref++;
801016a6:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
801016aa:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801016b1:	e8 4a 2e 00 00       	call   80104500 <release>
  return ip;
}
801016b6:	83 c4 14             	add    $0x14,%esp
801016b9:	89 d8                	mov    %ebx,%eax
801016bb:	5b                   	pop    %ebx
801016bc:	5d                   	pop    %ebp
801016bd:	c3                   	ret    
801016be:	66 90                	xchg   %ax,%ax

801016c0 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
801016c0:	55                   	push   %ebp
801016c1:	89 e5                	mov    %esp,%ebp
801016c3:	56                   	push   %esi
801016c4:	53                   	push   %ebx
801016c5:	83 ec 10             	sub    $0x10,%esp
801016c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
801016cb:	85 db                	test   %ebx,%ebx
801016cd:	0f 84 b0 00 00 00    	je     80101783 <ilock+0xc3>
801016d3:	8b 43 08             	mov    0x8(%ebx),%eax
801016d6:	85 c0                	test   %eax,%eax
801016d8:	0f 8e a5 00 00 00    	jle    80101783 <ilock+0xc3>
    panic("ilock");

  acquiresleep(&ip->lock);
801016de:	8d 43 0c             	lea    0xc(%ebx),%eax
801016e1:	89 04 24             	mov    %eax,(%esp)
801016e4:	e8 97 2b 00 00       	call   80104280 <acquiresleep>

  if(!(ip->flags & I_VALID)){
801016e9:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
801016ed:	74 09                	je     801016f8 <ilock+0x38>
    brelse(bp);
    ip->flags |= I_VALID;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
801016ef:	83 c4 10             	add    $0x10,%esp
801016f2:	5b                   	pop    %ebx
801016f3:	5e                   	pop    %esi
801016f4:	5d                   	pop    %ebp
801016f5:	c3                   	ret    
801016f6:	66 90                	xchg   %ax,%ax
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016f8:	8b 43 04             	mov    0x4(%ebx),%eax
801016fb:	c1 e8 03             	shr    $0x3,%eax
801016fe:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101704:	89 44 24 04          	mov    %eax,0x4(%esp)
80101708:	8b 03                	mov    (%ebx),%eax
8010170a:	89 04 24             	mov    %eax,(%esp)
8010170d:	e8 be e9 ff ff       	call   801000d0 <bread>
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101712:	8b 53 04             	mov    0x4(%ebx),%edx
80101715:	83 e2 07             	and    $0x7,%edx
80101718:	c1 e2 06             	shl    $0x6,%edx
8010171b:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010171f:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
80101721:	0f b7 02             	movzwl (%edx),%eax
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101724:	83 c2 0c             	add    $0xc,%edx
  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
80101727:	66 89 43 50          	mov    %ax,0x50(%ebx)
    ip->major = dip->major;
8010172b:	0f b7 42 f6          	movzwl -0xa(%edx),%eax
8010172f:	66 89 43 52          	mov    %ax,0x52(%ebx)
    ip->minor = dip->minor;
80101733:	0f b7 42 f8          	movzwl -0x8(%edx),%eax
80101737:	66 89 43 54          	mov    %ax,0x54(%ebx)
    ip->nlink = dip->nlink;
8010173b:	0f b7 42 fa          	movzwl -0x6(%edx),%eax
8010173f:	66 89 43 56          	mov    %ax,0x56(%ebx)
    ip->size = dip->size;
80101743:	8b 42 fc             	mov    -0x4(%edx),%eax
80101746:	89 43 58             	mov    %eax,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101749:	8d 43 5c             	lea    0x5c(%ebx),%eax
8010174c:	89 54 24 04          	mov    %edx,0x4(%esp)
80101750:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101757:	00 
80101758:	89 04 24             	mov    %eax,(%esp)
8010175b:	e8 a0 2e 00 00       	call   80104600 <memmove>
    brelse(bp);
80101760:	89 34 24             	mov    %esi,(%esp)
80101763:	e8 78 ea ff ff       	call   801001e0 <brelse>
    ip->flags |= I_VALID;
80101768:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
    if(ip->type == 0)
8010176c:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101771:	0f 85 78 ff ff ff    	jne    801016ef <ilock+0x2f>
      panic("ilock: no type");
80101777:	c7 04 24 0c 71 10 80 	movl   $0x8010710c,(%esp)
8010177e:	e8 dd eb ff ff       	call   80100360 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101783:	c7 04 24 06 71 10 80 	movl   $0x80107106,(%esp)
8010178a:	e8 d1 eb ff ff       	call   80100360 <panic>
8010178f:	90                   	nop

80101790 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101790:	55                   	push   %ebp
80101791:	89 e5                	mov    %esp,%ebp
80101793:	56                   	push   %esi
80101794:	53                   	push   %ebx
80101795:	83 ec 10             	sub    $0x10,%esp
80101798:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
8010179b:	85 db                	test   %ebx,%ebx
8010179d:	74 24                	je     801017c3 <iunlock+0x33>
8010179f:	8d 73 0c             	lea    0xc(%ebx),%esi
801017a2:	89 34 24             	mov    %esi,(%esp)
801017a5:	e8 76 2b 00 00       	call   80104320 <holdingsleep>
801017aa:	85 c0                	test   %eax,%eax
801017ac:	74 15                	je     801017c3 <iunlock+0x33>
801017ae:	8b 43 08             	mov    0x8(%ebx),%eax
801017b1:	85 c0                	test   %eax,%eax
801017b3:	7e 0e                	jle    801017c3 <iunlock+0x33>
    panic("iunlock");

  releasesleep(&ip->lock);
801017b5:	89 75 08             	mov    %esi,0x8(%ebp)
}
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	5b                   	pop    %ebx
801017bc:	5e                   	pop    %esi
801017bd:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
801017be:	e9 1d 2b 00 00       	jmp    801042e0 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
801017c3:	c7 04 24 1b 71 10 80 	movl   $0x8010711b,(%esp)
801017ca:	e8 91 eb ff ff       	call   80100360 <panic>
801017cf:	90                   	nop

801017d0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
801017d0:	55                   	push   %ebp
801017d1:	89 e5                	mov    %esp,%ebp
801017d3:	57                   	push   %edi
801017d4:	56                   	push   %esi
801017d5:	53                   	push   %ebx
801017d6:	83 ec 1c             	sub    $0x1c,%esp
801017d9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&icache.lock);
801017dc:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801017e3:	e8 e8 2b 00 00       	call   801043d0 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
801017e8:	8b 46 08             	mov    0x8(%esi),%eax
801017eb:	83 f8 01             	cmp    $0x1,%eax
801017ee:	74 20                	je     80101810 <iput+0x40>
    ip->type = 0;
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
801017f0:	83 e8 01             	sub    $0x1,%eax
801017f3:	89 46 08             	mov    %eax,0x8(%esi)
  release(&icache.lock);
801017f6:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
}
801017fd:	83 c4 1c             	add    $0x1c,%esp
80101800:	5b                   	pop    %ebx
80101801:	5e                   	pop    %esi
80101802:	5f                   	pop    %edi
80101803:	5d                   	pop    %ebp
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
  release(&icache.lock);
80101804:	e9 f7 2c 00 00       	jmp    80104500 <release>
80101809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
// case it has to free the inode.
void
iput(struct inode *ip)
{
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
80101810:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
80101814:	74 da                	je     801017f0 <iput+0x20>
80101816:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
8010181b:	75 d3                	jne    801017f0 <iput+0x20>
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
8010181d:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101824:	89 f3                	mov    %esi,%ebx
80101826:	e8 d5 2c 00 00       	call   80104500 <release>
8010182b:	8d 7e 30             	lea    0x30(%esi),%edi
8010182e:	eb 07                	jmp    80101837 <iput+0x67>
80101830:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101833:	39 fb                	cmp    %edi,%ebx
80101835:	74 19                	je     80101850 <iput+0x80>
    if(ip->addrs[i]){
80101837:	8b 53 5c             	mov    0x5c(%ebx),%edx
8010183a:	85 d2                	test   %edx,%edx
8010183c:	74 f2                	je     80101830 <iput+0x60>
      bfree(ip->dev, ip->addrs[i]);
8010183e:	8b 06                	mov    (%esi),%eax
80101840:	e8 ab fb ff ff       	call   801013f0 <bfree>
      ip->addrs[i] = 0;
80101845:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
8010184c:	eb e2                	jmp    80101830 <iput+0x60>
8010184e:	66 90                	xchg   %ax,%ax
    }
  }

  if(ip->addrs[NDIRECT]){
80101850:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101856:	85 c0                	test   %eax,%eax
80101858:	75 3e                	jne    80101898 <iput+0xc8>
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
8010185a:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101861:	89 34 24             	mov    %esi,(%esp)
80101864:	e8 97 fd ff ff       	call   80101600 <iupdate>
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
    itrunc(ip);
    ip->type = 0;
80101869:	31 c0                	xor    %eax,%eax
8010186b:	66 89 46 50          	mov    %ax,0x50(%esi)
    iupdate(ip);
8010186f:	89 34 24             	mov    %esi,(%esp)
80101872:	e8 89 fd ff ff       	call   80101600 <iupdate>
    acquire(&icache.lock);
80101877:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010187e:	e8 4d 2b 00 00       	call   801043d0 <acquire>
80101883:	8b 46 08             	mov    0x8(%esi),%eax
    ip->flags = 0;
80101886:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010188d:	e9 5e ff ff ff       	jmp    801017f0 <iput+0x20>
80101892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101898:	89 44 24 04          	mov    %eax,0x4(%esp)
8010189c:	8b 06                	mov    (%esi),%eax
    a = (uint*)bp->data;
    for(j = 0; j < NINDIRECT; j++){
8010189e:	31 db                	xor    %ebx,%ebx
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018a0:	89 04 24             	mov    %eax,(%esp)
801018a3:	e8 28 e8 ff ff       	call   801000d0 <bread>
801018a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018ab:	8d 78 5c             	lea    0x5c(%eax),%edi
    for(j = 0; j < NINDIRECT; j++){
801018ae:	31 c0                	xor    %eax,%eax
801018b0:	eb 13                	jmp    801018c5 <iput+0xf5>
801018b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801018b8:	83 c3 01             	add    $0x1,%ebx
801018bb:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
801018c1:	89 d8                	mov    %ebx,%eax
801018c3:	74 10                	je     801018d5 <iput+0x105>
      if(a[j])
801018c5:	8b 14 87             	mov    (%edi,%eax,4),%edx
801018c8:	85 d2                	test   %edx,%edx
801018ca:	74 ec                	je     801018b8 <iput+0xe8>
        bfree(ip->dev, a[j]);
801018cc:	8b 06                	mov    (%esi),%eax
801018ce:	e8 1d fb ff ff       	call   801013f0 <bfree>
801018d3:	eb e3                	jmp    801018b8 <iput+0xe8>
    }
    brelse(bp);
801018d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801018d8:	89 04 24             	mov    %eax,(%esp)
801018db:	e8 00 e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018e0:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018e6:	8b 06                	mov    (%esi),%eax
801018e8:	e8 03 fb ff ff       	call   801013f0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018ed:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018f4:	00 00 00 
801018f7:	e9 5e ff ff ff       	jmp    8010185a <iput+0x8a>
801018fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101900 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101900:	55                   	push   %ebp
80101901:	89 e5                	mov    %esp,%ebp
80101903:	53                   	push   %ebx
80101904:	83 ec 14             	sub    $0x14,%esp
80101907:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010190a:	89 1c 24             	mov    %ebx,(%esp)
8010190d:	e8 7e fe ff ff       	call   80101790 <iunlock>
  iput(ip);
80101912:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80101915:	83 c4 14             	add    $0x14,%esp
80101918:	5b                   	pop    %ebx
80101919:	5d                   	pop    %ebp
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
8010191a:	e9 b1 fe ff ff       	jmp    801017d0 <iput>
8010191f:	90                   	nop

80101920 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	8b 55 08             	mov    0x8(%ebp),%edx
80101926:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101929:	8b 0a                	mov    (%edx),%ecx
8010192b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010192e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101931:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101934:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101938:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010193b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010193f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101943:	8b 52 58             	mov    0x58(%edx),%edx
80101946:	89 50 10             	mov    %edx,0x10(%eax)
}
80101949:	5d                   	pop    %ebp
8010194a:	c3                   	ret    
8010194b:	90                   	nop
8010194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101950 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	57                   	push   %edi
80101954:	56                   	push   %esi
80101955:	53                   	push   %ebx
80101956:	83 ec 2c             	sub    $0x2c,%esp
80101959:	8b 45 0c             	mov    0xc(%ebp),%eax
8010195c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010195f:	8b 75 10             	mov    0x10(%ebp),%esi
80101962:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101965:	8b 45 14             	mov    0x14(%ebp),%eax
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101968:	66 83 7f 50 03       	cmpw   $0x3,0x50(%edi)

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
8010196d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101970:	0f 84 aa 00 00 00    	je     80101a20 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101976:	8b 47 58             	mov    0x58(%edi),%eax
80101979:	39 f0                	cmp    %esi,%eax
8010197b:	0f 82 c7 00 00 00    	jb     80101a48 <readi+0xf8>
80101981:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101984:	89 da                	mov    %ebx,%edx
80101986:	01 f2                	add    %esi,%edx
80101988:	0f 82 ba 00 00 00    	jb     80101a48 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
8010198e:	89 c1                	mov    %eax,%ecx
80101990:	29 f1                	sub    %esi,%ecx
80101992:	39 d0                	cmp    %edx,%eax
80101994:	0f 43 cb             	cmovae %ebx,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101997:	31 c0                	xor    %eax,%eax
80101999:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
8010199b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010199e:	74 70                	je     80101a10 <readi+0xc0>
801019a0:	89 7d d8             	mov    %edi,-0x28(%ebp)
801019a3:	89 c7                	mov    %eax,%edi
801019a5:	8d 76 00             	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019a8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019ab:	89 f2                	mov    %esi,%edx
801019ad:	c1 ea 09             	shr    $0x9,%edx
801019b0:	89 d8                	mov    %ebx,%eax
801019b2:	e8 29 f9 ff ff       	call   801012e0 <bmap>
801019b7:	89 44 24 04          	mov    %eax,0x4(%esp)
801019bb:	8b 03                	mov    (%ebx),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
801019bd:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019c2:	89 04 24             	mov    %eax,(%esp)
801019c5:	e8 06 e7 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801019ca:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801019cd:	29 f9                	sub    %edi,%ecx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019cf:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019d1:	89 f0                	mov    %esi,%eax
801019d3:	25 ff 01 00 00       	and    $0x1ff,%eax
801019d8:	29 c3                	sub    %eax,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019da:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019de:	39 cb                	cmp    %ecx,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019e0:	89 44 24 04          	mov    %eax,0x4(%esp)
801019e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019e7:	0f 47 d9             	cmova  %ecx,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019ea:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019ee:	01 df                	add    %ebx,%edi
801019f0:	01 de                	add    %ebx,%esi
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019f2:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019f5:	89 04 24             	mov    %eax,(%esp)
801019f8:	e8 03 2c 00 00       	call   80104600 <memmove>
    brelse(bp);
801019fd:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a00:	89 14 24             	mov    %edx,(%esp)
80101a03:	e8 d8 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a08:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a0b:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a0e:	77 98                	ja     801019a8 <readi+0x58>
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101a10:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a13:	83 c4 2c             	add    $0x2c,%esp
80101a16:	5b                   	pop    %ebx
80101a17:	5e                   	pop    %esi
80101a18:	5f                   	pop    %edi
80101a19:	5d                   	pop    %ebp
80101a1a:	c3                   	ret    
80101a1b:	90                   	nop
80101a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a20:	0f bf 47 52          	movswl 0x52(%edi),%eax
80101a24:	66 83 f8 09          	cmp    $0x9,%ax
80101a28:	77 1e                	ja     80101a48 <readi+0xf8>
80101a2a:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101a31:	85 c0                	test   %eax,%eax
80101a33:	74 13                	je     80101a48 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a35:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101a38:	89 75 10             	mov    %esi,0x10(%ebp)
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a3b:	83 c4 2c             	add    $0x2c,%esp
80101a3e:	5b                   	pop    %ebx
80101a3f:	5e                   	pop    %esi
80101a40:	5f                   	pop    %edi
80101a41:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a42:	ff e0                	jmp    *%eax
80101a44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a4d:	eb c4                	jmp    80101a13 <readi+0xc3>
80101a4f:	90                   	nop

80101a50 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a50:	55                   	push   %ebp
80101a51:	89 e5                	mov    %esp,%ebp
80101a53:	57                   	push   %edi
80101a54:	56                   	push   %esi
80101a55:	53                   	push   %ebx
80101a56:	83 ec 2c             	sub    $0x2c,%esp
80101a59:	8b 45 08             	mov    0x8(%ebp),%eax
80101a5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a5f:	8b 4d 14             	mov    0x14(%ebp),%ecx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a62:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a67:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a6a:	8b 75 10             	mov    0x10(%ebp),%esi
80101a6d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a70:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a73:	0f 84 b7 00 00 00    	je     80101b30 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a79:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a7c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a7f:	0f 82 e3 00 00 00    	jb     80101b68 <writei+0x118>
80101a85:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101a88:	89 c8                	mov    %ecx,%eax
80101a8a:	01 f0                	add    %esi,%eax
80101a8c:	0f 82 d6 00 00 00    	jb     80101b68 <writei+0x118>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a92:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a97:	0f 87 cb 00 00 00    	ja     80101b68 <writei+0x118>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a9d:	85 c9                	test   %ecx,%ecx
80101a9f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101aa6:	74 77                	je     80101b1f <writei+0xcf>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101aa8:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101aab:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101aad:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ab2:	c1 ea 09             	shr    $0x9,%edx
80101ab5:	89 f8                	mov    %edi,%eax
80101ab7:	e8 24 f8 ff ff       	call   801012e0 <bmap>
80101abc:	89 44 24 04          	mov    %eax,0x4(%esp)
80101ac0:	8b 07                	mov    (%edi),%eax
80101ac2:	89 04 24             	mov    %eax,(%esp)
80101ac5:	e8 06 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101aca:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101acd:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101ad0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ad3:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ad5:	89 f0                	mov    %esi,%eax
80101ad7:	25 ff 01 00 00       	and    $0x1ff,%eax
80101adc:	29 c3                	sub    %eax,%ebx
80101ade:	39 cb                	cmp    %ecx,%ebx
80101ae0:	0f 47 d9             	cmova  %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101ae3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ae7:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101ae9:	89 54 24 04          	mov    %edx,0x4(%esp)
80101aed:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101af1:	89 04 24             	mov    %eax,(%esp)
80101af4:	e8 07 2b 00 00       	call   80104600 <memmove>
    log_write(bp);
80101af9:	89 3c 24             	mov    %edi,(%esp)
80101afc:	e8 2f 12 00 00       	call   80102d30 <log_write>
    brelse(bp);
80101b01:	89 3c 24             	mov    %edi,(%esp)
80101b04:	e8 d7 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b09:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b0c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b0f:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b12:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b15:	77 91                	ja     80101aa8 <writei+0x58>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101b17:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b1a:	39 70 58             	cmp    %esi,0x58(%eax)
80101b1d:	72 39                	jb     80101b58 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b1f:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b22:	83 c4 2c             	add    $0x2c,%esp
80101b25:	5b                   	pop    %ebx
80101b26:	5e                   	pop    %esi
80101b27:	5f                   	pop    %edi
80101b28:	5d                   	pop    %ebp
80101b29:	c3                   	ret    
80101b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b30:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b34:	66 83 f8 09          	cmp    $0x9,%ax
80101b38:	77 2e                	ja     80101b68 <writei+0x118>
80101b3a:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101b41:	85 c0                	test   %eax,%eax
80101b43:	74 23                	je     80101b68 <writei+0x118>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b45:	89 4d 10             	mov    %ecx,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b48:	83 c4 2c             	add    $0x2c,%esp
80101b4b:	5b                   	pop    %ebx
80101b4c:	5e                   	pop    %esi
80101b4d:	5f                   	pop    %edi
80101b4e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b4f:	ff e0                	jmp    *%eax
80101b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b58:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b5b:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b5e:	89 04 24             	mov    %eax,(%esp)
80101b61:	e8 9a fa ff ff       	call   80101600 <iupdate>
80101b66:	eb b7                	jmp    80101b1f <writei+0xcf>
  }
  return n;
}
80101b68:	83 c4 2c             	add    $0x2c,%esp
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b6b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b70:	5b                   	pop    %ebx
80101b71:	5e                   	pop    %esi
80101b72:	5f                   	pop    %edi
80101b73:	5d                   	pop    %ebp
80101b74:	c3                   	ret    
80101b75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b80 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b80:	55                   	push   %ebp
80101b81:	89 e5                	mov    %esp,%ebp
80101b83:	83 ec 18             	sub    $0x18,%esp
  return strncmp(s, t, DIRSIZ);
80101b86:	8b 45 0c             	mov    0xc(%ebp),%eax
80101b89:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101b90:	00 
80101b91:	89 44 24 04          	mov    %eax,0x4(%esp)
80101b95:	8b 45 08             	mov    0x8(%ebp),%eax
80101b98:	89 04 24             	mov    %eax,(%esp)
80101b9b:	e8 e0 2a 00 00       	call   80104680 <strncmp>
}
80101ba0:	c9                   	leave  
80101ba1:	c3                   	ret    
80101ba2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bb0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101bb0:	55                   	push   %ebp
80101bb1:	89 e5                	mov    %esp,%ebp
80101bb3:	57                   	push   %edi
80101bb4:	56                   	push   %esi
80101bb5:	53                   	push   %ebx
80101bb6:	83 ec 2c             	sub    $0x2c,%esp
80101bb9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bbc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bc1:	0f 85 97 00 00 00    	jne    80101c5e <dirlookup+0xae>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bc7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bca:	31 ff                	xor    %edi,%edi
80101bcc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bcf:	85 d2                	test   %edx,%edx
80101bd1:	75 0d                	jne    80101be0 <dirlookup+0x30>
80101bd3:	eb 73                	jmp    80101c48 <dirlookup+0x98>
80101bd5:	8d 76 00             	lea    0x0(%esi),%esi
80101bd8:	83 c7 10             	add    $0x10,%edi
80101bdb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bde:	76 68                	jbe    80101c48 <dirlookup+0x98>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101be0:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101be7:	00 
80101be8:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101bec:	89 74 24 04          	mov    %esi,0x4(%esp)
80101bf0:	89 1c 24             	mov    %ebx,(%esp)
80101bf3:	e8 58 fd ff ff       	call   80101950 <readi>
80101bf8:	83 f8 10             	cmp    $0x10,%eax
80101bfb:	75 55                	jne    80101c52 <dirlookup+0xa2>
      panic("dirlink read");
    if(de.inum == 0)
80101bfd:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c02:	74 d4                	je     80101bd8 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101c04:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c07:	89 44 24 04          	mov    %eax,0x4(%esp)
80101c0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80101c0e:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101c15:	00 
80101c16:	89 04 24             	mov    %eax,(%esp)
80101c19:	e8 62 2a 00 00       	call   80104680 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101c1e:	85 c0                	test   %eax,%eax
80101c20:	75 b6                	jne    80101bd8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c22:	8b 45 10             	mov    0x10(%ebp),%eax
80101c25:	85 c0                	test   %eax,%eax
80101c27:	74 05                	je     80101c2e <dirlookup+0x7e>
        *poff = off;
80101c29:	8b 45 10             	mov    0x10(%ebp),%eax
80101c2c:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c2e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c32:	8b 03                	mov    (%ebx),%eax
80101c34:	e8 e7 f5 ff ff       	call   80101220 <iget>
    }
  }

  return 0;
}
80101c39:	83 c4 2c             	add    $0x2c,%esp
80101c3c:	5b                   	pop    %ebx
80101c3d:	5e                   	pop    %esi
80101c3e:	5f                   	pop    %edi
80101c3f:	5d                   	pop    %ebp
80101c40:	c3                   	ret    
80101c41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c48:	83 c4 2c             	add    $0x2c,%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101c4b:	31 c0                	xor    %eax,%eax
}
80101c4d:	5b                   	pop    %ebx
80101c4e:	5e                   	pop    %esi
80101c4f:	5f                   	pop    %edi
80101c50:	5d                   	pop    %ebp
80101c51:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101c52:	c7 04 24 35 71 10 80 	movl   $0x80107135,(%esp)
80101c59:	e8 02 e7 ff ff       	call   80100360 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c5e:	c7 04 24 23 71 10 80 	movl   $0x80107123,(%esp)
80101c65:	e8 f6 e6 ff ff       	call   80100360 <panic>
80101c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101c70 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c70:	55                   	push   %ebp
80101c71:	89 e5                	mov    %esp,%ebp
80101c73:	57                   	push   %edi
80101c74:	89 cf                	mov    %ecx,%edi
80101c76:	56                   	push   %esi
80101c77:	53                   	push   %ebx
80101c78:	89 c3                	mov    %eax,%ebx
80101c7a:	83 ec 2c             	sub    $0x2c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c7d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c80:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c83:	0f 84 51 01 00 00    	je     80101dda <namex+0x16a>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101c89:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80101c8f:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c92:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c99:	e8 32 27 00 00       	call   801043d0 <acquire>
  ip->ref++;
80101c9e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101ca2:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101ca9:	e8 52 28 00 00       	call   80104500 <release>
80101cae:	eb 03                	jmp    80101cb3 <namex+0x43>
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101cb0:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101cb3:	0f b6 03             	movzbl (%ebx),%eax
80101cb6:	3c 2f                	cmp    $0x2f,%al
80101cb8:	74 f6                	je     80101cb0 <namex+0x40>
    path++;
  if(*path == 0)
80101cba:	84 c0                	test   %al,%al
80101cbc:	0f 84 ed 00 00 00    	je     80101daf <namex+0x13f>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cc2:	0f b6 03             	movzbl (%ebx),%eax
80101cc5:	89 da                	mov    %ebx,%edx
80101cc7:	84 c0                	test   %al,%al
80101cc9:	0f 84 b1 00 00 00    	je     80101d80 <namex+0x110>
80101ccf:	3c 2f                	cmp    $0x2f,%al
80101cd1:	75 0f                	jne    80101ce2 <namex+0x72>
80101cd3:	e9 a8 00 00 00       	jmp    80101d80 <namex+0x110>
80101cd8:	3c 2f                	cmp    $0x2f,%al
80101cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101ce0:	74 0a                	je     80101cec <namex+0x7c>
    path++;
80101ce2:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101ce5:	0f b6 02             	movzbl (%edx),%eax
80101ce8:	84 c0                	test   %al,%al
80101cea:	75 ec                	jne    80101cd8 <namex+0x68>
80101cec:	89 d1                	mov    %edx,%ecx
80101cee:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101cf0:	83 f9 0d             	cmp    $0xd,%ecx
80101cf3:	0f 8e 8f 00 00 00    	jle    80101d88 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101cf9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101cfd:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101d04:	00 
80101d05:	89 3c 24             	mov    %edi,(%esp)
80101d08:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d0b:	e8 f0 28 00 00       	call   80104600 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101d10:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d13:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d15:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d18:	75 0e                	jne    80101d28 <namex+0xb8>
80101d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    path++;
80101d20:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d23:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d26:	74 f8                	je     80101d20 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d28:	89 34 24             	mov    %esi,(%esp)
80101d2b:	e8 90 f9 ff ff       	call   801016c0 <ilock>
    if(ip->type != T_DIR){
80101d30:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d35:	0f 85 85 00 00 00    	jne    80101dc0 <namex+0x150>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d3b:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d3e:	85 d2                	test   %edx,%edx
80101d40:	74 09                	je     80101d4b <namex+0xdb>
80101d42:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d45:	0f 84 a5 00 00 00    	je     80101df0 <namex+0x180>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d4b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101d52:	00 
80101d53:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101d57:	89 34 24             	mov    %esi,(%esp)
80101d5a:	e8 51 fe ff ff       	call   80101bb0 <dirlookup>
80101d5f:	85 c0                	test   %eax,%eax
80101d61:	74 5d                	je     80101dc0 <namex+0x150>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d63:	89 34 24             	mov    %esi,(%esp)
80101d66:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d69:	e8 22 fa ff ff       	call   80101790 <iunlock>
  iput(ip);
80101d6e:	89 34 24             	mov    %esi,(%esp)
80101d71:	e8 5a fa ff ff       	call   801017d0 <iput>
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
    }
    iunlockput(ip);
    ip = next;
80101d76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d79:	89 c6                	mov    %eax,%esi
80101d7b:	e9 33 ff ff ff       	jmp    80101cb3 <namex+0x43>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d80:	31 c9                	xor    %ecx,%ecx
80101d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d88:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80101d8c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101d90:	89 3c 24             	mov    %edi,(%esp)
80101d93:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d96:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d99:	e8 62 28 00 00       	call   80104600 <memmove>
    name[len] = 0;
80101d9e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101da1:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101da4:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101da8:	89 d3                	mov    %edx,%ebx
80101daa:	e9 66 ff ff ff       	jmp    80101d15 <namex+0xa5>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101daf:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101db2:	85 c0                	test   %eax,%eax
80101db4:	75 4c                	jne    80101e02 <namex+0x192>
80101db6:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101db8:	83 c4 2c             	add    $0x2c,%esp
80101dbb:	5b                   	pop    %ebx
80101dbc:	5e                   	pop    %esi
80101dbd:	5f                   	pop    %edi
80101dbe:	5d                   	pop    %ebp
80101dbf:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101dc0:	89 34 24             	mov    %esi,(%esp)
80101dc3:	e8 c8 f9 ff ff       	call   80101790 <iunlock>
  iput(ip);
80101dc8:	89 34 24             	mov    %esi,(%esp)
80101dcb:	e8 00 fa ff ff       	call   801017d0 <iput>
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dd0:	83 c4 2c             	add    $0x2c,%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101dd3:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dd5:	5b                   	pop    %ebx
80101dd6:	5e                   	pop    %esi
80101dd7:	5f                   	pop    %edi
80101dd8:	5d                   	pop    %ebp
80101dd9:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101dda:	ba 01 00 00 00       	mov    $0x1,%edx
80101ddf:	b8 01 00 00 00       	mov    $0x1,%eax
80101de4:	e8 37 f4 ff ff       	call   80101220 <iget>
80101de9:	89 c6                	mov    %eax,%esi
80101deb:	e9 c3 fe ff ff       	jmp    80101cb3 <namex+0x43>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101df0:	89 34 24             	mov    %esi,(%esp)
80101df3:	e8 98 f9 ff ff       	call   80101790 <iunlock>
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101df8:	83 c4 2c             	add    $0x2c,%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101dfb:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dfd:	5b                   	pop    %ebx
80101dfe:	5e                   	pop    %esi
80101dff:	5f                   	pop    %edi
80101e00:	5d                   	pop    %ebp
80101e01:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101e02:	89 34 24             	mov    %esi,(%esp)
80101e05:	e8 c6 f9 ff ff       	call   801017d0 <iput>
    return 0;
80101e0a:	31 c0                	xor    %eax,%eax
80101e0c:	eb aa                	jmp    80101db8 <namex+0x148>
80101e0e:	66 90                	xchg   %ax,%ax

80101e10 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101e10:	55                   	push   %ebp
80101e11:	89 e5                	mov    %esp,%ebp
80101e13:	57                   	push   %edi
80101e14:	56                   	push   %esi
80101e15:	53                   	push   %ebx
80101e16:	83 ec 2c             	sub    $0x2c,%esp
80101e19:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e1c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e1f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101e26:	00 
80101e27:	89 1c 24             	mov    %ebx,(%esp)
80101e2a:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e2e:	e8 7d fd ff ff       	call   80101bb0 <dirlookup>
80101e33:	85 c0                	test   %eax,%eax
80101e35:	0f 85 8b 00 00 00    	jne    80101ec6 <dirlink+0xb6>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e3b:	8b 43 58             	mov    0x58(%ebx),%eax
80101e3e:	31 ff                	xor    %edi,%edi
80101e40:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e43:	85 c0                	test   %eax,%eax
80101e45:	75 13                	jne    80101e5a <dirlink+0x4a>
80101e47:	eb 35                	jmp    80101e7e <dirlink+0x6e>
80101e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e50:	8d 57 10             	lea    0x10(%edi),%edx
80101e53:	39 53 58             	cmp    %edx,0x58(%ebx)
80101e56:	89 d7                	mov    %edx,%edi
80101e58:	76 24                	jbe    80101e7e <dirlink+0x6e>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e5a:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101e61:	00 
80101e62:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101e66:	89 74 24 04          	mov    %esi,0x4(%esp)
80101e6a:	89 1c 24             	mov    %ebx,(%esp)
80101e6d:	e8 de fa ff ff       	call   80101950 <readi>
80101e72:	83 f8 10             	cmp    $0x10,%eax
80101e75:	75 5e                	jne    80101ed5 <dirlink+0xc5>
      panic("dirlink read");
    if(de.inum == 0)
80101e77:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e7c:	75 d2                	jne    80101e50 <dirlink+0x40>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e7e:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e81:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101e88:	00 
80101e89:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e8d:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e90:	89 04 24             	mov    %eax,(%esp)
80101e93:	e8 58 28 00 00       	call   801046f0 <strncpy>
  de.inum = inum;
80101e98:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e9b:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101ea2:	00 
80101ea3:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101ea7:	89 74 24 04          	mov    %esi,0x4(%esp)
80101eab:	89 1c 24             	mov    %ebx,(%esp)
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101eae:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101eb2:	e8 99 fb ff ff       	call   80101a50 <writei>
80101eb7:	83 f8 10             	cmp    $0x10,%eax
80101eba:	75 25                	jne    80101ee1 <dirlink+0xd1>
    panic("dirlink");

  return 0;
80101ebc:	31 c0                	xor    %eax,%eax
}
80101ebe:	83 c4 2c             	add    $0x2c,%esp
80101ec1:	5b                   	pop    %ebx
80101ec2:	5e                   	pop    %esi
80101ec3:	5f                   	pop    %edi
80101ec4:	5d                   	pop    %ebp
80101ec5:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101ec6:	89 04 24             	mov    %eax,(%esp)
80101ec9:	e8 02 f9 ff ff       	call   801017d0 <iput>
    return -1;
80101ece:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ed3:	eb e9                	jmp    80101ebe <dirlink+0xae>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101ed5:	c7 04 24 35 71 10 80 	movl   $0x80107135,(%esp)
80101edc:	e8 7f e4 ff ff       	call   80100360 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101ee1:	c7 04 24 aa 77 10 80 	movl   $0x801077aa,(%esp)
80101ee8:	e8 73 e4 ff ff       	call   80100360 <panic>
80101eed:	8d 76 00             	lea    0x0(%esi),%esi

80101ef0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101ef0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ef1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101ef3:	89 e5                	mov    %esp,%ebp
80101ef5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ef8:	8b 45 08             	mov    0x8(%ebp),%eax
80101efb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101efe:	e8 6d fd ff ff       	call   80101c70 <namex>
}
80101f03:	c9                   	leave  
80101f04:	c3                   	ret    
80101f05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f10 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f10:	55                   	push   %ebp
  return namex(path, 1, name);
80101f11:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101f16:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f1b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f1e:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101f1f:	e9 4c fd ff ff       	jmp    80101c70 <namex>
80101f24:	66 90                	xchg   %ax,%ax
80101f26:	66 90                	xchg   %ax,%ax
80101f28:	66 90                	xchg   %ax,%ax
80101f2a:	66 90                	xchg   %ax,%ax
80101f2c:	66 90                	xchg   %ax,%ax
80101f2e:	66 90                	xchg   %ax,%ax

80101f30 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f30:	55                   	push   %ebp
80101f31:	89 e5                	mov    %esp,%ebp
80101f33:	56                   	push   %esi
80101f34:	89 c6                	mov    %eax,%esi
80101f36:	53                   	push   %ebx
80101f37:	83 ec 10             	sub    $0x10,%esp
  if(b == 0)
80101f3a:	85 c0                	test   %eax,%eax
80101f3c:	0f 84 99 00 00 00    	je     80101fdb <idestart+0xab>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f42:	8b 48 08             	mov    0x8(%eax),%ecx
80101f45:	81 f9 e7 03 00 00    	cmp    $0x3e7,%ecx
80101f4b:	0f 87 7e 00 00 00    	ja     80101fcf <idestart+0x9f>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f51:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f56:	66 90                	xchg   %ax,%ax
80101f58:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f59:	83 e0 c0             	and    $0xffffffc0,%eax
80101f5c:	3c 40                	cmp    $0x40,%al
80101f5e:	75 f8                	jne    80101f58 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f60:	31 db                	xor    %ebx,%ebx
80101f62:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f67:	89 d8                	mov    %ebx,%eax
80101f69:	ee                   	out    %al,(%dx)
80101f6a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f6f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f74:	ee                   	out    %al,(%dx)
80101f75:	0f b6 c1             	movzbl %cl,%eax
80101f78:	b2 f3                	mov    $0xf3,%dl
80101f7a:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f7b:	89 c8                	mov    %ecx,%eax
80101f7d:	b2 f4                	mov    $0xf4,%dl
80101f7f:	c1 f8 08             	sar    $0x8,%eax
80101f82:	ee                   	out    %al,(%dx)
80101f83:	b2 f5                	mov    $0xf5,%dl
80101f85:	89 d8                	mov    %ebx,%eax
80101f87:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f88:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101f8c:	b2 f6                	mov    $0xf6,%dl
80101f8e:	83 e0 01             	and    $0x1,%eax
80101f91:	c1 e0 04             	shl    $0x4,%eax
80101f94:	83 c8 e0             	or     $0xffffffe0,%eax
80101f97:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101f98:	f6 06 04             	testb  $0x4,(%esi)
80101f9b:	75 13                	jne    80101fb0 <idestart+0x80>
80101f9d:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fa2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fa7:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fa8:	83 c4 10             	add    $0x10,%esp
80101fab:	5b                   	pop    %ebx
80101fac:	5e                   	pop    %esi
80101fad:	5d                   	pop    %ebp
80101fae:	c3                   	ret    
80101faf:	90                   	nop
80101fb0:	b2 f7                	mov    $0xf7,%dl
80101fb2:	b8 30 00 00 00       	mov    $0x30,%eax
80101fb7:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101fb8:	b9 80 00 00 00       	mov    $0x80,%ecx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101fbd:	83 c6 5c             	add    $0x5c,%esi
80101fc0:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fc5:	fc                   	cld    
80101fc6:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fc8:	83 c4 10             	add    $0x10,%esp
80101fcb:	5b                   	pop    %ebx
80101fcc:	5e                   	pop    %esi
80101fcd:	5d                   	pop    %ebp
80101fce:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101fcf:	c7 04 24 a0 71 10 80 	movl   $0x801071a0,(%esp)
80101fd6:	e8 85 e3 ff ff       	call   80100360 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101fdb:	c7 04 24 97 71 10 80 	movl   $0x80107197,(%esp)
80101fe2:	e8 79 e3 ff ff       	call   80100360 <panic>
80101fe7:	89 f6                	mov    %esi,%esi
80101fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ff0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101ff0:	55                   	push   %ebp
80101ff1:	89 e5                	mov    %esp,%ebp
80101ff3:	83 ec 18             	sub    $0x18,%esp
  int i;

  initlock(&idelock, "ide");
80101ff6:	c7 44 24 04 b2 71 10 	movl   $0x801071b2,0x4(%esp)
80101ffd:	80 
80101ffe:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102005:	e8 46 23 00 00       	call   80104350 <initlock>
  picenable(IRQ_IDE);
8010200a:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102011:	e8 ea 11 00 00       	call   80103200 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102016:	a1 80 2d 11 80       	mov    0x80112d80,%eax
8010201b:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102022:	83 e8 01             	sub    $0x1,%eax
80102025:	89 44 24 04          	mov    %eax,0x4(%esp)
80102029:	e8 82 02 00 00       	call   801022b0 <ioapicenable>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010202e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102033:	90                   	nop
80102034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102038:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102039:	83 e0 c0             	and    $0xffffffc0,%eax
8010203c:	3c 40                	cmp    $0x40,%al
8010203e:	75 f8                	jne    80102038 <ideinit+0x48>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102040:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102045:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010204a:	ee                   	out    %al,(%dx)
8010204b:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102050:	b2 f7                	mov    $0xf7,%dl
80102052:	eb 09                	jmp    8010205d <ideinit+0x6d>
80102054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102058:	83 e9 01             	sub    $0x1,%ecx
8010205b:	74 0f                	je     8010206c <ideinit+0x7c>
8010205d:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
8010205e:	84 c0                	test   %al,%al
80102060:	74 f6                	je     80102058 <ideinit+0x68>
      havedisk1 = 1;
80102062:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102069:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010206c:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102071:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102076:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
80102077:	c9                   	leave  
80102078:	c3                   	ret    
80102079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102080 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102080:	55                   	push   %ebp
80102081:	89 e5                	mov    %esp,%ebp
80102083:	57                   	push   %edi
80102084:	56                   	push   %esi
80102085:	53                   	push   %ebx
80102086:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102089:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102090:	e8 3b 23 00 00       	call   801043d0 <acquire>
  if((b = idequeue) == 0){
80102095:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
8010209b:	85 db                	test   %ebx,%ebx
8010209d:	74 30                	je     801020cf <ideintr+0x4f>
    release(&idelock);
    // cprintf("spurious IDE interrupt\n");
    return;
  }
  idequeue = b->qnext;
8010209f:	8b 43 58             	mov    0x58(%ebx),%eax
801020a2:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801020a7:	8b 33                	mov    (%ebx),%esi
801020a9:	f7 c6 04 00 00 00    	test   $0x4,%esi
801020af:	74 37                	je     801020e8 <ideintr+0x68>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020b1:	83 e6 fb             	and    $0xfffffffb,%esi
801020b4:	83 ce 02             	or     $0x2,%esi
801020b7:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801020b9:	89 1c 24             	mov    %ebx,(%esp)
801020bc:	e8 bf 1f 00 00       	call   80104080 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
801020c1:	a1 64 a5 10 80       	mov    0x8010a564,%eax
801020c6:	85 c0                	test   %eax,%eax
801020c8:	74 05                	je     801020cf <ideintr+0x4f>
    idestart(idequeue);
801020ca:	e8 61 fe ff ff       	call   80101f30 <idestart>
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
  if((b = idequeue) == 0){
    release(&idelock);
801020cf:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
801020d6:	e8 25 24 00 00       	call   80104500 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
801020db:	83 c4 1c             	add    $0x1c,%esp
801020de:	5b                   	pop    %ebx
801020df:	5e                   	pop    %esi
801020e0:	5f                   	pop    %edi
801020e1:	5d                   	pop    %ebp
801020e2:	c3                   	ret    
801020e3:	90                   	nop
801020e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020e8:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020ed:	8d 76 00             	lea    0x0(%esi),%esi
801020f0:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020f1:	89 c1                	mov    %eax,%ecx
801020f3:	83 e1 c0             	and    $0xffffffc0,%ecx
801020f6:	80 f9 40             	cmp    $0x40,%cl
801020f9:	75 f5                	jne    801020f0 <ideintr+0x70>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020fb:	a8 21                	test   $0x21,%al
801020fd:	75 b2                	jne    801020b1 <ideintr+0x31>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020ff:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
80102102:	b9 80 00 00 00       	mov    $0x80,%ecx
80102107:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010210c:	fc                   	cld    
8010210d:	f3 6d                	rep insl (%dx),%es:(%edi)
8010210f:	8b 33                	mov    (%ebx),%esi
80102111:	eb 9e                	jmp    801020b1 <ideintr+0x31>
80102113:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102120 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102120:	55                   	push   %ebp
80102121:	89 e5                	mov    %esp,%ebp
80102123:	53                   	push   %ebx
80102124:	83 ec 14             	sub    $0x14,%esp
80102127:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010212a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010212d:	89 04 24             	mov    %eax,(%esp)
80102130:	e8 eb 21 00 00       	call   80104320 <holdingsleep>
80102135:	85 c0                	test   %eax,%eax
80102137:	0f 84 9e 00 00 00    	je     801021db <iderw+0xbb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010213d:	8b 03                	mov    (%ebx),%eax
8010213f:	83 e0 06             	and    $0x6,%eax
80102142:	83 f8 02             	cmp    $0x2,%eax
80102145:	0f 84 a8 00 00 00    	je     801021f3 <iderw+0xd3>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010214b:	8b 53 04             	mov    0x4(%ebx),%edx
8010214e:	85 d2                	test   %edx,%edx
80102150:	74 0d                	je     8010215f <iderw+0x3f>
80102152:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102157:	85 c0                	test   %eax,%eax
80102159:	0f 84 88 00 00 00    	je     801021e7 <iderw+0xc7>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
8010215f:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102166:	e8 65 22 00 00       	call   801043d0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010216b:	a1 64 a5 10 80       	mov    0x8010a564,%eax
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102170:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102177:	85 c0                	test   %eax,%eax
80102179:	75 07                	jne    80102182 <iderw+0x62>
8010217b:	eb 4e                	jmp    801021cb <iderw+0xab>
8010217d:	8d 76 00             	lea    0x0(%esi),%esi
80102180:	89 d0                	mov    %edx,%eax
80102182:	8b 50 58             	mov    0x58(%eax),%edx
80102185:	85 d2                	test   %edx,%edx
80102187:	75 f7                	jne    80102180 <iderw+0x60>
80102189:	83 c0 58             	add    $0x58,%eax
    ;
  *pp = b;
8010218c:	89 18                	mov    %ebx,(%eax)

  // Start disk if necessary.
  if(idequeue == b)
8010218e:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
80102194:	74 3c                	je     801021d2 <iderw+0xb2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102196:	8b 03                	mov    (%ebx),%eax
80102198:	83 e0 06             	and    $0x6,%eax
8010219b:	83 f8 02             	cmp    $0x2,%eax
8010219e:	74 1a                	je     801021ba <iderw+0x9a>
    sleep(b, &idelock);
801021a0:	c7 44 24 04 80 a5 10 	movl   $0x8010a580,0x4(%esp)
801021a7:	80 
801021a8:	89 1c 24             	mov    %ebx,(%esp)
801021ab:	e8 20 1d 00 00       	call   80103ed0 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021b0:	8b 13                	mov    (%ebx),%edx
801021b2:	83 e2 06             	and    $0x6,%edx
801021b5:	83 fa 02             	cmp    $0x2,%edx
801021b8:	75 e6                	jne    801021a0 <iderw+0x80>
    sleep(b, &idelock);
  }

  release(&idelock);
801021ba:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801021c1:	83 c4 14             	add    $0x14,%esp
801021c4:	5b                   	pop    %ebx
801021c5:	5d                   	pop    %ebp
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }

  release(&idelock);
801021c6:	e9 35 23 00 00       	jmp    80104500 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021cb:	b8 64 a5 10 80       	mov    $0x8010a564,%eax
801021d0:	eb ba                	jmp    8010218c <iderw+0x6c>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
801021d2:	89 d8                	mov    %ebx,%eax
801021d4:	e8 57 fd ff ff       	call   80101f30 <idestart>
801021d9:	eb bb                	jmp    80102196 <iderw+0x76>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
801021db:	c7 04 24 b6 71 10 80 	movl   $0x801071b6,(%esp)
801021e2:	e8 79 e1 ff ff       	call   80100360 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021e7:	c7 04 24 e1 71 10 80 	movl   $0x801071e1,(%esp)
801021ee:	e8 6d e1 ff ff       	call   80100360 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021f3:	c7 04 24 cc 71 10 80 	movl   $0x801071cc,(%esp)
801021fa:	e8 61 e1 ff ff       	call   80100360 <panic>
801021ff:	90                   	nop

80102200 <ioapicinit>:
void
ioapicinit(void)
{
  int i, id, maxintr;

  if(!ismp)
80102200:	a1 84 27 11 80       	mov    0x80112784,%eax
80102205:	85 c0                	test   %eax,%eax
80102207:	0f 84 9b 00 00 00    	je     801022a8 <ioapicinit+0xa8>
  ioapic->data = data;
}

void
ioapicinit(void)
{
8010220d:	55                   	push   %ebp
8010220e:	89 e5                	mov    %esp,%ebp
80102210:	56                   	push   %esi
80102211:	53                   	push   %ebx
80102212:	83 ec 10             	sub    $0x10,%esp
  int i, id, maxintr;

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102215:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
8010221c:	00 c0 fe 
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
8010221f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102226:	00 00 00 
  return ioapic->data;
80102229:	8b 15 54 26 11 80    	mov    0x80112654,%edx
8010222f:	8b 42 10             	mov    0x10(%edx),%eax
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
80102232:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
80102238:	8b 1d 54 26 11 80    	mov    0x80112654,%ebx
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010223e:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102245:	c1 e8 10             	shr    $0x10,%eax
80102248:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
8010224b:	8b 43 10             	mov    0x10(%ebx),%eax
  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
8010224e:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102251:	39 c2                	cmp    %eax,%edx
80102253:	74 12                	je     80102267 <ioapicinit+0x67>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102255:	c7 04 24 00 72 10 80 	movl   $0x80107200,(%esp)
8010225c:	e8 ef e3 ff ff       	call   80100650 <cprintf>
80102261:	8b 1d 54 26 11 80    	mov    0x80112654,%ebx
80102267:	ba 10 00 00 00       	mov    $0x10,%edx
8010226c:	31 c0                	xor    %eax,%eax
8010226e:	eb 02                	jmp    80102272 <ioapicinit+0x72>
80102270:	89 cb                	mov    %ecx,%ebx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102272:	89 13                	mov    %edx,(%ebx)
  ioapic->data = data;
80102274:	8b 1d 54 26 11 80    	mov    0x80112654,%ebx
8010227a:	8d 48 20             	lea    0x20(%eax),%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
8010227d:	81 c9 00 00 01 00    	or     $0x10000,%ecx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
80102283:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102286:	89 4b 10             	mov    %ecx,0x10(%ebx)
80102289:	8d 4a 01             	lea    0x1(%edx),%ecx
8010228c:	83 c2 02             	add    $0x2,%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010228f:	89 0b                	mov    %ecx,(%ebx)
  ioapic->data = data;
80102291:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
80102297:	39 c6                	cmp    %eax,%esi

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102299:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801022a0:	7d ce                	jge    80102270 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801022a2:	83 c4 10             	add    $0x10,%esp
801022a5:	5b                   	pop    %ebx
801022a6:	5e                   	pop    %esi
801022a7:	5d                   	pop    %ebp
801022a8:	f3 c3                	repz ret 
801022aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801022b0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
  if(!ismp)
801022b0:	8b 15 84 27 11 80    	mov    0x80112784,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
801022b6:	55                   	push   %ebp
801022b7:	89 e5                	mov    %esp,%ebp
801022b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!ismp)
801022bc:	85 d2                	test   %edx,%edx
801022be:	74 29                	je     801022e9 <ioapicenable+0x39>
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022c0:	8d 48 20             	lea    0x20(%eax),%ecx
801022c3:	8d 54 00 10          	lea    0x10(%eax,%eax,1),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022c7:	a1 54 26 11 80       	mov    0x80112654,%eax
801022cc:	89 10                	mov    %edx,(%eax)
  ioapic->data = data;
801022ce:	a1 54 26 11 80       	mov    0x80112654,%eax

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022d3:	83 c2 01             	add    $0x1,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022d6:	89 48 10             	mov    %ecx,0x10(%eax)

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022d9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022dc:	89 10                	mov    %edx,(%eax)
  ioapic->data = data;
801022de:	a1 54 26 11 80       	mov    0x80112654,%eax

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022e3:	c1 e1 18             	shl    $0x18,%ecx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022e6:	89 48 10             	mov    %ecx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
801022e9:	5d                   	pop    %ebp
801022ea:	c3                   	ret    
801022eb:	66 90                	xchg   %ax,%ax
801022ed:	66 90                	xchg   %ax,%ax
801022ef:	90                   	nop

801022f0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801022f0:	55                   	push   %ebp
801022f1:	89 e5                	mov    %esp,%ebp
801022f3:	53                   	push   %ebx
801022f4:	83 ec 14             	sub    $0x14,%esp
801022f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801022fa:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102300:	75 7c                	jne    8010237e <kfree+0x8e>
80102302:	81 fb 28 5d 11 80    	cmp    $0x80115d28,%ebx
80102308:	72 74                	jb     8010237e <kfree+0x8e>
8010230a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102310:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102315:	77 67                	ja     8010237e <kfree+0x8e>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102317:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010231e:	00 
8010231f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102326:	00 
80102327:	89 1c 24             	mov    %ebx,(%esp)
8010232a:	e8 21 22 00 00       	call   80104550 <memset>

  if(kmem.use_lock)
8010232f:	8b 15 94 26 11 80    	mov    0x80112694,%edx
80102335:	85 d2                	test   %edx,%edx
80102337:	75 37                	jne    80102370 <kfree+0x80>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102339:	a1 98 26 11 80       	mov    0x80112698,%eax
8010233e:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
80102340:	a1 94 26 11 80       	mov    0x80112694,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102345:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
  if(kmem.use_lock)
8010234b:	85 c0                	test   %eax,%eax
8010234d:	75 09                	jne    80102358 <kfree+0x68>
    release(&kmem.lock);
}
8010234f:	83 c4 14             	add    $0x14,%esp
80102352:	5b                   	pop    %ebx
80102353:	5d                   	pop    %ebp
80102354:	c3                   	ret    
80102355:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102358:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
}
8010235f:	83 c4 14             	add    $0x14,%esp
80102362:	5b                   	pop    %ebx
80102363:	5d                   	pop    %ebp
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102364:	e9 97 21 00 00       	jmp    80104500 <release>
80102369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102370:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
80102377:	e8 54 20 00 00       	call   801043d0 <acquire>
8010237c:	eb bb                	jmp    80102339 <kfree+0x49>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
8010237e:	c7 04 24 32 72 10 80 	movl   $0x80107232,(%esp)
80102385:	e8 d6 df ff ff       	call   80100360 <panic>
8010238a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102390 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102390:	55                   	push   %ebp
80102391:	89 e5                	mov    %esp,%ebp
80102393:	56                   	push   %esi
80102394:	53                   	push   %ebx
80102395:	83 ec 10             	sub    $0x10,%esp
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102398:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
8010239b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010239e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
801023a4:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023aa:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
801023b0:	39 de                	cmp    %ebx,%esi
801023b2:	73 08                	jae    801023bc <freerange+0x2c>
801023b4:	eb 18                	jmp    801023ce <freerange+0x3e>
801023b6:	66 90                	xchg   %ax,%ax
801023b8:	89 da                	mov    %ebx,%edx
801023ba:	89 c3                	mov    %eax,%ebx
    kfree(p);
801023bc:	89 14 24             	mov    %edx,(%esp)
801023bf:	e8 2c ff ff ff       	call   801022f0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023c4:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
801023ca:	39 f0                	cmp    %esi,%eax
801023cc:	76 ea                	jbe    801023b8 <freerange+0x28>
    kfree(p);
}
801023ce:	83 c4 10             	add    $0x10,%esp
801023d1:	5b                   	pop    %ebx
801023d2:	5e                   	pop    %esi
801023d3:	5d                   	pop    %ebp
801023d4:	c3                   	ret    
801023d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801023d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801023e0 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
801023e0:	55                   	push   %ebp
801023e1:	89 e5                	mov    %esp,%ebp
801023e3:	56                   	push   %esi
801023e4:	53                   	push   %ebx
801023e5:	83 ec 10             	sub    $0x10,%esp
801023e8:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801023eb:	c7 44 24 04 38 72 10 	movl   $0x80107238,0x4(%esp)
801023f2:	80 
801023f3:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
801023fa:	e8 51 1f 00 00       	call   80104350 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023ff:	8b 45 08             	mov    0x8(%ebp),%eax
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
80102402:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
80102409:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010240c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
80102412:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102418:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
8010241e:	39 de                	cmp    %ebx,%esi
80102420:	73 0a                	jae    8010242c <kinit1+0x4c>
80102422:	eb 1a                	jmp    8010243e <kinit1+0x5e>
80102424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102428:	89 da                	mov    %ebx,%edx
8010242a:	89 c3                	mov    %eax,%ebx
    kfree(p);
8010242c:	89 14 24             	mov    %edx,(%esp)
8010242f:	e8 bc fe ff ff       	call   801022f0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102434:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
8010243a:	39 c6                	cmp    %eax,%esi
8010243c:	73 ea                	jae    80102428 <kinit1+0x48>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
8010243e:	83 c4 10             	add    $0x10,%esp
80102441:	5b                   	pop    %ebx
80102442:	5e                   	pop    %esi
80102443:	5d                   	pop    %ebp
80102444:	c3                   	ret    
80102445:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102450 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
80102450:	55                   	push   %ebp
80102451:	89 e5                	mov    %esp,%ebp
80102453:	56                   	push   %esi
80102454:	53                   	push   %ebx
80102455:	83 ec 10             	sub    $0x10,%esp

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102458:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
8010245b:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010245e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
80102464:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010246a:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
80102470:	39 de                	cmp    %ebx,%esi
80102472:	73 08                	jae    8010247c <kinit2+0x2c>
80102474:	eb 18                	jmp    8010248e <kinit2+0x3e>
80102476:	66 90                	xchg   %ax,%ax
80102478:	89 da                	mov    %ebx,%edx
8010247a:	89 c3                	mov    %eax,%ebx
    kfree(p);
8010247c:	89 14 24             	mov    %edx,(%esp)
8010247f:	e8 6c fe ff ff       	call   801022f0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102484:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
8010248a:	39 c6                	cmp    %eax,%esi
8010248c:	73 ea                	jae    80102478 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
8010248e:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
80102495:	00 00 00 
}
80102498:	83 c4 10             	add    $0x10,%esp
8010249b:	5b                   	pop    %ebx
8010249c:	5e                   	pop    %esi
8010249d:	5d                   	pop    %ebp
8010249e:	c3                   	ret    
8010249f:	90                   	nop

801024a0 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801024a0:	55                   	push   %ebp
801024a1:	89 e5                	mov    %esp,%ebp
801024a3:	53                   	push   %ebx
801024a4:	83 ec 14             	sub    $0x14,%esp
  struct run *r;

  if(kmem.use_lock)
801024a7:	a1 94 26 11 80       	mov    0x80112694,%eax
801024ac:	85 c0                	test   %eax,%eax
801024ae:	75 30                	jne    801024e0 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024b0:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
  if(r)
801024b6:	85 db                	test   %ebx,%ebx
801024b8:	74 08                	je     801024c2 <kalloc+0x22>
    kmem.freelist = r->next;
801024ba:	8b 13                	mov    (%ebx),%edx
801024bc:	89 15 98 26 11 80    	mov    %edx,0x80112698
  if(kmem.use_lock)
801024c2:	85 c0                	test   %eax,%eax
801024c4:	74 0c                	je     801024d2 <kalloc+0x32>
    release(&kmem.lock);
801024c6:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
801024cd:	e8 2e 20 00 00       	call   80104500 <release>
  return (char*)r;
}
801024d2:	83 c4 14             	add    $0x14,%esp
801024d5:	89 d8                	mov    %ebx,%eax
801024d7:	5b                   	pop    %ebx
801024d8:	5d                   	pop    %ebp
801024d9:	c3                   	ret    
801024da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
801024e0:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
801024e7:	e8 e4 1e 00 00       	call   801043d0 <acquire>
801024ec:	a1 94 26 11 80       	mov    0x80112694,%eax
801024f1:	eb bd                	jmp    801024b0 <kalloc+0x10>
801024f3:	66 90                	xchg   %ax,%ax
801024f5:	66 90                	xchg   %ax,%ax
801024f7:	66 90                	xchg   %ax,%ax
801024f9:	66 90                	xchg   %ax,%ax
801024fb:	66 90                	xchg   %ax,%ax
801024fd:	66 90                	xchg   %ax,%ax
801024ff:	90                   	nop

80102500 <kbdgetc>:
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102500:	ba 64 00 00 00       	mov    $0x64,%edx
80102505:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102506:	a8 01                	test   $0x1,%al
80102508:	0f 84 ba 00 00 00    	je     801025c8 <kbdgetc+0xc8>
8010250e:	b2 60                	mov    $0x60,%dl
80102510:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102511:	0f b6 c8             	movzbl %al,%ecx

  if(data == 0xE0){
80102514:	81 f9 e0 00 00 00    	cmp    $0xe0,%ecx
8010251a:	0f 84 88 00 00 00    	je     801025a8 <kbdgetc+0xa8>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102520:	84 c0                	test   %al,%al
80102522:	79 2c                	jns    80102550 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102524:	8b 15 b4 a5 10 80    	mov    0x8010a5b4,%edx
8010252a:	f6 c2 40             	test   $0x40,%dl
8010252d:	75 05                	jne    80102534 <kbdgetc+0x34>
8010252f:	89 c1                	mov    %eax,%ecx
80102531:	83 e1 7f             	and    $0x7f,%ecx
    shift &= ~(shiftcode[data] | E0ESC);
80102534:	0f b6 81 60 73 10 80 	movzbl -0x7fef8ca0(%ecx),%eax
8010253b:	83 c8 40             	or     $0x40,%eax
8010253e:	0f b6 c0             	movzbl %al,%eax
80102541:	f7 d0                	not    %eax
80102543:	21 d0                	and    %edx,%eax
80102545:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
    return 0;
8010254a:	31 c0                	xor    %eax,%eax
8010254c:	c3                   	ret    
8010254d:	8d 76 00             	lea    0x0(%esi),%esi
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
80102550:	55                   	push   %ebp
80102551:	89 e5                	mov    %esp,%ebp
80102553:	53                   	push   %ebx
80102554:	8b 1d b4 a5 10 80    	mov    0x8010a5b4,%ebx
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
8010255a:	f6 c3 40             	test   $0x40,%bl
8010255d:	74 09                	je     80102568 <kbdgetc+0x68>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010255f:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102562:	83 e3 bf             	and    $0xffffffbf,%ebx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102565:	0f b6 c8             	movzbl %al,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
80102568:	0f b6 91 60 73 10 80 	movzbl -0x7fef8ca0(%ecx),%edx
  shift ^= togglecode[data];
8010256f:	0f b6 81 60 72 10 80 	movzbl -0x7fef8da0(%ecx),%eax
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
80102576:	09 da                	or     %ebx,%edx
  shift ^= togglecode[data];
80102578:	31 c2                	xor    %eax,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
8010257a:	89 d0                	mov    %edx,%eax
8010257c:	83 e0 03             	and    $0x3,%eax
8010257f:	8b 04 85 40 72 10 80 	mov    -0x7fef8dc0(,%eax,4),%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
80102586:	89 15 b4 a5 10 80    	mov    %edx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
8010258c:	83 e2 08             	and    $0x8,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
8010258f:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
  if(shift & CAPSLOCK){
80102593:	74 0b                	je     801025a0 <kbdgetc+0xa0>
    if('a' <= c && c <= 'z')
80102595:	8d 50 9f             	lea    -0x61(%eax),%edx
80102598:	83 fa 19             	cmp    $0x19,%edx
8010259b:	77 1b                	ja     801025b8 <kbdgetc+0xb8>
      c += 'A' - 'a';
8010259d:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025a0:	5b                   	pop    %ebx
801025a1:	5d                   	pop    %ebp
801025a2:	c3                   	ret    
801025a3:	90                   	nop
801025a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
801025a8:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
    return 0;
801025af:	31 c0                	xor    %eax,%eax
801025b1:	c3                   	ret    
801025b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
801025b8:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801025bb:	8d 50 20             	lea    0x20(%eax),%edx
801025be:	83 f9 19             	cmp    $0x19,%ecx
801025c1:	0f 46 c2             	cmovbe %edx,%eax
  }
  return c;
801025c4:	eb da                	jmp    801025a0 <kbdgetc+0xa0>
801025c6:	66 90                	xchg   %ax,%ax
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
801025c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025cd:	c3                   	ret    
801025ce:	66 90                	xchg   %ax,%ax

801025d0 <kbdintr>:
  return c;
}

void
kbdintr(void)
{
801025d0:	55                   	push   %ebp
801025d1:	89 e5                	mov    %esp,%ebp
801025d3:	83 ec 18             	sub    $0x18,%esp
  consoleintr(kbdgetc);
801025d6:	c7 04 24 00 25 10 80 	movl   $0x80102500,(%esp)
801025dd:	e8 ce e1 ff ff       	call   801007b0 <consoleintr>
}
801025e2:	c9                   	leave  
801025e3:	c3                   	ret    
801025e4:	66 90                	xchg   %ax,%ax
801025e6:	66 90                	xchg   %ax,%ax
801025e8:	66 90                	xchg   %ax,%ax
801025ea:	66 90                	xchg   %ax,%ax
801025ec:	66 90                	xchg   %ax,%ax
801025ee:	66 90                	xchg   %ax,%ax

801025f0 <fill_rtcdate>:

  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
801025f0:	55                   	push   %ebp
801025f1:	89 c1                	mov    %eax,%ecx
801025f3:	89 e5                	mov    %esp,%ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801025f5:	ba 70 00 00 00       	mov    $0x70,%edx
801025fa:	53                   	push   %ebx
801025fb:	31 c0                	xor    %eax,%eax
801025fd:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801025fe:	bb 71 00 00 00       	mov    $0x71,%ebx
80102603:	89 da                	mov    %ebx,%edx
80102605:	ec                   	in     (%dx),%al
static uint cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
80102606:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102609:	b2 70                	mov    $0x70,%dl
8010260b:	89 01                	mov    %eax,(%ecx)
8010260d:	b8 02 00 00 00       	mov    $0x2,%eax
80102612:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102613:	89 da                	mov    %ebx,%edx
80102615:	ec                   	in     (%dx),%al
80102616:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102619:	b2 70                	mov    $0x70,%dl
8010261b:	89 41 04             	mov    %eax,0x4(%ecx)
8010261e:	b8 04 00 00 00       	mov    $0x4,%eax
80102623:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102624:	89 da                	mov    %ebx,%edx
80102626:	ec                   	in     (%dx),%al
80102627:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010262a:	b2 70                	mov    $0x70,%dl
8010262c:	89 41 08             	mov    %eax,0x8(%ecx)
8010262f:	b8 07 00 00 00       	mov    $0x7,%eax
80102634:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102635:	89 da                	mov    %ebx,%edx
80102637:	ec                   	in     (%dx),%al
80102638:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010263b:	b2 70                	mov    $0x70,%dl
8010263d:	89 41 0c             	mov    %eax,0xc(%ecx)
80102640:	b8 08 00 00 00       	mov    $0x8,%eax
80102645:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102646:	89 da                	mov    %ebx,%edx
80102648:	ec                   	in     (%dx),%al
80102649:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010264c:	b2 70                	mov    $0x70,%dl
8010264e:	89 41 10             	mov    %eax,0x10(%ecx)
80102651:	b8 09 00 00 00       	mov    $0x9,%eax
80102656:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102657:	89 da                	mov    %ebx,%edx
80102659:	ec                   	in     (%dx),%al
8010265a:	0f b6 d8             	movzbl %al,%ebx
8010265d:	89 59 14             	mov    %ebx,0x14(%ecx)
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
}
80102660:	5b                   	pop    %ebx
80102661:	5d                   	pop    %ebp
80102662:	c3                   	ret    
80102663:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102670 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
  if(!lapic)
80102670:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}
//PAGEBREAK!

void
lapicinit(void)
{
80102675:	55                   	push   %ebp
80102676:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102678:	85 c0                	test   %eax,%eax
8010267a:	0f 84 c0 00 00 00    	je     80102740 <lapicinit+0xd0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102680:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102687:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010268a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010268d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102694:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102697:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010269a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801026a1:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801026a4:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026a7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801026ae:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801026b1:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026b4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026bb:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026be:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026c1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801026c8:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026cb:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801026ce:	8b 50 30             	mov    0x30(%eax),%edx
801026d1:	c1 ea 10             	shr    $0x10,%edx
801026d4:	80 fa 03             	cmp    $0x3,%dl
801026d7:	77 6f                	ja     80102748 <lapicinit+0xd8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026d9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026e0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026e3:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026e6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ed:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026f0:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026f3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026fa:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026fd:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102700:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102707:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010270a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010270d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102714:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102717:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010271a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102721:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102724:	8b 50 20             	mov    0x20(%eax),%edx
80102727:	90                   	nop
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102728:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
8010272e:	80 e6 10             	and    $0x10,%dh
80102731:	75 f5                	jne    80102728 <lapicinit+0xb8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102733:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
8010273a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010273d:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102740:	5d                   	pop    %ebp
80102741:	c3                   	ret    
80102742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102748:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
8010274f:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102752:	8b 50 20             	mov    0x20(%eax),%edx
80102755:	eb 82                	jmp    801026d9 <lapicinit+0x69>
80102757:	89 f6                	mov    %esi,%esi
80102759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102760 <cpunum>:
  lapicw(TPR, 0);
}

int
cpunum(void)
{
80102760:	55                   	push   %ebp
80102761:	89 e5                	mov    %esp,%ebp
80102763:	56                   	push   %esi
80102764:	53                   	push   %ebx
80102765:	83 ec 10             	sub    $0x10,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80102768:	9c                   	pushf  
80102769:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
8010276a:	f6 c4 02             	test   $0x2,%ah
8010276d:	74 12                	je     80102781 <cpunum+0x21>
    static int n;
    if(n++ == 0)
8010276f:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80102774:	8d 50 01             	lea    0x1(%eax),%edx
80102777:	85 c0                	test   %eax,%eax
80102779:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
8010277f:	74 4a                	je     801027cb <cpunum+0x6b>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
80102781:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102786:	85 c0                	test   %eax,%eax
80102788:	74 5d                	je     801027e7 <cpunum+0x87>
    return 0;

  apicid = lapic[ID] >> 24;
8010278a:	8b 58 20             	mov    0x20(%eax),%ebx
  for (i = 0; i < ncpu; ++i) {
8010278d:	8b 35 80 2d 11 80    	mov    0x80112d80,%esi
  }

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
80102793:	c1 eb 18             	shr    $0x18,%ebx
  for (i = 0; i < ncpu; ++i) {
80102796:	85 f6                	test   %esi,%esi
80102798:	7e 56                	jle    801027f0 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
8010279a:	0f b6 05 a0 27 11 80 	movzbl 0x801127a0,%eax
801027a1:	39 d8                	cmp    %ebx,%eax
801027a3:	74 42                	je     801027e7 <cpunum+0x87>
801027a5:	ba 5c 28 11 80       	mov    $0x8011285c,%edx

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
801027aa:	31 c0                	xor    %eax,%eax
801027ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027b0:	83 c0 01             	add    $0x1,%eax
801027b3:	39 f0                	cmp    %esi,%eax
801027b5:	74 39                	je     801027f0 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
801027b7:	0f b6 0a             	movzbl (%edx),%ecx
801027ba:	81 c2 bc 00 00 00    	add    $0xbc,%edx
801027c0:	39 d9                	cmp    %ebx,%ecx
801027c2:	75 ec                	jne    801027b0 <cpunum+0x50>
      return i;
  }
  panic("unknown apicid\n");
}
801027c4:	83 c4 10             	add    $0x10,%esp
801027c7:	5b                   	pop    %ebx
801027c8:	5e                   	pop    %esi
801027c9:	5d                   	pop    %ebp
801027ca:	c3                   	ret    
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
801027cb:	8b 45 04             	mov    0x4(%ebp),%eax
801027ce:	c7 04 24 60 74 10 80 	movl   $0x80107460,(%esp)
801027d5:	89 44 24 04          	mov    %eax,0x4(%esp)
801027d9:	e8 72 de ff ff       	call   80100650 <cprintf>
        __builtin_return_address(0));
  }

  if (!lapic)
801027de:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027e3:	85 c0                	test   %eax,%eax
801027e5:	75 a3                	jne    8010278a <cpunum+0x2a>
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801027e7:	83 c4 10             	add    $0x10,%esp
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
    return 0;
801027ea:	31 c0                	xor    %eax,%eax
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801027ec:	5b                   	pop    %ebx
801027ed:	5e                   	pop    %esi
801027ee:	5d                   	pop    %ebp
801027ef:	c3                   	ret    
  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
801027f0:	c7 04 24 8c 74 10 80 	movl   $0x8010748c,(%esp)
801027f7:	e8 64 db ff ff       	call   80100360 <panic>
801027fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102800 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102800:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
80102805:	55                   	push   %ebp
80102806:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102808:	85 c0                	test   %eax,%eax
8010280a:	74 0d                	je     80102819 <lapiceoi+0x19>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010280c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102813:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102816:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
80102819:	5d                   	pop    %ebp
8010281a:	c3                   	ret    
8010281b:	90                   	nop
8010281c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102820 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102820:	55                   	push   %ebp
80102821:	89 e5                	mov    %esp,%ebp
}
80102823:	5d                   	pop    %ebp
80102824:	c3                   	ret    
80102825:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102830 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102830:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102831:	ba 70 00 00 00       	mov    $0x70,%edx
80102836:	89 e5                	mov    %esp,%ebp
80102838:	b8 0f 00 00 00       	mov    $0xf,%eax
8010283d:	53                   	push   %ebx
8010283e:	8b 4d 08             	mov    0x8(%ebp),%ecx
80102841:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80102844:	ee                   	out    %al,(%dx)
80102845:	b8 0a 00 00 00       	mov    $0xa,%eax
8010284a:	b2 71                	mov    $0x71,%dl
8010284c:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
8010284d:	31 c0                	xor    %eax,%eax
8010284f:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
80102855:	89 d8                	mov    %ebx,%eax
80102857:	c1 e8 04             	shr    $0x4,%eax
8010285a:	66 a3 69 04 00 80    	mov    %ax,0x80000469
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102860:	a1 9c 26 11 80       	mov    0x8011269c,%eax
  wrv[0] = 0;
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102865:	c1 e1 18             	shl    $0x18,%ecx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102868:	c1 eb 0c             	shr    $0xc,%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010286b:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102871:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102874:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
8010287b:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010287e:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102881:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102888:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010288b:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010288e:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102894:	8b 50 20             	mov    0x20(%eax),%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102897:	89 da                	mov    %ebx,%edx
80102899:	80 ce 06             	or     $0x6,%dh
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010289c:	89 90 00 03 00 00    	mov    %edx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801028a2:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801028a5:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801028ab:	8b 48 20             	mov    0x20(%eax),%ecx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801028ae:	89 90 00 03 00 00    	mov    %edx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801028b4:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
801028b7:	5b                   	pop    %ebx
801028b8:	5d                   	pop    %ebp
801028b9:	c3                   	ret    
801028ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801028c0 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
801028c0:	55                   	push   %ebp
801028c1:	ba 70 00 00 00       	mov    $0x70,%edx
801028c6:	89 e5                	mov    %esp,%ebp
801028c8:	b8 0b 00 00 00       	mov    $0xb,%eax
801028cd:	57                   	push   %edi
801028ce:	56                   	push   %esi
801028cf:	53                   	push   %ebx
801028d0:	83 ec 4c             	sub    $0x4c,%esp
801028d3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028d4:	b2 71                	mov    $0x71,%dl
801028d6:	ec                   	in     (%dx),%al
801028d7:	88 45 b7             	mov    %al,-0x49(%ebp)
801028da:	8d 5d b8             	lea    -0x48(%ebp),%ebx
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);

  bcd = (sb & (1 << 2)) == 0;
801028dd:	80 65 b7 04          	andb   $0x4,-0x49(%ebp)
801028e1:	8d 7d d0             	lea    -0x30(%ebp),%edi
801028e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028e8:	be 70 00 00 00       	mov    $0x70,%esi

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
801028ed:	89 d8                	mov    %ebx,%eax
801028ef:	e8 fc fc ff ff       	call   801025f0 <fill_rtcdate>
801028f4:	b8 0a 00 00 00       	mov    $0xa,%eax
801028f9:	89 f2                	mov    %esi,%edx
801028fb:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028fc:	ba 71 00 00 00       	mov    $0x71,%edx
80102901:	ec                   	in     (%dx),%al
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102902:	84 c0                	test   %al,%al
80102904:	78 e7                	js     801028ed <cmostime+0x2d>
        continue;
    fill_rtcdate(&t2);
80102906:	89 f8                	mov    %edi,%eax
80102908:	e8 e3 fc ff ff       	call   801025f0 <fill_rtcdate>
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010290d:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
80102914:	00 
80102915:	89 7c 24 04          	mov    %edi,0x4(%esp)
80102919:	89 1c 24             	mov    %ebx,(%esp)
8010291c:	e8 7f 1c 00 00       	call   801045a0 <memcmp>
80102921:	85 c0                	test   %eax,%eax
80102923:	75 c3                	jne    801028e8 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102925:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80102929:	75 78                	jne    801029a3 <cmostime+0xe3>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010292b:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010292e:	89 c2                	mov    %eax,%edx
80102930:	83 e0 0f             	and    $0xf,%eax
80102933:	c1 ea 04             	shr    $0x4,%edx
80102936:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102939:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010293c:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
8010293f:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102942:	89 c2                	mov    %eax,%edx
80102944:	83 e0 0f             	and    $0xf,%eax
80102947:	c1 ea 04             	shr    $0x4,%edx
8010294a:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010294d:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102950:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102953:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102956:	89 c2                	mov    %eax,%edx
80102958:	83 e0 0f             	and    $0xf,%eax
8010295b:	c1 ea 04             	shr    $0x4,%edx
8010295e:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102961:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102964:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102967:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010296a:	89 c2                	mov    %eax,%edx
8010296c:	83 e0 0f             	and    $0xf,%eax
8010296f:	c1 ea 04             	shr    $0x4,%edx
80102972:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102975:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102978:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
8010297b:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010297e:	89 c2                	mov    %eax,%edx
80102980:	83 e0 0f             	and    $0xf,%eax
80102983:	c1 ea 04             	shr    $0x4,%edx
80102986:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102989:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010298c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
8010298f:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102992:	89 c2                	mov    %eax,%edx
80102994:	83 e0 0f             	and    $0xf,%eax
80102997:	c1 ea 04             	shr    $0x4,%edx
8010299a:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010299d:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029a0:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
801029a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
801029a6:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029a9:	89 01                	mov    %eax,(%ecx)
801029ab:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029ae:	89 41 04             	mov    %eax,0x4(%ecx)
801029b1:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029b4:	89 41 08             	mov    %eax,0x8(%ecx)
801029b7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029ba:	89 41 0c             	mov    %eax,0xc(%ecx)
801029bd:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029c0:	89 41 10             	mov    %eax,0x10(%ecx)
801029c3:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029c6:	89 41 14             	mov    %eax,0x14(%ecx)
  r->year += 2000;
801029c9:	81 41 14 d0 07 00 00 	addl   $0x7d0,0x14(%ecx)
}
801029d0:	83 c4 4c             	add    $0x4c,%esp
801029d3:	5b                   	pop    %ebx
801029d4:	5e                   	pop    %esi
801029d5:	5f                   	pop    %edi
801029d6:	5d                   	pop    %ebp
801029d7:	c3                   	ret    
801029d8:	66 90                	xchg   %ax,%ax
801029da:	66 90                	xchg   %ax,%ax
801029dc:	66 90                	xchg   %ax,%ax
801029de:	66 90                	xchg   %ax,%ax

801029e0 <install_trans>:
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
801029e0:	55                   	push   %ebp
801029e1:	89 e5                	mov    %esp,%ebp
801029e3:	57                   	push   %edi
801029e4:	56                   	push   %esi
801029e5:	53                   	push   %ebx
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029e6:	31 db                	xor    %ebx,%ebx
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
801029e8:	83 ec 1c             	sub    $0x1c,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029eb:	a1 e8 26 11 80       	mov    0x801126e8,%eax
801029f0:	85 c0                	test   %eax,%eax
801029f2:	7e 78                	jle    80102a6c <install_trans+0x8c>
801029f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
801029f8:	a1 d4 26 11 80       	mov    0x801126d4,%eax
801029fd:	01 d8                	add    %ebx,%eax
801029ff:	83 c0 01             	add    $0x1,%eax
80102a02:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a06:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102a0b:	89 04 24             	mov    %eax,(%esp)
80102a0e:	e8 bd d6 ff ff       	call   801000d0 <bread>
80102a13:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a15:	8b 04 9d ec 26 11 80 	mov    -0x7feed914(,%ebx,4),%eax
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a1c:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a1f:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a23:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102a28:	89 04 24             	mov    %eax,(%esp)
80102a2b:	e8 a0 d6 ff ff       	call   801000d0 <bread>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a30:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102a37:	00 
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a38:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a3a:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a3d:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a41:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a44:	89 04 24             	mov    %eax,(%esp)
80102a47:	e8 b4 1b 00 00       	call   80104600 <memmove>
    bwrite(dbuf);  // write dst to disk
80102a4c:	89 34 24             	mov    %esi,(%esp)
80102a4f:	e8 4c d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102a54:	89 3c 24             	mov    %edi,(%esp)
80102a57:	e8 84 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102a5c:	89 34 24             	mov    %esi,(%esp)
80102a5f:	e8 7c d7 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a64:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102a6a:	7f 8c                	jg     801029f8 <install_trans+0x18>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102a6c:	83 c4 1c             	add    $0x1c,%esp
80102a6f:	5b                   	pop    %ebx
80102a70:	5e                   	pop    %esi
80102a71:	5f                   	pop    %edi
80102a72:	5d                   	pop    %ebp
80102a73:	c3                   	ret    
80102a74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102a7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102a80 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a80:	55                   	push   %ebp
80102a81:	89 e5                	mov    %esp,%ebp
80102a83:	57                   	push   %edi
80102a84:	56                   	push   %esi
80102a85:	53                   	push   %ebx
80102a86:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a89:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102a8e:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a92:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102a97:	89 04 24             	mov    %eax,(%esp)
80102a9a:	e8 31 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a9f:	8b 1d e8 26 11 80    	mov    0x801126e8,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102aa5:	31 d2                	xor    %edx,%edx
80102aa7:	85 db                	test   %ebx,%ebx
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102aa9:	89 c7                	mov    %eax,%edi
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102aab:	89 58 5c             	mov    %ebx,0x5c(%eax)
80102aae:	8d 70 5c             	lea    0x5c(%eax),%esi
  for (i = 0; i < log.lh.n; i++) {
80102ab1:	7e 17                	jle    80102aca <write_head+0x4a>
80102ab3:	90                   	nop
80102ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102ab8:	8b 0c 95 ec 26 11 80 	mov    -0x7feed914(,%edx,4),%ecx
80102abf:	89 4c 96 04          	mov    %ecx,0x4(%esi,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102ac3:	83 c2 01             	add    $0x1,%edx
80102ac6:	39 da                	cmp    %ebx,%edx
80102ac8:	75 ee                	jne    80102ab8 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102aca:	89 3c 24             	mov    %edi,(%esp)
80102acd:	e8 ce d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102ad2:	89 3c 24             	mov    %edi,(%esp)
80102ad5:	e8 06 d7 ff ff       	call   801001e0 <brelse>
}
80102ada:	83 c4 1c             	add    $0x1c,%esp
80102add:	5b                   	pop    %ebx
80102ade:	5e                   	pop    %esi
80102adf:	5f                   	pop    %edi
80102ae0:	5d                   	pop    %ebp
80102ae1:	c3                   	ret    
80102ae2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102af0 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102af0:	55                   	push   %ebp
80102af1:	89 e5                	mov    %esp,%ebp
80102af3:	56                   	push   %esi
80102af4:	53                   	push   %ebx
80102af5:	83 ec 30             	sub    $0x30,%esp
80102af8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102afb:	c7 44 24 04 9c 74 10 	movl   $0x8010749c,0x4(%esp)
80102b02:	80 
80102b03:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102b0a:	e8 41 18 00 00       	call   80104350 <initlock>
  readsb(dev, &sb);
80102b0f:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b12:	89 44 24 04          	mov    %eax,0x4(%esp)
80102b16:	89 1c 24             	mov    %ebx,(%esp)
80102b19:	e8 82 e8 ff ff       	call   801013a0 <readsb>
  log.start = sb.logstart;
80102b1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  log.size = sb.nlog;
80102b21:	8b 55 e8             	mov    -0x18(%ebp),%edx

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b24:	89 1c 24             	mov    %ebx,(%esp)
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102b27:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b2d:	89 44 24 04          	mov    %eax,0x4(%esp)

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102b31:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102b37:	a3 d4 26 11 80       	mov    %eax,0x801126d4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b3c:	e8 8f d5 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102b41:	31 d2                	xor    %edx,%edx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b43:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102b46:	8d 70 5c             	lea    0x5c(%eax),%esi
  for (i = 0; i < log.lh.n; i++) {
80102b49:	85 db                	test   %ebx,%ebx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b4b:	89 1d e8 26 11 80    	mov    %ebx,0x801126e8
  for (i = 0; i < log.lh.n; i++) {
80102b51:	7e 17                	jle    80102b6a <initlog+0x7a>
80102b53:	90                   	nop
80102b54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    log.lh.block[i] = lh->block[i];
80102b58:	8b 4c 96 04          	mov    0x4(%esi,%edx,4),%ecx
80102b5c:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102b63:	83 c2 01             	add    $0x1,%edx
80102b66:	39 da                	cmp    %ebx,%edx
80102b68:	75 ee                	jne    80102b58 <initlog+0x68>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102b6a:	89 04 24             	mov    %eax,(%esp)
80102b6d:	e8 6e d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102b72:	e8 69 fe ff ff       	call   801029e0 <install_trans>
  log.lh.n = 0;
80102b77:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102b7e:	00 00 00 
  write_head(); // clear the log
80102b81:	e8 fa fe ff ff       	call   80102a80 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102b86:	83 c4 30             	add    $0x30,%esp
80102b89:	5b                   	pop    %ebx
80102b8a:	5e                   	pop    %esi
80102b8b:	5d                   	pop    %ebp
80102b8c:	c3                   	ret    
80102b8d:	8d 76 00             	lea    0x0(%esi),%esi

80102b90 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b90:	55                   	push   %ebp
80102b91:	89 e5                	mov    %esp,%ebp
80102b93:	83 ec 18             	sub    $0x18,%esp
  acquire(&log.lock);
80102b96:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102b9d:	e8 2e 18 00 00       	call   801043d0 <acquire>
80102ba2:	eb 18                	jmp    80102bbc <begin_op+0x2c>
80102ba4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102ba8:	c7 44 24 04 a0 26 11 	movl   $0x801126a0,0x4(%esp)
80102baf:	80 
80102bb0:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102bb7:	e8 14 13 00 00       	call   80103ed0 <sleep>
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102bbc:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102bc1:	85 c0                	test   %eax,%eax
80102bc3:	75 e3                	jne    80102ba8 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102bc5:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102bca:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102bd0:	83 c0 01             	add    $0x1,%eax
80102bd3:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bd6:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bd9:	83 fa 1e             	cmp    $0x1e,%edx
80102bdc:	7f ca                	jg     80102ba8 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102bde:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102be5:	a3 dc 26 11 80       	mov    %eax,0x801126dc
      release(&log.lock);
80102bea:	e8 11 19 00 00       	call   80104500 <release>
      break;
    }
  }
}
80102bef:	c9                   	leave  
80102bf0:	c3                   	ret    
80102bf1:	eb 0d                	jmp    80102c00 <end_op>
80102bf3:	90                   	nop
80102bf4:	90                   	nop
80102bf5:	90                   	nop
80102bf6:	90                   	nop
80102bf7:	90                   	nop
80102bf8:	90                   	nop
80102bf9:	90                   	nop
80102bfa:	90                   	nop
80102bfb:	90                   	nop
80102bfc:	90                   	nop
80102bfd:	90                   	nop
80102bfe:	90                   	nop
80102bff:	90                   	nop

80102c00 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102c00:	55                   	push   %ebp
80102c01:	89 e5                	mov    %esp,%ebp
80102c03:	57                   	push   %edi
80102c04:	56                   	push   %esi
80102c05:	53                   	push   %ebx
80102c06:	83 ec 1c             	sub    $0x1c,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102c09:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102c10:	e8 bb 17 00 00       	call   801043d0 <acquire>
  log.outstanding -= 1;
80102c15:	a1 dc 26 11 80       	mov    0x801126dc,%eax
  if(log.committing)
80102c1a:	8b 15 e0 26 11 80    	mov    0x801126e0,%edx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c20:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102c23:	85 d2                	test   %edx,%edx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c25:	a3 dc 26 11 80       	mov    %eax,0x801126dc
  if(log.committing)
80102c2a:	0f 85 f3 00 00 00    	jne    80102d23 <end_op+0x123>
    panic("log.committing");
  if(log.outstanding == 0){
80102c30:	85 c0                	test   %eax,%eax
80102c32:	0f 85 cb 00 00 00    	jne    80102d03 <end_op+0x103>
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102c38:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c3f:	31 db                	xor    %ebx,%ebx
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102c41:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102c48:	00 00 00 
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102c4b:	e8 b0 18 00 00       	call   80104500 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c50:	a1 e8 26 11 80       	mov    0x801126e8,%eax
80102c55:	85 c0                	test   %eax,%eax
80102c57:	0f 8e 90 00 00 00    	jle    80102ced <end_op+0xed>
80102c5d:	8d 76 00             	lea    0x0(%esi),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c60:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102c65:	01 d8                	add    %ebx,%eax
80102c67:	83 c0 01             	add    $0x1,%eax
80102c6a:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c6e:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102c73:	89 04 24             	mov    %eax,(%esp)
80102c76:	e8 55 d4 ff ff       	call   801000d0 <bread>
80102c7b:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c7d:	8b 04 9d ec 26 11 80 	mov    -0x7feed914(,%ebx,4),%eax
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c84:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c87:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c8b:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102c90:	89 04 24             	mov    %eax,(%esp)
80102c93:	e8 38 d4 ff ff       	call   801000d0 <bread>
    memmove(to->data, from->data, BSIZE);
80102c98:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102c9f:	00 
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102ca0:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102ca2:	8d 40 5c             	lea    0x5c(%eax),%eax
80102ca5:	89 44 24 04          	mov    %eax,0x4(%esp)
80102ca9:	8d 46 5c             	lea    0x5c(%esi),%eax
80102cac:	89 04 24             	mov    %eax,(%esp)
80102caf:	e8 4c 19 00 00       	call   80104600 <memmove>
    bwrite(to);  // write the log
80102cb4:	89 34 24             	mov    %esi,(%esp)
80102cb7:	e8 e4 d4 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102cbc:	89 3c 24             	mov    %edi,(%esp)
80102cbf:	e8 1c d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102cc4:	89 34 24             	mov    %esi,(%esp)
80102cc7:	e8 14 d5 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102ccc:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102cd2:	7c 8c                	jl     80102c60 <end_op+0x60>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102cd4:	e8 a7 fd ff ff       	call   80102a80 <write_head>
    install_trans(); // Now install writes to home locations
80102cd9:	e8 02 fd ff ff       	call   801029e0 <install_trans>
    log.lh.n = 0;
80102cde:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102ce5:	00 00 00 
    write_head();    // Erase the transaction from the log
80102ce8:	e8 93 fd ff ff       	call   80102a80 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102ced:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102cf4:	e8 d7 16 00 00       	call   801043d0 <acquire>
    log.committing = 0;
80102cf9:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102d00:	00 00 00 
    wakeup(&log);
80102d03:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d0a:	e8 71 13 00 00       	call   80104080 <wakeup>
    release(&log.lock);
80102d0f:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d16:	e8 e5 17 00 00       	call   80104500 <release>
  }
}
80102d1b:	83 c4 1c             	add    $0x1c,%esp
80102d1e:	5b                   	pop    %ebx
80102d1f:	5e                   	pop    %esi
80102d20:	5f                   	pop    %edi
80102d21:	5d                   	pop    %ebp
80102d22:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102d23:	c7 04 24 a0 74 10 80 	movl   $0x801074a0,(%esp)
80102d2a:	e8 31 d6 ff ff       	call   80100360 <panic>
80102d2f:	90                   	nop

80102d30 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d30:	55                   	push   %ebp
80102d31:	89 e5                	mov    %esp,%ebp
80102d33:	53                   	push   %ebx
80102d34:	83 ec 14             	sub    $0x14,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d37:	a1 e8 26 11 80       	mov    0x801126e8,%eax
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d3c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d3f:	83 f8 1d             	cmp    $0x1d,%eax
80102d42:	0f 8f 98 00 00 00    	jg     80102de0 <log_write+0xb0>
80102d48:	8b 0d d8 26 11 80    	mov    0x801126d8,%ecx
80102d4e:	8d 51 ff             	lea    -0x1(%ecx),%edx
80102d51:	39 d0                	cmp    %edx,%eax
80102d53:	0f 8d 87 00 00 00    	jge    80102de0 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102d59:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102d5e:	85 c0                	test   %eax,%eax
80102d60:	0f 8e 86 00 00 00    	jle    80102dec <log_write+0xbc>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102d66:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d6d:	e8 5e 16 00 00       	call   801043d0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102d72:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102d78:	83 fa 00             	cmp    $0x0,%edx
80102d7b:	7e 54                	jle    80102dd1 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d7d:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d80:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d82:	39 0d ec 26 11 80    	cmp    %ecx,0x801126ec
80102d88:	75 0f                	jne    80102d99 <log_write+0x69>
80102d8a:	eb 3c                	jmp    80102dc8 <log_write+0x98>
80102d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102d90:	39 0c 85 ec 26 11 80 	cmp    %ecx,-0x7feed914(,%eax,4)
80102d97:	74 2f                	je     80102dc8 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d99:	83 c0 01             	add    $0x1,%eax
80102d9c:	39 d0                	cmp    %edx,%eax
80102d9e:	75 f0                	jne    80102d90 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102da0:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102da7:	83 c2 01             	add    $0x1,%edx
80102daa:	89 15 e8 26 11 80    	mov    %edx,0x801126e8
  b->flags |= B_DIRTY; // prevent eviction
80102db0:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102db3:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
}
80102dba:	83 c4 14             	add    $0x14,%esp
80102dbd:	5b                   	pop    %ebx
80102dbe:	5d                   	pop    %ebp
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102dbf:	e9 3c 17 00 00       	jmp    80104500 <release>
80102dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102dc8:	89 0c 85 ec 26 11 80 	mov    %ecx,-0x7feed914(,%eax,4)
80102dcf:	eb df                	jmp    80102db0 <log_write+0x80>
80102dd1:	8b 43 08             	mov    0x8(%ebx),%eax
80102dd4:	a3 ec 26 11 80       	mov    %eax,0x801126ec
  if (i == log.lh.n)
80102dd9:	75 d5                	jne    80102db0 <log_write+0x80>
80102ddb:	eb ca                	jmp    80102da7 <log_write+0x77>
80102ddd:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102de0:	c7 04 24 af 74 10 80 	movl   $0x801074af,(%esp)
80102de7:	e8 74 d5 ff ff       	call   80100360 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102dec:	c7 04 24 c5 74 10 80 	movl   $0x801074c5,(%esp)
80102df3:	e8 68 d5 ff ff       	call   80100360 <panic>
80102df8:	66 90                	xchg   %ax,%ax
80102dfa:	66 90                	xchg   %ax,%ax
80102dfc:	66 90                	xchg   %ax,%ax
80102dfe:	66 90                	xchg   %ax,%ax

80102e00 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e00:	55                   	push   %ebp
80102e01:	89 e5                	mov    %esp,%ebp
80102e03:	83 ec 18             	sub    $0x18,%esp
  cprintf("cpu%d: starting\n", cpunum());
80102e06:	e8 55 f9 ff ff       	call   80102760 <cpunum>
80102e0b:	c7 04 24 e0 74 10 80 	movl   $0x801074e0,(%esp)
80102e12:	89 44 24 04          	mov    %eax,0x4(%esp)
80102e16:	e8 35 d8 ff ff       	call   80100650 <cprintf>
  idtinit();       // load idt register
80102e1b:	e8 10 2a 00 00       	call   80105830 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
80102e20:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e27:	b8 01 00 00 00       	mov    $0x1,%eax
80102e2c:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
80102e33:	e8 48 0d 00 00       	call   80103b80 <scheduler>
80102e38:	90                   	nop
80102e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e40 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e40:	55                   	push   %ebp
80102e41:	89 e5                	mov    %esp,%ebp
80102e43:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e46:	e8 d5 3b 00 00       	call   80106a20 <switchkvm>
  seginit();
80102e4b:	e8 f0 39 00 00       	call   80106840 <seginit>
  lapicinit();
80102e50:	e8 1b f8 ff ff       	call   80102670 <lapicinit>
  mpmain();
80102e55:	e8 a6 ff ff ff       	call   80102e00 <mpmain>
80102e5a:	66 90                	xchg   %ax,%ax
80102e5c:	66 90                	xchg   %ax,%ax
80102e5e:	66 90                	xchg   %ax,%ax

80102e60 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102e60:	55                   	push   %ebp
80102e61:	89 e5                	mov    %esp,%ebp
80102e63:	53                   	push   %ebx
80102e64:	83 e4 f0             	and    $0xfffffff0,%esp
80102e67:	83 ec 10             	sub    $0x10,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e6a:	c7 44 24 04 00 00 40 	movl   $0x80400000,0x4(%esp)
80102e71:	80 
80102e72:	c7 04 24 28 5d 11 80 	movl   $0x80115d28,(%esp)
80102e79:	e8 62 f5 ff ff       	call   801023e0 <kinit1>
  kvmalloc();      // kernel page table
80102e7e:	e8 7d 3b 00 00       	call   80106a00 <kvmalloc>
  mpinit();        // detect other processors
80102e83:	e8 a8 01 00 00       	call   80103030 <mpinit>
  lapicinit();     // interrupt controller
80102e88:	e8 e3 f7 ff ff       	call   80102670 <lapicinit>
80102e8d:	8d 76 00             	lea    0x0(%esi),%esi
  seginit();       // segment descriptors
80102e90:	e8 ab 39 00 00       	call   80106840 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80102e95:	e8 c6 f8 ff ff       	call   80102760 <cpunum>
80102e9a:	c7 04 24 f1 74 10 80 	movl   $0x801074f1,(%esp)
80102ea1:	89 44 24 04          	mov    %eax,0x4(%esp)
80102ea5:	e8 a6 d7 ff ff       	call   80100650 <cprintf>
  picinit();       // another interrupt controller
80102eaa:	e8 81 03 00 00       	call   80103230 <picinit>
  ioapicinit();    // another interrupt controller
80102eaf:	e8 4c f3 ff ff       	call   80102200 <ioapicinit>
  consoleinit();   // console hardware
80102eb4:	e8 97 da ff ff       	call   80100950 <consoleinit>
  uartinit();      // serial port
80102eb9:	e8 92 2c 00 00       	call   80105b50 <uartinit>
80102ebe:	66 90                	xchg   %ax,%ax
  pinit();         // process table
80102ec0:	e8 db 08 00 00       	call   801037a0 <pinit>
  tvinit();        // trap vectors
80102ec5:	e8 c6 28 00 00       	call   80105790 <tvinit>
  binit();         // buffer cache
80102eca:	e8 71 d1 ff ff       	call   80100040 <binit>
80102ecf:	90                   	nop
  fileinit();      // file table
80102ed0:	e8 7b de ff ff       	call   80100d50 <fileinit>
  ideinit();       // disk
80102ed5:	e8 16 f1 ff ff       	call   80101ff0 <ideinit>
  if(!ismp)
80102eda:	a1 84 27 11 80       	mov    0x80112784,%eax
80102edf:	85 c0                	test   %eax,%eax
80102ee1:	0f 84 ca 00 00 00    	je     80102fb1 <main+0x151>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102ee7:	c7 44 24 08 8a 00 00 	movl   $0x8a,0x8(%esp)
80102eee:	00 

  for(c = cpus; c < cpus+ncpu; c++){
80102eef:	bb a0 27 11 80       	mov    $0x801127a0,%ebx

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102ef4:	c7 44 24 04 8c a4 10 	movl   $0x8010a48c,0x4(%esp)
80102efb:	80 
80102efc:	c7 04 24 00 70 00 80 	movl   $0x80007000,(%esp)
80102f03:	e8 f8 16 00 00       	call   80104600 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102f08:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102f0f:	00 00 00 
80102f12:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f17:	39 d8                	cmp    %ebx,%eax
80102f19:	76 78                	jbe    80102f93 <main+0x133>
80102f1b:	90                   	nop
80102f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == cpus+cpunum())  // We've started already.
80102f20:	e8 3b f8 ff ff       	call   80102760 <cpunum>
80102f25:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102f2b:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f30:	39 c3                	cmp    %eax,%ebx
80102f32:	74 46                	je     80102f7a <main+0x11a>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f34:	e8 67 f5 ff ff       	call   801024a0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
80102f39:	c7 05 f8 6f 00 80 40 	movl   $0x80102e40,0x80006ff8
80102f40:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f43:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f4a:	90 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f4d:	05 00 10 00 00       	add    $0x1000,%eax
80102f52:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f57:	0f b6 03             	movzbl (%ebx),%eax
80102f5a:	c7 44 24 04 00 70 00 	movl   $0x7000,0x4(%esp)
80102f61:	00 
80102f62:	89 04 24             	mov    %eax,(%esp)
80102f65:	e8 c6 f8 ff ff       	call   80102830 <lapicstartap>
80102f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f70:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80102f76:	85 c0                	test   %eax,%eax
80102f78:	74 f6                	je     80102f70 <main+0x110>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f7a:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102f81:	00 00 00 
80102f84:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
80102f8a:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f8f:	39 c3                	cmp    %eax,%ebx
80102f91:	72 8d                	jb     80102f20 <main+0xc0>
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f93:	c7 44 24 04 00 00 00 	movl   $0x8e000000,0x4(%esp)
80102f9a:	8e 
80102f9b:	c7 04 24 00 00 40 80 	movl   $0x80400000,(%esp)
80102fa2:	e8 a9 f4 ff ff       	call   80102450 <kinit2>
  userinit();      // first user process
80102fa7:	e8 14 08 00 00       	call   801037c0 <userinit>
  mpmain();        // finish this processor's setup
80102fac:	e8 4f fe ff ff       	call   80102e00 <mpmain>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
80102fb1:	e8 7a 27 00 00       	call   80105730 <timerinit>
80102fb6:	e9 2c ff ff ff       	jmp    80102ee7 <main+0x87>
80102fbb:	66 90                	xchg   %ax,%ax
80102fbd:	66 90                	xchg   %ax,%ax
80102fbf:	90                   	nop

80102fc0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fc0:	55                   	push   %ebp
80102fc1:	89 e5                	mov    %esp,%ebp
80102fc3:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102fc4:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fca:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
80102fcb:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fce:	83 ec 10             	sub    $0x10,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fd1:	39 de                	cmp    %ebx,%esi
80102fd3:	73 3c                	jae    80103011 <mpsearch1+0x51>
80102fd5:	8d 76 00             	lea    0x0(%esi),%esi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fd8:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80102fdf:	00 
80102fe0:	c7 44 24 04 08 75 10 	movl   $0x80107508,0x4(%esp)
80102fe7:	80 
80102fe8:	89 34 24             	mov    %esi,(%esp)
80102feb:	e8 b0 15 00 00       	call   801045a0 <memcmp>
80102ff0:	85 c0                	test   %eax,%eax
80102ff2:	75 16                	jne    8010300a <mpsearch1+0x4a>
80102ff4:	31 c9                	xor    %ecx,%ecx
80102ff6:	31 d2                	xor    %edx,%edx
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80102ff8:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102ffc:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
80102fff:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103001:	83 fa 10             	cmp    $0x10,%edx
80103004:	75 f2                	jne    80102ff8 <mpsearch1+0x38>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103006:	84 c9                	test   %cl,%cl
80103008:	74 10                	je     8010301a <mpsearch1+0x5a>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
8010300a:	83 c6 10             	add    $0x10,%esi
8010300d:	39 f3                	cmp    %esi,%ebx
8010300f:	77 c7                	ja     80102fd8 <mpsearch1+0x18>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
80103011:	83 c4 10             	add    $0x10,%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80103014:	31 c0                	xor    %eax,%eax
}
80103016:	5b                   	pop    %ebx
80103017:	5e                   	pop    %esi
80103018:	5d                   	pop    %ebp
80103019:	c3                   	ret    
8010301a:	83 c4 10             	add    $0x10,%esp
8010301d:	89 f0                	mov    %esi,%eax
8010301f:	5b                   	pop    %ebx
80103020:	5e                   	pop    %esi
80103021:	5d                   	pop    %ebp
80103022:	c3                   	ret    
80103023:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103030 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103030:	55                   	push   %ebp
80103031:	89 e5                	mov    %esp,%ebp
80103033:	57                   	push   %edi
80103034:	56                   	push   %esi
80103035:	53                   	push   %ebx
80103036:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103039:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103040:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103047:	c1 e0 08             	shl    $0x8,%eax
8010304a:	09 d0                	or     %edx,%eax
8010304c:	c1 e0 04             	shl    $0x4,%eax
8010304f:	85 c0                	test   %eax,%eax
80103051:	75 1b                	jne    8010306e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103053:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010305a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103061:	c1 e0 08             	shl    $0x8,%eax
80103064:	09 d0                	or     %edx,%eax
80103066:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103069:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010306e:	ba 00 04 00 00       	mov    $0x400,%edx
80103073:	e8 48 ff ff ff       	call   80102fc0 <mpsearch1>
80103078:	85 c0                	test   %eax,%eax
8010307a:	89 c7                	mov    %eax,%edi
8010307c:	0f 84 4e 01 00 00    	je     801031d0 <mpinit+0x1a0>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103082:	8b 77 04             	mov    0x4(%edi),%esi
80103085:	85 f6                	test   %esi,%esi
80103087:	0f 84 ce 00 00 00    	je     8010315b <mpinit+0x12b>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010308d:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80103093:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
8010309a:	00 
8010309b:	c7 44 24 04 0d 75 10 	movl   $0x8010750d,0x4(%esp)
801030a2:	80 
801030a3:	89 04 24             	mov    %eax,(%esp)
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
801030a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
801030a9:	e8 f2 14 00 00       	call   801045a0 <memcmp>
801030ae:	85 c0                	test   %eax,%eax
801030b0:	0f 85 a5 00 00 00    	jne    8010315b <mpinit+0x12b>
    return 0;
  if(conf->version != 1 && conf->version != 4)
801030b6:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
801030bd:	3c 04                	cmp    $0x4,%al
801030bf:	0f 85 29 01 00 00    	jne    801031ee <mpinit+0x1be>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030c5:	0f b7 86 04 00 00 80 	movzwl -0x7ffffffc(%esi),%eax
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030cc:	85 c0                	test   %eax,%eax
801030ce:	74 1d                	je     801030ed <mpinit+0xbd>
static uchar
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
801030d0:	31 c9                	xor    %ecx,%ecx
  for(i=0; i<len; i++)
801030d2:	31 d2                	xor    %edx,%edx
801030d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
801030d8:	0f b6 9c 16 00 00 00 	movzbl -0x80000000(%esi,%edx,1),%ebx
801030df:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030e0:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
801030e3:	01 d9                	add    %ebx,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030e5:	39 d0                	cmp    %edx,%eax
801030e7:	7f ef                	jg     801030d8 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030e9:	84 c9                	test   %cl,%cl
801030eb:	75 6e                	jne    8010315b <mpinit+0x12b>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801030ed:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801030f0:	85 db                	test   %ebx,%ebx
801030f2:	74 67                	je     8010315b <mpinit+0x12b>
    return;
  ismp = 1;
801030f4:	c7 05 84 27 11 80 01 	movl   $0x1,0x80112784
801030fb:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
801030fe:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
80103104:	a3 9c 26 11 80       	mov    %eax,0x8011269c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103109:	0f b7 8e 04 00 00 80 	movzwl -0x7ffffffc(%esi),%ecx
80103110:	8d 86 2c 00 00 80    	lea    -0x7fffffd4(%esi),%eax
80103116:	01 d9                	add    %ebx,%ecx
80103118:	39 c8                	cmp    %ecx,%eax
8010311a:	0f 83 90 00 00 00    	jae    801031b0 <mpinit+0x180>
    switch(*p){
80103120:	80 38 04             	cmpb   $0x4,(%eax)
80103123:	77 7b                	ja     801031a0 <mpinit+0x170>
80103125:	0f b6 10             	movzbl (%eax),%edx
80103128:	ff 24 95 14 75 10 80 	jmp    *-0x7fef8aec(,%edx,4)
8010312f:	90                   	nop
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103130:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103133:	39 c1                	cmp    %eax,%ecx
80103135:	77 e9                	ja     80103120 <mpinit+0xf0>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp){
80103137:	a1 84 27 11 80       	mov    0x80112784,%eax
8010313c:	85 c0                	test   %eax,%eax
8010313e:	75 70                	jne    801031b0 <mpinit+0x180>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
80103140:	c7 05 80 2d 11 80 01 	movl   $0x1,0x80112d80
80103147:	00 00 00 
    lapic = 0;
8010314a:	c7 05 9c 26 11 80 00 	movl   $0x0,0x8011269c
80103151:	00 00 00 
    ioapicid = 0;
80103154:	c6 05 80 27 11 80 00 	movb   $0x0,0x80112780
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010315b:	83 c4 1c             	add    $0x1c,%esp
8010315e:	5b                   	pop    %ebx
8010315f:	5e                   	pop    %esi
80103160:	5f                   	pop    %edi
80103161:	5d                   	pop    %ebp
80103162:	c3                   	ret    
80103163:	90                   	nop
80103164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103168:	8b 15 80 2d 11 80    	mov    0x80112d80,%edx
8010316e:	83 fa 07             	cmp    $0x7,%edx
80103171:	7f 17                	jg     8010318a <mpinit+0x15a>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103173:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
80103177:	69 d2 bc 00 00 00    	imul   $0xbc,%edx,%edx
        ncpu++;
8010317d:	83 05 80 2d 11 80 01 	addl   $0x1,0x80112d80
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103184:	88 9a a0 27 11 80    	mov    %bl,-0x7feed860(%edx)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010318a:	83 c0 14             	add    $0x14,%eax
      continue;
8010318d:	eb a4                	jmp    80103133 <mpinit+0x103>
8010318f:	90                   	nop
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103190:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
80103194:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103197:	88 15 80 27 11 80    	mov    %dl,0x80112780
      p += sizeof(struct mpioapic);
      continue;
8010319d:	eb 94                	jmp    80103133 <mpinit+0x103>
8010319f:	90                   	nop
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
801031a0:	c7 05 84 27 11 80 00 	movl   $0x0,0x80112784
801031a7:	00 00 00 
      break;
801031aa:	eb 87                	jmp    80103133 <mpinit+0x103>
801031ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    lapic = 0;
    ioapicid = 0;
    return;
  }

  if(mp->imcrp){
801031b0:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
801031b4:	74 a5                	je     8010315b <mpinit+0x12b>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801031b6:	ba 22 00 00 00       	mov    $0x22,%edx
801031bb:	b8 70 00 00 00       	mov    $0x70,%eax
801031c0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801031c1:	b2 23                	mov    $0x23,%dl
801031c3:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
801031c4:	83 c8 01             	or     $0x1,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801031c7:	ee                   	out    %al,(%dx)
  }
}
801031c8:	83 c4 1c             	add    $0x1c,%esp
801031cb:	5b                   	pop    %ebx
801031cc:	5e                   	pop    %esi
801031cd:	5f                   	pop    %edi
801031ce:	5d                   	pop    %ebp
801031cf:	c3                   	ret    
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801031d0:	ba 00 00 01 00       	mov    $0x10000,%edx
801031d5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031da:	e8 e1 fd ff ff       	call   80102fc0 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031df:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801031e1:	89 c7                	mov    %eax,%edi
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031e3:	0f 85 99 fe ff ff    	jne    80103082 <mpinit+0x52>
801031e9:	e9 6d ff ff ff       	jmp    8010315b <mpinit+0x12b>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
801031ee:	3c 01                	cmp    $0x1,%al
801031f0:	0f 84 cf fe ff ff    	je     801030c5 <mpinit+0x95>
801031f6:	e9 60 ff ff ff       	jmp    8010315b <mpinit+0x12b>
801031fb:	66 90                	xchg   %ax,%ax
801031fd:	66 90                	xchg   %ax,%ax
801031ff:	90                   	nop

80103200 <picenable>:
80103200:	55                   	push   %ebp
80103201:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
80103206:	ba 21 00 00 00       	mov    $0x21,%edx
8010320b:	89 e5                	mov    %esp,%ebp
8010320d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103210:	d3 c0                	rol    %cl,%eax
80103212:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
80103219:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
8010321f:	ee                   	out    %al,(%dx)
80103220:	ba a1 00 00 00       	mov    $0xa1,%edx
80103225:	66 c1 e8 08          	shr    $0x8,%ax
80103229:	ee                   	out    %al,(%dx)
8010322a:	5d                   	pop    %ebp
8010322b:	c3                   	ret    
8010322c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103230 <picinit>:
80103230:	55                   	push   %ebp
80103231:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103236:	89 e5                	mov    %esp,%ebp
80103238:	57                   	push   %edi
80103239:	56                   	push   %esi
8010323a:	53                   	push   %ebx
8010323b:	bb 21 00 00 00       	mov    $0x21,%ebx
80103240:	89 da                	mov    %ebx,%edx
80103242:	ee                   	out    %al,(%dx)
80103243:	b9 a1 00 00 00       	mov    $0xa1,%ecx
80103248:	89 ca                	mov    %ecx,%edx
8010324a:	ee                   	out    %al,(%dx)
8010324b:	bf 11 00 00 00       	mov    $0x11,%edi
80103250:	be 20 00 00 00       	mov    $0x20,%esi
80103255:	89 f8                	mov    %edi,%eax
80103257:	89 f2                	mov    %esi,%edx
80103259:	ee                   	out    %al,(%dx)
8010325a:	b8 20 00 00 00       	mov    $0x20,%eax
8010325f:	89 da                	mov    %ebx,%edx
80103261:	ee                   	out    %al,(%dx)
80103262:	b8 04 00 00 00       	mov    $0x4,%eax
80103267:	ee                   	out    %al,(%dx)
80103268:	b8 03 00 00 00       	mov    $0x3,%eax
8010326d:	ee                   	out    %al,(%dx)
8010326e:	bb a0 00 00 00       	mov    $0xa0,%ebx
80103273:	89 f8                	mov    %edi,%eax
80103275:	89 da                	mov    %ebx,%edx
80103277:	ee                   	out    %al,(%dx)
80103278:	b8 28 00 00 00       	mov    $0x28,%eax
8010327d:	89 ca                	mov    %ecx,%edx
8010327f:	ee                   	out    %al,(%dx)
80103280:	b8 02 00 00 00       	mov    $0x2,%eax
80103285:	ee                   	out    %al,(%dx)
80103286:	b8 03 00 00 00       	mov    $0x3,%eax
8010328b:	ee                   	out    %al,(%dx)
8010328c:	bf 68 00 00 00       	mov    $0x68,%edi
80103291:	89 f2                	mov    %esi,%edx
80103293:	89 f8                	mov    %edi,%eax
80103295:	ee                   	out    %al,(%dx)
80103296:	b9 0a 00 00 00       	mov    $0xa,%ecx
8010329b:	89 c8                	mov    %ecx,%eax
8010329d:	ee                   	out    %al,(%dx)
8010329e:	89 f8                	mov    %edi,%eax
801032a0:	89 da                	mov    %ebx,%edx
801032a2:	ee                   	out    %al,(%dx)
801032a3:	89 c8                	mov    %ecx,%eax
801032a5:	ee                   	out    %al,(%dx)
801032a6:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
801032ad:	66 83 f8 ff          	cmp    $0xffff,%ax
801032b1:	74 10                	je     801032c3 <picinit+0x93>
801032b3:	ba 21 00 00 00       	mov    $0x21,%edx
801032b8:	ee                   	out    %al,(%dx)
801032b9:	ba a1 00 00 00       	mov    $0xa1,%edx
801032be:	66 c1 e8 08          	shr    $0x8,%ax
801032c2:	ee                   	out    %al,(%dx)
801032c3:	5b                   	pop    %ebx
801032c4:	5e                   	pop    %esi
801032c5:	5f                   	pop    %edi
801032c6:	5d                   	pop    %ebp
801032c7:	c3                   	ret    
801032c8:	66 90                	xchg   %ax,%ax
801032ca:	66 90                	xchg   %ax,%ax
801032cc:	66 90                	xchg   %ax,%ax
801032ce:	66 90                	xchg   %ax,%ax

801032d0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801032d0:	55                   	push   %ebp
801032d1:	89 e5                	mov    %esp,%ebp
801032d3:	57                   	push   %edi
801032d4:	56                   	push   %esi
801032d5:	53                   	push   %ebx
801032d6:	83 ec 1c             	sub    $0x1c,%esp
801032d9:	8b 75 08             	mov    0x8(%ebp),%esi
801032dc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801032df:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801032e5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801032eb:	e8 80 da ff ff       	call   80100d70 <filealloc>
801032f0:	85 c0                	test   %eax,%eax
801032f2:	89 06                	mov    %eax,(%esi)
801032f4:	0f 84 a4 00 00 00    	je     8010339e <pipealloc+0xce>
801032fa:	e8 71 da ff ff       	call   80100d70 <filealloc>
801032ff:	85 c0                	test   %eax,%eax
80103301:	89 03                	mov    %eax,(%ebx)
80103303:	0f 84 87 00 00 00    	je     80103390 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103309:	e8 92 f1 ff ff       	call   801024a0 <kalloc>
8010330e:	85 c0                	test   %eax,%eax
80103310:	89 c7                	mov    %eax,%edi
80103312:	74 7c                	je     80103390 <pipealloc+0xc0>
    goto bad;
  p->readopen = 1;
80103314:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010331b:	00 00 00 
  p->writeopen = 1;
8010331e:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103325:	00 00 00 
  p->nwrite = 0;
80103328:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
8010332f:	00 00 00 
  p->nread = 0;
80103332:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103339:	00 00 00 
  initlock(&p->lock, "pipe");
8010333c:	89 04 24             	mov    %eax,(%esp)
8010333f:	c7 44 24 04 28 75 10 	movl   $0x80107528,0x4(%esp)
80103346:	80 
80103347:	e8 04 10 00 00       	call   80104350 <initlock>
  (*f0)->type = FD_PIPE;
8010334c:	8b 06                	mov    (%esi),%eax
8010334e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103354:	8b 06                	mov    (%esi),%eax
80103356:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010335a:	8b 06                	mov    (%esi),%eax
8010335c:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103360:	8b 06                	mov    (%esi),%eax
80103362:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
80103365:	8b 03                	mov    (%ebx),%eax
80103367:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
8010336d:	8b 03                	mov    (%ebx),%eax
8010336f:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103373:	8b 03                	mov    (%ebx),%eax
80103375:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103379:	8b 03                	mov    (%ebx),%eax
  return 0;
8010337b:	31 db                	xor    %ebx,%ebx
  (*f0)->writable = 0;
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
8010337d:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103380:	83 c4 1c             	add    $0x1c,%esp
80103383:	89 d8                	mov    %ebx,%eax
80103385:	5b                   	pop    %ebx
80103386:	5e                   	pop    %esi
80103387:	5f                   	pop    %edi
80103388:	5d                   	pop    %ebp
80103389:	c3                   	ret    
8010338a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103390:	8b 06                	mov    (%esi),%eax
80103392:	85 c0                	test   %eax,%eax
80103394:	74 08                	je     8010339e <pipealloc+0xce>
    fileclose(*f0);
80103396:	89 04 24             	mov    %eax,(%esp)
80103399:	e8 92 da ff ff       	call   80100e30 <fileclose>
  if(*f1)
8010339e:	8b 03                	mov    (%ebx),%eax
    fileclose(*f1);
  return -1;
801033a0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
801033a5:	85 c0                	test   %eax,%eax
801033a7:	74 d7                	je     80103380 <pipealloc+0xb0>
    fileclose(*f1);
801033a9:	89 04 24             	mov    %eax,(%esp)
801033ac:	e8 7f da ff ff       	call   80100e30 <fileclose>
  return -1;
}
801033b1:	83 c4 1c             	add    $0x1c,%esp
801033b4:	89 d8                	mov    %ebx,%eax
801033b6:	5b                   	pop    %ebx
801033b7:	5e                   	pop    %esi
801033b8:	5f                   	pop    %edi
801033b9:	5d                   	pop    %ebp
801033ba:	c3                   	ret    
801033bb:	90                   	nop
801033bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801033c0 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
801033c0:	55                   	push   %ebp
801033c1:	89 e5                	mov    %esp,%ebp
801033c3:	56                   	push   %esi
801033c4:	53                   	push   %ebx
801033c5:	83 ec 10             	sub    $0x10,%esp
801033c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801033ce:	89 1c 24             	mov    %ebx,(%esp)
801033d1:	e8 fa 0f 00 00       	call   801043d0 <acquire>
  if(writable){
801033d6:	85 f6                	test   %esi,%esi
801033d8:	74 3e                	je     80103418 <pipeclose+0x58>
    p->writeopen = 0;
    wakeup(&p->nread);
801033da:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
801033e0:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801033e7:	00 00 00 
    wakeup(&p->nread);
801033ea:	89 04 24             	mov    %eax,(%esp)
801033ed:	e8 8e 0c 00 00       	call   80104080 <wakeup>
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
801033f2:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801033f8:	85 d2                	test   %edx,%edx
801033fa:	75 0a                	jne    80103406 <pipeclose+0x46>
801033fc:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103402:	85 c0                	test   %eax,%eax
80103404:	74 32                	je     80103438 <pipeclose+0x78>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103406:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80103409:	83 c4 10             	add    $0x10,%esp
8010340c:	5b                   	pop    %ebx
8010340d:	5e                   	pop    %esi
8010340e:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010340f:	e9 ec 10 00 00       	jmp    80104500 <release>
80103414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103418:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
8010341e:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103425:	00 00 00 
    wakeup(&p->nwrite);
80103428:	89 04 24             	mov    %eax,(%esp)
8010342b:	e8 50 0c 00 00       	call   80104080 <wakeup>
80103430:	eb c0                	jmp    801033f2 <pipeclose+0x32>
80103432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103438:	89 1c 24             	mov    %ebx,(%esp)
8010343b:	e8 c0 10 00 00       	call   80104500 <release>
    kfree((char*)p);
80103440:	89 5d 08             	mov    %ebx,0x8(%ebp)
  } else
    release(&p->lock);
}
80103443:	83 c4 10             	add    $0x10,%esp
80103446:	5b                   	pop    %ebx
80103447:	5e                   	pop    %esi
80103448:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103449:	e9 a2 ee ff ff       	jmp    801022f0 <kfree>
8010344e:	66 90                	xchg   %ax,%ax

80103450 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103450:	55                   	push   %ebp
80103451:	89 e5                	mov    %esp,%ebp
80103453:	57                   	push   %edi
80103454:	56                   	push   %esi
80103455:	53                   	push   %ebx
80103456:	83 ec 1c             	sub    $0x1c,%esp
80103459:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  acquire(&p->lock);
8010345c:	89 3c 24             	mov    %edi,(%esp)
8010345f:	e8 6c 0f 00 00       	call   801043d0 <acquire>
  for(i = 0; i < n; i++){
80103464:	8b 45 10             	mov    0x10(%ebp),%eax
80103467:	85 c0                	test   %eax,%eax
80103469:	0f 8e c2 00 00 00    	jle    80103531 <pipewrite+0xe1>
8010346f:	8b 45 0c             	mov    0xc(%ebp),%eax
80103472:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
80103478:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
8010347e:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
80103484:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103487:	03 45 10             	add    0x10(%ebp),%eax
8010348a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010348d:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103493:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
80103499:	39 d1                	cmp    %edx,%ecx
8010349b:	0f 85 c4 00 00 00    	jne    80103565 <pipewrite+0x115>
      if(p->readopen == 0 || proc->killed){
801034a1:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
801034a7:	85 d2                	test   %edx,%edx
801034a9:	0f 84 a1 00 00 00    	je     80103550 <pipewrite+0x100>
801034af:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801034b6:	8b 42 24             	mov    0x24(%edx),%eax
801034b9:	85 c0                	test   %eax,%eax
801034bb:	74 22                	je     801034df <pipewrite+0x8f>
801034bd:	e9 8e 00 00 00       	jmp    80103550 <pipewrite+0x100>
801034c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801034c8:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
801034ce:	85 c0                	test   %eax,%eax
801034d0:	74 7e                	je     80103550 <pipewrite+0x100>
801034d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801034d8:	8b 48 24             	mov    0x24(%eax),%ecx
801034db:	85 c9                	test   %ecx,%ecx
801034dd:	75 71                	jne    80103550 <pipewrite+0x100>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801034df:	89 34 24             	mov    %esi,(%esp)
801034e2:	e8 99 0b 00 00       	call   80104080 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801034e7:	89 7c 24 04          	mov    %edi,0x4(%esp)
801034eb:	89 1c 24             	mov    %ebx,(%esp)
801034ee:	e8 dd 09 00 00       	call   80103ed0 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034f3:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
801034f9:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
801034ff:	05 00 02 00 00       	add    $0x200,%eax
80103504:	39 c2                	cmp    %eax,%edx
80103506:	74 c0                	je     801034c8 <pipewrite+0x78>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103508:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010350b:	8d 4a 01             	lea    0x1(%edx),%ecx
8010350e:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103514:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
8010351a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010351e:	0f b6 00             	movzbl (%eax),%eax
80103521:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103525:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103528:	3b 45 e0             	cmp    -0x20(%ebp),%eax
8010352b:	0f 85 5c ff ff ff    	jne    8010348d <pipewrite+0x3d>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103531:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
80103537:	89 14 24             	mov    %edx,(%esp)
8010353a:	e8 41 0b 00 00       	call   80104080 <wakeup>
  release(&p->lock);
8010353f:	89 3c 24             	mov    %edi,(%esp)
80103542:	e8 b9 0f 00 00       	call   80104500 <release>
  return n;
80103547:	8b 45 10             	mov    0x10(%ebp),%eax
8010354a:	eb 11                	jmp    8010355d <pipewrite+0x10d>
8010354c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
80103550:	89 3c 24             	mov    %edi,(%esp)
80103553:	e8 a8 0f 00 00       	call   80104500 <release>
        return -1;
80103558:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
8010355d:	83 c4 1c             	add    $0x1c,%esp
80103560:	5b                   	pop    %ebx
80103561:	5e                   	pop    %esi
80103562:	5f                   	pop    %edi
80103563:	5d                   	pop    %ebp
80103564:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103565:	89 ca                	mov    %ecx,%edx
80103567:	eb 9f                	jmp    80103508 <pipewrite+0xb8>
80103569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103570 <piperead>:
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103570:	55                   	push   %ebp
80103571:	89 e5                	mov    %esp,%ebp
80103573:	57                   	push   %edi
80103574:	56                   	push   %esi
80103575:	53                   	push   %ebx
80103576:	83 ec 1c             	sub    $0x1c,%esp
80103579:	8b 75 08             	mov    0x8(%ebp),%esi
8010357c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010357f:	89 34 24             	mov    %esi,(%esp)
80103582:	e8 49 0e 00 00       	call   801043d0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103587:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
8010358d:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
80103593:	75 5b                	jne    801035f0 <piperead+0x80>
80103595:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010359b:	85 db                	test   %ebx,%ebx
8010359d:	74 51                	je     801035f0 <piperead+0x80>
8010359f:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801035a5:	eb 25                	jmp    801035cc <piperead+0x5c>
801035a7:	90                   	nop
    if(proc->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801035a8:	89 74 24 04          	mov    %esi,0x4(%esp)
801035ac:	89 1c 24             	mov    %ebx,(%esp)
801035af:	e8 1c 09 00 00       	call   80103ed0 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801035b4:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
801035ba:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
801035c0:	75 2e                	jne    801035f0 <piperead+0x80>
801035c2:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
801035c8:	85 d2                	test   %edx,%edx
801035ca:	74 24                	je     801035f0 <piperead+0x80>
    if(proc->killed){
801035cc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801035d2:	8b 48 24             	mov    0x24(%eax),%ecx
801035d5:	85 c9                	test   %ecx,%ecx
801035d7:	74 cf                	je     801035a8 <piperead+0x38>
      release(&p->lock);
801035d9:	89 34 24             	mov    %esi,(%esp)
801035dc:	e8 1f 0f 00 00       	call   80104500 <release>
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801035e1:	83 c4 1c             	add    $0x1c,%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(proc->killed){
      release(&p->lock);
      return -1;
801035e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801035e9:	5b                   	pop    %ebx
801035ea:	5e                   	pop    %esi
801035eb:	5f                   	pop    %edi
801035ec:	5d                   	pop    %ebp
801035ed:	c3                   	ret    
801035ee:	66 90                	xchg   %ax,%ax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035f0:	8b 55 10             	mov    0x10(%ebp),%edx
    if(p->nread == p->nwrite)
801035f3:	31 db                	xor    %ebx,%ebx
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035f5:	85 d2                	test   %edx,%edx
801035f7:	7f 2b                	jg     80103624 <piperead+0xb4>
801035f9:	eb 31                	jmp    8010362c <piperead+0xbc>
801035fb:	90                   	nop
801035fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103600:	8d 48 01             	lea    0x1(%eax),%ecx
80103603:	25 ff 01 00 00       	and    $0x1ff,%eax
80103608:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010360e:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
80103613:	88 04 1f             	mov    %al,(%edi,%ebx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103616:	83 c3 01             	add    $0x1,%ebx
80103619:	3b 5d 10             	cmp    0x10(%ebp),%ebx
8010361c:	74 0e                	je     8010362c <piperead+0xbc>
    if(p->nread == p->nwrite)
8010361e:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103624:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010362a:	75 d4                	jne    80103600 <piperead+0x90>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010362c:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103632:	89 04 24             	mov    %eax,(%esp)
80103635:	e8 46 0a 00 00       	call   80104080 <wakeup>
  release(&p->lock);
8010363a:	89 34 24             	mov    %esi,(%esp)
8010363d:	e8 be 0e 00 00       	call   80104500 <release>
  return i;
}
80103642:	83 c4 1c             	add    $0x1c,%esp
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
80103645:	89 d8                	mov    %ebx,%eax
}
80103647:	5b                   	pop    %ebx
80103648:	5e                   	pop    %esi
80103649:	5f                   	pop    %edi
8010364a:	5d                   	pop    %ebp
8010364b:	c3                   	ret    
8010364c:	66 90                	xchg   %ax,%ax
8010364e:	66 90                	xchg   %ax,%ax

80103650 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103650:	55                   	push   %ebp
80103651:	89 e5                	mov    %esp,%ebp
80103653:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103654:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103659:	83 ec 14             	sub    $0x14,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010365c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103663:	e8 68 0d 00 00       	call   801043d0 <acquire>
80103668:	eb 18                	jmp    80103682 <allocproc+0x32>
8010366a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103670:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
80103676:	81 fb d4 54 11 80    	cmp    $0x801154d4,%ebx
8010367c:	0f 84 a6 00 00 00    	je     80103728 <allocproc+0xd8>
    if(p->state == UNUSED)
80103682:	8b 43 0c             	mov    0xc(%ebx),%eax
80103685:	85 c0                	test   %eax,%eax
80103687:	75 e7                	jne    80103670 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103689:	a1 0c a0 10 80       	mov    0x8010a00c,%eax
  p->createTime = ticks;
  p->length_of_job =10 ;
  p->runTime = 0;
  p->sleepTime =0;
  release(&ptable.lock);
8010368e:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
80103695:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
  p->createTime = ticks;
  p->length_of_job =10 ;
8010369c:	c7 83 8c 00 00 00 0a 	movl   $0xa,0x8c(%ebx)
801036a3:	00 00 00 
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801036a6:	8d 50 01             	lea    0x1(%eax),%edx
801036a9:	89 43 10             	mov    %eax,0x10(%ebx)
  p->createTime = ticks;
801036ac:	a1 20 5d 11 80       	mov    0x80115d20,%eax
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801036b1:	89 15 0c a0 10 80    	mov    %edx,0x8010a00c
  p->createTime = ticks;
  p->length_of_job =10 ;
  p->runTime = 0;
801036b7:	c7 83 88 00 00 00 00 	movl   $0x0,0x88(%ebx)
801036be:	00 00 00 
  p->sleepTime =0;
801036c1:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
801036c8:	00 00 00 
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
  p->createTime = ticks;
801036cb:	89 43 7c             	mov    %eax,0x7c(%ebx)
  p->length_of_job =10 ;
  p->runTime = 0;
  p->sleepTime =0;
  release(&ptable.lock);
801036ce:	e8 2d 0e 00 00       	call   80104500 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801036d3:	e8 c8 ed ff ff       	call   801024a0 <kalloc>
801036d8:	85 c0                	test   %eax,%eax
801036da:	89 43 08             	mov    %eax,0x8(%ebx)
801036dd:	74 5d                	je     8010373c <allocproc+0xec>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801036df:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
801036e5:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801036ea:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
801036ed:	c7 40 14 7d 57 10 80 	movl   $0x8010577d,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
801036f4:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
801036fb:	00 
801036fc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80103703:	00 
80103704:	89 04 24             	mov    %eax,(%esp)
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103707:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010370a:	e8 41 0e 00 00       	call   80104550 <memset>
  p->context->eip = (uint)forkret;
8010370f:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103712:	c7 40 10 50 37 10 80 	movl   $0x80103750,0x10(%eax)

  return p;
80103719:	89 d8                	mov    %ebx,%eax
}
8010371b:	83 c4 14             	add    $0x14,%esp
8010371e:	5b                   	pop    %ebx
8010371f:	5d                   	pop    %ebp
80103720:	c3                   	ret    
80103721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103728:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
8010372f:	e8 cc 0d 00 00       	call   80104500 <release>
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103734:	83 c4 14             	add    $0x14,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;
80103737:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103739:	5b                   	pop    %ebx
8010373a:	5d                   	pop    %ebp
8010373b:	c3                   	ret    
  p->sleepTime =0;
  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
8010373c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103743:	eb d6                	jmp    8010371b <allocproc+0xcb>
80103745:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103750 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	83 ec 18             	sub    $0x18,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103756:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
8010375d:	e8 9e 0d 00 00       	call   80104500 <release>

  if (first) {
80103762:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103767:	85 c0                	test   %eax,%eax
80103769:	75 05                	jne    80103770 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010376b:	c9                   	leave  
8010376c:	c3                   	ret    
8010376d:	8d 76 00             	lea    0x0(%esi),%esi
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103770:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103777:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
8010377e:	00 00 00 
    iinit(ROOTDEV);
80103781:	e8 fa dc ff ff       	call   80101480 <iinit>
    initlog(ROOTDEV);
80103786:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010378d:	e8 5e f3 ff ff       	call   80102af0 <initlog>
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103792:	c9                   	leave  
80103793:	c3                   	ret    
80103794:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010379a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037a0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	83 ec 18             	sub    $0x18,%esp
  initlock(&ptable.lock, "ptable");
801037a6:	c7 44 24 04 2d 75 10 	movl   $0x8010752d,0x4(%esp)
801037ad:	80 
801037ae:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801037b5:	e8 96 0b 00 00       	call   80104350 <initlock>
}
801037ba:	c9                   	leave  
801037bb:	c3                   	ret    
801037bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037c0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801037c0:	55                   	push   %ebp
801037c1:	89 e5                	mov    %esp,%ebp
801037c3:	53                   	push   %ebx
801037c4:	83 ec 14             	sub    $0x14,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801037c7:	e8 84 fe ff ff       	call   80103650 <allocproc>
801037cc:	89 c3                	mov    %eax,%ebx

  initproc = p;
801037ce:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
  if((p->pgdir = setupkvm()) == 0)
801037d3:	e8 a8 31 00 00       	call   80106980 <setupkvm>
801037d8:	85 c0                	test   %eax,%eax
801037da:	89 43 04             	mov    %eax,0x4(%ebx)
801037dd:	0f 84 d4 00 00 00    	je     801038b7 <userinit+0xf7>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801037e3:	89 04 24             	mov    %eax,(%esp)
801037e6:	c7 44 24 08 2c 00 00 	movl   $0x2c,0x8(%esp)
801037ed:	00 
801037ee:	c7 44 24 04 60 a4 10 	movl   $0x8010a460,0x4(%esp)
801037f5:	80 
801037f6:	e8 15 33 00 00       	call   80106b10 <inituvm>
  p->sz = PGSIZE;
801037fb:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103801:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
80103808:	00 
80103809:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80103810:	00 
80103811:	8b 43 18             	mov    0x18(%ebx),%eax
80103814:	89 04 24             	mov    %eax,(%esp)
80103817:	e8 34 0d 00 00       	call   80104550 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010381c:	8b 43 18             	mov    0x18(%ebx),%eax
8010381f:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103824:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103829:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010382d:	8b 43 18             	mov    0x18(%ebx),%eax
80103830:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103834:	8b 43 18             	mov    0x18(%ebx),%eax
80103837:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010383b:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
8010383f:	8b 43 18             	mov    0x18(%ebx),%eax
80103842:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103846:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010384a:	8b 43 18             	mov    0x18(%ebx),%eax
8010384d:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103854:	8b 43 18             	mov    0x18(%ebx),%eax
80103857:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
8010385e:	8b 43 18             	mov    0x18(%ebx),%eax
80103861:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103868:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010386b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103872:	00 
80103873:	c7 44 24 04 4d 75 10 	movl   $0x8010754d,0x4(%esp)
8010387a:	80 
8010387b:	89 04 24             	mov    %eax,(%esp)
8010387e:	e8 cd 0e 00 00       	call   80104750 <safestrcpy>
  p->cwd = namei("/");
80103883:	c7 04 24 56 75 10 80 	movl   $0x80107556,(%esp)
8010388a:	e8 61 e6 ff ff       	call   80101ef0 <namei>
8010388f:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103892:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103899:	e8 32 0b 00 00       	call   801043d0 <acquire>

  p->state = RUNNABLE;
8010389e:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
801038a5:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801038ac:	e8 4f 0c 00 00       	call   80104500 <release>
}
801038b1:	83 c4 14             	add    $0x14,%esp
801038b4:	5b                   	pop    %ebx
801038b5:	5d                   	pop    %ebp
801038b6:	c3                   	ret    

  p = allocproc();

  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
801038b7:	c7 04 24 34 75 10 80 	movl   $0x80107534,(%esp)
801038be:	e8 9d ca ff ff       	call   80100360 <panic>
801038c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801038c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801038d0 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801038d0:	55                   	push   %ebp
801038d1:	89 e5                	mov    %esp,%ebp
801038d3:	83 ec 18             	sub    $0x18,%esp
  uint sz;

  sz = proc->sz;
801038d6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801038dd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint sz;

  sz = proc->sz;
801038e0:	8b 02                	mov    (%edx),%eax
  if(n > 0){
801038e2:	83 f9 00             	cmp    $0x0,%ecx
801038e5:	7e 39                	jle    80103920 <growproc+0x50>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
801038e7:	01 c1                	add    %eax,%ecx
801038e9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
801038ed:	89 44 24 04          	mov    %eax,0x4(%esp)
801038f1:	8b 42 04             	mov    0x4(%edx),%eax
801038f4:	89 04 24             	mov    %eax,(%esp)
801038f7:	e8 54 33 00 00       	call   80106c50 <allocuvm>
801038fc:	85 c0                	test   %eax,%eax
801038fe:	74 40                	je     80103940 <growproc+0x70>
80103900:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
80103907:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
80103909:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010390f:	89 04 24             	mov    %eax,(%esp)
80103912:	e8 29 31 00 00       	call   80106a40 <switchuvm>
  return 0;
80103917:	31 c0                	xor    %eax,%eax
}
80103919:	c9                   	leave  
8010391a:	c3                   	ret    
8010391b:	90                   	nop
8010391c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103920:	74 e5                	je     80103907 <growproc+0x37>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80103922:	01 c1                	add    %eax,%ecx
80103924:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80103928:	89 44 24 04          	mov    %eax,0x4(%esp)
8010392c:	8b 42 04             	mov    0x4(%edx),%eax
8010392f:	89 04 24             	mov    %eax,(%esp)
80103932:	e8 09 34 00 00       	call   80106d40 <deallocuvm>
80103937:	85 c0                	test   %eax,%eax
80103939:	75 c5                	jne    80103900 <growproc+0x30>
8010393b:	90                   	nop
8010393c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint sz;

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
80103940:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}
80103945:	c9                   	leave  
80103946:	c3                   	ret    
80103947:	89 f6                	mov    %esi,%esi
80103949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103950 <chpr>:
//change length_of_job
int
chpr( int pid, int length_of_job )
{
80103950:	55                   	push   %ebp
80103951:	89 e5                	mov    %esp,%ebp
80103953:	53                   	push   %ebx
80103954:	83 ec 14             	sub    $0x14,%esp
80103957:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010395a:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103961:	e8 6a 0a 00 00       	call   801043d0 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103966:	ba d4 2d 11 80       	mov    $0x80112dd4,%edx
8010396b:	eb 11                	jmp    8010397e <chpr+0x2e>
8010396d:	8d 76 00             	lea    0x0(%esi),%esi
80103970:	81 c2 9c 00 00 00    	add    $0x9c,%edx
80103976:	81 fa d4 54 11 80    	cmp    $0x801154d4,%edx
8010397c:	74 0e                	je     8010398c <chpr+0x3c>
    if(p->pid == pid ) {
8010397e:	39 5a 10             	cmp    %ebx,0x10(%edx)
80103981:	75 ed                	jne    80103970 <chpr+0x20>
        p->length_of_job = length_of_job;
80103983:	8b 45 0c             	mov    0xc(%ebp),%eax
80103986:	89 82 8c 00 00 00    	mov    %eax,0x8c(%edx)
        break;
    }
  }
  release(&ptable.lock);
8010398c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103993:	e8 68 0b 00 00       	call   80104500 <release>

  return pid;
}
80103998:	83 c4 14             	add    $0x14,%esp
8010399b:	89 d8                	mov    %ebx,%eax
8010399d:	5b                   	pop    %ebx
8010399e:	5d                   	pop    %ebp
8010399f:	c3                   	ret    

801039a0 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
801039a0:	55                   	push   %ebp
801039a1:	89 e5                	mov    %esp,%ebp
801039a3:	57                   	push   %edi
801039a4:	56                   	push   %esi
801039a5:	53                   	push   %ebx
801039a6:	83 ec 1c             	sub    $0x1c,%esp
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
801039a9:	e8 a2 fc ff ff       	call   80103650 <allocproc>
801039ae:	85 c0                	test   %eax,%eax
801039b0:	89 c3                	mov    %eax,%ebx
801039b2:	0f 84 d5 00 00 00    	je     80103a8d <fork+0xed>
    return -1;
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
801039b8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801039be:	8b 10                	mov    (%eax),%edx
801039c0:	89 54 24 04          	mov    %edx,0x4(%esp)
801039c4:	8b 40 04             	mov    0x4(%eax),%eax
801039c7:	89 04 24             	mov    %eax,(%esp)
801039ca:	e8 41 34 00 00       	call   80106e10 <copyuvm>
801039cf:	85 c0                	test   %eax,%eax
801039d1:	89 43 04             	mov    %eax,0x4(%ebx)
801039d4:	0f 84 ba 00 00 00    	je     80103a94 <fork+0xf4>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
801039da:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  np->parent = proc;
  *np->tf = *proc->tf;
801039e0:	b9 13 00 00 00       	mov    $0x13,%ecx
801039e5:	8b 7b 18             	mov    0x18(%ebx),%edi
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
801039e8:	8b 00                	mov    (%eax),%eax
801039ea:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
801039ec:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801039f2:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
801039f5:	8b 70 18             	mov    0x18(%eax),%esi
801039f8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039fa:	31 f6                	xor    %esi,%esi
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
801039fc:	8b 43 18             	mov    0x18(%ebx),%eax
801039ff:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a06:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103a0d:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
80103a10:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103a14:	85 c0                	test   %eax,%eax
80103a16:	74 13                	je     80103a2b <fork+0x8b>
      np->ofile[i] = filedup(proc->ofile[i]);
80103a18:	89 04 24             	mov    %eax,(%esp)
80103a1b:	e8 c0 d3 ff ff       	call   80100de0 <filedup>
80103a20:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103a24:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103a2b:	83 c6 01             	add    $0x1,%esi
80103a2e:	83 fe 10             	cmp    $0x10,%esi
80103a31:	75 dd                	jne    80103a10 <fork+0x70>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
80103a33:	8b 42 68             	mov    0x68(%edx),%eax
80103a36:	89 04 24             	mov    %eax,(%esp)
80103a39:	e8 52 dc ff ff       	call   80101690 <idup>
80103a3e:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103a41:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a47:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103a4e:	00 
80103a4f:	83 c0 6c             	add    $0x6c,%eax
80103a52:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a56:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103a59:	89 04 24             	mov    %eax,(%esp)
80103a5c:	e8 ef 0c 00 00       	call   80104750 <safestrcpy>

  pid = np->pid;
80103a61:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
80103a64:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103a6b:	e8 60 09 00 00       	call   801043d0 <acquire>

  np->state = RUNNABLE;
80103a70:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103a77:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103a7e:	e8 7d 0a 00 00       	call   80104500 <release>

  return pid;
80103a83:	89 f0                	mov    %esi,%eax
}
80103a85:	83 c4 1c             	add    $0x1c,%esp
80103a88:	5b                   	pop    %ebx
80103a89:	5e                   	pop    %esi
80103a8a:	5f                   	pop    %edi
80103a8b:	5d                   	pop    %ebp
80103a8c:	c3                   	ret    
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103a8d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a92:	eb f1                	jmp    80103a85 <fork+0xe5>
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
80103a94:	8b 43 08             	mov    0x8(%ebx),%eax
80103a97:	89 04 24             	mov    %eax,(%esp)
80103a9a:	e8 51 e8 ff ff       	call   801022f0 <kfree>
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
80103a9f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
80103aa4:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103aab:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103ab2:	eb d1                	jmp    80103a85 <fork+0xe5>
80103ab4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103aba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103ac0 <cps>:
  panic("zombie exit");
}


int cps()
{
80103ac0:	55                   	push   %ebp
80103ac1:	89 e5                	mov    %esp,%ebp
80103ac3:	57                   	push   %edi
80103ac4:	56                   	push   %esi
80103ac5:	53                   	push   %ebx
80103ac6:	83 ec 1c             	sub    $0x1c,%esp
}

static inline void
sti(void)
{
  asm volatile("sti");
80103ac9:	fb                   	sti    
  sti();
  int i,j;
  i = 0;
  j = 0;
    // Loop over process table looking for process with pid.
  acquire(&ptable.lock);
80103aca:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103ad1:	bb 40 2e 11 80       	mov    $0x80112e40,%ebx

  // Enable interrupts on this processor.
  sti();
  int i,j;
  i = 0;
  j = 0;
80103ad6:	31 ff                	xor    %edi,%edi
    // Loop over process table looking for process with pid.
  acquire(&ptable.lock);
80103ad8:	e8 f3 08 00 00       	call   801043d0 <acquire>
  struct proc *p;

  // Enable interrupts on this processor.
  sti();
  int i,j;
  i = 0;
80103add:	31 f6                	xor    %esi,%esi
  j = 0;
    // Loop over process table looking for process with pid.
  acquire(&ptable.lock);
  cprintf("name \t pid \t state \t length of job\n");
80103adf:	c7 04 24 38 76 10 80 	movl   $0x80107638,(%esp)
80103ae6:	e8 65 cb ff ff       	call   80100650 <cprintf>
80103aeb:	eb 16                	jmp    80103b03 <cps+0x43>
80103aed:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
       if ( p->state == SLEEPING ){
        cprintf("%s \t %d  \t SLEEPING \t %d \n ", p->name, p->pid ,p->length_of_job);
	i = i +1;}
      else if ( p->state == RUNNING ){
80103af0:	83 f8 04             	cmp    $0x4,%eax
80103af3:	74 63                	je     80103b58 <cps+0x98>
80103af5:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
  i = 0;
  j = 0;
    // Loop over process table looking for process with pid.
  acquire(&ptable.lock);
  cprintf("name \t pid \t state \t length of job\n");
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103afb:	81 fb 40 55 11 80    	cmp    $0x80115540,%ebx
80103b01:	74 3d                	je     80103b40 <cps+0x80>
       if ( p->state == SLEEPING ){
80103b03:	8b 43 a0             	mov    -0x60(%ebx),%eax
80103b06:	83 f8 02             	cmp    $0x2,%eax
80103b09:	75 e5                	jne    80103af0 <cps+0x30>
        cprintf("%s \t %d  \t SLEEPING \t %d \n ", p->name, p->pid ,p->length_of_job);
80103b0b:	8b 43 20             	mov    0x20(%ebx),%eax
	i = i +1;}
80103b0e:	83 c6 01             	add    $0x1,%esi
    // Loop over process table looking for process with pid.
  acquire(&ptable.lock);
  cprintf("name \t pid \t state \t length of job\n");
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
       if ( p->state == SLEEPING ){
        cprintf("%s \t %d  \t SLEEPING \t %d \n ", p->name, p->pid ,p->length_of_job);
80103b11:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80103b15:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
80103b1b:	c7 04 24 58 75 10 80 	movl   $0x80107558,(%esp)
80103b22:	89 44 24 0c          	mov    %eax,0xc(%esp)
80103b26:	8b 83 08 ff ff ff    	mov    -0xf8(%ebx),%eax
80103b2c:	89 44 24 08          	mov    %eax,0x8(%esp)
80103b30:	e8 1b cb ff ff       	call   80100650 <cprintf>
  i = 0;
  j = 0;
    // Loop over process table looking for process with pid.
  acquire(&ptable.lock);
  cprintf("name \t pid \t state \t length of job\n");
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b35:	81 fb 40 55 11 80    	cmp    $0x80115540,%ebx
80103b3b:	75 c6                	jne    80103b03 <cps+0x43>
80103b3d:	8d 76 00             	lea    0x0(%esi),%esi
      else if ( p->state == RUNNING ){
        cprintf("%s \t %d  \t RUNNING \t %d \n ", p->name, p->pid,p->length_of_job );
	j = j+1;}
  }

  release(&ptable.lock);
80103b40:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103b47:	e8 b4 09 00 00       	call   80104500 <release>
  return i+j;
}
80103b4c:	83 c4 1c             	add    $0x1c,%esp
        cprintf("%s \t %d  \t RUNNING \t %d \n ", p->name, p->pid,p->length_of_job );
	j = j+1;}
  }

  release(&ptable.lock);
  return i+j;
80103b4f:	8d 04 3e             	lea    (%esi,%edi,1),%eax
}
80103b52:	5b                   	pop    %ebx
80103b53:	5e                   	pop    %esi
80103b54:	5f                   	pop    %edi
80103b55:	5d                   	pop    %ebp
80103b56:	c3                   	ret    
80103b57:	90                   	nop
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
       if ( p->state == SLEEPING ){
        cprintf("%s \t %d  \t SLEEPING \t %d \n ", p->name, p->pid ,p->length_of_job);
	i = i +1;}
      else if ( p->state == RUNNING ){
        cprintf("%s \t %d  \t RUNNING \t %d \n ", p->name, p->pid,p->length_of_job );
80103b58:	8b 43 20             	mov    0x20(%ebx),%eax
	j = j+1;}
80103b5b:	83 c7 01             	add    $0x1,%edi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
       if ( p->state == SLEEPING ){
        cprintf("%s \t %d  \t SLEEPING \t %d \n ", p->name, p->pid ,p->length_of_job);
	i = i +1;}
      else if ( p->state == RUNNING ){
        cprintf("%s \t %d  \t RUNNING \t %d \n ", p->name, p->pid,p->length_of_job );
80103b5e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80103b62:	c7 04 24 74 75 10 80 	movl   $0x80107574,(%esp)
80103b69:	89 44 24 0c          	mov    %eax,0xc(%esp)
80103b6d:	8b 43 a4             	mov    -0x5c(%ebx),%eax
80103b70:	89 44 24 08          	mov    %eax,0x8(%esp)
80103b74:	e8 d7 ca ff ff       	call   80100650 <cprintf>
80103b79:	e9 77 ff ff ff       	jmp    80103af5 <cps+0x35>
80103b7e:	66 90                	xchg   %ax,%ax

80103b80 <scheduler>:
}
*/

void
scheduler(void)
{
80103b80:	55                   	push   %ebp
80103b81:	89 e5                	mov    %esp,%ebp
80103b83:	53                   	push   %ebx
80103b84:	83 ec 14             	sub    $0x14,%esp
80103b87:	fb                   	sti    
  struct proc *p1;
  static uint8_t seed=7;
  for(;;){
    // Enable interrupts on this processor.
    sti();
	  seed ^= seed << 7;//7
80103b88:	0f b6 05 08 a0 10 80 	movzbl 0x8010a008,%eax
	  seed ^= seed >> 5;//5
	  seed ^= seed << 3;//3
   struct proc *highP = 0;
    // Looking for runnable process
    acquire(&ptable.lock);
    for(p = ptable.proc ; p < &ptable.proc[NPROC]; p++){
80103b8f:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
	  seed ^= seed << 7;//7
	  seed ^= seed >> 5;//5
	  seed ^= seed << 3;//3
   struct proc *highP = 0;
    // Looking for runnable process
    acquire(&ptable.lock);
80103b94:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
  struct proc *p1;
  static uint8_t seed=7;
  for(;;){
    // Enable interrupts on this processor.
    sti();
	  seed ^= seed << 7;//7
80103b9b:	89 c2                	mov    %eax,%edx
80103b9d:	c1 e2 07             	shl    $0x7,%edx
80103ba0:	31 c2                	xor    %eax,%edx
	  seed ^= seed >> 5;//5
80103ba2:	89 d0                	mov    %edx,%eax
80103ba4:	c0 e8 05             	shr    $0x5,%al
80103ba7:	31 d0                	xor    %edx,%eax
	  seed ^= seed << 3;//3
80103ba9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
80103bb0:	31 c2                	xor    %eax,%edx
80103bb2:	88 15 08 a0 10 80    	mov    %dl,0x8010a008
   struct proc *highP = 0;
    // Looking for runnable process
    acquire(&ptable.lock);
80103bb8:	e8 13 08 00 00       	call   801043d0 <acquire>
80103bbd:	eb 13                	jmp    80103bd2 <scheduler+0x52>
80103bbf:	90                   	nop
    for(p = ptable.proc ; p < &ptable.proc[NPROC]; p++){
80103bc0:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
80103bc6:	81 fb d4 54 11 80    	cmp    $0x801154d4,%ebx
80103bcc:	0f 83 bf 00 00 00    	jae    80103c91 <scheduler+0x111>
	p -> length_of_job = seed;
80103bd2:	0f b6 05 08 a0 10 80 	movzbl 0x8010a008,%eax
      if(p->state != RUNNABLE)
80103bd9:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
	  seed ^= seed << 3;//3
   struct proc *highP = 0;
    // Looking for runnable process
    acquire(&ptable.lock);
    for(p = ptable.proc ; p < &ptable.proc[NPROC]; p++){
	p -> length_of_job = seed;
80103bdd:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
      if(p->state != RUNNABLE)
80103be3:	75 db                	jne    80103bc0 <scheduler+0x40>
80103be5:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103bea:	eb 10                	jmp    80103bfc <scheduler+0x7c>
80103bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        continue;
      highP = p;
      // choose one with lowest length_of_job
      for(p1 = ptable.proc; p1 < &ptable.proc[NPROC]; p1++){
80103bf0:	05 9c 00 00 00       	add    $0x9c,%eax
80103bf5:	3d d4 54 11 80       	cmp    $0x801154d4,%eax
80103bfa:	74 21                	je     80103c1d <scheduler+0x9d>
        if(p1->state != RUNNABLE)
80103bfc:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103c00:	75 ee                	jne    80103bf0 <scheduler+0x70>
80103c02:	8b 88 8c 00 00 00    	mov    0x8c(%eax),%ecx
80103c08:	39 8b 8c 00 00 00    	cmp    %ecx,0x8c(%ebx)
80103c0e:	0f 4f d8             	cmovg  %eax,%ebx
	p -> length_of_job = seed;
      if(p->state != RUNNABLE)
        continue;
      highP = p;
      // choose one with lowest length_of_job
      for(p1 = ptable.proc; p1 < &ptable.proc[NPROC]; p1++){
80103c11:	05 9c 00 00 00       	add    $0x9c,%eax
80103c16:	3d d4 54 11 80       	cmp    $0x801154d4,%eax
80103c1b:	75 df                	jne    80103bfc <scheduler+0x7c>
        if ( highP->length_of_job > p1->length_of_job )   // larger length_of_job, lower priorty
          highP = p1;
      }
      p = highP;
      proc = p;
      switchuvm(p);
80103c1d:	89 1c 24             	mov    %ebx,(%esp)
          continue;
        if ( highP->length_of_job > p1->length_of_job )   // larger length_of_job, lower priorty
          highP = p1;
      }
      p = highP;
      proc = p;
80103c20:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
      switchuvm(p);
80103c27:	e8 14 2e 00 00       	call   80106a40 <switchuvm>
    p->state = RUNNING;
      cprintf("\n Scheduler :: Process %s with pid %d running with length as %d \n", p->name, p->pid, p->length_of_job);
80103c2c:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
          highP = p1;
      }
      p = highP;
      proc = p;
      switchuvm(p);
    p->state = RUNNING;
80103c32:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      cprintf("\n Scheduler :: Process %s with pid %d running with length as %d \n", p->name, p->pid, p->length_of_job);
80103c39:	89 44 24 0c          	mov    %eax,0xc(%esp)
80103c3d:	8b 43 10             	mov    0x10(%ebx),%eax
80103c40:	c7 04 24 5c 76 10 80 	movl   $0x8010765c,(%esp)
80103c47:	89 44 24 08          	mov    %eax,0x8(%esp)
80103c4b:	8d 43 6c             	lea    0x6c(%ebx),%eax
	  seed ^= seed >> 5;//5
	  seed ^= seed << 3;//3
   struct proc *highP = 0;
    // Looking for runnable process
    acquire(&ptable.lock);
    for(p = ptable.proc ; p < &ptable.proc[NPROC]; p++){
80103c4e:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
      }
      p = highP;
      proc = p;
      switchuvm(p);
    p->state = RUNNING;
      cprintf("\n Scheduler :: Process %s with pid %d running with length as %d \n", p->name, p->pid, p->length_of_job);
80103c54:	89 44 24 04          	mov    %eax,0x4(%esp)
80103c58:	e8 f3 c9 ff ff       	call   80100650 <cprintf>
      swtch(&cpu->scheduler, p->context);
80103c5d:	8b 43 80             	mov    -0x80(%ebx),%eax
80103c60:	89 44 24 04          	mov    %eax,0x4(%esp)
80103c64:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103c6a:	83 c0 04             	add    $0x4,%eax
80103c6d:	89 04 24             	mov    %eax,(%esp)
80103c70:	e8 36 0b 00 00       	call   801047ab <swtch>
      switchkvm();
80103c75:	e8 a6 2d 00 00       	call   80106a20 <switchkvm>
	  seed ^= seed >> 5;//5
	  seed ^= seed << 3;//3
   struct proc *highP = 0;
    // Looking for runnable process
    acquire(&ptable.lock);
    for(p = ptable.proc ; p < &ptable.proc[NPROC]; p++){
80103c7a:	81 fb d4 54 11 80    	cmp    $0x801154d4,%ebx
      swtch(&cpu->scheduler, p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103c80:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103c87:	00 00 00 00 
	  seed ^= seed >> 5;//5
	  seed ^= seed << 3;//3
   struct proc *highP = 0;
    // Looking for runnable process
    acquire(&ptable.lock);
    for(p = ptable.proc ; p < &ptable.proc[NPROC]; p++){
80103c8b:	0f 82 41 ff ff ff    	jb     80103bd2 <scheduler+0x52>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
    }
    release(&ptable.lock);
80103c91:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103c98:	e8 63 08 00 00       	call   80104500 <release>

  }
80103c9d:	e9 e5 fe ff ff       	jmp    80103b87 <scheduler+0x7>
80103ca2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103cb0 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103cb0:	55                   	push   %ebp
80103cb1:	89 e5                	mov    %esp,%ebp
80103cb3:	53                   	push   %ebx
80103cb4:	83 ec 14             	sub    $0x14,%esp
  int intena;

  if(!holding(&ptable.lock))
80103cb7:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103cbe:	e8 9d 07 00 00       	call   80104460 <holding>
80103cc3:	85 c0                	test   %eax,%eax
80103cc5:	74 4d                	je     80103d14 <sched+0x64>
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
80103cc7:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103ccd:	83 b8 ac 00 00 00 01 	cmpl   $0x1,0xac(%eax)
80103cd4:	75 62                	jne    80103d38 <sched+0x88>
    panic("sched locks");
  if(proc->state == RUNNING)
80103cd6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103cdd:	83 7a 0c 04          	cmpl   $0x4,0xc(%edx)
80103ce1:	74 49                	je     80103d2c <sched+0x7c>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103ce3:	9c                   	pushf  
80103ce4:	59                   	pop    %ecx
    panic("sched running");
  if(readeflags()&FL_IF)
80103ce5:	80 e5 02             	and    $0x2,%ch
80103ce8:	75 36                	jne    80103d20 <sched+0x70>
    panic("sched interruptible");
  intena = cpu->intena;
80103cea:	8b 98 b0 00 00 00    	mov    0xb0(%eax),%ebx
  swtch(&proc->context, cpu->scheduler);
80103cf0:	83 c2 1c             	add    $0x1c,%edx
80103cf3:	8b 40 04             	mov    0x4(%eax),%eax
80103cf6:	89 14 24             	mov    %edx,(%esp)
80103cf9:	89 44 24 04          	mov    %eax,0x4(%esp)
80103cfd:	e8 a9 0a 00 00       	call   801047ab <swtch>
  cpu->intena = intena;
80103d02:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103d08:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103d0e:	83 c4 14             	add    $0x14,%esp
80103d11:	5b                   	pop    %ebx
80103d12:	5d                   	pop    %ebp
80103d13:	c3                   	ret    
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103d14:	c7 04 24 8f 75 10 80 	movl   $0x8010758f,(%esp)
80103d1b:	e8 40 c6 ff ff       	call   80100360 <panic>
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103d20:	c7 04 24 bb 75 10 80 	movl   $0x801075bb,(%esp)
80103d27:	e8 34 c6 ff ff       	call   80100360 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
80103d2c:	c7 04 24 ad 75 10 80 	movl   $0x801075ad,(%esp)
80103d33:	e8 28 c6 ff ff       	call   80100360 <panic>
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
80103d38:	c7 04 24 a1 75 10 80 	movl   $0x801075a1,(%esp)
80103d3f:	e8 1c c6 ff ff       	call   80100360 <panic>
80103d44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103d50 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103d50:	55                   	push   %ebp
80103d51:	89 e5                	mov    %esp,%ebp
80103d53:	56                   	push   %esi
80103d54:	53                   	push   %ebx
  struct proc *p;
  int fd;

  if(proc == initproc)
80103d55:	31 db                	xor    %ebx,%ebx
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103d57:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  int fd;

  if(proc == initproc)
80103d5a:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103d61:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
80103d67:	0f 84 0b 01 00 00    	je     80103e78 <exit+0x128>
80103d6d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
80103d70:	8d 73 08             	lea    0x8(%ebx),%esi
80103d73:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103d77:	85 c0                	test   %eax,%eax
80103d79:	74 17                	je     80103d92 <exit+0x42>
      fileclose(proc->ofile[fd]);
80103d7b:	89 04 24             	mov    %eax,(%esp)
80103d7e:	e8 ad d0 ff ff       	call   80100e30 <fileclose>
      proc->ofile[fd] = 0;
80103d83:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103d8a:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103d91:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103d92:	83 c3 01             	add    $0x1,%ebx
80103d95:	83 fb 10             	cmp    $0x10,%ebx
80103d98:	75 d6                	jne    80103d70 <exit+0x20>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
80103d9a:	e8 f1 ed ff ff       	call   80102b90 <begin_op>
  iput(proc->cwd);
80103d9f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103da5:	8b 40 68             	mov    0x68(%eax),%eax
80103da8:	89 04 24             	mov    %eax,(%esp)
80103dab:	e8 20 da ff ff       	call   801017d0 <iput>
  end_op();
80103db0:	e8 4b ee ff ff       	call   80102c00 <end_op>
  proc->cwd = 0;
80103db5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103dbb:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103dc2:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103dc9:	e8 02 06 00 00       	call   801043d0 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103dce:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dd5:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103dda:	8b 51 14             	mov    0x14(%ecx),%edx
80103ddd:	eb 0d                	jmp    80103dec <exit+0x9c>
80103ddf:	90                   	nop
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103de0:	05 9c 00 00 00       	add    $0x9c,%eax
80103de5:	3d d4 54 11 80       	cmp    $0x801154d4,%eax
80103dea:	74 1e                	je     80103e0a <exit+0xba>
    if(p->state == SLEEPING && p->chan == chan)
80103dec:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103df0:	75 ee                	jne    80103de0 <exit+0x90>
80103df2:	3b 50 20             	cmp    0x20(%eax),%edx
80103df5:	75 e9                	jne    80103de0 <exit+0x90>
      p->state = RUNNABLE;
80103df7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dfe:	05 9c 00 00 00       	add    $0x9c,%eax
80103e03:	3d d4 54 11 80       	cmp    $0x801154d4,%eax
80103e08:	75 e2                	jne    80103dec <exit+0x9c>
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103e0a:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103e10:	ba d4 2d 11 80       	mov    $0x80112dd4,%edx
80103e15:	eb 0f                	jmp    80103e26 <exit+0xd6>
80103e17:	90                   	nop

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e18:	81 c2 9c 00 00 00    	add    $0x9c,%edx
80103e1e:	81 fa d4 54 11 80    	cmp    $0x801154d4,%edx
80103e24:	74 3a                	je     80103e60 <exit+0x110>
    if(p->parent == proc){
80103e26:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103e29:	75 ed                	jne    80103e18 <exit+0xc8>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103e2b:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103e2f:	89 5a 14             	mov    %ebx,0x14(%edx)
      if(p->state == ZOMBIE)
80103e32:	75 e4                	jne    80103e18 <exit+0xc8>
80103e34:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103e39:	eb 11                	jmp    80103e4c <exit+0xfc>
80103e3b:	90                   	nop
80103e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e40:	05 9c 00 00 00       	add    $0x9c,%eax
80103e45:	3d d4 54 11 80       	cmp    $0x801154d4,%eax
80103e4a:	74 cc                	je     80103e18 <exit+0xc8>
    if(p->state == SLEEPING && p->chan == chan)
80103e4c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e50:	75 ee                	jne    80103e40 <exit+0xf0>
80103e52:	3b 58 20             	cmp    0x20(%eax),%ebx
80103e55:	75 e9                	jne    80103e40 <exit+0xf0>
      p->state = RUNNABLE;
80103e57:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e5e:	eb e0                	jmp    80103e40 <exit+0xf0>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80103e60:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103e67:	e8 44 fe ff ff       	call   80103cb0 <sched>
  panic("zombie exit");
80103e6c:	c7 04 24 dc 75 10 80 	movl   $0x801075dc,(%esp)
80103e73:	e8 e8 c4 ff ff       	call   80100360 <panic>
{
  struct proc *p;
  int fd;

  if(proc == initproc)
    panic("init exiting");
80103e78:	c7 04 24 cf 75 10 80 	movl   $0x801075cf,(%esp)
80103e7f:	e8 dc c4 ff ff       	call   80100360 <panic>
80103e84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103e8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103e90 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103e90:	55                   	push   %ebp
80103e91:	89 e5                	mov    %esp,%ebp
80103e93:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103e96:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103e9d:	e8 2e 05 00 00       	call   801043d0 <acquire>
  proc->state = RUNNABLE;
80103ea2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ea8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103eaf:	e8 fc fd ff ff       	call   80103cb0 <sched>
  release(&ptable.lock);
80103eb4:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103ebb:	e8 40 06 00 00       	call   80104500 <release>
}
80103ec0:	c9                   	leave  
80103ec1:	c3                   	ret    
80103ec2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ed0 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103ed0:	55                   	push   %ebp
80103ed1:	89 e5                	mov    %esp,%ebp
80103ed3:	56                   	push   %esi
80103ed4:	53                   	push   %ebx
80103ed5:	83 ec 10             	sub    $0x10,%esp
  if(proc == 0)
80103ed8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103ede:	8b 75 08             	mov    0x8(%ebp),%esi
80103ee1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103ee4:	85 c0                	test   %eax,%eax
80103ee6:	0f 84 8b 00 00 00    	je     80103f77 <sleep+0xa7>
    panic("sleep");

  if(lk == 0)
80103eec:	85 db                	test   %ebx,%ebx
80103eee:	74 7b                	je     80103f6b <sleep+0x9b>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103ef0:	81 fb a0 2d 11 80    	cmp    $0x80112da0,%ebx
80103ef6:	74 50                	je     80103f48 <sleep+0x78>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103ef8:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103eff:	e8 cc 04 00 00       	call   801043d0 <acquire>
    release(lk);
80103f04:	89 1c 24             	mov    %ebx,(%esp)
80103f07:	e8 f4 05 00 00       	call   80104500 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80103f0c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f12:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103f15:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103f1c:	e8 8f fd ff ff       	call   80103cb0 <sched>

  // Tidy up.
  proc->chan = 0;
80103f21:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f27:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103f2e:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103f35:	e8 c6 05 00 00       	call   80104500 <release>
    acquire(lk);
80103f3a:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
}
80103f3d:	83 c4 10             	add    $0x10,%esp
80103f40:	5b                   	pop    %ebx
80103f41:	5e                   	pop    %esi
80103f42:	5d                   	pop    %ebp
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103f43:	e9 88 04 00 00       	jmp    801043d0 <acquire>
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
80103f48:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103f4b:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103f52:	e8 59 fd ff ff       	call   80103cb0 <sched>

  // Tidy up.
  proc->chan = 0;
80103f57:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f5d:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103f64:	83 c4 10             	add    $0x10,%esp
80103f67:	5b                   	pop    %ebx
80103f68:	5e                   	pop    %esi
80103f69:	5d                   	pop    %ebp
80103f6a:	c3                   	ret    
{
  if(proc == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103f6b:	c7 04 24 ee 75 10 80 	movl   $0x801075ee,(%esp)
80103f72:	e8 e9 c3 ff ff       	call   80100360 <panic>
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");
80103f77:	c7 04 24 e8 75 10 80 	movl   $0x801075e8,(%esp)
80103f7e:	e8 dd c3 ff ff       	call   80100360 <panic>
80103f83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f90 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103f90:	55                   	push   %ebp
80103f91:	89 e5                	mov    %esp,%ebp
80103f93:	56                   	push   %esi
80103f94:	53                   	push   %ebx
80103f95:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80103f98:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103f9f:	e8 2c 04 00 00       	call   801043d0 <acquire>
80103fa4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103faa:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fac:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103fb1:	eb 13                	jmp    80103fc6 <wait+0x36>
80103fb3:	90                   	nop
80103fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fb8:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
80103fbe:	81 fb d4 54 11 80    	cmp    $0x801154d4,%ebx
80103fc4:	74 22                	je     80103fe8 <wait+0x58>
      if(p->parent != proc)
80103fc6:	39 43 14             	cmp    %eax,0x14(%ebx)
80103fc9:	75 ed                	jne    80103fb8 <wait+0x28>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103fcb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103fcf:	74 34                	je     80104005 <wait+0x75>

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fd1:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
      if(p->parent != proc)
        continue;
      havekids = 1;
80103fd7:	ba 01 00 00 00       	mov    $0x1,%edx

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fdc:	81 fb d4 54 11 80    	cmp    $0x801154d4,%ebx
80103fe2:	75 e2                	jne    80103fc6 <wait+0x36>
80103fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
80103fe8:	85 d2                	test   %edx,%edx
80103fea:	74 6e                	je     8010405a <wait+0xca>
80103fec:	8b 50 24             	mov    0x24(%eax),%edx
80103fef:	85 d2                	test   %edx,%edx
80103ff1:	75 67                	jne    8010405a <wait+0xca>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80103ff3:	c7 44 24 04 a0 2d 11 	movl   $0x80112da0,0x4(%esp)
80103ffa:	80 
80103ffb:	89 04 24             	mov    %eax,(%esp)
80103ffe:	e8 cd fe ff ff       	call   80103ed0 <sleep>
  }
80104003:	eb 9f                	jmp    80103fa4 <wait+0x14>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80104005:	8b 43 08             	mov    0x8(%ebx),%eax
      if(p->parent != proc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80104008:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
8010400b:	89 04 24             	mov    %eax,(%esp)
8010400e:	e8 dd e2 ff ff       	call   801022f0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80104013:	8b 43 04             	mov    0x4(%ebx),%eax
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80104016:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
8010401d:	89 04 24             	mov    %eax,(%esp)
80104020:	e8 3b 2d 00 00       	call   80106d60 <freevm>
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
80104025:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
8010402c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80104033:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
8010403a:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
8010403e:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80104045:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
8010404c:	e8 af 04 00 00       	call   80104500 <release>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104051:	83 c4 10             	add    $0x10,%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80104054:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104056:	5b                   	pop    %ebx
80104057:	5e                   	pop    %esi
80104058:	5d                   	pop    %ebp
80104059:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
8010405a:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80104061:	e8 9a 04 00 00       	call   80104500 <release>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104066:	83 c4 10             	add    $0x10,%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
80104069:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
8010406e:	5b                   	pop    %ebx
8010406f:	5e                   	pop    %esi
80104070:	5d                   	pop    %ebp
80104071:	c3                   	ret    
80104072:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104080 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	53                   	push   %ebx
80104084:	83 ec 14             	sub    $0x14,%esp
80104087:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010408a:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80104091:	e8 3a 03 00 00       	call   801043d0 <acquire>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104096:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
8010409b:	eb 0f                	jmp    801040ac <wakeup+0x2c>
8010409d:	8d 76 00             	lea    0x0(%esi),%esi
801040a0:	05 9c 00 00 00       	add    $0x9c,%eax
801040a5:	3d d4 54 11 80       	cmp    $0x801154d4,%eax
801040aa:	74 24                	je     801040d0 <wakeup+0x50>
    if(p->state == SLEEPING && p->chan == chan)
801040ac:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801040b0:	75 ee                	jne    801040a0 <wakeup+0x20>
801040b2:	3b 58 20             	cmp    0x20(%eax),%ebx
801040b5:	75 e9                	jne    801040a0 <wakeup+0x20>
      p->state = RUNNABLE;
801040b7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040be:	05 9c 00 00 00       	add    $0x9c,%eax
801040c3:	3d d4 54 11 80       	cmp    $0x801154d4,%eax
801040c8:	75 e2                	jne    801040ac <wakeup+0x2c>
801040ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
801040d0:	c7 45 08 a0 2d 11 80 	movl   $0x80112da0,0x8(%ebp)
}
801040d7:	83 c4 14             	add    $0x14,%esp
801040da:	5b                   	pop    %ebx
801040db:	5d                   	pop    %ebp
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
801040dc:	e9 1f 04 00 00       	jmp    80104500 <release>
801040e1:	eb 0d                	jmp    801040f0 <kill>
801040e3:	90                   	nop
801040e4:	90                   	nop
801040e5:	90                   	nop
801040e6:	90                   	nop
801040e7:	90                   	nop
801040e8:	90                   	nop
801040e9:	90                   	nop
801040ea:	90                   	nop
801040eb:	90                   	nop
801040ec:	90                   	nop
801040ed:	90                   	nop
801040ee:	90                   	nop
801040ef:	90                   	nop

801040f0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
801040f0:	55                   	push   %ebp
801040f1:	89 e5                	mov    %esp,%ebp
801040f3:	53                   	push   %ebx
801040f4:	83 ec 14             	sub    $0x14,%esp
801040f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801040fa:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80104101:	e8 ca 02 00 00       	call   801043d0 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104106:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
8010410b:	eb 0f                	jmp    8010411c <kill+0x2c>
8010410d:	8d 76 00             	lea    0x0(%esi),%esi
80104110:	05 9c 00 00 00       	add    $0x9c,%eax
80104115:	3d d4 54 11 80       	cmp    $0x801154d4,%eax
8010411a:	74 3c                	je     80104158 <kill+0x68>
    if(p->pid == pid){
8010411c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010411f:	75 ef                	jne    80104110 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104121:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80104125:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010412c:	74 1a                	je     80104148 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
8010412e:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80104135:	e8 c6 03 00 00       	call   80104500 <release>
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
8010413a:	83 c4 14             	add    $0x14,%esp
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
8010413d:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
8010413f:	5b                   	pop    %ebx
80104140:	5d                   	pop    %ebp
80104141:	c3                   	ret    
80104142:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80104148:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010414f:	eb dd                	jmp    8010412e <kill+0x3e>
80104151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80104158:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
8010415f:	e8 9c 03 00 00       	call   80104500 <release>
  return -1;
}
80104164:	83 c4 14             	add    $0x14,%esp
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
80104167:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010416c:	5b                   	pop    %ebx
8010416d:	5d                   	pop    %ebp
8010416e:	c3                   	ret    
8010416f:	90                   	nop

80104170 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104170:	55                   	push   %ebp
80104171:	89 e5                	mov    %esp,%ebp
80104173:	57                   	push   %edi
80104174:	56                   	push   %esi
80104175:	53                   	push   %ebx
80104176:	bb 40 2e 11 80       	mov    $0x80112e40,%ebx
8010417b:	83 ec 4c             	sub    $0x4c,%esp
8010417e:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104181:	eb 23                	jmp    801041a6 <procdump+0x36>
80104183:	90                   	nop
80104184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104188:	c7 04 24 06 75 10 80 	movl   $0x80107506,(%esp)
8010418f:	e8 bc c4 ff ff       	call   80100650 <cprintf>
80104194:	81 c3 9c 00 00 00    	add    $0x9c,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010419a:	81 fb 40 55 11 80    	cmp    $0x80115540,%ebx
801041a0:	0f 84 8a 00 00 00    	je     80104230 <procdump+0xc0>
    if(p->state == UNUSED)
801041a6:	8b 43 a0             	mov    -0x60(%ebx),%eax
801041a9:	85 c0                	test   %eax,%eax
801041ab:	74 e7                	je     80104194 <procdump+0x24>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041ad:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
801041b0:	ba ff 75 10 80       	mov    $0x801075ff,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041b5:	77 11                	ja     801041c8 <procdump+0x58>
801041b7:	8b 14 85 a0 76 10 80 	mov    -0x7fef8960(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
801041be:	b8 ff 75 10 80       	mov    $0x801075ff,%eax
801041c3:	85 d2                	test   %edx,%edx
801041c5:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
801041c8:	8b 43 a4             	mov    -0x5c(%ebx),%eax
801041cb:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
801041cf:	89 54 24 08          	mov    %edx,0x8(%esp)
801041d3:	c7 04 24 03 76 10 80 	movl   $0x80107603,(%esp)
801041da:	89 44 24 04          	mov    %eax,0x4(%esp)
801041de:	e8 6d c4 ff ff       	call   80100650 <cprintf>
    if(p->state == SLEEPING){
801041e3:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
801041e7:	75 9f                	jne    80104188 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801041e9:	8d 45 c0             	lea    -0x40(%ebp),%eax
801041ec:	89 44 24 04          	mov    %eax,0x4(%esp)
801041f0:	8b 43 b0             	mov    -0x50(%ebx),%eax
801041f3:	8d 7d c0             	lea    -0x40(%ebp),%edi
801041f6:	8b 40 0c             	mov    0xc(%eax),%eax
801041f9:	83 c0 08             	add    $0x8,%eax
801041fc:	89 04 24             	mov    %eax,(%esp)
801041ff:	e8 6c 01 00 00       	call   80104370 <getcallerpcs>
80104204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104208:	8b 17                	mov    (%edi),%edx
8010420a:	85 d2                	test   %edx,%edx
8010420c:	0f 84 76 ff ff ff    	je     80104188 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104212:	89 54 24 04          	mov    %edx,0x4(%esp)
80104216:	83 c7 04             	add    $0x4,%edi
80104219:	c7 04 24 29 70 10 80 	movl   $0x80107029,(%esp)
80104220:	e8 2b c4 ff ff       	call   80100650 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104225:	39 f7                	cmp    %esi,%edi
80104227:	75 df                	jne    80104208 <procdump+0x98>
80104229:	e9 5a ff ff ff       	jmp    80104188 <procdump+0x18>
8010422e:	66 90                	xchg   %ax,%ax
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104230:	83 c4 4c             	add    $0x4c,%esp
80104233:	5b                   	pop    %ebx
80104234:	5e                   	pop    %esi
80104235:	5f                   	pop    %edi
80104236:	5d                   	pop    %ebp
80104237:	c3                   	ret    
80104238:	66 90                	xchg   %ax,%ax
8010423a:	66 90                	xchg   %ax,%ax
8010423c:	66 90                	xchg   %ax,%ax
8010423e:	66 90                	xchg   %ax,%ax

80104240 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104240:	55                   	push   %ebp
80104241:	89 e5                	mov    %esp,%ebp
80104243:	53                   	push   %ebx
80104244:	83 ec 14             	sub    $0x14,%esp
80104247:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010424a:	c7 44 24 04 b8 76 10 	movl   $0x801076b8,0x4(%esp)
80104251:	80 
80104252:	8d 43 04             	lea    0x4(%ebx),%eax
80104255:	89 04 24             	mov    %eax,(%esp)
80104258:	e8 f3 00 00 00       	call   80104350 <initlock>
  lk->name = name;
8010425d:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
80104260:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80104266:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
8010426d:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
80104270:	83 c4 14             	add    $0x14,%esp
80104273:	5b                   	pop    %ebx
80104274:	5d                   	pop    %ebp
80104275:	c3                   	ret    
80104276:	8d 76 00             	lea    0x0(%esi),%esi
80104279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104280 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104280:	55                   	push   %ebp
80104281:	89 e5                	mov    %esp,%ebp
80104283:	56                   	push   %esi
80104284:	53                   	push   %ebx
80104285:	83 ec 10             	sub    $0x10,%esp
80104288:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
8010428b:	8d 73 04             	lea    0x4(%ebx),%esi
8010428e:	89 34 24             	mov    %esi,(%esp)
80104291:	e8 3a 01 00 00       	call   801043d0 <acquire>
  while (lk->locked) {
80104296:	8b 13                	mov    (%ebx),%edx
80104298:	85 d2                	test   %edx,%edx
8010429a:	74 16                	je     801042b2 <acquiresleep+0x32>
8010429c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sleep(lk, &lk->lk);
801042a0:	89 74 24 04          	mov    %esi,0x4(%esp)
801042a4:	89 1c 24             	mov    %ebx,(%esp)
801042a7:	e8 24 fc ff ff       	call   80103ed0 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
801042ac:	8b 03                	mov    (%ebx),%eax
801042ae:	85 c0                	test   %eax,%eax
801042b0:	75 ee                	jne    801042a0 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
801042b2:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = proc->pid;
801042b8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042be:	8b 40 10             	mov    0x10(%eax),%eax
801042c1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801042c4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801042c7:	83 c4 10             	add    $0x10,%esp
801042ca:	5b                   	pop    %ebx
801042cb:	5e                   	pop    %esi
801042cc:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = proc->pid;
  release(&lk->lk);
801042cd:	e9 2e 02 00 00       	jmp    80104500 <release>
801042d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042e0 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
801042e0:	55                   	push   %ebp
801042e1:	89 e5                	mov    %esp,%ebp
801042e3:	56                   	push   %esi
801042e4:	53                   	push   %ebx
801042e5:	83 ec 10             	sub    $0x10,%esp
801042e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801042eb:	8d 73 04             	lea    0x4(%ebx),%esi
801042ee:	89 34 24             	mov    %esi,(%esp)
801042f1:	e8 da 00 00 00       	call   801043d0 <acquire>
  lk->locked = 0;
801042f6:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801042fc:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104303:	89 1c 24             	mov    %ebx,(%esp)
80104306:	e8 75 fd ff ff       	call   80104080 <wakeup>
  release(&lk->lk);
8010430b:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010430e:	83 c4 10             	add    $0x10,%esp
80104311:	5b                   	pop    %ebx
80104312:	5e                   	pop    %esi
80104313:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104314:	e9 e7 01 00 00       	jmp    80104500 <release>
80104319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104320 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	56                   	push   %esi
80104324:	53                   	push   %ebx
80104325:	83 ec 10             	sub    $0x10,%esp
80104328:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010432b:	8d 73 04             	lea    0x4(%ebx),%esi
8010432e:	89 34 24             	mov    %esi,(%esp)
80104331:	e8 9a 00 00 00       	call   801043d0 <acquire>
  r = lk->locked;
80104336:	8b 1b                	mov    (%ebx),%ebx
  release(&lk->lk);
80104338:	89 34 24             	mov    %esi,(%esp)
8010433b:	e8 c0 01 00 00       	call   80104500 <release>
  return r;
}
80104340:	83 c4 10             	add    $0x10,%esp
80104343:	89 d8                	mov    %ebx,%eax
80104345:	5b                   	pop    %ebx
80104346:	5e                   	pop    %esi
80104347:	5d                   	pop    %ebp
80104348:	c3                   	ret    
80104349:	66 90                	xchg   %ax,%ax
8010434b:	66 90                	xchg   %ax,%ax
8010434d:	66 90                	xchg   %ax,%ax
8010434f:	90                   	nop

80104350 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104350:	55                   	push   %ebp
80104351:	89 e5                	mov    %esp,%ebp
80104353:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104356:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104359:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
8010435f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
80104362:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104369:	5d                   	pop    %ebp
8010436a:	c3                   	ret    
8010436b:	90                   	nop
8010436c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104370 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104370:	55                   	push   %ebp
80104371:	89 e5                	mov    %esp,%ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104373:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104376:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104379:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010437a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010437d:	31 c0                	xor    %eax,%eax
8010437f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104380:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104386:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010438c:	77 1a                	ja     801043a8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010438e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104391:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104394:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104397:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104399:	83 f8 0a             	cmp    $0xa,%eax
8010439c:	75 e2                	jne    80104380 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010439e:	5b                   	pop    %ebx
8010439f:	5d                   	pop    %ebp
801043a0:	c3                   	ret    
801043a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801043a8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801043af:	83 c0 01             	add    $0x1,%eax
801043b2:	83 f8 0a             	cmp    $0xa,%eax
801043b5:	74 e7                	je     8010439e <getcallerpcs+0x2e>
    pcs[i] = 0;
801043b7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801043be:	83 c0 01             	add    $0x1,%eax
801043c1:	83 f8 0a             	cmp    $0xa,%eax
801043c4:	75 e2                	jne    801043a8 <getcallerpcs+0x38>
801043c6:	eb d6                	jmp    8010439e <getcallerpcs+0x2e>
801043c8:	90                   	nop
801043c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801043d0 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
801043d0:	55                   	push   %ebp
801043d1:	89 e5                	mov    %esp,%ebp
801043d3:	83 ec 18             	sub    $0x18,%esp
801043d6:	9c                   	pushf  
801043d7:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
801043d8:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801043d9:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801043df:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
801043e5:	85 d2                	test   %edx,%edx
801043e7:	75 0c                	jne    801043f5 <acquire+0x25>
    cpu->intena = eflags & FL_IF;
801043e9:	81 e1 00 02 00 00    	and    $0x200,%ecx
801043ef:	89 88 b0 00 00 00    	mov    %ecx,0xb0(%eax)
  cpu->ncli += 1;
801043f5:	83 c2 01             	add    $0x1,%edx
801043f8:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
801043fe:	8b 55 08             	mov    0x8(%ebp),%edx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104401:	8b 0a                	mov    (%edx),%ecx
80104403:	85 c9                	test   %ecx,%ecx
80104405:	74 05                	je     8010440c <acquire+0x3c>
80104407:	3b 42 08             	cmp    0x8(%edx),%eax
8010440a:	74 3e                	je     8010444a <acquire+0x7a>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
8010440c:	b9 01 00 00 00       	mov    $0x1,%ecx
80104411:	eb 08                	jmp    8010441b <acquire+0x4b>
80104413:	90                   	nop
80104414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104418:	8b 55 08             	mov    0x8(%ebp),%edx
8010441b:	89 c8                	mov    %ecx,%eax
8010441d:	f0 87 02             	lock xchg %eax,(%edx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
80104420:	85 c0                	test   %eax,%eax
80104422:	75 f4                	jne    80104418 <acquire+0x48>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
80104424:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104429:	8b 45 08             	mov    0x8(%ebp),%eax
8010442c:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  getcallerpcs(&lk, lk->pcs);
80104433:	83 c0 0c             	add    $0xc,%eax
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104436:	89 50 fc             	mov    %edx,-0x4(%eax)
  getcallerpcs(&lk, lk->pcs);
80104439:	89 44 24 04          	mov    %eax,0x4(%esp)
8010443d:	8d 45 08             	lea    0x8(%ebp),%eax
80104440:	89 04 24             	mov    %eax,(%esp)
80104443:	e8 28 ff ff ff       	call   80104370 <getcallerpcs>
}
80104448:	c9                   	leave  
80104449:	c3                   	ret    
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
8010444a:	c7 04 24 c3 76 10 80 	movl   $0x801076c3,(%esp)
80104451:	e8 0a bf ff ff       	call   80100360 <panic>
80104456:	8d 76 00             	lea    0x0(%esi),%esi
80104459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104460 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104460:	55                   	push   %ebp
  return lock->locked && lock->cpu == cpu;
80104461:	31 c0                	xor    %eax,%eax
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104463:	89 e5                	mov    %esp,%ebp
80104465:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
80104468:	8b 0a                	mov    (%edx),%ecx
8010446a:	85 c9                	test   %ecx,%ecx
8010446c:	74 0f                	je     8010447d <holding+0x1d>
8010446e:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104474:	39 42 08             	cmp    %eax,0x8(%edx)
80104477:	0f 94 c0             	sete   %al
8010447a:	0f b6 c0             	movzbl %al,%eax
}
8010447d:	5d                   	pop    %ebp
8010447e:	c3                   	ret    
8010447f:	90                   	nop

80104480 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104480:	55                   	push   %ebp
80104481:	89 e5                	mov    %esp,%ebp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104483:	9c                   	pushf  
80104484:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104485:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
80104486:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010448c:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
80104492:	85 d2                	test   %edx,%edx
80104494:	75 0c                	jne    801044a2 <pushcli+0x22>
    cpu->intena = eflags & FL_IF;
80104496:	81 e1 00 02 00 00    	and    $0x200,%ecx
8010449c:	89 88 b0 00 00 00    	mov    %ecx,0xb0(%eax)
  cpu->ncli += 1;
801044a2:	83 c2 01             	add    $0x1,%edx
801044a5:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
}
801044ab:	5d                   	pop    %ebp
801044ac:	c3                   	ret    
801044ad:	8d 76 00             	lea    0x0(%esi),%esi

801044b0 <popcli>:

void
popcli(void)
{
801044b0:	55                   	push   %ebp
801044b1:	89 e5                	mov    %esp,%ebp
801044b3:	83 ec 18             	sub    $0x18,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801044b6:	9c                   	pushf  
801044b7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801044b8:	f6 c4 02             	test   $0x2,%ah
801044bb:	75 34                	jne    801044f1 <popcli+0x41>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
801044bd:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801044c3:	8b 88 ac 00 00 00    	mov    0xac(%eax),%ecx
801044c9:	8d 51 ff             	lea    -0x1(%ecx),%edx
801044cc:	85 d2                	test   %edx,%edx
801044ce:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
801044d4:	78 0f                	js     801044e5 <popcli+0x35>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
801044d6:	75 0b                	jne    801044e3 <popcli+0x33>
801044d8:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
801044de:	85 c0                	test   %eax,%eax
801044e0:	74 01                	je     801044e3 <popcli+0x33>
}

static inline void
sti(void)
{
  asm volatile("sti");
801044e2:	fb                   	sti    
    sti();
}
801044e3:	c9                   	leave  
801044e4:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
    panic("popcli");
801044e5:	c7 04 24 e2 76 10 80 	movl   $0x801076e2,(%esp)
801044ec:	e8 6f be ff ff       	call   80100360 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
801044f1:	c7 04 24 cb 76 10 80 	movl   $0x801076cb,(%esp)
801044f8:	e8 63 be ff ff       	call   80100360 <panic>
801044fd:	8d 76 00             	lea    0x0(%esi),%esi

80104500 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
80104500:	55                   	push   %ebp
80104501:	89 e5                	mov    %esp,%ebp
80104503:	83 ec 18             	sub    $0x18,%esp
80104506:	8b 45 08             	mov    0x8(%ebp),%eax

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104509:	8b 10                	mov    (%eax),%edx
8010450b:	85 d2                	test   %edx,%edx
8010450d:	74 0c                	je     8010451b <release+0x1b>
8010450f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104516:	39 50 08             	cmp    %edx,0x8(%eax)
80104519:	74 0d                	je     80104528 <release+0x28>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
8010451b:	c7 04 24 e9 76 10 80 	movl   $0x801076e9,(%esp)
80104522:	e8 39 be ff ff       	call   80100360 <panic>
80104527:	90                   	nop

  lk->pcs[0] = 0;
80104528:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
8010452f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
80104536:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010453b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  popcli();
}
80104541:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
80104542:	e9 69 ff ff ff       	jmp    801044b0 <popcli>
80104547:	66 90                	xchg   %ax,%ax
80104549:	66 90                	xchg   %ax,%ax
8010454b:	66 90                	xchg   %ax,%ax
8010454d:	66 90                	xchg   %ax,%ax
8010454f:	90                   	nop

80104550 <memset>:
80104550:	55                   	push   %ebp
80104551:	89 e5                	mov    %esp,%ebp
80104553:	57                   	push   %edi
80104554:	53                   	push   %ebx
80104555:	8b 55 08             	mov    0x8(%ebp),%edx
80104558:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010455b:	f6 c2 03             	test   $0x3,%dl
8010455e:	75 05                	jne    80104565 <memset+0x15>
80104560:	f6 c1 03             	test   $0x3,%cl
80104563:	74 13                	je     80104578 <memset+0x28>
80104565:	89 d7                	mov    %edx,%edi
80104567:	8b 45 0c             	mov    0xc(%ebp),%eax
8010456a:	fc                   	cld    
8010456b:	f3 aa                	rep stos %al,%es:(%edi)
8010456d:	5b                   	pop    %ebx
8010456e:	89 d0                	mov    %edx,%eax
80104570:	5f                   	pop    %edi
80104571:	5d                   	pop    %ebp
80104572:	c3                   	ret    
80104573:	90                   	nop
80104574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104578:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
8010457c:	c1 e9 02             	shr    $0x2,%ecx
8010457f:	89 fb                	mov    %edi,%ebx
80104581:	89 f8                	mov    %edi,%eax
80104583:	c1 e3 18             	shl    $0x18,%ebx
80104586:	c1 e0 10             	shl    $0x10,%eax
80104589:	09 d8                	or     %ebx,%eax
8010458b:	09 f8                	or     %edi,%eax
8010458d:	c1 e7 08             	shl    $0x8,%edi
80104590:	09 f8                	or     %edi,%eax
80104592:	89 d7                	mov    %edx,%edi
80104594:	fc                   	cld    
80104595:	f3 ab                	rep stos %eax,%es:(%edi)
80104597:	5b                   	pop    %ebx
80104598:	89 d0                	mov    %edx,%eax
8010459a:	5f                   	pop    %edi
8010459b:	5d                   	pop    %ebp
8010459c:	c3                   	ret    
8010459d:	8d 76 00             	lea    0x0(%esi),%esi

801045a0 <memcmp>:
801045a0:	55                   	push   %ebp
801045a1:	89 e5                	mov    %esp,%ebp
801045a3:	57                   	push   %edi
801045a4:	56                   	push   %esi
801045a5:	8b 45 10             	mov    0x10(%ebp),%eax
801045a8:	53                   	push   %ebx
801045a9:	8b 75 0c             	mov    0xc(%ebp),%esi
801045ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
801045af:	85 c0                	test   %eax,%eax
801045b1:	74 29                	je     801045dc <memcmp+0x3c>
801045b3:	0f b6 13             	movzbl (%ebx),%edx
801045b6:	0f b6 0e             	movzbl (%esi),%ecx
801045b9:	38 d1                	cmp    %dl,%cl
801045bb:	75 2b                	jne    801045e8 <memcmp+0x48>
801045bd:	8d 78 ff             	lea    -0x1(%eax),%edi
801045c0:	31 c0                	xor    %eax,%eax
801045c2:	eb 14                	jmp    801045d8 <memcmp+0x38>
801045c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045c8:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
801045cd:	83 c0 01             	add    $0x1,%eax
801045d0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801045d4:	38 ca                	cmp    %cl,%dl
801045d6:	75 10                	jne    801045e8 <memcmp+0x48>
801045d8:	39 f8                	cmp    %edi,%eax
801045da:	75 ec                	jne    801045c8 <memcmp+0x28>
801045dc:	5b                   	pop    %ebx
801045dd:	31 c0                	xor    %eax,%eax
801045df:	5e                   	pop    %esi
801045e0:	5f                   	pop    %edi
801045e1:	5d                   	pop    %ebp
801045e2:	c3                   	ret    
801045e3:	90                   	nop
801045e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045e8:	0f b6 c2             	movzbl %dl,%eax
801045eb:	5b                   	pop    %ebx
801045ec:	29 c8                	sub    %ecx,%eax
801045ee:	5e                   	pop    %esi
801045ef:	5f                   	pop    %edi
801045f0:	5d                   	pop    %ebp
801045f1:	c3                   	ret    
801045f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104600 <memmove>:
80104600:	55                   	push   %ebp
80104601:	89 e5                	mov    %esp,%ebp
80104603:	56                   	push   %esi
80104604:	53                   	push   %ebx
80104605:	8b 45 08             	mov    0x8(%ebp),%eax
80104608:	8b 75 0c             	mov    0xc(%ebp),%esi
8010460b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010460e:	39 c6                	cmp    %eax,%esi
80104610:	73 2e                	jae    80104640 <memmove+0x40>
80104612:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104615:	39 c8                	cmp    %ecx,%eax
80104617:	73 27                	jae    80104640 <memmove+0x40>
80104619:	85 db                	test   %ebx,%ebx
8010461b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010461e:	74 17                	je     80104637 <memmove+0x37>
80104620:	29 d9                	sub    %ebx,%ecx
80104622:	89 cb                	mov    %ecx,%ebx
80104624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104628:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010462c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010462f:	83 ea 01             	sub    $0x1,%edx
80104632:	83 fa ff             	cmp    $0xffffffff,%edx
80104635:	75 f1                	jne    80104628 <memmove+0x28>
80104637:	5b                   	pop    %ebx
80104638:	5e                   	pop    %esi
80104639:	5d                   	pop    %ebp
8010463a:	c3                   	ret    
8010463b:	90                   	nop
8010463c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104640:	31 d2                	xor    %edx,%edx
80104642:	85 db                	test   %ebx,%ebx
80104644:	74 f1                	je     80104637 <memmove+0x37>
80104646:	8d 76 00             	lea    0x0(%esi),%esi
80104649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104650:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104654:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104657:	83 c2 01             	add    $0x1,%edx
8010465a:	39 d3                	cmp    %edx,%ebx
8010465c:	75 f2                	jne    80104650 <memmove+0x50>
8010465e:	5b                   	pop    %ebx
8010465f:	5e                   	pop    %esi
80104660:	5d                   	pop    %ebp
80104661:	c3                   	ret    
80104662:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104670 <memcpy>:
80104670:	55                   	push   %ebp
80104671:	89 e5                	mov    %esp,%ebp
80104673:	5d                   	pop    %ebp
80104674:	eb 8a                	jmp    80104600 <memmove>
80104676:	8d 76 00             	lea    0x0(%esi),%esi
80104679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104680 <strncmp>:
80104680:	55                   	push   %ebp
80104681:	89 e5                	mov    %esp,%ebp
80104683:	57                   	push   %edi
80104684:	56                   	push   %esi
80104685:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104688:	53                   	push   %ebx
80104689:	8b 7d 08             	mov    0x8(%ebp),%edi
8010468c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010468f:	85 c9                	test   %ecx,%ecx
80104691:	74 37                	je     801046ca <strncmp+0x4a>
80104693:	0f b6 17             	movzbl (%edi),%edx
80104696:	0f b6 1e             	movzbl (%esi),%ebx
80104699:	84 d2                	test   %dl,%dl
8010469b:	74 3f                	je     801046dc <strncmp+0x5c>
8010469d:	38 d3                	cmp    %dl,%bl
8010469f:	75 3b                	jne    801046dc <strncmp+0x5c>
801046a1:	8d 47 01             	lea    0x1(%edi),%eax
801046a4:	01 cf                	add    %ecx,%edi
801046a6:	eb 1b                	jmp    801046c3 <strncmp+0x43>
801046a8:	90                   	nop
801046a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046b0:	0f b6 10             	movzbl (%eax),%edx
801046b3:	84 d2                	test   %dl,%dl
801046b5:	74 21                	je     801046d8 <strncmp+0x58>
801046b7:	0f b6 19             	movzbl (%ecx),%ebx
801046ba:	83 c0 01             	add    $0x1,%eax
801046bd:	89 ce                	mov    %ecx,%esi
801046bf:	38 da                	cmp    %bl,%dl
801046c1:	75 19                	jne    801046dc <strncmp+0x5c>
801046c3:	39 c7                	cmp    %eax,%edi
801046c5:	8d 4e 01             	lea    0x1(%esi),%ecx
801046c8:	75 e6                	jne    801046b0 <strncmp+0x30>
801046ca:	5b                   	pop    %ebx
801046cb:	31 c0                	xor    %eax,%eax
801046cd:	5e                   	pop    %esi
801046ce:	5f                   	pop    %edi
801046cf:	5d                   	pop    %ebp
801046d0:	c3                   	ret    
801046d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046d8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
801046dc:	0f b6 c2             	movzbl %dl,%eax
801046df:	29 d8                	sub    %ebx,%eax
801046e1:	5b                   	pop    %ebx
801046e2:	5e                   	pop    %esi
801046e3:	5f                   	pop    %edi
801046e4:	5d                   	pop    %ebp
801046e5:	c3                   	ret    
801046e6:	8d 76 00             	lea    0x0(%esi),%esi
801046e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046f0 <strncpy>:
801046f0:	55                   	push   %ebp
801046f1:	89 e5                	mov    %esp,%ebp
801046f3:	56                   	push   %esi
801046f4:	53                   	push   %ebx
801046f5:	8b 45 08             	mov    0x8(%ebp),%eax
801046f8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801046fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
801046fe:	89 c2                	mov    %eax,%edx
80104700:	eb 19                	jmp    8010471b <strncpy+0x2b>
80104702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104708:	83 c3 01             	add    $0x1,%ebx
8010470b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010470f:	83 c2 01             	add    $0x1,%edx
80104712:	84 c9                	test   %cl,%cl
80104714:	88 4a ff             	mov    %cl,-0x1(%edx)
80104717:	74 09                	je     80104722 <strncpy+0x32>
80104719:	89 f1                	mov    %esi,%ecx
8010471b:	85 c9                	test   %ecx,%ecx
8010471d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104720:	7f e6                	jg     80104708 <strncpy+0x18>
80104722:	31 c9                	xor    %ecx,%ecx
80104724:	85 f6                	test   %esi,%esi
80104726:	7e 17                	jle    8010473f <strncpy+0x4f>
80104728:	90                   	nop
80104729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104730:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104734:	89 f3                	mov    %esi,%ebx
80104736:	83 c1 01             	add    $0x1,%ecx
80104739:	29 cb                	sub    %ecx,%ebx
8010473b:	85 db                	test   %ebx,%ebx
8010473d:	7f f1                	jg     80104730 <strncpy+0x40>
8010473f:	5b                   	pop    %ebx
80104740:	5e                   	pop    %esi
80104741:	5d                   	pop    %ebp
80104742:	c3                   	ret    
80104743:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104750 <safestrcpy>:
80104750:	55                   	push   %ebp
80104751:	89 e5                	mov    %esp,%ebp
80104753:	56                   	push   %esi
80104754:	53                   	push   %ebx
80104755:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104758:	8b 45 08             	mov    0x8(%ebp),%eax
8010475b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010475e:	85 c9                	test   %ecx,%ecx
80104760:	7e 26                	jle    80104788 <safestrcpy+0x38>
80104762:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104766:	89 c1                	mov    %eax,%ecx
80104768:	eb 17                	jmp    80104781 <safestrcpy+0x31>
8010476a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104770:	83 c2 01             	add    $0x1,%edx
80104773:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104777:	83 c1 01             	add    $0x1,%ecx
8010477a:	84 db                	test   %bl,%bl
8010477c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010477f:	74 04                	je     80104785 <safestrcpy+0x35>
80104781:	39 f2                	cmp    %esi,%edx
80104783:	75 eb                	jne    80104770 <safestrcpy+0x20>
80104785:	c6 01 00             	movb   $0x0,(%ecx)
80104788:	5b                   	pop    %ebx
80104789:	5e                   	pop    %esi
8010478a:	5d                   	pop    %ebp
8010478b:	c3                   	ret    
8010478c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104790 <strlen>:
80104790:	55                   	push   %ebp
80104791:	31 c0                	xor    %eax,%eax
80104793:	89 e5                	mov    %esp,%ebp
80104795:	8b 55 08             	mov    0x8(%ebp),%edx
80104798:	80 3a 00             	cmpb   $0x0,(%edx)
8010479b:	74 0c                	je     801047a9 <strlen+0x19>
8010479d:	8d 76 00             	lea    0x0(%esi),%esi
801047a0:	83 c0 01             	add    $0x1,%eax
801047a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801047a7:	75 f7                	jne    801047a0 <strlen+0x10>
801047a9:	5d                   	pop    %ebp
801047aa:	c3                   	ret    

801047ab <swtch>:
801047ab:	8b 44 24 04          	mov    0x4(%esp),%eax
801047af:	8b 54 24 08          	mov    0x8(%esp),%edx
801047b3:	55                   	push   %ebp
801047b4:	53                   	push   %ebx
801047b5:	56                   	push   %esi
801047b6:	57                   	push   %edi
801047b7:	89 20                	mov    %esp,(%eax)
801047b9:	89 d4                	mov    %edx,%esp
801047bb:	5f                   	pop    %edi
801047bc:	5e                   	pop    %esi
801047bd:	5b                   	pop    %ebx
801047be:	5d                   	pop    %ebp
801047bf:	c3                   	ret    

801047c0 <fetchint>:

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801047c0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801047c7:	55                   	push   %ebp
801047c8:	89 e5                	mov    %esp,%ebp
801047ca:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
801047cd:	8b 12                	mov    (%edx),%edx
801047cf:	39 c2                	cmp    %eax,%edx
801047d1:	76 15                	jbe    801047e8 <fetchint+0x28>
801047d3:	8d 48 04             	lea    0x4(%eax),%ecx
801047d6:	39 ca                	cmp    %ecx,%edx
801047d8:	72 0e                	jb     801047e8 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
801047da:	8b 10                	mov    (%eax),%edx
801047dc:	8b 45 0c             	mov    0xc(%ebp),%eax
801047df:	89 10                	mov    %edx,(%eax)
  return 0;
801047e1:	31 c0                	xor    %eax,%eax
}
801047e3:	5d                   	pop    %ebp
801047e4:	c3                   	ret    
801047e5:	8d 76 00             	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
801047e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
801047ed:	5d                   	pop    %ebp
801047ee:	c3                   	ret    
801047ef:	90                   	nop

801047f0 <fetchstr>:
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
801047f0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801047f6:	55                   	push   %ebp
801047f7:	89 e5                	mov    %esp,%ebp
801047f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *s, *ep;

  if(addr >= proc->sz)
801047fc:	39 08                	cmp    %ecx,(%eax)
801047fe:	76 2c                	jbe    8010482c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104800:	8b 55 0c             	mov    0xc(%ebp),%edx
80104803:	89 c8                	mov    %ecx,%eax
80104805:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104807:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010480e:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104810:	39 d1                	cmp    %edx,%ecx
80104812:	73 18                	jae    8010482c <fetchstr+0x3c>
    if(*s == 0)
80104814:	80 39 00             	cmpb   $0x0,(%ecx)
80104817:	75 0c                	jne    80104825 <fetchstr+0x35>
80104819:	eb 1d                	jmp    80104838 <fetchstr+0x48>
8010481b:	90                   	nop
8010481c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104820:	80 38 00             	cmpb   $0x0,(%eax)
80104823:	74 13                	je     80104838 <fetchstr+0x48>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104825:	83 c0 01             	add    $0x1,%eax
80104828:	39 c2                	cmp    %eax,%edx
8010482a:	77 f4                	ja     80104820 <fetchstr+0x30>
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
    return -1;
8010482c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}
80104831:	5d                   	pop    %ebp
80104832:	c3                   	ret    
80104833:	90                   	nop
80104834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
80104838:	29 c8                	sub    %ecx,%eax
  return -1;
}
8010483a:	5d                   	pop    %ebp
8010483b:	c3                   	ret    
8010483c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104840 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104840:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104847:	55                   	push   %ebp
80104848:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
8010484a:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010484d:	8b 42 18             	mov    0x18(%edx),%eax

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104850:	8b 12                	mov    (%edx),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104852:	8b 40 44             	mov    0x44(%eax),%eax
80104855:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104858:	8d 48 04             	lea    0x4(%eax),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010485b:	39 d1                	cmp    %edx,%ecx
8010485d:	73 19                	jae    80104878 <argint+0x38>
8010485f:	8d 48 08             	lea    0x8(%eax),%ecx
80104862:	39 ca                	cmp    %ecx,%edx
80104864:	72 12                	jb     80104878 <argint+0x38>
    return -1;
  *ip = *(int*)(addr);
80104866:	8b 50 04             	mov    0x4(%eax),%edx
80104869:	8b 45 0c             	mov    0xc(%ebp),%eax
8010486c:	89 10                	mov    %edx,(%eax)
  return 0;
8010486e:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
80104870:	5d                   	pop    %ebp
80104871:	c3                   	ret    
80104872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104878:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
8010487d:	5d                   	pop    %ebp
8010487e:	c3                   	ret    
8010487f:	90                   	nop

80104880 <argptr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104880:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104886:	55                   	push   %ebp
80104887:	89 e5                	mov    %esp,%ebp
80104889:	53                   	push   %ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
8010488a:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010488d:	8b 50 18             	mov    0x18(%eax),%edx
80104890:	8b 52 44             	mov    0x44(%edx),%edx
80104893:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104896:	8b 10                	mov    (%eax),%edx
argptr(int n, char **pp, int size)
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
80104898:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
8010489d:	8d 59 04             	lea    0x4(%ecx),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801048a0:	39 d3                	cmp    %edx,%ebx
801048a2:	73 25                	jae    801048c9 <argptr+0x49>
801048a4:	8d 59 08             	lea    0x8(%ecx),%ebx
801048a7:	39 da                	cmp    %ebx,%edx
801048a9:	72 1e                	jb     801048c9 <argptr+0x49>
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
801048ab:	8b 5d 10             	mov    0x10(%ebp),%ebx
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
801048ae:	8b 49 04             	mov    0x4(%ecx),%ecx
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
801048b1:	85 db                	test   %ebx,%ebx
801048b3:	78 14                	js     801048c9 <argptr+0x49>
801048b5:	39 d1                	cmp    %edx,%ecx
801048b7:	73 10                	jae    801048c9 <argptr+0x49>
801048b9:	8b 5d 10             	mov    0x10(%ebp),%ebx
801048bc:	01 cb                	add    %ecx,%ebx
801048be:	39 d3                	cmp    %edx,%ebx
801048c0:	77 07                	ja     801048c9 <argptr+0x49>
    return -1;
  *pp = (char*)i;
801048c2:	8b 45 0c             	mov    0xc(%ebp),%eax
801048c5:	89 08                	mov    %ecx,(%eax)
  return 0;
801048c7:	31 c0                	xor    %eax,%eax
}
801048c9:	5b                   	pop    %ebx
801048ca:	5d                   	pop    %ebp
801048cb:	c3                   	ret    
801048cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801048d0 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801048d0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801048d6:	55                   	push   %ebp
801048d7:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801048d9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801048dc:	8b 50 18             	mov    0x18(%eax),%edx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801048df:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801048e1:	8b 52 44             	mov    0x44(%edx),%edx
801048e4:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
801048e7:	8d 4a 04             	lea    0x4(%edx),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801048ea:	39 c1                	cmp    %eax,%ecx
801048ec:	73 07                	jae    801048f5 <argstr+0x25>
801048ee:	8d 4a 08             	lea    0x8(%edx),%ecx
801048f1:	39 c8                	cmp    %ecx,%eax
801048f3:	73 0b                	jae    80104900 <argstr+0x30>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
801048f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
801048fa:	5d                   	pop    %ebp
801048fb:	c3                   	ret    
801048fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104900:	8b 4a 04             	mov    0x4(%edx),%ecx
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
80104903:	39 c1                	cmp    %eax,%ecx
80104905:	73 ee                	jae    801048f5 <argstr+0x25>
    return -1;
  *pp = (char*)addr;
80104907:	8b 55 0c             	mov    0xc(%ebp),%edx
8010490a:	89 c8                	mov    %ecx,%eax
8010490c:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
8010490e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104915:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104917:	39 d1                	cmp    %edx,%ecx
80104919:	73 da                	jae    801048f5 <argstr+0x25>
    if(*s == 0)
8010491b:	80 39 00             	cmpb   $0x0,(%ecx)
8010491e:	75 12                	jne    80104932 <argstr+0x62>
80104920:	eb 1e                	jmp    80104940 <argstr+0x70>
80104922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104928:	80 38 00             	cmpb   $0x0,(%eax)
8010492b:	90                   	nop
8010492c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104930:	74 0e                	je     80104940 <argstr+0x70>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104932:	83 c0 01             	add    $0x1,%eax
80104935:	39 c2                	cmp    %eax,%edx
80104937:	77 ef                	ja     80104928 <argstr+0x58>
80104939:	eb ba                	jmp    801048f5 <argstr+0x25>
8010493b:	90                   	nop
8010493c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(*s == 0)
      return s - *pp;
80104940:	29 c8                	sub    %ecx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104942:	5d                   	pop    %ebp
80104943:	c3                   	ret    
80104944:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010494a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104950 <syscall>:
[SYS_chpr]   sys_chpr,
};

void
syscall(void)
{
80104950:	55                   	push   %ebp
80104951:	89 e5                	mov    %esp,%ebp
80104953:	53                   	push   %ebx
80104954:	83 ec 14             	sub    $0x14,%esp
  int num;

  num = proc->tf->eax;
80104957:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010495e:	8b 5a 18             	mov    0x18(%edx),%ebx
80104961:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104964:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104967:	83 f9 17             	cmp    $0x17,%ecx
8010496a:	77 1c                	ja     80104988 <syscall+0x38>
8010496c:	8b 0c 85 20 77 10 80 	mov    -0x7fef88e0(,%eax,4),%ecx
80104973:	85 c9                	test   %ecx,%ecx
80104975:	74 11                	je     80104988 <syscall+0x38>
    proc->tf->eax = syscalls[num]();
80104977:	ff d1                	call   *%ecx
80104979:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
8010497c:	83 c4 14             	add    $0x14,%esp
8010497f:	5b                   	pop    %ebx
80104980:	5d                   	pop    %ebp
80104981:	c3                   	ret    
80104982:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104988:	89 44 24 0c          	mov    %eax,0xc(%esp)
            proc->pid, proc->name, num);
8010498c:	8d 42 6c             	lea    0x6c(%edx),%eax
8010498f:	89 44 24 08          	mov    %eax,0x8(%esp)

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104993:	8b 42 10             	mov    0x10(%edx),%eax
80104996:	c7 04 24 f1 76 10 80 	movl   $0x801076f1,(%esp)
8010499d:	89 44 24 04          	mov    %eax,0x4(%esp)
801049a1:	e8 aa bc ff ff       	call   80100650 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
801049a6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801049ac:	8b 40 18             	mov    0x18(%eax),%eax
801049af:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
801049b6:	83 c4 14             	add    $0x14,%esp
801049b9:	5b                   	pop    %ebx
801049ba:	5d                   	pop    %ebp
801049bb:	c3                   	ret    
801049bc:	66 90                	xchg   %ax,%ax
801049be:	66 90                	xchg   %ax,%ax

801049c0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801049c0:	55                   	push   %ebp
801049c1:	89 e5                	mov    %esp,%ebp
801049c3:	57                   	push   %edi
801049c4:	56                   	push   %esi
801049c5:	53                   	push   %ebx
801049c6:	83 ec 4c             	sub    $0x4c,%esp
801049c9:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801049cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801049cf:	8d 5d da             	lea    -0x26(%ebp),%ebx
801049d2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801049d6:	89 04 24             	mov    %eax,(%esp)
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801049d9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801049dc:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801049df:	e8 2c d5 ff ff       	call   80101f10 <nameiparent>
801049e4:	85 c0                	test   %eax,%eax
801049e6:	89 c7                	mov    %eax,%edi
801049e8:	0f 84 da 00 00 00    	je     80104ac8 <create+0x108>
    return 0;
  ilock(dp);
801049ee:	89 04 24             	mov    %eax,(%esp)
801049f1:	e8 ca cc ff ff       	call   801016c0 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
801049f6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801049f9:	89 44 24 08          	mov    %eax,0x8(%esp)
801049fd:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104a01:	89 3c 24             	mov    %edi,(%esp)
80104a04:	e8 a7 d1 ff ff       	call   80101bb0 <dirlookup>
80104a09:	85 c0                	test   %eax,%eax
80104a0b:	89 c6                	mov    %eax,%esi
80104a0d:	74 41                	je     80104a50 <create+0x90>
    iunlockput(dp);
80104a0f:	89 3c 24             	mov    %edi,(%esp)
80104a12:	e8 e9 ce ff ff       	call   80101900 <iunlockput>
    ilock(ip);
80104a17:	89 34 24             	mov    %esi,(%esp)
80104a1a:	e8 a1 cc ff ff       	call   801016c0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104a1f:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104a24:	75 12                	jne    80104a38 <create+0x78>
80104a26:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
80104a2b:	89 f0                	mov    %esi,%eax
80104a2d:	75 09                	jne    80104a38 <create+0x78>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104a2f:	83 c4 4c             	add    $0x4c,%esp
80104a32:	5b                   	pop    %ebx
80104a33:	5e                   	pop    %esi
80104a34:	5f                   	pop    %edi
80104a35:	5d                   	pop    %ebp
80104a36:	c3                   	ret    
80104a37:	90                   	nop
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104a38:	89 34 24             	mov    %esi,(%esp)
80104a3b:	e8 c0 ce ff ff       	call   80101900 <iunlockput>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104a40:	83 c4 4c             	add    $0x4c,%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104a43:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104a45:	5b                   	pop    %ebx
80104a46:	5e                   	pop    %esi
80104a47:	5f                   	pop    %edi
80104a48:	5d                   	pop    %ebp
80104a49:	c3                   	ret    
80104a4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104a50:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104a54:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a58:	8b 07                	mov    (%edi),%eax
80104a5a:	89 04 24             	mov    %eax,(%esp)
80104a5d:	e8 ce ca ff ff       	call   80101530 <ialloc>
80104a62:	85 c0                	test   %eax,%eax
80104a64:	89 c6                	mov    %eax,%esi
80104a66:	0f 84 bf 00 00 00    	je     80104b2b <create+0x16b>
    panic("create: ialloc");

  ilock(ip);
80104a6c:	89 04 24             	mov    %eax,(%esp)
80104a6f:	e8 4c cc ff ff       	call   801016c0 <ilock>
  ip->major = major;
80104a74:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104a78:	66 89 46 52          	mov    %ax,0x52(%esi)
  ip->minor = minor;
80104a7c:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104a80:	66 89 46 54          	mov    %ax,0x54(%esi)
  ip->nlink = 1;
80104a84:	b8 01 00 00 00       	mov    $0x1,%eax
80104a89:	66 89 46 56          	mov    %ax,0x56(%esi)
  iupdate(ip);
80104a8d:	89 34 24             	mov    %esi,(%esp)
80104a90:	e8 6b cb ff ff       	call   80101600 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104a95:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104a9a:	74 34                	je     80104ad0 <create+0x110>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104a9c:	8b 46 04             	mov    0x4(%esi),%eax
80104a9f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104aa3:	89 3c 24             	mov    %edi,(%esp)
80104aa6:	89 44 24 08          	mov    %eax,0x8(%esp)
80104aaa:	e8 61 d3 ff ff       	call   80101e10 <dirlink>
80104aaf:	85 c0                	test   %eax,%eax
80104ab1:	78 6c                	js     80104b1f <create+0x15f>
    panic("create: dirlink");

  iunlockput(dp);
80104ab3:	89 3c 24             	mov    %edi,(%esp)
80104ab6:	e8 45 ce ff ff       	call   80101900 <iunlockput>

  return ip;
}
80104abb:	83 c4 4c             	add    $0x4c,%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104abe:	89 f0                	mov    %esi,%eax
}
80104ac0:	5b                   	pop    %ebx
80104ac1:	5e                   	pop    %esi
80104ac2:	5f                   	pop    %edi
80104ac3:	5d                   	pop    %ebp
80104ac4:	c3                   	ret    
80104ac5:	8d 76 00             	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104ac8:	31 c0                	xor    %eax,%eax
80104aca:	e9 60 ff ff ff       	jmp    80104a2f <create+0x6f>
80104acf:	90                   	nop
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104ad0:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104ad5:	89 3c 24             	mov    %edi,(%esp)
80104ad8:	e8 23 cb ff ff       	call   80101600 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104add:	8b 46 04             	mov    0x4(%esi),%eax
80104ae0:	c7 44 24 04 a0 77 10 	movl   $0x801077a0,0x4(%esp)
80104ae7:	80 
80104ae8:	89 34 24             	mov    %esi,(%esp)
80104aeb:	89 44 24 08          	mov    %eax,0x8(%esp)
80104aef:	e8 1c d3 ff ff       	call   80101e10 <dirlink>
80104af4:	85 c0                	test   %eax,%eax
80104af6:	78 1b                	js     80104b13 <create+0x153>
80104af8:	8b 47 04             	mov    0x4(%edi),%eax
80104afb:	c7 44 24 04 9f 77 10 	movl   $0x8010779f,0x4(%esp)
80104b02:	80 
80104b03:	89 34 24             	mov    %esi,(%esp)
80104b06:	89 44 24 08          	mov    %eax,0x8(%esp)
80104b0a:	e8 01 d3 ff ff       	call   80101e10 <dirlink>
80104b0f:	85 c0                	test   %eax,%eax
80104b11:	79 89                	jns    80104a9c <create+0xdc>
      panic("create dots");
80104b13:	c7 04 24 93 77 10 80 	movl   $0x80107793,(%esp)
80104b1a:	e8 41 b8 ff ff       	call   80100360 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104b1f:	c7 04 24 a2 77 10 80 	movl   $0x801077a2,(%esp)
80104b26:	e8 35 b8 ff ff       	call   80100360 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104b2b:	c7 04 24 84 77 10 80 	movl   $0x80107784,(%esp)
80104b32:	e8 29 b8 ff ff       	call   80100360 <panic>
80104b37:	89 f6                	mov    %esi,%esi
80104b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b40 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104b40:	55                   	push   %ebp
80104b41:	89 e5                	mov    %esp,%ebp
80104b43:	56                   	push   %esi
80104b44:	89 c6                	mov    %eax,%esi
80104b46:	53                   	push   %ebx
80104b47:	89 d3                	mov    %edx,%ebx
80104b49:	83 ec 20             	sub    $0x20,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104b4c:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b4f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b53:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104b5a:	e8 e1 fc ff ff       	call   80104840 <argint>
80104b5f:	85 c0                	test   %eax,%eax
80104b61:	78 35                	js     80104b98 <argfd.constprop.0+0x58>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104b63:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80104b66:	83 f9 0f             	cmp    $0xf,%ecx
80104b69:	77 2d                	ja     80104b98 <argfd.constprop.0+0x58>
80104b6b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b71:	8b 44 88 28          	mov    0x28(%eax,%ecx,4),%eax
80104b75:	85 c0                	test   %eax,%eax
80104b77:	74 1f                	je     80104b98 <argfd.constprop.0+0x58>
    return -1;
  if(pfd)
80104b79:	85 f6                	test   %esi,%esi
80104b7b:	74 02                	je     80104b7f <argfd.constprop.0+0x3f>
    *pfd = fd;
80104b7d:	89 0e                	mov    %ecx,(%esi)
  if(pf)
80104b7f:	85 db                	test   %ebx,%ebx
80104b81:	74 0d                	je     80104b90 <argfd.constprop.0+0x50>
    *pf = f;
80104b83:	89 03                	mov    %eax,(%ebx)
  return 0;
80104b85:	31 c0                	xor    %eax,%eax
}
80104b87:	83 c4 20             	add    $0x20,%esp
80104b8a:	5b                   	pop    %ebx
80104b8b:	5e                   	pop    %esi
80104b8c:	5d                   	pop    %ebp
80104b8d:	c3                   	ret    
80104b8e:	66 90                	xchg   %ax,%ax
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104b90:	31 c0                	xor    %eax,%eax
80104b92:	eb f3                	jmp    80104b87 <argfd.constprop.0+0x47>
80104b94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104b98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b9d:	eb e8                	jmp    80104b87 <argfd.constprop.0+0x47>
80104b9f:	90                   	nop

80104ba0 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104ba0:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104ba1:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104ba3:	89 e5                	mov    %esp,%ebp
80104ba5:	53                   	push   %ebx
80104ba6:	83 ec 24             	sub    $0x24,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104ba9:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104bac:	e8 8f ff ff ff       	call   80104b40 <argfd.constprop.0>
80104bb1:	85 c0                	test   %eax,%eax
80104bb3:	78 1b                	js     80104bd0 <sys_dup+0x30>
    return -1;
  if((fd=fdalloc(f)) < 0)
80104bb5:	8b 55 f4             	mov    -0xc(%ebp),%edx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104bb8:	31 db                	xor    %ebx,%ebx
80104bba:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    if(proc->ofile[fd] == 0){
80104bc0:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104bc4:	85 c9                	test   %ecx,%ecx
80104bc6:	74 18                	je     80104be0 <sys_dup+0x40>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104bc8:	83 c3 01             	add    $0x1,%ebx
80104bcb:	83 fb 10             	cmp    $0x10,%ebx
80104bce:	75 f0                	jne    80104bc0 <sys_dup+0x20>
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104bd0:	83 c4 24             	add    $0x24,%esp
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104bd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104bd8:	5b                   	pop    %ebx
80104bd9:	5d                   	pop    %ebp
80104bda:	c3                   	ret    
80104bdb:	90                   	nop
80104bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80104be0:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104be4:	89 14 24             	mov    %edx,(%esp)
80104be7:	e8 f4 c1 ff ff       	call   80100de0 <filedup>
  return fd;
}
80104bec:	83 c4 24             	add    $0x24,%esp
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
80104bef:	89 d8                	mov    %ebx,%eax
}
80104bf1:	5b                   	pop    %ebx
80104bf2:	5d                   	pop    %ebp
80104bf3:	c3                   	ret    
80104bf4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104bfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104c00 <sys_read>:

int
sys_read(void)
{
80104c00:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c01:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104c03:	89 e5                	mov    %esp,%ebp
80104c05:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c08:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c0b:	e8 30 ff ff ff       	call   80104b40 <argfd.constprop.0>
80104c10:	85 c0                	test   %eax,%eax
80104c12:	78 54                	js     80104c68 <sys_read+0x68>
80104c14:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c17:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c1b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104c22:	e8 19 fc ff ff       	call   80104840 <argint>
80104c27:	85 c0                	test   %eax,%eax
80104c29:	78 3d                	js     80104c68 <sys_read+0x68>
80104c2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104c2e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104c35:	89 44 24 08          	mov    %eax,0x8(%esp)
80104c39:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c3c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c40:	e8 3b fc ff ff       	call   80104880 <argptr>
80104c45:	85 c0                	test   %eax,%eax
80104c47:	78 1f                	js     80104c68 <sys_read+0x68>
    return -1;
  return fileread(f, p, n);
80104c49:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104c4c:	89 44 24 08          	mov    %eax,0x8(%esp)
80104c50:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c53:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c57:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104c5a:	89 04 24             	mov    %eax,(%esp)
80104c5d:	e8 de c2 ff ff       	call   80100f40 <fileread>
}
80104c62:	c9                   	leave  
80104c63:	c3                   	ret    
80104c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104c68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104c6d:	c9                   	leave  
80104c6e:	c3                   	ret    
80104c6f:	90                   	nop

80104c70 <sys_write>:

int
sys_write(void)
{
80104c70:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c71:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104c73:	89 e5                	mov    %esp,%ebp
80104c75:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c78:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c7b:	e8 c0 fe ff ff       	call   80104b40 <argfd.constprop.0>
80104c80:	85 c0                	test   %eax,%eax
80104c82:	78 54                	js     80104cd8 <sys_write+0x68>
80104c84:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c87:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c8b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104c92:	e8 a9 fb ff ff       	call   80104840 <argint>
80104c97:	85 c0                	test   %eax,%eax
80104c99:	78 3d                	js     80104cd8 <sys_write+0x68>
80104c9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104c9e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104ca5:	89 44 24 08          	mov    %eax,0x8(%esp)
80104ca9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cac:	89 44 24 04          	mov    %eax,0x4(%esp)
80104cb0:	e8 cb fb ff ff       	call   80104880 <argptr>
80104cb5:	85 c0                	test   %eax,%eax
80104cb7:	78 1f                	js     80104cd8 <sys_write+0x68>
    return -1;
  return filewrite(f, p, n);
80104cb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104cbc:	89 44 24 08          	mov    %eax,0x8(%esp)
80104cc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104cc3:	89 44 24 04          	mov    %eax,0x4(%esp)
80104cc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104cca:	89 04 24             	mov    %eax,(%esp)
80104ccd:	e8 0e c3 ff ff       	call   80100fe0 <filewrite>
}
80104cd2:	c9                   	leave  
80104cd3:	c3                   	ret    
80104cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104cd8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104cdd:	c9                   	leave  
80104cde:	c3                   	ret    
80104cdf:	90                   	nop

80104ce0 <sys_close>:

int
sys_close(void)
{
80104ce0:	55                   	push   %ebp
80104ce1:	89 e5                	mov    %esp,%ebp
80104ce3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104ce6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104ce9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cec:	e8 4f fe ff ff       	call   80104b40 <argfd.constprop.0>
80104cf1:	85 c0                	test   %eax,%eax
80104cf3:	78 23                	js     80104d18 <sys_close+0x38>
    return -1;
  proc->ofile[fd] = 0;
80104cf5:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104cf8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104cfe:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104d05:	00 
  fileclose(f);
80104d06:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104d09:	89 04 24             	mov    %eax,(%esp)
80104d0c:	e8 1f c1 ff ff       	call   80100e30 <fileclose>
  return 0;
80104d11:	31 c0                	xor    %eax,%eax
}
80104d13:	c9                   	leave  
80104d14:	c3                   	ret    
80104d15:	8d 76 00             	lea    0x0(%esi),%esi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104d18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  proc->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104d1d:	c9                   	leave  
80104d1e:	c3                   	ret    
80104d1f:	90                   	nop

80104d20 <sys_fstat>:

int
sys_fstat(void)
{
80104d20:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104d21:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104d23:	89 e5                	mov    %esp,%ebp
80104d25:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104d28:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104d2b:	e8 10 fe ff ff       	call   80104b40 <argfd.constprop.0>
80104d30:	85 c0                	test   %eax,%eax
80104d32:	78 34                	js     80104d68 <sys_fstat+0x48>
80104d34:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d37:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
80104d3e:	00 
80104d3f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104d43:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104d4a:	e8 31 fb ff ff       	call   80104880 <argptr>
80104d4f:	85 c0                	test   %eax,%eax
80104d51:	78 15                	js     80104d68 <sys_fstat+0x48>
    return -1;
  return filestat(f, st);
80104d53:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104d56:	89 44 24 04          	mov    %eax,0x4(%esp)
80104d5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104d5d:	89 04 24             	mov    %eax,(%esp)
80104d60:	e8 8b c1 ff ff       	call   80100ef0 <filestat>
}
80104d65:	c9                   	leave  
80104d66:	c3                   	ret    
80104d67:	90                   	nop
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104d68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104d6d:	c9                   	leave  
80104d6e:	c3                   	ret    
80104d6f:	90                   	nop

80104d70 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104d70:	55                   	push   %ebp
80104d71:	89 e5                	mov    %esp,%ebp
80104d73:	57                   	push   %edi
80104d74:	56                   	push   %esi
80104d75:	53                   	push   %ebx
80104d76:	83 ec 3c             	sub    $0x3c,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d79:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104d7c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104d80:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104d87:	e8 44 fb ff ff       	call   801048d0 <argstr>
80104d8c:	85 c0                	test   %eax,%eax
80104d8e:	0f 88 e6 00 00 00    	js     80104e7a <sys_link+0x10a>
80104d94:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104d97:	89 44 24 04          	mov    %eax,0x4(%esp)
80104d9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104da2:	e8 29 fb ff ff       	call   801048d0 <argstr>
80104da7:	85 c0                	test   %eax,%eax
80104da9:	0f 88 cb 00 00 00    	js     80104e7a <sys_link+0x10a>
    return -1;

  begin_op();
80104daf:	e8 dc dd ff ff       	call   80102b90 <begin_op>
  if((ip = namei(old)) == 0){
80104db4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80104db7:	89 04 24             	mov    %eax,(%esp)
80104dba:	e8 31 d1 ff ff       	call   80101ef0 <namei>
80104dbf:	85 c0                	test   %eax,%eax
80104dc1:	89 c3                	mov    %eax,%ebx
80104dc3:	0f 84 ac 00 00 00    	je     80104e75 <sys_link+0x105>
    end_op();
    return -1;
  }

  ilock(ip);
80104dc9:	89 04 24             	mov    %eax,(%esp)
80104dcc:	e8 ef c8 ff ff       	call   801016c0 <ilock>
  if(ip->type == T_DIR){
80104dd1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104dd6:	0f 84 91 00 00 00    	je     80104e6d <sys_link+0xfd>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104ddc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104de1:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104de4:	89 1c 24             	mov    %ebx,(%esp)
80104de7:	e8 14 c8 ff ff       	call   80101600 <iupdate>
  iunlock(ip);
80104dec:	89 1c 24             	mov    %ebx,(%esp)
80104def:	e8 9c c9 ff ff       	call   80101790 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104df4:	8b 45 d0             	mov    -0x30(%ebp),%eax
80104df7:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104dfb:	89 04 24             	mov    %eax,(%esp)
80104dfe:	e8 0d d1 ff ff       	call   80101f10 <nameiparent>
80104e03:	85 c0                	test   %eax,%eax
80104e05:	89 c6                	mov    %eax,%esi
80104e07:	74 4f                	je     80104e58 <sys_link+0xe8>
    goto bad;
  ilock(dp);
80104e09:	89 04 24             	mov    %eax,(%esp)
80104e0c:	e8 af c8 ff ff       	call   801016c0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104e11:	8b 03                	mov    (%ebx),%eax
80104e13:	39 06                	cmp    %eax,(%esi)
80104e15:	75 39                	jne    80104e50 <sys_link+0xe0>
80104e17:	8b 43 04             	mov    0x4(%ebx),%eax
80104e1a:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104e1e:	89 34 24             	mov    %esi,(%esp)
80104e21:	89 44 24 08          	mov    %eax,0x8(%esp)
80104e25:	e8 e6 cf ff ff       	call   80101e10 <dirlink>
80104e2a:	85 c0                	test   %eax,%eax
80104e2c:	78 22                	js     80104e50 <sys_link+0xe0>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104e2e:	89 34 24             	mov    %esi,(%esp)
80104e31:	e8 ca ca ff ff       	call   80101900 <iunlockput>
  iput(ip);
80104e36:	89 1c 24             	mov    %ebx,(%esp)
80104e39:	e8 92 c9 ff ff       	call   801017d0 <iput>

  end_op();
80104e3e:	e8 bd dd ff ff       	call   80102c00 <end_op>
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104e43:	83 c4 3c             	add    $0x3c,%esp
  iunlockput(dp);
  iput(ip);

  end_op();

  return 0;
80104e46:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104e48:	5b                   	pop    %ebx
80104e49:	5e                   	pop    %esi
80104e4a:	5f                   	pop    %edi
80104e4b:	5d                   	pop    %ebp
80104e4c:	c3                   	ret    
80104e4d:	8d 76 00             	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104e50:	89 34 24             	mov    %esi,(%esp)
80104e53:	e8 a8 ca ff ff       	call   80101900 <iunlockput>
  end_op();

  return 0;

bad:
  ilock(ip);
80104e58:	89 1c 24             	mov    %ebx,(%esp)
80104e5b:	e8 60 c8 ff ff       	call   801016c0 <ilock>
  ip->nlink--;
80104e60:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104e65:	89 1c 24             	mov    %ebx,(%esp)
80104e68:	e8 93 c7 ff ff       	call   80101600 <iupdate>
  iunlockput(ip);
80104e6d:	89 1c 24             	mov    %ebx,(%esp)
80104e70:	e8 8b ca ff ff       	call   80101900 <iunlockput>
  end_op();
80104e75:	e8 86 dd ff ff       	call   80102c00 <end_op>
  return -1;
}
80104e7a:	83 c4 3c             	add    $0x3c,%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104e7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e82:	5b                   	pop    %ebx
80104e83:	5e                   	pop    %esi
80104e84:	5f                   	pop    %edi
80104e85:	5d                   	pop    %ebp
80104e86:	c3                   	ret    
80104e87:	89 f6                	mov    %esi,%esi
80104e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e90 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104e90:	55                   	push   %ebp
80104e91:	89 e5                	mov    %esp,%ebp
80104e93:	57                   	push   %edi
80104e94:	56                   	push   %esi
80104e95:	53                   	push   %ebx
80104e96:	83 ec 5c             	sub    $0x5c,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104e99:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104e9c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104ea0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104ea7:	e8 24 fa ff ff       	call   801048d0 <argstr>
80104eac:	85 c0                	test   %eax,%eax
80104eae:	0f 88 76 01 00 00    	js     8010502a <sys_unlink+0x19a>
    return -1;

  begin_op();
80104eb4:	e8 d7 dc ff ff       	call   80102b90 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104eb9:	8b 45 c0             	mov    -0x40(%ebp),%eax
80104ebc:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104ebf:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104ec3:	89 04 24             	mov    %eax,(%esp)
80104ec6:	e8 45 d0 ff ff       	call   80101f10 <nameiparent>
80104ecb:	85 c0                	test   %eax,%eax
80104ecd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104ed0:	0f 84 4f 01 00 00    	je     80105025 <sys_unlink+0x195>
    end_op();
    return -1;
  }

  ilock(dp);
80104ed6:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104ed9:	89 34 24             	mov    %esi,(%esp)
80104edc:	e8 df c7 ff ff       	call   801016c0 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104ee1:	c7 44 24 04 a0 77 10 	movl   $0x801077a0,0x4(%esp)
80104ee8:	80 
80104ee9:	89 1c 24             	mov    %ebx,(%esp)
80104eec:	e8 8f cc ff ff       	call   80101b80 <namecmp>
80104ef1:	85 c0                	test   %eax,%eax
80104ef3:	0f 84 21 01 00 00    	je     8010501a <sys_unlink+0x18a>
80104ef9:	c7 44 24 04 9f 77 10 	movl   $0x8010779f,0x4(%esp)
80104f00:	80 
80104f01:	89 1c 24             	mov    %ebx,(%esp)
80104f04:	e8 77 cc ff ff       	call   80101b80 <namecmp>
80104f09:	85 c0                	test   %eax,%eax
80104f0b:	0f 84 09 01 00 00    	je     8010501a <sys_unlink+0x18a>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80104f11:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104f14:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104f18:	89 44 24 08          	mov    %eax,0x8(%esp)
80104f1c:	89 34 24             	mov    %esi,(%esp)
80104f1f:	e8 8c cc ff ff       	call   80101bb0 <dirlookup>
80104f24:	85 c0                	test   %eax,%eax
80104f26:	89 c3                	mov    %eax,%ebx
80104f28:	0f 84 ec 00 00 00    	je     8010501a <sys_unlink+0x18a>
    goto bad;
  ilock(ip);
80104f2e:	89 04 24             	mov    %eax,(%esp)
80104f31:	e8 8a c7 ff ff       	call   801016c0 <ilock>

  if(ip->nlink < 1)
80104f36:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104f3b:	0f 8e 24 01 00 00    	jle    80105065 <sys_unlink+0x1d5>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80104f41:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f46:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104f49:	74 7d                	je     80104fc8 <sys_unlink+0x138>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
80104f4b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80104f52:	00 
80104f53:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104f5a:	00 
80104f5b:	89 34 24             	mov    %esi,(%esp)
80104f5e:	e8 ed f5 ff ff       	call   80104550 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104f63:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80104f66:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80104f6d:	00 
80104f6e:	89 74 24 04          	mov    %esi,0x4(%esp)
80104f72:	89 44 24 08          	mov    %eax,0x8(%esp)
80104f76:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104f79:	89 04 24             	mov    %eax,(%esp)
80104f7c:	e8 cf ca ff ff       	call   80101a50 <writei>
80104f81:	83 f8 10             	cmp    $0x10,%eax
80104f84:	0f 85 cf 00 00 00    	jne    80105059 <sys_unlink+0x1c9>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80104f8a:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f8f:	0f 84 a3 00 00 00    	je     80105038 <sys_unlink+0x1a8>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
80104f95:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104f98:	89 04 24             	mov    %eax,(%esp)
80104f9b:	e8 60 c9 ff ff       	call   80101900 <iunlockput>

  ip->nlink--;
80104fa0:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104fa5:	89 1c 24             	mov    %ebx,(%esp)
80104fa8:	e8 53 c6 ff ff       	call   80101600 <iupdate>
  iunlockput(ip);
80104fad:	89 1c 24             	mov    %ebx,(%esp)
80104fb0:	e8 4b c9 ff ff       	call   80101900 <iunlockput>

  end_op();
80104fb5:	e8 46 dc ff ff       	call   80102c00 <end_op>

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104fba:	83 c4 5c             	add    $0x5c,%esp
  iupdate(ip);
  iunlockput(ip);

  end_op();

  return 0;
80104fbd:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104fbf:	5b                   	pop    %ebx
80104fc0:	5e                   	pop    %esi
80104fc1:	5f                   	pop    %edi
80104fc2:	5d                   	pop    %ebp
80104fc3:	c3                   	ret    
80104fc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104fc8:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104fcc:	0f 86 79 ff ff ff    	jbe    80104f4b <sys_unlink+0xbb>
80104fd2:	bf 20 00 00 00       	mov    $0x20,%edi
80104fd7:	eb 15                	jmp    80104fee <sys_unlink+0x15e>
80104fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104fe0:	8d 57 10             	lea    0x10(%edi),%edx
80104fe3:	3b 53 58             	cmp    0x58(%ebx),%edx
80104fe6:	0f 83 5f ff ff ff    	jae    80104f4b <sys_unlink+0xbb>
80104fec:	89 d7                	mov    %edx,%edi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104fee:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80104ff5:	00 
80104ff6:	89 7c 24 08          	mov    %edi,0x8(%esp)
80104ffa:	89 74 24 04          	mov    %esi,0x4(%esp)
80104ffe:	89 1c 24             	mov    %ebx,(%esp)
80105001:	e8 4a c9 ff ff       	call   80101950 <readi>
80105006:	83 f8 10             	cmp    $0x10,%eax
80105009:	75 42                	jne    8010504d <sys_unlink+0x1bd>
      panic("isdirempty: readi");
    if(de.inum != 0)
8010500b:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105010:	74 ce                	je     80104fe0 <sys_unlink+0x150>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80105012:	89 1c 24             	mov    %ebx,(%esp)
80105015:	e8 e6 c8 ff ff       	call   80101900 <iunlockput>
  end_op();

  return 0;

bad:
  iunlockput(dp);
8010501a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
8010501d:	89 04 24             	mov    %eax,(%esp)
80105020:	e8 db c8 ff ff       	call   80101900 <iunlockput>
  end_op();
80105025:	e8 d6 db ff ff       	call   80102c00 <end_op>
  return -1;
}
8010502a:	83 c4 5c             	add    $0x5c,%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
8010502d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105032:	5b                   	pop    %ebx
80105033:	5e                   	pop    %esi
80105034:	5f                   	pop    %edi
80105035:	5d                   	pop    %ebp
80105036:	c3                   	ret    
80105037:	90                   	nop

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80105038:	8b 45 b4             	mov    -0x4c(%ebp),%eax
8010503b:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80105040:	89 04 24             	mov    %eax,(%esp)
80105043:	e8 b8 c5 ff ff       	call   80101600 <iupdate>
80105048:	e9 48 ff ff ff       	jmp    80104f95 <sys_unlink+0x105>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
8010504d:	c7 04 24 c4 77 10 80 	movl   $0x801077c4,(%esp)
80105054:	e8 07 b3 ff ff       	call   80100360 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80105059:	c7 04 24 d6 77 10 80 	movl   $0x801077d6,(%esp)
80105060:	e8 fb b2 ff ff       	call   80100360 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80105065:	c7 04 24 b2 77 10 80 	movl   $0x801077b2,(%esp)
8010506c:	e8 ef b2 ff ff       	call   80100360 <panic>
80105071:	eb 0d                	jmp    80105080 <sys_open>
80105073:	90                   	nop
80105074:	90                   	nop
80105075:	90                   	nop
80105076:	90                   	nop
80105077:	90                   	nop
80105078:	90                   	nop
80105079:	90                   	nop
8010507a:	90                   	nop
8010507b:	90                   	nop
8010507c:	90                   	nop
8010507d:	90                   	nop
8010507e:	90                   	nop
8010507f:	90                   	nop

80105080 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80105080:	55                   	push   %ebp
80105081:	89 e5                	mov    %esp,%ebp
80105083:	57                   	push   %edi
80105084:	56                   	push   %esi
80105085:	53                   	push   %ebx
80105086:	83 ec 2c             	sub    $0x2c,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105089:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010508c:	89 44 24 04          	mov    %eax,0x4(%esp)
80105090:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105097:	e8 34 f8 ff ff       	call   801048d0 <argstr>
8010509c:	85 c0                	test   %eax,%eax
8010509e:	0f 88 81 00 00 00    	js     80105125 <sys_open+0xa5>
801050a4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801050a7:	89 44 24 04          	mov    %eax,0x4(%esp)
801050ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801050b2:	e8 89 f7 ff ff       	call   80104840 <argint>
801050b7:	85 c0                	test   %eax,%eax
801050b9:	78 6a                	js     80105125 <sys_open+0xa5>
    return -1;

  begin_op();
801050bb:	e8 d0 da ff ff       	call   80102b90 <begin_op>

  if(omode & O_CREATE){
801050c0:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801050c4:	75 72                	jne    80105138 <sys_open+0xb8>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
801050c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801050c9:	89 04 24             	mov    %eax,(%esp)
801050cc:	e8 1f ce ff ff       	call   80101ef0 <namei>
801050d1:	85 c0                	test   %eax,%eax
801050d3:	89 c7                	mov    %eax,%edi
801050d5:	74 49                	je     80105120 <sys_open+0xa0>
      end_op();
      return -1;
    }
    ilock(ip);
801050d7:	89 04 24             	mov    %eax,(%esp)
801050da:	e8 e1 c5 ff ff       	call   801016c0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
801050df:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
801050e4:	0f 84 ae 00 00 00    	je     80105198 <sys_open+0x118>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801050ea:	e8 81 bc ff ff       	call   80100d70 <filealloc>
801050ef:	85 c0                	test   %eax,%eax
801050f1:	89 c6                	mov    %eax,%esi
801050f3:	74 23                	je     80105118 <sys_open+0x98>
801050f5:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801050fc:	31 db                	xor    %ebx,%ebx
801050fe:	66 90                	xchg   %ax,%ax
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80105100:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
80105104:	85 c0                	test   %eax,%eax
80105106:	74 50                	je     80105158 <sys_open+0xd8>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105108:	83 c3 01             	add    $0x1,%ebx
8010510b:	83 fb 10             	cmp    $0x10,%ebx
8010510e:	75 f0                	jne    80105100 <sys_open+0x80>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80105110:	89 34 24             	mov    %esi,(%esp)
80105113:	e8 18 bd ff ff       	call   80100e30 <fileclose>
    iunlockput(ip);
80105118:	89 3c 24             	mov    %edi,(%esp)
8010511b:	e8 e0 c7 ff ff       	call   80101900 <iunlockput>
    end_op();
80105120:	e8 db da ff ff       	call   80102c00 <end_op>
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80105125:	83 c4 2c             	add    $0x2c,%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
80105128:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
8010512d:	5b                   	pop    %ebx
8010512e:	5e                   	pop    %esi
8010512f:	5f                   	pop    %edi
80105130:	5d                   	pop    %ebp
80105131:	c3                   	ret    
80105132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105138:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010513b:	31 c9                	xor    %ecx,%ecx
8010513d:	ba 02 00 00 00       	mov    $0x2,%edx
80105142:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105149:	e8 72 f8 ff ff       	call   801049c0 <create>
    if(ip == 0){
8010514e:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105150:	89 c7                	mov    %eax,%edi
    if(ip == 0){
80105152:	75 96                	jne    801050ea <sys_open+0x6a>
80105154:	eb ca                	jmp    80105120 <sys_open+0xa0>
80105156:	66 90                	xchg   %ax,%ax
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105158:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
8010515c:	89 3c 24             	mov    %edi,(%esp)
8010515f:	e8 2c c6 ff ff       	call   80101790 <iunlock>
  end_op();
80105164:	e8 97 da ff ff       	call   80102c00 <end_op>

  f->type = FD_INODE;
80105169:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
8010516f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
80105172:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
80105175:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
8010517c:	89 d0                	mov    %edx,%eax
8010517e:	83 e0 01             	and    $0x1,%eax
80105181:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105184:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105187:	88 46 08             	mov    %al,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
8010518a:	89 d8                	mov    %ebx,%eax

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010518c:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
}
80105190:	83 c4 2c             	add    $0x2c,%esp
80105193:	5b                   	pop    %ebx
80105194:	5e                   	pop    %esi
80105195:	5f                   	pop    %edi
80105196:	5d                   	pop    %ebp
80105197:	c3                   	ret    
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105198:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010519b:	85 d2                	test   %edx,%edx
8010519d:	0f 84 47 ff ff ff    	je     801050ea <sys_open+0x6a>
801051a3:	e9 70 ff ff ff       	jmp    80105118 <sys_open+0x98>
801051a8:	90                   	nop
801051a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801051b0 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
801051b0:	55                   	push   %ebp
801051b1:	89 e5                	mov    %esp,%ebp
801051b3:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  begin_op();
801051b6:	e8 d5 d9 ff ff       	call   80102b90 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801051bb:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051be:	89 44 24 04          	mov    %eax,0x4(%esp)
801051c2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801051c9:	e8 02 f7 ff ff       	call   801048d0 <argstr>
801051ce:	85 c0                	test   %eax,%eax
801051d0:	78 2e                	js     80105200 <sys_mkdir+0x50>
801051d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051d5:	31 c9                	xor    %ecx,%ecx
801051d7:	ba 01 00 00 00       	mov    $0x1,%edx
801051dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801051e3:	e8 d8 f7 ff ff       	call   801049c0 <create>
801051e8:	85 c0                	test   %eax,%eax
801051ea:	74 14                	je     80105200 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801051ec:	89 04 24             	mov    %eax,(%esp)
801051ef:	e8 0c c7 ff ff       	call   80101900 <iunlockput>
  end_op();
801051f4:	e8 07 da ff ff       	call   80102c00 <end_op>
  return 0;
801051f9:	31 c0                	xor    %eax,%eax
}
801051fb:	c9                   	leave  
801051fc:	c3                   	ret    
801051fd:	8d 76 00             	lea    0x0(%esi),%esi
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105200:	e8 fb d9 ff ff       	call   80102c00 <end_op>
    return -1;
80105205:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010520a:	c9                   	leave  
8010520b:	c3                   	ret    
8010520c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105210 <sys_mknod>:

int
sys_mknod(void)
{
80105210:	55                   	push   %ebp
80105211:	89 e5                	mov    %esp,%ebp
80105213:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105216:	e8 75 d9 ff ff       	call   80102b90 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010521b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010521e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105222:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105229:	e8 a2 f6 ff ff       	call   801048d0 <argstr>
8010522e:	85 c0                	test   %eax,%eax
80105230:	78 5e                	js     80105290 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105232:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105235:	89 44 24 04          	mov    %eax,0x4(%esp)
80105239:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105240:	e8 fb f5 ff ff       	call   80104840 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
80105245:	85 c0                	test   %eax,%eax
80105247:	78 47                	js     80105290 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105249:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010524c:	89 44 24 04          	mov    %eax,0x4(%esp)
80105250:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80105257:	e8 e4 f5 ff ff       	call   80104840 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
8010525c:	85 c0                	test   %eax,%eax
8010525e:	78 30                	js     80105290 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
80105260:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105264:	ba 03 00 00 00       	mov    $0x3,%edx
     (ip = create(path, T_DEV, major, minor)) == 0){
80105269:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
8010526d:	89 04 24             	mov    %eax,(%esp)
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105270:	8b 45 ec             	mov    -0x14(%ebp),%eax
80105273:	e8 48 f7 ff ff       	call   801049c0 <create>
80105278:	85 c0                	test   %eax,%eax
8010527a:	74 14                	je     80105290 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010527c:	89 04 24             	mov    %eax,(%esp)
8010527f:	e8 7c c6 ff ff       	call   80101900 <iunlockput>
  end_op();
80105284:	e8 77 d9 ff ff       	call   80102c00 <end_op>
  return 0;
80105289:	31 c0                	xor    %eax,%eax
}
8010528b:	c9                   	leave  
8010528c:	c3                   	ret    
8010528d:	8d 76 00             	lea    0x0(%esi),%esi
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105290:	e8 6b d9 ff ff       	call   80102c00 <end_op>
    return -1;
80105295:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010529a:	c9                   	leave  
8010529b:	c3                   	ret    
8010529c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801052a0 <sys_chdir>:

int
sys_chdir(void)
{
801052a0:	55                   	push   %ebp
801052a1:	89 e5                	mov    %esp,%ebp
801052a3:	53                   	push   %ebx
801052a4:	83 ec 24             	sub    $0x24,%esp
  char *path;
  struct inode *ip;

  begin_op();
801052a7:	e8 e4 d8 ff ff       	call   80102b90 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801052ac:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052af:	89 44 24 04          	mov    %eax,0x4(%esp)
801052b3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801052ba:	e8 11 f6 ff ff       	call   801048d0 <argstr>
801052bf:	85 c0                	test   %eax,%eax
801052c1:	78 5a                	js     8010531d <sys_chdir+0x7d>
801052c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801052c6:	89 04 24             	mov    %eax,(%esp)
801052c9:	e8 22 cc ff ff       	call   80101ef0 <namei>
801052ce:	85 c0                	test   %eax,%eax
801052d0:	89 c3                	mov    %eax,%ebx
801052d2:	74 49                	je     8010531d <sys_chdir+0x7d>
    end_op();
    return -1;
  }
  ilock(ip);
801052d4:	89 04 24             	mov    %eax,(%esp)
801052d7:	e8 e4 c3 ff ff       	call   801016c0 <ilock>
  if(ip->type != T_DIR){
801052dc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
    iunlockput(ip);
801052e1:	89 1c 24             	mov    %ebx,(%esp)
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
801052e4:	75 32                	jne    80105318 <sys_chdir+0x78>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801052e6:	e8 a5 c4 ff ff       	call   80101790 <iunlock>
  iput(proc->cwd);
801052eb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801052f1:	8b 40 68             	mov    0x68(%eax),%eax
801052f4:	89 04 24             	mov    %eax,(%esp)
801052f7:	e8 d4 c4 ff ff       	call   801017d0 <iput>
  end_op();
801052fc:	e8 ff d8 ff ff       	call   80102c00 <end_op>
  proc->cwd = ip;
80105301:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105307:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
}
8010530a:	83 c4 24             	add    $0x24,%esp
  }
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
  return 0;
8010530d:	31 c0                	xor    %eax,%eax
}
8010530f:	5b                   	pop    %ebx
80105310:	5d                   	pop    %ebp
80105311:	c3                   	ret    
80105312:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
80105318:	e8 e3 c5 ff ff       	call   80101900 <iunlockput>
    end_op();
8010531d:	e8 de d8 ff ff       	call   80102c00 <end_op>
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
  return 0;
}
80105322:	83 c4 24             	add    $0x24,%esp
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
    end_op();
    return -1;
80105325:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
  return 0;
}
8010532a:	5b                   	pop    %ebx
8010532b:	5d                   	pop    %ebp
8010532c:	c3                   	ret    
8010532d:	8d 76 00             	lea    0x0(%esi),%esi

80105330 <sys_exec>:

int
sys_exec(void)
{
80105330:	55                   	push   %ebp
80105331:	89 e5                	mov    %esp,%ebp
80105333:	57                   	push   %edi
80105334:	56                   	push   %esi
80105335:	53                   	push   %ebx
80105336:	81 ec ac 00 00 00    	sub    $0xac,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
8010533c:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
80105342:	89 44 24 04          	mov    %eax,0x4(%esp)
80105346:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010534d:	e8 7e f5 ff ff       	call   801048d0 <argstr>
80105352:	85 c0                	test   %eax,%eax
80105354:	0f 88 84 00 00 00    	js     801053de <sys_exec+0xae>
8010535a:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105360:	89 44 24 04          	mov    %eax,0x4(%esp)
80105364:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010536b:	e8 d0 f4 ff ff       	call   80104840 <argint>
80105370:	85 c0                	test   %eax,%eax
80105372:	78 6a                	js     801053de <sys_exec+0xae>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105374:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  for(i=0;; i++){
8010537a:	31 db                	xor    %ebx,%ebx
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010537c:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80105383:	00 
80105384:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
8010538a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105391:	00 
80105392:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105398:	89 04 24             	mov    %eax,(%esp)
8010539b:	e8 b0 f1 ff ff       	call   80104550 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801053a0:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801053a6:	89 7c 24 04          	mov    %edi,0x4(%esp)
801053aa:	8d 04 98             	lea    (%eax,%ebx,4),%eax
801053ad:	89 04 24             	mov    %eax,(%esp)
801053b0:	e8 0b f4 ff ff       	call   801047c0 <fetchint>
801053b5:	85 c0                	test   %eax,%eax
801053b7:	78 25                	js     801053de <sys_exec+0xae>
      return -1;
    if(uarg == 0){
801053b9:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801053bf:	85 c0                	test   %eax,%eax
801053c1:	74 2d                	je     801053f0 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801053c3:	89 74 24 04          	mov    %esi,0x4(%esp)
801053c7:	89 04 24             	mov    %eax,(%esp)
801053ca:	e8 21 f4 ff ff       	call   801047f0 <fetchstr>
801053cf:	85 c0                	test   %eax,%eax
801053d1:	78 0b                	js     801053de <sys_exec+0xae>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801053d3:	83 c3 01             	add    $0x1,%ebx
801053d6:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
801053d9:	83 fb 20             	cmp    $0x20,%ebx
801053dc:	75 c2                	jne    801053a0 <sys_exec+0x70>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801053de:	81 c4 ac 00 00 00    	add    $0xac,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
801053e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801053e9:	5b                   	pop    %ebx
801053ea:	5e                   	pop    %esi
801053eb:	5f                   	pop    %edi
801053ec:	5d                   	pop    %ebp
801053ed:	c3                   	ret    
801053ee:	66 90                	xchg   %ax,%ax
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801053f0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801053f6:	89 44 24 04          	mov    %eax,0x4(%esp)
801053fa:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105400:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105407:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
8010540b:	89 04 24             	mov    %eax,(%esp)
8010540e:	e8 9d b5 ff ff       	call   801009b0 <exec>
}
80105413:	81 c4 ac 00 00 00    	add    $0xac,%esp
80105419:	5b                   	pop    %ebx
8010541a:	5e                   	pop    %esi
8010541b:	5f                   	pop    %edi
8010541c:	5d                   	pop    %ebp
8010541d:	c3                   	ret    
8010541e:	66 90                	xchg   %ax,%ax

80105420 <sys_pipe>:

int
sys_pipe(void)
{
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	57                   	push   %edi
80105424:	56                   	push   %esi
80105425:	53                   	push   %ebx
80105426:	83 ec 2c             	sub    $0x2c,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105429:	8d 45 dc             	lea    -0x24(%ebp),%eax
8010542c:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
80105433:	00 
80105434:	89 44 24 04          	mov    %eax,0x4(%esp)
80105438:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010543f:	e8 3c f4 ff ff       	call   80104880 <argptr>
80105444:	85 c0                	test   %eax,%eax
80105446:	78 7a                	js     801054c2 <sys_pipe+0xa2>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105448:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010544b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010544f:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105452:	89 04 24             	mov    %eax,(%esp)
80105455:	e8 76 de ff ff       	call   801032d0 <pipealloc>
8010545a:	85 c0                	test   %eax,%eax
8010545c:	78 64                	js     801054c2 <sys_pipe+0xa2>
8010545e:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105465:	31 c0                	xor    %eax,%eax
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105467:	8b 5d e0             	mov    -0x20(%ebp),%ebx
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
8010546a:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
8010546e:	85 d2                	test   %edx,%edx
80105470:	74 16                	je     80105488 <sys_pipe+0x68>
80105472:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105478:	83 c0 01             	add    $0x1,%eax
8010547b:	83 f8 10             	cmp    $0x10,%eax
8010547e:	74 2f                	je     801054af <sys_pipe+0x8f>
    if(proc->ofile[fd] == 0){
80105480:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
80105484:	85 d2                	test   %edx,%edx
80105486:	75 f0                	jne    80105478 <sys_pipe+0x58>
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105488:	8b 7d e4             	mov    -0x1c(%ebp),%edi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
8010548b:	8d 70 08             	lea    0x8(%eax),%esi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
8010548e:	31 d2                	xor    %edx,%edx
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105490:	89 5c b1 08          	mov    %ebx,0x8(%ecx,%esi,4)
80105494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80105498:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
8010549d:	74 31                	je     801054d0 <sys_pipe+0xb0>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
8010549f:	83 c2 01             	add    $0x1,%edx
801054a2:	83 fa 10             	cmp    $0x10,%edx
801054a5:	75 f1                	jne    80105498 <sys_pipe+0x78>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
801054a7:	c7 44 b1 08 00 00 00 	movl   $0x0,0x8(%ecx,%esi,4)
801054ae:	00 
    fileclose(rf);
801054af:	89 1c 24             	mov    %ebx,(%esp)
801054b2:	e8 79 b9 ff ff       	call   80100e30 <fileclose>
    fileclose(wf);
801054b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801054ba:	89 04 24             	mov    %eax,(%esp)
801054bd:	e8 6e b9 ff ff       	call   80100e30 <fileclose>
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
801054c2:	83 c4 2c             	add    $0x2c,%esp
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
801054c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
801054ca:	5b                   	pop    %ebx
801054cb:	5e                   	pop    %esi
801054cc:	5f                   	pop    %edi
801054cd:	5d                   	pop    %ebp
801054ce:	c3                   	ret    
801054cf:	90                   	nop
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801054d0:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801054d4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801054d7:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
801054d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054dc:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
}
801054df:	83 c4 2c             	add    $0x2c,%esp
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
801054e2:	31 c0                	xor    %eax,%eax
}
801054e4:	5b                   	pop    %ebx
801054e5:	5e                   	pop    %esi
801054e6:	5f                   	pop    %edi
801054e7:	5d                   	pop    %ebp
801054e8:	c3                   	ret    
801054e9:	66 90                	xchg   %ax,%ax
801054eb:	66 90                	xchg   %ax,%ax
801054ed:	66 90                	xchg   %ax,%ax
801054ef:	90                   	nop

801054f0 <sys_fork>:
#include "proc.h"
#include "stdint.h" 	 	
#define static uint8_t seed=7;
int
sys_fork(void)
{
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
  return fork();
}
801054f3:	5d                   	pop    %ebp
#include "stdint.h" 	 	
#define static uint8_t seed=7;
int
sys_fork(void)
{
  return fork();
801054f4:	e9 a7 e4 ff ff       	jmp    801039a0 <fork>
801054f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105500 <sys_exit>:
}

int
sys_exit(void)
{
80105500:	55                   	push   %ebp
80105501:	89 e5                	mov    %esp,%ebp
80105503:	83 ec 08             	sub    $0x8,%esp
  exit();
80105506:	e8 45 e8 ff ff       	call   80103d50 <exit>
  return 0;  // not reached
}
8010550b:	31 c0                	xor    %eax,%eax
8010550d:	c9                   	leave  
8010550e:	c3                   	ret    
8010550f:	90                   	nop

80105510 <sys_wait>:

int
sys_wait(void)
{
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105513:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105514:	e9 77 ea ff ff       	jmp    80103f90 <wait>
80105519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105520 <sys_kill>:
}

int
sys_kill(void)
{
80105520:	55                   	push   %ebp
80105521:	89 e5                	mov    %esp,%ebp
80105523:	83 ec 28             	sub    $0x28,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105526:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105529:	89 44 24 04          	mov    %eax,0x4(%esp)
8010552d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105534:	e8 07 f3 ff ff       	call   80104840 <argint>
80105539:	85 c0                	test   %eax,%eax
8010553b:	78 13                	js     80105550 <sys_kill+0x30>
    return -1;
  return kill(pid);
8010553d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105540:	89 04 24             	mov    %eax,(%esp)
80105543:	e8 a8 eb ff ff       	call   801040f0 <kill>
}
80105548:	c9                   	leave  
80105549:	c3                   	ret    
8010554a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105550:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105555:	c9                   	leave  
80105556:	c3                   	ret    
80105557:	89 f6                	mov    %esi,%esi
80105559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105560 <sys_getpid>:

int
sys_getpid(void)
{
  return proc->pid;
80105560:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return kill(pid);
}

int
sys_getpid(void)
{
80105566:	55                   	push   %ebp
80105567:	89 e5                	mov    %esp,%ebp
  return proc->pid;
}
80105569:	5d                   	pop    %ebp
}

int
sys_getpid(void)
{
  return proc->pid;
8010556a:	8b 40 10             	mov    0x10(%eax),%eax
}
8010556d:	c3                   	ret    
8010556e:	66 90                	xchg   %ax,%ax

80105570 <sys_sbrk>:

int
sys_sbrk(void)
{
80105570:	55                   	push   %ebp
80105571:	89 e5                	mov    %esp,%ebp
80105573:	53                   	push   %ebx
80105574:	83 ec 24             	sub    $0x24,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105577:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010557a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010557e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105585:	e8 b6 f2 ff ff       	call   80104840 <argint>
8010558a:	85 c0                	test   %eax,%eax
8010558c:	78 22                	js     801055b0 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
8010558e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
80105594:	8b 55 f4             	mov    -0xc(%ebp),%edx
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
80105597:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105599:	89 14 24             	mov    %edx,(%esp)
8010559c:	e8 2f e3 ff ff       	call   801038d0 <growproc>
801055a1:	85 c0                	test   %eax,%eax
801055a3:	78 0b                	js     801055b0 <sys_sbrk+0x40>
    return -1;
  return addr;
801055a5:	89 d8                	mov    %ebx,%eax
}
801055a7:	83 c4 24             	add    $0x24,%esp
801055aa:	5b                   	pop    %ebx
801055ab:	5d                   	pop    %ebp
801055ac:	c3                   	ret    
801055ad:	8d 76 00             	lea    0x0(%esi),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
801055b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055b5:	eb f0                	jmp    801055a7 <sys_sbrk+0x37>
801055b7:	89 f6                	mov    %esi,%esi
801055b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055c0 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
801055c0:	55                   	push   %ebp
801055c1:	89 e5                	mov    %esp,%ebp
801055c3:	53                   	push   %ebx
801055c4:	83 ec 24             	sub    $0x24,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801055c7:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055ca:	89 44 24 04          	mov    %eax,0x4(%esp)
801055ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801055d5:	e8 66 f2 ff ff       	call   80104840 <argint>
801055da:	85 c0                	test   %eax,%eax
801055dc:	78 7e                	js     8010565c <sys_sleep+0x9c>
    return -1;
  acquire(&tickslock);
801055de:	c7 04 24 e0 54 11 80 	movl   $0x801154e0,(%esp)
801055e5:	e8 e6 ed ff ff       	call   801043d0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801055ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
801055ed:	8b 1d 20 5d 11 80    	mov    0x80115d20,%ebx
  while(ticks - ticks0 < n){
801055f3:	85 d2                	test   %edx,%edx
801055f5:	75 29                	jne    80105620 <sys_sleep+0x60>
801055f7:	eb 4f                	jmp    80105648 <sys_sleep+0x88>
801055f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){

      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105600:	c7 44 24 04 e0 54 11 	movl   $0x801154e0,0x4(%esp)
80105607:	80 
80105608:	c7 04 24 20 5d 11 80 	movl   $0x80115d20,(%esp)
8010560f:	e8 bc e8 ff ff       	call   80103ed0 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105614:	a1 20 5d 11 80       	mov    0x80115d20,%eax
80105619:	29 d8                	sub    %ebx,%eax
8010561b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010561e:	73 28                	jae    80105648 <sys_sleep+0x88>
    if(proc->killed){
80105620:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105626:	8b 40 24             	mov    0x24(%eax),%eax
80105629:	85 c0                	test   %eax,%eax
8010562b:	74 d3                	je     80105600 <sys_sleep+0x40>

      release(&tickslock);
8010562d:	c7 04 24 e0 54 11 80 	movl   $0x801154e0,(%esp)
80105634:	e8 c7 ee ff ff       	call   80104500 <release>
      return -1;
80105639:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
8010563e:	83 c4 24             	add    $0x24,%esp
80105641:	5b                   	pop    %ebx
80105642:	5d                   	pop    %ebp
80105643:	c3                   	ret    
80105644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105648:	c7 04 24 e0 54 11 80 	movl   $0x801154e0,(%esp)
8010564f:	e8 ac ee ff ff       	call   80104500 <release>
  return 0;
}
80105654:	83 c4 24             	add    $0x24,%esp
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
80105657:	31 c0                	xor    %eax,%eax
}
80105659:	5b                   	pop    %ebx
8010565a:	5d                   	pop    %ebp
8010565b:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
8010565c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105661:	eb db                	jmp    8010563e <sys_sleep+0x7e>
80105663:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105670 <sys_random>:
}
//I am adding this syscall
static unsigned int sys_random(void)
{

	  seed ^= seed << 7;//7
80105670:	0f b6 15 10 a0 10 80 	movzbl 0x8010a010,%edx
  release(&tickslock);
  return 0;
}
//I am adding this syscall
static unsigned int sys_random(void)
{
80105677:	55                   	push   %ebp
80105678:	89 e5                	mov    %esp,%ebp

	  seed ^= seed << 7;//7
	  seed ^= seed >> 5;//5
	  seed ^= seed << 3;//3
	  return seed;
}
8010567a:	5d                   	pop    %ebp
}
//I am adding this syscall
static unsigned int sys_random(void)
{

	  seed ^= seed << 7;//7
8010567b:	89 d0                	mov    %edx,%eax
8010567d:	c1 e0 07             	shl    $0x7,%eax
80105680:	31 d0                	xor    %edx,%eax
	  seed ^= seed >> 5;//5
80105682:	89 c2                	mov    %eax,%edx
80105684:	c0 ea 05             	shr    $0x5,%dl
80105687:	31 c2                	xor    %eax,%edx
	  seed ^= seed << 3;//3
80105689:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
80105690:	31 d0                	xor    %edx,%eax
80105692:	a2 10 a0 10 80       	mov    %al,0x8010a010
	  return seed;
80105697:	0f b6 c0             	movzbl %al,%eax
}
8010569a:	c3                   	ret    
8010569b:	90                   	nop
8010569c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801056a0 <sys_chpr>:
//system call for changing priorty
int
sys_chpr (void)
{ 
801056a0:	55                   	push   %ebp
801056a1:	89 e5                	mov    %esp,%ebp
801056a3:	83 ec 28             	sub    $0x28,%esp
  int pr;
  int pid;
  if(argint(0, &pid) < 0)
801056a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056a9:	89 44 24 04          	mov    %eax,0x4(%esp)
801056ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801056b4:	e8 87 f1 ff ff       	call   80104840 <argint>
801056b9:	85 c0                	test   %eax,%eax
801056bb:	78 2b                	js     801056e8 <sys_chpr+0x48>
   return -1;
  if(argint(1, &pr) < 0)
801056bd:	8d 45 f0             	lea    -0x10(%ebp),%eax
801056c0:	89 44 24 04          	mov    %eax,0x4(%esp)
801056c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801056cb:	e8 70 f1 ff ff       	call   80104840 <argint>
801056d0:	85 c0                	test   %eax,%eax
801056d2:	78 14                	js     801056e8 <sys_chpr+0x48>
   return -1;
 
 return chpr(pid,pr);
801056d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801056d7:	89 44 24 04          	mov    %eax,0x4(%esp)
801056db:	8b 45 f4             	mov    -0xc(%ebp),%eax
801056de:	89 04 24             	mov    %eax,(%esp)
801056e1:	e8 6a e2 ff ff       	call   80103950 <chpr>
}
801056e6:	c9                   	leave  
801056e7:	c3                   	ret    
sys_chpr (void)
{ 
  int pr;
  int pid;
  if(argint(0, &pid) < 0)
   return -1;
801056e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(argint(1, &pr) < 0)
   return -1;
 
 return chpr(pid,pr);
}
801056ed:	c9                   	leave  
801056ee:	c3                   	ret    
801056ef:	90                   	nop

801056f0 <sys_cps>:
//I am adding the cps syscall
int 
sys_cps(void)
{ 	
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
	return cps();
}	
801056f3:	5d                   	pop    %ebp
}
//I am adding the cps syscall
int 
sys_cps(void)
{ 	
	return cps();
801056f4:	e9 c7 e3 ff ff       	jmp    80103ac0 <cps>
801056f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105700 <sys_uptime>:
}	
// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105700:	55                   	push   %ebp
80105701:	89 e5                	mov    %esp,%ebp
80105703:	53                   	push   %ebx
80105704:	83 ec 14             	sub    $0x14,%esp
  uint xticks;

  acquire(&tickslock);
80105707:	c7 04 24 e0 54 11 80 	movl   $0x801154e0,(%esp)
8010570e:	e8 bd ec ff ff       	call   801043d0 <acquire>
  xticks = ticks;
80105713:	8b 1d 20 5d 11 80    	mov    0x80115d20,%ebx
  release(&tickslock);
80105719:	c7 04 24 e0 54 11 80 	movl   $0x801154e0,(%esp)
80105720:	e8 db ed ff ff       	call   80104500 <release>
  return xticks;
}
80105725:	83 c4 14             	add    $0x14,%esp
80105728:	89 d8                	mov    %ebx,%eax
8010572a:	5b                   	pop    %ebx
8010572b:	5d                   	pop    %ebp
8010572c:	c3                   	ret    
8010572d:	66 90                	xchg   %ax,%ax
8010572f:	90                   	nop

80105730 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
80105730:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105731:	ba 43 00 00 00       	mov    $0x43,%edx
80105736:	89 e5                	mov    %esp,%ebp
80105738:	b8 34 00 00 00       	mov    $0x34,%eax
8010573d:	83 ec 18             	sub    $0x18,%esp
80105740:	ee                   	out    %al,(%dx)
80105741:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
80105746:	b2 40                	mov    $0x40,%dl
80105748:	ee                   	out    %al,(%dx)
80105749:	b8 2e 00 00 00       	mov    $0x2e,%eax
8010574e:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
8010574f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105756:	e8 a5 da ff ff       	call   80103200 <picenable>
}
8010575b:	c9                   	leave  
8010575c:	c3                   	ret    

8010575d <alltraps>:
8010575d:	1e                   	push   %ds
8010575e:	06                   	push   %es
8010575f:	0f a0                	push   %fs
80105761:	0f a8                	push   %gs
80105763:	60                   	pusha  
80105764:	66 b8 10 00          	mov    $0x10,%ax
80105768:	8e d8                	mov    %eax,%ds
8010576a:	8e c0                	mov    %eax,%es
8010576c:	66 b8 18 00          	mov    $0x18,%ax
80105770:	8e e0                	mov    %eax,%fs
80105772:	8e e8                	mov    %eax,%gs
80105774:	54                   	push   %esp
80105775:	e8 e6 00 00 00       	call   80105860 <trap>
8010577a:	83 c4 04             	add    $0x4,%esp

8010577d <trapret>:
8010577d:	61                   	popa   
8010577e:	0f a9                	pop    %gs
80105780:	0f a1                	pop    %fs
80105782:	07                   	pop    %es
80105783:	1f                   	pop    %ds
80105784:	83 c4 08             	add    $0x8,%esp
80105787:	cf                   	iret   
80105788:	66 90                	xchg   %ax,%ax
8010578a:	66 90                	xchg   %ax,%ax
8010578c:	66 90                	xchg   %ax,%ax
8010578e:	66 90                	xchg   %ax,%ax

80105790 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105790:	31 c0                	xor    %eax,%eax
80105792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105798:	8b 14 85 11 a0 10 80 	mov    -0x7fef5fef(,%eax,4),%edx
8010579f:	b9 08 00 00 00       	mov    $0x8,%ecx
801057a4:	66 89 0c c5 22 55 11 	mov    %cx,-0x7feeaade(,%eax,8)
801057ab:	80 
801057ac:	c6 04 c5 24 55 11 80 	movb   $0x0,-0x7feeaadc(,%eax,8)
801057b3:	00 
801057b4:	c6 04 c5 25 55 11 80 	movb   $0x8e,-0x7feeaadb(,%eax,8)
801057bb:	8e 
801057bc:	66 89 14 c5 20 55 11 	mov    %dx,-0x7feeaae0(,%eax,8)
801057c3:	80 
801057c4:	c1 ea 10             	shr    $0x10,%edx
801057c7:	66 89 14 c5 26 55 11 	mov    %dx,-0x7feeaada(,%eax,8)
801057ce:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801057cf:	83 c0 01             	add    $0x1,%eax
801057d2:	3d 00 01 00 00       	cmp    $0x100,%eax
801057d7:	75 bf                	jne    80105798 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801057d9:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801057da:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801057df:	89 e5                	mov    %esp,%ebp
801057e1:	83 ec 18             	sub    $0x18,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801057e4:	a1 11 a1 10 80       	mov    0x8010a111,%eax

  initlock(&tickslock, "time");
801057e9:	c7 44 24 04 e5 77 10 	movl   $0x801077e5,0x4(%esp)
801057f0:	80 
801057f1:	c7 04 24 e0 54 11 80 	movl   $0x801154e0,(%esp)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801057f8:	66 89 15 22 57 11 80 	mov    %dx,0x80115722
801057ff:	66 a3 20 57 11 80    	mov    %ax,0x80115720
80105805:	c1 e8 10             	shr    $0x10,%eax
80105808:	c6 05 24 57 11 80 00 	movb   $0x0,0x80115724
8010580f:	c6 05 25 57 11 80 ef 	movb   $0xef,0x80115725
80105816:	66 a3 26 57 11 80    	mov    %ax,0x80115726

  initlock(&tickslock, "time");
8010581c:	e8 2f eb ff ff       	call   80104350 <initlock>
}
80105821:	c9                   	leave  
80105822:	c3                   	ret    
80105823:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105830 <idtinit>:

void
idtinit(void)
{
80105830:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105831:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105836:	89 e5                	mov    %esp,%ebp
80105838:	83 ec 10             	sub    $0x10,%esp
8010583b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010583f:	b8 20 55 11 80       	mov    $0x80115520,%eax
80105844:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105848:	c1 e8 10             	shr    $0x10,%eax
8010584b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010584f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105852:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105855:	c9                   	leave  
80105856:	c3                   	ret    
80105857:	89 f6                	mov    %esi,%esi
80105859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105860 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105860:	55                   	push   %ebp
80105861:	89 e5                	mov    %esp,%ebp
80105863:	57                   	push   %edi
80105864:	56                   	push   %esi
80105865:	53                   	push   %ebx
80105866:	83 ec 2c             	sub    $0x2c,%esp
80105869:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
8010586c:	8b 43 30             	mov    0x30(%ebx),%eax
8010586f:	83 f8 40             	cmp    $0x40,%eax
80105872:	0f 84 00 01 00 00    	je     80105978 <trap+0x118>
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105878:	83 e8 20             	sub    $0x20,%eax
8010587b:	83 f8 1f             	cmp    $0x1f,%eax
8010587e:	77 60                	ja     801058e0 <trap+0x80>
80105880:	ff 24 85 8c 78 10 80 	jmp    *-0x7fef8774(,%eax,4)
80105887:	90                   	nop
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
80105888:	e8 d3 ce ff ff       	call   80102760 <cpunum>
8010588d:	85 c0                	test   %eax,%eax
8010588f:	90                   	nop
80105890:	0f 84 d2 01 00 00    	je     80105a68 <trap+0x208>
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
80105896:	e8 65 cf ff ff       	call   80102800 <lapiceoi>
8010589b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801058a1:	85 c0                	test   %eax,%eax
801058a3:	74 2d                	je     801058d2 <trap+0x72>
801058a5:	8b 50 24             	mov    0x24(%eax),%edx
801058a8:	85 d2                	test   %edx,%edx
801058aa:	0f 85 9c 00 00 00    	jne    8010594c <trap+0xec>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
801058b0:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801058b4:	0f 84 86 01 00 00    	je     80105a40 <trap+0x1e0>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801058ba:	8b 40 24             	mov    0x24(%eax),%eax
801058bd:	85 c0                	test   %eax,%eax
801058bf:	74 11                	je     801058d2 <trap+0x72>
801058c1:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
801058c5:	83 e0 03             	and    $0x3,%eax
801058c8:	66 83 f8 03          	cmp    $0x3,%ax
801058cc:	0f 84 d0 00 00 00    	je     801059a2 <trap+0x142>
    exit();
}
801058d2:	83 c4 2c             	add    $0x2c,%esp
801058d5:	5b                   	pop    %ebx
801058d6:	5e                   	pop    %esi
801058d7:	5f                   	pop    %edi
801058d8:	5d                   	pop    %ebp
801058d9:	c3                   	ret    
801058da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
801058e0:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
801058e7:	85 c9                	test   %ecx,%ecx
801058e9:	0f 84 a9 01 00 00    	je     80105a98 <trap+0x238>
801058ef:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
801058f3:	0f 84 9f 01 00 00    	je     80105a98 <trap+0x238>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
801058f9:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801058fc:	8b 73 38             	mov    0x38(%ebx),%esi
801058ff:	e8 5c ce ff ff       	call   80102760 <cpunum>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105904:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010590b:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
8010590f:	89 74 24 18          	mov    %esi,0x18(%esp)
80105913:	89 44 24 14          	mov    %eax,0x14(%esp)
80105917:	8b 43 34             	mov    0x34(%ebx),%eax
8010591a:	89 44 24 10          	mov    %eax,0x10(%esp)
8010591e:	8b 43 30             	mov    0x30(%ebx),%eax
80105921:	89 44 24 0c          	mov    %eax,0xc(%esp)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105925:	8d 42 6c             	lea    0x6c(%edx),%eax
80105928:	89 44 24 08          	mov    %eax,0x8(%esp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010592c:	8b 42 10             	mov    0x10(%edx),%eax
8010592f:	c7 04 24 48 78 10 80 	movl   $0x80107848,(%esp)
80105936:	89 44 24 04          	mov    %eax,0x4(%esp)
8010593a:	e8 11 ad ff ff       	call   80100650 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
8010593f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105945:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
8010594c:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105950:	83 e2 03             	and    $0x3,%edx
80105953:	66 83 fa 03          	cmp    $0x3,%dx
80105957:	0f 85 53 ff ff ff    	jne    801058b0 <trap+0x50>
    exit();
8010595d:	e8 ee e3 ff ff       	call   80103d50 <exit>

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105962:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105968:	85 c0                	test   %eax,%eax
8010596a:	0f 85 40 ff ff ff    	jne    801058b0 <trap+0x50>
80105970:	e9 5d ff ff ff       	jmp    801058d2 <trap+0x72>
80105975:	8d 76 00             	lea    0x0(%esi),%esi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
80105978:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010597e:	8b 70 24             	mov    0x24(%eax),%esi
80105981:	85 f6                	test   %esi,%esi
80105983:	0f 85 a7 00 00 00    	jne    80105a30 <trap+0x1d0>
      exit();
    proc->tf = tf;
80105989:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
8010598c:	e8 bf ef ff ff       	call   80104950 <syscall>
    if(proc->killed)
80105991:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105997:	8b 58 24             	mov    0x24(%eax),%ebx
8010599a:	85 db                	test   %ebx,%ebx
8010599c:	0f 84 30 ff ff ff    	je     801058d2 <trap+0x72>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
801059a2:	83 c4 2c             	add    $0x2c,%esp
801059a5:	5b                   	pop    %ebx
801059a6:	5e                   	pop    %esi
801059a7:	5f                   	pop    %edi
801059a8:	5d                   	pop    %ebp
    if(proc->killed)
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
801059a9:	e9 a2 e3 ff ff       	jmp    80103d50 <exit>
801059ae:	66 90                	xchg   %ax,%ax
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
801059b0:	e8 1b cc ff ff       	call   801025d0 <kbdintr>
    lapiceoi();
801059b5:	e8 46 ce ff ff       	call   80102800 <lapiceoi>
801059ba:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
801059c0:	e9 dc fe ff ff       	jmp    801058a1 <trap+0x41>
801059c5:	8d 76 00             	lea    0x0(%esi),%esi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
801059c8:	e8 b3 c6 ff ff       	call   80102080 <ideintr>
    lapiceoi();
801059cd:	e8 2e ce ff ff       	call   80102800 <lapiceoi>
801059d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
801059d8:	e9 c4 fe ff ff       	jmp    801058a1 <trap+0x41>
801059dd:	8d 76 00             	lea    0x0(%esi),%esi
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
801059e0:	e8 1b 02 00 00       	call   80105c00 <uartintr>
    lapiceoi();
801059e5:	e8 16 ce ff ff       	call   80102800 <lapiceoi>
801059ea:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
801059f0:	e9 ac fe ff ff       	jmp    801058a1 <trap+0x41>
801059f5:	8d 76 00             	lea    0x0(%esi),%esi
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
801059f8:	8b 7b 38             	mov    0x38(%ebx),%edi
801059fb:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
801059ff:	e8 5c cd ff ff       	call   80102760 <cpunum>
80105a04:	c7 04 24 f0 77 10 80 	movl   $0x801077f0,(%esp)
80105a0b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80105a0f:	89 74 24 08          	mov    %esi,0x8(%esp)
80105a13:	89 44 24 04          	mov    %eax,0x4(%esp)
80105a17:	e8 34 ac ff ff       	call   80100650 <cprintf>
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
80105a1c:	e8 df cd ff ff       	call   80102800 <lapiceoi>
80105a21:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
80105a27:	e9 75 fe ff ff       	jmp    801058a1 <trap+0x41>
80105a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit();
80105a30:	e8 1b e3 ff ff       	call   80103d50 <exit>
80105a35:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105a3b:	e9 49 ff ff ff       	jmp    80105989 <trap+0x129>
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105a40:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105a44:	0f 85 70 fe ff ff    	jne    801058ba <trap+0x5a>
    yield();
80105a4a:	e8 41 e4 ff ff       	call   80103e90 <yield>

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105a4f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105a55:	85 c0                	test   %eax,%eax
80105a57:	0f 85 5d fe ff ff    	jne    801058ba <trap+0x5a>
80105a5d:	e9 70 fe ff ff       	jmp    801058d2 <trap+0x72>
80105a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
80105a68:	c7 04 24 e0 54 11 80 	movl   $0x801154e0,(%esp)
80105a6f:	e8 5c e9 ff ff       	call   801043d0 <acquire>
      ticks++;
      wakeup(&ticks);
80105a74:	c7 04 24 20 5d 11 80 	movl   $0x80115d20,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
80105a7b:	83 05 20 5d 11 80 01 	addl   $0x1,0x80115d20
      wakeup(&ticks);
80105a82:	e8 f9 e5 ff ff       	call   80104080 <wakeup>
      release(&tickslock);
80105a87:	c7 04 24 e0 54 11 80 	movl   $0x801154e0,(%esp)
80105a8e:	e8 6d ea ff ff       	call   80104500 <release>
80105a93:	e9 fe fd ff ff       	jmp    80105896 <trap+0x36>
80105a98:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105a9b:	8b 73 38             	mov    0x38(%ebx),%esi
80105a9e:	e8 bd cc ff ff       	call   80102760 <cpunum>
80105aa3:	89 7c 24 10          	mov    %edi,0x10(%esp)
80105aa7:	89 74 24 0c          	mov    %esi,0xc(%esp)
80105aab:	89 44 24 08          	mov    %eax,0x8(%esp)
80105aaf:	8b 43 30             	mov    0x30(%ebx),%eax
80105ab2:	c7 04 24 14 78 10 80 	movl   $0x80107814,(%esp)
80105ab9:	89 44 24 04          	mov    %eax,0x4(%esp)
80105abd:	e8 8e ab ff ff       	call   80100650 <cprintf>
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
80105ac2:	c7 04 24 ea 77 10 80 	movl   $0x801077ea,(%esp)
80105ac9:	e8 92 a8 ff ff       	call   80100360 <panic>
80105ace:	66 90                	xchg   %ax,%ax

80105ad0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105ad0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105ad5:	55                   	push   %ebp
80105ad6:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105ad8:	85 c0                	test   %eax,%eax
80105ada:	74 14                	je     80105af0 <uartgetc+0x20>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105adc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ae1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105ae2:	a8 01                	test   $0x1,%al
80105ae4:	74 0a                	je     80105af0 <uartgetc+0x20>
80105ae6:	b2 f8                	mov    $0xf8,%dl
80105ae8:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105ae9:	0f b6 c0             	movzbl %al,%eax
}
80105aec:	5d                   	pop    %ebp
80105aed:	c3                   	ret    
80105aee:	66 90                	xchg   %ax,%ax

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105af0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105af5:	5d                   	pop    %ebp
80105af6:	c3                   	ret    
80105af7:	89 f6                	mov    %esi,%esi
80105af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b00 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80105b00:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
80105b05:	85 c0                	test   %eax,%eax
80105b07:	74 3f                	je     80105b48 <uartputc+0x48>
    uartputc(*p);
}

void
uartputc(int c)
{
80105b09:	55                   	push   %ebp
80105b0a:	89 e5                	mov    %esp,%ebp
80105b0c:	56                   	push   %esi
80105b0d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105b12:	53                   	push   %ebx
  int i;

  if(!uart)
80105b13:	bb 80 00 00 00       	mov    $0x80,%ebx
    uartputc(*p);
}

void
uartputc(int c)
{
80105b18:	83 ec 10             	sub    $0x10,%esp
80105b1b:	eb 14                	jmp    80105b31 <uartputc+0x31>
80105b1d:	8d 76 00             	lea    0x0(%esi),%esi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105b20:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
80105b27:	e8 f4 cc ff ff       	call   80102820 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105b2c:	83 eb 01             	sub    $0x1,%ebx
80105b2f:	74 07                	je     80105b38 <uartputc+0x38>
80105b31:	89 f2                	mov    %esi,%edx
80105b33:	ec                   	in     (%dx),%al
80105b34:	a8 20                	test   $0x20,%al
80105b36:	74 e8                	je     80105b20 <uartputc+0x20>
    microdelay(10);
  outb(COM1+0, c);
80105b38:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105b3c:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b41:	ee                   	out    %al,(%dx)
}
80105b42:	83 c4 10             	add    $0x10,%esp
80105b45:	5b                   	pop    %ebx
80105b46:	5e                   	pop    %esi
80105b47:	5d                   	pop    %ebp
80105b48:	f3 c3                	repz ret 
80105b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105b50 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105b50:	55                   	push   %ebp
80105b51:	31 c9                	xor    %ecx,%ecx
80105b53:	89 e5                	mov    %esp,%ebp
80105b55:	89 c8                	mov    %ecx,%eax
80105b57:	57                   	push   %edi
80105b58:	bf fa 03 00 00       	mov    $0x3fa,%edi
80105b5d:	56                   	push   %esi
80105b5e:	89 fa                	mov    %edi,%edx
80105b60:	53                   	push   %ebx
80105b61:	83 ec 1c             	sub    $0x1c,%esp
80105b64:	ee                   	out    %al,(%dx)
80105b65:	be fb 03 00 00       	mov    $0x3fb,%esi
80105b6a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105b6f:	89 f2                	mov    %esi,%edx
80105b71:	ee                   	out    %al,(%dx)
80105b72:	b8 0c 00 00 00       	mov    $0xc,%eax
80105b77:	b2 f8                	mov    $0xf8,%dl
80105b79:	ee                   	out    %al,(%dx)
80105b7a:	bb f9 03 00 00       	mov    $0x3f9,%ebx
80105b7f:	89 c8                	mov    %ecx,%eax
80105b81:	89 da                	mov    %ebx,%edx
80105b83:	ee                   	out    %al,(%dx)
80105b84:	b8 03 00 00 00       	mov    $0x3,%eax
80105b89:	89 f2                	mov    %esi,%edx
80105b8b:	ee                   	out    %al,(%dx)
80105b8c:	b2 fc                	mov    $0xfc,%dl
80105b8e:	89 c8                	mov    %ecx,%eax
80105b90:	ee                   	out    %al,(%dx)
80105b91:	b8 01 00 00 00       	mov    $0x1,%eax
80105b96:	89 da                	mov    %ebx,%edx
80105b98:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105b99:	b2 fd                	mov    $0xfd,%dl
80105b9b:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105b9c:	3c ff                	cmp    $0xff,%al
80105b9e:	74 52                	je     80105bf2 <uartinit+0xa2>
    return;
  uart = 1;
80105ba0:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105ba7:	00 00 00 
80105baa:	89 fa                	mov    %edi,%edx
80105bac:	ec                   	in     (%dx),%al
80105bad:	b2 f8                	mov    $0xf8,%dl
80105baf:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
80105bb0:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105bb7:	bb 0c 79 10 80       	mov    $0x8010790c,%ebx

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
80105bbc:	e8 3f d6 ff ff       	call   80103200 <picenable>
  ioapicenable(IRQ_COM1, 0);
80105bc1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105bc8:	00 
80105bc9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
80105bd0:	e8 db c6 ff ff       	call   801022b0 <ioapicenable>

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105bd5:	b8 78 00 00 00       	mov    $0x78,%eax
80105bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    uartputc(*p);
80105be0:	89 04 24             	mov    %eax,(%esp)
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105be3:	83 c3 01             	add    $0x1,%ebx
    uartputc(*p);
80105be6:	e8 15 ff ff ff       	call   80105b00 <uartputc>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105beb:	0f be 03             	movsbl (%ebx),%eax
80105bee:	84 c0                	test   %al,%al
80105bf0:	75 ee                	jne    80105be0 <uartinit+0x90>
    uartputc(*p);
}
80105bf2:	83 c4 1c             	add    $0x1c,%esp
80105bf5:	5b                   	pop    %ebx
80105bf6:	5e                   	pop    %esi
80105bf7:	5f                   	pop    %edi
80105bf8:	5d                   	pop    %ebp
80105bf9:	c3                   	ret    
80105bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105c00 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105c00:	55                   	push   %ebp
80105c01:	89 e5                	mov    %esp,%ebp
80105c03:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
80105c06:	c7 04 24 d0 5a 10 80 	movl   $0x80105ad0,(%esp)
80105c0d:	e8 9e ab ff ff       	call   801007b0 <consoleintr>
}
80105c12:	c9                   	leave  
80105c13:	c3                   	ret    

80105c14 <vector0>:
80105c14:	6a 00                	push   $0x0
80105c16:	6a 00                	push   $0x0
80105c18:	e9 40 fb ff ff       	jmp    8010575d <alltraps>

80105c1d <vector1>:
80105c1d:	6a 00                	push   $0x0
80105c1f:	6a 01                	push   $0x1
80105c21:	e9 37 fb ff ff       	jmp    8010575d <alltraps>

80105c26 <vector2>:
80105c26:	6a 00                	push   $0x0
80105c28:	6a 02                	push   $0x2
80105c2a:	e9 2e fb ff ff       	jmp    8010575d <alltraps>

80105c2f <vector3>:
80105c2f:	6a 00                	push   $0x0
80105c31:	6a 03                	push   $0x3
80105c33:	e9 25 fb ff ff       	jmp    8010575d <alltraps>

80105c38 <vector4>:
80105c38:	6a 00                	push   $0x0
80105c3a:	6a 04                	push   $0x4
80105c3c:	e9 1c fb ff ff       	jmp    8010575d <alltraps>

80105c41 <vector5>:
80105c41:	6a 00                	push   $0x0
80105c43:	6a 05                	push   $0x5
80105c45:	e9 13 fb ff ff       	jmp    8010575d <alltraps>

80105c4a <vector6>:
80105c4a:	6a 00                	push   $0x0
80105c4c:	6a 06                	push   $0x6
80105c4e:	e9 0a fb ff ff       	jmp    8010575d <alltraps>

80105c53 <vector7>:
80105c53:	6a 00                	push   $0x0
80105c55:	6a 07                	push   $0x7
80105c57:	e9 01 fb ff ff       	jmp    8010575d <alltraps>

80105c5c <vector8>:
80105c5c:	6a 08                	push   $0x8
80105c5e:	e9 fa fa ff ff       	jmp    8010575d <alltraps>

80105c63 <vector9>:
80105c63:	6a 00                	push   $0x0
80105c65:	6a 09                	push   $0x9
80105c67:	e9 f1 fa ff ff       	jmp    8010575d <alltraps>

80105c6c <vector10>:
80105c6c:	6a 0a                	push   $0xa
80105c6e:	e9 ea fa ff ff       	jmp    8010575d <alltraps>

80105c73 <vector11>:
80105c73:	6a 0b                	push   $0xb
80105c75:	e9 e3 fa ff ff       	jmp    8010575d <alltraps>

80105c7a <vector12>:
80105c7a:	6a 0c                	push   $0xc
80105c7c:	e9 dc fa ff ff       	jmp    8010575d <alltraps>

80105c81 <vector13>:
80105c81:	6a 0d                	push   $0xd
80105c83:	e9 d5 fa ff ff       	jmp    8010575d <alltraps>

80105c88 <vector14>:
80105c88:	6a 0e                	push   $0xe
80105c8a:	e9 ce fa ff ff       	jmp    8010575d <alltraps>

80105c8f <vector15>:
80105c8f:	6a 00                	push   $0x0
80105c91:	6a 0f                	push   $0xf
80105c93:	e9 c5 fa ff ff       	jmp    8010575d <alltraps>

80105c98 <vector16>:
80105c98:	6a 00                	push   $0x0
80105c9a:	6a 10                	push   $0x10
80105c9c:	e9 bc fa ff ff       	jmp    8010575d <alltraps>

80105ca1 <vector17>:
80105ca1:	6a 11                	push   $0x11
80105ca3:	e9 b5 fa ff ff       	jmp    8010575d <alltraps>

80105ca8 <vector18>:
80105ca8:	6a 00                	push   $0x0
80105caa:	6a 12                	push   $0x12
80105cac:	e9 ac fa ff ff       	jmp    8010575d <alltraps>

80105cb1 <vector19>:
80105cb1:	6a 00                	push   $0x0
80105cb3:	6a 13                	push   $0x13
80105cb5:	e9 a3 fa ff ff       	jmp    8010575d <alltraps>

80105cba <vector20>:
80105cba:	6a 00                	push   $0x0
80105cbc:	6a 14                	push   $0x14
80105cbe:	e9 9a fa ff ff       	jmp    8010575d <alltraps>

80105cc3 <vector21>:
80105cc3:	6a 00                	push   $0x0
80105cc5:	6a 15                	push   $0x15
80105cc7:	e9 91 fa ff ff       	jmp    8010575d <alltraps>

80105ccc <vector22>:
80105ccc:	6a 00                	push   $0x0
80105cce:	6a 16                	push   $0x16
80105cd0:	e9 88 fa ff ff       	jmp    8010575d <alltraps>

80105cd5 <vector23>:
80105cd5:	6a 00                	push   $0x0
80105cd7:	6a 17                	push   $0x17
80105cd9:	e9 7f fa ff ff       	jmp    8010575d <alltraps>

80105cde <vector24>:
80105cde:	6a 00                	push   $0x0
80105ce0:	6a 18                	push   $0x18
80105ce2:	e9 76 fa ff ff       	jmp    8010575d <alltraps>

80105ce7 <vector25>:
80105ce7:	6a 00                	push   $0x0
80105ce9:	6a 19                	push   $0x19
80105ceb:	e9 6d fa ff ff       	jmp    8010575d <alltraps>

80105cf0 <vector26>:
80105cf0:	6a 00                	push   $0x0
80105cf2:	6a 1a                	push   $0x1a
80105cf4:	e9 64 fa ff ff       	jmp    8010575d <alltraps>

80105cf9 <vector27>:
80105cf9:	6a 00                	push   $0x0
80105cfb:	6a 1b                	push   $0x1b
80105cfd:	e9 5b fa ff ff       	jmp    8010575d <alltraps>

80105d02 <vector28>:
80105d02:	6a 00                	push   $0x0
80105d04:	6a 1c                	push   $0x1c
80105d06:	e9 52 fa ff ff       	jmp    8010575d <alltraps>

80105d0b <vector29>:
80105d0b:	6a 00                	push   $0x0
80105d0d:	6a 1d                	push   $0x1d
80105d0f:	e9 49 fa ff ff       	jmp    8010575d <alltraps>

80105d14 <vector30>:
80105d14:	6a 00                	push   $0x0
80105d16:	6a 1e                	push   $0x1e
80105d18:	e9 40 fa ff ff       	jmp    8010575d <alltraps>

80105d1d <vector31>:
80105d1d:	6a 00                	push   $0x0
80105d1f:	6a 1f                	push   $0x1f
80105d21:	e9 37 fa ff ff       	jmp    8010575d <alltraps>

80105d26 <vector32>:
80105d26:	6a 00                	push   $0x0
80105d28:	6a 20                	push   $0x20
80105d2a:	e9 2e fa ff ff       	jmp    8010575d <alltraps>

80105d2f <vector33>:
80105d2f:	6a 00                	push   $0x0
80105d31:	6a 21                	push   $0x21
80105d33:	e9 25 fa ff ff       	jmp    8010575d <alltraps>

80105d38 <vector34>:
80105d38:	6a 00                	push   $0x0
80105d3a:	6a 22                	push   $0x22
80105d3c:	e9 1c fa ff ff       	jmp    8010575d <alltraps>

80105d41 <vector35>:
80105d41:	6a 00                	push   $0x0
80105d43:	6a 23                	push   $0x23
80105d45:	e9 13 fa ff ff       	jmp    8010575d <alltraps>

80105d4a <vector36>:
80105d4a:	6a 00                	push   $0x0
80105d4c:	6a 24                	push   $0x24
80105d4e:	e9 0a fa ff ff       	jmp    8010575d <alltraps>

80105d53 <vector37>:
80105d53:	6a 00                	push   $0x0
80105d55:	6a 25                	push   $0x25
80105d57:	e9 01 fa ff ff       	jmp    8010575d <alltraps>

80105d5c <vector38>:
80105d5c:	6a 00                	push   $0x0
80105d5e:	6a 26                	push   $0x26
80105d60:	e9 f8 f9 ff ff       	jmp    8010575d <alltraps>

80105d65 <vector39>:
80105d65:	6a 00                	push   $0x0
80105d67:	6a 27                	push   $0x27
80105d69:	e9 ef f9 ff ff       	jmp    8010575d <alltraps>

80105d6e <vector40>:
80105d6e:	6a 00                	push   $0x0
80105d70:	6a 28                	push   $0x28
80105d72:	e9 e6 f9 ff ff       	jmp    8010575d <alltraps>

80105d77 <vector41>:
80105d77:	6a 00                	push   $0x0
80105d79:	6a 29                	push   $0x29
80105d7b:	e9 dd f9 ff ff       	jmp    8010575d <alltraps>

80105d80 <vector42>:
80105d80:	6a 00                	push   $0x0
80105d82:	6a 2a                	push   $0x2a
80105d84:	e9 d4 f9 ff ff       	jmp    8010575d <alltraps>

80105d89 <vector43>:
80105d89:	6a 00                	push   $0x0
80105d8b:	6a 2b                	push   $0x2b
80105d8d:	e9 cb f9 ff ff       	jmp    8010575d <alltraps>

80105d92 <vector44>:
80105d92:	6a 00                	push   $0x0
80105d94:	6a 2c                	push   $0x2c
80105d96:	e9 c2 f9 ff ff       	jmp    8010575d <alltraps>

80105d9b <vector45>:
80105d9b:	6a 00                	push   $0x0
80105d9d:	6a 2d                	push   $0x2d
80105d9f:	e9 b9 f9 ff ff       	jmp    8010575d <alltraps>

80105da4 <vector46>:
80105da4:	6a 00                	push   $0x0
80105da6:	6a 2e                	push   $0x2e
80105da8:	e9 b0 f9 ff ff       	jmp    8010575d <alltraps>

80105dad <vector47>:
80105dad:	6a 00                	push   $0x0
80105daf:	6a 2f                	push   $0x2f
80105db1:	e9 a7 f9 ff ff       	jmp    8010575d <alltraps>

80105db6 <vector48>:
80105db6:	6a 00                	push   $0x0
80105db8:	6a 30                	push   $0x30
80105dba:	e9 9e f9 ff ff       	jmp    8010575d <alltraps>

80105dbf <vector49>:
80105dbf:	6a 00                	push   $0x0
80105dc1:	6a 31                	push   $0x31
80105dc3:	e9 95 f9 ff ff       	jmp    8010575d <alltraps>

80105dc8 <vector50>:
80105dc8:	6a 00                	push   $0x0
80105dca:	6a 32                	push   $0x32
80105dcc:	e9 8c f9 ff ff       	jmp    8010575d <alltraps>

80105dd1 <vector51>:
80105dd1:	6a 00                	push   $0x0
80105dd3:	6a 33                	push   $0x33
80105dd5:	e9 83 f9 ff ff       	jmp    8010575d <alltraps>

80105dda <vector52>:
80105dda:	6a 00                	push   $0x0
80105ddc:	6a 34                	push   $0x34
80105dde:	e9 7a f9 ff ff       	jmp    8010575d <alltraps>

80105de3 <vector53>:
80105de3:	6a 00                	push   $0x0
80105de5:	6a 35                	push   $0x35
80105de7:	e9 71 f9 ff ff       	jmp    8010575d <alltraps>

80105dec <vector54>:
80105dec:	6a 00                	push   $0x0
80105dee:	6a 36                	push   $0x36
80105df0:	e9 68 f9 ff ff       	jmp    8010575d <alltraps>

80105df5 <vector55>:
80105df5:	6a 00                	push   $0x0
80105df7:	6a 37                	push   $0x37
80105df9:	e9 5f f9 ff ff       	jmp    8010575d <alltraps>

80105dfe <vector56>:
80105dfe:	6a 00                	push   $0x0
80105e00:	6a 38                	push   $0x38
80105e02:	e9 56 f9 ff ff       	jmp    8010575d <alltraps>

80105e07 <vector57>:
80105e07:	6a 00                	push   $0x0
80105e09:	6a 39                	push   $0x39
80105e0b:	e9 4d f9 ff ff       	jmp    8010575d <alltraps>

80105e10 <vector58>:
80105e10:	6a 00                	push   $0x0
80105e12:	6a 3a                	push   $0x3a
80105e14:	e9 44 f9 ff ff       	jmp    8010575d <alltraps>

80105e19 <vector59>:
80105e19:	6a 00                	push   $0x0
80105e1b:	6a 3b                	push   $0x3b
80105e1d:	e9 3b f9 ff ff       	jmp    8010575d <alltraps>

80105e22 <vector60>:
80105e22:	6a 00                	push   $0x0
80105e24:	6a 3c                	push   $0x3c
80105e26:	e9 32 f9 ff ff       	jmp    8010575d <alltraps>

80105e2b <vector61>:
80105e2b:	6a 00                	push   $0x0
80105e2d:	6a 3d                	push   $0x3d
80105e2f:	e9 29 f9 ff ff       	jmp    8010575d <alltraps>

80105e34 <vector62>:
80105e34:	6a 00                	push   $0x0
80105e36:	6a 3e                	push   $0x3e
80105e38:	e9 20 f9 ff ff       	jmp    8010575d <alltraps>

80105e3d <vector63>:
80105e3d:	6a 00                	push   $0x0
80105e3f:	6a 3f                	push   $0x3f
80105e41:	e9 17 f9 ff ff       	jmp    8010575d <alltraps>

80105e46 <vector64>:
80105e46:	6a 00                	push   $0x0
80105e48:	6a 40                	push   $0x40
80105e4a:	e9 0e f9 ff ff       	jmp    8010575d <alltraps>

80105e4f <vector65>:
80105e4f:	6a 00                	push   $0x0
80105e51:	6a 41                	push   $0x41
80105e53:	e9 05 f9 ff ff       	jmp    8010575d <alltraps>

80105e58 <vector66>:
80105e58:	6a 00                	push   $0x0
80105e5a:	6a 42                	push   $0x42
80105e5c:	e9 fc f8 ff ff       	jmp    8010575d <alltraps>

80105e61 <vector67>:
80105e61:	6a 00                	push   $0x0
80105e63:	6a 43                	push   $0x43
80105e65:	e9 f3 f8 ff ff       	jmp    8010575d <alltraps>

80105e6a <vector68>:
80105e6a:	6a 00                	push   $0x0
80105e6c:	6a 44                	push   $0x44
80105e6e:	e9 ea f8 ff ff       	jmp    8010575d <alltraps>

80105e73 <vector69>:
80105e73:	6a 00                	push   $0x0
80105e75:	6a 45                	push   $0x45
80105e77:	e9 e1 f8 ff ff       	jmp    8010575d <alltraps>

80105e7c <vector70>:
80105e7c:	6a 00                	push   $0x0
80105e7e:	6a 46                	push   $0x46
80105e80:	e9 d8 f8 ff ff       	jmp    8010575d <alltraps>

80105e85 <vector71>:
80105e85:	6a 00                	push   $0x0
80105e87:	6a 47                	push   $0x47
80105e89:	e9 cf f8 ff ff       	jmp    8010575d <alltraps>

80105e8e <vector72>:
80105e8e:	6a 00                	push   $0x0
80105e90:	6a 48                	push   $0x48
80105e92:	e9 c6 f8 ff ff       	jmp    8010575d <alltraps>

80105e97 <vector73>:
80105e97:	6a 00                	push   $0x0
80105e99:	6a 49                	push   $0x49
80105e9b:	e9 bd f8 ff ff       	jmp    8010575d <alltraps>

80105ea0 <vector74>:
80105ea0:	6a 00                	push   $0x0
80105ea2:	6a 4a                	push   $0x4a
80105ea4:	e9 b4 f8 ff ff       	jmp    8010575d <alltraps>

80105ea9 <vector75>:
80105ea9:	6a 00                	push   $0x0
80105eab:	6a 4b                	push   $0x4b
80105ead:	e9 ab f8 ff ff       	jmp    8010575d <alltraps>

80105eb2 <vector76>:
80105eb2:	6a 00                	push   $0x0
80105eb4:	6a 4c                	push   $0x4c
80105eb6:	e9 a2 f8 ff ff       	jmp    8010575d <alltraps>

80105ebb <vector77>:
80105ebb:	6a 00                	push   $0x0
80105ebd:	6a 4d                	push   $0x4d
80105ebf:	e9 99 f8 ff ff       	jmp    8010575d <alltraps>

80105ec4 <vector78>:
80105ec4:	6a 00                	push   $0x0
80105ec6:	6a 4e                	push   $0x4e
80105ec8:	e9 90 f8 ff ff       	jmp    8010575d <alltraps>

80105ecd <vector79>:
80105ecd:	6a 00                	push   $0x0
80105ecf:	6a 4f                	push   $0x4f
80105ed1:	e9 87 f8 ff ff       	jmp    8010575d <alltraps>

80105ed6 <vector80>:
80105ed6:	6a 00                	push   $0x0
80105ed8:	6a 50                	push   $0x50
80105eda:	e9 7e f8 ff ff       	jmp    8010575d <alltraps>

80105edf <vector81>:
80105edf:	6a 00                	push   $0x0
80105ee1:	6a 51                	push   $0x51
80105ee3:	e9 75 f8 ff ff       	jmp    8010575d <alltraps>

80105ee8 <vector82>:
80105ee8:	6a 00                	push   $0x0
80105eea:	6a 52                	push   $0x52
80105eec:	e9 6c f8 ff ff       	jmp    8010575d <alltraps>

80105ef1 <vector83>:
80105ef1:	6a 00                	push   $0x0
80105ef3:	6a 53                	push   $0x53
80105ef5:	e9 63 f8 ff ff       	jmp    8010575d <alltraps>

80105efa <vector84>:
80105efa:	6a 00                	push   $0x0
80105efc:	6a 54                	push   $0x54
80105efe:	e9 5a f8 ff ff       	jmp    8010575d <alltraps>

80105f03 <vector85>:
80105f03:	6a 00                	push   $0x0
80105f05:	6a 55                	push   $0x55
80105f07:	e9 51 f8 ff ff       	jmp    8010575d <alltraps>

80105f0c <vector86>:
80105f0c:	6a 00                	push   $0x0
80105f0e:	6a 56                	push   $0x56
80105f10:	e9 48 f8 ff ff       	jmp    8010575d <alltraps>

80105f15 <vector87>:
80105f15:	6a 00                	push   $0x0
80105f17:	6a 57                	push   $0x57
80105f19:	e9 3f f8 ff ff       	jmp    8010575d <alltraps>

80105f1e <vector88>:
80105f1e:	6a 00                	push   $0x0
80105f20:	6a 58                	push   $0x58
80105f22:	e9 36 f8 ff ff       	jmp    8010575d <alltraps>

80105f27 <vector89>:
80105f27:	6a 00                	push   $0x0
80105f29:	6a 59                	push   $0x59
80105f2b:	e9 2d f8 ff ff       	jmp    8010575d <alltraps>

80105f30 <vector90>:
80105f30:	6a 00                	push   $0x0
80105f32:	6a 5a                	push   $0x5a
80105f34:	e9 24 f8 ff ff       	jmp    8010575d <alltraps>

80105f39 <vector91>:
80105f39:	6a 00                	push   $0x0
80105f3b:	6a 5b                	push   $0x5b
80105f3d:	e9 1b f8 ff ff       	jmp    8010575d <alltraps>

80105f42 <vector92>:
80105f42:	6a 00                	push   $0x0
80105f44:	6a 5c                	push   $0x5c
80105f46:	e9 12 f8 ff ff       	jmp    8010575d <alltraps>

80105f4b <vector93>:
80105f4b:	6a 00                	push   $0x0
80105f4d:	6a 5d                	push   $0x5d
80105f4f:	e9 09 f8 ff ff       	jmp    8010575d <alltraps>

80105f54 <vector94>:
80105f54:	6a 00                	push   $0x0
80105f56:	6a 5e                	push   $0x5e
80105f58:	e9 00 f8 ff ff       	jmp    8010575d <alltraps>

80105f5d <vector95>:
80105f5d:	6a 00                	push   $0x0
80105f5f:	6a 5f                	push   $0x5f
80105f61:	e9 f7 f7 ff ff       	jmp    8010575d <alltraps>

80105f66 <vector96>:
80105f66:	6a 00                	push   $0x0
80105f68:	6a 60                	push   $0x60
80105f6a:	e9 ee f7 ff ff       	jmp    8010575d <alltraps>

80105f6f <vector97>:
80105f6f:	6a 00                	push   $0x0
80105f71:	6a 61                	push   $0x61
80105f73:	e9 e5 f7 ff ff       	jmp    8010575d <alltraps>

80105f78 <vector98>:
80105f78:	6a 00                	push   $0x0
80105f7a:	6a 62                	push   $0x62
80105f7c:	e9 dc f7 ff ff       	jmp    8010575d <alltraps>

80105f81 <vector99>:
80105f81:	6a 00                	push   $0x0
80105f83:	6a 63                	push   $0x63
80105f85:	e9 d3 f7 ff ff       	jmp    8010575d <alltraps>

80105f8a <vector100>:
80105f8a:	6a 00                	push   $0x0
80105f8c:	6a 64                	push   $0x64
80105f8e:	e9 ca f7 ff ff       	jmp    8010575d <alltraps>

80105f93 <vector101>:
80105f93:	6a 00                	push   $0x0
80105f95:	6a 65                	push   $0x65
80105f97:	e9 c1 f7 ff ff       	jmp    8010575d <alltraps>

80105f9c <vector102>:
80105f9c:	6a 00                	push   $0x0
80105f9e:	6a 66                	push   $0x66
80105fa0:	e9 b8 f7 ff ff       	jmp    8010575d <alltraps>

80105fa5 <vector103>:
80105fa5:	6a 00                	push   $0x0
80105fa7:	6a 67                	push   $0x67
80105fa9:	e9 af f7 ff ff       	jmp    8010575d <alltraps>

80105fae <vector104>:
80105fae:	6a 00                	push   $0x0
80105fb0:	6a 68                	push   $0x68
80105fb2:	e9 a6 f7 ff ff       	jmp    8010575d <alltraps>

80105fb7 <vector105>:
80105fb7:	6a 00                	push   $0x0
80105fb9:	6a 69                	push   $0x69
80105fbb:	e9 9d f7 ff ff       	jmp    8010575d <alltraps>

80105fc0 <vector106>:
80105fc0:	6a 00                	push   $0x0
80105fc2:	6a 6a                	push   $0x6a
80105fc4:	e9 94 f7 ff ff       	jmp    8010575d <alltraps>

80105fc9 <vector107>:
80105fc9:	6a 00                	push   $0x0
80105fcb:	6a 6b                	push   $0x6b
80105fcd:	e9 8b f7 ff ff       	jmp    8010575d <alltraps>

80105fd2 <vector108>:
80105fd2:	6a 00                	push   $0x0
80105fd4:	6a 6c                	push   $0x6c
80105fd6:	e9 82 f7 ff ff       	jmp    8010575d <alltraps>

80105fdb <vector109>:
80105fdb:	6a 00                	push   $0x0
80105fdd:	6a 6d                	push   $0x6d
80105fdf:	e9 79 f7 ff ff       	jmp    8010575d <alltraps>

80105fe4 <vector110>:
80105fe4:	6a 00                	push   $0x0
80105fe6:	6a 6e                	push   $0x6e
80105fe8:	e9 70 f7 ff ff       	jmp    8010575d <alltraps>

80105fed <vector111>:
80105fed:	6a 00                	push   $0x0
80105fef:	6a 6f                	push   $0x6f
80105ff1:	e9 67 f7 ff ff       	jmp    8010575d <alltraps>

80105ff6 <vector112>:
80105ff6:	6a 00                	push   $0x0
80105ff8:	6a 70                	push   $0x70
80105ffa:	e9 5e f7 ff ff       	jmp    8010575d <alltraps>

80105fff <vector113>:
80105fff:	6a 00                	push   $0x0
80106001:	6a 71                	push   $0x71
80106003:	e9 55 f7 ff ff       	jmp    8010575d <alltraps>

80106008 <vector114>:
80106008:	6a 00                	push   $0x0
8010600a:	6a 72                	push   $0x72
8010600c:	e9 4c f7 ff ff       	jmp    8010575d <alltraps>

80106011 <vector115>:
80106011:	6a 00                	push   $0x0
80106013:	6a 73                	push   $0x73
80106015:	e9 43 f7 ff ff       	jmp    8010575d <alltraps>

8010601a <vector116>:
8010601a:	6a 00                	push   $0x0
8010601c:	6a 74                	push   $0x74
8010601e:	e9 3a f7 ff ff       	jmp    8010575d <alltraps>

80106023 <vector117>:
80106023:	6a 00                	push   $0x0
80106025:	6a 75                	push   $0x75
80106027:	e9 31 f7 ff ff       	jmp    8010575d <alltraps>

8010602c <vector118>:
8010602c:	6a 00                	push   $0x0
8010602e:	6a 76                	push   $0x76
80106030:	e9 28 f7 ff ff       	jmp    8010575d <alltraps>

80106035 <vector119>:
80106035:	6a 00                	push   $0x0
80106037:	6a 77                	push   $0x77
80106039:	e9 1f f7 ff ff       	jmp    8010575d <alltraps>

8010603e <vector120>:
8010603e:	6a 00                	push   $0x0
80106040:	6a 78                	push   $0x78
80106042:	e9 16 f7 ff ff       	jmp    8010575d <alltraps>

80106047 <vector121>:
80106047:	6a 00                	push   $0x0
80106049:	6a 79                	push   $0x79
8010604b:	e9 0d f7 ff ff       	jmp    8010575d <alltraps>

80106050 <vector122>:
80106050:	6a 00                	push   $0x0
80106052:	6a 7a                	push   $0x7a
80106054:	e9 04 f7 ff ff       	jmp    8010575d <alltraps>

80106059 <vector123>:
80106059:	6a 00                	push   $0x0
8010605b:	6a 7b                	push   $0x7b
8010605d:	e9 fb f6 ff ff       	jmp    8010575d <alltraps>

80106062 <vector124>:
80106062:	6a 00                	push   $0x0
80106064:	6a 7c                	push   $0x7c
80106066:	e9 f2 f6 ff ff       	jmp    8010575d <alltraps>

8010606b <vector125>:
8010606b:	6a 00                	push   $0x0
8010606d:	6a 7d                	push   $0x7d
8010606f:	e9 e9 f6 ff ff       	jmp    8010575d <alltraps>

80106074 <vector126>:
80106074:	6a 00                	push   $0x0
80106076:	6a 7e                	push   $0x7e
80106078:	e9 e0 f6 ff ff       	jmp    8010575d <alltraps>

8010607d <vector127>:
8010607d:	6a 00                	push   $0x0
8010607f:	6a 7f                	push   $0x7f
80106081:	e9 d7 f6 ff ff       	jmp    8010575d <alltraps>

80106086 <vector128>:
80106086:	6a 00                	push   $0x0
80106088:	68 80 00 00 00       	push   $0x80
8010608d:	e9 cb f6 ff ff       	jmp    8010575d <alltraps>

80106092 <vector129>:
80106092:	6a 00                	push   $0x0
80106094:	68 81 00 00 00       	push   $0x81
80106099:	e9 bf f6 ff ff       	jmp    8010575d <alltraps>

8010609e <vector130>:
8010609e:	6a 00                	push   $0x0
801060a0:	68 82 00 00 00       	push   $0x82
801060a5:	e9 b3 f6 ff ff       	jmp    8010575d <alltraps>

801060aa <vector131>:
801060aa:	6a 00                	push   $0x0
801060ac:	68 83 00 00 00       	push   $0x83
801060b1:	e9 a7 f6 ff ff       	jmp    8010575d <alltraps>

801060b6 <vector132>:
801060b6:	6a 00                	push   $0x0
801060b8:	68 84 00 00 00       	push   $0x84
801060bd:	e9 9b f6 ff ff       	jmp    8010575d <alltraps>

801060c2 <vector133>:
801060c2:	6a 00                	push   $0x0
801060c4:	68 85 00 00 00       	push   $0x85
801060c9:	e9 8f f6 ff ff       	jmp    8010575d <alltraps>

801060ce <vector134>:
801060ce:	6a 00                	push   $0x0
801060d0:	68 86 00 00 00       	push   $0x86
801060d5:	e9 83 f6 ff ff       	jmp    8010575d <alltraps>

801060da <vector135>:
801060da:	6a 00                	push   $0x0
801060dc:	68 87 00 00 00       	push   $0x87
801060e1:	e9 77 f6 ff ff       	jmp    8010575d <alltraps>

801060e6 <vector136>:
801060e6:	6a 00                	push   $0x0
801060e8:	68 88 00 00 00       	push   $0x88
801060ed:	e9 6b f6 ff ff       	jmp    8010575d <alltraps>

801060f2 <vector137>:
801060f2:	6a 00                	push   $0x0
801060f4:	68 89 00 00 00       	push   $0x89
801060f9:	e9 5f f6 ff ff       	jmp    8010575d <alltraps>

801060fe <vector138>:
801060fe:	6a 00                	push   $0x0
80106100:	68 8a 00 00 00       	push   $0x8a
80106105:	e9 53 f6 ff ff       	jmp    8010575d <alltraps>

8010610a <vector139>:
8010610a:	6a 00                	push   $0x0
8010610c:	68 8b 00 00 00       	push   $0x8b
80106111:	e9 47 f6 ff ff       	jmp    8010575d <alltraps>

80106116 <vector140>:
80106116:	6a 00                	push   $0x0
80106118:	68 8c 00 00 00       	push   $0x8c
8010611d:	e9 3b f6 ff ff       	jmp    8010575d <alltraps>

80106122 <vector141>:
80106122:	6a 00                	push   $0x0
80106124:	68 8d 00 00 00       	push   $0x8d
80106129:	e9 2f f6 ff ff       	jmp    8010575d <alltraps>

8010612e <vector142>:
8010612e:	6a 00                	push   $0x0
80106130:	68 8e 00 00 00       	push   $0x8e
80106135:	e9 23 f6 ff ff       	jmp    8010575d <alltraps>

8010613a <vector143>:
8010613a:	6a 00                	push   $0x0
8010613c:	68 8f 00 00 00       	push   $0x8f
80106141:	e9 17 f6 ff ff       	jmp    8010575d <alltraps>

80106146 <vector144>:
80106146:	6a 00                	push   $0x0
80106148:	68 90 00 00 00       	push   $0x90
8010614d:	e9 0b f6 ff ff       	jmp    8010575d <alltraps>

80106152 <vector145>:
80106152:	6a 00                	push   $0x0
80106154:	68 91 00 00 00       	push   $0x91
80106159:	e9 ff f5 ff ff       	jmp    8010575d <alltraps>

8010615e <vector146>:
8010615e:	6a 00                	push   $0x0
80106160:	68 92 00 00 00       	push   $0x92
80106165:	e9 f3 f5 ff ff       	jmp    8010575d <alltraps>

8010616a <vector147>:
8010616a:	6a 00                	push   $0x0
8010616c:	68 93 00 00 00       	push   $0x93
80106171:	e9 e7 f5 ff ff       	jmp    8010575d <alltraps>

80106176 <vector148>:
80106176:	6a 00                	push   $0x0
80106178:	68 94 00 00 00       	push   $0x94
8010617d:	e9 db f5 ff ff       	jmp    8010575d <alltraps>

80106182 <vector149>:
80106182:	6a 00                	push   $0x0
80106184:	68 95 00 00 00       	push   $0x95
80106189:	e9 cf f5 ff ff       	jmp    8010575d <alltraps>

8010618e <vector150>:
8010618e:	6a 00                	push   $0x0
80106190:	68 96 00 00 00       	push   $0x96
80106195:	e9 c3 f5 ff ff       	jmp    8010575d <alltraps>

8010619a <vector151>:
8010619a:	6a 00                	push   $0x0
8010619c:	68 97 00 00 00       	push   $0x97
801061a1:	e9 b7 f5 ff ff       	jmp    8010575d <alltraps>

801061a6 <vector152>:
801061a6:	6a 00                	push   $0x0
801061a8:	68 98 00 00 00       	push   $0x98
801061ad:	e9 ab f5 ff ff       	jmp    8010575d <alltraps>

801061b2 <vector153>:
801061b2:	6a 00                	push   $0x0
801061b4:	68 99 00 00 00       	push   $0x99
801061b9:	e9 9f f5 ff ff       	jmp    8010575d <alltraps>

801061be <vector154>:
801061be:	6a 00                	push   $0x0
801061c0:	68 9a 00 00 00       	push   $0x9a
801061c5:	e9 93 f5 ff ff       	jmp    8010575d <alltraps>

801061ca <vector155>:
801061ca:	6a 00                	push   $0x0
801061cc:	68 9b 00 00 00       	push   $0x9b
801061d1:	e9 87 f5 ff ff       	jmp    8010575d <alltraps>

801061d6 <vector156>:
801061d6:	6a 00                	push   $0x0
801061d8:	68 9c 00 00 00       	push   $0x9c
801061dd:	e9 7b f5 ff ff       	jmp    8010575d <alltraps>

801061e2 <vector157>:
801061e2:	6a 00                	push   $0x0
801061e4:	68 9d 00 00 00       	push   $0x9d
801061e9:	e9 6f f5 ff ff       	jmp    8010575d <alltraps>

801061ee <vector158>:
801061ee:	6a 00                	push   $0x0
801061f0:	68 9e 00 00 00       	push   $0x9e
801061f5:	e9 63 f5 ff ff       	jmp    8010575d <alltraps>

801061fa <vector159>:
801061fa:	6a 00                	push   $0x0
801061fc:	68 9f 00 00 00       	push   $0x9f
80106201:	e9 57 f5 ff ff       	jmp    8010575d <alltraps>

80106206 <vector160>:
80106206:	6a 00                	push   $0x0
80106208:	68 a0 00 00 00       	push   $0xa0
8010620d:	e9 4b f5 ff ff       	jmp    8010575d <alltraps>

80106212 <vector161>:
80106212:	6a 00                	push   $0x0
80106214:	68 a1 00 00 00       	push   $0xa1
80106219:	e9 3f f5 ff ff       	jmp    8010575d <alltraps>

8010621e <vector162>:
8010621e:	6a 00                	push   $0x0
80106220:	68 a2 00 00 00       	push   $0xa2
80106225:	e9 33 f5 ff ff       	jmp    8010575d <alltraps>

8010622a <vector163>:
8010622a:	6a 00                	push   $0x0
8010622c:	68 a3 00 00 00       	push   $0xa3
80106231:	e9 27 f5 ff ff       	jmp    8010575d <alltraps>

80106236 <vector164>:
80106236:	6a 00                	push   $0x0
80106238:	68 a4 00 00 00       	push   $0xa4
8010623d:	e9 1b f5 ff ff       	jmp    8010575d <alltraps>

80106242 <vector165>:
80106242:	6a 00                	push   $0x0
80106244:	68 a5 00 00 00       	push   $0xa5
80106249:	e9 0f f5 ff ff       	jmp    8010575d <alltraps>

8010624e <vector166>:
8010624e:	6a 00                	push   $0x0
80106250:	68 a6 00 00 00       	push   $0xa6
80106255:	e9 03 f5 ff ff       	jmp    8010575d <alltraps>

8010625a <vector167>:
8010625a:	6a 00                	push   $0x0
8010625c:	68 a7 00 00 00       	push   $0xa7
80106261:	e9 f7 f4 ff ff       	jmp    8010575d <alltraps>

80106266 <vector168>:
80106266:	6a 00                	push   $0x0
80106268:	68 a8 00 00 00       	push   $0xa8
8010626d:	e9 eb f4 ff ff       	jmp    8010575d <alltraps>

80106272 <vector169>:
80106272:	6a 00                	push   $0x0
80106274:	68 a9 00 00 00       	push   $0xa9
80106279:	e9 df f4 ff ff       	jmp    8010575d <alltraps>

8010627e <vector170>:
8010627e:	6a 00                	push   $0x0
80106280:	68 aa 00 00 00       	push   $0xaa
80106285:	e9 d3 f4 ff ff       	jmp    8010575d <alltraps>

8010628a <vector171>:
8010628a:	6a 00                	push   $0x0
8010628c:	68 ab 00 00 00       	push   $0xab
80106291:	e9 c7 f4 ff ff       	jmp    8010575d <alltraps>

80106296 <vector172>:
80106296:	6a 00                	push   $0x0
80106298:	68 ac 00 00 00       	push   $0xac
8010629d:	e9 bb f4 ff ff       	jmp    8010575d <alltraps>

801062a2 <vector173>:
801062a2:	6a 00                	push   $0x0
801062a4:	68 ad 00 00 00       	push   $0xad
801062a9:	e9 af f4 ff ff       	jmp    8010575d <alltraps>

801062ae <vector174>:
801062ae:	6a 00                	push   $0x0
801062b0:	68 ae 00 00 00       	push   $0xae
801062b5:	e9 a3 f4 ff ff       	jmp    8010575d <alltraps>

801062ba <vector175>:
801062ba:	6a 00                	push   $0x0
801062bc:	68 af 00 00 00       	push   $0xaf
801062c1:	e9 97 f4 ff ff       	jmp    8010575d <alltraps>

801062c6 <vector176>:
801062c6:	6a 00                	push   $0x0
801062c8:	68 b0 00 00 00       	push   $0xb0
801062cd:	e9 8b f4 ff ff       	jmp    8010575d <alltraps>

801062d2 <vector177>:
801062d2:	6a 00                	push   $0x0
801062d4:	68 b1 00 00 00       	push   $0xb1
801062d9:	e9 7f f4 ff ff       	jmp    8010575d <alltraps>

801062de <vector178>:
801062de:	6a 00                	push   $0x0
801062e0:	68 b2 00 00 00       	push   $0xb2
801062e5:	e9 73 f4 ff ff       	jmp    8010575d <alltraps>

801062ea <vector179>:
801062ea:	6a 00                	push   $0x0
801062ec:	68 b3 00 00 00       	push   $0xb3
801062f1:	e9 67 f4 ff ff       	jmp    8010575d <alltraps>

801062f6 <vector180>:
801062f6:	6a 00                	push   $0x0
801062f8:	68 b4 00 00 00       	push   $0xb4
801062fd:	e9 5b f4 ff ff       	jmp    8010575d <alltraps>

80106302 <vector181>:
80106302:	6a 00                	push   $0x0
80106304:	68 b5 00 00 00       	push   $0xb5
80106309:	e9 4f f4 ff ff       	jmp    8010575d <alltraps>

8010630e <vector182>:
8010630e:	6a 00                	push   $0x0
80106310:	68 b6 00 00 00       	push   $0xb6
80106315:	e9 43 f4 ff ff       	jmp    8010575d <alltraps>

8010631a <vector183>:
8010631a:	6a 00                	push   $0x0
8010631c:	68 b7 00 00 00       	push   $0xb7
80106321:	e9 37 f4 ff ff       	jmp    8010575d <alltraps>

80106326 <vector184>:
80106326:	6a 00                	push   $0x0
80106328:	68 b8 00 00 00       	push   $0xb8
8010632d:	e9 2b f4 ff ff       	jmp    8010575d <alltraps>

80106332 <vector185>:
80106332:	6a 00                	push   $0x0
80106334:	68 b9 00 00 00       	push   $0xb9
80106339:	e9 1f f4 ff ff       	jmp    8010575d <alltraps>

8010633e <vector186>:
8010633e:	6a 00                	push   $0x0
80106340:	68 ba 00 00 00       	push   $0xba
80106345:	e9 13 f4 ff ff       	jmp    8010575d <alltraps>

8010634a <vector187>:
8010634a:	6a 00                	push   $0x0
8010634c:	68 bb 00 00 00       	push   $0xbb
80106351:	e9 07 f4 ff ff       	jmp    8010575d <alltraps>

80106356 <vector188>:
80106356:	6a 00                	push   $0x0
80106358:	68 bc 00 00 00       	push   $0xbc
8010635d:	e9 fb f3 ff ff       	jmp    8010575d <alltraps>

80106362 <vector189>:
80106362:	6a 00                	push   $0x0
80106364:	68 bd 00 00 00       	push   $0xbd
80106369:	e9 ef f3 ff ff       	jmp    8010575d <alltraps>

8010636e <vector190>:
8010636e:	6a 00                	push   $0x0
80106370:	68 be 00 00 00       	push   $0xbe
80106375:	e9 e3 f3 ff ff       	jmp    8010575d <alltraps>

8010637a <vector191>:
8010637a:	6a 00                	push   $0x0
8010637c:	68 bf 00 00 00       	push   $0xbf
80106381:	e9 d7 f3 ff ff       	jmp    8010575d <alltraps>

80106386 <vector192>:
80106386:	6a 00                	push   $0x0
80106388:	68 c0 00 00 00       	push   $0xc0
8010638d:	e9 cb f3 ff ff       	jmp    8010575d <alltraps>

80106392 <vector193>:
80106392:	6a 00                	push   $0x0
80106394:	68 c1 00 00 00       	push   $0xc1
80106399:	e9 bf f3 ff ff       	jmp    8010575d <alltraps>

8010639e <vector194>:
8010639e:	6a 00                	push   $0x0
801063a0:	68 c2 00 00 00       	push   $0xc2
801063a5:	e9 b3 f3 ff ff       	jmp    8010575d <alltraps>

801063aa <vector195>:
801063aa:	6a 00                	push   $0x0
801063ac:	68 c3 00 00 00       	push   $0xc3
801063b1:	e9 a7 f3 ff ff       	jmp    8010575d <alltraps>

801063b6 <vector196>:
801063b6:	6a 00                	push   $0x0
801063b8:	68 c4 00 00 00       	push   $0xc4
801063bd:	e9 9b f3 ff ff       	jmp    8010575d <alltraps>

801063c2 <vector197>:
801063c2:	6a 00                	push   $0x0
801063c4:	68 c5 00 00 00       	push   $0xc5
801063c9:	e9 8f f3 ff ff       	jmp    8010575d <alltraps>

801063ce <vector198>:
801063ce:	6a 00                	push   $0x0
801063d0:	68 c6 00 00 00       	push   $0xc6
801063d5:	e9 83 f3 ff ff       	jmp    8010575d <alltraps>

801063da <vector199>:
801063da:	6a 00                	push   $0x0
801063dc:	68 c7 00 00 00       	push   $0xc7
801063e1:	e9 77 f3 ff ff       	jmp    8010575d <alltraps>

801063e6 <vector200>:
801063e6:	6a 00                	push   $0x0
801063e8:	68 c8 00 00 00       	push   $0xc8
801063ed:	e9 6b f3 ff ff       	jmp    8010575d <alltraps>

801063f2 <vector201>:
801063f2:	6a 00                	push   $0x0
801063f4:	68 c9 00 00 00       	push   $0xc9
801063f9:	e9 5f f3 ff ff       	jmp    8010575d <alltraps>

801063fe <vector202>:
801063fe:	6a 00                	push   $0x0
80106400:	68 ca 00 00 00       	push   $0xca
80106405:	e9 53 f3 ff ff       	jmp    8010575d <alltraps>

8010640a <vector203>:
8010640a:	6a 00                	push   $0x0
8010640c:	68 cb 00 00 00       	push   $0xcb
80106411:	e9 47 f3 ff ff       	jmp    8010575d <alltraps>

80106416 <vector204>:
80106416:	6a 00                	push   $0x0
80106418:	68 cc 00 00 00       	push   $0xcc
8010641d:	e9 3b f3 ff ff       	jmp    8010575d <alltraps>

80106422 <vector205>:
80106422:	6a 00                	push   $0x0
80106424:	68 cd 00 00 00       	push   $0xcd
80106429:	e9 2f f3 ff ff       	jmp    8010575d <alltraps>

8010642e <vector206>:
8010642e:	6a 00                	push   $0x0
80106430:	68 ce 00 00 00       	push   $0xce
80106435:	e9 23 f3 ff ff       	jmp    8010575d <alltraps>

8010643a <vector207>:
8010643a:	6a 00                	push   $0x0
8010643c:	68 cf 00 00 00       	push   $0xcf
80106441:	e9 17 f3 ff ff       	jmp    8010575d <alltraps>

80106446 <vector208>:
80106446:	6a 00                	push   $0x0
80106448:	68 d0 00 00 00       	push   $0xd0
8010644d:	e9 0b f3 ff ff       	jmp    8010575d <alltraps>

80106452 <vector209>:
80106452:	6a 00                	push   $0x0
80106454:	68 d1 00 00 00       	push   $0xd1
80106459:	e9 ff f2 ff ff       	jmp    8010575d <alltraps>

8010645e <vector210>:
8010645e:	6a 00                	push   $0x0
80106460:	68 d2 00 00 00       	push   $0xd2
80106465:	e9 f3 f2 ff ff       	jmp    8010575d <alltraps>

8010646a <vector211>:
8010646a:	6a 00                	push   $0x0
8010646c:	68 d3 00 00 00       	push   $0xd3
80106471:	e9 e7 f2 ff ff       	jmp    8010575d <alltraps>

80106476 <vector212>:
80106476:	6a 00                	push   $0x0
80106478:	68 d4 00 00 00       	push   $0xd4
8010647d:	e9 db f2 ff ff       	jmp    8010575d <alltraps>

80106482 <vector213>:
80106482:	6a 00                	push   $0x0
80106484:	68 d5 00 00 00       	push   $0xd5
80106489:	e9 cf f2 ff ff       	jmp    8010575d <alltraps>

8010648e <vector214>:
8010648e:	6a 00                	push   $0x0
80106490:	68 d6 00 00 00       	push   $0xd6
80106495:	e9 c3 f2 ff ff       	jmp    8010575d <alltraps>

8010649a <vector215>:
8010649a:	6a 00                	push   $0x0
8010649c:	68 d7 00 00 00       	push   $0xd7
801064a1:	e9 b7 f2 ff ff       	jmp    8010575d <alltraps>

801064a6 <vector216>:
801064a6:	6a 00                	push   $0x0
801064a8:	68 d8 00 00 00       	push   $0xd8
801064ad:	e9 ab f2 ff ff       	jmp    8010575d <alltraps>

801064b2 <vector217>:
801064b2:	6a 00                	push   $0x0
801064b4:	68 d9 00 00 00       	push   $0xd9
801064b9:	e9 9f f2 ff ff       	jmp    8010575d <alltraps>

801064be <vector218>:
801064be:	6a 00                	push   $0x0
801064c0:	68 da 00 00 00       	push   $0xda
801064c5:	e9 93 f2 ff ff       	jmp    8010575d <alltraps>

801064ca <vector219>:
801064ca:	6a 00                	push   $0x0
801064cc:	68 db 00 00 00       	push   $0xdb
801064d1:	e9 87 f2 ff ff       	jmp    8010575d <alltraps>

801064d6 <vector220>:
801064d6:	6a 00                	push   $0x0
801064d8:	68 dc 00 00 00       	push   $0xdc
801064dd:	e9 7b f2 ff ff       	jmp    8010575d <alltraps>

801064e2 <vector221>:
801064e2:	6a 00                	push   $0x0
801064e4:	68 dd 00 00 00       	push   $0xdd
801064e9:	e9 6f f2 ff ff       	jmp    8010575d <alltraps>

801064ee <vector222>:
801064ee:	6a 00                	push   $0x0
801064f0:	68 de 00 00 00       	push   $0xde
801064f5:	e9 63 f2 ff ff       	jmp    8010575d <alltraps>

801064fa <vector223>:
801064fa:	6a 00                	push   $0x0
801064fc:	68 df 00 00 00       	push   $0xdf
80106501:	e9 57 f2 ff ff       	jmp    8010575d <alltraps>

80106506 <vector224>:
80106506:	6a 00                	push   $0x0
80106508:	68 e0 00 00 00       	push   $0xe0
8010650d:	e9 4b f2 ff ff       	jmp    8010575d <alltraps>

80106512 <vector225>:
80106512:	6a 00                	push   $0x0
80106514:	68 e1 00 00 00       	push   $0xe1
80106519:	e9 3f f2 ff ff       	jmp    8010575d <alltraps>

8010651e <vector226>:
8010651e:	6a 00                	push   $0x0
80106520:	68 e2 00 00 00       	push   $0xe2
80106525:	e9 33 f2 ff ff       	jmp    8010575d <alltraps>

8010652a <vector227>:
8010652a:	6a 00                	push   $0x0
8010652c:	68 e3 00 00 00       	push   $0xe3
80106531:	e9 27 f2 ff ff       	jmp    8010575d <alltraps>

80106536 <vector228>:
80106536:	6a 00                	push   $0x0
80106538:	68 e4 00 00 00       	push   $0xe4
8010653d:	e9 1b f2 ff ff       	jmp    8010575d <alltraps>

80106542 <vector229>:
80106542:	6a 00                	push   $0x0
80106544:	68 e5 00 00 00       	push   $0xe5
80106549:	e9 0f f2 ff ff       	jmp    8010575d <alltraps>

8010654e <vector230>:
8010654e:	6a 00                	push   $0x0
80106550:	68 e6 00 00 00       	push   $0xe6
80106555:	e9 03 f2 ff ff       	jmp    8010575d <alltraps>

8010655a <vector231>:
8010655a:	6a 00                	push   $0x0
8010655c:	68 e7 00 00 00       	push   $0xe7
80106561:	e9 f7 f1 ff ff       	jmp    8010575d <alltraps>

80106566 <vector232>:
80106566:	6a 00                	push   $0x0
80106568:	68 e8 00 00 00       	push   $0xe8
8010656d:	e9 eb f1 ff ff       	jmp    8010575d <alltraps>

80106572 <vector233>:
80106572:	6a 00                	push   $0x0
80106574:	68 e9 00 00 00       	push   $0xe9
80106579:	e9 df f1 ff ff       	jmp    8010575d <alltraps>

8010657e <vector234>:
8010657e:	6a 00                	push   $0x0
80106580:	68 ea 00 00 00       	push   $0xea
80106585:	e9 d3 f1 ff ff       	jmp    8010575d <alltraps>

8010658a <vector235>:
8010658a:	6a 00                	push   $0x0
8010658c:	68 eb 00 00 00       	push   $0xeb
80106591:	e9 c7 f1 ff ff       	jmp    8010575d <alltraps>

80106596 <vector236>:
80106596:	6a 00                	push   $0x0
80106598:	68 ec 00 00 00       	push   $0xec
8010659d:	e9 bb f1 ff ff       	jmp    8010575d <alltraps>

801065a2 <vector237>:
801065a2:	6a 00                	push   $0x0
801065a4:	68 ed 00 00 00       	push   $0xed
801065a9:	e9 af f1 ff ff       	jmp    8010575d <alltraps>

801065ae <vector238>:
801065ae:	6a 00                	push   $0x0
801065b0:	68 ee 00 00 00       	push   $0xee
801065b5:	e9 a3 f1 ff ff       	jmp    8010575d <alltraps>

801065ba <vector239>:
801065ba:	6a 00                	push   $0x0
801065bc:	68 ef 00 00 00       	push   $0xef
801065c1:	e9 97 f1 ff ff       	jmp    8010575d <alltraps>

801065c6 <vector240>:
801065c6:	6a 00                	push   $0x0
801065c8:	68 f0 00 00 00       	push   $0xf0
801065cd:	e9 8b f1 ff ff       	jmp    8010575d <alltraps>

801065d2 <vector241>:
801065d2:	6a 00                	push   $0x0
801065d4:	68 f1 00 00 00       	push   $0xf1
801065d9:	e9 7f f1 ff ff       	jmp    8010575d <alltraps>

801065de <vector242>:
801065de:	6a 00                	push   $0x0
801065e0:	68 f2 00 00 00       	push   $0xf2
801065e5:	e9 73 f1 ff ff       	jmp    8010575d <alltraps>

801065ea <vector243>:
801065ea:	6a 00                	push   $0x0
801065ec:	68 f3 00 00 00       	push   $0xf3
801065f1:	e9 67 f1 ff ff       	jmp    8010575d <alltraps>

801065f6 <vector244>:
801065f6:	6a 00                	push   $0x0
801065f8:	68 f4 00 00 00       	push   $0xf4
801065fd:	e9 5b f1 ff ff       	jmp    8010575d <alltraps>

80106602 <vector245>:
80106602:	6a 00                	push   $0x0
80106604:	68 f5 00 00 00       	push   $0xf5
80106609:	e9 4f f1 ff ff       	jmp    8010575d <alltraps>

8010660e <vector246>:
8010660e:	6a 00                	push   $0x0
80106610:	68 f6 00 00 00       	push   $0xf6
80106615:	e9 43 f1 ff ff       	jmp    8010575d <alltraps>

8010661a <vector247>:
8010661a:	6a 00                	push   $0x0
8010661c:	68 f7 00 00 00       	push   $0xf7
80106621:	e9 37 f1 ff ff       	jmp    8010575d <alltraps>

80106626 <vector248>:
80106626:	6a 00                	push   $0x0
80106628:	68 f8 00 00 00       	push   $0xf8
8010662d:	e9 2b f1 ff ff       	jmp    8010575d <alltraps>

80106632 <vector249>:
80106632:	6a 00                	push   $0x0
80106634:	68 f9 00 00 00       	push   $0xf9
80106639:	e9 1f f1 ff ff       	jmp    8010575d <alltraps>

8010663e <vector250>:
8010663e:	6a 00                	push   $0x0
80106640:	68 fa 00 00 00       	push   $0xfa
80106645:	e9 13 f1 ff ff       	jmp    8010575d <alltraps>

8010664a <vector251>:
8010664a:	6a 00                	push   $0x0
8010664c:	68 fb 00 00 00       	push   $0xfb
80106651:	e9 07 f1 ff ff       	jmp    8010575d <alltraps>

80106656 <vector252>:
80106656:	6a 00                	push   $0x0
80106658:	68 fc 00 00 00       	push   $0xfc
8010665d:	e9 fb f0 ff ff       	jmp    8010575d <alltraps>

80106662 <vector253>:
80106662:	6a 00                	push   $0x0
80106664:	68 fd 00 00 00       	push   $0xfd
80106669:	e9 ef f0 ff ff       	jmp    8010575d <alltraps>

8010666e <vector254>:
8010666e:	6a 00                	push   $0x0
80106670:	68 fe 00 00 00       	push   $0xfe
80106675:	e9 e3 f0 ff ff       	jmp    8010575d <alltraps>

8010667a <vector255>:
8010667a:	6a 00                	push   $0x0
8010667c:	68 ff 00 00 00       	push   $0xff
80106681:	e9 d7 f0 ff ff       	jmp    8010575d <alltraps>
80106686:	66 90                	xchg   %ax,%ax
80106688:	66 90                	xchg   %ax,%ax
8010668a:	66 90                	xchg   %ax,%ax
8010668c:	66 90                	xchg   %ax,%ax
8010668e:	66 90                	xchg   %ax,%ax

80106690 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106690:	55                   	push   %ebp
80106691:	89 e5                	mov    %esp,%ebp
80106693:	57                   	push   %edi
80106694:	56                   	push   %esi
80106695:	89 d6                	mov    %edx,%esi
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106697:	c1 ea 16             	shr    $0x16,%edx
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010669a:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
8010669b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010669e:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
801066a1:	8b 1f                	mov    (%edi),%ebx
801066a3:	f6 c3 01             	test   $0x1,%bl
801066a6:	74 28                	je     801066d0 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801066a8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801066ae:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801066b4:	c1 ee 0a             	shr    $0xa,%esi
}
801066b7:	83 c4 1c             	add    $0x1c,%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801066ba:	89 f2                	mov    %esi,%edx
801066bc:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801066c2:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
801066c5:	5b                   	pop    %ebx
801066c6:	5e                   	pop    %esi
801066c7:	5f                   	pop    %edi
801066c8:	5d                   	pop    %ebp
801066c9:	c3                   	ret    
801066ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
801066d0:	85 c9                	test   %ecx,%ecx
801066d2:	74 34                	je     80106708 <walkpgdir+0x78>
801066d4:	e8 c7 bd ff ff       	call   801024a0 <kalloc>
801066d9:	85 c0                	test   %eax,%eax
801066db:	89 c3                	mov    %eax,%ebx
801066dd:	74 29                	je     80106708 <walkpgdir+0x78>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
801066df:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801066e6:	00 
801066e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801066ee:	00 
801066ef:	89 04 24             	mov    %eax,(%esp)
801066f2:	e8 59 de ff ff       	call   80104550 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
801066f7:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801066fd:	83 c8 07             	or     $0x7,%eax
80106700:	89 07                	mov    %eax,(%edi)
80106702:	eb b0                	jmp    801066b4 <walkpgdir+0x24>
80106704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
  return &pgtab[PTX(va)];
}
80106708:	83 c4 1c             	add    $0x1c,%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
8010670b:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
8010670d:	5b                   	pop    %ebx
8010670e:	5e                   	pop    %esi
8010670f:	5f                   	pop    %edi
80106710:	5d                   	pop    %ebp
80106711:	c3                   	ret    
80106712:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106720 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106720:	55                   	push   %ebp
80106721:	89 e5                	mov    %esp,%ebp
80106723:	57                   	push   %edi
80106724:	56                   	push   %esi
80106725:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106726:	89 d3                	mov    %edx,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106728:	83 ec 1c             	sub    $0x1c,%esp
8010672b:	8b 7d 08             	mov    0x8(%ebp),%edi
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
8010672e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106734:	89 45 e0             	mov    %eax,-0x20(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106737:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
8010673b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010673e:	83 4d 0c 01          	orl    $0x1,0xc(%ebp)
{
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106742:	81 65 e4 00 f0 ff ff 	andl   $0xfffff000,-0x1c(%ebp)
80106749:	29 df                	sub    %ebx,%edi
8010674b:	eb 18                	jmp    80106765 <mappages+0x45>
8010674d:	8d 76 00             	lea    0x0(%esi),%esi
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106750:	f6 00 01             	testb  $0x1,(%eax)
80106753:	75 3d                	jne    80106792 <mappages+0x72>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106755:	0b 75 0c             	or     0xc(%ebp),%esi
    if(a == last)
80106758:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010675b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010675d:	74 29                	je     80106788 <mappages+0x68>
      break;
    a += PGSIZE;
8010675f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106765:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106768:	b9 01 00 00 00       	mov    $0x1,%ecx
8010676d:	89 da                	mov    %ebx,%edx
8010676f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106772:	e8 19 ff ff ff       	call   80106690 <walkpgdir>
80106777:	85 c0                	test   %eax,%eax
80106779:	75 d5                	jne    80106750 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
8010677b:	83 c4 1c             	add    $0x1c,%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
8010677e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106783:	5b                   	pop    %ebx
80106784:	5e                   	pop    %esi
80106785:	5f                   	pop    %edi
80106786:	5d                   	pop    %ebp
80106787:	c3                   	ret    
80106788:	83 c4 1c             	add    $0x1c,%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
8010678b:	31 c0                	xor    %eax,%eax
}
8010678d:	5b                   	pop    %ebx
8010678e:	5e                   	pop    %esi
8010678f:	5f                   	pop    %edi
80106790:	5d                   	pop    %ebp
80106791:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
80106792:	c7 04 24 14 79 10 80 	movl   $0x80107914,(%esp)
80106799:	e8 c2 9b ff ff       	call   80100360 <panic>
8010679e:	66 90                	xchg   %ax,%ax

801067a0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067a0:	55                   	push   %ebp
801067a1:	89 e5                	mov    %esp,%ebp
801067a3:	57                   	push   %edi
801067a4:	89 c7                	mov    %eax,%edi
801067a6:	56                   	push   %esi
801067a7:	89 d6                	mov    %edx,%esi
801067a9:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801067aa:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067b0:	83 ec 1c             	sub    $0x1c,%esp
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801067b3:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
801067b9:	39 d3                	cmp    %edx,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067bb:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801067be:	72 3b                	jb     801067fb <deallocuvm.part.0+0x5b>
801067c0:	eb 5e                	jmp    80106820 <deallocuvm.part.0+0x80>
801067c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
801067c8:	8b 10                	mov    (%eax),%edx
801067ca:	f6 c2 01             	test   $0x1,%dl
801067cd:	74 22                	je     801067f1 <deallocuvm.part.0+0x51>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
801067cf:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801067d5:	74 54                	je     8010682b <deallocuvm.part.0+0x8b>
        panic("kfree");
      char *v = P2V(pa);
801067d7:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
801067dd:	89 14 24             	mov    %edx,(%esp)
801067e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801067e3:	e8 08 bb ff ff       	call   801022f0 <kfree>
      *pte = 0;
801067e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801067eb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801067f1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801067f7:	39 f3                	cmp    %esi,%ebx
801067f9:	73 25                	jae    80106820 <deallocuvm.part.0+0x80>
    pte = walkpgdir(pgdir, (char*)a, 0);
801067fb:	31 c9                	xor    %ecx,%ecx
801067fd:	89 da                	mov    %ebx,%edx
801067ff:	89 f8                	mov    %edi,%eax
80106801:	e8 8a fe ff ff       	call   80106690 <walkpgdir>
    if(!pte)
80106806:	85 c0                	test   %eax,%eax
80106808:	75 be                	jne    801067c8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010680a:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106810:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106816:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010681c:	39 f3                	cmp    %esi,%ebx
8010681e:	72 db                	jb     801067fb <deallocuvm.part.0+0x5b>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106820:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106823:	83 c4 1c             	add    $0x1c,%esp
80106826:	5b                   	pop    %ebx
80106827:	5e                   	pop    %esi
80106828:	5f                   	pop    %edi
80106829:	5d                   	pop    %ebp
8010682a:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
8010682b:	c7 04 24 32 72 10 80 	movl   $0x80107232,(%esp)
80106832:	e8 29 9b ff ff       	call   80100360 <panic>
80106837:	89 f6                	mov    %esi,%esi
80106839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106840 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106840:	55                   	push   %ebp
80106841:	89 e5                	mov    %esp,%ebp
80106843:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106846:	e8 15 bf ff ff       	call   80102760 <cpunum>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010684b:	31 c9                	xor    %ecx,%ecx
8010684d:	ba ff ff ff ff       	mov    $0xffffffff,%edx

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106852:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106858:	05 a0 27 11 80       	add    $0x801127a0,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010685d:	66 89 50 78          	mov    %dx,0x78(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106861:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106866:	66 89 48 7a          	mov    %cx,0x7a(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010686a:	31 c9                	xor    %ecx,%ecx
8010686c:	66 89 90 80 00 00 00 	mov    %dx,0x80(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106873:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106878:	66 89 88 82 00 00 00 	mov    %cx,0x82(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010687f:	31 c9                	xor    %ecx,%ecx
80106881:	66 89 90 90 00 00 00 	mov    %dx,0x90(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106888:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010688d:	66 89 88 92 00 00 00 	mov    %cx,0x92(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106894:	31 c9                	xor    %ecx,%ecx
80106896:	66 89 90 98 00 00 00 	mov    %dx,0x98(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
8010689d:	8d 90 b4 00 00 00    	lea    0xb4(%eax),%edx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801068a3:	66 89 88 9a 00 00 00 	mov    %cx,0x9a(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
801068aa:	31 c9                	xor    %ecx,%ecx
801068ac:	66 89 88 88 00 00 00 	mov    %cx,0x88(%eax)
801068b3:	89 d1                	mov    %edx,%ecx
801068b5:	c1 e9 10             	shr    $0x10,%ecx
801068b8:	66 89 90 8a 00 00 00 	mov    %dx,0x8a(%eax)
801068bf:	c1 ea 18             	shr    $0x18,%edx
801068c2:	88 88 8c 00 00 00    	mov    %cl,0x8c(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801068c8:	b9 37 00 00 00       	mov    $0x37,%ecx
801068cd:	88 90 8f 00 00 00    	mov    %dl,0x8f(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
801068d3:	8d 50 70             	lea    0x70(%eax),%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801068d6:	c6 40 7d 9a          	movb   $0x9a,0x7d(%eax)
801068da:	c6 40 7e cf          	movb   $0xcf,0x7e(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801068de:	c6 80 85 00 00 00 92 	movb   $0x92,0x85(%eax)
801068e5:	c6 80 86 00 00 00 cf 	movb   $0xcf,0x86(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801068ec:	c6 80 95 00 00 00 fa 	movb   $0xfa,0x95(%eax)
801068f3:	c6 80 96 00 00 00 cf 	movb   $0xcf,0x96(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801068fa:	c6 80 9d 00 00 00 f2 	movb   $0xf2,0x9d(%eax)
80106901:	c6 80 9e 00 00 00 cf 	movb   $0xcf,0x9e(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106908:	c6 80 8d 00 00 00 92 	movb   $0x92,0x8d(%eax)
8010690f:	c6 80 8e 00 00 00 c0 	movb   $0xc0,0x8e(%eax)
80106916:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  pd[1] = (uint)p;
8010691a:	66 89 55 f4          	mov    %dx,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
8010691e:	c1 ea 10             	shr    $0x10,%edx
80106921:	66 89 55 f6          	mov    %dx,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106925:	8d 55 f2             	lea    -0xe(%ebp),%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106928:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
8010692c:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106930:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
80106937:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010693e:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
80106945:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
8010694c:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
80106953:	c6 80 9f 00 00 00 00 	movb   $0x0,0x9f(%eax)
8010695a:	0f 01 12             	lgdtl  (%edx)
}

static inline void
loadgs(ushort v)
{
  asm volatile("movw %0, %%gs" : : "r" (v));
8010695d:	ba 18 00 00 00       	mov    $0x18,%edx
80106962:	8e ea                	mov    %edx,%gs
  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
80106964:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
8010696b:	00 00 00 00 

  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
8010696f:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  proc = 0;
}
80106975:	c9                   	leave  
80106976:	c3                   	ret    
80106977:	89 f6                	mov    %esi,%esi
80106979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106980 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106980:	55                   	push   %ebp
80106981:	89 e5                	mov    %esp,%ebp
80106983:	56                   	push   %esi
80106984:	53                   	push   %ebx
80106985:	83 ec 10             	sub    $0x10,%esp
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106988:	e8 13 bb ff ff       	call   801024a0 <kalloc>
8010698d:	85 c0                	test   %eax,%eax
8010698f:	89 c6                	mov    %eax,%esi
80106991:	74 55                	je     801069e8 <setupkvm+0x68>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106993:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010699a:	00 
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010699b:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
801069a0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801069a7:	00 
801069a8:	89 04 24             	mov    %eax,(%esp)
801069ab:	e8 a0 db ff ff       	call   80104550 <memset>
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
801069b0:	8b 53 0c             	mov    0xc(%ebx),%edx
801069b3:	8b 43 04             	mov    0x4(%ebx),%eax
801069b6:	8b 4b 08             	mov    0x8(%ebx),%ecx
801069b9:	89 54 24 04          	mov    %edx,0x4(%esp)
801069bd:	8b 13                	mov    (%ebx),%edx
801069bf:	89 04 24             	mov    %eax,(%esp)
801069c2:	29 c1                	sub    %eax,%ecx
801069c4:	89 f0                	mov    %esi,%eax
801069c6:	e8 55 fd ff ff       	call   80106720 <mappages>
801069cb:	85 c0                	test   %eax,%eax
801069cd:	78 19                	js     801069e8 <setupkvm+0x68>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
801069cf:	83 c3 10             	add    $0x10,%ebx
801069d2:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
801069d8:	72 d6                	jb     801069b0 <setupkvm+0x30>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
801069da:	83 c4 10             	add    $0x10,%esp
801069dd:	89 f0                	mov    %esi,%eax
801069df:	5b                   	pop    %ebx
801069e0:	5e                   	pop    %esi
801069e1:	5d                   	pop    %ebp
801069e2:	c3                   	ret    
801069e3:	90                   	nop
801069e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801069e8:	83 c4 10             	add    $0x10,%esp
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
801069eb:	31 c0                	xor    %eax,%eax
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
801069ed:	5b                   	pop    %ebx
801069ee:	5e                   	pop    %esi
801069ef:	5d                   	pop    %ebp
801069f0:	c3                   	ret    
801069f1:	eb 0d                	jmp    80106a00 <kvmalloc>
801069f3:	90                   	nop
801069f4:	90                   	nop
801069f5:	90                   	nop
801069f6:	90                   	nop
801069f7:	90                   	nop
801069f8:	90                   	nop
801069f9:	90                   	nop
801069fa:	90                   	nop
801069fb:	90                   	nop
801069fc:	90                   	nop
801069fd:	90                   	nop
801069fe:	90                   	nop
801069ff:	90                   	nop

80106a00 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106a00:	55                   	push   %ebp
80106a01:	89 e5                	mov    %esp,%ebp
80106a03:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106a06:	e8 75 ff ff ff       	call   80106980 <setupkvm>
80106a0b:	a3 24 5d 11 80       	mov    %eax,0x80115d24
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106a10:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106a15:	0f 22 d8             	mov    %eax,%cr3
void
kvmalloc(void)
{
  kpgdir = setupkvm();
  switchkvm();
}
80106a18:	c9                   	leave  
80106a19:	c3                   	ret    
80106a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106a20 <switchkvm>:
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106a20:	a1 24 5d 11 80       	mov    0x80115d24,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106a25:	55                   	push   %ebp
80106a26:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106a28:	05 00 00 00 80       	add    $0x80000000,%eax
80106a2d:	0f 22 d8             	mov    %eax,%cr3
}
80106a30:	5d                   	pop    %ebp
80106a31:	c3                   	ret    
80106a32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a40 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106a40:	55                   	push   %ebp
80106a41:	89 e5                	mov    %esp,%ebp
80106a43:	53                   	push   %ebx
80106a44:	83 ec 14             	sub    $0x14,%esp
80106a47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106a4a:	85 db                	test   %ebx,%ebx
80106a4c:	0f 84 94 00 00 00    	je     80106ae6 <switchuvm+0xa6>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80106a52:	8b 43 08             	mov    0x8(%ebx),%eax
80106a55:	85 c0                	test   %eax,%eax
80106a57:	0f 84 a1 00 00 00    	je     80106afe <switchuvm+0xbe>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
80106a5d:	8b 43 04             	mov    0x4(%ebx),%eax
80106a60:	85 c0                	test   %eax,%eax
80106a62:	0f 84 8a 00 00 00    	je     80106af2 <switchuvm+0xb2>
    panic("switchuvm: no pgdir");

  pushcli();
80106a68:	e8 13 da ff ff       	call   80104480 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106a6d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106a73:	b9 67 00 00 00       	mov    $0x67,%ecx
80106a78:	8d 50 08             	lea    0x8(%eax),%edx
80106a7b:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106a82:	89 d1                	mov    %edx,%ecx
80106a84:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106a8b:	c1 ea 18             	shr    $0x18,%edx
80106a8e:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106a94:	c1 e9 10             	shr    $0x10,%ecx
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106a97:	ba 10 00 00 00       	mov    $0x10,%edx
80106a9c:	66 89 50 10          	mov    %dx,0x10(%eax)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106aa0:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
80106aa6:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
80106aad:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106ab4:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106ab7:	8d 91 00 10 00 00    	lea    0x1000(%ecx),%edx
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106abd:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx

  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106ac2:	89 50 0c             	mov    %edx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106ac5:	66 89 48 6e          	mov    %cx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106ac9:	b8 30 00 00 00       	mov    $0x30,%eax
80106ace:	0f 00 d8             	ltr    %ax
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106ad1:	8b 43 04             	mov    0x4(%ebx),%eax
80106ad4:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106ad9:	0f 22 d8             	mov    %eax,%cr3
  popcli();
}
80106adc:	83 c4 14             	add    $0x14,%esp
80106adf:	5b                   	pop    %ebx
80106ae0:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106ae1:	e9 ca d9 ff ff       	jmp    801044b0 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106ae6:	c7 04 24 1a 79 10 80 	movl   $0x8010791a,(%esp)
80106aed:	e8 6e 98 ff ff       	call   80100360 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106af2:	c7 04 24 45 79 10 80 	movl   $0x80107945,(%esp)
80106af9:	e8 62 98 ff ff       	call   80100360 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
80106afe:	c7 04 24 30 79 10 80 	movl   $0x80107930,(%esp)
80106b05:	e8 56 98 ff ff       	call   80100360 <panic>
80106b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106b10 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106b10:	55                   	push   %ebp
80106b11:	89 e5                	mov    %esp,%ebp
80106b13:	57                   	push   %edi
80106b14:	56                   	push   %esi
80106b15:	53                   	push   %ebx
80106b16:	83 ec 1c             	sub    $0x1c,%esp
80106b19:	8b 75 10             	mov    0x10(%ebp),%esi
80106b1c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b1f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106b22:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106b28:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106b2b:	77 54                	ja     80106b81 <inituvm+0x71>
    panic("inituvm: more than a page");
  mem = kalloc();
80106b2d:	e8 6e b9 ff ff       	call   801024a0 <kalloc>
  memset(mem, 0, PGSIZE);
80106b32:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106b39:	00 
80106b3a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106b41:	00 
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106b42:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106b44:	89 04 24             	mov    %eax,(%esp)
80106b47:	e8 04 da ff ff       	call   80104550 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106b4c:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106b52:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b57:	89 04 24             	mov    %eax,(%esp)
80106b5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b5d:	31 d2                	xor    %edx,%edx
80106b5f:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
80106b66:	00 
80106b67:	e8 b4 fb ff ff       	call   80106720 <mappages>
  memmove(mem, init, sz);
80106b6c:	89 75 10             	mov    %esi,0x10(%ebp)
80106b6f:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106b72:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106b75:	83 c4 1c             	add    $0x1c,%esp
80106b78:	5b                   	pop    %ebx
80106b79:	5e                   	pop    %esi
80106b7a:	5f                   	pop    %edi
80106b7b:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106b7c:	e9 7f da ff ff       	jmp    80104600 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106b81:	c7 04 24 59 79 10 80 	movl   $0x80107959,(%esp)
80106b88:	e8 d3 97 ff ff       	call   80100360 <panic>
80106b8d:	8d 76 00             	lea    0x0(%esi),%esi

80106b90 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106b90:	55                   	push   %ebp
80106b91:	89 e5                	mov    %esp,%ebp
80106b93:	57                   	push   %edi
80106b94:	56                   	push   %esi
80106b95:	53                   	push   %ebx
80106b96:	83 ec 1c             	sub    $0x1c,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106b99:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106ba0:	0f 85 98 00 00 00    	jne    80106c3e <loaduvm+0xae>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106ba6:	8b 75 18             	mov    0x18(%ebp),%esi
80106ba9:	31 db                	xor    %ebx,%ebx
80106bab:	85 f6                	test   %esi,%esi
80106bad:	75 1a                	jne    80106bc9 <loaduvm+0x39>
80106baf:	eb 77                	jmp    80106c28 <loaduvm+0x98>
80106bb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106bb8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106bbe:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106bc4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106bc7:	76 5f                	jbe    80106c28 <loaduvm+0x98>
80106bc9:	8b 55 0c             	mov    0xc(%ebp),%edx
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106bcc:	31 c9                	xor    %ecx,%ecx
80106bce:	8b 45 08             	mov    0x8(%ebp),%eax
80106bd1:	01 da                	add    %ebx,%edx
80106bd3:	e8 b8 fa ff ff       	call   80106690 <walkpgdir>
80106bd8:	85 c0                	test   %eax,%eax
80106bda:	74 56                	je     80106c32 <loaduvm+0xa2>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106bdc:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
80106bde:	bf 00 10 00 00       	mov    $0x1000,%edi
80106be3:	8b 4d 14             	mov    0x14(%ebp),%ecx
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106be6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
80106beb:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
80106bf1:	0f 42 fe             	cmovb  %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106bf4:	05 00 00 00 80       	add    $0x80000000,%eax
80106bf9:	89 44 24 04          	mov    %eax,0x4(%esp)
80106bfd:	8b 45 10             	mov    0x10(%ebp),%eax
80106c00:	01 d9                	add    %ebx,%ecx
80106c02:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80106c06:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80106c0a:	89 04 24             	mov    %eax,(%esp)
80106c0d:	e8 3e ad ff ff       	call   80101950 <readi>
80106c12:	39 f8                	cmp    %edi,%eax
80106c14:	74 a2                	je     80106bb8 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106c16:	83 c4 1c             	add    $0x1c,%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106c19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106c1e:	5b                   	pop    %ebx
80106c1f:	5e                   	pop    %esi
80106c20:	5f                   	pop    %edi
80106c21:	5d                   	pop    %ebp
80106c22:	c3                   	ret    
80106c23:	90                   	nop
80106c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106c28:	83 c4 1c             	add    $0x1c,%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106c2b:	31 c0                	xor    %eax,%eax
}
80106c2d:	5b                   	pop    %ebx
80106c2e:	5e                   	pop    %esi
80106c2f:	5f                   	pop    %edi
80106c30:	5d                   	pop    %ebp
80106c31:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106c32:	c7 04 24 73 79 10 80 	movl   $0x80107973,(%esp)
80106c39:	e8 22 97 ff ff       	call   80100360 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106c3e:	c7 04 24 14 7a 10 80 	movl   $0x80107a14,(%esp)
80106c45:	e8 16 97 ff ff       	call   80100360 <panic>
80106c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106c50 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106c50:	55                   	push   %ebp
80106c51:	89 e5                	mov    %esp,%ebp
80106c53:	57                   	push   %edi
80106c54:	56                   	push   %esi
80106c55:	53                   	push   %ebx
80106c56:	83 ec 1c             	sub    $0x1c,%esp
80106c59:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106c5c:	85 ff                	test   %edi,%edi
80106c5e:	0f 88 7e 00 00 00    	js     80106ce2 <allocuvm+0x92>
    return 0;
  if(newsz < oldsz)
80106c64:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106c67:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106c6a:	72 78                	jb     80106ce4 <allocuvm+0x94>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106c6c:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106c72:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106c78:	39 df                	cmp    %ebx,%edi
80106c7a:	77 4a                	ja     80106cc6 <allocuvm+0x76>
80106c7c:	eb 72                	jmp    80106cf0 <allocuvm+0xa0>
80106c7e:	66 90                	xchg   %ax,%ax
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106c80:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106c87:	00 
80106c88:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106c8f:	00 
80106c90:	89 04 24             	mov    %eax,(%esp)
80106c93:	e8 b8 d8 ff ff       	call   80104550 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106c98:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106c9e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106ca3:	89 04 24             	mov    %eax,(%esp)
80106ca6:	8b 45 08             	mov    0x8(%ebp),%eax
80106ca9:	89 da                	mov    %ebx,%edx
80106cab:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
80106cb2:	00 
80106cb3:	e8 68 fa ff ff       	call   80106720 <mappages>
80106cb8:	85 c0                	test   %eax,%eax
80106cba:	78 44                	js     80106d00 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106cbc:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106cc2:	39 df                	cmp    %ebx,%edi
80106cc4:	76 2a                	jbe    80106cf0 <allocuvm+0xa0>
    mem = kalloc();
80106cc6:	e8 d5 b7 ff ff       	call   801024a0 <kalloc>
    if(mem == 0){
80106ccb:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106ccd:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106ccf:	75 af                	jne    80106c80 <allocuvm+0x30>
      cprintf("allocuvm out of memory\n");
80106cd1:	c7 04 24 91 79 10 80 	movl   $0x80107991,(%esp)
80106cd8:	e8 73 99 ff ff       	call   80100650 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106cdd:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106ce0:	77 48                	ja     80106d2a <allocuvm+0xda>
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106ce2:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106ce4:	83 c4 1c             	add    $0x1c,%esp
80106ce7:	5b                   	pop    %ebx
80106ce8:	5e                   	pop    %esi
80106ce9:	5f                   	pop    %edi
80106cea:	5d                   	pop    %ebp
80106ceb:	c3                   	ret    
80106cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106cf0:	83 c4 1c             	add    $0x1c,%esp
80106cf3:	89 f8                	mov    %edi,%eax
80106cf5:	5b                   	pop    %ebx
80106cf6:	5e                   	pop    %esi
80106cf7:	5f                   	pop    %edi
80106cf8:	5d                   	pop    %ebp
80106cf9:	c3                   	ret    
80106cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106d00:	c7 04 24 a9 79 10 80 	movl   $0x801079a9,(%esp)
80106d07:	e8 44 99 ff ff       	call   80100650 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106d0c:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106d0f:	76 0d                	jbe    80106d1e <allocuvm+0xce>
80106d11:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106d14:	89 fa                	mov    %edi,%edx
80106d16:	8b 45 08             	mov    0x8(%ebp),%eax
80106d19:	e8 82 fa ff ff       	call   801067a0 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106d1e:	89 34 24             	mov    %esi,(%esp)
80106d21:	e8 ca b5 ff ff       	call   801022f0 <kfree>
      return 0;
80106d26:	31 c0                	xor    %eax,%eax
80106d28:	eb ba                	jmp    80106ce4 <allocuvm+0x94>
80106d2a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106d2d:	89 fa                	mov    %edi,%edx
80106d2f:	8b 45 08             	mov    0x8(%ebp),%eax
80106d32:	e8 69 fa ff ff       	call   801067a0 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106d37:	31 c0                	xor    %eax,%eax
80106d39:	eb a9                	jmp    80106ce4 <allocuvm+0x94>
80106d3b:	90                   	nop
80106d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106d40 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106d40:	55                   	push   %ebp
80106d41:	89 e5                	mov    %esp,%ebp
80106d43:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d46:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106d49:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106d4c:	39 d1                	cmp    %edx,%ecx
80106d4e:	73 08                	jae    80106d58 <deallocuvm+0x18>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106d50:	5d                   	pop    %ebp
80106d51:	e9 4a fa ff ff       	jmp    801067a0 <deallocuvm.part.0>
80106d56:	66 90                	xchg   %ax,%ax
80106d58:	89 d0                	mov    %edx,%eax
80106d5a:	5d                   	pop    %ebp
80106d5b:	c3                   	ret    
80106d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106d60 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106d60:	55                   	push   %ebp
80106d61:	89 e5                	mov    %esp,%ebp
80106d63:	56                   	push   %esi
80106d64:	53                   	push   %ebx
80106d65:	83 ec 10             	sub    $0x10,%esp
80106d68:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106d6b:	85 f6                	test   %esi,%esi
80106d6d:	74 59                	je     80106dc8 <freevm+0x68>
80106d6f:	31 c9                	xor    %ecx,%ecx
80106d71:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106d76:	89 f0                	mov    %esi,%eax
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106d78:	31 db                	xor    %ebx,%ebx
80106d7a:	e8 21 fa ff ff       	call   801067a0 <deallocuvm.part.0>
80106d7f:	eb 12                	jmp    80106d93 <freevm+0x33>
80106d81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d88:	83 c3 01             	add    $0x1,%ebx
80106d8b:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80106d91:	74 27                	je     80106dba <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106d93:	8b 14 9e             	mov    (%esi,%ebx,4),%edx
80106d96:	f6 c2 01             	test   $0x1,%dl
80106d99:	74 ed                	je     80106d88 <freevm+0x28>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106d9b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106da1:	83 c3 01             	add    $0x1,%ebx
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106da4:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
80106daa:	89 14 24             	mov    %edx,(%esp)
80106dad:	e8 3e b5 ff ff       	call   801022f0 <kfree>
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106db2:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80106db8:	75 d9                	jne    80106d93 <freevm+0x33>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106dba:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106dbd:	83 c4 10             	add    $0x10,%esp
80106dc0:	5b                   	pop    %ebx
80106dc1:	5e                   	pop    %esi
80106dc2:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106dc3:	e9 28 b5 ff ff       	jmp    801022f0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106dc8:	c7 04 24 c5 79 10 80 	movl   $0x801079c5,(%esp)
80106dcf:	e8 8c 95 ff ff       	call   80100360 <panic>
80106dd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106dda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106de0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106de0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106de1:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106de3:	89 e5                	mov    %esp,%ebp
80106de5:	83 ec 18             	sub    $0x18,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106de8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106deb:	8b 45 08             	mov    0x8(%ebp),%eax
80106dee:	e8 9d f8 ff ff       	call   80106690 <walkpgdir>
  if(pte == 0)
80106df3:	85 c0                	test   %eax,%eax
80106df5:	74 05                	je     80106dfc <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106df7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106dfa:	c9                   	leave  
80106dfb:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106dfc:	c7 04 24 d6 79 10 80 	movl   $0x801079d6,(%esp)
80106e03:	e8 58 95 ff ff       	call   80100360 <panic>
80106e08:	90                   	nop
80106e09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106e10 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106e10:	55                   	push   %ebp
80106e11:	89 e5                	mov    %esp,%ebp
80106e13:	57                   	push   %edi
80106e14:	56                   	push   %esi
80106e15:	53                   	push   %ebx
80106e16:	83 ec 2c             	sub    $0x2c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106e19:	e8 62 fb ff ff       	call   80106980 <setupkvm>
80106e1e:	85 c0                	test   %eax,%eax
80106e20:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106e23:	0f 84 b2 00 00 00    	je     80106edb <copyuvm+0xcb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106e29:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e2c:	85 c0                	test   %eax,%eax
80106e2e:	0f 84 9c 00 00 00    	je     80106ed0 <copyuvm+0xc0>
80106e34:	31 db                	xor    %ebx,%ebx
80106e36:	eb 48                	jmp    80106e80 <copyuvm+0x70>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106e38:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106e3e:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106e45:	00 
80106e46:	89 7c 24 04          	mov    %edi,0x4(%esp)
80106e4a:	89 04 24             	mov    %eax,(%esp)
80106e4d:	e8 ae d7 ff ff       	call   80104600 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80106e52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106e55:	8d 96 00 00 00 80    	lea    -0x80000000(%esi),%edx
80106e5b:	89 14 24             	mov    %edx,(%esp)
80106e5e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e63:	89 da                	mov    %ebx,%edx
80106e65:	89 44 24 04          	mov    %eax,0x4(%esp)
80106e69:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e6c:	e8 af f8 ff ff       	call   80106720 <mappages>
80106e71:	85 c0                	test   %eax,%eax
80106e73:	78 41                	js     80106eb6 <copyuvm+0xa6>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106e75:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e7b:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
80106e7e:	76 50                	jbe    80106ed0 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106e80:	8b 45 08             	mov    0x8(%ebp),%eax
80106e83:	31 c9                	xor    %ecx,%ecx
80106e85:	89 da                	mov    %ebx,%edx
80106e87:	e8 04 f8 ff ff       	call   80106690 <walkpgdir>
80106e8c:	85 c0                	test   %eax,%eax
80106e8e:	74 5b                	je     80106eeb <copyuvm+0xdb>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106e90:	8b 30                	mov    (%eax),%esi
80106e92:	f7 c6 01 00 00 00    	test   $0x1,%esi
80106e98:	74 45                	je     80106edf <copyuvm+0xcf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106e9a:	89 f7                	mov    %esi,%edi
    flags = PTE_FLAGS(*pte);
80106e9c:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
80106ea2:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106ea5:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
80106eab:	e8 f0 b5 ff ff       	call   801024a0 <kalloc>
80106eb0:	85 c0                	test   %eax,%eax
80106eb2:	89 c6                	mov    %eax,%esi
80106eb4:	75 82                	jne    80106e38 <copyuvm+0x28>
      goto bad;
  }
  return d;

bad:
  freevm(d);
80106eb6:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106eb9:	89 04 24             	mov    %eax,(%esp)
80106ebc:	e8 9f fe ff ff       	call   80106d60 <freevm>
  return 0;
80106ec1:	31 c0                	xor    %eax,%eax
}
80106ec3:	83 c4 2c             	add    $0x2c,%esp
80106ec6:	5b                   	pop    %ebx
80106ec7:	5e                   	pop    %esi
80106ec8:	5f                   	pop    %edi
80106ec9:	5d                   	pop    %ebp
80106eca:	c3                   	ret    
80106ecb:	90                   	nop
80106ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106ed0:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106ed3:	83 c4 2c             	add    $0x2c,%esp
80106ed6:	5b                   	pop    %ebx
80106ed7:	5e                   	pop    %esi
80106ed8:	5f                   	pop    %edi
80106ed9:	5d                   	pop    %ebp
80106eda:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106edb:	31 c0                	xor    %eax,%eax
80106edd:	eb e4                	jmp    80106ec3 <copyuvm+0xb3>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106edf:	c7 04 24 fa 79 10 80 	movl   $0x801079fa,(%esp)
80106ee6:	e8 75 94 ff ff       	call   80100360 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106eeb:	c7 04 24 e0 79 10 80 	movl   $0x801079e0,(%esp)
80106ef2:	e8 69 94 ff ff       	call   80100360 <panic>
80106ef7:	89 f6                	mov    %esi,%esi
80106ef9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106f00 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106f00:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f01:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106f03:	89 e5                	mov    %esp,%ebp
80106f05:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f08:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f0b:	8b 45 08             	mov    0x8(%ebp),%eax
80106f0e:	e8 7d f7 ff ff       	call   80106690 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106f13:	8b 00                	mov    (%eax),%eax
80106f15:	89 c2                	mov    %eax,%edx
80106f17:	83 e2 05             	and    $0x5,%edx
    return 0;
  if((*pte & PTE_U) == 0)
80106f1a:	83 fa 05             	cmp    $0x5,%edx
80106f1d:	75 11                	jne    80106f30 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106f1f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106f24:	05 00 00 00 80       	add    $0x80000000,%eax
}
80106f29:	c9                   	leave  
80106f2a:	c3                   	ret    
80106f2b:	90                   	nop
80106f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80106f30:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80106f32:	c9                   	leave  
80106f33:	c3                   	ret    
80106f34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106f3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106f40 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106f40:	55                   	push   %ebp
80106f41:	89 e5                	mov    %esp,%ebp
80106f43:	57                   	push   %edi
80106f44:	56                   	push   %esi
80106f45:	53                   	push   %ebx
80106f46:	83 ec 1c             	sub    $0x1c,%esp
80106f49:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106f4c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f4f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106f52:	85 db                	test   %ebx,%ebx
80106f54:	75 3a                	jne    80106f90 <copyout+0x50>
80106f56:	eb 68                	jmp    80106fc0 <copyout+0x80>
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106f58:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106f5b:	89 f2                	mov    %esi,%edx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106f5d:	89 7c 24 04          	mov    %edi,0x4(%esp)
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106f61:	29 ca                	sub    %ecx,%edx
80106f63:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106f69:	39 da                	cmp    %ebx,%edx
80106f6b:	0f 47 d3             	cmova  %ebx,%edx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106f6e:	29 f1                	sub    %esi,%ecx
80106f70:	01 c8                	add    %ecx,%eax
80106f72:	89 54 24 08          	mov    %edx,0x8(%esp)
80106f76:	89 04 24             	mov    %eax,(%esp)
80106f79:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106f7c:	e8 7f d6 ff ff       	call   80104600 <memmove>
    len -= n;
    buf += n;
80106f81:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    va = va0 + PGSIZE;
80106f84:	8d 8e 00 10 00 00    	lea    0x1000(%esi),%ecx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80106f8a:	01 d7                	add    %edx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106f8c:	29 d3                	sub    %edx,%ebx
80106f8e:	74 30                	je     80106fc0 <copyout+0x80>
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
80106f90:	8b 45 08             	mov    0x8(%ebp),%eax
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
80106f93:	89 ce                	mov    %ecx,%esi
80106f95:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106f9b:	89 74 24 04          	mov    %esi,0x4(%esp)
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
80106f9f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    pa0 = uva2ka(pgdir, (char*)va0);
80106fa2:	89 04 24             	mov    %eax,(%esp)
80106fa5:	e8 56 ff ff ff       	call   80106f00 <uva2ka>
    if(pa0 == 0)
80106faa:	85 c0                	test   %eax,%eax
80106fac:	75 aa                	jne    80106f58 <copyout+0x18>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106fae:	83 c4 1c             	add    $0x1c,%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80106fb1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106fb6:	5b                   	pop    %ebx
80106fb7:	5e                   	pop    %esi
80106fb8:	5f                   	pop    %edi
80106fb9:	5d                   	pop    %ebp
80106fba:	c3                   	ret    
80106fbb:	90                   	nop
80106fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106fc0:	83 c4 1c             	add    $0x1c,%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
80106fc3:	31 c0                	xor    %eax,%eax
}
80106fc5:	5b                   	pop    %ebx
80106fc6:	5e                   	pop    %esi
80106fc7:	5f                   	pop    %edi
80106fc8:	5d                   	pop    %ebp
80106fc9:	c3                   	ret    
