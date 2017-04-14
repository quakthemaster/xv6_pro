
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
8010002d:	b8 c0 2e 10 80       	mov    $0x80102ec0,%eax
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
8010004c:	68 60 6f 10 80       	push   $0x80106f60
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 d5 41 00 00       	call   80104230 <initlock>
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
80100092:	68 67 6f 10 80       	push   $0x80106f67
80100097:	50                   	push   %eax
80100098:	e8 83 40 00 00       	call   80104120 <initsleeplock>
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
801000e4:	e8 67 41 00 00       	call   80104250 <acquire>
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
80100162:	e8 c9 42 00 00       	call   80104430 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 ee 3f 00 00       	call   80104160 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 3d 1f 00 00       	call   801020c0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 6e 6f 10 80       	push   $0x80106f6e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 4d 40 00 00       	call   80104200 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 f7 1e 00 00       	jmp    801020c0 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 7f 6f 10 80       	push   $0x80106f7f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
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
801001ef:	e8 0c 40 00 00       	call   80104200 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 bc 3f 00 00       	call   801041c0 <releasesleep>
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 40 40 00 00       	call   80104250 <acquire>
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
8010025c:	e9 cf 41 00 00       	jmp    80104430 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 86 6f 10 80       	push   $0x80106f86
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 ab 14 00 00       	call   80101730 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 bf 3f 00 00       	call   80104250 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
801002a1:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002a6:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 c0 ff 10 80       	push   $0x8010ffc0
801002bd:	e8 0e 3b 00 00       	call   80103dd0 <sleep>
801002c2:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
801002d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002d8:	8b 40 24             	mov    0x24(%eax),%eax
801002db:	85 c0                	test   %eax,%eax
801002dd:	74 d1                	je     801002b0 <consoleread+0x40>
801002df:	83 ec 0c             	sub    $0xc,%esp
801002e2:	68 20 a5 10 80       	push   $0x8010a520
801002e7:	e8 44 41 00 00       	call   80104430 <release>
801002ec:	89 3c 24             	mov    %edi,(%esp)
801002ef:	e8 5c 13 00 00       	call   80101650 <ilock>
801002f4:	83 c4 10             	add    $0x10,%esp
801002f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002ff:	5b                   	pop    %ebx
80100300:	5e                   	pop    %esi
80100301:	5f                   	pop    %edi
80100302:	5d                   	pop    %ebp
80100303:	c3                   	ret    
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 40 ff 10 80 	movsbl -0x7fef00c0(%edx),%edx
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
80100322:	83 c6 01             	add    $0x1,%esi
80100325:	83 eb 01             	sub    $0x1,%ebx
80100328:	83 fa 0a             	cmp    $0xa,%edx
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 e5 40 00 00       	call   80104430 <release>
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 fd 12 00 00       	call   80101650 <ilock>
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a1                	jmp    801002fc <consoleread+0x8c>
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
80100360:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 38             	sub    $0x38,%esp
80100378:	fa                   	cli    
80100379:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010037f:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100386:	00 00 00 
80100389:	8d 5d d0             	lea    -0x30(%ebp),%ebx
8010038c:	8d 75 f8             	lea    -0x8(%ebp),%esi
8010038f:	0f b6 00             	movzbl (%eax),%eax
80100392:	50                   	push   %eax
80100393:	68 8d 6f 10 80       	push   $0x80106f8d
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
801003a6:	c7 04 24 86 74 10 80 	movl   $0x80107486,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 62 3f 00 00       	call   80104320 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 a9 6f 10 80       	push   $0x80106fa9
801003d5:	e8 86 02 00 00       	call   80100660 <cprintf>
801003da:	83 c4 10             	add    $0x10,%esp
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
801003e1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e8:	00 00 00 
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 11 57 00 00       	call   80105b30 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
80100437:	0f b6 c0             	movzbl %al,%eax
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 58 56 00 00       	call   80105b30 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 4c 56 00 00       	call   80105b30 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 40 56 00 00       	call   80105b30 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
801004f8:	83 ec 04             	sub    $0x4,%esp
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
80100514:	e8 17 40 00 00       	call   80104530 <memmove>
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 52 3f 00 00       	call   80104480 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 ad 6f 10 80       	push   $0x80106fad
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 d8 6f 10 80 	movzbl -0x7fef9028(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	ff 75 08             	pushl  0x8(%ebp)
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
8010060f:	e8 1c 11 00 00       	call   80101730 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 30 3c 00 00       	call   80104250 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 e4 3d 00 00       	call   80104430 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 fb 0f 00 00       	call   80101650 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 1e 3d 00 00       	call   80104430 <release>
80100712:	83 c4 10             	add    $0x10,%esp
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100788:	b8 c0 6f 10 80       	mov    $0x80106fc0,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 83 3a 00 00       	call   80104250 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 c7 6f 10 80       	push   $0x80106fc7
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
801007f6:	31 f6                	xor    %esi,%esi
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 48 3a 00 00       	call   80104250 <acquire>
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
80100831:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100836:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 c3 3b 00 00       	call   80104430 <release>
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
801008a5:	83 ff 0d             	cmp    $0xd,%edi
801008a8:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 c8 ff 10 80    	cmp    %eax,0x8010ffc8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
801008e9:	83 ec 0c             	sub    $0xc,%esp
801008ec:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
801008f1:	68 c0 ff 10 80       	push   $0x8010ffc0
801008f6:	e8 75 36 00 00       	call   80103f70 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100908:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010090d:	39 05 c4 ff 10 80    	cmp    %eax,0x8010ffc4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100920:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
8010092f:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100934:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
80100948:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
80100977:	e9 e4 36 00 00       	jmp    80104060 <procdump>
8010097c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
801009a6:	68 d0 6f 10 80       	push   $0x80106fd0
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 7b 38 00 00       	call   80104230 <initlock>
801009b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801009bc:	c7 05 8c 09 11 80 00 	movl   $0x80100600,0x8011098c
801009c3:	06 10 80 
801009c6:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
801009cd:	02 10 80 
801009d0:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d7:	00 00 00 
801009da:	e8 a1 28 00 00       	call   80103280 <picenable>
801009df:	58                   	pop    %eax
801009e0:	5a                   	pop    %edx
801009e1:	6a 00                	push   $0x0
801009e3:	6a 01                	push   $0x1
801009e5:	e8 96 18 00 00       	call   80102280 <ioapicenable>
801009ea:	83 c4 10             	add    $0x10,%esp
801009ed:	c9                   	leave  
801009ee:	c3                   	ret    
801009ef:	90                   	nop

801009f0 <exec>:
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
801009fc:	e8 af 21 00 00       	call   80102bb0 <begin_op>
80100a01:	83 ec 0c             	sub    $0xc,%esp
80100a04:	ff 75 08             	pushl  0x8(%ebp)
80100a07:	e8 74 14 00 00       	call   80101e80 <namei>
80100a0c:	83 c4 10             	add    $0x10,%esp
80100a0f:	85 c0                	test   %eax,%eax
80100a11:	0f 84 9f 01 00 00    	je     80100bb6 <exec+0x1c6>
80100a17:	83 ec 0c             	sub    $0xc,%esp
80100a1a:	89 c3                	mov    %eax,%ebx
80100a1c:	50                   	push   %eax
80100a1d:	e8 2e 0c 00 00       	call   80101650 <ilock>
80100a22:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a28:	6a 34                	push   $0x34
80100a2a:	6a 00                	push   $0x0
80100a2c:	50                   	push   %eax
80100a2d:	53                   	push   %ebx
80100a2e:	e8 dd 0e 00 00       	call   80101910 <readi>
80100a33:	83 c4 20             	add    $0x20,%esp
80100a36:	83 f8 34             	cmp    $0x34,%eax
80100a39:	74 25                	je     80100a60 <exec+0x70>
80100a3b:	83 ec 0c             	sub    $0xc,%esp
80100a3e:	53                   	push   %ebx
80100a3f:	e8 7c 0e 00 00       	call   801018c0 <iunlockput>
80100a44:	e8 d7 21 00 00       	call   80102c20 <end_op>
80100a49:	83 c4 10             	add    $0x10,%esp
80100a4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a54:	5b                   	pop    %ebx
80100a55:	5e                   	pop    %esi
80100a56:	5f                   	pop    %edi
80100a57:	5d                   	pop    %ebp
80100a58:	c3                   	ret    
80100a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a60:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a67:	45 4c 46 
80100a6a:	75 cf                	jne    80100a3b <exec+0x4b>
80100a6c:	e8 7f 5e 00 00       	call   801068f0 <setupkvm>
80100a71:	85 c0                	test   %eax,%eax
80100a73:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a79:	74 c0                	je     80100a3b <exec+0x4b>
80100a7b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a82:	00 
80100a83:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a89:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a90:	00 00 00 
80100a93:	0f 84 c5 00 00 00    	je     80100b5e <exec+0x16e>
80100a99:	31 ff                	xor    %edi,%edi
80100a9b:	eb 18                	jmp    80100ab5 <exec+0xc5>
80100a9d:	8d 76 00             	lea    0x0(%esi),%esi
80100aa0:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aa7:	83 c7 01             	add    $0x1,%edi
80100aaa:	83 c6 20             	add    $0x20,%esi
80100aad:	39 f8                	cmp    %edi,%eax
80100aaf:	0f 8e a9 00 00 00    	jle    80100b5e <exec+0x16e>
80100ab5:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100abb:	6a 20                	push   $0x20
80100abd:	56                   	push   %esi
80100abe:	50                   	push   %eax
80100abf:	53                   	push   %ebx
80100ac0:	e8 4b 0e 00 00       	call   80101910 <readi>
80100ac5:	83 c4 10             	add    $0x10,%esp
80100ac8:	83 f8 20             	cmp    $0x20,%eax
80100acb:	75 7b                	jne    80100b48 <exec+0x158>
80100acd:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100ad4:	75 ca                	jne    80100aa0 <exec+0xb0>
80100ad6:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100adc:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ae2:	72 64                	jb     80100b48 <exec+0x158>
80100ae4:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100aea:	72 5c                	jb     80100b48 <exec+0x158>
80100aec:	83 ec 04             	sub    $0x4,%esp
80100aef:	50                   	push   %eax
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100afc:	e8 af 60 00 00       	call   80106bb0 <allocuvm>
80100b01:	83 c4 10             	add    $0x10,%esp
80100b04:	85 c0                	test   %eax,%eax
80100b06:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b0c:	74 3a                	je     80100b48 <exec+0x158>
80100b0e:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b14:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b19:	75 2d                	jne    80100b48 <exec+0x158>
80100b1b:	83 ec 0c             	sub    $0xc,%esp
80100b1e:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b24:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b2a:	53                   	push   %ebx
80100b2b:	50                   	push   %eax
80100b2c:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b32:	e8 b9 5f 00 00       	call   80106af0 <loaduvm>
80100b37:	83 c4 20             	add    $0x20,%esp
80100b3a:	85 c0                	test   %eax,%eax
80100b3c:	0f 89 5e ff ff ff    	jns    80100aa0 <exec+0xb0>
80100b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100b48:	83 ec 0c             	sub    $0xc,%esp
80100b4b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b51:	e8 8a 61 00 00       	call   80106ce0 <freevm>
80100b56:	83 c4 10             	add    $0x10,%esp
80100b59:	e9 dd fe ff ff       	jmp    80100a3b <exec+0x4b>
80100b5e:	83 ec 0c             	sub    $0xc,%esp
80100b61:	53                   	push   %ebx
80100b62:	e8 59 0d 00 00       	call   801018c0 <iunlockput>
80100b67:	e8 b4 20 00 00       	call   80102c20 <end_op>
80100b6c:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b72:	83 c4 0c             	add    $0xc,%esp
80100b75:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b7a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100b7f:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b85:	52                   	push   %edx
80100b86:	50                   	push   %eax
80100b87:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b8d:	e8 1e 60 00 00       	call   80106bb0 <allocuvm>
80100b92:	83 c4 10             	add    $0x10,%esp
80100b95:	85 c0                	test   %eax,%eax
80100b97:	89 c6                	mov    %eax,%esi
80100b99:	75 2a                	jne    80100bc5 <exec+0x1d5>
80100b9b:	83 ec 0c             	sub    $0xc,%esp
80100b9e:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ba4:	e8 37 61 00 00       	call   80106ce0 <freevm>
80100ba9:	83 c4 10             	add    $0x10,%esp
80100bac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb1:	e9 9b fe ff ff       	jmp    80100a51 <exec+0x61>
80100bb6:	e8 65 20 00 00       	call   80102c20 <end_op>
80100bbb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bc0:	e9 8c fe ff ff       	jmp    80100a51 <exec+0x61>
80100bc5:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bcb:	83 ec 08             	sub    $0x8,%esp
80100bce:	31 ff                	xor    %edi,%edi
80100bd0:	89 f3                	mov    %esi,%ebx
80100bd2:	50                   	push   %eax
80100bd3:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bd9:	e8 82 61 00 00       	call   80106d60 <clearpteu>
80100bde:	8b 45 0c             	mov    0xc(%ebp),%eax
80100be1:	83 c4 10             	add    $0x10,%esp
80100be4:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100bea:	8b 00                	mov    (%eax),%eax
80100bec:	85 c0                	test   %eax,%eax
80100bee:	74 6d                	je     80100c5d <exec+0x26d>
80100bf0:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100bf6:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100bfc:	eb 07                	jmp    80100c05 <exec+0x215>
80100bfe:	66 90                	xchg   %ax,%ax
80100c00:	83 ff 20             	cmp    $0x20,%edi
80100c03:	74 96                	je     80100b9b <exec+0x1ab>
80100c05:	83 ec 0c             	sub    $0xc,%esp
80100c08:	50                   	push   %eax
80100c09:	e8 b2 3a 00 00       	call   801046c0 <strlen>
80100c0e:	f7 d0                	not    %eax
80100c10:	01 c3                	add    %eax,%ebx
80100c12:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c15:	5a                   	pop    %edx
80100c16:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c19:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c1c:	e8 9f 3a 00 00       	call   801046c0 <strlen>
80100c21:	83 c0 01             	add    $0x1,%eax
80100c24:	50                   	push   %eax
80100c25:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c28:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c2b:	53                   	push   %ebx
80100c2c:	56                   	push   %esi
80100c2d:	e8 8e 62 00 00       	call   80106ec0 <copyout>
80100c32:	83 c4 20             	add    $0x20,%esp
80100c35:	85 c0                	test   %eax,%eax
80100c37:	0f 88 5e ff ff ff    	js     80100b9b <exec+0x1ab>
80100c3d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c40:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c47:	83 c7 01             	add    $0x1,%edi
80100c4a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c50:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c53:	85 c0                	test   %eax,%eax
80100c55:	75 a9                	jne    80100c00 <exec+0x210>
80100c57:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c5d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c64:	89 d9                	mov    %ebx,%ecx
80100c66:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c6d:	00 00 00 00 
80100c71:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c78:	ff ff ff 
80100c7b:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100c81:	29 c1                	sub    %eax,%ecx
80100c83:	83 c0 0c             	add    $0xc,%eax
80100c86:	29 c3                	sub    %eax,%ebx
80100c88:	50                   	push   %eax
80100c89:	52                   	push   %edx
80100c8a:	53                   	push   %ebx
80100c8b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100c91:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100c97:	e8 24 62 00 00       	call   80106ec0 <copyout>
80100c9c:	83 c4 10             	add    $0x10,%esp
80100c9f:	85 c0                	test   %eax,%eax
80100ca1:	0f 88 f4 fe ff ff    	js     80100b9b <exec+0x1ab>
80100ca7:	8b 45 08             	mov    0x8(%ebp),%eax
80100caa:	0f b6 10             	movzbl (%eax),%edx
80100cad:	84 d2                	test   %dl,%dl
80100caf:	74 19                	je     80100cca <exec+0x2da>
80100cb1:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cb4:	83 c0 01             	add    $0x1,%eax
80100cb7:	80 fa 2f             	cmp    $0x2f,%dl
80100cba:	0f b6 10             	movzbl (%eax),%edx
80100cbd:	0f 44 c8             	cmove  %eax,%ecx
80100cc0:	83 c0 01             	add    $0x1,%eax
80100cc3:	84 d2                	test   %dl,%dl
80100cc5:	75 f0                	jne    80100cb7 <exec+0x2c7>
80100cc7:	89 4d 08             	mov    %ecx,0x8(%ebp)
80100cca:	50                   	push   %eax
80100ccb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cd1:	6a 10                	push   $0x10
80100cd3:	ff 75 08             	pushl  0x8(%ebp)
80100cd6:	83 c0 6c             	add    $0x6c,%eax
80100cd9:	50                   	push   %eax
80100cda:	e8 a1 39 00 00       	call   80104680 <safestrcpy>
80100cdf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100ce5:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100ceb:	8b 78 04             	mov    0x4(%eax),%edi
80100cee:	89 30                	mov    %esi,(%eax)
80100cf0:	89 48 04             	mov    %ecx,0x4(%eax)
80100cf3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cf9:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100cff:	8b 50 18             	mov    0x18(%eax),%edx
80100d02:	89 4a 38             	mov    %ecx,0x38(%edx)
80100d05:	8b 50 18             	mov    0x18(%eax),%edx
80100d08:	89 5a 44             	mov    %ebx,0x44(%edx)
80100d0b:	89 04 24             	mov    %eax,(%esp)
80100d0e:	e8 8d 5c 00 00       	call   801069a0 <switchuvm>
80100d13:	89 3c 24             	mov    %edi,(%esp)
80100d16:	e8 c5 5f 00 00       	call   80106ce0 <freevm>
80100d1b:	83 c4 10             	add    $0x10,%esp
80100d1e:	31 c0                	xor    %eax,%eax
80100d20:	e9 2c fd ff ff       	jmp    80100a51 <exec+0x61>
80100d25:	66 90                	xchg   %ax,%ax
80100d27:	66 90                	xchg   %ax,%ax
80100d29:	66 90                	xchg   %ax,%ax
80100d2b:	66 90                	xchg   %ax,%ax
80100d2d:	66 90                	xchg   %ax,%ax
80100d2f:	90                   	nop

80100d30 <fileinit>:
80100d30:	55                   	push   %ebp
80100d31:	89 e5                	mov    %esp,%ebp
80100d33:	83 ec 10             	sub    $0x10,%esp
80100d36:	68 e9 6f 10 80       	push   $0x80106fe9
80100d3b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d40:	e8 eb 34 00 00       	call   80104230 <initlock>
80100d45:	83 c4 10             	add    $0x10,%esp
80100d48:	c9                   	leave  
80100d49:	c3                   	ret    
80100d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d50 <filealloc>:
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	53                   	push   %ebx
80100d54:	bb 14 00 11 80       	mov    $0x80110014,%ebx
80100d59:	83 ec 10             	sub    $0x10,%esp
80100d5c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d61:	e8 ea 34 00 00       	call   80104250 <acquire>
80100d66:	83 c4 10             	add    $0x10,%esp
80100d69:	eb 10                	jmp    80100d7b <filealloc+0x2b>
80100d6b:	90                   	nop
80100d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d70:	83 c3 18             	add    $0x18,%ebx
80100d73:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100d79:	74 25                	je     80100da0 <filealloc+0x50>
80100d7b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d7e:	85 c0                	test   %eax,%eax
80100d80:	75 ee                	jne    80100d70 <filealloc+0x20>
80100d82:	83 ec 0c             	sub    $0xc,%esp
80100d85:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100d8c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d91:	e8 9a 36 00 00       	call   80104430 <release>
80100d96:	89 d8                	mov    %ebx,%eax
80100d98:	83 c4 10             	add    $0x10,%esp
80100d9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d9e:	c9                   	leave  
80100d9f:	c3                   	ret    
80100da0:	83 ec 0c             	sub    $0xc,%esp
80100da3:	68 e0 ff 10 80       	push   $0x8010ffe0
80100da8:	e8 83 36 00 00       	call   80104430 <release>
80100dad:	83 c4 10             	add    $0x10,%esp
80100db0:	31 c0                	xor    %eax,%eax
80100db2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100db5:	c9                   	leave  
80100db6:	c3                   	ret    
80100db7:	89 f6                	mov    %esi,%esi
80100db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100dc0 <filedup>:
80100dc0:	55                   	push   %ebp
80100dc1:	89 e5                	mov    %esp,%ebp
80100dc3:	53                   	push   %ebx
80100dc4:	83 ec 10             	sub    $0x10,%esp
80100dc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dca:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dcf:	e8 7c 34 00 00       	call   80104250 <acquire>
80100dd4:	8b 43 04             	mov    0x4(%ebx),%eax
80100dd7:	83 c4 10             	add    $0x10,%esp
80100dda:	85 c0                	test   %eax,%eax
80100ddc:	7e 1a                	jle    80100df8 <filedup+0x38>
80100dde:	83 c0 01             	add    $0x1,%eax
80100de1:	83 ec 0c             	sub    $0xc,%esp
80100de4:	89 43 04             	mov    %eax,0x4(%ebx)
80100de7:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dec:	e8 3f 36 00 00       	call   80104430 <release>
80100df1:	89 d8                	mov    %ebx,%eax
80100df3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100df6:	c9                   	leave  
80100df7:	c3                   	ret    
80100df8:	83 ec 0c             	sub    $0xc,%esp
80100dfb:	68 f0 6f 10 80       	push   $0x80106ff0
80100e00:	e8 6b f5 ff ff       	call   80100370 <panic>
80100e05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e10 <fileclose>:
80100e10:	55                   	push   %ebp
80100e11:	89 e5                	mov    %esp,%ebp
80100e13:	57                   	push   %edi
80100e14:	56                   	push   %esi
80100e15:	53                   	push   %ebx
80100e16:	83 ec 28             	sub    $0x28,%esp
80100e19:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e1c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e21:	e8 2a 34 00 00       	call   80104250 <acquire>
80100e26:	8b 47 04             	mov    0x4(%edi),%eax
80100e29:	83 c4 10             	add    $0x10,%esp
80100e2c:	85 c0                	test   %eax,%eax
80100e2e:	0f 8e 9b 00 00 00    	jle    80100ecf <fileclose+0xbf>
80100e34:	83 e8 01             	sub    $0x1,%eax
80100e37:	85 c0                	test   %eax,%eax
80100e39:	89 47 04             	mov    %eax,0x4(%edi)
80100e3c:	74 1a                	je     80100e58 <fileclose+0x48>
80100e3e:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
80100e45:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e48:	5b                   	pop    %ebx
80100e49:	5e                   	pop    %esi
80100e4a:	5f                   	pop    %edi
80100e4b:	5d                   	pop    %ebp
80100e4c:	e9 df 35 00 00       	jmp    80104430 <release>
80100e51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e58:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e5c:	8b 1f                	mov    (%edi),%ebx
80100e5e:	83 ec 0c             	sub    $0xc,%esp
80100e61:	8b 77 0c             	mov    0xc(%edi),%esi
80100e64:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e6a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e6d:	8b 47 10             	mov    0x10(%edi),%eax
80100e70:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e75:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e78:	e8 b3 35 00 00       	call   80104430 <release>
80100e7d:	83 c4 10             	add    $0x10,%esp
80100e80:	83 fb 01             	cmp    $0x1,%ebx
80100e83:	74 13                	je     80100e98 <fileclose+0x88>
80100e85:	83 fb 02             	cmp    $0x2,%ebx
80100e88:	74 26                	je     80100eb0 <fileclose+0xa0>
80100e8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e8d:	5b                   	pop    %ebx
80100e8e:	5e                   	pop    %esi
80100e8f:	5f                   	pop    %edi
80100e90:	5d                   	pop    %ebp
80100e91:	c3                   	ret    
80100e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100e98:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100e9c:	83 ec 08             	sub    $0x8,%esp
80100e9f:	53                   	push   %ebx
80100ea0:	56                   	push   %esi
80100ea1:	e8 aa 25 00 00       	call   80103450 <pipeclose>
80100ea6:	83 c4 10             	add    $0x10,%esp
80100ea9:	eb df                	jmp    80100e8a <fileclose+0x7a>
80100eab:	90                   	nop
80100eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100eb0:	e8 fb 1c 00 00       	call   80102bb0 <begin_op>
80100eb5:	83 ec 0c             	sub    $0xc,%esp
80100eb8:	ff 75 e0             	pushl  -0x20(%ebp)
80100ebb:	e8 c0 08 00 00       	call   80101780 <iput>
80100ec0:	83 c4 10             	add    $0x10,%esp
80100ec3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ec6:	5b                   	pop    %ebx
80100ec7:	5e                   	pop    %esi
80100ec8:	5f                   	pop    %edi
80100ec9:	5d                   	pop    %ebp
80100eca:	e9 51 1d 00 00       	jmp    80102c20 <end_op>
80100ecf:	83 ec 0c             	sub    $0xc,%esp
80100ed2:	68 f8 6f 10 80       	push   $0x80106ff8
80100ed7:	e8 94 f4 ff ff       	call   80100370 <panic>
80100edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ee0 <filestat>:
80100ee0:	55                   	push   %ebp
80100ee1:	89 e5                	mov    %esp,%ebp
80100ee3:	53                   	push   %ebx
80100ee4:	83 ec 04             	sub    $0x4,%esp
80100ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100eea:	83 3b 02             	cmpl   $0x2,(%ebx)
80100eed:	75 31                	jne    80100f20 <filestat+0x40>
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	ff 73 10             	pushl  0x10(%ebx)
80100ef5:	e8 56 07 00 00       	call   80101650 <ilock>
80100efa:	58                   	pop    %eax
80100efb:	5a                   	pop    %edx
80100efc:	ff 75 0c             	pushl  0xc(%ebp)
80100eff:	ff 73 10             	pushl  0x10(%ebx)
80100f02:	e8 d9 09 00 00       	call   801018e0 <stati>
80100f07:	59                   	pop    %ecx
80100f08:	ff 73 10             	pushl  0x10(%ebx)
80100f0b:	e8 20 08 00 00       	call   80101730 <iunlock>
80100f10:	83 c4 10             	add    $0x10,%esp
80100f13:	31 c0                	xor    %eax,%eax
80100f15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f18:	c9                   	leave  
80100f19:	c3                   	ret    
80100f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f28:	c9                   	leave  
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f30 <fileread>:
80100f30:	55                   	push   %ebp
80100f31:	89 e5                	mov    %esp,%ebp
80100f33:	57                   	push   %edi
80100f34:	56                   	push   %esi
80100f35:	53                   	push   %ebx
80100f36:	83 ec 0c             	sub    $0xc,%esp
80100f39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f3c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f3f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f42:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f46:	74 60                	je     80100fa8 <fileread+0x78>
80100f48:	8b 03                	mov    (%ebx),%eax
80100f4a:	83 f8 01             	cmp    $0x1,%eax
80100f4d:	74 41                	je     80100f90 <fileread+0x60>
80100f4f:	83 f8 02             	cmp    $0x2,%eax
80100f52:	75 5b                	jne    80100faf <fileread+0x7f>
80100f54:	83 ec 0c             	sub    $0xc,%esp
80100f57:	ff 73 10             	pushl  0x10(%ebx)
80100f5a:	e8 f1 06 00 00       	call   80101650 <ilock>
80100f5f:	57                   	push   %edi
80100f60:	ff 73 14             	pushl  0x14(%ebx)
80100f63:	56                   	push   %esi
80100f64:	ff 73 10             	pushl  0x10(%ebx)
80100f67:	e8 a4 09 00 00       	call   80101910 <readi>
80100f6c:	83 c4 20             	add    $0x20,%esp
80100f6f:	85 c0                	test   %eax,%eax
80100f71:	89 c6                	mov    %eax,%esi
80100f73:	7e 03                	jle    80100f78 <fileread+0x48>
80100f75:	01 43 14             	add    %eax,0x14(%ebx)
80100f78:	83 ec 0c             	sub    $0xc,%esp
80100f7b:	ff 73 10             	pushl  0x10(%ebx)
80100f7e:	e8 ad 07 00 00       	call   80101730 <iunlock>
80100f83:	83 c4 10             	add    $0x10,%esp
80100f86:	89 f0                	mov    %esi,%eax
80100f88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f8b:	5b                   	pop    %ebx
80100f8c:	5e                   	pop    %esi
80100f8d:	5f                   	pop    %edi
80100f8e:	5d                   	pop    %ebp
80100f8f:	c3                   	ret    
80100f90:	8b 43 0c             	mov    0xc(%ebx),%eax
80100f93:	89 45 08             	mov    %eax,0x8(%ebp)
80100f96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f99:	5b                   	pop    %ebx
80100f9a:	5e                   	pop    %esi
80100f9b:	5f                   	pop    %edi
80100f9c:	5d                   	pop    %ebp
80100f9d:	e9 7e 26 00 00       	jmp    80103620 <piperead>
80100fa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fa8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fad:	eb d9                	jmp    80100f88 <fileread+0x58>
80100faf:	83 ec 0c             	sub    $0xc,%esp
80100fb2:	68 02 70 10 80       	push   $0x80107002
80100fb7:	e8 b4 f3 ff ff       	call   80100370 <panic>
80100fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fc0 <filewrite>:
80100fc0:	55                   	push   %ebp
80100fc1:	89 e5                	mov    %esp,%ebp
80100fc3:	57                   	push   %edi
80100fc4:	56                   	push   %esi
80100fc5:	53                   	push   %ebx
80100fc6:	83 ec 1c             	sub    $0x1c,%esp
80100fc9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fcc:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fcf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100fd3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fd6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fd9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100fdc:	0f 84 aa 00 00 00    	je     8010108c <filewrite+0xcc>
80100fe2:	8b 06                	mov    (%esi),%eax
80100fe4:	83 f8 01             	cmp    $0x1,%eax
80100fe7:	0f 84 c2 00 00 00    	je     801010af <filewrite+0xef>
80100fed:	83 f8 02             	cmp    $0x2,%eax
80100ff0:	0f 85 d8 00 00 00    	jne    801010ce <filewrite+0x10e>
80100ff6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ff9:	31 ff                	xor    %edi,%edi
80100ffb:	85 c0                	test   %eax,%eax
80100ffd:	7f 34                	jg     80101033 <filewrite+0x73>
80100fff:	e9 9c 00 00 00       	jmp    801010a0 <filewrite+0xe0>
80101004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101008:	01 46 14             	add    %eax,0x14(%esi)
8010100b:	83 ec 0c             	sub    $0xc,%esp
8010100e:	ff 76 10             	pushl  0x10(%esi)
80101011:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101014:	e8 17 07 00 00       	call   80101730 <iunlock>
80101019:	e8 02 1c 00 00       	call   80102c20 <end_op>
8010101e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101021:	83 c4 10             	add    $0x10,%esp
80101024:	39 d8                	cmp    %ebx,%eax
80101026:	0f 85 95 00 00 00    	jne    801010c1 <filewrite+0x101>
8010102c:	01 c7                	add    %eax,%edi
8010102e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101031:	7e 6d                	jle    801010a0 <filewrite+0xe0>
80101033:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101036:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010103b:	29 fb                	sub    %edi,%ebx
8010103d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101043:	0f 4f d8             	cmovg  %eax,%ebx
80101046:	e8 65 1b 00 00       	call   80102bb0 <begin_op>
8010104b:	83 ec 0c             	sub    $0xc,%esp
8010104e:	ff 76 10             	pushl  0x10(%esi)
80101051:	e8 fa 05 00 00       	call   80101650 <ilock>
80101056:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101059:	53                   	push   %ebx
8010105a:	ff 76 14             	pushl  0x14(%esi)
8010105d:	01 f8                	add    %edi,%eax
8010105f:	50                   	push   %eax
80101060:	ff 76 10             	pushl  0x10(%esi)
80101063:	e8 a8 09 00 00       	call   80101a10 <writei>
80101068:	83 c4 20             	add    $0x20,%esp
8010106b:	85 c0                	test   %eax,%eax
8010106d:	7f 99                	jg     80101008 <filewrite+0x48>
8010106f:	83 ec 0c             	sub    $0xc,%esp
80101072:	ff 76 10             	pushl  0x10(%esi)
80101075:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101078:	e8 b3 06 00 00       	call   80101730 <iunlock>
8010107d:	e8 9e 1b 00 00       	call   80102c20 <end_op>
80101082:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101085:	83 c4 10             	add    $0x10,%esp
80101088:	85 c0                	test   %eax,%eax
8010108a:	74 98                	je     80101024 <filewrite+0x64>
8010108c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010108f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101094:	5b                   	pop    %ebx
80101095:	5e                   	pop    %esi
80101096:	5f                   	pop    %edi
80101097:	5d                   	pop    %ebp
80101098:	c3                   	ret    
80101099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010a0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010a3:	75 e7                	jne    8010108c <filewrite+0xcc>
801010a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010a8:	89 f8                	mov    %edi,%eax
801010aa:	5b                   	pop    %ebx
801010ab:	5e                   	pop    %esi
801010ac:	5f                   	pop    %edi
801010ad:	5d                   	pop    %ebp
801010ae:	c3                   	ret    
801010af:	8b 46 0c             	mov    0xc(%esi),%eax
801010b2:	89 45 08             	mov    %eax,0x8(%ebp)
801010b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b8:	5b                   	pop    %ebx
801010b9:	5e                   	pop    %esi
801010ba:	5f                   	pop    %edi
801010bb:	5d                   	pop    %ebp
801010bc:	e9 2f 24 00 00       	jmp    801034f0 <pipewrite>
801010c1:	83 ec 0c             	sub    $0xc,%esp
801010c4:	68 0b 70 10 80       	push   $0x8010700b
801010c9:	e8 a2 f2 ff ff       	call   80100370 <panic>
801010ce:	83 ec 0c             	sub    $0xc,%esp
801010d1:	68 11 70 10 80       	push   $0x80107011
801010d6:	e8 95 f2 ff ff       	call   80100370 <panic>
801010db:	66 90                	xchg   %ax,%ax
801010dd:	66 90                	xchg   %ax,%ax
801010df:	90                   	nop

801010e0 <balloc>:
801010e0:	55                   	push   %ebp
801010e1:	89 e5                	mov    %esp,%ebp
801010e3:	57                   	push   %edi
801010e4:	56                   	push   %esi
801010e5:	53                   	push   %ebx
801010e6:	83 ec 1c             	sub    $0x1c,%esp
801010e9:	8b 0d e0 09 11 80    	mov    0x801109e0,%ecx
801010ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
801010f2:	85 c9                	test   %ecx,%ecx
801010f4:	0f 84 85 00 00 00    	je     8010117f <balloc+0x9f>
801010fa:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101101:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101104:	83 ec 08             	sub    $0x8,%esp
80101107:	89 f0                	mov    %esi,%eax
80101109:	c1 f8 0c             	sar    $0xc,%eax
8010110c:	03 05 f8 09 11 80    	add    0x801109f8,%eax
80101112:	50                   	push   %eax
80101113:	ff 75 d8             	pushl  -0x28(%ebp)
80101116:	e8 b5 ef ff ff       	call   801000d0 <bread>
8010111b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010111e:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101123:	83 c4 10             	add    $0x10,%esp
80101126:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101129:	31 c0                	xor    %eax,%eax
8010112b:	eb 2d                	jmp    8010115a <balloc+0x7a>
8010112d:	8d 76 00             	lea    0x0(%esi),%esi
80101130:	89 c1                	mov    %eax,%ecx
80101132:	ba 01 00 00 00       	mov    $0x1,%edx
80101137:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010113a:	83 e1 07             	and    $0x7,%ecx
8010113d:	d3 e2                	shl    %cl,%edx
8010113f:	89 c1                	mov    %eax,%ecx
80101141:	c1 f9 03             	sar    $0x3,%ecx
80101144:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101149:	85 d7                	test   %edx,%edi
8010114b:	74 43                	je     80101190 <balloc+0xb0>
8010114d:	83 c0 01             	add    $0x1,%eax
80101150:	83 c6 01             	add    $0x1,%esi
80101153:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101158:	74 05                	je     8010115f <balloc+0x7f>
8010115a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010115d:	72 d1                	jb     80101130 <balloc+0x50>
8010115f:	83 ec 0c             	sub    $0xc,%esp
80101162:	ff 75 e4             	pushl  -0x1c(%ebp)
80101165:	e8 76 f0 ff ff       	call   801001e0 <brelse>
8010116a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101171:	83 c4 10             	add    $0x10,%esp
80101174:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101177:	39 05 e0 09 11 80    	cmp    %eax,0x801109e0
8010117d:	77 82                	ja     80101101 <balloc+0x21>
8010117f:	83 ec 0c             	sub    $0xc,%esp
80101182:	68 1b 70 10 80       	push   $0x8010701b
80101187:	e8 e4 f1 ff ff       	call   80100370 <panic>
8010118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101190:	09 fa                	or     %edi,%edx
80101192:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101195:	83 ec 0c             	sub    $0xc,%esp
80101198:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
8010119c:	57                   	push   %edi
8010119d:	e8 ee 1b 00 00       	call   80102d90 <log_write>
801011a2:	89 3c 24             	mov    %edi,(%esp)
801011a5:	e8 36 f0 ff ff       	call   801001e0 <brelse>
801011aa:	58                   	pop    %eax
801011ab:	5a                   	pop    %edx
801011ac:	56                   	push   %esi
801011ad:	ff 75 d8             	pushl  -0x28(%ebp)
801011b0:	e8 1b ef ff ff       	call   801000d0 <bread>
801011b5:	89 c3                	mov    %eax,%ebx
801011b7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ba:	83 c4 0c             	add    $0xc,%esp
801011bd:	68 00 02 00 00       	push   $0x200
801011c2:	6a 00                	push   $0x0
801011c4:	50                   	push   %eax
801011c5:	e8 b6 32 00 00       	call   80104480 <memset>
801011ca:	89 1c 24             	mov    %ebx,(%esp)
801011cd:	e8 be 1b 00 00       	call   80102d90 <log_write>
801011d2:	89 1c 24             	mov    %ebx,(%esp)
801011d5:	e8 06 f0 ff ff       	call   801001e0 <brelse>
801011da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011dd:	89 f0                	mov    %esi,%eax
801011df:	5b                   	pop    %ebx
801011e0:	5e                   	pop    %esi
801011e1:	5f                   	pop    %edi
801011e2:	5d                   	pop    %ebp
801011e3:	c3                   	ret    
801011e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801011ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801011f0 <iget>:
801011f0:	55                   	push   %ebp
801011f1:	89 e5                	mov    %esp,%ebp
801011f3:	57                   	push   %edi
801011f4:	56                   	push   %esi
801011f5:	53                   	push   %ebx
801011f6:	89 c7                	mov    %eax,%edi
801011f8:	31 f6                	xor    %esi,%esi
801011fa:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
801011ff:	83 ec 28             	sub    $0x28,%esp
80101202:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101205:	68 00 0a 11 80       	push   $0x80110a00
8010120a:	e8 41 30 00 00       	call   80104250 <acquire>
8010120f:	83 c4 10             	add    $0x10,%esp
80101212:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101215:	eb 1b                	jmp    80101232 <iget+0x42>
80101217:	89 f6                	mov    %esi,%esi
80101219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101220:	85 f6                	test   %esi,%esi
80101222:	74 44                	je     80101268 <iget+0x78>
80101224:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010122a:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101230:	74 4e                	je     80101280 <iget+0x90>
80101232:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101235:	85 c9                	test   %ecx,%ecx
80101237:	7e e7                	jle    80101220 <iget+0x30>
80101239:	39 3b                	cmp    %edi,(%ebx)
8010123b:	75 e3                	jne    80101220 <iget+0x30>
8010123d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101240:	75 de                	jne    80101220 <iget+0x30>
80101242:	83 ec 0c             	sub    $0xc,%esp
80101245:	83 c1 01             	add    $0x1,%ecx
80101248:	89 de                	mov    %ebx,%esi
8010124a:	68 00 0a 11 80       	push   $0x80110a00
8010124f:	89 4b 08             	mov    %ecx,0x8(%ebx)
80101252:	e8 d9 31 00 00       	call   80104430 <release>
80101257:	83 c4 10             	add    $0x10,%esp
8010125a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010125d:	89 f0                	mov    %esi,%eax
8010125f:	5b                   	pop    %ebx
80101260:	5e                   	pop    %esi
80101261:	5f                   	pop    %edi
80101262:	5d                   	pop    %ebp
80101263:	c3                   	ret    
80101264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101268:	85 c9                	test   %ecx,%ecx
8010126a:	0f 44 f3             	cmove  %ebx,%esi
8010126d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101273:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101279:	75 b7                	jne    80101232 <iget+0x42>
8010127b:	90                   	nop
8010127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101280:	85 f6                	test   %esi,%esi
80101282:	74 2d                	je     801012b1 <iget+0xc1>
80101284:	83 ec 0c             	sub    $0xc,%esp
80101287:	89 3e                	mov    %edi,(%esi)
80101289:	89 56 04             	mov    %edx,0x4(%esi)
8010128c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101293:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010129a:	68 00 0a 11 80       	push   $0x80110a00
8010129f:	e8 8c 31 00 00       	call   80104430 <release>
801012a4:	83 c4 10             	add    $0x10,%esp
801012a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012aa:	89 f0                	mov    %esi,%eax
801012ac:	5b                   	pop    %ebx
801012ad:	5e                   	pop    %esi
801012ae:	5f                   	pop    %edi
801012af:	5d                   	pop    %ebp
801012b0:	c3                   	ret    
801012b1:	83 ec 0c             	sub    $0xc,%esp
801012b4:	68 31 70 10 80       	push   $0x80107031
801012b9:	e8 b2 f0 ff ff       	call   80100370 <panic>
801012be:	66 90                	xchg   %ax,%ax

801012c0 <bmap>:
801012c0:	55                   	push   %ebp
801012c1:	89 e5                	mov    %esp,%ebp
801012c3:	57                   	push   %edi
801012c4:	56                   	push   %esi
801012c5:	53                   	push   %ebx
801012c6:	89 c6                	mov    %eax,%esi
801012c8:	83 ec 1c             	sub    $0x1c,%esp
801012cb:	83 fa 0b             	cmp    $0xb,%edx
801012ce:	77 18                	ja     801012e8 <bmap+0x28>
801012d0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801012d3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012d6:	85 c0                	test   %eax,%eax
801012d8:	74 76                	je     80101350 <bmap+0x90>
801012da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012dd:	5b                   	pop    %ebx
801012de:	5e                   	pop    %esi
801012df:	5f                   	pop    %edi
801012e0:	5d                   	pop    %ebp
801012e1:	c3                   	ret    
801012e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801012e8:	8d 5a f4             	lea    -0xc(%edx),%ebx
801012eb:	83 fb 7f             	cmp    $0x7f,%ebx
801012ee:	0f 87 83 00 00 00    	ja     80101377 <bmap+0xb7>
801012f4:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
801012fa:	85 c0                	test   %eax,%eax
801012fc:	74 6a                	je     80101368 <bmap+0xa8>
801012fe:	83 ec 08             	sub    $0x8,%esp
80101301:	50                   	push   %eax
80101302:	ff 36                	pushl  (%esi)
80101304:	e8 c7 ed ff ff       	call   801000d0 <bread>
80101309:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010130d:	83 c4 10             	add    $0x10,%esp
80101310:	89 c7                	mov    %eax,%edi
80101312:	8b 1a                	mov    (%edx),%ebx
80101314:	85 db                	test   %ebx,%ebx
80101316:	75 1d                	jne    80101335 <bmap+0x75>
80101318:	8b 06                	mov    (%esi),%eax
8010131a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010131d:	e8 be fd ff ff       	call   801010e0 <balloc>
80101322:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101325:	83 ec 0c             	sub    $0xc,%esp
80101328:	89 c3                	mov    %eax,%ebx
8010132a:	89 02                	mov    %eax,(%edx)
8010132c:	57                   	push   %edi
8010132d:	e8 5e 1a 00 00       	call   80102d90 <log_write>
80101332:	83 c4 10             	add    $0x10,%esp
80101335:	83 ec 0c             	sub    $0xc,%esp
80101338:	57                   	push   %edi
80101339:	e8 a2 ee ff ff       	call   801001e0 <brelse>
8010133e:	83 c4 10             	add    $0x10,%esp
80101341:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101344:	89 d8                	mov    %ebx,%eax
80101346:	5b                   	pop    %ebx
80101347:	5e                   	pop    %esi
80101348:	5f                   	pop    %edi
80101349:	5d                   	pop    %ebp
8010134a:	c3                   	ret    
8010134b:	90                   	nop
8010134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101350:	8b 06                	mov    (%esi),%eax
80101352:	e8 89 fd ff ff       	call   801010e0 <balloc>
80101357:	89 43 5c             	mov    %eax,0x5c(%ebx)
8010135a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010135d:	5b                   	pop    %ebx
8010135e:	5e                   	pop    %esi
8010135f:	5f                   	pop    %edi
80101360:	5d                   	pop    %ebp
80101361:	c3                   	ret    
80101362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101368:	8b 06                	mov    (%esi),%eax
8010136a:	e8 71 fd ff ff       	call   801010e0 <balloc>
8010136f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101375:	eb 87                	jmp    801012fe <bmap+0x3e>
80101377:	83 ec 0c             	sub    $0xc,%esp
8010137a:	68 41 70 10 80       	push   $0x80107041
8010137f:	e8 ec ef ff ff       	call   80100370 <panic>
80101384:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010138a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101390 <readsb>:
80101390:	55                   	push   %ebp
80101391:	89 e5                	mov    %esp,%ebp
80101393:	56                   	push   %esi
80101394:	53                   	push   %ebx
80101395:	8b 75 0c             	mov    0xc(%ebp),%esi
80101398:	83 ec 08             	sub    $0x8,%esp
8010139b:	6a 01                	push   $0x1
8010139d:	ff 75 08             	pushl  0x8(%ebp)
801013a0:	e8 2b ed ff ff       	call   801000d0 <bread>
801013a5:	89 c3                	mov    %eax,%ebx
801013a7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013aa:	83 c4 0c             	add    $0xc,%esp
801013ad:	6a 1c                	push   $0x1c
801013af:	50                   	push   %eax
801013b0:	56                   	push   %esi
801013b1:	e8 7a 31 00 00       	call   80104530 <memmove>
801013b6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013b9:	83 c4 10             	add    $0x10,%esp
801013bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013bf:	5b                   	pop    %ebx
801013c0:	5e                   	pop    %esi
801013c1:	5d                   	pop    %ebp
801013c2:	e9 19 ee ff ff       	jmp    801001e0 <brelse>
801013c7:	89 f6                	mov    %esi,%esi
801013c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013d0 <bfree>:
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	56                   	push   %esi
801013d4:	53                   	push   %ebx
801013d5:	89 d3                	mov    %edx,%ebx
801013d7:	89 c6                	mov    %eax,%esi
801013d9:	83 ec 08             	sub    $0x8,%esp
801013dc:	68 e0 09 11 80       	push   $0x801109e0
801013e1:	50                   	push   %eax
801013e2:	e8 a9 ff ff ff       	call   80101390 <readsb>
801013e7:	58                   	pop    %eax
801013e8:	5a                   	pop    %edx
801013e9:	89 da                	mov    %ebx,%edx
801013eb:	c1 ea 0c             	shr    $0xc,%edx
801013ee:	03 15 f8 09 11 80    	add    0x801109f8,%edx
801013f4:	52                   	push   %edx
801013f5:	56                   	push   %esi
801013f6:	e8 d5 ec ff ff       	call   801000d0 <bread>
801013fb:	89 d9                	mov    %ebx,%ecx
801013fd:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80101403:	ba 01 00 00 00       	mov    $0x1,%edx
80101408:	83 e1 07             	and    $0x7,%ecx
8010140b:	c1 fb 03             	sar    $0x3,%ebx
8010140e:	83 c4 10             	add    $0x10,%esp
80101411:	d3 e2                	shl    %cl,%edx
80101413:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101418:	85 d1                	test   %edx,%ecx
8010141a:	74 27                	je     80101443 <bfree+0x73>
8010141c:	89 c6                	mov    %eax,%esi
8010141e:	f7 d2                	not    %edx
80101420:	89 c8                	mov    %ecx,%eax
80101422:	83 ec 0c             	sub    $0xc,%esp
80101425:	21 d0                	and    %edx,%eax
80101427:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
8010142b:	56                   	push   %esi
8010142c:	e8 5f 19 00 00       	call   80102d90 <log_write>
80101431:	89 34 24             	mov    %esi,(%esp)
80101434:	e8 a7 ed ff ff       	call   801001e0 <brelse>
80101439:	83 c4 10             	add    $0x10,%esp
8010143c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010143f:	5b                   	pop    %ebx
80101440:	5e                   	pop    %esi
80101441:	5d                   	pop    %ebp
80101442:	c3                   	ret    
80101443:	83 ec 0c             	sub    $0xc,%esp
80101446:	68 54 70 10 80       	push   $0x80107054
8010144b:	e8 20 ef ff ff       	call   80100370 <panic>

80101450 <iinit>:
80101450:	55                   	push   %ebp
80101451:	89 e5                	mov    %esp,%ebp
80101453:	53                   	push   %ebx
80101454:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
80101459:	83 ec 0c             	sub    $0xc,%esp
8010145c:	68 67 70 10 80       	push   $0x80107067
80101461:	68 00 0a 11 80       	push   $0x80110a00
80101466:	e8 c5 2d 00 00       	call   80104230 <initlock>
8010146b:	83 c4 10             	add    $0x10,%esp
8010146e:	66 90                	xchg   %ax,%ax
80101470:	83 ec 08             	sub    $0x8,%esp
80101473:	68 6e 70 10 80       	push   $0x8010706e
80101478:	53                   	push   %ebx
80101479:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010147f:	e8 9c 2c 00 00       	call   80104120 <initsleeplock>
80101484:	83 c4 10             	add    $0x10,%esp
80101487:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
8010148d:	75 e1                	jne    80101470 <iinit+0x20>
8010148f:	83 ec 08             	sub    $0x8,%esp
80101492:	68 e0 09 11 80       	push   $0x801109e0
80101497:	ff 75 08             	pushl  0x8(%ebp)
8010149a:	e8 f1 fe ff ff       	call   80101390 <readsb>
8010149f:	ff 35 f8 09 11 80    	pushl  0x801109f8
801014a5:	ff 35 f4 09 11 80    	pushl  0x801109f4
801014ab:	ff 35 f0 09 11 80    	pushl  0x801109f0
801014b1:	ff 35 ec 09 11 80    	pushl  0x801109ec
801014b7:	ff 35 e8 09 11 80    	pushl  0x801109e8
801014bd:	ff 35 e4 09 11 80    	pushl  0x801109e4
801014c3:	ff 35 e0 09 11 80    	pushl  0x801109e0
801014c9:	68 c4 70 10 80       	push   $0x801070c4
801014ce:	e8 8d f1 ff ff       	call   80100660 <cprintf>
801014d3:	83 c4 30             	add    $0x30,%esp
801014d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014d9:	c9                   	leave  
801014da:	c3                   	ret    
801014db:	90                   	nop
801014dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801014e0 <ialloc>:
801014e0:	55                   	push   %ebp
801014e1:	89 e5                	mov    %esp,%ebp
801014e3:	57                   	push   %edi
801014e4:	56                   	push   %esi
801014e5:	53                   	push   %ebx
801014e6:	83 ec 1c             	sub    $0x1c,%esp
801014e9:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
801014f0:	8b 45 0c             	mov    0xc(%ebp),%eax
801014f3:	8b 75 08             	mov    0x8(%ebp),%esi
801014f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801014f9:	0f 86 91 00 00 00    	jbe    80101590 <ialloc+0xb0>
801014ff:	bb 01 00 00 00       	mov    $0x1,%ebx
80101504:	eb 21                	jmp    80101527 <ialloc+0x47>
80101506:	8d 76 00             	lea    0x0(%esi),%esi
80101509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101510:	83 ec 0c             	sub    $0xc,%esp
80101513:	83 c3 01             	add    $0x1,%ebx
80101516:	57                   	push   %edi
80101517:	e8 c4 ec ff ff       	call   801001e0 <brelse>
8010151c:	83 c4 10             	add    $0x10,%esp
8010151f:	39 1d e8 09 11 80    	cmp    %ebx,0x801109e8
80101525:	76 69                	jbe    80101590 <ialloc+0xb0>
80101527:	89 d8                	mov    %ebx,%eax
80101529:	83 ec 08             	sub    $0x8,%esp
8010152c:	c1 e8 03             	shr    $0x3,%eax
8010152f:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101535:	50                   	push   %eax
80101536:	56                   	push   %esi
80101537:	e8 94 eb ff ff       	call   801000d0 <bread>
8010153c:	89 c7                	mov    %eax,%edi
8010153e:	89 d8                	mov    %ebx,%eax
80101540:	83 c4 10             	add    $0x10,%esp
80101543:	83 e0 07             	and    $0x7,%eax
80101546:	c1 e0 06             	shl    $0x6,%eax
80101549:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010154d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101551:	75 bd                	jne    80101510 <ialloc+0x30>
80101553:	83 ec 04             	sub    $0x4,%esp
80101556:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101559:	6a 40                	push   $0x40
8010155b:	6a 00                	push   $0x0
8010155d:	51                   	push   %ecx
8010155e:	e8 1d 2f 00 00       	call   80104480 <memset>
80101563:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101567:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010156a:	66 89 01             	mov    %ax,(%ecx)
8010156d:	89 3c 24             	mov    %edi,(%esp)
80101570:	e8 1b 18 00 00       	call   80102d90 <log_write>
80101575:	89 3c 24             	mov    %edi,(%esp)
80101578:	e8 63 ec ff ff       	call   801001e0 <brelse>
8010157d:	83 c4 10             	add    $0x10,%esp
80101580:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101583:	89 da                	mov    %ebx,%edx
80101585:	89 f0                	mov    %esi,%eax
80101587:	5b                   	pop    %ebx
80101588:	5e                   	pop    %esi
80101589:	5f                   	pop    %edi
8010158a:	5d                   	pop    %ebp
8010158b:	e9 60 fc ff ff       	jmp    801011f0 <iget>
80101590:	83 ec 0c             	sub    $0xc,%esp
80101593:	68 74 70 10 80       	push   $0x80107074
80101598:	e8 d3 ed ff ff       	call   80100370 <panic>
8010159d:	8d 76 00             	lea    0x0(%esi),%esi

801015a0 <iupdate>:
801015a0:	55                   	push   %ebp
801015a1:	89 e5                	mov    %esp,%ebp
801015a3:	56                   	push   %esi
801015a4:	53                   	push   %ebx
801015a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015a8:	83 ec 08             	sub    $0x8,%esp
801015ab:	8b 43 04             	mov    0x4(%ebx),%eax
801015ae:	83 c3 5c             	add    $0x5c,%ebx
801015b1:	c1 e8 03             	shr    $0x3,%eax
801015b4:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801015ba:	50                   	push   %eax
801015bb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015be:	e8 0d eb ff ff       	call   801000d0 <bread>
801015c3:	89 c6                	mov    %eax,%esi
801015c5:	8b 43 a8             	mov    -0x58(%ebx),%eax
801015c8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
801015cc:	83 c4 0c             	add    $0xc,%esp
801015cf:	83 e0 07             	and    $0x7,%eax
801015d2:	c1 e0 06             	shl    $0x6,%eax
801015d5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801015d9:	66 89 10             	mov    %dx,(%eax)
801015dc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
801015e0:	83 c0 0c             	add    $0xc,%eax
801015e3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
801015e7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801015eb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
801015ef:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
801015f3:	66 89 50 fa          	mov    %dx,-0x6(%eax)
801015f7:	8b 53 fc             	mov    -0x4(%ebx),%edx
801015fa:	89 50 fc             	mov    %edx,-0x4(%eax)
801015fd:	6a 34                	push   $0x34
801015ff:	53                   	push   %ebx
80101600:	50                   	push   %eax
80101601:	e8 2a 2f 00 00       	call   80104530 <memmove>
80101606:	89 34 24             	mov    %esi,(%esp)
80101609:	e8 82 17 00 00       	call   80102d90 <log_write>
8010160e:	89 75 08             	mov    %esi,0x8(%ebp)
80101611:	83 c4 10             	add    $0x10,%esp
80101614:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101617:	5b                   	pop    %ebx
80101618:	5e                   	pop    %esi
80101619:	5d                   	pop    %ebp
8010161a:	e9 c1 eb ff ff       	jmp    801001e0 <brelse>
8010161f:	90                   	nop

80101620 <idup>:
80101620:	55                   	push   %ebp
80101621:	89 e5                	mov    %esp,%ebp
80101623:	53                   	push   %ebx
80101624:	83 ec 10             	sub    $0x10,%esp
80101627:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010162a:	68 00 0a 11 80       	push   $0x80110a00
8010162f:	e8 1c 2c 00 00       	call   80104250 <acquire>
80101634:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101638:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010163f:	e8 ec 2d 00 00       	call   80104430 <release>
80101644:	89 d8                	mov    %ebx,%eax
80101646:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101649:	c9                   	leave  
8010164a:	c3                   	ret    
8010164b:	90                   	nop
8010164c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101650 <ilock>:
80101650:	55                   	push   %ebp
80101651:	89 e5                	mov    %esp,%ebp
80101653:	56                   	push   %esi
80101654:	53                   	push   %ebx
80101655:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101658:	85 db                	test   %ebx,%ebx
8010165a:	0f 84 b4 00 00 00    	je     80101714 <ilock+0xc4>
80101660:	8b 43 08             	mov    0x8(%ebx),%eax
80101663:	85 c0                	test   %eax,%eax
80101665:	0f 8e a9 00 00 00    	jle    80101714 <ilock+0xc4>
8010166b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010166e:	83 ec 0c             	sub    $0xc,%esp
80101671:	50                   	push   %eax
80101672:	e8 e9 2a 00 00       	call   80104160 <acquiresleep>
80101677:	83 c4 10             	add    $0x10,%esp
8010167a:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
8010167e:	74 10                	je     80101690 <ilock+0x40>
80101680:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101683:	5b                   	pop    %ebx
80101684:	5e                   	pop    %esi
80101685:	5d                   	pop    %ebp
80101686:	c3                   	ret    
80101687:	89 f6                	mov    %esi,%esi
80101689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101690:	8b 43 04             	mov    0x4(%ebx),%eax
80101693:	83 ec 08             	sub    $0x8,%esp
80101696:	c1 e8 03             	shr    $0x3,%eax
80101699:	03 05 f4 09 11 80    	add    0x801109f4,%eax
8010169f:	50                   	push   %eax
801016a0:	ff 33                	pushl  (%ebx)
801016a2:	e8 29 ea ff ff       	call   801000d0 <bread>
801016a7:	89 c6                	mov    %eax,%esi
801016a9:	8b 43 04             	mov    0x4(%ebx),%eax
801016ac:	83 c4 0c             	add    $0xc,%esp
801016af:	83 e0 07             	and    $0x7,%eax
801016b2:	c1 e0 06             	shl    $0x6,%eax
801016b5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016b9:	0f b7 10             	movzwl (%eax),%edx
801016bc:	83 c0 0c             	add    $0xc,%eax
801016bf:	66 89 53 50          	mov    %dx,0x50(%ebx)
801016c3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016c7:	66 89 53 52          	mov    %dx,0x52(%ebx)
801016cb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016cf:	66 89 53 54          	mov    %dx,0x54(%ebx)
801016d3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016d7:	66 89 53 56          	mov    %dx,0x56(%ebx)
801016db:	8b 50 fc             	mov    -0x4(%eax),%edx
801016de:	89 53 58             	mov    %edx,0x58(%ebx)
801016e1:	6a 34                	push   $0x34
801016e3:	50                   	push   %eax
801016e4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016e7:	50                   	push   %eax
801016e8:	e8 43 2e 00 00       	call   80104530 <memmove>
801016ed:	89 34 24             	mov    %esi,(%esp)
801016f0:	e8 eb ea ff ff       	call   801001e0 <brelse>
801016f5:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
801016f9:	83 c4 10             	add    $0x10,%esp
801016fc:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101701:	0f 85 79 ff ff ff    	jne    80101680 <ilock+0x30>
80101707:	83 ec 0c             	sub    $0xc,%esp
8010170a:	68 8c 70 10 80       	push   $0x8010708c
8010170f:	e8 5c ec ff ff       	call   80100370 <panic>
80101714:	83 ec 0c             	sub    $0xc,%esp
80101717:	68 86 70 10 80       	push   $0x80107086
8010171c:	e8 4f ec ff ff       	call   80100370 <panic>
80101721:	eb 0d                	jmp    80101730 <iunlock>
80101723:	90                   	nop
80101724:	90                   	nop
80101725:	90                   	nop
80101726:	90                   	nop
80101727:	90                   	nop
80101728:	90                   	nop
80101729:	90                   	nop
8010172a:	90                   	nop
8010172b:	90                   	nop
8010172c:	90                   	nop
8010172d:	90                   	nop
8010172e:	90                   	nop
8010172f:	90                   	nop

80101730 <iunlock>:
80101730:	55                   	push   %ebp
80101731:	89 e5                	mov    %esp,%ebp
80101733:	56                   	push   %esi
80101734:	53                   	push   %ebx
80101735:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101738:	85 db                	test   %ebx,%ebx
8010173a:	74 28                	je     80101764 <iunlock+0x34>
8010173c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010173f:	83 ec 0c             	sub    $0xc,%esp
80101742:	56                   	push   %esi
80101743:	e8 b8 2a 00 00       	call   80104200 <holdingsleep>
80101748:	83 c4 10             	add    $0x10,%esp
8010174b:	85 c0                	test   %eax,%eax
8010174d:	74 15                	je     80101764 <iunlock+0x34>
8010174f:	8b 43 08             	mov    0x8(%ebx),%eax
80101752:	85 c0                	test   %eax,%eax
80101754:	7e 0e                	jle    80101764 <iunlock+0x34>
80101756:	89 75 08             	mov    %esi,0x8(%ebp)
80101759:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010175c:	5b                   	pop    %ebx
8010175d:	5e                   	pop    %esi
8010175e:	5d                   	pop    %ebp
8010175f:	e9 5c 2a 00 00       	jmp    801041c0 <releasesleep>
80101764:	83 ec 0c             	sub    $0xc,%esp
80101767:	68 9b 70 10 80       	push   $0x8010709b
8010176c:	e8 ff eb ff ff       	call   80100370 <panic>
80101771:	eb 0d                	jmp    80101780 <iput>
80101773:	90                   	nop
80101774:	90                   	nop
80101775:	90                   	nop
80101776:	90                   	nop
80101777:	90                   	nop
80101778:	90                   	nop
80101779:	90                   	nop
8010177a:	90                   	nop
8010177b:	90                   	nop
8010177c:	90                   	nop
8010177d:	90                   	nop
8010177e:	90                   	nop
8010177f:	90                   	nop

80101780 <iput>:
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	57                   	push   %edi
80101784:	56                   	push   %esi
80101785:	53                   	push   %ebx
80101786:	83 ec 28             	sub    $0x28,%esp
80101789:	8b 75 08             	mov    0x8(%ebp),%esi
8010178c:	68 00 0a 11 80       	push   $0x80110a00
80101791:	e8 ba 2a 00 00       	call   80104250 <acquire>
80101796:	8b 46 08             	mov    0x8(%esi),%eax
80101799:	83 c4 10             	add    $0x10,%esp
8010179c:	83 f8 01             	cmp    $0x1,%eax
8010179f:	74 1f                	je     801017c0 <iput+0x40>
801017a1:	83 e8 01             	sub    $0x1,%eax
801017a4:	89 46 08             	mov    %eax,0x8(%esi)
801017a7:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
801017ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017b1:	5b                   	pop    %ebx
801017b2:	5e                   	pop    %esi
801017b3:	5f                   	pop    %edi
801017b4:	5d                   	pop    %ebp
801017b5:	e9 76 2c 00 00       	jmp    80104430 <release>
801017ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801017c0:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
801017c4:	74 db                	je     801017a1 <iput+0x21>
801017c6:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017cb:	75 d4                	jne    801017a1 <iput+0x21>
801017cd:	83 ec 0c             	sub    $0xc,%esp
801017d0:	8d 5e 5c             	lea    0x5c(%esi),%ebx
801017d3:	8d be 8c 00 00 00    	lea    0x8c(%esi),%edi
801017d9:	68 00 0a 11 80       	push   $0x80110a00
801017de:	e8 4d 2c 00 00       	call   80104430 <release>
801017e3:	83 c4 10             	add    $0x10,%esp
801017e6:	eb 0f                	jmp    801017f7 <iput+0x77>
801017e8:	90                   	nop
801017e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801017f0:	83 c3 04             	add    $0x4,%ebx
801017f3:	39 fb                	cmp    %edi,%ebx
801017f5:	74 19                	je     80101810 <iput+0x90>
801017f7:	8b 13                	mov    (%ebx),%edx
801017f9:	85 d2                	test   %edx,%edx
801017fb:	74 f3                	je     801017f0 <iput+0x70>
801017fd:	8b 06                	mov    (%esi),%eax
801017ff:	e8 cc fb ff ff       	call   801013d0 <bfree>
80101804:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010180a:	eb e4                	jmp    801017f0 <iput+0x70>
8010180c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101810:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101816:	85 c0                	test   %eax,%eax
80101818:	75 46                	jne    80101860 <iput+0xe0>
8010181a:	83 ec 0c             	sub    $0xc,%esp
8010181d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
80101824:	56                   	push   %esi
80101825:	e8 76 fd ff ff       	call   801015a0 <iupdate>
8010182a:	31 c0                	xor    %eax,%eax
8010182c:	66 89 46 50          	mov    %ax,0x50(%esi)
80101830:	89 34 24             	mov    %esi,(%esp)
80101833:	e8 68 fd ff ff       	call   801015a0 <iupdate>
80101838:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010183f:	e8 0c 2a 00 00       	call   80104250 <acquire>
80101844:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010184b:	8b 46 08             	mov    0x8(%esi),%eax
8010184e:	83 c4 10             	add    $0x10,%esp
80101851:	e9 4b ff ff ff       	jmp    801017a1 <iput+0x21>
80101856:	8d 76 00             	lea    0x0(%esi),%esi
80101859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101860:	83 ec 08             	sub    $0x8,%esp
80101863:	50                   	push   %eax
80101864:	ff 36                	pushl  (%esi)
80101866:	e8 65 e8 ff ff       	call   801000d0 <bread>
8010186b:	83 c4 10             	add    $0x10,%esp
8010186e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101871:	8d 58 5c             	lea    0x5c(%eax),%ebx
80101874:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
8010187a:	eb 0b                	jmp    80101887 <iput+0x107>
8010187c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101880:	83 c3 04             	add    $0x4,%ebx
80101883:	39 df                	cmp    %ebx,%edi
80101885:	74 0f                	je     80101896 <iput+0x116>
80101887:	8b 13                	mov    (%ebx),%edx
80101889:	85 d2                	test   %edx,%edx
8010188b:	74 f3                	je     80101880 <iput+0x100>
8010188d:	8b 06                	mov    (%esi),%eax
8010188f:	e8 3c fb ff ff       	call   801013d0 <bfree>
80101894:	eb ea                	jmp    80101880 <iput+0x100>
80101896:	83 ec 0c             	sub    $0xc,%esp
80101899:	ff 75 e4             	pushl  -0x1c(%ebp)
8010189c:	e8 3f e9 ff ff       	call   801001e0 <brelse>
801018a1:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018a7:	8b 06                	mov    (%esi),%eax
801018a9:	e8 22 fb ff ff       	call   801013d0 <bfree>
801018ae:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018b5:	00 00 00 
801018b8:	83 c4 10             	add    $0x10,%esp
801018bb:	e9 5a ff ff ff       	jmp    8010181a <iput+0x9a>

801018c0 <iunlockput>:
801018c0:	55                   	push   %ebp
801018c1:	89 e5                	mov    %esp,%ebp
801018c3:	53                   	push   %ebx
801018c4:	83 ec 10             	sub    $0x10,%esp
801018c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801018ca:	53                   	push   %ebx
801018cb:	e8 60 fe ff ff       	call   80101730 <iunlock>
801018d0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801018d3:	83 c4 10             	add    $0x10,%esp
801018d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801018d9:	c9                   	leave  
801018da:	e9 a1 fe ff ff       	jmp    80101780 <iput>
801018df:	90                   	nop

801018e0 <stati>:
801018e0:	55                   	push   %ebp
801018e1:	89 e5                	mov    %esp,%ebp
801018e3:	8b 55 08             	mov    0x8(%ebp),%edx
801018e6:	8b 45 0c             	mov    0xc(%ebp),%eax
801018e9:	8b 0a                	mov    (%edx),%ecx
801018eb:	89 48 04             	mov    %ecx,0x4(%eax)
801018ee:	8b 4a 04             	mov    0x4(%edx),%ecx
801018f1:	89 48 08             	mov    %ecx,0x8(%eax)
801018f4:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
801018f8:	66 89 08             	mov    %cx,(%eax)
801018fb:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
801018ff:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101903:	8b 52 58             	mov    0x58(%edx),%edx
80101906:	89 50 10             	mov    %edx,0x10(%eax)
80101909:	5d                   	pop    %ebp
8010190a:	c3                   	ret    
8010190b:	90                   	nop
8010190c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101910 <readi>:
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	57                   	push   %edi
80101914:	56                   	push   %esi
80101915:	53                   	push   %ebx
80101916:	83 ec 1c             	sub    $0x1c,%esp
80101919:	8b 45 08             	mov    0x8(%ebp),%eax
8010191c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010191f:	8b 75 10             	mov    0x10(%ebp),%esi
80101922:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101927:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010192a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010192d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101930:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101933:	0f 84 a7 00 00 00    	je     801019e0 <readi+0xd0>
80101939:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010193c:	8b 40 58             	mov    0x58(%eax),%eax
8010193f:	39 f0                	cmp    %esi,%eax
80101941:	0f 82 c1 00 00 00    	jb     80101a08 <readi+0xf8>
80101947:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010194a:	89 fa                	mov    %edi,%edx
8010194c:	01 f2                	add    %esi,%edx
8010194e:	0f 82 b4 00 00 00    	jb     80101a08 <readi+0xf8>
80101954:	89 c1                	mov    %eax,%ecx
80101956:	29 f1                	sub    %esi,%ecx
80101958:	39 d0                	cmp    %edx,%eax
8010195a:	0f 43 cf             	cmovae %edi,%ecx
8010195d:	31 ff                	xor    %edi,%edi
8010195f:	85 c9                	test   %ecx,%ecx
80101961:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101964:	74 6d                	je     801019d3 <readi+0xc3>
80101966:	8d 76 00             	lea    0x0(%esi),%esi
80101969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101970:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101973:	89 f2                	mov    %esi,%edx
80101975:	c1 ea 09             	shr    $0x9,%edx
80101978:	89 d8                	mov    %ebx,%eax
8010197a:	e8 41 f9 ff ff       	call   801012c0 <bmap>
8010197f:	83 ec 08             	sub    $0x8,%esp
80101982:	50                   	push   %eax
80101983:	ff 33                	pushl  (%ebx)
80101985:	bb 00 02 00 00       	mov    $0x200,%ebx
8010198a:	e8 41 e7 ff ff       	call   801000d0 <bread>
8010198f:	89 c2                	mov    %eax,%edx
80101991:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101994:	89 f1                	mov    %esi,%ecx
80101996:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
8010199c:	83 c4 0c             	add    $0xc,%esp
8010199f:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019a2:	29 cb                	sub    %ecx,%ebx
801019a4:	29 f8                	sub    %edi,%eax
801019a6:	39 c3                	cmp    %eax,%ebx
801019a8:	0f 47 d8             	cmova  %eax,%ebx
801019ab:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019af:	53                   	push   %ebx
801019b0:	01 df                	add    %ebx,%edi
801019b2:	01 de                	add    %ebx,%esi
801019b4:	50                   	push   %eax
801019b5:	ff 75 e0             	pushl  -0x20(%ebp)
801019b8:	e8 73 2b 00 00       	call   80104530 <memmove>
801019bd:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019c0:	89 14 24             	mov    %edx,(%esp)
801019c3:	e8 18 e8 ff ff       	call   801001e0 <brelse>
801019c8:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019cb:	83 c4 10             	add    $0x10,%esp
801019ce:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801019d1:	77 9d                	ja     80101970 <readi+0x60>
801019d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019d9:	5b                   	pop    %ebx
801019da:	5e                   	pop    %esi
801019db:	5f                   	pop    %edi
801019dc:	5d                   	pop    %ebp
801019dd:	c3                   	ret    
801019de:	66 90                	xchg   %ax,%ax
801019e0:	0f bf 40 52          	movswl 0x52(%eax),%eax
801019e4:	66 83 f8 09          	cmp    $0x9,%ax
801019e8:	77 1e                	ja     80101a08 <readi+0xf8>
801019ea:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
801019f1:	85 c0                	test   %eax,%eax
801019f3:	74 13                	je     80101a08 <readi+0xf8>
801019f5:	89 7d 10             	mov    %edi,0x10(%ebp)
801019f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019fb:	5b                   	pop    %ebx
801019fc:	5e                   	pop    %esi
801019fd:	5f                   	pop    %edi
801019fe:	5d                   	pop    %ebp
801019ff:	ff e0                	jmp    *%eax
80101a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a0d:	eb c7                	jmp    801019d6 <readi+0xc6>
80101a0f:	90                   	nop

80101a10 <writei>:
80101a10:	55                   	push   %ebp
80101a11:	89 e5                	mov    %esp,%ebp
80101a13:	57                   	push   %edi
80101a14:	56                   	push   %esi
80101a15:	53                   	push   %ebx
80101a16:	83 ec 1c             	sub    $0x1c,%esp
80101a19:	8b 45 08             	mov    0x8(%ebp),%eax
80101a1c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a1f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a22:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a27:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a2a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a2d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a30:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a33:	0f 84 b7 00 00 00    	je     80101af0 <writei+0xe0>
80101a39:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a3c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a3f:	0f 82 eb 00 00 00    	jb     80101b30 <writei+0x120>
80101a45:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a48:	89 f8                	mov    %edi,%eax
80101a4a:	01 f0                	add    %esi,%eax
80101a4c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a51:	0f 87 d9 00 00 00    	ja     80101b30 <writei+0x120>
80101a57:	39 c6                	cmp    %eax,%esi
80101a59:	0f 87 d1 00 00 00    	ja     80101b30 <writei+0x120>
80101a5f:	85 ff                	test   %edi,%edi
80101a61:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a68:	74 78                	je     80101ae2 <writei+0xd2>
80101a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101a70:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a73:	89 f2                	mov    %esi,%edx
80101a75:	bb 00 02 00 00       	mov    $0x200,%ebx
80101a7a:	c1 ea 09             	shr    $0x9,%edx
80101a7d:	89 f8                	mov    %edi,%eax
80101a7f:	e8 3c f8 ff ff       	call   801012c0 <bmap>
80101a84:	83 ec 08             	sub    $0x8,%esp
80101a87:	50                   	push   %eax
80101a88:	ff 37                	pushl  (%edi)
80101a8a:	e8 41 e6 ff ff       	call   801000d0 <bread>
80101a8f:	89 c7                	mov    %eax,%edi
80101a91:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101a94:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101a97:	89 f1                	mov    %esi,%ecx
80101a99:	83 c4 0c             	add    $0xc,%esp
80101a9c:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101aa2:	29 cb                	sub    %ecx,%ebx
80101aa4:	39 c3                	cmp    %eax,%ebx
80101aa6:	0f 47 d8             	cmova  %eax,%ebx
80101aa9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101aad:	53                   	push   %ebx
80101aae:	ff 75 dc             	pushl  -0x24(%ebp)
80101ab1:	01 de                	add    %ebx,%esi
80101ab3:	50                   	push   %eax
80101ab4:	e8 77 2a 00 00       	call   80104530 <memmove>
80101ab9:	89 3c 24             	mov    %edi,(%esp)
80101abc:	e8 cf 12 00 00       	call   80102d90 <log_write>
80101ac1:	89 3c 24             	mov    %edi,(%esp)
80101ac4:	e8 17 e7 ff ff       	call   801001e0 <brelse>
80101ac9:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101acc:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101acf:	83 c4 10             	add    $0x10,%esp
80101ad2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ad5:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101ad8:	77 96                	ja     80101a70 <writei+0x60>
80101ada:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101add:	3b 70 58             	cmp    0x58(%eax),%esi
80101ae0:	77 36                	ja     80101b18 <writei+0x108>
80101ae2:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ae5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ae8:	5b                   	pop    %ebx
80101ae9:	5e                   	pop    %esi
80101aea:	5f                   	pop    %edi
80101aeb:	5d                   	pop    %ebp
80101aec:	c3                   	ret    
80101aed:	8d 76 00             	lea    0x0(%esi),%esi
80101af0:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101af4:	66 83 f8 09          	cmp    $0x9,%ax
80101af8:	77 36                	ja     80101b30 <writei+0x120>
80101afa:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101b01:	85 c0                	test   %eax,%eax
80101b03:	74 2b                	je     80101b30 <writei+0x120>
80101b05:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b0b:	5b                   	pop    %ebx
80101b0c:	5e                   	pop    %esi
80101b0d:	5f                   	pop    %edi
80101b0e:	5d                   	pop    %ebp
80101b0f:	ff e0                	jmp    *%eax
80101b11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b18:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b1b:	83 ec 0c             	sub    $0xc,%esp
80101b1e:	89 70 58             	mov    %esi,0x58(%eax)
80101b21:	50                   	push   %eax
80101b22:	e8 79 fa ff ff       	call   801015a0 <iupdate>
80101b27:	83 c4 10             	add    $0x10,%esp
80101b2a:	eb b6                	jmp    80101ae2 <writei+0xd2>
80101b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b35:	eb ae                	jmp    80101ae5 <writei+0xd5>
80101b37:	89 f6                	mov    %esi,%esi
80101b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b40 <namecmp>:
80101b40:	55                   	push   %ebp
80101b41:	89 e5                	mov    %esp,%ebp
80101b43:	83 ec 0c             	sub    $0xc,%esp
80101b46:	6a 0e                	push   $0xe
80101b48:	ff 75 0c             	pushl  0xc(%ebp)
80101b4b:	ff 75 08             	pushl  0x8(%ebp)
80101b4e:	e8 5d 2a 00 00       	call   801045b0 <strncmp>
80101b53:	c9                   	leave  
80101b54:	c3                   	ret    
80101b55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b60 <dirlookup>:
80101b60:	55                   	push   %ebp
80101b61:	89 e5                	mov    %esp,%ebp
80101b63:	57                   	push   %edi
80101b64:	56                   	push   %esi
80101b65:	53                   	push   %ebx
80101b66:	83 ec 1c             	sub    $0x1c,%esp
80101b69:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101b6c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101b71:	0f 85 80 00 00 00    	jne    80101bf7 <dirlookup+0x97>
80101b77:	8b 53 58             	mov    0x58(%ebx),%edx
80101b7a:	31 ff                	xor    %edi,%edi
80101b7c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101b7f:	85 d2                	test   %edx,%edx
80101b81:	75 0d                	jne    80101b90 <dirlookup+0x30>
80101b83:	eb 5b                	jmp    80101be0 <dirlookup+0x80>
80101b85:	8d 76 00             	lea    0x0(%esi),%esi
80101b88:	83 c7 10             	add    $0x10,%edi
80101b8b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101b8e:	76 50                	jbe    80101be0 <dirlookup+0x80>
80101b90:	6a 10                	push   $0x10
80101b92:	57                   	push   %edi
80101b93:	56                   	push   %esi
80101b94:	53                   	push   %ebx
80101b95:	e8 76 fd ff ff       	call   80101910 <readi>
80101b9a:	83 c4 10             	add    $0x10,%esp
80101b9d:	83 f8 10             	cmp    $0x10,%eax
80101ba0:	75 48                	jne    80101bea <dirlookup+0x8a>
80101ba2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101ba7:	74 df                	je     80101b88 <dirlookup+0x28>
80101ba9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bac:	83 ec 04             	sub    $0x4,%esp
80101baf:	6a 0e                	push   $0xe
80101bb1:	50                   	push   %eax
80101bb2:	ff 75 0c             	pushl  0xc(%ebp)
80101bb5:	e8 f6 29 00 00       	call   801045b0 <strncmp>
80101bba:	83 c4 10             	add    $0x10,%esp
80101bbd:	85 c0                	test   %eax,%eax
80101bbf:	75 c7                	jne    80101b88 <dirlookup+0x28>
80101bc1:	8b 45 10             	mov    0x10(%ebp),%eax
80101bc4:	85 c0                	test   %eax,%eax
80101bc6:	74 05                	je     80101bcd <dirlookup+0x6d>
80101bc8:	8b 45 10             	mov    0x10(%ebp),%eax
80101bcb:	89 38                	mov    %edi,(%eax)
80101bcd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101bd1:	8b 03                	mov    (%ebx),%eax
80101bd3:	e8 18 f6 ff ff       	call   801011f0 <iget>
80101bd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101bdb:	5b                   	pop    %ebx
80101bdc:	5e                   	pop    %esi
80101bdd:	5f                   	pop    %edi
80101bde:	5d                   	pop    %ebp
80101bdf:	c3                   	ret    
80101be0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101be3:	31 c0                	xor    %eax,%eax
80101be5:	5b                   	pop    %ebx
80101be6:	5e                   	pop    %esi
80101be7:	5f                   	pop    %edi
80101be8:	5d                   	pop    %ebp
80101be9:	c3                   	ret    
80101bea:	83 ec 0c             	sub    $0xc,%esp
80101bed:	68 b5 70 10 80       	push   $0x801070b5
80101bf2:	e8 79 e7 ff ff       	call   80100370 <panic>
80101bf7:	83 ec 0c             	sub    $0xc,%esp
80101bfa:	68 a3 70 10 80       	push   $0x801070a3
80101bff:	e8 6c e7 ff ff       	call   80100370 <panic>
80101c04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c10 <namex>:
80101c10:	55                   	push   %ebp
80101c11:	89 e5                	mov    %esp,%ebp
80101c13:	57                   	push   %edi
80101c14:	56                   	push   %esi
80101c15:	53                   	push   %ebx
80101c16:	89 cf                	mov    %ecx,%edi
80101c18:	89 c3                	mov    %eax,%ebx
80101c1a:	83 ec 1c             	sub    $0x1c,%esp
80101c1d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c20:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c23:	0f 84 53 01 00 00    	je     80101d7c <namex+0x16c>
80101c29:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80101c2f:	83 ec 0c             	sub    $0xc,%esp
80101c32:	8b 70 68             	mov    0x68(%eax),%esi
80101c35:	68 00 0a 11 80       	push   $0x80110a00
80101c3a:	e8 11 26 00 00       	call   80104250 <acquire>
80101c3f:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101c43:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c4a:	e8 e1 27 00 00       	call   80104430 <release>
80101c4f:	83 c4 10             	add    $0x10,%esp
80101c52:	eb 07                	jmp    80101c5b <namex+0x4b>
80101c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c58:	83 c3 01             	add    $0x1,%ebx
80101c5b:	0f b6 03             	movzbl (%ebx),%eax
80101c5e:	3c 2f                	cmp    $0x2f,%al
80101c60:	74 f6                	je     80101c58 <namex+0x48>
80101c62:	84 c0                	test   %al,%al
80101c64:	0f 84 e3 00 00 00    	je     80101d4d <namex+0x13d>
80101c6a:	0f b6 03             	movzbl (%ebx),%eax
80101c6d:	89 da                	mov    %ebx,%edx
80101c6f:	84 c0                	test   %al,%al
80101c71:	0f 84 ac 00 00 00    	je     80101d23 <namex+0x113>
80101c77:	3c 2f                	cmp    $0x2f,%al
80101c79:	75 09                	jne    80101c84 <namex+0x74>
80101c7b:	e9 a3 00 00 00       	jmp    80101d23 <namex+0x113>
80101c80:	84 c0                	test   %al,%al
80101c82:	74 0a                	je     80101c8e <namex+0x7e>
80101c84:	83 c2 01             	add    $0x1,%edx
80101c87:	0f b6 02             	movzbl (%edx),%eax
80101c8a:	3c 2f                	cmp    $0x2f,%al
80101c8c:	75 f2                	jne    80101c80 <namex+0x70>
80101c8e:	89 d1                	mov    %edx,%ecx
80101c90:	29 d9                	sub    %ebx,%ecx
80101c92:	83 f9 0d             	cmp    $0xd,%ecx
80101c95:	0f 8e 8d 00 00 00    	jle    80101d28 <namex+0x118>
80101c9b:	83 ec 04             	sub    $0x4,%esp
80101c9e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ca1:	6a 0e                	push   $0xe
80101ca3:	53                   	push   %ebx
80101ca4:	57                   	push   %edi
80101ca5:	e8 86 28 00 00       	call   80104530 <memmove>
80101caa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101cad:	83 c4 10             	add    $0x10,%esp
80101cb0:	89 d3                	mov    %edx,%ebx
80101cb2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cb5:	75 11                	jne    80101cc8 <namex+0xb8>
80101cb7:	89 f6                	mov    %esi,%esi
80101cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101cc0:	83 c3 01             	add    $0x1,%ebx
80101cc3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101cc6:	74 f8                	je     80101cc0 <namex+0xb0>
80101cc8:	83 ec 0c             	sub    $0xc,%esp
80101ccb:	56                   	push   %esi
80101ccc:	e8 7f f9 ff ff       	call   80101650 <ilock>
80101cd1:	83 c4 10             	add    $0x10,%esp
80101cd4:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101cd9:	0f 85 7f 00 00 00    	jne    80101d5e <namex+0x14e>
80101cdf:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101ce2:	85 d2                	test   %edx,%edx
80101ce4:	74 09                	je     80101cef <namex+0xdf>
80101ce6:	80 3b 00             	cmpb   $0x0,(%ebx)
80101ce9:	0f 84 a3 00 00 00    	je     80101d92 <namex+0x182>
80101cef:	83 ec 04             	sub    $0x4,%esp
80101cf2:	6a 00                	push   $0x0
80101cf4:	57                   	push   %edi
80101cf5:	56                   	push   %esi
80101cf6:	e8 65 fe ff ff       	call   80101b60 <dirlookup>
80101cfb:	83 c4 10             	add    $0x10,%esp
80101cfe:	85 c0                	test   %eax,%eax
80101d00:	74 5c                	je     80101d5e <namex+0x14e>
80101d02:	83 ec 0c             	sub    $0xc,%esp
80101d05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d08:	56                   	push   %esi
80101d09:	e8 22 fa ff ff       	call   80101730 <iunlock>
80101d0e:	89 34 24             	mov    %esi,(%esp)
80101d11:	e8 6a fa ff ff       	call   80101780 <iput>
80101d16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d19:	83 c4 10             	add    $0x10,%esp
80101d1c:	89 c6                	mov    %eax,%esi
80101d1e:	e9 38 ff ff ff       	jmp    80101c5b <namex+0x4b>
80101d23:	31 c9                	xor    %ecx,%ecx
80101d25:	8d 76 00             	lea    0x0(%esi),%esi
80101d28:	83 ec 04             	sub    $0x4,%esp
80101d2b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d2e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d31:	51                   	push   %ecx
80101d32:	53                   	push   %ebx
80101d33:	57                   	push   %edi
80101d34:	e8 f7 27 00 00       	call   80104530 <memmove>
80101d39:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d3c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d3f:	83 c4 10             	add    $0x10,%esp
80101d42:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d46:	89 d3                	mov    %edx,%ebx
80101d48:	e9 65 ff ff ff       	jmp    80101cb2 <namex+0xa2>
80101d4d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d50:	85 c0                	test   %eax,%eax
80101d52:	75 54                	jne    80101da8 <namex+0x198>
80101d54:	89 f0                	mov    %esi,%eax
80101d56:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d59:	5b                   	pop    %ebx
80101d5a:	5e                   	pop    %esi
80101d5b:	5f                   	pop    %edi
80101d5c:	5d                   	pop    %ebp
80101d5d:	c3                   	ret    
80101d5e:	83 ec 0c             	sub    $0xc,%esp
80101d61:	56                   	push   %esi
80101d62:	e8 c9 f9 ff ff       	call   80101730 <iunlock>
80101d67:	89 34 24             	mov    %esi,(%esp)
80101d6a:	e8 11 fa ff ff       	call   80101780 <iput>
80101d6f:	83 c4 10             	add    $0x10,%esp
80101d72:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d75:	31 c0                	xor    %eax,%eax
80101d77:	5b                   	pop    %ebx
80101d78:	5e                   	pop    %esi
80101d79:	5f                   	pop    %edi
80101d7a:	5d                   	pop    %ebp
80101d7b:	c3                   	ret    
80101d7c:	ba 01 00 00 00       	mov    $0x1,%edx
80101d81:	b8 01 00 00 00       	mov    $0x1,%eax
80101d86:	e8 65 f4 ff ff       	call   801011f0 <iget>
80101d8b:	89 c6                	mov    %eax,%esi
80101d8d:	e9 c9 fe ff ff       	jmp    80101c5b <namex+0x4b>
80101d92:	83 ec 0c             	sub    $0xc,%esp
80101d95:	56                   	push   %esi
80101d96:	e8 95 f9 ff ff       	call   80101730 <iunlock>
80101d9b:	83 c4 10             	add    $0x10,%esp
80101d9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101da1:	89 f0                	mov    %esi,%eax
80101da3:	5b                   	pop    %ebx
80101da4:	5e                   	pop    %esi
80101da5:	5f                   	pop    %edi
80101da6:	5d                   	pop    %ebp
80101da7:	c3                   	ret    
80101da8:	83 ec 0c             	sub    $0xc,%esp
80101dab:	56                   	push   %esi
80101dac:	e8 cf f9 ff ff       	call   80101780 <iput>
80101db1:	83 c4 10             	add    $0x10,%esp
80101db4:	31 c0                	xor    %eax,%eax
80101db6:	eb 9e                	jmp    80101d56 <namex+0x146>
80101db8:	90                   	nop
80101db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101dc0 <dirlink>:
80101dc0:	55                   	push   %ebp
80101dc1:	89 e5                	mov    %esp,%ebp
80101dc3:	57                   	push   %edi
80101dc4:	56                   	push   %esi
80101dc5:	53                   	push   %ebx
80101dc6:	83 ec 20             	sub    $0x20,%esp
80101dc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101dcc:	6a 00                	push   $0x0
80101dce:	ff 75 0c             	pushl  0xc(%ebp)
80101dd1:	53                   	push   %ebx
80101dd2:	e8 89 fd ff ff       	call   80101b60 <dirlookup>
80101dd7:	83 c4 10             	add    $0x10,%esp
80101dda:	85 c0                	test   %eax,%eax
80101ddc:	75 67                	jne    80101e45 <dirlink+0x85>
80101dde:	8b 7b 58             	mov    0x58(%ebx),%edi
80101de1:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101de4:	85 ff                	test   %edi,%edi
80101de6:	74 29                	je     80101e11 <dirlink+0x51>
80101de8:	31 ff                	xor    %edi,%edi
80101dea:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101ded:	eb 09                	jmp    80101df8 <dirlink+0x38>
80101def:	90                   	nop
80101df0:	83 c7 10             	add    $0x10,%edi
80101df3:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101df6:	76 19                	jbe    80101e11 <dirlink+0x51>
80101df8:	6a 10                	push   $0x10
80101dfa:	57                   	push   %edi
80101dfb:	56                   	push   %esi
80101dfc:	53                   	push   %ebx
80101dfd:	e8 0e fb ff ff       	call   80101910 <readi>
80101e02:	83 c4 10             	add    $0x10,%esp
80101e05:	83 f8 10             	cmp    $0x10,%eax
80101e08:	75 4e                	jne    80101e58 <dirlink+0x98>
80101e0a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e0f:	75 df                	jne    80101df0 <dirlink+0x30>
80101e11:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e14:	83 ec 04             	sub    $0x4,%esp
80101e17:	6a 0e                	push   $0xe
80101e19:	ff 75 0c             	pushl  0xc(%ebp)
80101e1c:	50                   	push   %eax
80101e1d:	e8 fe 27 00 00       	call   80104620 <strncpy>
80101e22:	8b 45 10             	mov    0x10(%ebp),%eax
80101e25:	6a 10                	push   $0x10
80101e27:	57                   	push   %edi
80101e28:	56                   	push   %esi
80101e29:	53                   	push   %ebx
80101e2a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e2e:	e8 dd fb ff ff       	call   80101a10 <writei>
80101e33:	83 c4 20             	add    $0x20,%esp
80101e36:	83 f8 10             	cmp    $0x10,%eax
80101e39:	75 2a                	jne    80101e65 <dirlink+0xa5>
80101e3b:	31 c0                	xor    %eax,%eax
80101e3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e40:	5b                   	pop    %ebx
80101e41:	5e                   	pop    %esi
80101e42:	5f                   	pop    %edi
80101e43:	5d                   	pop    %ebp
80101e44:	c3                   	ret    
80101e45:	83 ec 0c             	sub    $0xc,%esp
80101e48:	50                   	push   %eax
80101e49:	e8 32 f9 ff ff       	call   80101780 <iput>
80101e4e:	83 c4 10             	add    $0x10,%esp
80101e51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e56:	eb e5                	jmp    80101e3d <dirlink+0x7d>
80101e58:	83 ec 0c             	sub    $0xc,%esp
80101e5b:	68 b5 70 10 80       	push   $0x801070b5
80101e60:	e8 0b e5 ff ff       	call   80100370 <panic>
80101e65:	83 ec 0c             	sub    $0xc,%esp
80101e68:	68 7e 76 10 80       	push   $0x8010767e
80101e6d:	e8 fe e4 ff ff       	call   80100370 <panic>
80101e72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101e80 <namei>:
80101e80:	55                   	push   %ebp
80101e81:	31 d2                	xor    %edx,%edx
80101e83:	89 e5                	mov    %esp,%ebp
80101e85:	83 ec 18             	sub    $0x18,%esp
80101e88:	8b 45 08             	mov    0x8(%ebp),%eax
80101e8b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101e8e:	e8 7d fd ff ff       	call   80101c10 <namex>
80101e93:	c9                   	leave  
80101e94:	c3                   	ret    
80101e95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ea0 <nameiparent>:
80101ea0:	55                   	push   %ebp
80101ea1:	ba 01 00 00 00       	mov    $0x1,%edx
80101ea6:	89 e5                	mov    %esp,%ebp
80101ea8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eab:	8b 45 08             	mov    0x8(%ebp),%eax
80101eae:	5d                   	pop    %ebp
80101eaf:	e9 5c fd ff ff       	jmp    80101c10 <namex>
80101eb4:	66 90                	xchg   %ax,%ax
80101eb6:	66 90                	xchg   %ax,%ax
80101eb8:	66 90                	xchg   %ax,%ax
80101eba:	66 90                	xchg   %ax,%ax
80101ebc:	66 90                	xchg   %ax,%ax
80101ebe:	66 90                	xchg   %ax,%ax

80101ec0 <idestart>:
80101ec0:	55                   	push   %ebp
80101ec1:	85 c0                	test   %eax,%eax
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	56                   	push   %esi
80101ec6:	53                   	push   %ebx
80101ec7:	0f 84 ad 00 00 00    	je     80101f7a <idestart+0xba>
80101ecd:	8b 58 08             	mov    0x8(%eax),%ebx
80101ed0:	89 c1                	mov    %eax,%ecx
80101ed2:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101ed8:	0f 87 8f 00 00 00    	ja     80101f6d <idestart+0xad>
80101ede:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ee3:	90                   	nop
80101ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ee8:	ec                   	in     (%dx),%al
80101ee9:	83 e0 c0             	and    $0xffffffc0,%eax
80101eec:	3c 40                	cmp    $0x40,%al
80101eee:	75 f8                	jne    80101ee8 <idestart+0x28>
80101ef0:	31 f6                	xor    %esi,%esi
80101ef2:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101ef7:	89 f0                	mov    %esi,%eax
80101ef9:	ee                   	out    %al,(%dx)
80101efa:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101eff:	b8 01 00 00 00       	mov    $0x1,%eax
80101f04:	ee                   	out    %al,(%dx)
80101f05:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f0a:	89 d8                	mov    %ebx,%eax
80101f0c:	ee                   	out    %al,(%dx)
80101f0d:	89 d8                	mov    %ebx,%eax
80101f0f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f14:	c1 f8 08             	sar    $0x8,%eax
80101f17:	ee                   	out    %al,(%dx)
80101f18:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f1d:	89 f0                	mov    %esi,%eax
80101f1f:	ee                   	out    %al,(%dx)
80101f20:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f24:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f29:	83 e0 01             	and    $0x1,%eax
80101f2c:	c1 e0 04             	shl    $0x4,%eax
80101f2f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f32:	ee                   	out    %al,(%dx)
80101f33:	f6 01 04             	testb  $0x4,(%ecx)
80101f36:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f3b:	75 13                	jne    80101f50 <idestart+0x90>
80101f3d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f42:	ee                   	out    %al,(%dx)
80101f43:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f46:	5b                   	pop    %ebx
80101f47:	5e                   	pop    %esi
80101f48:	5d                   	pop    %ebp
80101f49:	c3                   	ret    
80101f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f50:	b8 30 00 00 00       	mov    $0x30,%eax
80101f55:	ee                   	out    %al,(%dx)
80101f56:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101f5b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f5e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f63:	fc                   	cld    
80101f64:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101f66:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f69:	5b                   	pop    %ebx
80101f6a:	5e                   	pop    %esi
80101f6b:	5d                   	pop    %ebp
80101f6c:	c3                   	ret    
80101f6d:	83 ec 0c             	sub    $0xc,%esp
80101f70:	68 20 71 10 80       	push   $0x80107120
80101f75:	e8 f6 e3 ff ff       	call   80100370 <panic>
80101f7a:	83 ec 0c             	sub    $0xc,%esp
80101f7d:	68 17 71 10 80       	push   $0x80107117
80101f82:	e8 e9 e3 ff ff       	call   80100370 <panic>
80101f87:	89 f6                	mov    %esi,%esi
80101f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f90 <ideinit>:
80101f90:	55                   	push   %ebp
80101f91:	89 e5                	mov    %esp,%ebp
80101f93:	83 ec 10             	sub    $0x10,%esp
80101f96:	68 32 71 10 80       	push   $0x80107132
80101f9b:	68 80 a5 10 80       	push   $0x8010a580
80101fa0:	e8 8b 22 00 00       	call   80104230 <initlock>
80101fa5:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80101fac:	e8 cf 12 00 00       	call   80103280 <picenable>
80101fb1:	58                   	pop    %eax
80101fb2:	a1 80 2d 11 80       	mov    0x80112d80,%eax
80101fb7:	5a                   	pop    %edx
80101fb8:	83 e8 01             	sub    $0x1,%eax
80101fbb:	50                   	push   %eax
80101fbc:	6a 0e                	push   $0xe
80101fbe:	e8 bd 02 00 00       	call   80102280 <ioapicenable>
80101fc3:	83 c4 10             	add    $0x10,%esp
80101fc6:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fcb:	90                   	nop
80101fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101fd0:	ec                   	in     (%dx),%al
80101fd1:	83 e0 c0             	and    $0xffffffc0,%eax
80101fd4:	3c 40                	cmp    $0x40,%al
80101fd6:	75 f8                	jne    80101fd0 <ideinit+0x40>
80101fd8:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fdd:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101fe2:	ee                   	out    %al,(%dx)
80101fe3:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80101fe8:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fed:	eb 06                	jmp    80101ff5 <ideinit+0x65>
80101fef:	90                   	nop
80101ff0:	83 e9 01             	sub    $0x1,%ecx
80101ff3:	74 0f                	je     80102004 <ideinit+0x74>
80101ff5:	ec                   	in     (%dx),%al
80101ff6:	84 c0                	test   %al,%al
80101ff8:	74 f6                	je     80101ff0 <ideinit+0x60>
80101ffa:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102001:	00 00 00 
80102004:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102009:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010200e:	ee                   	out    %al,(%dx)
8010200f:	c9                   	leave  
80102010:	c3                   	ret    
80102011:	eb 0d                	jmp    80102020 <ideintr>
80102013:	90                   	nop
80102014:	90                   	nop
80102015:	90                   	nop
80102016:	90                   	nop
80102017:	90                   	nop
80102018:	90                   	nop
80102019:	90                   	nop
8010201a:	90                   	nop
8010201b:	90                   	nop
8010201c:	90                   	nop
8010201d:	90                   	nop
8010201e:	90                   	nop
8010201f:	90                   	nop

80102020 <ideintr>:
80102020:	55                   	push   %ebp
80102021:	89 e5                	mov    %esp,%ebp
80102023:	57                   	push   %edi
80102024:	56                   	push   %esi
80102025:	53                   	push   %ebx
80102026:	83 ec 18             	sub    $0x18,%esp
80102029:	68 80 a5 10 80       	push   $0x8010a580
8010202e:	e8 1d 22 00 00       	call   80104250 <acquire>
80102033:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102039:	83 c4 10             	add    $0x10,%esp
8010203c:	85 db                	test   %ebx,%ebx
8010203e:	74 34                	je     80102074 <ideintr+0x54>
80102040:	8b 43 58             	mov    0x58(%ebx),%eax
80102043:	a3 64 a5 10 80       	mov    %eax,0x8010a564
80102048:	8b 33                	mov    (%ebx),%esi
8010204a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102050:	74 3e                	je     80102090 <ideintr+0x70>
80102052:	83 e6 fb             	and    $0xfffffffb,%esi
80102055:	83 ec 0c             	sub    $0xc,%esp
80102058:	83 ce 02             	or     $0x2,%esi
8010205b:	89 33                	mov    %esi,(%ebx)
8010205d:	53                   	push   %ebx
8010205e:	e8 0d 1f 00 00       	call   80103f70 <wakeup>
80102063:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102068:	83 c4 10             	add    $0x10,%esp
8010206b:	85 c0                	test   %eax,%eax
8010206d:	74 05                	je     80102074 <ideintr+0x54>
8010206f:	e8 4c fe ff ff       	call   80101ec0 <idestart>
80102074:	83 ec 0c             	sub    $0xc,%esp
80102077:	68 80 a5 10 80       	push   $0x8010a580
8010207c:	e8 af 23 00 00       	call   80104430 <release>
80102081:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102084:	5b                   	pop    %ebx
80102085:	5e                   	pop    %esi
80102086:	5f                   	pop    %edi
80102087:	5d                   	pop    %ebp
80102088:	c3                   	ret    
80102089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102090:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102095:	8d 76 00             	lea    0x0(%esi),%esi
80102098:	ec                   	in     (%dx),%al
80102099:	89 c1                	mov    %eax,%ecx
8010209b:	83 e1 c0             	and    $0xffffffc0,%ecx
8010209e:	80 f9 40             	cmp    $0x40,%cl
801020a1:	75 f5                	jne    80102098 <ideintr+0x78>
801020a3:	a8 21                	test   $0x21,%al
801020a5:	75 ab                	jne    80102052 <ideintr+0x32>
801020a7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801020aa:	b9 80 00 00 00       	mov    $0x80,%ecx
801020af:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020b4:	fc                   	cld    
801020b5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020b7:	8b 33                	mov    (%ebx),%esi
801020b9:	eb 97                	jmp    80102052 <ideintr+0x32>
801020bb:	90                   	nop
801020bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020c0 <iderw>:
801020c0:	55                   	push   %ebp
801020c1:	89 e5                	mov    %esp,%ebp
801020c3:	53                   	push   %ebx
801020c4:	83 ec 10             	sub    $0x10,%esp
801020c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801020ca:	8d 43 0c             	lea    0xc(%ebx),%eax
801020cd:	50                   	push   %eax
801020ce:	e8 2d 21 00 00       	call   80104200 <holdingsleep>
801020d3:	83 c4 10             	add    $0x10,%esp
801020d6:	85 c0                	test   %eax,%eax
801020d8:	0f 84 ad 00 00 00    	je     8010218b <iderw+0xcb>
801020de:	8b 03                	mov    (%ebx),%eax
801020e0:	83 e0 06             	and    $0x6,%eax
801020e3:	83 f8 02             	cmp    $0x2,%eax
801020e6:	0f 84 b9 00 00 00    	je     801021a5 <iderw+0xe5>
801020ec:	8b 53 04             	mov    0x4(%ebx),%edx
801020ef:	85 d2                	test   %edx,%edx
801020f1:	74 0d                	je     80102100 <iderw+0x40>
801020f3:	a1 60 a5 10 80       	mov    0x8010a560,%eax
801020f8:	85 c0                	test   %eax,%eax
801020fa:	0f 84 98 00 00 00    	je     80102198 <iderw+0xd8>
80102100:	83 ec 0c             	sub    $0xc,%esp
80102103:	68 80 a5 10 80       	push   $0x8010a580
80102108:	e8 43 21 00 00       	call   80104250 <acquire>
8010210d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102113:	83 c4 10             	add    $0x10,%esp
80102116:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010211d:	85 d2                	test   %edx,%edx
8010211f:	75 09                	jne    8010212a <iderw+0x6a>
80102121:	eb 58                	jmp    8010217b <iderw+0xbb>
80102123:	90                   	nop
80102124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102128:	89 c2                	mov    %eax,%edx
8010212a:	8b 42 58             	mov    0x58(%edx),%eax
8010212d:	85 c0                	test   %eax,%eax
8010212f:	75 f7                	jne    80102128 <iderw+0x68>
80102131:	83 c2 58             	add    $0x58,%edx
80102134:	89 1a                	mov    %ebx,(%edx)
80102136:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010213c:	74 44                	je     80102182 <iderw+0xc2>
8010213e:	8b 03                	mov    (%ebx),%eax
80102140:	83 e0 06             	and    $0x6,%eax
80102143:	83 f8 02             	cmp    $0x2,%eax
80102146:	74 23                	je     8010216b <iderw+0xab>
80102148:	90                   	nop
80102149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102150:	83 ec 08             	sub    $0x8,%esp
80102153:	68 80 a5 10 80       	push   $0x8010a580
80102158:	53                   	push   %ebx
80102159:	e8 72 1c 00 00       	call   80103dd0 <sleep>
8010215e:	8b 03                	mov    (%ebx),%eax
80102160:	83 c4 10             	add    $0x10,%esp
80102163:	83 e0 06             	and    $0x6,%eax
80102166:	83 f8 02             	cmp    $0x2,%eax
80102169:	75 e5                	jne    80102150 <iderw+0x90>
8010216b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
80102172:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102175:	c9                   	leave  
80102176:	e9 b5 22 00 00       	jmp    80104430 <release>
8010217b:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102180:	eb b2                	jmp    80102134 <iderw+0x74>
80102182:	89 d8                	mov    %ebx,%eax
80102184:	e8 37 fd ff ff       	call   80101ec0 <idestart>
80102189:	eb b3                	jmp    8010213e <iderw+0x7e>
8010218b:	83 ec 0c             	sub    $0xc,%esp
8010218e:	68 36 71 10 80       	push   $0x80107136
80102193:	e8 d8 e1 ff ff       	call   80100370 <panic>
80102198:	83 ec 0c             	sub    $0xc,%esp
8010219b:	68 61 71 10 80       	push   $0x80107161
801021a0:	e8 cb e1 ff ff       	call   80100370 <panic>
801021a5:	83 ec 0c             	sub    $0xc,%esp
801021a8:	68 4c 71 10 80       	push   $0x8010714c
801021ad:	e8 be e1 ff ff       	call   80100370 <panic>
801021b2:	66 90                	xchg   %ax,%ax
801021b4:	66 90                	xchg   %ax,%ax
801021b6:	66 90                	xchg   %ax,%ax
801021b8:	66 90                	xchg   %ax,%ax
801021ba:	66 90                	xchg   %ax,%ax
801021bc:	66 90                	xchg   %ax,%ax
801021be:	66 90                	xchg   %ax,%ax

801021c0 <ioapicinit>:
801021c0:	a1 84 27 11 80       	mov    0x80112784,%eax
801021c5:	85 c0                	test   %eax,%eax
801021c7:	0f 84 a8 00 00 00    	je     80102275 <ioapicinit+0xb5>
801021cd:	55                   	push   %ebp
801021ce:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
801021d5:	00 c0 fe 
801021d8:	89 e5                	mov    %esp,%ebp
801021da:	56                   	push   %esi
801021db:	53                   	push   %ebx
801021dc:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801021e3:	00 00 00 
801021e6:	8b 15 54 26 11 80    	mov    0x80112654,%edx
801021ec:	8b 72 10             	mov    0x10(%edx),%esi
801021ef:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
801021f5:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801021fb:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80102202:	89 f0                	mov    %esi,%eax
80102204:	c1 e8 10             	shr    $0x10,%eax
80102207:	0f b6 f0             	movzbl %al,%esi
8010220a:	8b 41 10             	mov    0x10(%ecx),%eax
8010220d:	c1 e8 18             	shr    $0x18,%eax
80102210:	39 d0                	cmp    %edx,%eax
80102212:	74 16                	je     8010222a <ioapicinit+0x6a>
80102214:	83 ec 0c             	sub    $0xc,%esp
80102217:	68 80 71 10 80       	push   $0x80107180
8010221c:	e8 3f e4 ff ff       	call   80100660 <cprintf>
80102221:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102227:	83 c4 10             	add    $0x10,%esp
8010222a:	83 c6 21             	add    $0x21,%esi
8010222d:	ba 10 00 00 00       	mov    $0x10,%edx
80102232:	b8 20 00 00 00       	mov    $0x20,%eax
80102237:	89 f6                	mov    %esi,%esi
80102239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102240:	89 11                	mov    %edx,(%ecx)
80102242:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102248:	89 c3                	mov    %eax,%ebx
8010224a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102250:	83 c0 01             	add    $0x1,%eax
80102253:	89 59 10             	mov    %ebx,0x10(%ecx)
80102256:	8d 5a 01             	lea    0x1(%edx),%ebx
80102259:	83 c2 02             	add    $0x2,%edx
8010225c:	39 f0                	cmp    %esi,%eax
8010225e:	89 19                	mov    %ebx,(%ecx)
80102260:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102266:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010226d:	75 d1                	jne    80102240 <ioapicinit+0x80>
8010226f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102272:	5b                   	pop    %ebx
80102273:	5e                   	pop    %esi
80102274:	5d                   	pop    %ebp
80102275:	f3 c3                	repz ret 
80102277:	89 f6                	mov    %esi,%esi
80102279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102280 <ioapicenable>:
80102280:	8b 15 84 27 11 80    	mov    0x80112784,%edx
80102286:	55                   	push   %ebp
80102287:	89 e5                	mov    %esp,%ebp
80102289:	85 d2                	test   %edx,%edx
8010228b:	8b 45 08             	mov    0x8(%ebp),%eax
8010228e:	74 2b                	je     801022bb <ioapicenable+0x3b>
80102290:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102296:	8d 50 20             	lea    0x20(%eax),%edx
80102299:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
8010229d:	89 01                	mov    %eax,(%ecx)
8010229f:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022a5:	83 c0 01             	add    $0x1,%eax
801022a8:	89 51 10             	mov    %edx,0x10(%ecx)
801022ab:	8b 55 0c             	mov    0xc(%ebp),%edx
801022ae:	89 01                	mov    %eax,(%ecx)
801022b0:	a1 54 26 11 80       	mov    0x80112654,%eax
801022b5:	c1 e2 18             	shl    $0x18,%edx
801022b8:	89 50 10             	mov    %edx,0x10(%eax)
801022bb:	5d                   	pop    %ebp
801022bc:	c3                   	ret    
801022bd:	66 90                	xchg   %ax,%ax
801022bf:	90                   	nop

801022c0 <kfree>:
801022c0:	55                   	push   %ebp
801022c1:	89 e5                	mov    %esp,%ebp
801022c3:	53                   	push   %ebx
801022c4:	83 ec 04             	sub    $0x4,%esp
801022c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022ca:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022d0:	75 70                	jne    80102342 <kfree+0x82>
801022d2:	81 fb 28 55 11 80    	cmp    $0x80115528,%ebx
801022d8:	72 68                	jb     80102342 <kfree+0x82>
801022da:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801022e0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801022e5:	77 5b                	ja     80102342 <kfree+0x82>
801022e7:	83 ec 04             	sub    $0x4,%esp
801022ea:	68 00 10 00 00       	push   $0x1000
801022ef:	6a 01                	push   $0x1
801022f1:	53                   	push   %ebx
801022f2:	e8 89 21 00 00       	call   80104480 <memset>
801022f7:	8b 15 94 26 11 80    	mov    0x80112694,%edx
801022fd:	83 c4 10             	add    $0x10,%esp
80102300:	85 d2                	test   %edx,%edx
80102302:	75 2c                	jne    80102330 <kfree+0x70>
80102304:	a1 98 26 11 80       	mov    0x80112698,%eax
80102309:	89 03                	mov    %eax,(%ebx)
8010230b:	a1 94 26 11 80       	mov    0x80112694,%eax
80102310:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
80102316:	85 c0                	test   %eax,%eax
80102318:	75 06                	jne    80102320 <kfree+0x60>
8010231a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010231d:	c9                   	leave  
8010231e:	c3                   	ret    
8010231f:	90                   	nop
80102320:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
80102327:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010232a:	c9                   	leave  
8010232b:	e9 00 21 00 00       	jmp    80104430 <release>
80102330:	83 ec 0c             	sub    $0xc,%esp
80102333:	68 60 26 11 80       	push   $0x80112660
80102338:	e8 13 1f 00 00       	call   80104250 <acquire>
8010233d:	83 c4 10             	add    $0x10,%esp
80102340:	eb c2                	jmp    80102304 <kfree+0x44>
80102342:	83 ec 0c             	sub    $0xc,%esp
80102345:	68 b2 71 10 80       	push   $0x801071b2
8010234a:	e8 21 e0 ff ff       	call   80100370 <panic>
8010234f:	90                   	nop

80102350 <freerange>:
80102350:	55                   	push   %ebp
80102351:	89 e5                	mov    %esp,%ebp
80102353:	56                   	push   %esi
80102354:	53                   	push   %ebx
80102355:	8b 45 08             	mov    0x8(%ebp),%eax
80102358:	8b 75 0c             	mov    0xc(%ebp),%esi
8010235b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102361:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102367:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010236d:	39 de                	cmp    %ebx,%esi
8010236f:	72 23                	jb     80102394 <freerange+0x44>
80102371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102378:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010237e:	83 ec 0c             	sub    $0xc,%esp
80102381:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102387:	50                   	push   %eax
80102388:	e8 33 ff ff ff       	call   801022c0 <kfree>
8010238d:	83 c4 10             	add    $0x10,%esp
80102390:	39 f3                	cmp    %esi,%ebx
80102392:	76 e4                	jbe    80102378 <freerange+0x28>
80102394:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102397:	5b                   	pop    %ebx
80102398:	5e                   	pop    %esi
80102399:	5d                   	pop    %ebp
8010239a:	c3                   	ret    
8010239b:	90                   	nop
8010239c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023a0 <kinit1>:
801023a0:	55                   	push   %ebp
801023a1:	89 e5                	mov    %esp,%ebp
801023a3:	56                   	push   %esi
801023a4:	53                   	push   %ebx
801023a5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023a8:	83 ec 08             	sub    $0x8,%esp
801023ab:	68 b8 71 10 80       	push   $0x801071b8
801023b0:	68 60 26 11 80       	push   $0x80112660
801023b5:	e8 76 1e 00 00       	call   80104230 <initlock>
801023ba:	8b 45 08             	mov    0x8(%ebp),%eax
801023bd:	83 c4 10             	add    $0x10,%esp
801023c0:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
801023c7:	00 00 00 
801023ca:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023d0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023d6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023dc:	39 de                	cmp    %ebx,%esi
801023de:	72 1c                	jb     801023fc <kinit1+0x5c>
801023e0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023e6:	83 ec 0c             	sub    $0xc,%esp
801023e9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ef:	50                   	push   %eax
801023f0:	e8 cb fe ff ff       	call   801022c0 <kfree>
801023f5:	83 c4 10             	add    $0x10,%esp
801023f8:	39 de                	cmp    %ebx,%esi
801023fa:	73 e4                	jae    801023e0 <kinit1+0x40>
801023fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023ff:	5b                   	pop    %ebx
80102400:	5e                   	pop    %esi
80102401:	5d                   	pop    %ebp
80102402:	c3                   	ret    
80102403:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102410 <kinit2>:
80102410:	55                   	push   %ebp
80102411:	89 e5                	mov    %esp,%ebp
80102413:	56                   	push   %esi
80102414:	53                   	push   %ebx
80102415:	8b 45 08             	mov    0x8(%ebp),%eax
80102418:	8b 75 0c             	mov    0xc(%ebp),%esi
8010241b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102421:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102427:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010242d:	39 de                	cmp    %ebx,%esi
8010242f:	72 23                	jb     80102454 <kinit2+0x44>
80102431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102438:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010243e:	83 ec 0c             	sub    $0xc,%esp
80102441:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102447:	50                   	push   %eax
80102448:	e8 73 fe ff ff       	call   801022c0 <kfree>
8010244d:	83 c4 10             	add    $0x10,%esp
80102450:	39 de                	cmp    %ebx,%esi
80102452:	73 e4                	jae    80102438 <kinit2+0x28>
80102454:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
8010245b:	00 00 00 
8010245e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102461:	5b                   	pop    %ebx
80102462:	5e                   	pop    %esi
80102463:	5d                   	pop    %ebp
80102464:	c3                   	ret    
80102465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kalloc>:
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	53                   	push   %ebx
80102474:	83 ec 04             	sub    $0x4,%esp
80102477:	a1 94 26 11 80       	mov    0x80112694,%eax
8010247c:	85 c0                	test   %eax,%eax
8010247e:	75 30                	jne    801024b0 <kalloc+0x40>
80102480:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
80102486:	85 db                	test   %ebx,%ebx
80102488:	74 1c                	je     801024a6 <kalloc+0x36>
8010248a:	8b 13                	mov    (%ebx),%edx
8010248c:	89 15 98 26 11 80    	mov    %edx,0x80112698
80102492:	85 c0                	test   %eax,%eax
80102494:	74 10                	je     801024a6 <kalloc+0x36>
80102496:	83 ec 0c             	sub    $0xc,%esp
80102499:	68 60 26 11 80       	push   $0x80112660
8010249e:	e8 8d 1f 00 00       	call   80104430 <release>
801024a3:	83 c4 10             	add    $0x10,%esp
801024a6:	89 d8                	mov    %ebx,%eax
801024a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024ab:	c9                   	leave  
801024ac:	c3                   	ret    
801024ad:	8d 76 00             	lea    0x0(%esi),%esi
801024b0:	83 ec 0c             	sub    $0xc,%esp
801024b3:	68 60 26 11 80       	push   $0x80112660
801024b8:	e8 93 1d 00 00       	call   80104250 <acquire>
801024bd:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
801024c3:	83 c4 10             	add    $0x10,%esp
801024c6:	a1 94 26 11 80       	mov    0x80112694,%eax
801024cb:	85 db                	test   %ebx,%ebx
801024cd:	75 bb                	jne    8010248a <kalloc+0x1a>
801024cf:	eb c1                	jmp    80102492 <kalloc+0x22>
801024d1:	66 90                	xchg   %ax,%ax
801024d3:	66 90                	xchg   %ax,%ax
801024d5:	66 90                	xchg   %ax,%ax
801024d7:	66 90                	xchg   %ax,%ax
801024d9:	66 90                	xchg   %ax,%ax
801024db:	66 90                	xchg   %ax,%ax
801024dd:	66 90                	xchg   %ax,%ax
801024df:	90                   	nop

801024e0 <kbdgetc>:
801024e0:	55                   	push   %ebp
801024e1:	ba 64 00 00 00       	mov    $0x64,%edx
801024e6:	89 e5                	mov    %esp,%ebp
801024e8:	ec                   	in     (%dx),%al
801024e9:	a8 01                	test   $0x1,%al
801024eb:	0f 84 af 00 00 00    	je     801025a0 <kbdgetc+0xc0>
801024f1:	ba 60 00 00 00       	mov    $0x60,%edx
801024f6:	ec                   	in     (%dx),%al
801024f7:	0f b6 d0             	movzbl %al,%edx
801024fa:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102500:	74 7e                	je     80102580 <kbdgetc+0xa0>
80102502:	84 c0                	test   %al,%al
80102504:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010250a:	79 24                	jns    80102530 <kbdgetc+0x50>
8010250c:	f6 c1 40             	test   $0x40,%cl
8010250f:	75 05                	jne    80102516 <kbdgetc+0x36>
80102511:	89 c2                	mov    %eax,%edx
80102513:	83 e2 7f             	and    $0x7f,%edx
80102516:	0f b6 82 e0 72 10 80 	movzbl -0x7fef8d20(%edx),%eax
8010251d:	83 c8 40             	or     $0x40,%eax
80102520:	0f b6 c0             	movzbl %al,%eax
80102523:	f7 d0                	not    %eax
80102525:	21 c8                	and    %ecx,%eax
80102527:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
8010252c:	31 c0                	xor    %eax,%eax
8010252e:	5d                   	pop    %ebp
8010252f:	c3                   	ret    
80102530:	f6 c1 40             	test   $0x40,%cl
80102533:	74 09                	je     8010253e <kbdgetc+0x5e>
80102535:	83 c8 80             	or     $0xffffff80,%eax
80102538:	83 e1 bf             	and    $0xffffffbf,%ecx
8010253b:	0f b6 d0             	movzbl %al,%edx
8010253e:	0f b6 82 e0 72 10 80 	movzbl -0x7fef8d20(%edx),%eax
80102545:	09 c1                	or     %eax,%ecx
80102547:	0f b6 82 e0 71 10 80 	movzbl -0x7fef8e20(%edx),%eax
8010254e:	31 c1                	xor    %eax,%ecx
80102550:	89 c8                	mov    %ecx,%eax
80102552:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102558:	83 e0 03             	and    $0x3,%eax
8010255b:	83 e1 08             	and    $0x8,%ecx
8010255e:	8b 04 85 c0 71 10 80 	mov    -0x7fef8e40(,%eax,4),%eax
80102565:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80102569:	74 c3                	je     8010252e <kbdgetc+0x4e>
8010256b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010256e:	83 fa 19             	cmp    $0x19,%edx
80102571:	77 1d                	ja     80102590 <kbdgetc+0xb0>
80102573:	83 e8 20             	sub    $0x20,%eax
80102576:	5d                   	pop    %ebp
80102577:	c3                   	ret    
80102578:	90                   	nop
80102579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102580:	31 c0                	xor    %eax,%eax
80102582:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
80102589:	5d                   	pop    %ebp
8010258a:	c3                   	ret    
8010258b:	90                   	nop
8010258c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102590:	8d 48 bf             	lea    -0x41(%eax),%ecx
80102593:	8d 50 20             	lea    0x20(%eax),%edx
80102596:	5d                   	pop    %ebp
80102597:	83 f9 19             	cmp    $0x19,%ecx
8010259a:	0f 46 c2             	cmovbe %edx,%eax
8010259d:	c3                   	ret    
8010259e:	66 90                	xchg   %ax,%ax
801025a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025a5:	5d                   	pop    %ebp
801025a6:	c3                   	ret    
801025a7:	89 f6                	mov    %esi,%esi
801025a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025b0 <kbdintr>:
801025b0:	55                   	push   %ebp
801025b1:	89 e5                	mov    %esp,%ebp
801025b3:	83 ec 14             	sub    $0x14,%esp
801025b6:	68 e0 24 10 80       	push   $0x801024e0
801025bb:	e8 30 e2 ff ff       	call   801007f0 <consoleintr>
801025c0:	83 c4 10             	add    $0x10,%esp
801025c3:	c9                   	leave  
801025c4:	c3                   	ret    
801025c5:	66 90                	xchg   %ax,%ax
801025c7:	66 90                	xchg   %ax,%ax
801025c9:	66 90                	xchg   %ax,%ax
801025cb:	66 90                	xchg   %ax,%ax
801025cd:	66 90                	xchg   %ax,%ax
801025cf:	90                   	nop

801025d0 <lapicinit>:
801025d0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801025d5:	55                   	push   %ebp
801025d6:	89 e5                	mov    %esp,%ebp
801025d8:	85 c0                	test   %eax,%eax
801025da:	0f 84 c8 00 00 00    	je     801026a8 <lapicinit+0xd8>
801025e0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801025e7:	01 00 00 
801025ea:	8b 50 20             	mov    0x20(%eax),%edx
801025ed:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801025f4:	00 00 00 
801025f7:	8b 50 20             	mov    0x20(%eax),%edx
801025fa:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102601:	00 02 00 
80102604:	8b 50 20             	mov    0x20(%eax),%edx
80102607:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010260e:	96 98 00 
80102611:	8b 50 20             	mov    0x20(%eax),%edx
80102614:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010261b:	00 01 00 
8010261e:	8b 50 20             	mov    0x20(%eax),%edx
80102621:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102628:	00 01 00 
8010262b:	8b 50 20             	mov    0x20(%eax),%edx
8010262e:	8b 50 30             	mov    0x30(%eax),%edx
80102631:	c1 ea 10             	shr    $0x10,%edx
80102634:	80 fa 03             	cmp    $0x3,%dl
80102637:	77 77                	ja     801026b0 <lapicinit+0xe0>
80102639:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102640:	00 00 00 
80102643:	8b 50 20             	mov    0x20(%eax),%edx
80102646:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010264d:	00 00 00 
80102650:	8b 50 20             	mov    0x20(%eax),%edx
80102653:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010265a:	00 00 00 
8010265d:	8b 50 20             	mov    0x20(%eax),%edx
80102660:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102667:	00 00 00 
8010266a:	8b 50 20             	mov    0x20(%eax),%edx
8010266d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102674:	00 00 00 
80102677:	8b 50 20             	mov    0x20(%eax),%edx
8010267a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102681:	85 08 00 
80102684:	8b 50 20             	mov    0x20(%eax),%edx
80102687:	89 f6                	mov    %esi,%esi
80102689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102690:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102696:	80 e6 10             	and    $0x10,%dh
80102699:	75 f5                	jne    80102690 <lapicinit+0xc0>
8010269b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026a2:	00 00 00 
801026a5:	8b 40 20             	mov    0x20(%eax),%eax
801026a8:	5d                   	pop    %ebp
801026a9:	c3                   	ret    
801026aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801026b0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026b7:	00 01 00 
801026ba:	8b 50 20             	mov    0x20(%eax),%edx
801026bd:	e9 77 ff ff ff       	jmp    80102639 <lapicinit+0x69>
801026c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026d0 <cpunum>:
801026d0:	55                   	push   %ebp
801026d1:	89 e5                	mov    %esp,%ebp
801026d3:	56                   	push   %esi
801026d4:	53                   	push   %ebx
801026d5:	9c                   	pushf  
801026d6:	58                   	pop    %eax
801026d7:	f6 c4 02             	test   $0x2,%ah
801026da:	74 12                	je     801026ee <cpunum+0x1e>
801026dc:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
801026e1:	8d 50 01             	lea    0x1(%eax),%edx
801026e4:	85 c0                	test   %eax,%eax
801026e6:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
801026ec:	74 4d                	je     8010273b <cpunum+0x6b>
801026ee:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801026f3:	85 c0                	test   %eax,%eax
801026f5:	74 60                	je     80102757 <cpunum+0x87>
801026f7:	8b 58 20             	mov    0x20(%eax),%ebx
801026fa:	8b 35 80 2d 11 80    	mov    0x80112d80,%esi
80102700:	c1 eb 18             	shr    $0x18,%ebx
80102703:	85 f6                	test   %esi,%esi
80102705:	7e 59                	jle    80102760 <cpunum+0x90>
80102707:	0f b6 05 a0 27 11 80 	movzbl 0x801127a0,%eax
8010270e:	39 c3                	cmp    %eax,%ebx
80102710:	74 45                	je     80102757 <cpunum+0x87>
80102712:	ba 5c 28 11 80       	mov    $0x8011285c,%edx
80102717:	31 c0                	xor    %eax,%eax
80102719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102720:	83 c0 01             	add    $0x1,%eax
80102723:	39 f0                	cmp    %esi,%eax
80102725:	74 39                	je     80102760 <cpunum+0x90>
80102727:	0f b6 0a             	movzbl (%edx),%ecx
8010272a:	81 c2 bc 00 00 00    	add    $0xbc,%edx
80102730:	39 cb                	cmp    %ecx,%ebx
80102732:	75 ec                	jne    80102720 <cpunum+0x50>
80102734:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102737:	5b                   	pop    %ebx
80102738:	5e                   	pop    %esi
80102739:	5d                   	pop    %ebp
8010273a:	c3                   	ret    
8010273b:	83 ec 08             	sub    $0x8,%esp
8010273e:	ff 75 04             	pushl  0x4(%ebp)
80102741:	68 e0 73 10 80       	push   $0x801073e0
80102746:	e8 15 df ff ff       	call   80100660 <cprintf>
8010274b:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102750:	83 c4 10             	add    $0x10,%esp
80102753:	85 c0                	test   %eax,%eax
80102755:	75 a0                	jne    801026f7 <cpunum+0x27>
80102757:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010275a:	31 c0                	xor    %eax,%eax
8010275c:	5b                   	pop    %ebx
8010275d:	5e                   	pop    %esi
8010275e:	5d                   	pop    %ebp
8010275f:	c3                   	ret    
80102760:	83 ec 0c             	sub    $0xc,%esp
80102763:	68 0c 74 10 80       	push   $0x8010740c
80102768:	e8 03 dc ff ff       	call   80100370 <panic>
8010276d:	8d 76 00             	lea    0x0(%esi),%esi

80102770 <lapiceoi>:
80102770:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102775:	55                   	push   %ebp
80102776:	89 e5                	mov    %esp,%ebp
80102778:	85 c0                	test   %eax,%eax
8010277a:	74 0d                	je     80102789 <lapiceoi+0x19>
8010277c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102783:	00 00 00 
80102786:	8b 40 20             	mov    0x20(%eax),%eax
80102789:	5d                   	pop    %ebp
8010278a:	c3                   	ret    
8010278b:	90                   	nop
8010278c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102790 <microdelay>:
80102790:	55                   	push   %ebp
80102791:	89 e5                	mov    %esp,%ebp
80102793:	5d                   	pop    %ebp
80102794:	c3                   	ret    
80102795:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027a0 <lapicstartap>:
801027a0:	55                   	push   %ebp
801027a1:	ba 70 00 00 00       	mov    $0x70,%edx
801027a6:	b8 0f 00 00 00       	mov    $0xf,%eax
801027ab:	89 e5                	mov    %esp,%ebp
801027ad:	53                   	push   %ebx
801027ae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801027b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027b4:	ee                   	out    %al,(%dx)
801027b5:	ba 71 00 00 00       	mov    $0x71,%edx
801027ba:	b8 0a 00 00 00       	mov    $0xa,%eax
801027bf:	ee                   	out    %al,(%dx)
801027c0:	31 c0                	xor    %eax,%eax
801027c2:	c1 e3 18             	shl    $0x18,%ebx
801027c5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
801027cb:	89 c8                	mov    %ecx,%eax
801027cd:	c1 e9 0c             	shr    $0xc,%ecx
801027d0:	c1 e8 04             	shr    $0x4,%eax
801027d3:	89 da                	mov    %ebx,%edx
801027d5:	80 cd 06             	or     $0x6,%ch
801027d8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801027de:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027e3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
801027e9:	8b 58 20             	mov    0x20(%eax),%ebx
801027ec:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027f3:	c5 00 00 
801027f6:	8b 58 20             	mov    0x20(%eax),%ebx
801027f9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102800:	85 00 00 
80102803:	8b 58 20             	mov    0x20(%eax),%ebx
80102806:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010280c:	8b 58 20             	mov    0x20(%eax),%ebx
8010280f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102815:	8b 58 20             	mov    0x20(%eax),%ebx
80102818:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010281e:	8b 50 20             	mov    0x20(%eax),%edx
80102821:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102827:	8b 40 20             	mov    0x20(%eax),%eax
8010282a:	5b                   	pop    %ebx
8010282b:	5d                   	pop    %ebp
8010282c:	c3                   	ret    
8010282d:	8d 76 00             	lea    0x0(%esi),%esi

80102830 <cmostime>:
80102830:	55                   	push   %ebp
80102831:	ba 70 00 00 00       	mov    $0x70,%edx
80102836:	b8 0b 00 00 00       	mov    $0xb,%eax
8010283b:	89 e5                	mov    %esp,%ebp
8010283d:	57                   	push   %edi
8010283e:	56                   	push   %esi
8010283f:	53                   	push   %ebx
80102840:	83 ec 4c             	sub    $0x4c,%esp
80102843:	ee                   	out    %al,(%dx)
80102844:	ba 71 00 00 00       	mov    $0x71,%edx
80102849:	ec                   	in     (%dx),%al
8010284a:	83 e0 04             	and    $0x4,%eax
8010284d:	8d 75 d0             	lea    -0x30(%ebp),%esi
80102850:	31 db                	xor    %ebx,%ebx
80102852:	88 45 b7             	mov    %al,-0x49(%ebp)
80102855:	bf 70 00 00 00       	mov    $0x70,%edi
8010285a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102860:	89 d8                	mov    %ebx,%eax
80102862:	89 fa                	mov    %edi,%edx
80102864:	ee                   	out    %al,(%dx)
80102865:	b9 71 00 00 00       	mov    $0x71,%ecx
8010286a:	89 ca                	mov    %ecx,%edx
8010286c:	ec                   	in     (%dx),%al
8010286d:	0f b6 c0             	movzbl %al,%eax
80102870:	89 fa                	mov    %edi,%edx
80102872:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102875:	b8 02 00 00 00       	mov    $0x2,%eax
8010287a:	ee                   	out    %al,(%dx)
8010287b:	89 ca                	mov    %ecx,%edx
8010287d:	ec                   	in     (%dx),%al
8010287e:	0f b6 c0             	movzbl %al,%eax
80102881:	89 fa                	mov    %edi,%edx
80102883:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102886:	b8 04 00 00 00       	mov    $0x4,%eax
8010288b:	ee                   	out    %al,(%dx)
8010288c:	89 ca                	mov    %ecx,%edx
8010288e:	ec                   	in     (%dx),%al
8010288f:	0f b6 c0             	movzbl %al,%eax
80102892:	89 fa                	mov    %edi,%edx
80102894:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102897:	b8 07 00 00 00       	mov    $0x7,%eax
8010289c:	ee                   	out    %al,(%dx)
8010289d:	89 ca                	mov    %ecx,%edx
8010289f:	ec                   	in     (%dx),%al
801028a0:	0f b6 c0             	movzbl %al,%eax
801028a3:	89 fa                	mov    %edi,%edx
801028a5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801028a8:	b8 08 00 00 00       	mov    $0x8,%eax
801028ad:	ee                   	out    %al,(%dx)
801028ae:	89 ca                	mov    %ecx,%edx
801028b0:	ec                   	in     (%dx),%al
801028b1:	0f b6 c0             	movzbl %al,%eax
801028b4:	89 fa                	mov    %edi,%edx
801028b6:	89 45 c8             	mov    %eax,-0x38(%ebp)
801028b9:	b8 09 00 00 00       	mov    $0x9,%eax
801028be:	ee                   	out    %al,(%dx)
801028bf:	89 ca                	mov    %ecx,%edx
801028c1:	ec                   	in     (%dx),%al
801028c2:	0f b6 c0             	movzbl %al,%eax
801028c5:	89 fa                	mov    %edi,%edx
801028c7:	89 45 cc             	mov    %eax,-0x34(%ebp)
801028ca:	b8 0a 00 00 00       	mov    $0xa,%eax
801028cf:	ee                   	out    %al,(%dx)
801028d0:	89 ca                	mov    %ecx,%edx
801028d2:	ec                   	in     (%dx),%al
801028d3:	84 c0                	test   %al,%al
801028d5:	78 89                	js     80102860 <cmostime+0x30>
801028d7:	89 d8                	mov    %ebx,%eax
801028d9:	89 fa                	mov    %edi,%edx
801028db:	ee                   	out    %al,(%dx)
801028dc:	89 ca                	mov    %ecx,%edx
801028de:	ec                   	in     (%dx),%al
801028df:	0f b6 c0             	movzbl %al,%eax
801028e2:	89 fa                	mov    %edi,%edx
801028e4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028e7:	b8 02 00 00 00       	mov    $0x2,%eax
801028ec:	ee                   	out    %al,(%dx)
801028ed:	89 ca                	mov    %ecx,%edx
801028ef:	ec                   	in     (%dx),%al
801028f0:	0f b6 c0             	movzbl %al,%eax
801028f3:	89 fa                	mov    %edi,%edx
801028f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028f8:	b8 04 00 00 00       	mov    $0x4,%eax
801028fd:	ee                   	out    %al,(%dx)
801028fe:	89 ca                	mov    %ecx,%edx
80102900:	ec                   	in     (%dx),%al
80102901:	0f b6 c0             	movzbl %al,%eax
80102904:	89 fa                	mov    %edi,%edx
80102906:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102909:	b8 07 00 00 00       	mov    $0x7,%eax
8010290e:	ee                   	out    %al,(%dx)
8010290f:	89 ca                	mov    %ecx,%edx
80102911:	ec                   	in     (%dx),%al
80102912:	0f b6 c0             	movzbl %al,%eax
80102915:	89 fa                	mov    %edi,%edx
80102917:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010291a:	b8 08 00 00 00       	mov    $0x8,%eax
8010291f:	ee                   	out    %al,(%dx)
80102920:	89 ca                	mov    %ecx,%edx
80102922:	ec                   	in     (%dx),%al
80102923:	0f b6 c0             	movzbl %al,%eax
80102926:	89 fa                	mov    %edi,%edx
80102928:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010292b:	b8 09 00 00 00       	mov    $0x9,%eax
80102930:	ee                   	out    %al,(%dx)
80102931:	89 ca                	mov    %ecx,%edx
80102933:	ec                   	in     (%dx),%al
80102934:	0f b6 c0             	movzbl %al,%eax
80102937:	83 ec 04             	sub    $0x4,%esp
8010293a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010293d:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102940:	6a 18                	push   $0x18
80102942:	56                   	push   %esi
80102943:	50                   	push   %eax
80102944:	e8 87 1b 00 00       	call   801044d0 <memcmp>
80102949:	83 c4 10             	add    $0x10,%esp
8010294c:	85 c0                	test   %eax,%eax
8010294e:	0f 85 0c ff ff ff    	jne    80102860 <cmostime+0x30>
80102954:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80102958:	75 78                	jne    801029d2 <cmostime+0x1a2>
8010295a:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010295d:	89 c2                	mov    %eax,%edx
8010295f:	83 e0 0f             	and    $0xf,%eax
80102962:	c1 ea 04             	shr    $0x4,%edx
80102965:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102968:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296b:	89 45 b8             	mov    %eax,-0x48(%ebp)
8010296e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102971:	89 c2                	mov    %eax,%edx
80102973:	83 e0 0f             	and    $0xf,%eax
80102976:	c1 ea 04             	shr    $0x4,%edx
80102979:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010297c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010297f:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102982:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102985:	89 c2                	mov    %eax,%edx
80102987:	83 e0 0f             	and    $0xf,%eax
8010298a:	c1 ea 04             	shr    $0x4,%edx
8010298d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102990:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102993:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102996:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102999:	89 c2                	mov    %eax,%edx
8010299b:	83 e0 0f             	and    $0xf,%eax
8010299e:	c1 ea 04             	shr    $0x4,%edx
801029a1:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029a4:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029a7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801029aa:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029ad:	89 c2                	mov    %eax,%edx
801029af:	83 e0 0f             	and    $0xf,%eax
801029b2:	c1 ea 04             	shr    $0x4,%edx
801029b5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029b8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029bb:	89 45 c8             	mov    %eax,-0x38(%ebp)
801029be:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029c1:	89 c2                	mov    %eax,%edx
801029c3:	83 e0 0f             	and    $0xf,%eax
801029c6:	c1 ea 04             	shr    $0x4,%edx
801029c9:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029cc:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029cf:	89 45 cc             	mov    %eax,-0x34(%ebp)
801029d2:	8b 75 08             	mov    0x8(%ebp),%esi
801029d5:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029d8:	89 06                	mov    %eax,(%esi)
801029da:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029dd:	89 46 04             	mov    %eax,0x4(%esi)
801029e0:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029e3:	89 46 08             	mov    %eax,0x8(%esi)
801029e6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029e9:	89 46 0c             	mov    %eax,0xc(%esi)
801029ec:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029ef:	89 46 10             	mov    %eax,0x10(%esi)
801029f2:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029f5:	89 46 14             	mov    %eax,0x14(%esi)
801029f8:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
801029ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a02:	5b                   	pop    %ebx
80102a03:	5e                   	pop    %esi
80102a04:	5f                   	pop    %edi
80102a05:	5d                   	pop    %ebp
80102a06:	c3                   	ret    
80102a07:	66 90                	xchg   %ax,%ax
80102a09:	66 90                	xchg   %ax,%ax
80102a0b:	66 90                	xchg   %ax,%ax
80102a0d:	66 90                	xchg   %ax,%ax
80102a0f:	90                   	nop

80102a10 <install_trans>:
80102a10:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102a16:	85 c9                	test   %ecx,%ecx
80102a18:	0f 8e 85 00 00 00    	jle    80102aa3 <install_trans+0x93>
80102a1e:	55                   	push   %ebp
80102a1f:	89 e5                	mov    %esp,%ebp
80102a21:	57                   	push   %edi
80102a22:	56                   	push   %esi
80102a23:	53                   	push   %ebx
80102a24:	31 db                	xor    %ebx,%ebx
80102a26:	83 ec 0c             	sub    $0xc,%esp
80102a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a30:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102a35:	83 ec 08             	sub    $0x8,%esp
80102a38:	01 d8                	add    %ebx,%eax
80102a3a:	83 c0 01             	add    $0x1,%eax
80102a3d:	50                   	push   %eax
80102a3e:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a44:	e8 87 d6 ff ff       	call   801000d0 <bread>
80102a49:	89 c7                	mov    %eax,%edi
80102a4b:	58                   	pop    %eax
80102a4c:	5a                   	pop    %edx
80102a4d:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102a54:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a5a:	83 c3 01             	add    $0x1,%ebx
80102a5d:	e8 6e d6 ff ff       	call   801000d0 <bread>
80102a62:	89 c6                	mov    %eax,%esi
80102a64:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a67:	83 c4 0c             	add    $0xc,%esp
80102a6a:	68 00 02 00 00       	push   $0x200
80102a6f:	50                   	push   %eax
80102a70:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a73:	50                   	push   %eax
80102a74:	e8 b7 1a 00 00       	call   80104530 <memmove>
80102a79:	89 34 24             	mov    %esi,(%esp)
80102a7c:	e8 1f d7 ff ff       	call   801001a0 <bwrite>
80102a81:	89 3c 24             	mov    %edi,(%esp)
80102a84:	e8 57 d7 ff ff       	call   801001e0 <brelse>
80102a89:	89 34 24             	mov    %esi,(%esp)
80102a8c:	e8 4f d7 ff ff       	call   801001e0 <brelse>
80102a91:	83 c4 10             	add    $0x10,%esp
80102a94:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102a9a:	7f 94                	jg     80102a30 <install_trans+0x20>
80102a9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a9f:	5b                   	pop    %ebx
80102aa0:	5e                   	pop    %esi
80102aa1:	5f                   	pop    %edi
80102aa2:	5d                   	pop    %ebp
80102aa3:	f3 c3                	repz ret 
80102aa5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ab0 <write_head>:
80102ab0:	55                   	push   %ebp
80102ab1:	89 e5                	mov    %esp,%ebp
80102ab3:	53                   	push   %ebx
80102ab4:	83 ec 0c             	sub    $0xc,%esp
80102ab7:	ff 35 d4 26 11 80    	pushl  0x801126d4
80102abd:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102ac3:	e8 08 d6 ff ff       	call   801000d0 <bread>
80102ac8:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102ace:	83 c4 10             	add    $0x10,%esp
80102ad1:	89 c3                	mov    %eax,%ebx
80102ad3:	85 c9                	test   %ecx,%ecx
80102ad5:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102ad8:	7e 1f                	jle    80102af9 <write_head+0x49>
80102ada:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102ae1:	31 d2                	xor    %edx,%edx
80102ae3:	90                   	nop
80102ae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ae8:	8b 8a ec 26 11 80    	mov    -0x7feed914(%edx),%ecx
80102aee:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102af2:	83 c2 04             	add    $0x4,%edx
80102af5:	39 c2                	cmp    %eax,%edx
80102af7:	75 ef                	jne    80102ae8 <write_head+0x38>
80102af9:	83 ec 0c             	sub    $0xc,%esp
80102afc:	53                   	push   %ebx
80102afd:	e8 9e d6 ff ff       	call   801001a0 <bwrite>
80102b02:	89 1c 24             	mov    %ebx,(%esp)
80102b05:	e8 d6 d6 ff ff       	call   801001e0 <brelse>
80102b0a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b0d:	c9                   	leave  
80102b0e:	c3                   	ret    
80102b0f:	90                   	nop

80102b10 <initlog>:
80102b10:	55                   	push   %ebp
80102b11:	89 e5                	mov    %esp,%ebp
80102b13:	53                   	push   %ebx
80102b14:	83 ec 2c             	sub    $0x2c,%esp
80102b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b1a:	68 1c 74 10 80       	push   $0x8010741c
80102b1f:	68 a0 26 11 80       	push   $0x801126a0
80102b24:	e8 07 17 00 00       	call   80104230 <initlock>
80102b29:	58                   	pop    %eax
80102b2a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b2d:	5a                   	pop    %edx
80102b2e:	50                   	push   %eax
80102b2f:	53                   	push   %ebx
80102b30:	e8 5b e8 ff ff       	call   80101390 <readsb>
80102b35:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102b38:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102b3b:	59                   	pop    %ecx
80102b3c:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4
80102b42:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
80102b48:	a3 d4 26 11 80       	mov    %eax,0x801126d4
80102b4d:	5a                   	pop    %edx
80102b4e:	50                   	push   %eax
80102b4f:	53                   	push   %ebx
80102b50:	e8 7b d5 ff ff       	call   801000d0 <bread>
80102b55:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102b58:	83 c4 10             	add    $0x10,%esp
80102b5b:	85 c9                	test   %ecx,%ecx
80102b5d:	89 0d e8 26 11 80    	mov    %ecx,0x801126e8
80102b63:	7e 1c                	jle    80102b81 <initlog+0x71>
80102b65:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b6c:	31 d2                	xor    %edx,%edx
80102b6e:	66 90                	xchg   %ax,%ax
80102b70:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b74:	83 c2 04             	add    $0x4,%edx
80102b77:	89 8a e8 26 11 80    	mov    %ecx,-0x7feed918(%edx)
80102b7d:	39 da                	cmp    %ebx,%edx
80102b7f:	75 ef                	jne    80102b70 <initlog+0x60>
80102b81:	83 ec 0c             	sub    $0xc,%esp
80102b84:	50                   	push   %eax
80102b85:	e8 56 d6 ff ff       	call   801001e0 <brelse>
80102b8a:	e8 81 fe ff ff       	call   80102a10 <install_trans>
80102b8f:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102b96:	00 00 00 
80102b99:	e8 12 ff ff ff       	call   80102ab0 <write_head>
80102b9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ba1:	c9                   	leave  
80102ba2:	c3                   	ret    
80102ba3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bb0 <begin_op>:
80102bb0:	55                   	push   %ebp
80102bb1:	89 e5                	mov    %esp,%ebp
80102bb3:	83 ec 14             	sub    $0x14,%esp
80102bb6:	68 a0 26 11 80       	push   $0x801126a0
80102bbb:	e8 90 16 00 00       	call   80104250 <acquire>
80102bc0:	83 c4 10             	add    $0x10,%esp
80102bc3:	eb 18                	jmp    80102bdd <begin_op+0x2d>
80102bc5:	8d 76 00             	lea    0x0(%esi),%esi
80102bc8:	83 ec 08             	sub    $0x8,%esp
80102bcb:	68 a0 26 11 80       	push   $0x801126a0
80102bd0:	68 a0 26 11 80       	push   $0x801126a0
80102bd5:	e8 f6 11 00 00       	call   80103dd0 <sleep>
80102bda:	83 c4 10             	add    $0x10,%esp
80102bdd:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102be2:	85 c0                	test   %eax,%eax
80102be4:	75 e2                	jne    80102bc8 <begin_op+0x18>
80102be6:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102beb:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102bf1:	83 c0 01             	add    $0x1,%eax
80102bf4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bf7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bfa:	83 fa 1e             	cmp    $0x1e,%edx
80102bfd:	7f c9                	jg     80102bc8 <begin_op+0x18>
80102bff:	83 ec 0c             	sub    $0xc,%esp
80102c02:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102c07:	68 a0 26 11 80       	push   $0x801126a0
80102c0c:	e8 1f 18 00 00       	call   80104430 <release>
80102c11:	83 c4 10             	add    $0x10,%esp
80102c14:	c9                   	leave  
80102c15:	c3                   	ret    
80102c16:	8d 76 00             	lea    0x0(%esi),%esi
80102c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c20 <end_op>:
80102c20:	55                   	push   %ebp
80102c21:	89 e5                	mov    %esp,%ebp
80102c23:	57                   	push   %edi
80102c24:	56                   	push   %esi
80102c25:	53                   	push   %ebx
80102c26:	83 ec 18             	sub    $0x18,%esp
80102c29:	68 a0 26 11 80       	push   $0x801126a0
80102c2e:	e8 1d 16 00 00       	call   80104250 <acquire>
80102c33:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102c38:	8b 1d e0 26 11 80    	mov    0x801126e0,%ebx
80102c3e:	83 c4 10             	add    $0x10,%esp
80102c41:	83 e8 01             	sub    $0x1,%eax
80102c44:	85 db                	test   %ebx,%ebx
80102c46:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102c4b:	0f 85 23 01 00 00    	jne    80102d74 <end_op+0x154>
80102c51:	85 c0                	test   %eax,%eax
80102c53:	0f 85 f7 00 00 00    	jne    80102d50 <end_op+0x130>
80102c59:	83 ec 0c             	sub    $0xc,%esp
80102c5c:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102c63:	00 00 00 
80102c66:	31 db                	xor    %ebx,%ebx
80102c68:	68 a0 26 11 80       	push   $0x801126a0
80102c6d:	e8 be 17 00 00       	call   80104430 <release>
80102c72:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102c78:	83 c4 10             	add    $0x10,%esp
80102c7b:	85 c9                	test   %ecx,%ecx
80102c7d:	0f 8e 8a 00 00 00    	jle    80102d0d <end_op+0xed>
80102c83:	90                   	nop
80102c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c88:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102c8d:	83 ec 08             	sub    $0x8,%esp
80102c90:	01 d8                	add    %ebx,%eax
80102c92:	83 c0 01             	add    $0x1,%eax
80102c95:	50                   	push   %eax
80102c96:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102c9c:	e8 2f d4 ff ff       	call   801000d0 <bread>
80102ca1:	89 c6                	mov    %eax,%esi
80102ca3:	58                   	pop    %eax
80102ca4:	5a                   	pop    %edx
80102ca5:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102cac:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102cb2:	83 c3 01             	add    $0x1,%ebx
80102cb5:	e8 16 d4 ff ff       	call   801000d0 <bread>
80102cba:	89 c7                	mov    %eax,%edi
80102cbc:	8d 40 5c             	lea    0x5c(%eax),%eax
80102cbf:	83 c4 0c             	add    $0xc,%esp
80102cc2:	68 00 02 00 00       	push   $0x200
80102cc7:	50                   	push   %eax
80102cc8:	8d 46 5c             	lea    0x5c(%esi),%eax
80102ccb:	50                   	push   %eax
80102ccc:	e8 5f 18 00 00       	call   80104530 <memmove>
80102cd1:	89 34 24             	mov    %esi,(%esp)
80102cd4:	e8 c7 d4 ff ff       	call   801001a0 <bwrite>
80102cd9:	89 3c 24             	mov    %edi,(%esp)
80102cdc:	e8 ff d4 ff ff       	call   801001e0 <brelse>
80102ce1:	89 34 24             	mov    %esi,(%esp)
80102ce4:	e8 f7 d4 ff ff       	call   801001e0 <brelse>
80102ce9:	83 c4 10             	add    $0x10,%esp
80102cec:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102cf2:	7c 94                	jl     80102c88 <end_op+0x68>
80102cf4:	e8 b7 fd ff ff       	call   80102ab0 <write_head>
80102cf9:	e8 12 fd ff ff       	call   80102a10 <install_trans>
80102cfe:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102d05:	00 00 00 
80102d08:	e8 a3 fd ff ff       	call   80102ab0 <write_head>
80102d0d:	83 ec 0c             	sub    $0xc,%esp
80102d10:	68 a0 26 11 80       	push   $0x801126a0
80102d15:	e8 36 15 00 00       	call   80104250 <acquire>
80102d1a:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d21:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102d28:	00 00 00 
80102d2b:	e8 40 12 00 00       	call   80103f70 <wakeup>
80102d30:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d37:	e8 f4 16 00 00       	call   80104430 <release>
80102d3c:	83 c4 10             	add    $0x10,%esp
80102d3f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d42:	5b                   	pop    %ebx
80102d43:	5e                   	pop    %esi
80102d44:	5f                   	pop    %edi
80102d45:	5d                   	pop    %ebp
80102d46:	c3                   	ret    
80102d47:	89 f6                	mov    %esi,%esi
80102d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102d50:	83 ec 0c             	sub    $0xc,%esp
80102d53:	68 a0 26 11 80       	push   $0x801126a0
80102d58:	e8 13 12 00 00       	call   80103f70 <wakeup>
80102d5d:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d64:	e8 c7 16 00 00       	call   80104430 <release>
80102d69:	83 c4 10             	add    $0x10,%esp
80102d6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d6f:	5b                   	pop    %ebx
80102d70:	5e                   	pop    %esi
80102d71:	5f                   	pop    %edi
80102d72:	5d                   	pop    %ebp
80102d73:	c3                   	ret    
80102d74:	83 ec 0c             	sub    $0xc,%esp
80102d77:	68 20 74 10 80       	push   $0x80107420
80102d7c:	e8 ef d5 ff ff       	call   80100370 <panic>
80102d81:	eb 0d                	jmp    80102d90 <log_write>
80102d83:	90                   	nop
80102d84:	90                   	nop
80102d85:	90                   	nop
80102d86:	90                   	nop
80102d87:	90                   	nop
80102d88:	90                   	nop
80102d89:	90                   	nop
80102d8a:	90                   	nop
80102d8b:	90                   	nop
80102d8c:	90                   	nop
80102d8d:	90                   	nop
80102d8e:	90                   	nop
80102d8f:	90                   	nop

80102d90 <log_write>:
80102d90:	55                   	push   %ebp
80102d91:	89 e5                	mov    %esp,%ebp
80102d93:	53                   	push   %ebx
80102d94:	83 ec 04             	sub    $0x4,%esp
80102d97:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102d9d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102da0:	83 fa 1d             	cmp    $0x1d,%edx
80102da3:	0f 8f 97 00 00 00    	jg     80102e40 <log_write+0xb0>
80102da9:	a1 d8 26 11 80       	mov    0x801126d8,%eax
80102dae:	83 e8 01             	sub    $0x1,%eax
80102db1:	39 c2                	cmp    %eax,%edx
80102db3:	0f 8d 87 00 00 00    	jge    80102e40 <log_write+0xb0>
80102db9:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102dbe:	85 c0                	test   %eax,%eax
80102dc0:	0f 8e 87 00 00 00    	jle    80102e4d <log_write+0xbd>
80102dc6:	83 ec 0c             	sub    $0xc,%esp
80102dc9:	68 a0 26 11 80       	push   $0x801126a0
80102dce:	e8 7d 14 00 00       	call   80104250 <acquire>
80102dd3:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102dd9:	83 c4 10             	add    $0x10,%esp
80102ddc:	83 fa 00             	cmp    $0x0,%edx
80102ddf:	7e 50                	jle    80102e31 <log_write+0xa1>
80102de1:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102de4:	31 c0                	xor    %eax,%eax
80102de6:	3b 0d ec 26 11 80    	cmp    0x801126ec,%ecx
80102dec:	75 0b                	jne    80102df9 <log_write+0x69>
80102dee:	eb 38                	jmp    80102e28 <log_write+0x98>
80102df0:	39 0c 85 ec 26 11 80 	cmp    %ecx,-0x7feed914(,%eax,4)
80102df7:	74 2f                	je     80102e28 <log_write+0x98>
80102df9:	83 c0 01             	add    $0x1,%eax
80102dfc:	39 d0                	cmp    %edx,%eax
80102dfe:	75 f0                	jne    80102df0 <log_write+0x60>
80102e00:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
80102e07:	83 c2 01             	add    $0x1,%edx
80102e0a:	89 15 e8 26 11 80    	mov    %edx,0x801126e8
80102e10:	83 0b 04             	orl    $0x4,(%ebx)
80102e13:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
80102e1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e1d:	c9                   	leave  
80102e1e:	e9 0d 16 00 00       	jmp    80104430 <release>
80102e23:	90                   	nop
80102e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102e28:	89 0c 85 ec 26 11 80 	mov    %ecx,-0x7feed914(,%eax,4)
80102e2f:	eb df                	jmp    80102e10 <log_write+0x80>
80102e31:	8b 43 08             	mov    0x8(%ebx),%eax
80102e34:	a3 ec 26 11 80       	mov    %eax,0x801126ec
80102e39:	75 d5                	jne    80102e10 <log_write+0x80>
80102e3b:	eb ca                	jmp    80102e07 <log_write+0x77>
80102e3d:	8d 76 00             	lea    0x0(%esi),%esi
80102e40:	83 ec 0c             	sub    $0xc,%esp
80102e43:	68 2f 74 10 80       	push   $0x8010742f
80102e48:	e8 23 d5 ff ff       	call   80100370 <panic>
80102e4d:	83 ec 0c             	sub    $0xc,%esp
80102e50:	68 45 74 10 80       	push   $0x80107445
80102e55:	e8 16 d5 ff ff       	call   80100370 <panic>
80102e5a:	66 90                	xchg   %ax,%ax
80102e5c:	66 90                	xchg   %ax,%ax
80102e5e:	66 90                	xchg   %ax,%ax

80102e60 <mpmain>:
80102e60:	55                   	push   %ebp
80102e61:	89 e5                	mov    %esp,%ebp
80102e63:	83 ec 08             	sub    $0x8,%esp
80102e66:	e8 65 f8 ff ff       	call   801026d0 <cpunum>
80102e6b:	83 ec 08             	sub    $0x8,%esp
80102e6e:	50                   	push   %eax
80102e6f:	68 60 74 10 80       	push   $0x80107460
80102e74:	e8 e7 d7 ff ff       	call   80100660 <cprintf>
80102e79:	e8 f2 28 00 00       	call   80105770 <idtinit>
80102e7e:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80102e85:	b8 01 00 00 00       	mov    $0x1,%eax
80102e8a:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
80102e91:	e8 5a 0c 00 00       	call   80103af0 <scheduler>
80102e96:	8d 76 00             	lea    0x0(%esi),%esi
80102e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ea0 <mpenter>:
80102ea0:	55                   	push   %ebp
80102ea1:	89 e5                	mov    %esp,%ebp
80102ea3:	83 ec 08             	sub    $0x8,%esp
80102ea6:	e8 d5 3a 00 00       	call   80106980 <switchkvm>
80102eab:	e8 f0 38 00 00       	call   801067a0 <seginit>
80102eb0:	e8 1b f7 ff ff       	call   801025d0 <lapicinit>
80102eb5:	e8 a6 ff ff ff       	call   80102e60 <mpmain>
80102eba:	66 90                	xchg   %ax,%ax
80102ebc:	66 90                	xchg   %ax,%ax
80102ebe:	66 90                	xchg   %ax,%ax

80102ec0 <main>:
80102ec0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102ec4:	83 e4 f0             	and    $0xfffffff0,%esp
80102ec7:	ff 71 fc             	pushl  -0x4(%ecx)
80102eca:	55                   	push   %ebp
80102ecb:	89 e5                	mov    %esp,%ebp
80102ecd:	53                   	push   %ebx
80102ece:	51                   	push   %ecx
80102ecf:	83 ec 08             	sub    $0x8,%esp
80102ed2:	68 00 00 40 80       	push   $0x80400000
80102ed7:	68 28 55 11 80       	push   $0x80115528
80102edc:	e8 bf f4 ff ff       	call   801023a0 <kinit1>
80102ee1:	e8 7a 3a 00 00       	call   80106960 <kvmalloc>
80102ee6:	e8 b5 01 00 00       	call   801030a0 <mpinit>
80102eeb:	e8 e0 f6 ff ff       	call   801025d0 <lapicinit>
80102ef0:	e8 ab 38 00 00       	call   801067a0 <seginit>
80102ef5:	e8 d6 f7 ff ff       	call   801026d0 <cpunum>
80102efa:	5a                   	pop    %edx
80102efb:	59                   	pop    %ecx
80102efc:	50                   	push   %eax
80102efd:	68 71 74 10 80       	push   $0x80107471
80102f02:	e8 59 d7 ff ff       	call   80100660 <cprintf>
80102f07:	e8 a4 03 00 00       	call   801032b0 <picinit>
80102f0c:	e8 af f2 ff ff       	call   801021c0 <ioapicinit>
80102f11:	e8 8a da ff ff       	call   801009a0 <consoleinit>
80102f16:	e8 55 2b 00 00       	call   80105a70 <uartinit>
80102f1b:	e8 30 09 00 00       	call   80103850 <pinit>
80102f20:	e8 ab 27 00 00       	call   801056d0 <tvinit>
80102f25:	e8 16 d1 ff ff       	call   80100040 <binit>
80102f2a:	e8 01 de ff ff       	call   80100d30 <fileinit>
80102f2f:	e8 5c f0 ff ff       	call   80101f90 <ideinit>
80102f34:	8b 1d 84 27 11 80    	mov    0x80112784,%ebx
80102f3a:	83 c4 10             	add    $0x10,%esp
80102f3d:	85 db                	test   %ebx,%ebx
80102f3f:	0f 84 ca 00 00 00    	je     8010300f <main+0x14f>
80102f45:	83 ec 04             	sub    $0x4,%esp
80102f48:	bb a0 27 11 80       	mov    $0x801127a0,%ebx
80102f4d:	68 8a 00 00 00       	push   $0x8a
80102f52:	68 8c a4 10 80       	push   $0x8010a48c
80102f57:	68 00 70 00 80       	push   $0x80007000
80102f5c:	e8 cf 15 00 00       	call   80104530 <memmove>
80102f61:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102f68:	00 00 00 
80102f6b:	83 c4 10             	add    $0x10,%esp
80102f6e:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f73:	39 d8                	cmp    %ebx,%eax
80102f75:	76 7c                	jbe    80102ff3 <main+0x133>
80102f77:	89 f6                	mov    %esi,%esi
80102f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102f80:	e8 4b f7 ff ff       	call   801026d0 <cpunum>
80102f85:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102f8b:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f90:	39 c3                	cmp    %eax,%ebx
80102f92:	74 46                	je     80102fda <main+0x11a>
80102f94:	e8 d7 f4 ff ff       	call   80102470 <kalloc>
80102f99:	83 ec 08             	sub    $0x8,%esp
80102f9c:	05 00 10 00 00       	add    $0x1000,%eax
80102fa1:	c7 05 f8 6f 00 80 a0 	movl   $0x80102ea0,0x80006ff8
80102fa8:	2e 10 80 
80102fab:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102fb0:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102fb7:	90 10 00 
80102fba:	68 00 70 00 00       	push   $0x7000
80102fbf:	0f b6 03             	movzbl (%ebx),%eax
80102fc2:	50                   	push   %eax
80102fc3:	e8 d8 f7 ff ff       	call   801027a0 <lapicstartap>
80102fc8:	83 c4 10             	add    $0x10,%esp
80102fcb:	90                   	nop
80102fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102fd0:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80102fd6:	85 c0                	test   %eax,%eax
80102fd8:	74 f6                	je     80102fd0 <main+0x110>
80102fda:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102fe1:	00 00 00 
80102fe4:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
80102fea:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102fef:	39 c3                	cmp    %eax,%ebx
80102ff1:	72 8d                	jb     80102f80 <main+0xc0>
80102ff3:	83 ec 08             	sub    $0x8,%esp
80102ff6:	68 00 00 00 8e       	push   $0x8e000000
80102ffb:	68 00 00 40 80       	push   $0x80400000
80103000:	e8 0b f4 ff ff       	call   80102410 <kinit2>
80103005:	e8 66 08 00 00       	call   80103870 <userinit>
8010300a:	e8 51 fe ff ff       	call   80102e60 <mpmain>
8010300f:	e8 5c 26 00 00       	call   80105670 <timerinit>
80103014:	e9 2c ff ff ff       	jmp    80102f45 <main+0x85>
80103019:	66 90                	xchg   %ax,%ax
8010301b:	66 90                	xchg   %ax,%ax
8010301d:	66 90                	xchg   %ax,%ax
8010301f:	90                   	nop

80103020 <mpsearch1>:
80103020:	55                   	push   %ebp
80103021:	89 e5                	mov    %esp,%ebp
80103023:	57                   	push   %edi
80103024:	56                   	push   %esi
80103025:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
8010302b:	53                   	push   %ebx
8010302c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
8010302f:	83 ec 0c             	sub    $0xc,%esp
80103032:	39 de                	cmp    %ebx,%esi
80103034:	73 48                	jae    8010307e <mpsearch1+0x5e>
80103036:	8d 76 00             	lea    0x0(%esi),%esi
80103039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103040:	83 ec 04             	sub    $0x4,%esp
80103043:	8d 7e 10             	lea    0x10(%esi),%edi
80103046:	6a 04                	push   $0x4
80103048:	68 88 74 10 80       	push   $0x80107488
8010304d:	56                   	push   %esi
8010304e:	e8 7d 14 00 00       	call   801044d0 <memcmp>
80103053:	83 c4 10             	add    $0x10,%esp
80103056:	85 c0                	test   %eax,%eax
80103058:	75 1e                	jne    80103078 <mpsearch1+0x58>
8010305a:	8d 7e 10             	lea    0x10(%esi),%edi
8010305d:	89 f2                	mov    %esi,%edx
8010305f:	31 c9                	xor    %ecx,%ecx
80103061:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103068:	0f b6 02             	movzbl (%edx),%eax
8010306b:	83 c2 01             	add    $0x1,%edx
8010306e:	01 c1                	add    %eax,%ecx
80103070:	39 fa                	cmp    %edi,%edx
80103072:	75 f4                	jne    80103068 <mpsearch1+0x48>
80103074:	84 c9                	test   %cl,%cl
80103076:	74 10                	je     80103088 <mpsearch1+0x68>
80103078:	39 fb                	cmp    %edi,%ebx
8010307a:	89 fe                	mov    %edi,%esi
8010307c:	77 c2                	ja     80103040 <mpsearch1+0x20>
8010307e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103081:	31 c0                	xor    %eax,%eax
80103083:	5b                   	pop    %ebx
80103084:	5e                   	pop    %esi
80103085:	5f                   	pop    %edi
80103086:	5d                   	pop    %ebp
80103087:	c3                   	ret    
80103088:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010308b:	89 f0                	mov    %esi,%eax
8010308d:	5b                   	pop    %ebx
8010308e:	5e                   	pop    %esi
8010308f:	5f                   	pop    %edi
80103090:	5d                   	pop    %ebp
80103091:	c3                   	ret    
80103092:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801030a0 <mpinit>:
801030a0:	55                   	push   %ebp
801030a1:	89 e5                	mov    %esp,%ebp
801030a3:	57                   	push   %edi
801030a4:	56                   	push   %esi
801030a5:	53                   	push   %ebx
801030a6:	83 ec 1c             	sub    $0x1c,%esp
801030a9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
801030b0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
801030b7:	c1 e0 08             	shl    $0x8,%eax
801030ba:	09 d0                	or     %edx,%eax
801030bc:	c1 e0 04             	shl    $0x4,%eax
801030bf:	85 c0                	test   %eax,%eax
801030c1:	75 1b                	jne    801030de <mpinit+0x3e>
801030c3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801030ca:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801030d1:	c1 e0 08             	shl    $0x8,%eax
801030d4:	09 d0                	or     %edx,%eax
801030d6:	c1 e0 0a             	shl    $0xa,%eax
801030d9:	2d 00 04 00 00       	sub    $0x400,%eax
801030de:	ba 00 04 00 00       	mov    $0x400,%edx
801030e3:	e8 38 ff ff ff       	call   80103020 <mpsearch1>
801030e8:	85 c0                	test   %eax,%eax
801030ea:	89 c6                	mov    %eax,%esi
801030ec:	0f 84 66 01 00 00    	je     80103258 <mpinit+0x1b8>
801030f2:	8b 5e 04             	mov    0x4(%esi),%ebx
801030f5:	85 db                	test   %ebx,%ebx
801030f7:	0f 84 d6 00 00 00    	je     801031d3 <mpinit+0x133>
801030fd:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80103103:	83 ec 04             	sub    $0x4,%esp
80103106:	6a 04                	push   $0x4
80103108:	68 8d 74 10 80       	push   $0x8010748d
8010310d:	50                   	push   %eax
8010310e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103111:	e8 ba 13 00 00       	call   801044d0 <memcmp>
80103116:	83 c4 10             	add    $0x10,%esp
80103119:	85 c0                	test   %eax,%eax
8010311b:	0f 85 b2 00 00 00    	jne    801031d3 <mpinit+0x133>
80103121:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103128:	3c 01                	cmp    $0x1,%al
8010312a:	74 08                	je     80103134 <mpinit+0x94>
8010312c:	3c 04                	cmp    $0x4,%al
8010312e:	0f 85 9f 00 00 00    	jne    801031d3 <mpinit+0x133>
80103134:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
8010313b:	85 ff                	test   %edi,%edi
8010313d:	74 1e                	je     8010315d <mpinit+0xbd>
8010313f:	31 d2                	xor    %edx,%edx
80103141:	31 c0                	xor    %eax,%eax
80103143:	90                   	nop
80103144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103148:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010314f:	80 
80103150:	83 c0 01             	add    $0x1,%eax
80103153:	01 ca                	add    %ecx,%edx
80103155:	39 c7                	cmp    %eax,%edi
80103157:	75 ef                	jne    80103148 <mpinit+0xa8>
80103159:	84 d2                	test   %dl,%dl
8010315b:	75 76                	jne    801031d3 <mpinit+0x133>
8010315d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103160:	85 ff                	test   %edi,%edi
80103162:	74 6f                	je     801031d3 <mpinit+0x133>
80103164:	c7 05 84 27 11 80 01 	movl   $0x1,0x80112784
8010316b:	00 00 00 
8010316e:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103174:	a3 9c 26 11 80       	mov    %eax,0x8011269c
80103179:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
80103180:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80103186:	01 f9                	add    %edi,%ecx
80103188:	39 c8                	cmp    %ecx,%eax
8010318a:	0f 83 a0 00 00 00    	jae    80103230 <mpinit+0x190>
80103190:	80 38 04             	cmpb   $0x4,(%eax)
80103193:	0f 87 87 00 00 00    	ja     80103220 <mpinit+0x180>
80103199:	0f b6 10             	movzbl (%eax),%edx
8010319c:	ff 24 95 94 74 10 80 	jmp    *-0x7fef8b6c(,%edx,4)
801031a3:	90                   	nop
801031a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031a8:	83 c0 08             	add    $0x8,%eax
801031ab:	39 c1                	cmp    %eax,%ecx
801031ad:	77 e1                	ja     80103190 <mpinit+0xf0>
801031af:	a1 84 27 11 80       	mov    0x80112784,%eax
801031b4:	85 c0                	test   %eax,%eax
801031b6:	75 78                	jne    80103230 <mpinit+0x190>
801031b8:	c7 05 80 2d 11 80 01 	movl   $0x1,0x80112d80
801031bf:	00 00 00 
801031c2:	c7 05 9c 26 11 80 00 	movl   $0x0,0x8011269c
801031c9:	00 00 00 
801031cc:	c6 05 80 27 11 80 00 	movb   $0x0,0x80112780
801031d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031d6:	5b                   	pop    %ebx
801031d7:	5e                   	pop    %esi
801031d8:	5f                   	pop    %edi
801031d9:	5d                   	pop    %ebp
801031da:	c3                   	ret    
801031db:	90                   	nop
801031dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031e0:	8b 15 80 2d 11 80    	mov    0x80112d80,%edx
801031e6:	83 fa 07             	cmp    $0x7,%edx
801031e9:	7f 19                	jg     80103204 <mpinit+0x164>
801031eb:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
801031ef:	69 fa bc 00 00 00    	imul   $0xbc,%edx,%edi
801031f5:	83 c2 01             	add    $0x1,%edx
801031f8:	89 15 80 2d 11 80    	mov    %edx,0x80112d80
801031fe:	88 9f a0 27 11 80    	mov    %bl,-0x7feed860(%edi)
80103204:	83 c0 14             	add    $0x14,%eax
80103207:	eb a2                	jmp    801031ab <mpinit+0x10b>
80103209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103210:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103214:	83 c0 08             	add    $0x8,%eax
80103217:	88 15 80 27 11 80    	mov    %dl,0x80112780
8010321d:	eb 8c                	jmp    801031ab <mpinit+0x10b>
8010321f:	90                   	nop
80103220:	c7 05 84 27 11 80 00 	movl   $0x0,0x80112784
80103227:	00 00 00 
8010322a:	e9 7c ff ff ff       	jmp    801031ab <mpinit+0x10b>
8010322f:	90                   	nop
80103230:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
80103234:	74 9d                	je     801031d3 <mpinit+0x133>
80103236:	ba 22 00 00 00       	mov    $0x22,%edx
8010323b:	b8 70 00 00 00       	mov    $0x70,%eax
80103240:	ee                   	out    %al,(%dx)
80103241:	ba 23 00 00 00       	mov    $0x23,%edx
80103246:	ec                   	in     (%dx),%al
80103247:	83 c8 01             	or     $0x1,%eax
8010324a:	ee                   	out    %al,(%dx)
8010324b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010324e:	5b                   	pop    %ebx
8010324f:	5e                   	pop    %esi
80103250:	5f                   	pop    %edi
80103251:	5d                   	pop    %ebp
80103252:	c3                   	ret    
80103253:	90                   	nop
80103254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103258:	ba 00 00 01 00       	mov    $0x10000,%edx
8010325d:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103262:	e8 b9 fd ff ff       	call   80103020 <mpsearch1>
80103267:	85 c0                	test   %eax,%eax
80103269:	89 c6                	mov    %eax,%esi
8010326b:	0f 85 81 fe ff ff    	jne    801030f2 <mpinit+0x52>
80103271:	e9 5d ff ff ff       	jmp    801031d3 <mpinit+0x133>
80103276:	66 90                	xchg   %ax,%ax
80103278:	66 90                	xchg   %ax,%ax
8010327a:	66 90                	xchg   %ax,%ax
8010327c:	66 90                	xchg   %ax,%ax
8010327e:	66 90                	xchg   %ax,%ax

80103280 <picenable>:
80103280:	55                   	push   %ebp
80103281:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
80103286:	ba 21 00 00 00       	mov    $0x21,%edx
8010328b:	89 e5                	mov    %esp,%ebp
8010328d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103290:	d3 c0                	rol    %cl,%eax
80103292:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
80103299:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
8010329f:	ee                   	out    %al,(%dx)
801032a0:	ba a1 00 00 00       	mov    $0xa1,%edx
801032a5:	66 c1 e8 08          	shr    $0x8,%ax
801032a9:	ee                   	out    %al,(%dx)
801032aa:	5d                   	pop    %ebp
801032ab:	c3                   	ret    
801032ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801032b0 <picinit>:
801032b0:	55                   	push   %ebp
801032b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032b6:	89 e5                	mov    %esp,%ebp
801032b8:	57                   	push   %edi
801032b9:	56                   	push   %esi
801032ba:	53                   	push   %ebx
801032bb:	bb 21 00 00 00       	mov    $0x21,%ebx
801032c0:	89 da                	mov    %ebx,%edx
801032c2:	ee                   	out    %al,(%dx)
801032c3:	b9 a1 00 00 00       	mov    $0xa1,%ecx
801032c8:	89 ca                	mov    %ecx,%edx
801032ca:	ee                   	out    %al,(%dx)
801032cb:	bf 11 00 00 00       	mov    $0x11,%edi
801032d0:	be 20 00 00 00       	mov    $0x20,%esi
801032d5:	89 f8                	mov    %edi,%eax
801032d7:	89 f2                	mov    %esi,%edx
801032d9:	ee                   	out    %al,(%dx)
801032da:	b8 20 00 00 00       	mov    $0x20,%eax
801032df:	89 da                	mov    %ebx,%edx
801032e1:	ee                   	out    %al,(%dx)
801032e2:	b8 04 00 00 00       	mov    $0x4,%eax
801032e7:	ee                   	out    %al,(%dx)
801032e8:	b8 03 00 00 00       	mov    $0x3,%eax
801032ed:	ee                   	out    %al,(%dx)
801032ee:	bb a0 00 00 00       	mov    $0xa0,%ebx
801032f3:	89 f8                	mov    %edi,%eax
801032f5:	89 da                	mov    %ebx,%edx
801032f7:	ee                   	out    %al,(%dx)
801032f8:	b8 28 00 00 00       	mov    $0x28,%eax
801032fd:	89 ca                	mov    %ecx,%edx
801032ff:	ee                   	out    %al,(%dx)
80103300:	b8 02 00 00 00       	mov    $0x2,%eax
80103305:	ee                   	out    %al,(%dx)
80103306:	b8 03 00 00 00       	mov    $0x3,%eax
8010330b:	ee                   	out    %al,(%dx)
8010330c:	bf 68 00 00 00       	mov    $0x68,%edi
80103311:	89 f2                	mov    %esi,%edx
80103313:	89 f8                	mov    %edi,%eax
80103315:	ee                   	out    %al,(%dx)
80103316:	b9 0a 00 00 00       	mov    $0xa,%ecx
8010331b:	89 c8                	mov    %ecx,%eax
8010331d:	ee                   	out    %al,(%dx)
8010331e:	89 f8                	mov    %edi,%eax
80103320:	89 da                	mov    %ebx,%edx
80103322:	ee                   	out    %al,(%dx)
80103323:	89 c8                	mov    %ecx,%eax
80103325:	ee                   	out    %al,(%dx)
80103326:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
8010332d:	66 83 f8 ff          	cmp    $0xffff,%ax
80103331:	74 10                	je     80103343 <picinit+0x93>
80103333:	ba 21 00 00 00       	mov    $0x21,%edx
80103338:	ee                   	out    %al,(%dx)
80103339:	ba a1 00 00 00       	mov    $0xa1,%edx
8010333e:	66 c1 e8 08          	shr    $0x8,%ax
80103342:	ee                   	out    %al,(%dx)
80103343:	5b                   	pop    %ebx
80103344:	5e                   	pop    %esi
80103345:	5f                   	pop    %edi
80103346:	5d                   	pop    %ebp
80103347:	c3                   	ret    
80103348:	66 90                	xchg   %ax,%ax
8010334a:	66 90                	xchg   %ax,%ax
8010334c:	66 90                	xchg   %ax,%ax
8010334e:	66 90                	xchg   %ax,%ax

80103350 <pipealloc>:
80103350:	55                   	push   %ebp
80103351:	89 e5                	mov    %esp,%ebp
80103353:	57                   	push   %edi
80103354:	56                   	push   %esi
80103355:	53                   	push   %ebx
80103356:	83 ec 0c             	sub    $0xc,%esp
80103359:	8b 75 08             	mov    0x8(%ebp),%esi
8010335c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010335f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103365:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010336b:	e8 e0 d9 ff ff       	call   80100d50 <filealloc>
80103370:	85 c0                	test   %eax,%eax
80103372:	89 06                	mov    %eax,(%esi)
80103374:	0f 84 a8 00 00 00    	je     80103422 <pipealloc+0xd2>
8010337a:	e8 d1 d9 ff ff       	call   80100d50 <filealloc>
8010337f:	85 c0                	test   %eax,%eax
80103381:	89 03                	mov    %eax,(%ebx)
80103383:	0f 84 87 00 00 00    	je     80103410 <pipealloc+0xc0>
80103389:	e8 e2 f0 ff ff       	call   80102470 <kalloc>
8010338e:	85 c0                	test   %eax,%eax
80103390:	89 c7                	mov    %eax,%edi
80103392:	0f 84 b0 00 00 00    	je     80103448 <pipealloc+0xf8>
80103398:	83 ec 08             	sub    $0x8,%esp
8010339b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801033a2:	00 00 00 
801033a5:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801033ac:	00 00 00 
801033af:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801033b6:	00 00 00 
801033b9:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801033c0:	00 00 00 
801033c3:	68 a8 74 10 80       	push   $0x801074a8
801033c8:	50                   	push   %eax
801033c9:	e8 62 0e 00 00       	call   80104230 <initlock>
801033ce:	8b 06                	mov    (%esi),%eax
801033d0:	83 c4 10             	add    $0x10,%esp
801033d3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801033d9:	8b 06                	mov    (%esi),%eax
801033db:	c6 40 08 01          	movb   $0x1,0x8(%eax)
801033df:	8b 06                	mov    (%esi),%eax
801033e1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
801033e5:	8b 06                	mov    (%esi),%eax
801033e7:	89 78 0c             	mov    %edi,0xc(%eax)
801033ea:	8b 03                	mov    (%ebx),%eax
801033ec:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801033f2:	8b 03                	mov    (%ebx),%eax
801033f4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
801033f8:	8b 03                	mov    (%ebx),%eax
801033fa:	c6 40 09 01          	movb   $0x1,0x9(%eax)
801033fe:	8b 03                	mov    (%ebx),%eax
80103400:	89 78 0c             	mov    %edi,0xc(%eax)
80103403:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103406:	31 c0                	xor    %eax,%eax
80103408:	5b                   	pop    %ebx
80103409:	5e                   	pop    %esi
8010340a:	5f                   	pop    %edi
8010340b:	5d                   	pop    %ebp
8010340c:	c3                   	ret    
8010340d:	8d 76 00             	lea    0x0(%esi),%esi
80103410:	8b 06                	mov    (%esi),%eax
80103412:	85 c0                	test   %eax,%eax
80103414:	74 1e                	je     80103434 <pipealloc+0xe4>
80103416:	83 ec 0c             	sub    $0xc,%esp
80103419:	50                   	push   %eax
8010341a:	e8 f1 d9 ff ff       	call   80100e10 <fileclose>
8010341f:	83 c4 10             	add    $0x10,%esp
80103422:	8b 03                	mov    (%ebx),%eax
80103424:	85 c0                	test   %eax,%eax
80103426:	74 0c                	je     80103434 <pipealloc+0xe4>
80103428:	83 ec 0c             	sub    $0xc,%esp
8010342b:	50                   	push   %eax
8010342c:	e8 df d9 ff ff       	call   80100e10 <fileclose>
80103431:	83 c4 10             	add    $0x10,%esp
80103434:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103437:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010343c:	5b                   	pop    %ebx
8010343d:	5e                   	pop    %esi
8010343e:	5f                   	pop    %edi
8010343f:	5d                   	pop    %ebp
80103440:	c3                   	ret    
80103441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103448:	8b 06                	mov    (%esi),%eax
8010344a:	85 c0                	test   %eax,%eax
8010344c:	75 c8                	jne    80103416 <pipealloc+0xc6>
8010344e:	eb d2                	jmp    80103422 <pipealloc+0xd2>

80103450 <pipeclose>:
80103450:	55                   	push   %ebp
80103451:	89 e5                	mov    %esp,%ebp
80103453:	56                   	push   %esi
80103454:	53                   	push   %ebx
80103455:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103458:	8b 75 0c             	mov    0xc(%ebp),%esi
8010345b:	83 ec 0c             	sub    $0xc,%esp
8010345e:	53                   	push   %ebx
8010345f:	e8 ec 0d 00 00       	call   80104250 <acquire>
80103464:	83 c4 10             	add    $0x10,%esp
80103467:	85 f6                	test   %esi,%esi
80103469:	74 45                	je     801034b0 <pipeclose+0x60>
8010346b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103471:	83 ec 0c             	sub    $0xc,%esp
80103474:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010347b:	00 00 00 
8010347e:	50                   	push   %eax
8010347f:	e8 ec 0a 00 00       	call   80103f70 <wakeup>
80103484:	83 c4 10             	add    $0x10,%esp
80103487:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010348d:	85 d2                	test   %edx,%edx
8010348f:	75 0a                	jne    8010349b <pipeclose+0x4b>
80103491:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103497:	85 c0                	test   %eax,%eax
80103499:	74 35                	je     801034d0 <pipeclose+0x80>
8010349b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010349e:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034a1:	5b                   	pop    %ebx
801034a2:	5e                   	pop    %esi
801034a3:	5d                   	pop    %ebp
801034a4:	e9 87 0f 00 00       	jmp    80104430 <release>
801034a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801034b0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801034b6:	83 ec 0c             	sub    $0xc,%esp
801034b9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801034c0:	00 00 00 
801034c3:	50                   	push   %eax
801034c4:	e8 a7 0a 00 00       	call   80103f70 <wakeup>
801034c9:	83 c4 10             	add    $0x10,%esp
801034cc:	eb b9                	jmp    80103487 <pipeclose+0x37>
801034ce:	66 90                	xchg   %ax,%ax
801034d0:	83 ec 0c             	sub    $0xc,%esp
801034d3:	53                   	push   %ebx
801034d4:	e8 57 0f 00 00       	call   80104430 <release>
801034d9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034dc:	83 c4 10             	add    $0x10,%esp
801034df:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034e2:	5b                   	pop    %ebx
801034e3:	5e                   	pop    %esi
801034e4:	5d                   	pop    %ebp
801034e5:	e9 d6 ed ff ff       	jmp    801022c0 <kfree>
801034ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801034f0 <pipewrite>:
801034f0:	55                   	push   %ebp
801034f1:	89 e5                	mov    %esp,%ebp
801034f3:	57                   	push   %edi
801034f4:	56                   	push   %esi
801034f5:	53                   	push   %ebx
801034f6:	83 ec 28             	sub    $0x28,%esp
801034f9:	8b 7d 08             	mov    0x8(%ebp),%edi
801034fc:	57                   	push   %edi
801034fd:	e8 4e 0d 00 00       	call   80104250 <acquire>
80103502:	8b 45 10             	mov    0x10(%ebp),%eax
80103505:	83 c4 10             	add    $0x10,%esp
80103508:	85 c0                	test   %eax,%eax
8010350a:	0f 8e c6 00 00 00    	jle    801035d6 <pipewrite+0xe6>
80103510:	8b 45 0c             	mov    0xc(%ebp),%eax
80103513:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
80103519:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
8010351f:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
80103525:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103528:	03 45 10             	add    0x10(%ebp),%eax
8010352b:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010352e:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103534:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010353a:	39 d1                	cmp    %edx,%ecx
8010353c:	0f 85 cf 00 00 00    	jne    80103611 <pipewrite+0x121>
80103542:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
80103548:	85 d2                	test   %edx,%edx
8010354a:	0f 84 a8 00 00 00    	je     801035f8 <pipewrite+0x108>
80103550:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103557:	8b 42 24             	mov    0x24(%edx),%eax
8010355a:	85 c0                	test   %eax,%eax
8010355c:	74 25                	je     80103583 <pipewrite+0x93>
8010355e:	e9 95 00 00 00       	jmp    801035f8 <pipewrite+0x108>
80103563:	90                   	nop
80103564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103568:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
8010356e:	85 c0                	test   %eax,%eax
80103570:	0f 84 82 00 00 00    	je     801035f8 <pipewrite+0x108>
80103576:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010357c:	8b 40 24             	mov    0x24(%eax),%eax
8010357f:	85 c0                	test   %eax,%eax
80103581:	75 75                	jne    801035f8 <pipewrite+0x108>
80103583:	83 ec 0c             	sub    $0xc,%esp
80103586:	56                   	push   %esi
80103587:	e8 e4 09 00 00       	call   80103f70 <wakeup>
8010358c:	59                   	pop    %ecx
8010358d:	58                   	pop    %eax
8010358e:	57                   	push   %edi
8010358f:	53                   	push   %ebx
80103590:	e8 3b 08 00 00       	call   80103dd0 <sleep>
80103595:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
8010359b:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
801035a1:	83 c4 10             	add    $0x10,%esp
801035a4:	05 00 02 00 00       	add    $0x200,%eax
801035a9:	39 c2                	cmp    %eax,%edx
801035ab:	74 bb                	je     80103568 <pipewrite+0x78>
801035ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801035b0:	8d 4a 01             	lea    0x1(%edx),%ecx
801035b3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801035b7:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801035bd:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
801035c3:	0f b6 00             	movzbl (%eax),%eax
801035c6:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
801035ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801035cd:	3b 45 e0             	cmp    -0x20(%ebp),%eax
801035d0:	0f 85 58 ff ff ff    	jne    8010352e <pipewrite+0x3e>
801035d6:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
801035dc:	83 ec 0c             	sub    $0xc,%esp
801035df:	52                   	push   %edx
801035e0:	e8 8b 09 00 00       	call   80103f70 <wakeup>
801035e5:	89 3c 24             	mov    %edi,(%esp)
801035e8:	e8 43 0e 00 00       	call   80104430 <release>
801035ed:	83 c4 10             	add    $0x10,%esp
801035f0:	8b 45 10             	mov    0x10(%ebp),%eax
801035f3:	eb 14                	jmp    80103609 <pipewrite+0x119>
801035f5:	8d 76 00             	lea    0x0(%esi),%esi
801035f8:	83 ec 0c             	sub    $0xc,%esp
801035fb:	57                   	push   %edi
801035fc:	e8 2f 0e 00 00       	call   80104430 <release>
80103601:	83 c4 10             	add    $0x10,%esp
80103604:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103609:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010360c:	5b                   	pop    %ebx
8010360d:	5e                   	pop    %esi
8010360e:	5f                   	pop    %edi
8010360f:	5d                   	pop    %ebp
80103610:	c3                   	ret    
80103611:	89 ca                	mov    %ecx,%edx
80103613:	eb 98                	jmp    801035ad <pipewrite+0xbd>
80103615:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103620 <piperead>:
80103620:	55                   	push   %ebp
80103621:	89 e5                	mov    %esp,%ebp
80103623:	57                   	push   %edi
80103624:	56                   	push   %esi
80103625:	53                   	push   %ebx
80103626:	83 ec 18             	sub    $0x18,%esp
80103629:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010362c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010362f:	53                   	push   %ebx
80103630:	e8 1b 0c 00 00       	call   80104250 <acquire>
80103635:	83 c4 10             	add    $0x10,%esp
80103638:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010363e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
80103644:	75 6a                	jne    801036b0 <piperead+0x90>
80103646:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
8010364c:	85 f6                	test   %esi,%esi
8010364e:	0f 84 cc 00 00 00    	je     80103720 <piperead+0x100>
80103654:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
8010365a:	eb 2d                	jmp    80103689 <piperead+0x69>
8010365c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103660:	83 ec 08             	sub    $0x8,%esp
80103663:	53                   	push   %ebx
80103664:	56                   	push   %esi
80103665:	e8 66 07 00 00       	call   80103dd0 <sleep>
8010366a:	83 c4 10             	add    $0x10,%esp
8010366d:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103673:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
80103679:	75 35                	jne    801036b0 <piperead+0x90>
8010367b:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
80103681:	85 d2                	test   %edx,%edx
80103683:	0f 84 97 00 00 00    	je     80103720 <piperead+0x100>
80103689:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103690:	8b 4a 24             	mov    0x24(%edx),%ecx
80103693:	85 c9                	test   %ecx,%ecx
80103695:	74 c9                	je     80103660 <piperead+0x40>
80103697:	83 ec 0c             	sub    $0xc,%esp
8010369a:	53                   	push   %ebx
8010369b:	e8 90 0d 00 00       	call   80104430 <release>
801036a0:	83 c4 10             	add    $0x10,%esp
801036a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801036ab:	5b                   	pop    %ebx
801036ac:	5e                   	pop    %esi
801036ad:	5f                   	pop    %edi
801036ae:	5d                   	pop    %ebp
801036af:	c3                   	ret    
801036b0:	8b 45 10             	mov    0x10(%ebp),%eax
801036b3:	85 c0                	test   %eax,%eax
801036b5:	7e 69                	jle    80103720 <piperead+0x100>
801036b7:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
801036bd:	31 c9                	xor    %ecx,%ecx
801036bf:	eb 15                	jmp    801036d6 <piperead+0xb6>
801036c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801036c8:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
801036ce:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
801036d4:	74 5a                	je     80103730 <piperead+0x110>
801036d6:	8d 72 01             	lea    0x1(%edx),%esi
801036d9:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801036df:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
801036e5:	0f b6 54 13 34       	movzbl 0x34(%ebx,%edx,1),%edx
801036ea:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
801036ed:	83 c1 01             	add    $0x1,%ecx
801036f0:	39 4d 10             	cmp    %ecx,0x10(%ebp)
801036f3:	75 d3                	jne    801036c8 <piperead+0xa8>
801036f5:	8d 93 38 02 00 00    	lea    0x238(%ebx),%edx
801036fb:	83 ec 0c             	sub    $0xc,%esp
801036fe:	52                   	push   %edx
801036ff:	e8 6c 08 00 00       	call   80103f70 <wakeup>
80103704:	89 1c 24             	mov    %ebx,(%esp)
80103707:	e8 24 0d 00 00       	call   80104430 <release>
8010370c:	8b 45 10             	mov    0x10(%ebp),%eax
8010370f:	83 c4 10             	add    $0x10,%esp
80103712:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103715:	5b                   	pop    %ebx
80103716:	5e                   	pop    %esi
80103717:	5f                   	pop    %edi
80103718:	5d                   	pop    %ebp
80103719:	c3                   	ret    
8010371a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103720:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103727:	eb cc                	jmp    801036f5 <piperead+0xd5>
80103729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103730:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103733:	eb c0                	jmp    801036f5 <piperead+0xd5>
80103735:	66 90                	xchg   %ax,%ax
80103737:	66 90                	xchg   %ax,%ax
80103739:	66 90                	xchg   %ax,%ax
8010373b:	66 90                	xchg   %ax,%ax
8010373d:	66 90                	xchg   %ax,%ax
8010373f:	90                   	nop

80103740 <allocproc>:
80103740:	55                   	push   %ebp
80103741:	89 e5                	mov    %esp,%ebp
80103743:	53                   	push   %ebx
80103744:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103749:	83 ec 10             	sub    $0x10,%esp
8010374c:	68 a0 2d 11 80       	push   $0x80112da0
80103751:	e8 fa 0a 00 00       	call   80104250 <acquire>
80103756:	83 c4 10             	add    $0x10,%esp
80103759:	eb 10                	jmp    8010376b <allocproc+0x2b>
8010375b:	90                   	nop
8010375c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103760:	83 c3 7c             	add    $0x7c,%ebx
80103763:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103769:	74 75                	je     801037e0 <allocproc+0xa0>
8010376b:	8b 43 0c             	mov    0xc(%ebx),%eax
8010376e:	85 c0                	test   %eax,%eax
80103770:	75 ee                	jne    80103760 <allocproc+0x20>
80103772:	a1 08 a0 10 80       	mov    0x8010a008,%eax
80103777:	83 ec 0c             	sub    $0xc,%esp
8010377a:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
80103781:	68 a0 2d 11 80       	push   $0x80112da0
80103786:	8d 50 01             	lea    0x1(%eax),%edx
80103789:	89 43 10             	mov    %eax,0x10(%ebx)
8010378c:	89 15 08 a0 10 80    	mov    %edx,0x8010a008
80103792:	e8 99 0c 00 00       	call   80104430 <release>
80103797:	e8 d4 ec ff ff       	call   80102470 <kalloc>
8010379c:	83 c4 10             	add    $0x10,%esp
8010379f:	85 c0                	test   %eax,%eax
801037a1:	89 43 08             	mov    %eax,0x8(%ebx)
801037a4:	74 51                	je     801037f7 <allocproc+0xb7>
801037a6:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
801037ac:	83 ec 04             	sub    $0x4,%esp
801037af:	05 9c 0f 00 00       	add    $0xf9c,%eax
801037b4:	89 53 18             	mov    %edx,0x18(%ebx)
801037b7:	c7 40 14 bd 56 10 80 	movl   $0x801056bd,0x14(%eax)
801037be:	6a 14                	push   $0x14
801037c0:	6a 00                	push   $0x0
801037c2:	50                   	push   %eax
801037c3:	89 43 1c             	mov    %eax,0x1c(%ebx)
801037c6:	e8 b5 0c 00 00       	call   80104480 <memset>
801037cb:	8b 43 1c             	mov    0x1c(%ebx),%eax
801037ce:	83 c4 10             	add    $0x10,%esp
801037d1:	c7 40 10 00 38 10 80 	movl   $0x80103800,0x10(%eax)
801037d8:	89 d8                	mov    %ebx,%eax
801037da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037dd:	c9                   	leave  
801037de:	c3                   	ret    
801037df:	90                   	nop
801037e0:	83 ec 0c             	sub    $0xc,%esp
801037e3:	68 a0 2d 11 80       	push   $0x80112da0
801037e8:	e8 43 0c 00 00       	call   80104430 <release>
801037ed:	83 c4 10             	add    $0x10,%esp
801037f0:	31 c0                	xor    %eax,%eax
801037f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037f5:	c9                   	leave  
801037f6:	c3                   	ret    
801037f7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801037fe:	eb da                	jmp    801037da <allocproc+0x9a>

80103800 <forkret>:
80103800:	55                   	push   %ebp
80103801:	89 e5                	mov    %esp,%ebp
80103803:	83 ec 14             	sub    $0x14,%esp
80103806:	68 a0 2d 11 80       	push   $0x80112da0
8010380b:	e8 20 0c 00 00       	call   80104430 <release>
80103810:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103815:	83 c4 10             	add    $0x10,%esp
80103818:	85 c0                	test   %eax,%eax
8010381a:	75 04                	jne    80103820 <forkret+0x20>
8010381c:	c9                   	leave  
8010381d:	c3                   	ret    
8010381e:	66 90                	xchg   %ax,%ax
80103820:	83 ec 0c             	sub    $0xc,%esp
80103823:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
8010382a:	00 00 00 
8010382d:	6a 01                	push   $0x1
8010382f:	e8 1c dc ff ff       	call   80101450 <iinit>
80103834:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010383b:	e8 d0 f2 ff ff       	call   80102b10 <initlog>
80103840:	83 c4 10             	add    $0x10,%esp
80103843:	c9                   	leave  
80103844:	c3                   	ret    
80103845:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103850 <pinit>:
80103850:	55                   	push   %ebp
80103851:	89 e5                	mov    %esp,%ebp
80103853:	83 ec 10             	sub    $0x10,%esp
80103856:	68 ad 74 10 80       	push   $0x801074ad
8010385b:	68 a0 2d 11 80       	push   $0x80112da0
80103860:	e8 cb 09 00 00       	call   80104230 <initlock>
80103865:	83 c4 10             	add    $0x10,%esp
80103868:	c9                   	leave  
80103869:	c3                   	ret    
8010386a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103870 <userinit>:
80103870:	55                   	push   %ebp
80103871:	89 e5                	mov    %esp,%ebp
80103873:	53                   	push   %ebx
80103874:	83 ec 04             	sub    $0x4,%esp
80103877:	e8 c4 fe ff ff       	call   80103740 <allocproc>
8010387c:	89 c3                	mov    %eax,%ebx
8010387e:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
80103883:	e8 68 30 00 00       	call   801068f0 <setupkvm>
80103888:	85 c0                	test   %eax,%eax
8010388a:	89 43 04             	mov    %eax,0x4(%ebx)
8010388d:	0f 84 bd 00 00 00    	je     80103950 <userinit+0xe0>
80103893:	83 ec 04             	sub    $0x4,%esp
80103896:	68 2c 00 00 00       	push   $0x2c
8010389b:	68 60 a4 10 80       	push   $0x8010a460
801038a0:	50                   	push   %eax
801038a1:	e8 ca 31 00 00       	call   80106a70 <inituvm>
801038a6:	83 c4 0c             	add    $0xc,%esp
801038a9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
801038af:	6a 4c                	push   $0x4c
801038b1:	6a 00                	push   $0x0
801038b3:	ff 73 18             	pushl  0x18(%ebx)
801038b6:	e8 c5 0b 00 00       	call   80104480 <memset>
801038bb:	8b 43 18             	mov    0x18(%ebx),%eax
801038be:	ba 23 00 00 00       	mov    $0x23,%edx
801038c3:	b9 2b 00 00 00       	mov    $0x2b,%ecx
801038c8:	83 c4 0c             	add    $0xc,%esp
801038cb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
801038cf:	8b 43 18             	mov    0x18(%ebx),%eax
801038d2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
801038d6:	8b 43 18             	mov    0x18(%ebx),%eax
801038d9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038dd:	66 89 50 28          	mov    %dx,0x28(%eax)
801038e1:	8b 43 18             	mov    0x18(%ebx),%eax
801038e4:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038e8:	66 89 50 48          	mov    %dx,0x48(%eax)
801038ec:	8b 43 18             	mov    0x18(%ebx),%eax
801038ef:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
801038f6:	8b 43 18             	mov    0x18(%ebx),%eax
801038f9:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
80103900:	8b 43 18             	mov    0x18(%ebx),%eax
80103903:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
8010390a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010390d:	6a 10                	push   $0x10
8010390f:	68 cd 74 10 80       	push   $0x801074cd
80103914:	50                   	push   %eax
80103915:	e8 66 0d 00 00       	call   80104680 <safestrcpy>
8010391a:	c7 04 24 d6 74 10 80 	movl   $0x801074d6,(%esp)
80103921:	e8 5a e5 ff ff       	call   80101e80 <namei>
80103926:	89 43 68             	mov    %eax,0x68(%ebx)
80103929:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103930:	e8 1b 09 00 00       	call   80104250 <acquire>
80103935:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
8010393c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103943:	e8 e8 0a 00 00       	call   80104430 <release>
80103948:	83 c4 10             	add    $0x10,%esp
8010394b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010394e:	c9                   	leave  
8010394f:	c3                   	ret    
80103950:	83 ec 0c             	sub    $0xc,%esp
80103953:	68 b4 74 10 80       	push   $0x801074b4
80103958:	e8 13 ca ff ff       	call   80100370 <panic>
8010395d:	8d 76 00             	lea    0x0(%esi),%esi

80103960 <growproc>:
80103960:	55                   	push   %ebp
80103961:	89 e5                	mov    %esp,%ebp
80103963:	83 ec 08             	sub    $0x8,%esp
80103966:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010396d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103970:	8b 02                	mov    (%edx),%eax
80103972:	83 f9 00             	cmp    $0x0,%ecx
80103975:	7e 39                	jle    801039b0 <growproc+0x50>
80103977:	83 ec 04             	sub    $0x4,%esp
8010397a:	01 c1                	add    %eax,%ecx
8010397c:	51                   	push   %ecx
8010397d:	50                   	push   %eax
8010397e:	ff 72 04             	pushl  0x4(%edx)
80103981:	e8 2a 32 00 00       	call   80106bb0 <allocuvm>
80103986:	83 c4 10             	add    $0x10,%esp
80103989:	85 c0                	test   %eax,%eax
8010398b:	74 3b                	je     801039c8 <growproc+0x68>
8010398d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103994:	89 02                	mov    %eax,(%edx)
80103996:	83 ec 0c             	sub    $0xc,%esp
80103999:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
801039a0:	e8 fb 2f 00 00       	call   801069a0 <switchuvm>
801039a5:	83 c4 10             	add    $0x10,%esp
801039a8:	31 c0                	xor    %eax,%eax
801039aa:	c9                   	leave  
801039ab:	c3                   	ret    
801039ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801039b0:	74 e2                	je     80103994 <growproc+0x34>
801039b2:	83 ec 04             	sub    $0x4,%esp
801039b5:	01 c1                	add    %eax,%ecx
801039b7:	51                   	push   %ecx
801039b8:	50                   	push   %eax
801039b9:	ff 72 04             	pushl  0x4(%edx)
801039bc:	e8 ef 32 00 00       	call   80106cb0 <deallocuvm>
801039c1:	83 c4 10             	add    $0x10,%esp
801039c4:	85 c0                	test   %eax,%eax
801039c6:	75 c5                	jne    8010398d <growproc+0x2d>
801039c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801039cd:	c9                   	leave  
801039ce:	c3                   	ret    
801039cf:	90                   	nop

801039d0 <fork>:
801039d0:	55                   	push   %ebp
801039d1:	89 e5                	mov    %esp,%ebp
801039d3:	57                   	push   %edi
801039d4:	56                   	push   %esi
801039d5:	53                   	push   %ebx
801039d6:	83 ec 0c             	sub    $0xc,%esp
801039d9:	e8 62 fd ff ff       	call   80103740 <allocproc>
801039de:	85 c0                	test   %eax,%eax
801039e0:	0f 84 d6 00 00 00    	je     80103abc <fork+0xec>
801039e6:	89 c3                	mov    %eax,%ebx
801039e8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801039ee:	83 ec 08             	sub    $0x8,%esp
801039f1:	ff 30                	pushl  (%eax)
801039f3:	ff 70 04             	pushl  0x4(%eax)
801039f6:	e8 95 33 00 00       	call   80106d90 <copyuvm>
801039fb:	83 c4 10             	add    $0x10,%esp
801039fe:	85 c0                	test   %eax,%eax
80103a00:	89 43 04             	mov    %eax,0x4(%ebx)
80103a03:	0f 84 ba 00 00 00    	je     80103ac3 <fork+0xf3>
80103a09:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a0f:	8b 7b 18             	mov    0x18(%ebx),%edi
80103a12:	b9 13 00 00 00       	mov    $0x13,%ecx
80103a17:	8b 00                	mov    (%eax),%eax
80103a19:	89 03                	mov    %eax,(%ebx)
80103a1b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a21:	89 43 14             	mov    %eax,0x14(%ebx)
80103a24:	8b 70 18             	mov    0x18(%eax),%esi
80103a27:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80103a29:	31 f6                	xor    %esi,%esi
80103a2b:	8b 43 18             	mov    0x18(%ebx),%eax
80103a2e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a35:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103a40:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103a44:	85 c0                	test   %eax,%eax
80103a46:	74 17                	je     80103a5f <fork+0x8f>
80103a48:	83 ec 0c             	sub    $0xc,%esp
80103a4b:	50                   	push   %eax
80103a4c:	e8 6f d3 ff ff       	call   80100dc0 <filedup>
80103a51:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103a55:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a5c:	83 c4 10             	add    $0x10,%esp
80103a5f:	83 c6 01             	add    $0x1,%esi
80103a62:	83 fe 10             	cmp    $0x10,%esi
80103a65:	75 d9                	jne    80103a40 <fork+0x70>
80103a67:	83 ec 0c             	sub    $0xc,%esp
80103a6a:	ff 72 68             	pushl  0x68(%edx)
80103a6d:	e8 ae db ff ff       	call   80101620 <idup>
80103a72:	89 43 68             	mov    %eax,0x68(%ebx)
80103a75:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a7b:	83 c4 0c             	add    $0xc,%esp
80103a7e:	6a 10                	push   $0x10
80103a80:	83 c0 6c             	add    $0x6c,%eax
80103a83:	50                   	push   %eax
80103a84:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103a87:	50                   	push   %eax
80103a88:	e8 f3 0b 00 00       	call   80104680 <safestrcpy>
80103a8d:	8b 73 10             	mov    0x10(%ebx),%esi
80103a90:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103a97:	e8 b4 07 00 00       	call   80104250 <acquire>
80103a9c:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103aa3:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103aaa:	e8 81 09 00 00       	call   80104430 <release>
80103aaf:	83 c4 10             	add    $0x10,%esp
80103ab2:	89 f0                	mov    %esi,%eax
80103ab4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103ab7:	5b                   	pop    %ebx
80103ab8:	5e                   	pop    %esi
80103ab9:	5f                   	pop    %edi
80103aba:	5d                   	pop    %ebp
80103abb:	c3                   	ret    
80103abc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103ac1:	eb f1                	jmp    80103ab4 <fork+0xe4>
80103ac3:	83 ec 0c             	sub    $0xc,%esp
80103ac6:	ff 73 08             	pushl  0x8(%ebx)
80103ac9:	e8 f2 e7 ff ff       	call   801022c0 <kfree>
80103ace:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103ad5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103adc:	83 c4 10             	add    $0x10,%esp
80103adf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103ae4:	eb ce                	jmp    80103ab4 <fork+0xe4>
80103ae6:	8d 76 00             	lea    0x0(%esi),%esi
80103ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103af0 <scheduler>:
80103af0:	55                   	push   %ebp
80103af1:	89 e5                	mov    %esp,%ebp
80103af3:	53                   	push   %ebx
80103af4:	83 ec 04             	sub    $0x4,%esp
80103af7:	89 f6                	mov    %esi,%esi
80103af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103b00:	fb                   	sti    
80103b01:	83 ec 0c             	sub    $0xc,%esp
80103b04:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103b09:	68 a0 2d 11 80       	push   $0x80112da0
80103b0e:	e8 3d 07 00 00       	call   80104250 <acquire>
80103b13:	83 c4 10             	add    $0x10,%esp
80103b16:	eb 13                	jmp    80103b2b <scheduler+0x3b>
80103b18:	90                   	nop
80103b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b20:	83 c3 7c             	add    $0x7c,%ebx
80103b23:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103b29:	74 55                	je     80103b80 <scheduler+0x90>
80103b2b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103b2f:	75 ef                	jne    80103b20 <scheduler+0x30>
80103b31:	83 ec 0c             	sub    $0xc,%esp
80103b34:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
80103b3b:	53                   	push   %ebx
80103b3c:	83 c3 7c             	add    $0x7c,%ebx
80103b3f:	e8 5c 2e 00 00       	call   801069a0 <switchuvm>
80103b44:	58                   	pop    %eax
80103b45:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103b4b:	c7 43 90 04 00 00 00 	movl   $0x4,-0x70(%ebx)
80103b52:	5a                   	pop    %edx
80103b53:	ff 73 a0             	pushl  -0x60(%ebx)
80103b56:	83 c0 04             	add    $0x4,%eax
80103b59:	50                   	push   %eax
80103b5a:	e8 7c 0b 00 00       	call   801046db <swtch>
80103b5f:	e8 1c 2e 00 00       	call   80106980 <switchkvm>
80103b64:	83 c4 10             	add    $0x10,%esp
80103b67:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103b6d:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103b74:	00 00 00 00 
80103b78:	75 b1                	jne    80103b2b <scheduler+0x3b>
80103b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103b80:	83 ec 0c             	sub    $0xc,%esp
80103b83:	68 a0 2d 11 80       	push   $0x80112da0
80103b88:	e8 a3 08 00 00       	call   80104430 <release>
80103b8d:	83 c4 10             	add    $0x10,%esp
80103b90:	e9 6b ff ff ff       	jmp    80103b00 <scheduler+0x10>
80103b95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ba0 <sched>:
80103ba0:	55                   	push   %ebp
80103ba1:	89 e5                	mov    %esp,%ebp
80103ba3:	53                   	push   %ebx
80103ba4:	83 ec 10             	sub    $0x10,%esp
80103ba7:	68 a0 2d 11 80       	push   $0x80112da0
80103bac:	e8 cf 07 00 00       	call   80104380 <holding>
80103bb1:	83 c4 10             	add    $0x10,%esp
80103bb4:	85 c0                	test   %eax,%eax
80103bb6:	74 4c                	je     80103c04 <sched+0x64>
80103bb8:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103bbf:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103bc6:	75 63                	jne    80103c2b <sched+0x8b>
80103bc8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103bce:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103bd2:	74 4a                	je     80103c1e <sched+0x7e>
80103bd4:	9c                   	pushf  
80103bd5:	59                   	pop    %ecx
80103bd6:	80 e5 02             	and    $0x2,%ch
80103bd9:	75 36                	jne    80103c11 <sched+0x71>
80103bdb:	83 ec 08             	sub    $0x8,%esp
80103bde:	83 c0 1c             	add    $0x1c,%eax
80103be1:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
80103be7:	ff 72 04             	pushl  0x4(%edx)
80103bea:	50                   	push   %eax
80103beb:	e8 eb 0a 00 00       	call   801046db <swtch>
80103bf0:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103bf6:	83 c4 10             	add    $0x10,%esp
80103bf9:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
80103bff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c02:	c9                   	leave  
80103c03:	c3                   	ret    
80103c04:	83 ec 0c             	sub    $0xc,%esp
80103c07:	68 d8 74 10 80       	push   $0x801074d8
80103c0c:	e8 5f c7 ff ff       	call   80100370 <panic>
80103c11:	83 ec 0c             	sub    $0xc,%esp
80103c14:	68 04 75 10 80       	push   $0x80107504
80103c19:	e8 52 c7 ff ff       	call   80100370 <panic>
80103c1e:	83 ec 0c             	sub    $0xc,%esp
80103c21:	68 f6 74 10 80       	push   $0x801074f6
80103c26:	e8 45 c7 ff ff       	call   80100370 <panic>
80103c2b:	83 ec 0c             	sub    $0xc,%esp
80103c2e:	68 ea 74 10 80       	push   $0x801074ea
80103c33:	e8 38 c7 ff ff       	call   80100370 <panic>
80103c38:	90                   	nop
80103c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103c40 <exit>:
80103c40:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103c47:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
80103c4d:	55                   	push   %ebp
80103c4e:	89 e5                	mov    %esp,%ebp
80103c50:	56                   	push   %esi
80103c51:	53                   	push   %ebx
80103c52:	0f 84 1f 01 00 00    	je     80103d77 <exit+0x137>
80103c58:	31 db                	xor    %ebx,%ebx
80103c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103c60:	8d 73 08             	lea    0x8(%ebx),%esi
80103c63:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103c67:	85 c0                	test   %eax,%eax
80103c69:	74 1b                	je     80103c86 <exit+0x46>
80103c6b:	83 ec 0c             	sub    $0xc,%esp
80103c6e:	50                   	push   %eax
80103c6f:	e8 9c d1 ff ff       	call   80100e10 <fileclose>
80103c74:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103c7b:	83 c4 10             	add    $0x10,%esp
80103c7e:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103c85:	00 
80103c86:	83 c3 01             	add    $0x1,%ebx
80103c89:	83 fb 10             	cmp    $0x10,%ebx
80103c8c:	75 d2                	jne    80103c60 <exit+0x20>
80103c8e:	e8 1d ef ff ff       	call   80102bb0 <begin_op>
80103c93:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103c99:	83 ec 0c             	sub    $0xc,%esp
80103c9c:	ff 70 68             	pushl  0x68(%eax)
80103c9f:	e8 dc da ff ff       	call   80101780 <iput>
80103ca4:	e8 77 ef ff ff       	call   80102c20 <end_op>
80103ca9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103caf:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)
80103cb6:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103cbd:	e8 8e 05 00 00       	call   80104250 <acquire>
80103cc2:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80103cc9:	83 c4 10             	add    $0x10,%esp
80103ccc:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103cd1:	8b 51 14             	mov    0x14(%ecx),%edx
80103cd4:	eb 14                	jmp    80103cea <exit+0xaa>
80103cd6:	8d 76 00             	lea    0x0(%esi),%esi
80103cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103ce0:	83 c0 7c             	add    $0x7c,%eax
80103ce3:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103ce8:	74 1c                	je     80103d06 <exit+0xc6>
80103cea:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103cee:	75 f0                	jne    80103ce0 <exit+0xa0>
80103cf0:	3b 50 20             	cmp    0x20(%eax),%edx
80103cf3:	75 eb                	jne    80103ce0 <exit+0xa0>
80103cf5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103cfc:	83 c0 7c             	add    $0x7c,%eax
80103cff:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103d04:	75 e4                	jne    80103cea <exit+0xaa>
80103d06:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103d0c:	ba d4 2d 11 80       	mov    $0x80112dd4,%edx
80103d11:	eb 10                	jmp    80103d23 <exit+0xe3>
80103d13:	90                   	nop
80103d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103d18:	83 c2 7c             	add    $0x7c,%edx
80103d1b:	81 fa d4 4c 11 80    	cmp    $0x80114cd4,%edx
80103d21:	74 3b                	je     80103d5e <exit+0x11e>
80103d23:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103d26:	75 f0                	jne    80103d18 <exit+0xd8>
80103d28:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
80103d2c:	89 5a 14             	mov    %ebx,0x14(%edx)
80103d2f:	75 e7                	jne    80103d18 <exit+0xd8>
80103d31:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103d36:	eb 12                	jmp    80103d4a <exit+0x10a>
80103d38:	90                   	nop
80103d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103d40:	83 c0 7c             	add    $0x7c,%eax
80103d43:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103d48:	74 ce                	je     80103d18 <exit+0xd8>
80103d4a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d4e:	75 f0                	jne    80103d40 <exit+0x100>
80103d50:	3b 58 20             	cmp    0x20(%eax),%ebx
80103d53:	75 eb                	jne    80103d40 <exit+0x100>
80103d55:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103d5c:	eb e2                	jmp    80103d40 <exit+0x100>
80103d5e:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
80103d65:	e8 36 fe ff ff       	call   80103ba0 <sched>
80103d6a:	83 ec 0c             	sub    $0xc,%esp
80103d6d:	68 25 75 10 80       	push   $0x80107525
80103d72:	e8 f9 c5 ff ff       	call   80100370 <panic>
80103d77:	83 ec 0c             	sub    $0xc,%esp
80103d7a:	68 18 75 10 80       	push   $0x80107518
80103d7f:	e8 ec c5 ff ff       	call   80100370 <panic>
80103d84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103d90 <yield>:
80103d90:	55                   	push   %ebp
80103d91:	89 e5                	mov    %esp,%ebp
80103d93:	83 ec 14             	sub    $0x14,%esp
80103d96:	68 a0 2d 11 80       	push   $0x80112da0
80103d9b:	e8 b0 04 00 00       	call   80104250 <acquire>
80103da0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103da6:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103dad:	e8 ee fd ff ff       	call   80103ba0 <sched>
80103db2:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103db9:	e8 72 06 00 00       	call   80104430 <release>
80103dbe:	83 c4 10             	add    $0x10,%esp
80103dc1:	c9                   	leave  
80103dc2:	c3                   	ret    
80103dc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103dd0 <sleep>:
80103dd0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103dd6:	55                   	push   %ebp
80103dd7:	89 e5                	mov    %esp,%ebp
80103dd9:	56                   	push   %esi
80103dda:	53                   	push   %ebx
80103ddb:	85 c0                	test   %eax,%eax
80103ddd:	8b 75 08             	mov    0x8(%ebp),%esi
80103de0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80103de3:	0f 84 97 00 00 00    	je     80103e80 <sleep+0xb0>
80103de9:	85 db                	test   %ebx,%ebx
80103deb:	0f 84 82 00 00 00    	je     80103e73 <sleep+0xa3>
80103df1:	81 fb a0 2d 11 80    	cmp    $0x80112da0,%ebx
80103df7:	74 57                	je     80103e50 <sleep+0x80>
80103df9:	83 ec 0c             	sub    $0xc,%esp
80103dfc:	68 a0 2d 11 80       	push   $0x80112da0
80103e01:	e8 4a 04 00 00       	call   80104250 <acquire>
80103e06:	89 1c 24             	mov    %ebx,(%esp)
80103e09:	e8 22 06 00 00       	call   80104430 <release>
80103e0e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e14:	89 70 20             	mov    %esi,0x20(%eax)
80103e17:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
80103e1e:	e8 7d fd ff ff       	call   80103ba0 <sched>
80103e23:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e29:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
80103e30:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103e37:	e8 f4 05 00 00       	call   80104430 <release>
80103e3c:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103e3f:	83 c4 10             	add    $0x10,%esp
80103e42:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e45:	5b                   	pop    %ebx
80103e46:	5e                   	pop    %esi
80103e47:	5d                   	pop    %ebp
80103e48:	e9 03 04 00 00       	jmp    80104250 <acquire>
80103e4d:	8d 76 00             	lea    0x0(%esi),%esi
80103e50:	89 70 20             	mov    %esi,0x20(%eax)
80103e53:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
80103e5a:	e8 41 fd ff ff       	call   80103ba0 <sched>
80103e5f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e65:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
80103e6c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e6f:	5b                   	pop    %ebx
80103e70:	5e                   	pop    %esi
80103e71:	5d                   	pop    %ebp
80103e72:	c3                   	ret    
80103e73:	83 ec 0c             	sub    $0xc,%esp
80103e76:	68 37 75 10 80       	push   $0x80107537
80103e7b:	e8 f0 c4 ff ff       	call   80100370 <panic>
80103e80:	83 ec 0c             	sub    $0xc,%esp
80103e83:	68 31 75 10 80       	push   $0x80107531
80103e88:	e8 e3 c4 ff ff       	call   80100370 <panic>
80103e8d:	8d 76 00             	lea    0x0(%esi),%esi

80103e90 <wait>:
80103e90:	55                   	push   %ebp
80103e91:	89 e5                	mov    %esp,%ebp
80103e93:	56                   	push   %esi
80103e94:	53                   	push   %ebx
80103e95:	83 ec 0c             	sub    $0xc,%esp
80103e98:	68 a0 2d 11 80       	push   $0x80112da0
80103e9d:	e8 ae 03 00 00       	call   80104250 <acquire>
80103ea2:	83 c4 10             	add    $0x10,%esp
80103ea5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103eab:	31 d2                	xor    %edx,%edx
80103ead:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103eb2:	eb 0f                	jmp    80103ec3 <wait+0x33>
80103eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103eb8:	83 c3 7c             	add    $0x7c,%ebx
80103ebb:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103ec1:	74 1d                	je     80103ee0 <wait+0x50>
80103ec3:	3b 43 14             	cmp    0x14(%ebx),%eax
80103ec6:	75 f0                	jne    80103eb8 <wait+0x28>
80103ec8:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103ecc:	74 30                	je     80103efe <wait+0x6e>
80103ece:	83 c3 7c             	add    $0x7c,%ebx
80103ed1:	ba 01 00 00 00       	mov    $0x1,%edx
80103ed6:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103edc:	75 e5                	jne    80103ec3 <wait+0x33>
80103ede:	66 90                	xchg   %ax,%ax
80103ee0:	85 d2                	test   %edx,%edx
80103ee2:	74 70                	je     80103f54 <wait+0xc4>
80103ee4:	8b 50 24             	mov    0x24(%eax),%edx
80103ee7:	85 d2                	test   %edx,%edx
80103ee9:	75 69                	jne    80103f54 <wait+0xc4>
80103eeb:	83 ec 08             	sub    $0x8,%esp
80103eee:	68 a0 2d 11 80       	push   $0x80112da0
80103ef3:	50                   	push   %eax
80103ef4:	e8 d7 fe ff ff       	call   80103dd0 <sleep>
80103ef9:	83 c4 10             	add    $0x10,%esp
80103efc:	eb a7                	jmp    80103ea5 <wait+0x15>
80103efe:	83 ec 0c             	sub    $0xc,%esp
80103f01:	ff 73 08             	pushl  0x8(%ebx)
80103f04:	8b 73 10             	mov    0x10(%ebx),%esi
80103f07:	e8 b4 e3 ff ff       	call   801022c0 <kfree>
80103f0c:	59                   	pop    %ecx
80103f0d:	ff 73 04             	pushl  0x4(%ebx)
80103f10:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103f17:	e8 c4 2d 00 00       	call   80106ce0 <freevm>
80103f1c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80103f23:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80103f2a:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80103f2e:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
80103f35:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103f3c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103f43:	e8 e8 04 00 00       	call   80104430 <release>
80103f48:	83 c4 10             	add    $0x10,%esp
80103f4b:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f4e:	89 f0                	mov    %esi,%eax
80103f50:	5b                   	pop    %ebx
80103f51:	5e                   	pop    %esi
80103f52:	5d                   	pop    %ebp
80103f53:	c3                   	ret    
80103f54:	83 ec 0c             	sub    $0xc,%esp
80103f57:	68 a0 2d 11 80       	push   $0x80112da0
80103f5c:	e8 cf 04 00 00       	call   80104430 <release>
80103f61:	83 c4 10             	add    $0x10,%esp
80103f64:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f67:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f6c:	5b                   	pop    %ebx
80103f6d:	5e                   	pop    %esi
80103f6e:	5d                   	pop    %ebp
80103f6f:	c3                   	ret    

80103f70 <wakeup>:
80103f70:	55                   	push   %ebp
80103f71:	89 e5                	mov    %esp,%ebp
80103f73:	53                   	push   %ebx
80103f74:	83 ec 10             	sub    $0x10,%esp
80103f77:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103f7a:	68 a0 2d 11 80       	push   $0x80112da0
80103f7f:	e8 cc 02 00 00       	call   80104250 <acquire>
80103f84:	83 c4 10             	add    $0x10,%esp
80103f87:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103f8c:	eb 0c                	jmp    80103f9a <wakeup+0x2a>
80103f8e:	66 90                	xchg   %ax,%ax
80103f90:	83 c0 7c             	add    $0x7c,%eax
80103f93:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103f98:	74 1c                	je     80103fb6 <wakeup+0x46>
80103f9a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f9e:	75 f0                	jne    80103f90 <wakeup+0x20>
80103fa0:	3b 58 20             	cmp    0x20(%eax),%ebx
80103fa3:	75 eb                	jne    80103f90 <wakeup+0x20>
80103fa5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103fac:	83 c0 7c             	add    $0x7c,%eax
80103faf:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103fb4:	75 e4                	jne    80103f9a <wakeup+0x2a>
80103fb6:	c7 45 08 a0 2d 11 80 	movl   $0x80112da0,0x8(%ebp)
80103fbd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fc0:	c9                   	leave  
80103fc1:	e9 6a 04 00 00       	jmp    80104430 <release>
80103fc6:	8d 76 00             	lea    0x0(%esi),%esi
80103fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fd0 <kill>:
80103fd0:	55                   	push   %ebp
80103fd1:	89 e5                	mov    %esp,%ebp
80103fd3:	53                   	push   %ebx
80103fd4:	83 ec 10             	sub    $0x10,%esp
80103fd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103fda:	68 a0 2d 11 80       	push   $0x80112da0
80103fdf:	e8 6c 02 00 00       	call   80104250 <acquire>
80103fe4:	83 c4 10             	add    $0x10,%esp
80103fe7:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103fec:	eb 0c                	jmp    80103ffa <kill+0x2a>
80103fee:	66 90                	xchg   %ax,%ax
80103ff0:	83 c0 7c             	add    $0x7c,%eax
80103ff3:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103ff8:	74 3e                	je     80104038 <kill+0x68>
80103ffa:	39 58 10             	cmp    %ebx,0x10(%eax)
80103ffd:	75 f1                	jne    80103ff0 <kill+0x20>
80103fff:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104003:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010400a:	74 1c                	je     80104028 <kill+0x58>
8010400c:	83 ec 0c             	sub    $0xc,%esp
8010400f:	68 a0 2d 11 80       	push   $0x80112da0
80104014:	e8 17 04 00 00       	call   80104430 <release>
80104019:	83 c4 10             	add    $0x10,%esp
8010401c:	31 c0                	xor    %eax,%eax
8010401e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104021:	c9                   	leave  
80104022:	c3                   	ret    
80104023:	90                   	nop
80104024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104028:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010402f:	eb db                	jmp    8010400c <kill+0x3c>
80104031:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104038:	83 ec 0c             	sub    $0xc,%esp
8010403b:	68 a0 2d 11 80       	push   $0x80112da0
80104040:	e8 eb 03 00 00       	call   80104430 <release>
80104045:	83 c4 10             	add    $0x10,%esp
80104048:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010404d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104050:	c9                   	leave  
80104051:	c3                   	ret    
80104052:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104060 <procdump>:
80104060:	55                   	push   %ebp
80104061:	89 e5                	mov    %esp,%ebp
80104063:	57                   	push   %edi
80104064:	56                   	push   %esi
80104065:	53                   	push   %ebx
80104066:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104069:	bb 40 2e 11 80       	mov    $0x80112e40,%ebx
8010406e:	83 ec 3c             	sub    $0x3c,%esp
80104071:	eb 24                	jmp    80104097 <procdump+0x37>
80104073:	90                   	nop
80104074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104078:	83 ec 0c             	sub    $0xc,%esp
8010407b:	68 86 74 10 80       	push   $0x80107486
80104080:	e8 db c5 ff ff       	call   80100660 <cprintf>
80104085:	83 c4 10             	add    $0x10,%esp
80104088:	83 c3 7c             	add    $0x7c,%ebx
8010408b:	81 fb 40 4d 11 80    	cmp    $0x80114d40,%ebx
80104091:	0f 84 81 00 00 00    	je     80104118 <procdump+0xb8>
80104097:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010409a:	85 c0                	test   %eax,%eax
8010409c:	74 ea                	je     80104088 <procdump+0x28>
8010409e:	83 f8 05             	cmp    $0x5,%eax
801040a1:	ba 48 75 10 80       	mov    $0x80107548,%edx
801040a6:	77 11                	ja     801040b9 <procdump+0x59>
801040a8:	8b 14 85 80 75 10 80 	mov    -0x7fef8a80(,%eax,4),%edx
801040af:	b8 48 75 10 80       	mov    $0x80107548,%eax
801040b4:	85 d2                	test   %edx,%edx
801040b6:	0f 44 d0             	cmove  %eax,%edx
801040b9:	53                   	push   %ebx
801040ba:	52                   	push   %edx
801040bb:	ff 73 a4             	pushl  -0x5c(%ebx)
801040be:	68 4c 75 10 80       	push   $0x8010754c
801040c3:	e8 98 c5 ff ff       	call   80100660 <cprintf>
801040c8:	83 c4 10             	add    $0x10,%esp
801040cb:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
801040cf:	75 a7                	jne    80104078 <procdump+0x18>
801040d1:	8d 45 c0             	lea    -0x40(%ebp),%eax
801040d4:	83 ec 08             	sub    $0x8,%esp
801040d7:	8d 7d c0             	lea    -0x40(%ebp),%edi
801040da:	50                   	push   %eax
801040db:	8b 43 b0             	mov    -0x50(%ebx),%eax
801040de:	8b 40 0c             	mov    0xc(%eax),%eax
801040e1:	83 c0 08             	add    $0x8,%eax
801040e4:	50                   	push   %eax
801040e5:	e8 36 02 00 00       	call   80104320 <getcallerpcs>
801040ea:	83 c4 10             	add    $0x10,%esp
801040ed:	8d 76 00             	lea    0x0(%esi),%esi
801040f0:	8b 17                	mov    (%edi),%edx
801040f2:	85 d2                	test   %edx,%edx
801040f4:	74 82                	je     80104078 <procdump+0x18>
801040f6:	83 ec 08             	sub    $0x8,%esp
801040f9:	83 c7 04             	add    $0x4,%edi
801040fc:	52                   	push   %edx
801040fd:	68 a9 6f 10 80       	push   $0x80106fa9
80104102:	e8 59 c5 ff ff       	call   80100660 <cprintf>
80104107:	83 c4 10             	add    $0x10,%esp
8010410a:	39 f7                	cmp    %esi,%edi
8010410c:	75 e2                	jne    801040f0 <procdump+0x90>
8010410e:	e9 65 ff ff ff       	jmp    80104078 <procdump+0x18>
80104113:	90                   	nop
80104114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104118:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010411b:	5b                   	pop    %ebx
8010411c:	5e                   	pop    %esi
8010411d:	5f                   	pop    %edi
8010411e:	5d                   	pop    %ebp
8010411f:	c3                   	ret    

80104120 <initsleeplock>:
80104120:	55                   	push   %ebp
80104121:	89 e5                	mov    %esp,%ebp
80104123:	53                   	push   %ebx
80104124:	83 ec 0c             	sub    $0xc,%esp
80104127:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010412a:	68 98 75 10 80       	push   $0x80107598
8010412f:	8d 43 04             	lea    0x4(%ebx),%eax
80104132:	50                   	push   %eax
80104133:	e8 f8 00 00 00       	call   80104230 <initlock>
80104138:	8b 45 0c             	mov    0xc(%ebp),%eax
8010413b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104141:	83 c4 10             	add    $0x10,%esp
80104144:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010414b:	89 43 38             	mov    %eax,0x38(%ebx)
8010414e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104151:	c9                   	leave  
80104152:	c3                   	ret    
80104153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104160 <acquiresleep>:
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	56                   	push   %esi
80104164:	53                   	push   %ebx
80104165:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104168:	83 ec 0c             	sub    $0xc,%esp
8010416b:	8d 73 04             	lea    0x4(%ebx),%esi
8010416e:	56                   	push   %esi
8010416f:	e8 dc 00 00 00       	call   80104250 <acquire>
80104174:	8b 13                	mov    (%ebx),%edx
80104176:	83 c4 10             	add    $0x10,%esp
80104179:	85 d2                	test   %edx,%edx
8010417b:	74 16                	je     80104193 <acquiresleep+0x33>
8010417d:	8d 76 00             	lea    0x0(%esi),%esi
80104180:	83 ec 08             	sub    $0x8,%esp
80104183:	56                   	push   %esi
80104184:	53                   	push   %ebx
80104185:	e8 46 fc ff ff       	call   80103dd0 <sleep>
8010418a:	8b 03                	mov    (%ebx),%eax
8010418c:	83 c4 10             	add    $0x10,%esp
8010418f:	85 c0                	test   %eax,%eax
80104191:	75 ed                	jne    80104180 <acquiresleep+0x20>
80104193:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104199:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010419f:	8b 40 10             	mov    0x10(%eax),%eax
801041a2:	89 43 3c             	mov    %eax,0x3c(%ebx)
801041a5:	89 75 08             	mov    %esi,0x8(%ebp)
801041a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041ab:	5b                   	pop    %ebx
801041ac:	5e                   	pop    %esi
801041ad:	5d                   	pop    %ebp
801041ae:	e9 7d 02 00 00       	jmp    80104430 <release>
801041b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801041b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041c0 <releasesleep>:
801041c0:	55                   	push   %ebp
801041c1:	89 e5                	mov    %esp,%ebp
801041c3:	56                   	push   %esi
801041c4:	53                   	push   %ebx
801041c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801041c8:	83 ec 0c             	sub    $0xc,%esp
801041cb:	8d 73 04             	lea    0x4(%ebx),%esi
801041ce:	56                   	push   %esi
801041cf:	e8 7c 00 00 00       	call   80104250 <acquire>
801041d4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801041da:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801041e1:	89 1c 24             	mov    %ebx,(%esp)
801041e4:	e8 87 fd ff ff       	call   80103f70 <wakeup>
801041e9:	89 75 08             	mov    %esi,0x8(%ebp)
801041ec:	83 c4 10             	add    $0x10,%esp
801041ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041f2:	5b                   	pop    %ebx
801041f3:	5e                   	pop    %esi
801041f4:	5d                   	pop    %ebp
801041f5:	e9 36 02 00 00       	jmp    80104430 <release>
801041fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104200 <holdingsleep>:
80104200:	55                   	push   %ebp
80104201:	89 e5                	mov    %esp,%ebp
80104203:	56                   	push   %esi
80104204:	53                   	push   %ebx
80104205:	8b 75 08             	mov    0x8(%ebp),%esi
80104208:	83 ec 0c             	sub    $0xc,%esp
8010420b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010420e:	53                   	push   %ebx
8010420f:	e8 3c 00 00 00       	call   80104250 <acquire>
80104214:	8b 36                	mov    (%esi),%esi
80104216:	89 1c 24             	mov    %ebx,(%esp)
80104219:	e8 12 02 00 00       	call   80104430 <release>
8010421e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104221:	89 f0                	mov    %esi,%eax
80104223:	5b                   	pop    %ebx
80104224:	5e                   	pop    %esi
80104225:	5d                   	pop    %ebp
80104226:	c3                   	ret    
80104227:	66 90                	xchg   %ax,%ax
80104229:	66 90                	xchg   %ax,%ax
8010422b:	66 90                	xchg   %ax,%ax
8010422d:	66 90                	xchg   %ax,%ax
8010422f:	90                   	nop

80104230 <initlock>:
80104230:	55                   	push   %ebp
80104231:	89 e5                	mov    %esp,%ebp
80104233:	8b 45 08             	mov    0x8(%ebp),%eax
80104236:	8b 55 0c             	mov    0xc(%ebp),%edx
80104239:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010423f:	89 50 04             	mov    %edx,0x4(%eax)
80104242:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104249:	5d                   	pop    %ebp
8010424a:	c3                   	ret    
8010424b:	90                   	nop
8010424c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104250 <acquire>:
80104250:	55                   	push   %ebp
80104251:	89 e5                	mov    %esp,%ebp
80104253:	53                   	push   %ebx
80104254:	83 ec 04             	sub    $0x4,%esp
80104257:	9c                   	pushf  
80104258:	5a                   	pop    %edx
80104259:	fa                   	cli    
8010425a:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
80104261:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
80104267:	85 c0                	test   %eax,%eax
80104269:	75 0c                	jne    80104277 <acquire+0x27>
8010426b:	81 e2 00 02 00 00    	and    $0x200,%edx
80104271:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
80104277:	8b 55 08             	mov    0x8(%ebp),%edx
8010427a:	83 c0 01             	add    $0x1,%eax
8010427d:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)
80104283:	8b 02                	mov    (%edx),%eax
80104285:	85 c0                	test   %eax,%eax
80104287:	74 05                	je     8010428e <acquire+0x3e>
80104289:	39 4a 08             	cmp    %ecx,0x8(%edx)
8010428c:	74 7a                	je     80104308 <acquire+0xb8>
8010428e:	b9 01 00 00 00       	mov    $0x1,%ecx
80104293:	90                   	nop
80104294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104298:	89 c8                	mov    %ecx,%eax
8010429a:	f0 87 02             	lock xchg %eax,(%edx)
8010429d:	85 c0                	test   %eax,%eax
8010429f:	75 f7                	jne    80104298 <acquire+0x48>
801042a1:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801042a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
801042a9:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801042af:	89 ea                	mov    %ebp,%edx
801042b1:	89 41 08             	mov    %eax,0x8(%ecx)
801042b4:	83 c1 0c             	add    $0xc,%ecx
801042b7:	31 c0                	xor    %eax,%eax
801042b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042c0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801042c6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801042cc:	77 1a                	ja     801042e8 <acquire+0x98>
801042ce:	8b 5a 04             	mov    0x4(%edx),%ebx
801042d1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
801042d4:	83 c0 01             	add    $0x1,%eax
801042d7:	8b 12                	mov    (%edx),%edx
801042d9:	83 f8 0a             	cmp    $0xa,%eax
801042dc:	75 e2                	jne    801042c0 <acquire+0x70>
801042de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042e1:	c9                   	leave  
801042e2:	c3                   	ret    
801042e3:	90                   	nop
801042e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801042e8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801042ef:	83 c0 01             	add    $0x1,%eax
801042f2:	83 f8 0a             	cmp    $0xa,%eax
801042f5:	74 e7                	je     801042de <acquire+0x8e>
801042f7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801042fe:	83 c0 01             	add    $0x1,%eax
80104301:	83 f8 0a             	cmp    $0xa,%eax
80104304:	75 e2                	jne    801042e8 <acquire+0x98>
80104306:	eb d6                	jmp    801042de <acquire+0x8e>
80104308:	83 ec 0c             	sub    $0xc,%esp
8010430b:	68 a3 75 10 80       	push   $0x801075a3
80104310:	e8 5b c0 ff ff       	call   80100370 <panic>
80104315:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104320 <getcallerpcs>:
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	53                   	push   %ebx
80104324:	8b 45 08             	mov    0x8(%ebp),%eax
80104327:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010432a:	8d 50 f8             	lea    -0x8(%eax),%edx
8010432d:	31 c0                	xor    %eax,%eax
8010432f:	90                   	nop
80104330:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104336:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010433c:	77 1a                	ja     80104358 <getcallerpcs+0x38>
8010433e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104341:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80104344:	83 c0 01             	add    $0x1,%eax
80104347:	8b 12                	mov    (%edx),%edx
80104349:	83 f8 0a             	cmp    $0xa,%eax
8010434c:	75 e2                	jne    80104330 <getcallerpcs+0x10>
8010434e:	5b                   	pop    %ebx
8010434f:	5d                   	pop    %ebp
80104350:	c3                   	ret    
80104351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104358:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010435f:	83 c0 01             	add    $0x1,%eax
80104362:	83 f8 0a             	cmp    $0xa,%eax
80104365:	74 e7                	je     8010434e <getcallerpcs+0x2e>
80104367:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010436e:	83 c0 01             	add    $0x1,%eax
80104371:	83 f8 0a             	cmp    $0xa,%eax
80104374:	75 e2                	jne    80104358 <getcallerpcs+0x38>
80104376:	eb d6                	jmp    8010434e <getcallerpcs+0x2e>
80104378:	90                   	nop
80104379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104380 <holding>:
80104380:	55                   	push   %ebp
80104381:	89 e5                	mov    %esp,%ebp
80104383:	8b 55 08             	mov    0x8(%ebp),%edx
80104386:	8b 02                	mov    (%edx),%eax
80104388:	85 c0                	test   %eax,%eax
8010438a:	74 14                	je     801043a0 <holding+0x20>
8010438c:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104392:	39 42 08             	cmp    %eax,0x8(%edx)
80104395:	5d                   	pop    %ebp
80104396:	0f 94 c0             	sete   %al
80104399:	0f b6 c0             	movzbl %al,%eax
8010439c:	c3                   	ret    
8010439d:	8d 76 00             	lea    0x0(%esi),%esi
801043a0:	31 c0                	xor    %eax,%eax
801043a2:	5d                   	pop    %ebp
801043a3:	c3                   	ret    
801043a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801043b0 <pushcli>:
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	9c                   	pushf  
801043b4:	59                   	pop    %ecx
801043b5:	fa                   	cli    
801043b6:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801043bd:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
801043c3:	85 c0                	test   %eax,%eax
801043c5:	75 0c                	jne    801043d3 <pushcli+0x23>
801043c7:	81 e1 00 02 00 00    	and    $0x200,%ecx
801043cd:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
801043d3:	83 c0 01             	add    $0x1,%eax
801043d6:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
801043dc:	5d                   	pop    %ebp
801043dd:	c3                   	ret    
801043de:	66 90                	xchg   %ax,%ax

801043e0 <popcli>:
801043e0:	55                   	push   %ebp
801043e1:	89 e5                	mov    %esp,%ebp
801043e3:	83 ec 08             	sub    $0x8,%esp
801043e6:	9c                   	pushf  
801043e7:	58                   	pop    %eax
801043e8:	f6 c4 02             	test   $0x2,%ah
801043eb:	75 2c                	jne    80104419 <popcli+0x39>
801043ed:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801043f4:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
801043fb:	78 0f                	js     8010440c <popcli+0x2c>
801043fd:	75 0b                	jne    8010440a <popcli+0x2a>
801043ff:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
80104405:	85 c0                	test   %eax,%eax
80104407:	74 01                	je     8010440a <popcli+0x2a>
80104409:	fb                   	sti    
8010440a:	c9                   	leave  
8010440b:	c3                   	ret    
8010440c:	83 ec 0c             	sub    $0xc,%esp
8010440f:	68 c2 75 10 80       	push   $0x801075c2
80104414:	e8 57 bf ff ff       	call   80100370 <panic>
80104419:	83 ec 0c             	sub    $0xc,%esp
8010441c:	68 ab 75 10 80       	push   $0x801075ab
80104421:	e8 4a bf ff ff       	call   80100370 <panic>
80104426:	8d 76 00             	lea    0x0(%esi),%esi
80104429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104430 <release>:
80104430:	55                   	push   %ebp
80104431:	89 e5                	mov    %esp,%ebp
80104433:	83 ec 08             	sub    $0x8,%esp
80104436:	8b 45 08             	mov    0x8(%ebp),%eax
80104439:	8b 10                	mov    (%eax),%edx
8010443b:	85 d2                	test   %edx,%edx
8010443d:	74 0c                	je     8010444b <release+0x1b>
8010443f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104446:	39 50 08             	cmp    %edx,0x8(%eax)
80104449:	74 15                	je     80104460 <release+0x30>
8010444b:	83 ec 0c             	sub    $0xc,%esp
8010444e:	68 c9 75 10 80       	push   $0x801075c9
80104453:	e8 18 bf ff ff       	call   80100370 <panic>
80104458:	90                   	nop
80104459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104460:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
80104467:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
8010446e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104473:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104479:	c9                   	leave  
8010447a:	e9 61 ff ff ff       	jmp    801043e0 <popcli>
8010447f:	90                   	nop

80104480 <memset>:
80104480:	55                   	push   %ebp
80104481:	89 e5                	mov    %esp,%ebp
80104483:	57                   	push   %edi
80104484:	53                   	push   %ebx
80104485:	8b 55 08             	mov    0x8(%ebp),%edx
80104488:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010448b:	f6 c2 03             	test   $0x3,%dl
8010448e:	75 05                	jne    80104495 <memset+0x15>
80104490:	f6 c1 03             	test   $0x3,%cl
80104493:	74 13                	je     801044a8 <memset+0x28>
80104495:	89 d7                	mov    %edx,%edi
80104497:	8b 45 0c             	mov    0xc(%ebp),%eax
8010449a:	fc                   	cld    
8010449b:	f3 aa                	rep stos %al,%es:(%edi)
8010449d:	5b                   	pop    %ebx
8010449e:	89 d0                	mov    %edx,%eax
801044a0:	5f                   	pop    %edi
801044a1:	5d                   	pop    %ebp
801044a2:	c3                   	ret    
801044a3:	90                   	nop
801044a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044a8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801044ac:	c1 e9 02             	shr    $0x2,%ecx
801044af:	89 fb                	mov    %edi,%ebx
801044b1:	89 f8                	mov    %edi,%eax
801044b3:	c1 e3 18             	shl    $0x18,%ebx
801044b6:	c1 e0 10             	shl    $0x10,%eax
801044b9:	09 d8                	or     %ebx,%eax
801044bb:	09 f8                	or     %edi,%eax
801044bd:	c1 e7 08             	shl    $0x8,%edi
801044c0:	09 f8                	or     %edi,%eax
801044c2:	89 d7                	mov    %edx,%edi
801044c4:	fc                   	cld    
801044c5:	f3 ab                	rep stos %eax,%es:(%edi)
801044c7:	5b                   	pop    %ebx
801044c8:	89 d0                	mov    %edx,%eax
801044ca:	5f                   	pop    %edi
801044cb:	5d                   	pop    %ebp
801044cc:	c3                   	ret    
801044cd:	8d 76 00             	lea    0x0(%esi),%esi

801044d0 <memcmp>:
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	57                   	push   %edi
801044d4:	56                   	push   %esi
801044d5:	8b 45 10             	mov    0x10(%ebp),%eax
801044d8:	53                   	push   %ebx
801044d9:	8b 75 0c             	mov    0xc(%ebp),%esi
801044dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801044df:	85 c0                	test   %eax,%eax
801044e1:	74 29                	je     8010450c <memcmp+0x3c>
801044e3:	0f b6 13             	movzbl (%ebx),%edx
801044e6:	0f b6 0e             	movzbl (%esi),%ecx
801044e9:	38 d1                	cmp    %dl,%cl
801044eb:	75 2b                	jne    80104518 <memcmp+0x48>
801044ed:	8d 78 ff             	lea    -0x1(%eax),%edi
801044f0:	31 c0                	xor    %eax,%eax
801044f2:	eb 14                	jmp    80104508 <memcmp+0x38>
801044f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044f8:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
801044fd:	83 c0 01             	add    $0x1,%eax
80104500:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104504:	38 ca                	cmp    %cl,%dl
80104506:	75 10                	jne    80104518 <memcmp+0x48>
80104508:	39 f8                	cmp    %edi,%eax
8010450a:	75 ec                	jne    801044f8 <memcmp+0x28>
8010450c:	5b                   	pop    %ebx
8010450d:	31 c0                	xor    %eax,%eax
8010450f:	5e                   	pop    %esi
80104510:	5f                   	pop    %edi
80104511:	5d                   	pop    %ebp
80104512:	c3                   	ret    
80104513:	90                   	nop
80104514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104518:	0f b6 c2             	movzbl %dl,%eax
8010451b:	5b                   	pop    %ebx
8010451c:	29 c8                	sub    %ecx,%eax
8010451e:	5e                   	pop    %esi
8010451f:	5f                   	pop    %edi
80104520:	5d                   	pop    %ebp
80104521:	c3                   	ret    
80104522:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104530 <memmove>:
80104530:	55                   	push   %ebp
80104531:	89 e5                	mov    %esp,%ebp
80104533:	56                   	push   %esi
80104534:	53                   	push   %ebx
80104535:	8b 45 08             	mov    0x8(%ebp),%eax
80104538:	8b 75 0c             	mov    0xc(%ebp),%esi
8010453b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010453e:	39 c6                	cmp    %eax,%esi
80104540:	73 2e                	jae    80104570 <memmove+0x40>
80104542:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104545:	39 c8                	cmp    %ecx,%eax
80104547:	73 27                	jae    80104570 <memmove+0x40>
80104549:	85 db                	test   %ebx,%ebx
8010454b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010454e:	74 17                	je     80104567 <memmove+0x37>
80104550:	29 d9                	sub    %ebx,%ecx
80104552:	89 cb                	mov    %ecx,%ebx
80104554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104558:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010455c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010455f:	83 ea 01             	sub    $0x1,%edx
80104562:	83 fa ff             	cmp    $0xffffffff,%edx
80104565:	75 f1                	jne    80104558 <memmove+0x28>
80104567:	5b                   	pop    %ebx
80104568:	5e                   	pop    %esi
80104569:	5d                   	pop    %ebp
8010456a:	c3                   	ret    
8010456b:	90                   	nop
8010456c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104570:	31 d2                	xor    %edx,%edx
80104572:	85 db                	test   %ebx,%ebx
80104574:	74 f1                	je     80104567 <memmove+0x37>
80104576:	8d 76 00             	lea    0x0(%esi),%esi
80104579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104580:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104584:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104587:	83 c2 01             	add    $0x1,%edx
8010458a:	39 d3                	cmp    %edx,%ebx
8010458c:	75 f2                	jne    80104580 <memmove+0x50>
8010458e:	5b                   	pop    %ebx
8010458f:	5e                   	pop    %esi
80104590:	5d                   	pop    %ebp
80104591:	c3                   	ret    
80104592:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045a0 <memcpy>:
801045a0:	55                   	push   %ebp
801045a1:	89 e5                	mov    %esp,%ebp
801045a3:	5d                   	pop    %ebp
801045a4:	eb 8a                	jmp    80104530 <memmove>
801045a6:	8d 76 00             	lea    0x0(%esi),%esi
801045a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045b0 <strncmp>:
801045b0:	55                   	push   %ebp
801045b1:	89 e5                	mov    %esp,%ebp
801045b3:	57                   	push   %edi
801045b4:	56                   	push   %esi
801045b5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801045b8:	53                   	push   %ebx
801045b9:	8b 7d 08             	mov    0x8(%ebp),%edi
801045bc:	8b 75 0c             	mov    0xc(%ebp),%esi
801045bf:	85 c9                	test   %ecx,%ecx
801045c1:	74 37                	je     801045fa <strncmp+0x4a>
801045c3:	0f b6 17             	movzbl (%edi),%edx
801045c6:	0f b6 1e             	movzbl (%esi),%ebx
801045c9:	84 d2                	test   %dl,%dl
801045cb:	74 3f                	je     8010460c <strncmp+0x5c>
801045cd:	38 d3                	cmp    %dl,%bl
801045cf:	75 3b                	jne    8010460c <strncmp+0x5c>
801045d1:	8d 47 01             	lea    0x1(%edi),%eax
801045d4:	01 cf                	add    %ecx,%edi
801045d6:	eb 1b                	jmp    801045f3 <strncmp+0x43>
801045d8:	90                   	nop
801045d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045e0:	0f b6 10             	movzbl (%eax),%edx
801045e3:	84 d2                	test   %dl,%dl
801045e5:	74 21                	je     80104608 <strncmp+0x58>
801045e7:	0f b6 19             	movzbl (%ecx),%ebx
801045ea:	83 c0 01             	add    $0x1,%eax
801045ed:	89 ce                	mov    %ecx,%esi
801045ef:	38 da                	cmp    %bl,%dl
801045f1:	75 19                	jne    8010460c <strncmp+0x5c>
801045f3:	39 c7                	cmp    %eax,%edi
801045f5:	8d 4e 01             	lea    0x1(%esi),%ecx
801045f8:	75 e6                	jne    801045e0 <strncmp+0x30>
801045fa:	5b                   	pop    %ebx
801045fb:	31 c0                	xor    %eax,%eax
801045fd:	5e                   	pop    %esi
801045fe:	5f                   	pop    %edi
801045ff:	5d                   	pop    %ebp
80104600:	c3                   	ret    
80104601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104608:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
8010460c:	0f b6 c2             	movzbl %dl,%eax
8010460f:	29 d8                	sub    %ebx,%eax
80104611:	5b                   	pop    %ebx
80104612:	5e                   	pop    %esi
80104613:	5f                   	pop    %edi
80104614:	5d                   	pop    %ebp
80104615:	c3                   	ret    
80104616:	8d 76 00             	lea    0x0(%esi),%esi
80104619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104620 <strncpy>:
80104620:	55                   	push   %ebp
80104621:	89 e5                	mov    %esp,%ebp
80104623:	56                   	push   %esi
80104624:	53                   	push   %ebx
80104625:	8b 45 08             	mov    0x8(%ebp),%eax
80104628:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010462b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010462e:	89 c2                	mov    %eax,%edx
80104630:	eb 19                	jmp    8010464b <strncpy+0x2b>
80104632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104638:	83 c3 01             	add    $0x1,%ebx
8010463b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010463f:	83 c2 01             	add    $0x1,%edx
80104642:	84 c9                	test   %cl,%cl
80104644:	88 4a ff             	mov    %cl,-0x1(%edx)
80104647:	74 09                	je     80104652 <strncpy+0x32>
80104649:	89 f1                	mov    %esi,%ecx
8010464b:	85 c9                	test   %ecx,%ecx
8010464d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104650:	7f e6                	jg     80104638 <strncpy+0x18>
80104652:	31 c9                	xor    %ecx,%ecx
80104654:	85 f6                	test   %esi,%esi
80104656:	7e 17                	jle    8010466f <strncpy+0x4f>
80104658:	90                   	nop
80104659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104660:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104664:	89 f3                	mov    %esi,%ebx
80104666:	83 c1 01             	add    $0x1,%ecx
80104669:	29 cb                	sub    %ecx,%ebx
8010466b:	85 db                	test   %ebx,%ebx
8010466d:	7f f1                	jg     80104660 <strncpy+0x40>
8010466f:	5b                   	pop    %ebx
80104670:	5e                   	pop    %esi
80104671:	5d                   	pop    %ebp
80104672:	c3                   	ret    
80104673:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104680 <safestrcpy>:
80104680:	55                   	push   %ebp
80104681:	89 e5                	mov    %esp,%ebp
80104683:	56                   	push   %esi
80104684:	53                   	push   %ebx
80104685:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104688:	8b 45 08             	mov    0x8(%ebp),%eax
8010468b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010468e:	85 c9                	test   %ecx,%ecx
80104690:	7e 26                	jle    801046b8 <safestrcpy+0x38>
80104692:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104696:	89 c1                	mov    %eax,%ecx
80104698:	eb 17                	jmp    801046b1 <safestrcpy+0x31>
8010469a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046a0:	83 c2 01             	add    $0x1,%edx
801046a3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801046a7:	83 c1 01             	add    $0x1,%ecx
801046aa:	84 db                	test   %bl,%bl
801046ac:	88 59 ff             	mov    %bl,-0x1(%ecx)
801046af:	74 04                	je     801046b5 <safestrcpy+0x35>
801046b1:	39 f2                	cmp    %esi,%edx
801046b3:	75 eb                	jne    801046a0 <safestrcpy+0x20>
801046b5:	c6 01 00             	movb   $0x0,(%ecx)
801046b8:	5b                   	pop    %ebx
801046b9:	5e                   	pop    %esi
801046ba:	5d                   	pop    %ebp
801046bb:	c3                   	ret    
801046bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046c0 <strlen>:
801046c0:	55                   	push   %ebp
801046c1:	31 c0                	xor    %eax,%eax
801046c3:	89 e5                	mov    %esp,%ebp
801046c5:	8b 55 08             	mov    0x8(%ebp),%edx
801046c8:	80 3a 00             	cmpb   $0x0,(%edx)
801046cb:	74 0c                	je     801046d9 <strlen+0x19>
801046cd:	8d 76 00             	lea    0x0(%esi),%esi
801046d0:	83 c0 01             	add    $0x1,%eax
801046d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801046d7:	75 f7                	jne    801046d0 <strlen+0x10>
801046d9:	5d                   	pop    %ebp
801046da:	c3                   	ret    

801046db <swtch>:
801046db:	8b 44 24 04          	mov    0x4(%esp),%eax
801046df:	8b 54 24 08          	mov    0x8(%esp),%edx
801046e3:	55                   	push   %ebp
801046e4:	53                   	push   %ebx
801046e5:	56                   	push   %esi
801046e6:	57                   	push   %edi
801046e7:	89 20                	mov    %esp,(%eax)
801046e9:	89 d4                	mov    %edx,%esp
801046eb:	5f                   	pop    %edi
801046ec:	5e                   	pop    %esi
801046ed:	5b                   	pop    %ebx
801046ee:	5d                   	pop    %ebp
801046ef:	c3                   	ret    

801046f0 <fetchint>:
801046f0:	55                   	push   %ebp
801046f1:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801046f8:	89 e5                	mov    %esp,%ebp
801046fa:	8b 45 08             	mov    0x8(%ebp),%eax
801046fd:	8b 12                	mov    (%edx),%edx
801046ff:	39 c2                	cmp    %eax,%edx
80104701:	76 15                	jbe    80104718 <fetchint+0x28>
80104703:	8d 48 04             	lea    0x4(%eax),%ecx
80104706:	39 ca                	cmp    %ecx,%edx
80104708:	72 0e                	jb     80104718 <fetchint+0x28>
8010470a:	8b 10                	mov    (%eax),%edx
8010470c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010470f:	89 10                	mov    %edx,(%eax)
80104711:	31 c0                	xor    %eax,%eax
80104713:	5d                   	pop    %ebp
80104714:	c3                   	ret    
80104715:	8d 76 00             	lea    0x0(%esi),%esi
80104718:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010471d:	5d                   	pop    %ebp
8010471e:	c3                   	ret    
8010471f:	90                   	nop

80104720 <fetchstr>:
80104720:	55                   	push   %ebp
80104721:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104727:	89 e5                	mov    %esp,%ebp
80104729:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010472c:	39 08                	cmp    %ecx,(%eax)
8010472e:	76 2c                	jbe    8010475c <fetchstr+0x3c>
80104730:	8b 55 0c             	mov    0xc(%ebp),%edx
80104733:	89 c8                	mov    %ecx,%eax
80104735:	89 0a                	mov    %ecx,(%edx)
80104737:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010473e:	8b 12                	mov    (%edx),%edx
80104740:	39 d1                	cmp    %edx,%ecx
80104742:	73 18                	jae    8010475c <fetchstr+0x3c>
80104744:	80 39 00             	cmpb   $0x0,(%ecx)
80104747:	75 0c                	jne    80104755 <fetchstr+0x35>
80104749:	eb 1d                	jmp    80104768 <fetchstr+0x48>
8010474b:	90                   	nop
8010474c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104750:	80 38 00             	cmpb   $0x0,(%eax)
80104753:	74 13                	je     80104768 <fetchstr+0x48>
80104755:	83 c0 01             	add    $0x1,%eax
80104758:	39 c2                	cmp    %eax,%edx
8010475a:	77 f4                	ja     80104750 <fetchstr+0x30>
8010475c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104761:	5d                   	pop    %ebp
80104762:	c3                   	ret    
80104763:	90                   	nop
80104764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104768:	29 c8                	sub    %ecx,%eax
8010476a:	5d                   	pop    %ebp
8010476b:	c3                   	ret    
8010476c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104770 <argint>:
80104770:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104777:	55                   	push   %ebp
80104778:	89 e5                	mov    %esp,%ebp
8010477a:	8b 42 18             	mov    0x18(%edx),%eax
8010477d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104780:	8b 12                	mov    (%edx),%edx
80104782:	8b 40 44             	mov    0x44(%eax),%eax
80104785:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104788:	8d 48 04             	lea    0x4(%eax),%ecx
8010478b:	39 d1                	cmp    %edx,%ecx
8010478d:	73 19                	jae    801047a8 <argint+0x38>
8010478f:	8d 48 08             	lea    0x8(%eax),%ecx
80104792:	39 ca                	cmp    %ecx,%edx
80104794:	72 12                	jb     801047a8 <argint+0x38>
80104796:	8b 50 04             	mov    0x4(%eax),%edx
80104799:	8b 45 0c             	mov    0xc(%ebp),%eax
8010479c:	89 10                	mov    %edx,(%eax)
8010479e:	31 c0                	xor    %eax,%eax
801047a0:	5d                   	pop    %ebp
801047a1:	c3                   	ret    
801047a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047ad:	5d                   	pop    %ebp
801047ae:	c3                   	ret    
801047af:	90                   	nop

801047b0 <argptr>:
801047b0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801047b6:	55                   	push   %ebp
801047b7:	89 e5                	mov    %esp,%ebp
801047b9:	56                   	push   %esi
801047ba:	53                   	push   %ebx
801047bb:	8b 48 18             	mov    0x18(%eax),%ecx
801047be:	8b 5d 08             	mov    0x8(%ebp),%ebx
801047c1:	8b 55 10             	mov    0x10(%ebp),%edx
801047c4:	8b 49 44             	mov    0x44(%ecx),%ecx
801047c7:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
801047ca:	8b 08                	mov    (%eax),%ecx
801047cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047d1:	8d 73 04             	lea    0x4(%ebx),%esi
801047d4:	39 ce                	cmp    %ecx,%esi
801047d6:	73 1f                	jae    801047f7 <argptr+0x47>
801047d8:	8d 73 08             	lea    0x8(%ebx),%esi
801047db:	39 f1                	cmp    %esi,%ecx
801047dd:	72 18                	jb     801047f7 <argptr+0x47>
801047df:	85 d2                	test   %edx,%edx
801047e1:	8b 5b 04             	mov    0x4(%ebx),%ebx
801047e4:	78 11                	js     801047f7 <argptr+0x47>
801047e6:	39 cb                	cmp    %ecx,%ebx
801047e8:	73 0d                	jae    801047f7 <argptr+0x47>
801047ea:	01 da                	add    %ebx,%edx
801047ec:	39 ca                	cmp    %ecx,%edx
801047ee:	77 07                	ja     801047f7 <argptr+0x47>
801047f0:	8b 45 0c             	mov    0xc(%ebp),%eax
801047f3:	89 18                	mov    %ebx,(%eax)
801047f5:	31 c0                	xor    %eax,%eax
801047f7:	5b                   	pop    %ebx
801047f8:	5e                   	pop    %esi
801047f9:	5d                   	pop    %ebp
801047fa:	c3                   	ret    
801047fb:	90                   	nop
801047fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104800 <argstr>:
80104800:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104806:	55                   	push   %ebp
80104807:	89 e5                	mov    %esp,%ebp
80104809:	8b 50 18             	mov    0x18(%eax),%edx
8010480c:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010480f:	8b 00                	mov    (%eax),%eax
80104811:	8b 52 44             	mov    0x44(%edx),%edx
80104814:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104817:	8d 4a 04             	lea    0x4(%edx),%ecx
8010481a:	39 c1                	cmp    %eax,%ecx
8010481c:	73 07                	jae    80104825 <argstr+0x25>
8010481e:	8d 4a 08             	lea    0x8(%edx),%ecx
80104821:	39 c8                	cmp    %ecx,%eax
80104823:	73 0b                	jae    80104830 <argstr+0x30>
80104825:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010482a:	5d                   	pop    %ebp
8010482b:	c3                   	ret    
8010482c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104830:	8b 4a 04             	mov    0x4(%edx),%ecx
80104833:	39 c1                	cmp    %eax,%ecx
80104835:	73 ee                	jae    80104825 <argstr+0x25>
80104837:	8b 55 0c             	mov    0xc(%ebp),%edx
8010483a:	89 c8                	mov    %ecx,%eax
8010483c:	89 0a                	mov    %ecx,(%edx)
8010483e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104845:	8b 12                	mov    (%edx),%edx
80104847:	39 d1                	cmp    %edx,%ecx
80104849:	73 da                	jae    80104825 <argstr+0x25>
8010484b:	80 39 00             	cmpb   $0x0,(%ecx)
8010484e:	75 0d                	jne    8010485d <argstr+0x5d>
80104850:	eb 1e                	jmp    80104870 <argstr+0x70>
80104852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104858:	80 38 00             	cmpb   $0x0,(%eax)
8010485b:	74 13                	je     80104870 <argstr+0x70>
8010485d:	83 c0 01             	add    $0x1,%eax
80104860:	39 c2                	cmp    %eax,%edx
80104862:	77 f4                	ja     80104858 <argstr+0x58>
80104864:	eb bf                	jmp    80104825 <argstr+0x25>
80104866:	8d 76 00             	lea    0x0(%esi),%esi
80104869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104870:	29 c8                	sub    %ecx,%eax
80104872:	5d                   	pop    %ebp
80104873:	c3                   	ret    
80104874:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010487a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104880 <syscall>:
80104880:	55                   	push   %ebp
80104881:	89 e5                	mov    %esp,%ebp
80104883:	53                   	push   %ebx
80104884:	83 ec 04             	sub    $0x4,%esp
80104887:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010488e:	8b 5a 18             	mov    0x18(%edx),%ebx
80104891:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104894:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104897:	83 f9 14             	cmp    $0x14,%ecx
8010489a:	77 1c                	ja     801048b8 <syscall+0x38>
8010489c:	8b 0c 85 00 76 10 80 	mov    -0x7fef8a00(,%eax,4),%ecx
801048a3:	85 c9                	test   %ecx,%ecx
801048a5:	74 11                	je     801048b8 <syscall+0x38>
801048a7:	ff d1                	call   *%ecx
801048a9:	89 43 1c             	mov    %eax,0x1c(%ebx)
801048ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801048af:	c9                   	leave  
801048b0:	c3                   	ret    
801048b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048b8:	50                   	push   %eax
801048b9:	8d 42 6c             	lea    0x6c(%edx),%eax
801048bc:	50                   	push   %eax
801048bd:	ff 72 10             	pushl  0x10(%edx)
801048c0:	68 d1 75 10 80       	push   $0x801075d1
801048c5:	e8 96 bd ff ff       	call   80100660 <cprintf>
801048ca:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801048d0:	83 c4 10             	add    $0x10,%esp
801048d3:	8b 40 18             	mov    0x18(%eax),%eax
801048d6:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
801048dd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801048e0:	c9                   	leave  
801048e1:	c3                   	ret    
801048e2:	66 90                	xchg   %ax,%ax
801048e4:	66 90                	xchg   %ax,%ax
801048e6:	66 90                	xchg   %ax,%ax
801048e8:	66 90                	xchg   %ax,%ax
801048ea:	66 90                	xchg   %ax,%ax
801048ec:	66 90                	xchg   %ax,%ax
801048ee:	66 90                	xchg   %ax,%ax

801048f0 <create>:
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	57                   	push   %edi
801048f4:	56                   	push   %esi
801048f5:	53                   	push   %ebx
801048f6:	8d 75 da             	lea    -0x26(%ebp),%esi
801048f9:	83 ec 44             	sub    $0x44,%esp
801048fc:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801048ff:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104902:	56                   	push   %esi
80104903:	50                   	push   %eax
80104904:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104907:	89 4d bc             	mov    %ecx,-0x44(%ebp)
8010490a:	e8 91 d5 ff ff       	call   80101ea0 <nameiparent>
8010490f:	83 c4 10             	add    $0x10,%esp
80104912:	85 c0                	test   %eax,%eax
80104914:	0f 84 f6 00 00 00    	je     80104a10 <create+0x120>
8010491a:	83 ec 0c             	sub    $0xc,%esp
8010491d:	89 c7                	mov    %eax,%edi
8010491f:	50                   	push   %eax
80104920:	e8 2b cd ff ff       	call   80101650 <ilock>
80104925:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104928:	83 c4 0c             	add    $0xc,%esp
8010492b:	50                   	push   %eax
8010492c:	56                   	push   %esi
8010492d:	57                   	push   %edi
8010492e:	e8 2d d2 ff ff       	call   80101b60 <dirlookup>
80104933:	83 c4 10             	add    $0x10,%esp
80104936:	85 c0                	test   %eax,%eax
80104938:	89 c3                	mov    %eax,%ebx
8010493a:	74 54                	je     80104990 <create+0xa0>
8010493c:	83 ec 0c             	sub    $0xc,%esp
8010493f:	57                   	push   %edi
80104940:	e8 7b cf ff ff       	call   801018c0 <iunlockput>
80104945:	89 1c 24             	mov    %ebx,(%esp)
80104948:	e8 03 cd ff ff       	call   80101650 <ilock>
8010494d:	83 c4 10             	add    $0x10,%esp
80104950:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104955:	75 19                	jne    80104970 <create+0x80>
80104957:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
8010495c:	89 d8                	mov    %ebx,%eax
8010495e:	75 10                	jne    80104970 <create+0x80>
80104960:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104963:	5b                   	pop    %ebx
80104964:	5e                   	pop    %esi
80104965:	5f                   	pop    %edi
80104966:	5d                   	pop    %ebp
80104967:	c3                   	ret    
80104968:	90                   	nop
80104969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104970:	83 ec 0c             	sub    $0xc,%esp
80104973:	53                   	push   %ebx
80104974:	e8 47 cf ff ff       	call   801018c0 <iunlockput>
80104979:	83 c4 10             	add    $0x10,%esp
8010497c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010497f:	31 c0                	xor    %eax,%eax
80104981:	5b                   	pop    %ebx
80104982:	5e                   	pop    %esi
80104983:	5f                   	pop    %edi
80104984:	5d                   	pop    %ebp
80104985:	c3                   	ret    
80104986:	8d 76 00             	lea    0x0(%esi),%esi
80104989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104990:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104994:	83 ec 08             	sub    $0x8,%esp
80104997:	50                   	push   %eax
80104998:	ff 37                	pushl  (%edi)
8010499a:	e8 41 cb ff ff       	call   801014e0 <ialloc>
8010499f:	83 c4 10             	add    $0x10,%esp
801049a2:	85 c0                	test   %eax,%eax
801049a4:	89 c3                	mov    %eax,%ebx
801049a6:	0f 84 cc 00 00 00    	je     80104a78 <create+0x188>
801049ac:	83 ec 0c             	sub    $0xc,%esp
801049af:	50                   	push   %eax
801049b0:	e8 9b cc ff ff       	call   80101650 <ilock>
801049b5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
801049b9:	66 89 43 52          	mov    %ax,0x52(%ebx)
801049bd:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
801049c1:	66 89 43 54          	mov    %ax,0x54(%ebx)
801049c5:	b8 01 00 00 00       	mov    $0x1,%eax
801049ca:	66 89 43 56          	mov    %ax,0x56(%ebx)
801049ce:	89 1c 24             	mov    %ebx,(%esp)
801049d1:	e8 ca cb ff ff       	call   801015a0 <iupdate>
801049d6:	83 c4 10             	add    $0x10,%esp
801049d9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
801049de:	74 40                	je     80104a20 <create+0x130>
801049e0:	83 ec 04             	sub    $0x4,%esp
801049e3:	ff 73 04             	pushl  0x4(%ebx)
801049e6:	56                   	push   %esi
801049e7:	57                   	push   %edi
801049e8:	e8 d3 d3 ff ff       	call   80101dc0 <dirlink>
801049ed:	83 c4 10             	add    $0x10,%esp
801049f0:	85 c0                	test   %eax,%eax
801049f2:	78 77                	js     80104a6b <create+0x17b>
801049f4:	83 ec 0c             	sub    $0xc,%esp
801049f7:	57                   	push   %edi
801049f8:	e8 c3 ce ff ff       	call   801018c0 <iunlockput>
801049fd:	83 c4 10             	add    $0x10,%esp
80104a00:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a03:	89 d8                	mov    %ebx,%eax
80104a05:	5b                   	pop    %ebx
80104a06:	5e                   	pop    %esi
80104a07:	5f                   	pop    %edi
80104a08:	5d                   	pop    %ebp
80104a09:	c3                   	ret    
80104a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a10:	31 c0                	xor    %eax,%eax
80104a12:	e9 49 ff ff ff       	jmp    80104960 <create+0x70>
80104a17:	89 f6                	mov    %esi,%esi
80104a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104a20:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
80104a25:	83 ec 0c             	sub    $0xc,%esp
80104a28:	57                   	push   %edi
80104a29:	e8 72 cb ff ff       	call   801015a0 <iupdate>
80104a2e:	83 c4 0c             	add    $0xc,%esp
80104a31:	ff 73 04             	pushl  0x4(%ebx)
80104a34:	68 74 76 10 80       	push   $0x80107674
80104a39:	53                   	push   %ebx
80104a3a:	e8 81 d3 ff ff       	call   80101dc0 <dirlink>
80104a3f:	83 c4 10             	add    $0x10,%esp
80104a42:	85 c0                	test   %eax,%eax
80104a44:	78 18                	js     80104a5e <create+0x16e>
80104a46:	83 ec 04             	sub    $0x4,%esp
80104a49:	ff 77 04             	pushl  0x4(%edi)
80104a4c:	68 73 76 10 80       	push   $0x80107673
80104a51:	53                   	push   %ebx
80104a52:	e8 69 d3 ff ff       	call   80101dc0 <dirlink>
80104a57:	83 c4 10             	add    $0x10,%esp
80104a5a:	85 c0                	test   %eax,%eax
80104a5c:	79 82                	jns    801049e0 <create+0xf0>
80104a5e:	83 ec 0c             	sub    $0xc,%esp
80104a61:	68 67 76 10 80       	push   $0x80107667
80104a66:	e8 05 b9 ff ff       	call   80100370 <panic>
80104a6b:	83 ec 0c             	sub    $0xc,%esp
80104a6e:	68 76 76 10 80       	push   $0x80107676
80104a73:	e8 f8 b8 ff ff       	call   80100370 <panic>
80104a78:	83 ec 0c             	sub    $0xc,%esp
80104a7b:	68 58 76 10 80       	push   $0x80107658
80104a80:	e8 eb b8 ff ff       	call   80100370 <panic>
80104a85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a90 <argfd.constprop.0>:
80104a90:	55                   	push   %ebp
80104a91:	89 e5                	mov    %esp,%ebp
80104a93:	56                   	push   %esi
80104a94:	53                   	push   %ebx
80104a95:	89 c6                	mov    %eax,%esi
80104a97:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a9a:	89 d3                	mov    %edx,%ebx
80104a9c:	83 ec 18             	sub    $0x18,%esp
80104a9f:	50                   	push   %eax
80104aa0:	6a 00                	push   $0x0
80104aa2:	e8 c9 fc ff ff       	call   80104770 <argint>
80104aa7:	83 c4 10             	add    $0x10,%esp
80104aaa:	85 c0                	test   %eax,%eax
80104aac:	78 3a                	js     80104ae8 <argfd.constprop.0+0x58>
80104aae:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104ab1:	83 f8 0f             	cmp    $0xf,%eax
80104ab4:	77 32                	ja     80104ae8 <argfd.constprop.0+0x58>
80104ab6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104abd:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104ac1:	85 d2                	test   %edx,%edx
80104ac3:	74 23                	je     80104ae8 <argfd.constprop.0+0x58>
80104ac5:	85 f6                	test   %esi,%esi
80104ac7:	74 02                	je     80104acb <argfd.constprop.0+0x3b>
80104ac9:	89 06                	mov    %eax,(%esi)
80104acb:	85 db                	test   %ebx,%ebx
80104acd:	74 11                	je     80104ae0 <argfd.constprop.0+0x50>
80104acf:	89 13                	mov    %edx,(%ebx)
80104ad1:	31 c0                	xor    %eax,%eax
80104ad3:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ad6:	5b                   	pop    %ebx
80104ad7:	5e                   	pop    %esi
80104ad8:	5d                   	pop    %ebp
80104ad9:	c3                   	ret    
80104ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ae0:	31 c0                	xor    %eax,%eax
80104ae2:	eb ef                	jmp    80104ad3 <argfd.constprop.0+0x43>
80104ae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ae8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104aed:	eb e4                	jmp    80104ad3 <argfd.constprop.0+0x43>
80104aef:	90                   	nop

80104af0 <sys_dup>:
80104af0:	55                   	push   %ebp
80104af1:	31 c0                	xor    %eax,%eax
80104af3:	89 e5                	mov    %esp,%ebp
80104af5:	53                   	push   %ebx
80104af6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104af9:	83 ec 14             	sub    $0x14,%esp
80104afc:	e8 8f ff ff ff       	call   80104a90 <argfd.constprop.0>
80104b01:	85 c0                	test   %eax,%eax
80104b03:	78 1b                	js     80104b20 <sys_dup+0x30>
80104b05:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b08:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b0e:	31 db                	xor    %ebx,%ebx
80104b10:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104b14:	85 c9                	test   %ecx,%ecx
80104b16:	74 18                	je     80104b30 <sys_dup+0x40>
80104b18:	83 c3 01             	add    $0x1,%ebx
80104b1b:	83 fb 10             	cmp    $0x10,%ebx
80104b1e:	75 f0                	jne    80104b10 <sys_dup+0x20>
80104b20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b28:	c9                   	leave  
80104b29:	c3                   	ret    
80104b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b30:	83 ec 0c             	sub    $0xc,%esp
80104b33:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)
80104b37:	52                   	push   %edx
80104b38:	e8 83 c2 ff ff       	call   80100dc0 <filedup>
80104b3d:	89 d8                	mov    %ebx,%eax
80104b3f:	83 c4 10             	add    $0x10,%esp
80104b42:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b45:	c9                   	leave  
80104b46:	c3                   	ret    
80104b47:	89 f6                	mov    %esi,%esi
80104b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b50 <sys_read>:
80104b50:	55                   	push   %ebp
80104b51:	31 c0                	xor    %eax,%eax
80104b53:	89 e5                	mov    %esp,%ebp
80104b55:	83 ec 18             	sub    $0x18,%esp
80104b58:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b5b:	e8 30 ff ff ff       	call   80104a90 <argfd.constprop.0>
80104b60:	85 c0                	test   %eax,%eax
80104b62:	78 4c                	js     80104bb0 <sys_read+0x60>
80104b64:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b67:	83 ec 08             	sub    $0x8,%esp
80104b6a:	50                   	push   %eax
80104b6b:	6a 02                	push   $0x2
80104b6d:	e8 fe fb ff ff       	call   80104770 <argint>
80104b72:	83 c4 10             	add    $0x10,%esp
80104b75:	85 c0                	test   %eax,%eax
80104b77:	78 37                	js     80104bb0 <sys_read+0x60>
80104b79:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b7c:	83 ec 04             	sub    $0x4,%esp
80104b7f:	ff 75 f0             	pushl  -0x10(%ebp)
80104b82:	50                   	push   %eax
80104b83:	6a 01                	push   $0x1
80104b85:	e8 26 fc ff ff       	call   801047b0 <argptr>
80104b8a:	83 c4 10             	add    $0x10,%esp
80104b8d:	85 c0                	test   %eax,%eax
80104b8f:	78 1f                	js     80104bb0 <sys_read+0x60>
80104b91:	83 ec 04             	sub    $0x4,%esp
80104b94:	ff 75 f0             	pushl  -0x10(%ebp)
80104b97:	ff 75 f4             	pushl  -0xc(%ebp)
80104b9a:	ff 75 ec             	pushl  -0x14(%ebp)
80104b9d:	e8 8e c3 ff ff       	call   80100f30 <fileread>
80104ba2:	83 c4 10             	add    $0x10,%esp
80104ba5:	c9                   	leave  
80104ba6:	c3                   	ret    
80104ba7:	89 f6                	mov    %esi,%esi
80104ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104bb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bb5:	c9                   	leave  
80104bb6:	c3                   	ret    
80104bb7:	89 f6                	mov    %esi,%esi
80104bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104bc0 <sys_write>:
80104bc0:	55                   	push   %ebp
80104bc1:	31 c0                	xor    %eax,%eax
80104bc3:	89 e5                	mov    %esp,%ebp
80104bc5:	83 ec 18             	sub    $0x18,%esp
80104bc8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104bcb:	e8 c0 fe ff ff       	call   80104a90 <argfd.constprop.0>
80104bd0:	85 c0                	test   %eax,%eax
80104bd2:	78 4c                	js     80104c20 <sys_write+0x60>
80104bd4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104bd7:	83 ec 08             	sub    $0x8,%esp
80104bda:	50                   	push   %eax
80104bdb:	6a 02                	push   $0x2
80104bdd:	e8 8e fb ff ff       	call   80104770 <argint>
80104be2:	83 c4 10             	add    $0x10,%esp
80104be5:	85 c0                	test   %eax,%eax
80104be7:	78 37                	js     80104c20 <sys_write+0x60>
80104be9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104bec:	83 ec 04             	sub    $0x4,%esp
80104bef:	ff 75 f0             	pushl  -0x10(%ebp)
80104bf2:	50                   	push   %eax
80104bf3:	6a 01                	push   $0x1
80104bf5:	e8 b6 fb ff ff       	call   801047b0 <argptr>
80104bfa:	83 c4 10             	add    $0x10,%esp
80104bfd:	85 c0                	test   %eax,%eax
80104bff:	78 1f                	js     80104c20 <sys_write+0x60>
80104c01:	83 ec 04             	sub    $0x4,%esp
80104c04:	ff 75 f0             	pushl  -0x10(%ebp)
80104c07:	ff 75 f4             	pushl  -0xc(%ebp)
80104c0a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c0d:	e8 ae c3 ff ff       	call   80100fc0 <filewrite>
80104c12:	83 c4 10             	add    $0x10,%esp
80104c15:	c9                   	leave  
80104c16:	c3                   	ret    
80104c17:	89 f6                	mov    %esi,%esi
80104c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104c20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c25:	c9                   	leave  
80104c26:	c3                   	ret    
80104c27:	89 f6                	mov    %esi,%esi
80104c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c30 <sys_close>:
80104c30:	55                   	push   %ebp
80104c31:	89 e5                	mov    %esp,%ebp
80104c33:	83 ec 18             	sub    $0x18,%esp
80104c36:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104c39:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c3c:	e8 4f fe ff ff       	call   80104a90 <argfd.constprop.0>
80104c41:	85 c0                	test   %eax,%eax
80104c43:	78 2b                	js     80104c70 <sys_close+0x40>
80104c45:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104c48:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104c4e:	83 ec 0c             	sub    $0xc,%esp
80104c51:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104c58:	00 
80104c59:	ff 75 f4             	pushl  -0xc(%ebp)
80104c5c:	e8 af c1 ff ff       	call   80100e10 <fileclose>
80104c61:	83 c4 10             	add    $0x10,%esp
80104c64:	31 c0                	xor    %eax,%eax
80104c66:	c9                   	leave  
80104c67:	c3                   	ret    
80104c68:	90                   	nop
80104c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c75:	c9                   	leave  
80104c76:	c3                   	ret    
80104c77:	89 f6                	mov    %esi,%esi
80104c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c80 <sys_fstat>:
80104c80:	55                   	push   %ebp
80104c81:	31 c0                	xor    %eax,%eax
80104c83:	89 e5                	mov    %esp,%ebp
80104c85:	83 ec 18             	sub    $0x18,%esp
80104c88:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104c8b:	e8 00 fe ff ff       	call   80104a90 <argfd.constprop.0>
80104c90:	85 c0                	test   %eax,%eax
80104c92:	78 2c                	js     80104cc0 <sys_fstat+0x40>
80104c94:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c97:	83 ec 04             	sub    $0x4,%esp
80104c9a:	6a 14                	push   $0x14
80104c9c:	50                   	push   %eax
80104c9d:	6a 01                	push   $0x1
80104c9f:	e8 0c fb ff ff       	call   801047b0 <argptr>
80104ca4:	83 c4 10             	add    $0x10,%esp
80104ca7:	85 c0                	test   %eax,%eax
80104ca9:	78 15                	js     80104cc0 <sys_fstat+0x40>
80104cab:	83 ec 08             	sub    $0x8,%esp
80104cae:	ff 75 f4             	pushl  -0xc(%ebp)
80104cb1:	ff 75 f0             	pushl  -0x10(%ebp)
80104cb4:	e8 27 c2 ff ff       	call   80100ee0 <filestat>
80104cb9:	83 c4 10             	add    $0x10,%esp
80104cbc:	c9                   	leave  
80104cbd:	c3                   	ret    
80104cbe:	66 90                	xchg   %ax,%ax
80104cc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cc5:	c9                   	leave  
80104cc6:	c3                   	ret    
80104cc7:	89 f6                	mov    %esi,%esi
80104cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cd0 <sys_link>:
80104cd0:	55                   	push   %ebp
80104cd1:	89 e5                	mov    %esp,%ebp
80104cd3:	57                   	push   %edi
80104cd4:	56                   	push   %esi
80104cd5:	53                   	push   %ebx
80104cd6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104cd9:	83 ec 34             	sub    $0x34,%esp
80104cdc:	50                   	push   %eax
80104cdd:	6a 00                	push   $0x0
80104cdf:	e8 1c fb ff ff       	call   80104800 <argstr>
80104ce4:	83 c4 10             	add    $0x10,%esp
80104ce7:	85 c0                	test   %eax,%eax
80104ce9:	0f 88 fb 00 00 00    	js     80104dea <sys_link+0x11a>
80104cef:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104cf2:	83 ec 08             	sub    $0x8,%esp
80104cf5:	50                   	push   %eax
80104cf6:	6a 01                	push   $0x1
80104cf8:	e8 03 fb ff ff       	call   80104800 <argstr>
80104cfd:	83 c4 10             	add    $0x10,%esp
80104d00:	85 c0                	test   %eax,%eax
80104d02:	0f 88 e2 00 00 00    	js     80104dea <sys_link+0x11a>
80104d08:	e8 a3 de ff ff       	call   80102bb0 <begin_op>
80104d0d:	83 ec 0c             	sub    $0xc,%esp
80104d10:	ff 75 d4             	pushl  -0x2c(%ebp)
80104d13:	e8 68 d1 ff ff       	call   80101e80 <namei>
80104d18:	83 c4 10             	add    $0x10,%esp
80104d1b:	85 c0                	test   %eax,%eax
80104d1d:	89 c3                	mov    %eax,%ebx
80104d1f:	0f 84 f3 00 00 00    	je     80104e18 <sys_link+0x148>
80104d25:	83 ec 0c             	sub    $0xc,%esp
80104d28:	50                   	push   %eax
80104d29:	e8 22 c9 ff ff       	call   80101650 <ilock>
80104d2e:	83 c4 10             	add    $0x10,%esp
80104d31:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d36:	0f 84 c4 00 00 00    	je     80104e00 <sys_link+0x130>
80104d3c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104d41:	83 ec 0c             	sub    $0xc,%esp
80104d44:	8d 7d da             	lea    -0x26(%ebp),%edi
80104d47:	53                   	push   %ebx
80104d48:	e8 53 c8 ff ff       	call   801015a0 <iupdate>
80104d4d:	89 1c 24             	mov    %ebx,(%esp)
80104d50:	e8 db c9 ff ff       	call   80101730 <iunlock>
80104d55:	58                   	pop    %eax
80104d56:	5a                   	pop    %edx
80104d57:	57                   	push   %edi
80104d58:	ff 75 d0             	pushl  -0x30(%ebp)
80104d5b:	e8 40 d1 ff ff       	call   80101ea0 <nameiparent>
80104d60:	83 c4 10             	add    $0x10,%esp
80104d63:	85 c0                	test   %eax,%eax
80104d65:	89 c6                	mov    %eax,%esi
80104d67:	74 5b                	je     80104dc4 <sys_link+0xf4>
80104d69:	83 ec 0c             	sub    $0xc,%esp
80104d6c:	50                   	push   %eax
80104d6d:	e8 de c8 ff ff       	call   80101650 <ilock>
80104d72:	83 c4 10             	add    $0x10,%esp
80104d75:	8b 03                	mov    (%ebx),%eax
80104d77:	39 06                	cmp    %eax,(%esi)
80104d79:	75 3d                	jne    80104db8 <sys_link+0xe8>
80104d7b:	83 ec 04             	sub    $0x4,%esp
80104d7e:	ff 73 04             	pushl  0x4(%ebx)
80104d81:	57                   	push   %edi
80104d82:	56                   	push   %esi
80104d83:	e8 38 d0 ff ff       	call   80101dc0 <dirlink>
80104d88:	83 c4 10             	add    $0x10,%esp
80104d8b:	85 c0                	test   %eax,%eax
80104d8d:	78 29                	js     80104db8 <sys_link+0xe8>
80104d8f:	83 ec 0c             	sub    $0xc,%esp
80104d92:	56                   	push   %esi
80104d93:	e8 28 cb ff ff       	call   801018c0 <iunlockput>
80104d98:	89 1c 24             	mov    %ebx,(%esp)
80104d9b:	e8 e0 c9 ff ff       	call   80101780 <iput>
80104da0:	e8 7b de ff ff       	call   80102c20 <end_op>
80104da5:	83 c4 10             	add    $0x10,%esp
80104da8:	31 c0                	xor    %eax,%eax
80104daa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104dad:	5b                   	pop    %ebx
80104dae:	5e                   	pop    %esi
80104daf:	5f                   	pop    %edi
80104db0:	5d                   	pop    %ebp
80104db1:	c3                   	ret    
80104db2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104db8:	83 ec 0c             	sub    $0xc,%esp
80104dbb:	56                   	push   %esi
80104dbc:	e8 ff ca ff ff       	call   801018c0 <iunlockput>
80104dc1:	83 c4 10             	add    $0x10,%esp
80104dc4:	83 ec 0c             	sub    $0xc,%esp
80104dc7:	53                   	push   %ebx
80104dc8:	e8 83 c8 ff ff       	call   80101650 <ilock>
80104dcd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104dd2:	89 1c 24             	mov    %ebx,(%esp)
80104dd5:	e8 c6 c7 ff ff       	call   801015a0 <iupdate>
80104dda:	89 1c 24             	mov    %ebx,(%esp)
80104ddd:	e8 de ca ff ff       	call   801018c0 <iunlockput>
80104de2:	e8 39 de ff ff       	call   80102c20 <end_op>
80104de7:	83 c4 10             	add    $0x10,%esp
80104dea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ded:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104df2:	5b                   	pop    %ebx
80104df3:	5e                   	pop    %esi
80104df4:	5f                   	pop    %edi
80104df5:	5d                   	pop    %ebp
80104df6:	c3                   	ret    
80104df7:	89 f6                	mov    %esi,%esi
80104df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104e00:	83 ec 0c             	sub    $0xc,%esp
80104e03:	53                   	push   %ebx
80104e04:	e8 b7 ca ff ff       	call   801018c0 <iunlockput>
80104e09:	e8 12 de ff ff       	call   80102c20 <end_op>
80104e0e:	83 c4 10             	add    $0x10,%esp
80104e11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e16:	eb 92                	jmp    80104daa <sys_link+0xda>
80104e18:	e8 03 de ff ff       	call   80102c20 <end_op>
80104e1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e22:	eb 86                	jmp    80104daa <sys_link+0xda>
80104e24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104e30 <sys_unlink>:
80104e30:	55                   	push   %ebp
80104e31:	89 e5                	mov    %esp,%ebp
80104e33:	57                   	push   %edi
80104e34:	56                   	push   %esi
80104e35:	53                   	push   %ebx
80104e36:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104e39:	83 ec 54             	sub    $0x54,%esp
80104e3c:	50                   	push   %eax
80104e3d:	6a 00                	push   $0x0
80104e3f:	e8 bc f9 ff ff       	call   80104800 <argstr>
80104e44:	83 c4 10             	add    $0x10,%esp
80104e47:	85 c0                	test   %eax,%eax
80104e49:	0f 88 82 01 00 00    	js     80104fd1 <sys_unlink+0x1a1>
80104e4f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104e52:	e8 59 dd ff ff       	call   80102bb0 <begin_op>
80104e57:	83 ec 08             	sub    $0x8,%esp
80104e5a:	53                   	push   %ebx
80104e5b:	ff 75 c0             	pushl  -0x40(%ebp)
80104e5e:	e8 3d d0 ff ff       	call   80101ea0 <nameiparent>
80104e63:	83 c4 10             	add    $0x10,%esp
80104e66:	85 c0                	test   %eax,%eax
80104e68:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104e6b:	0f 84 6a 01 00 00    	je     80104fdb <sys_unlink+0x1ab>
80104e71:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104e74:	83 ec 0c             	sub    $0xc,%esp
80104e77:	56                   	push   %esi
80104e78:	e8 d3 c7 ff ff       	call   80101650 <ilock>
80104e7d:	58                   	pop    %eax
80104e7e:	5a                   	pop    %edx
80104e7f:	68 74 76 10 80       	push   $0x80107674
80104e84:	53                   	push   %ebx
80104e85:	e8 b6 cc ff ff       	call   80101b40 <namecmp>
80104e8a:	83 c4 10             	add    $0x10,%esp
80104e8d:	85 c0                	test   %eax,%eax
80104e8f:	0f 84 fc 00 00 00    	je     80104f91 <sys_unlink+0x161>
80104e95:	83 ec 08             	sub    $0x8,%esp
80104e98:	68 73 76 10 80       	push   $0x80107673
80104e9d:	53                   	push   %ebx
80104e9e:	e8 9d cc ff ff       	call   80101b40 <namecmp>
80104ea3:	83 c4 10             	add    $0x10,%esp
80104ea6:	85 c0                	test   %eax,%eax
80104ea8:	0f 84 e3 00 00 00    	je     80104f91 <sys_unlink+0x161>
80104eae:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104eb1:	83 ec 04             	sub    $0x4,%esp
80104eb4:	50                   	push   %eax
80104eb5:	53                   	push   %ebx
80104eb6:	56                   	push   %esi
80104eb7:	e8 a4 cc ff ff       	call   80101b60 <dirlookup>
80104ebc:	83 c4 10             	add    $0x10,%esp
80104ebf:	85 c0                	test   %eax,%eax
80104ec1:	89 c3                	mov    %eax,%ebx
80104ec3:	0f 84 c8 00 00 00    	je     80104f91 <sys_unlink+0x161>
80104ec9:	83 ec 0c             	sub    $0xc,%esp
80104ecc:	50                   	push   %eax
80104ecd:	e8 7e c7 ff ff       	call   80101650 <ilock>
80104ed2:	83 c4 10             	add    $0x10,%esp
80104ed5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104eda:	0f 8e 24 01 00 00    	jle    80105004 <sys_unlink+0x1d4>
80104ee0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ee5:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104ee8:	74 66                	je     80104f50 <sys_unlink+0x120>
80104eea:	83 ec 04             	sub    $0x4,%esp
80104eed:	6a 10                	push   $0x10
80104eef:	6a 00                	push   $0x0
80104ef1:	56                   	push   %esi
80104ef2:	e8 89 f5 ff ff       	call   80104480 <memset>
80104ef7:	6a 10                	push   $0x10
80104ef9:	ff 75 c4             	pushl  -0x3c(%ebp)
80104efc:	56                   	push   %esi
80104efd:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f00:	e8 0b cb ff ff       	call   80101a10 <writei>
80104f05:	83 c4 20             	add    $0x20,%esp
80104f08:	83 f8 10             	cmp    $0x10,%eax
80104f0b:	0f 85 e6 00 00 00    	jne    80104ff7 <sys_unlink+0x1c7>
80104f11:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f16:	0f 84 9c 00 00 00    	je     80104fb8 <sys_unlink+0x188>
80104f1c:	83 ec 0c             	sub    $0xc,%esp
80104f1f:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f22:	e8 99 c9 ff ff       	call   801018c0 <iunlockput>
80104f27:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104f2c:	89 1c 24             	mov    %ebx,(%esp)
80104f2f:	e8 6c c6 ff ff       	call   801015a0 <iupdate>
80104f34:	89 1c 24             	mov    %ebx,(%esp)
80104f37:	e8 84 c9 ff ff       	call   801018c0 <iunlockput>
80104f3c:	e8 df dc ff ff       	call   80102c20 <end_op>
80104f41:	83 c4 10             	add    $0x10,%esp
80104f44:	31 c0                	xor    %eax,%eax
80104f46:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f49:	5b                   	pop    %ebx
80104f4a:	5e                   	pop    %esi
80104f4b:	5f                   	pop    %edi
80104f4c:	5d                   	pop    %ebp
80104f4d:	c3                   	ret    
80104f4e:	66 90                	xchg   %ax,%ax
80104f50:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104f54:	76 94                	jbe    80104eea <sys_unlink+0xba>
80104f56:	bf 20 00 00 00       	mov    $0x20,%edi
80104f5b:	eb 0f                	jmp    80104f6c <sys_unlink+0x13c>
80104f5d:	8d 76 00             	lea    0x0(%esi),%esi
80104f60:	83 c7 10             	add    $0x10,%edi
80104f63:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104f66:	0f 83 7e ff ff ff    	jae    80104eea <sys_unlink+0xba>
80104f6c:	6a 10                	push   $0x10
80104f6e:	57                   	push   %edi
80104f6f:	56                   	push   %esi
80104f70:	53                   	push   %ebx
80104f71:	e8 9a c9 ff ff       	call   80101910 <readi>
80104f76:	83 c4 10             	add    $0x10,%esp
80104f79:	83 f8 10             	cmp    $0x10,%eax
80104f7c:	75 6c                	jne    80104fea <sys_unlink+0x1ba>
80104f7e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104f83:	74 db                	je     80104f60 <sys_unlink+0x130>
80104f85:	83 ec 0c             	sub    $0xc,%esp
80104f88:	53                   	push   %ebx
80104f89:	e8 32 c9 ff ff       	call   801018c0 <iunlockput>
80104f8e:	83 c4 10             	add    $0x10,%esp
80104f91:	83 ec 0c             	sub    $0xc,%esp
80104f94:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f97:	e8 24 c9 ff ff       	call   801018c0 <iunlockput>
80104f9c:	e8 7f dc ff ff       	call   80102c20 <end_op>
80104fa1:	83 c4 10             	add    $0x10,%esp
80104fa4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fa7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fac:	5b                   	pop    %ebx
80104fad:	5e                   	pop    %esi
80104fae:	5f                   	pop    %edi
80104faf:	5d                   	pop    %ebp
80104fb0:	c3                   	ret    
80104fb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104fb8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104fbb:	83 ec 0c             	sub    $0xc,%esp
80104fbe:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
80104fc3:	50                   	push   %eax
80104fc4:	e8 d7 c5 ff ff       	call   801015a0 <iupdate>
80104fc9:	83 c4 10             	add    $0x10,%esp
80104fcc:	e9 4b ff ff ff       	jmp    80104f1c <sys_unlink+0xec>
80104fd1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fd6:	e9 6b ff ff ff       	jmp    80104f46 <sys_unlink+0x116>
80104fdb:	e8 40 dc ff ff       	call   80102c20 <end_op>
80104fe0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fe5:	e9 5c ff ff ff       	jmp    80104f46 <sys_unlink+0x116>
80104fea:	83 ec 0c             	sub    $0xc,%esp
80104fed:	68 98 76 10 80       	push   $0x80107698
80104ff2:	e8 79 b3 ff ff       	call   80100370 <panic>
80104ff7:	83 ec 0c             	sub    $0xc,%esp
80104ffa:	68 aa 76 10 80       	push   $0x801076aa
80104fff:	e8 6c b3 ff ff       	call   80100370 <panic>
80105004:	83 ec 0c             	sub    $0xc,%esp
80105007:	68 86 76 10 80       	push   $0x80107686
8010500c:	e8 5f b3 ff ff       	call   80100370 <panic>
80105011:	eb 0d                	jmp    80105020 <sys_open>
80105013:	90                   	nop
80105014:	90                   	nop
80105015:	90                   	nop
80105016:	90                   	nop
80105017:	90                   	nop
80105018:	90                   	nop
80105019:	90                   	nop
8010501a:	90                   	nop
8010501b:	90                   	nop
8010501c:	90                   	nop
8010501d:	90                   	nop
8010501e:	90                   	nop
8010501f:	90                   	nop

80105020 <sys_open>:
80105020:	55                   	push   %ebp
80105021:	89 e5                	mov    %esp,%ebp
80105023:	57                   	push   %edi
80105024:	56                   	push   %esi
80105025:	53                   	push   %ebx
80105026:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105029:	83 ec 24             	sub    $0x24,%esp
8010502c:	50                   	push   %eax
8010502d:	6a 00                	push   $0x0
8010502f:	e8 cc f7 ff ff       	call   80104800 <argstr>
80105034:	83 c4 10             	add    $0x10,%esp
80105037:	85 c0                	test   %eax,%eax
80105039:	0f 88 9e 00 00 00    	js     801050dd <sys_open+0xbd>
8010503f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105042:	83 ec 08             	sub    $0x8,%esp
80105045:	50                   	push   %eax
80105046:	6a 01                	push   $0x1
80105048:	e8 23 f7 ff ff       	call   80104770 <argint>
8010504d:	83 c4 10             	add    $0x10,%esp
80105050:	85 c0                	test   %eax,%eax
80105052:	0f 88 85 00 00 00    	js     801050dd <sys_open+0xbd>
80105058:	e8 53 db ff ff       	call   80102bb0 <begin_op>
8010505d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105061:	0f 85 89 00 00 00    	jne    801050f0 <sys_open+0xd0>
80105067:	83 ec 0c             	sub    $0xc,%esp
8010506a:	ff 75 e0             	pushl  -0x20(%ebp)
8010506d:	e8 0e ce ff ff       	call   80101e80 <namei>
80105072:	83 c4 10             	add    $0x10,%esp
80105075:	85 c0                	test   %eax,%eax
80105077:	89 c7                	mov    %eax,%edi
80105079:	0f 84 8e 00 00 00    	je     8010510d <sys_open+0xed>
8010507f:	83 ec 0c             	sub    $0xc,%esp
80105082:	50                   	push   %eax
80105083:	e8 c8 c5 ff ff       	call   80101650 <ilock>
80105088:	83 c4 10             	add    $0x10,%esp
8010508b:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80105090:	0f 84 d2 00 00 00    	je     80105168 <sys_open+0x148>
80105096:	e8 b5 bc ff ff       	call   80100d50 <filealloc>
8010509b:	85 c0                	test   %eax,%eax
8010509d:	89 c6                	mov    %eax,%esi
8010509f:	74 2b                	je     801050cc <sys_open+0xac>
801050a1:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801050a8:	31 db                	xor    %ebx,%ebx
801050aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801050b0:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
801050b4:	85 c0                	test   %eax,%eax
801050b6:	74 68                	je     80105120 <sys_open+0x100>
801050b8:	83 c3 01             	add    $0x1,%ebx
801050bb:	83 fb 10             	cmp    $0x10,%ebx
801050be:	75 f0                	jne    801050b0 <sys_open+0x90>
801050c0:	83 ec 0c             	sub    $0xc,%esp
801050c3:	56                   	push   %esi
801050c4:	e8 47 bd ff ff       	call   80100e10 <fileclose>
801050c9:	83 c4 10             	add    $0x10,%esp
801050cc:	83 ec 0c             	sub    $0xc,%esp
801050cf:	57                   	push   %edi
801050d0:	e8 eb c7 ff ff       	call   801018c0 <iunlockput>
801050d5:	e8 46 db ff ff       	call   80102c20 <end_op>
801050da:	83 c4 10             	add    $0x10,%esp
801050dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050e5:	5b                   	pop    %ebx
801050e6:	5e                   	pop    %esi
801050e7:	5f                   	pop    %edi
801050e8:	5d                   	pop    %ebp
801050e9:	c3                   	ret    
801050ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801050f0:	83 ec 0c             	sub    $0xc,%esp
801050f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801050f6:	31 c9                	xor    %ecx,%ecx
801050f8:	6a 00                	push   $0x0
801050fa:	ba 02 00 00 00       	mov    $0x2,%edx
801050ff:	e8 ec f7 ff ff       	call   801048f0 <create>
80105104:	83 c4 10             	add    $0x10,%esp
80105107:	85 c0                	test   %eax,%eax
80105109:	89 c7                	mov    %eax,%edi
8010510b:	75 89                	jne    80105096 <sys_open+0x76>
8010510d:	e8 0e db ff ff       	call   80102c20 <end_op>
80105112:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105117:	eb 43                	jmp    8010515c <sys_open+0x13c>
80105119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105120:	83 ec 0c             	sub    $0xc,%esp
80105123:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
80105127:	57                   	push   %edi
80105128:	e8 03 c6 ff ff       	call   80101730 <iunlock>
8010512d:	e8 ee da ff ff       	call   80102c20 <end_op>
80105132:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
80105138:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010513b:	83 c4 10             	add    $0x10,%esp
8010513e:	89 7e 10             	mov    %edi,0x10(%esi)
80105141:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
80105148:	89 d0                	mov    %edx,%eax
8010514a:	83 e0 01             	and    $0x1,%eax
8010514d:	83 f0 01             	xor    $0x1,%eax
80105150:	83 e2 03             	and    $0x3,%edx
80105153:	88 46 08             	mov    %al,0x8(%esi)
80105156:	0f 95 46 09          	setne  0x9(%esi)
8010515a:	89 d8                	mov    %ebx,%eax
8010515c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010515f:	5b                   	pop    %ebx
80105160:	5e                   	pop    %esi
80105161:	5f                   	pop    %edi
80105162:	5d                   	pop    %ebp
80105163:	c3                   	ret    
80105164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105168:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010516b:	85 d2                	test   %edx,%edx
8010516d:	0f 84 23 ff ff ff    	je     80105096 <sys_open+0x76>
80105173:	e9 54 ff ff ff       	jmp    801050cc <sys_open+0xac>
80105178:	90                   	nop
80105179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105180 <sys_mkdir>:
80105180:	55                   	push   %ebp
80105181:	89 e5                	mov    %esp,%ebp
80105183:	83 ec 18             	sub    $0x18,%esp
80105186:	e8 25 da ff ff       	call   80102bb0 <begin_op>
8010518b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010518e:	83 ec 08             	sub    $0x8,%esp
80105191:	50                   	push   %eax
80105192:	6a 00                	push   $0x0
80105194:	e8 67 f6 ff ff       	call   80104800 <argstr>
80105199:	83 c4 10             	add    $0x10,%esp
8010519c:	85 c0                	test   %eax,%eax
8010519e:	78 30                	js     801051d0 <sys_mkdir+0x50>
801051a0:	83 ec 0c             	sub    $0xc,%esp
801051a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051a6:	31 c9                	xor    %ecx,%ecx
801051a8:	6a 00                	push   $0x0
801051aa:	ba 01 00 00 00       	mov    $0x1,%edx
801051af:	e8 3c f7 ff ff       	call   801048f0 <create>
801051b4:	83 c4 10             	add    $0x10,%esp
801051b7:	85 c0                	test   %eax,%eax
801051b9:	74 15                	je     801051d0 <sys_mkdir+0x50>
801051bb:	83 ec 0c             	sub    $0xc,%esp
801051be:	50                   	push   %eax
801051bf:	e8 fc c6 ff ff       	call   801018c0 <iunlockput>
801051c4:	e8 57 da ff ff       	call   80102c20 <end_op>
801051c9:	83 c4 10             	add    $0x10,%esp
801051cc:	31 c0                	xor    %eax,%eax
801051ce:	c9                   	leave  
801051cf:	c3                   	ret    
801051d0:	e8 4b da ff ff       	call   80102c20 <end_op>
801051d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051da:	c9                   	leave  
801051db:	c3                   	ret    
801051dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801051e0 <sys_mknod>:
801051e0:	55                   	push   %ebp
801051e1:	89 e5                	mov    %esp,%ebp
801051e3:	83 ec 18             	sub    $0x18,%esp
801051e6:	e8 c5 d9 ff ff       	call   80102bb0 <begin_op>
801051eb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801051ee:	83 ec 08             	sub    $0x8,%esp
801051f1:	50                   	push   %eax
801051f2:	6a 00                	push   $0x0
801051f4:	e8 07 f6 ff ff       	call   80104800 <argstr>
801051f9:	83 c4 10             	add    $0x10,%esp
801051fc:	85 c0                	test   %eax,%eax
801051fe:	78 60                	js     80105260 <sys_mknod+0x80>
80105200:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105203:	83 ec 08             	sub    $0x8,%esp
80105206:	50                   	push   %eax
80105207:	6a 01                	push   $0x1
80105209:	e8 62 f5 ff ff       	call   80104770 <argint>
8010520e:	83 c4 10             	add    $0x10,%esp
80105211:	85 c0                	test   %eax,%eax
80105213:	78 4b                	js     80105260 <sys_mknod+0x80>
80105215:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105218:	83 ec 08             	sub    $0x8,%esp
8010521b:	50                   	push   %eax
8010521c:	6a 02                	push   $0x2
8010521e:	e8 4d f5 ff ff       	call   80104770 <argint>
80105223:	83 c4 10             	add    $0x10,%esp
80105226:	85 c0                	test   %eax,%eax
80105228:	78 36                	js     80105260 <sys_mknod+0x80>
8010522a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010522e:	83 ec 0c             	sub    $0xc,%esp
80105231:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105235:	ba 03 00 00 00       	mov    $0x3,%edx
8010523a:	50                   	push   %eax
8010523b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010523e:	e8 ad f6 ff ff       	call   801048f0 <create>
80105243:	83 c4 10             	add    $0x10,%esp
80105246:	85 c0                	test   %eax,%eax
80105248:	74 16                	je     80105260 <sys_mknod+0x80>
8010524a:	83 ec 0c             	sub    $0xc,%esp
8010524d:	50                   	push   %eax
8010524e:	e8 6d c6 ff ff       	call   801018c0 <iunlockput>
80105253:	e8 c8 d9 ff ff       	call   80102c20 <end_op>
80105258:	83 c4 10             	add    $0x10,%esp
8010525b:	31 c0                	xor    %eax,%eax
8010525d:	c9                   	leave  
8010525e:	c3                   	ret    
8010525f:	90                   	nop
80105260:	e8 bb d9 ff ff       	call   80102c20 <end_op>
80105265:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010526a:	c9                   	leave  
8010526b:	c3                   	ret    
8010526c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105270 <sys_chdir>:
80105270:	55                   	push   %ebp
80105271:	89 e5                	mov    %esp,%ebp
80105273:	53                   	push   %ebx
80105274:	83 ec 14             	sub    $0x14,%esp
80105277:	e8 34 d9 ff ff       	call   80102bb0 <begin_op>
8010527c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010527f:	83 ec 08             	sub    $0x8,%esp
80105282:	50                   	push   %eax
80105283:	6a 00                	push   $0x0
80105285:	e8 76 f5 ff ff       	call   80104800 <argstr>
8010528a:	83 c4 10             	add    $0x10,%esp
8010528d:	85 c0                	test   %eax,%eax
8010528f:	78 7f                	js     80105310 <sys_chdir+0xa0>
80105291:	83 ec 0c             	sub    $0xc,%esp
80105294:	ff 75 f4             	pushl  -0xc(%ebp)
80105297:	e8 e4 cb ff ff       	call   80101e80 <namei>
8010529c:	83 c4 10             	add    $0x10,%esp
8010529f:	85 c0                	test   %eax,%eax
801052a1:	89 c3                	mov    %eax,%ebx
801052a3:	74 6b                	je     80105310 <sys_chdir+0xa0>
801052a5:	83 ec 0c             	sub    $0xc,%esp
801052a8:	50                   	push   %eax
801052a9:	e8 a2 c3 ff ff       	call   80101650 <ilock>
801052ae:	83 c4 10             	add    $0x10,%esp
801052b1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801052b6:	75 38                	jne    801052f0 <sys_chdir+0x80>
801052b8:	83 ec 0c             	sub    $0xc,%esp
801052bb:	53                   	push   %ebx
801052bc:	e8 6f c4 ff ff       	call   80101730 <iunlock>
801052c1:	58                   	pop    %eax
801052c2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801052c8:	ff 70 68             	pushl  0x68(%eax)
801052cb:	e8 b0 c4 ff ff       	call   80101780 <iput>
801052d0:	e8 4b d9 ff ff       	call   80102c20 <end_op>
801052d5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801052db:	83 c4 10             	add    $0x10,%esp
801052de:	89 58 68             	mov    %ebx,0x68(%eax)
801052e1:	31 c0                	xor    %eax,%eax
801052e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801052e6:	c9                   	leave  
801052e7:	c3                   	ret    
801052e8:	90                   	nop
801052e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801052f0:	83 ec 0c             	sub    $0xc,%esp
801052f3:	53                   	push   %ebx
801052f4:	e8 c7 c5 ff ff       	call   801018c0 <iunlockput>
801052f9:	e8 22 d9 ff ff       	call   80102c20 <end_op>
801052fe:	83 c4 10             	add    $0x10,%esp
80105301:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105306:	eb db                	jmp    801052e3 <sys_chdir+0x73>
80105308:	90                   	nop
80105309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105310:	e8 0b d9 ff ff       	call   80102c20 <end_op>
80105315:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010531a:	eb c7                	jmp    801052e3 <sys_chdir+0x73>
8010531c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105320 <sys_exec>:
80105320:	55                   	push   %ebp
80105321:	89 e5                	mov    %esp,%ebp
80105323:	57                   	push   %edi
80105324:	56                   	push   %esi
80105325:	53                   	push   %ebx
80105326:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
8010532c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105332:	50                   	push   %eax
80105333:	6a 00                	push   $0x0
80105335:	e8 c6 f4 ff ff       	call   80104800 <argstr>
8010533a:	83 c4 10             	add    $0x10,%esp
8010533d:	85 c0                	test   %eax,%eax
8010533f:	78 7f                	js     801053c0 <sys_exec+0xa0>
80105341:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105347:	83 ec 08             	sub    $0x8,%esp
8010534a:	50                   	push   %eax
8010534b:	6a 01                	push   $0x1
8010534d:	e8 1e f4 ff ff       	call   80104770 <argint>
80105352:	83 c4 10             	add    $0x10,%esp
80105355:	85 c0                	test   %eax,%eax
80105357:	78 67                	js     801053c0 <sys_exec+0xa0>
80105359:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010535f:	83 ec 04             	sub    $0x4,%esp
80105362:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105368:	68 80 00 00 00       	push   $0x80
8010536d:	6a 00                	push   $0x0
8010536f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105375:	50                   	push   %eax
80105376:	31 db                	xor    %ebx,%ebx
80105378:	e8 03 f1 ff ff       	call   80104480 <memset>
8010537d:	83 c4 10             	add    $0x10,%esp
80105380:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105386:	83 ec 08             	sub    $0x8,%esp
80105389:	57                   	push   %edi
8010538a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010538d:	50                   	push   %eax
8010538e:	e8 5d f3 ff ff       	call   801046f0 <fetchint>
80105393:	83 c4 10             	add    $0x10,%esp
80105396:	85 c0                	test   %eax,%eax
80105398:	78 26                	js     801053c0 <sys_exec+0xa0>
8010539a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801053a0:	85 c0                	test   %eax,%eax
801053a2:	74 2c                	je     801053d0 <sys_exec+0xb0>
801053a4:	83 ec 08             	sub    $0x8,%esp
801053a7:	56                   	push   %esi
801053a8:	50                   	push   %eax
801053a9:	e8 72 f3 ff ff       	call   80104720 <fetchstr>
801053ae:	83 c4 10             	add    $0x10,%esp
801053b1:	85 c0                	test   %eax,%eax
801053b3:	78 0b                	js     801053c0 <sys_exec+0xa0>
801053b5:	83 c3 01             	add    $0x1,%ebx
801053b8:	83 c6 04             	add    $0x4,%esi
801053bb:	83 fb 20             	cmp    $0x20,%ebx
801053be:	75 c0                	jne    80105380 <sys_exec+0x60>
801053c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053c8:	5b                   	pop    %ebx
801053c9:	5e                   	pop    %esi
801053ca:	5f                   	pop    %edi
801053cb:	5d                   	pop    %ebp
801053cc:	c3                   	ret    
801053cd:	8d 76 00             	lea    0x0(%esi),%esi
801053d0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801053d6:	83 ec 08             	sub    $0x8,%esp
801053d9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801053e0:	00 00 00 00 
801053e4:	50                   	push   %eax
801053e5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801053eb:	e8 00 b6 ff ff       	call   801009f0 <exec>
801053f0:	83 c4 10             	add    $0x10,%esp
801053f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053f6:	5b                   	pop    %ebx
801053f7:	5e                   	pop    %esi
801053f8:	5f                   	pop    %edi
801053f9:	5d                   	pop    %ebp
801053fa:	c3                   	ret    
801053fb:	90                   	nop
801053fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105400 <sys_pipe>:
80105400:	55                   	push   %ebp
80105401:	89 e5                	mov    %esp,%ebp
80105403:	57                   	push   %edi
80105404:	56                   	push   %esi
80105405:	53                   	push   %ebx
80105406:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105409:	83 ec 20             	sub    $0x20,%esp
8010540c:	6a 08                	push   $0x8
8010540e:	50                   	push   %eax
8010540f:	6a 00                	push   $0x0
80105411:	e8 9a f3 ff ff       	call   801047b0 <argptr>
80105416:	83 c4 10             	add    $0x10,%esp
80105419:	85 c0                	test   %eax,%eax
8010541b:	78 48                	js     80105465 <sys_pipe+0x65>
8010541d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105420:	83 ec 08             	sub    $0x8,%esp
80105423:	50                   	push   %eax
80105424:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105427:	50                   	push   %eax
80105428:	e8 23 df ff ff       	call   80103350 <pipealloc>
8010542d:	83 c4 10             	add    $0x10,%esp
80105430:	85 c0                	test   %eax,%eax
80105432:	78 31                	js     80105465 <sys_pipe+0x65>
80105434:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80105437:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
8010543e:	31 c0                	xor    %eax,%eax
80105440:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
80105444:	85 d2                	test   %edx,%edx
80105446:	74 28                	je     80105470 <sys_pipe+0x70>
80105448:	83 c0 01             	add    $0x1,%eax
8010544b:	83 f8 10             	cmp    $0x10,%eax
8010544e:	75 f0                	jne    80105440 <sys_pipe+0x40>
80105450:	83 ec 0c             	sub    $0xc,%esp
80105453:	53                   	push   %ebx
80105454:	e8 b7 b9 ff ff       	call   80100e10 <fileclose>
80105459:	58                   	pop    %eax
8010545a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010545d:	e8 ae b9 ff ff       	call   80100e10 <fileclose>
80105462:	83 c4 10             	add    $0x10,%esp
80105465:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010546a:	eb 45                	jmp    801054b1 <sys_pipe+0xb1>
8010546c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105470:	8d 34 81             	lea    (%ecx,%eax,4),%esi
80105473:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80105476:	31 d2                	xor    %edx,%edx
80105478:	89 5e 28             	mov    %ebx,0x28(%esi)
8010547b:	90                   	nop
8010547c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105480:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
80105485:	74 19                	je     801054a0 <sys_pipe+0xa0>
80105487:	83 c2 01             	add    $0x1,%edx
8010548a:	83 fa 10             	cmp    $0x10,%edx
8010548d:	75 f1                	jne    80105480 <sys_pipe+0x80>
8010548f:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
80105496:	eb b8                	jmp    80105450 <sys_pipe+0x50>
80105498:	90                   	nop
80105499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801054a0:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
801054a4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801054a7:	89 01                	mov    %eax,(%ecx)
801054a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054ac:	89 50 04             	mov    %edx,0x4(%eax)
801054af:	31 c0                	xor    %eax,%eax
801054b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054b4:	5b                   	pop    %ebx
801054b5:	5e                   	pop    %esi
801054b6:	5f                   	pop    %edi
801054b7:	5d                   	pop    %ebp
801054b8:	c3                   	ret    
801054b9:	66 90                	xchg   %ax,%ax
801054bb:	66 90                	xchg   %ax,%ax
801054bd:	66 90                	xchg   %ax,%ax
801054bf:	90                   	nop

801054c0 <sys_fork>:
801054c0:	55                   	push   %ebp
801054c1:	89 e5                	mov    %esp,%ebp
801054c3:	5d                   	pop    %ebp
801054c4:	e9 07 e5 ff ff       	jmp    801039d0 <fork>
801054c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801054d0 <sys_exit>:
801054d0:	55                   	push   %ebp
801054d1:	89 e5                	mov    %esp,%ebp
801054d3:	83 ec 08             	sub    $0x8,%esp
801054d6:	e8 65 e7 ff ff       	call   80103c40 <exit>
801054db:	31 c0                	xor    %eax,%eax
801054dd:	c9                   	leave  
801054de:	c3                   	ret    
801054df:	90                   	nop

801054e0 <sys_wait>:
801054e0:	55                   	push   %ebp
801054e1:	89 e5                	mov    %esp,%ebp
801054e3:	5d                   	pop    %ebp
801054e4:	e9 a7 e9 ff ff       	jmp    80103e90 <wait>
801054e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801054f0 <sys_kill>:
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	83 ec 20             	sub    $0x20,%esp
801054f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054f9:	50                   	push   %eax
801054fa:	6a 00                	push   $0x0
801054fc:	e8 6f f2 ff ff       	call   80104770 <argint>
80105501:	83 c4 10             	add    $0x10,%esp
80105504:	85 c0                	test   %eax,%eax
80105506:	78 18                	js     80105520 <sys_kill+0x30>
80105508:	83 ec 0c             	sub    $0xc,%esp
8010550b:	ff 75 f4             	pushl  -0xc(%ebp)
8010550e:	e8 bd ea ff ff       	call   80103fd0 <kill>
80105513:	83 c4 10             	add    $0x10,%esp
80105516:	c9                   	leave  
80105517:	c3                   	ret    
80105518:	90                   	nop
80105519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105520:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105525:	c9                   	leave  
80105526:	c3                   	ret    
80105527:	89 f6                	mov    %esi,%esi
80105529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105530 <sys_getpid>:
80105530:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105536:	55                   	push   %ebp
80105537:	89 e5                	mov    %esp,%ebp
80105539:	8b 40 10             	mov    0x10(%eax),%eax
8010553c:	5d                   	pop    %ebp
8010553d:	c3                   	ret    
8010553e:	66 90                	xchg   %ax,%ax

80105540 <sys_sbrk>:
80105540:	55                   	push   %ebp
80105541:	89 e5                	mov    %esp,%ebp
80105543:	53                   	push   %ebx
80105544:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105547:	83 ec 1c             	sub    $0x1c,%esp
8010554a:	50                   	push   %eax
8010554b:	6a 00                	push   $0x0
8010554d:	e8 1e f2 ff ff       	call   80104770 <argint>
80105552:	83 c4 10             	add    $0x10,%esp
80105555:	85 c0                	test   %eax,%eax
80105557:	78 27                	js     80105580 <sys_sbrk+0x40>
80105559:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010555f:	83 ec 0c             	sub    $0xc,%esp
80105562:	8b 18                	mov    (%eax),%ebx
80105564:	ff 75 f4             	pushl  -0xc(%ebp)
80105567:	e8 f4 e3 ff ff       	call   80103960 <growproc>
8010556c:	83 c4 10             	add    $0x10,%esp
8010556f:	85 c0                	test   %eax,%eax
80105571:	78 0d                	js     80105580 <sys_sbrk+0x40>
80105573:	89 d8                	mov    %ebx,%eax
80105575:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105578:	c9                   	leave  
80105579:	c3                   	ret    
8010557a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105580:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105585:	eb ee                	jmp    80105575 <sys_sbrk+0x35>
80105587:	89 f6                	mov    %esi,%esi
80105589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105590 <sys_sleep>:
80105590:	55                   	push   %ebp
80105591:	89 e5                	mov    %esp,%ebp
80105593:	53                   	push   %ebx
80105594:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105597:	83 ec 1c             	sub    $0x1c,%esp
8010559a:	50                   	push   %eax
8010559b:	6a 00                	push   $0x0
8010559d:	e8 ce f1 ff ff       	call   80104770 <argint>
801055a2:	83 c4 10             	add    $0x10,%esp
801055a5:	85 c0                	test   %eax,%eax
801055a7:	0f 88 8a 00 00 00    	js     80105637 <sys_sleep+0xa7>
801055ad:	83 ec 0c             	sub    $0xc,%esp
801055b0:	68 e0 4c 11 80       	push   $0x80114ce0
801055b5:	e8 96 ec ff ff       	call   80104250 <acquire>
801055ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
801055bd:	83 c4 10             	add    $0x10,%esp
801055c0:	8b 1d 20 55 11 80    	mov    0x80115520,%ebx
801055c6:	85 d2                	test   %edx,%edx
801055c8:	75 27                	jne    801055f1 <sys_sleep+0x61>
801055ca:	eb 54                	jmp    80105620 <sys_sleep+0x90>
801055cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801055d0:	83 ec 08             	sub    $0x8,%esp
801055d3:	68 e0 4c 11 80       	push   $0x80114ce0
801055d8:	68 20 55 11 80       	push   $0x80115520
801055dd:	e8 ee e7 ff ff       	call   80103dd0 <sleep>
801055e2:	a1 20 55 11 80       	mov    0x80115520,%eax
801055e7:	83 c4 10             	add    $0x10,%esp
801055ea:	29 d8                	sub    %ebx,%eax
801055ec:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801055ef:	73 2f                	jae    80105620 <sys_sleep+0x90>
801055f1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801055f7:	8b 40 24             	mov    0x24(%eax),%eax
801055fa:	85 c0                	test   %eax,%eax
801055fc:	74 d2                	je     801055d0 <sys_sleep+0x40>
801055fe:	83 ec 0c             	sub    $0xc,%esp
80105601:	68 e0 4c 11 80       	push   $0x80114ce0
80105606:	e8 25 ee ff ff       	call   80104430 <release>
8010560b:	83 c4 10             	add    $0x10,%esp
8010560e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105613:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105616:	c9                   	leave  
80105617:	c3                   	ret    
80105618:	90                   	nop
80105619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105620:	83 ec 0c             	sub    $0xc,%esp
80105623:	68 e0 4c 11 80       	push   $0x80114ce0
80105628:	e8 03 ee ff ff       	call   80104430 <release>
8010562d:	83 c4 10             	add    $0x10,%esp
80105630:	31 c0                	xor    %eax,%eax
80105632:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105635:	c9                   	leave  
80105636:	c3                   	ret    
80105637:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010563c:	eb d5                	jmp    80105613 <sys_sleep+0x83>
8010563e:	66 90                	xchg   %ax,%ax

80105640 <sys_uptime>:
80105640:	55                   	push   %ebp
80105641:	89 e5                	mov    %esp,%ebp
80105643:	53                   	push   %ebx
80105644:	83 ec 10             	sub    $0x10,%esp
80105647:	68 e0 4c 11 80       	push   $0x80114ce0
8010564c:	e8 ff eb ff ff       	call   80104250 <acquire>
80105651:	8b 1d 20 55 11 80    	mov    0x80115520,%ebx
80105657:	c7 04 24 e0 4c 11 80 	movl   $0x80114ce0,(%esp)
8010565e:	e8 cd ed ff ff       	call   80104430 <release>
80105663:	89 d8                	mov    %ebx,%eax
80105665:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105668:	c9                   	leave  
80105669:	c3                   	ret    
8010566a:	66 90                	xchg   %ax,%ax
8010566c:	66 90                	xchg   %ax,%ax
8010566e:	66 90                	xchg   %ax,%ax

80105670 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
80105670:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105671:	ba 43 00 00 00       	mov    $0x43,%edx
80105676:	89 e5                	mov    %esp,%ebp
80105678:	b8 34 00 00 00       	mov    $0x34,%eax
8010567d:	83 ec 18             	sub    $0x18,%esp
80105680:	ee                   	out    %al,(%dx)
80105681:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
80105686:	b2 40                	mov    $0x40,%dl
80105688:	ee                   	out    %al,(%dx)
80105689:	b8 2e 00 00 00       	mov    $0x2e,%eax
8010568e:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
8010568f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105696:	e8 e5 db ff ff       	call   80103280 <picenable>
}
8010569b:	c9                   	leave  
8010569c:	c3                   	ret    

8010569d <alltraps>:
8010569d:	1e                   	push   %ds
8010569e:	06                   	push   %es
8010569f:	0f a0                	push   %fs
801056a1:	0f a8                	push   %gs
801056a3:	60                   	pusha  
801056a4:	66 b8 10 00          	mov    $0x10,%ax
801056a8:	8e d8                	mov    %eax,%ds
801056aa:	8e c0                	mov    %eax,%es
801056ac:	66 b8 18 00          	mov    $0x18,%ax
801056b0:	8e e0                	mov    %eax,%fs
801056b2:	8e e8                	mov    %eax,%gs
801056b4:	54                   	push   %esp
801056b5:	e8 e6 00 00 00       	call   801057a0 <trap>
801056ba:	83 c4 04             	add    $0x4,%esp

801056bd <trapret>:
801056bd:	61                   	popa   
801056be:	0f a9                	pop    %gs
801056c0:	0f a1                	pop    %fs
801056c2:	07                   	pop    %es
801056c3:	1f                   	pop    %ds
801056c4:	83 c4 08             	add    $0x8,%esp
801056c7:	cf                   	iret   
801056c8:	66 90                	xchg   %ax,%ax
801056ca:	66 90                	xchg   %ax,%ax
801056cc:	66 90                	xchg   %ax,%ax
801056ce:	66 90                	xchg   %ax,%ax

801056d0 <tvinit>:
801056d0:	31 c0                	xor    %eax,%eax
801056d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801056d8:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
801056df:	b9 08 00 00 00       	mov    $0x8,%ecx
801056e4:	c6 04 c5 24 4d 11 80 	movb   $0x0,-0x7feeb2dc(,%eax,8)
801056eb:	00 
801056ec:	66 89 0c c5 22 4d 11 	mov    %cx,-0x7feeb2de(,%eax,8)
801056f3:	80 
801056f4:	c6 04 c5 25 4d 11 80 	movb   $0x8e,-0x7feeb2db(,%eax,8)
801056fb:	8e 
801056fc:	66 89 14 c5 20 4d 11 	mov    %dx,-0x7feeb2e0(,%eax,8)
80105703:	80 
80105704:	c1 ea 10             	shr    $0x10,%edx
80105707:	66 89 14 c5 26 4d 11 	mov    %dx,-0x7feeb2da(,%eax,8)
8010570e:	80 
8010570f:	83 c0 01             	add    $0x1,%eax
80105712:	3d 00 01 00 00       	cmp    $0x100,%eax
80105717:	75 bf                	jne    801056d8 <tvinit+0x8>
80105719:	55                   	push   %ebp
8010571a:	ba 08 00 00 00       	mov    $0x8,%edx
8010571f:	89 e5                	mov    %esp,%ebp
80105721:	83 ec 10             	sub    $0x10,%esp
80105724:	a1 0c a1 10 80       	mov    0x8010a10c,%eax
80105729:	68 b9 76 10 80       	push   $0x801076b9
8010572e:	68 e0 4c 11 80       	push   $0x80114ce0
80105733:	66 89 15 22 4f 11 80 	mov    %dx,0x80114f22
8010573a:	c6 05 24 4f 11 80 00 	movb   $0x0,0x80114f24
80105741:	66 a3 20 4f 11 80    	mov    %ax,0x80114f20
80105747:	c1 e8 10             	shr    $0x10,%eax
8010574a:	c6 05 25 4f 11 80 ef 	movb   $0xef,0x80114f25
80105751:	66 a3 26 4f 11 80    	mov    %ax,0x80114f26
80105757:	e8 d4 ea ff ff       	call   80104230 <initlock>
8010575c:	83 c4 10             	add    $0x10,%esp
8010575f:	c9                   	leave  
80105760:	c3                   	ret    
80105761:	eb 0d                	jmp    80105770 <idtinit>
80105763:	90                   	nop
80105764:	90                   	nop
80105765:	90                   	nop
80105766:	90                   	nop
80105767:	90                   	nop
80105768:	90                   	nop
80105769:	90                   	nop
8010576a:	90                   	nop
8010576b:	90                   	nop
8010576c:	90                   	nop
8010576d:	90                   	nop
8010576e:	90                   	nop
8010576f:	90                   	nop

80105770 <idtinit>:
80105770:	55                   	push   %ebp
80105771:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105776:	89 e5                	mov    %esp,%ebp
80105778:	83 ec 10             	sub    $0x10,%esp
8010577b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
8010577f:	b8 20 4d 11 80       	mov    $0x80114d20,%eax
80105784:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105788:	c1 e8 10             	shr    $0x10,%eax
8010578b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
8010578f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105792:	0f 01 18             	lidtl  (%eax)
80105795:	c9                   	leave  
80105796:	c3                   	ret    
80105797:	89 f6                	mov    %esi,%esi
80105799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057a0 <trap>:
801057a0:	55                   	push   %ebp
801057a1:	89 e5                	mov    %esp,%ebp
801057a3:	57                   	push   %edi
801057a4:	56                   	push   %esi
801057a5:	53                   	push   %ebx
801057a6:	83 ec 0c             	sub    $0xc,%esp
801057a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801057ac:	8b 43 30             	mov    0x30(%ebx),%eax
801057af:	83 f8 40             	cmp    $0x40,%eax
801057b2:	0f 84 f8 00 00 00    	je     801058b0 <trap+0x110>
801057b8:	83 e8 20             	sub    $0x20,%eax
801057bb:	83 f8 1f             	cmp    $0x1f,%eax
801057be:	77 68                	ja     80105828 <trap+0x88>
801057c0:	ff 24 85 60 77 10 80 	jmp    *-0x7fef88a0(,%eax,4)
801057c7:	89 f6                	mov    %esi,%esi
801057c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801057d0:	e8 fb ce ff ff       	call   801026d0 <cpunum>
801057d5:	85 c0                	test   %eax,%eax
801057d7:	0f 84 b3 01 00 00    	je     80105990 <trap+0x1f0>
801057dd:	e8 8e cf ff ff       	call   80102770 <lapiceoi>
801057e2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801057e8:	85 c0                	test   %eax,%eax
801057ea:	74 2d                	je     80105819 <trap+0x79>
801057ec:	8b 50 24             	mov    0x24(%eax),%edx
801057ef:	85 d2                	test   %edx,%edx
801057f1:	0f 85 86 00 00 00    	jne    8010587d <trap+0xdd>
801057f7:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801057fb:	0f 84 ef 00 00 00    	je     801058f0 <trap+0x150>
80105801:	8b 40 24             	mov    0x24(%eax),%eax
80105804:	85 c0                	test   %eax,%eax
80105806:	74 11                	je     80105819 <trap+0x79>
80105808:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
8010580c:	83 e0 03             	and    $0x3,%eax
8010580f:	66 83 f8 03          	cmp    $0x3,%ax
80105813:	0f 84 c1 00 00 00    	je     801058da <trap+0x13a>
80105819:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010581c:	5b                   	pop    %ebx
8010581d:	5e                   	pop    %esi
8010581e:	5f                   	pop    %edi
8010581f:	5d                   	pop    %ebp
80105820:	c3                   	ret    
80105821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105828:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
8010582f:	85 c9                	test   %ecx,%ecx
80105831:	0f 84 8d 01 00 00    	je     801059c4 <trap+0x224>
80105837:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
8010583b:	0f 84 83 01 00 00    	je     801059c4 <trap+0x224>
80105841:	0f 20 d7             	mov    %cr2,%edi
80105844:	8b 73 38             	mov    0x38(%ebx),%esi
80105847:	e8 84 ce ff ff       	call   801026d0 <cpunum>
8010584c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105853:	57                   	push   %edi
80105854:	56                   	push   %esi
80105855:	50                   	push   %eax
80105856:	ff 73 34             	pushl  0x34(%ebx)
80105859:	ff 73 30             	pushl  0x30(%ebx)
8010585c:	8d 42 6c             	lea    0x6c(%edx),%eax
8010585f:	50                   	push   %eax
80105860:	ff 72 10             	pushl  0x10(%edx)
80105863:	68 1c 77 10 80       	push   $0x8010771c
80105868:	e8 f3 ad ff ff       	call   80100660 <cprintf>
8010586d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105873:	83 c4 20             	add    $0x20,%esp
80105876:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010587d:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105881:	83 e2 03             	and    $0x3,%edx
80105884:	66 83 fa 03          	cmp    $0x3,%dx
80105888:	0f 85 69 ff ff ff    	jne    801057f7 <trap+0x57>
8010588e:	e8 ad e3 ff ff       	call   80103c40 <exit>
80105893:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105899:	85 c0                	test   %eax,%eax
8010589b:	0f 85 56 ff ff ff    	jne    801057f7 <trap+0x57>
801058a1:	e9 73 ff ff ff       	jmp    80105819 <trap+0x79>
801058a6:	8d 76 00             	lea    0x0(%esi),%esi
801058a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801058b0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801058b6:	8b 70 24             	mov    0x24(%eax),%esi
801058b9:	85 f6                	test   %esi,%esi
801058bb:	0f 85 bf 00 00 00    	jne    80105980 <trap+0x1e0>
801058c1:	89 58 18             	mov    %ebx,0x18(%eax)
801058c4:	e8 b7 ef ff ff       	call   80104880 <syscall>
801058c9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801058cf:	8b 58 24             	mov    0x24(%eax),%ebx
801058d2:	85 db                	test   %ebx,%ebx
801058d4:	0f 84 3f ff ff ff    	je     80105819 <trap+0x79>
801058da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058dd:	5b                   	pop    %ebx
801058de:	5e                   	pop    %esi
801058df:	5f                   	pop    %edi
801058e0:	5d                   	pop    %ebp
801058e1:	e9 5a e3 ff ff       	jmp    80103c40 <exit>
801058e6:	8d 76 00             	lea    0x0(%esi),%esi
801058e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801058f0:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
801058f4:	0f 85 07 ff ff ff    	jne    80105801 <trap+0x61>
801058fa:	e8 91 e4 ff ff       	call   80103d90 <yield>
801058ff:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105905:	85 c0                	test   %eax,%eax
80105907:	0f 85 f4 fe ff ff    	jne    80105801 <trap+0x61>
8010590d:	e9 07 ff ff ff       	jmp    80105819 <trap+0x79>
80105912:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105918:	e8 93 cc ff ff       	call   801025b0 <kbdintr>
8010591d:	e8 4e ce ff ff       	call   80102770 <lapiceoi>
80105922:	e9 bb fe ff ff       	jmp    801057e2 <trap+0x42>
80105927:	89 f6                	mov    %esi,%esi
80105929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105930:	e8 2b 02 00 00       	call   80105b60 <uartintr>
80105935:	e9 a3 fe ff ff       	jmp    801057dd <trap+0x3d>
8010593a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105940:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105944:	8b 7b 38             	mov    0x38(%ebx),%edi
80105947:	e8 84 cd ff ff       	call   801026d0 <cpunum>
8010594c:	57                   	push   %edi
8010594d:	56                   	push   %esi
8010594e:	50                   	push   %eax
8010594f:	68 c4 76 10 80       	push   $0x801076c4
80105954:	e8 07 ad ff ff       	call   80100660 <cprintf>
80105959:	e8 12 ce ff ff       	call   80102770 <lapiceoi>
8010595e:	83 c4 10             	add    $0x10,%esp
80105961:	e9 7c fe ff ff       	jmp    801057e2 <trap+0x42>
80105966:	8d 76 00             	lea    0x0(%esi),%esi
80105969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105970:	e8 ab c6 ff ff       	call   80102020 <ideintr>
80105975:	e8 f6 cd ff ff       	call   80102770 <lapiceoi>
8010597a:	e9 63 fe ff ff       	jmp    801057e2 <trap+0x42>
8010597f:	90                   	nop
80105980:	e8 bb e2 ff ff       	call   80103c40 <exit>
80105985:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010598b:	e9 31 ff ff ff       	jmp    801058c1 <trap+0x121>
80105990:	83 ec 0c             	sub    $0xc,%esp
80105993:	68 e0 4c 11 80       	push   $0x80114ce0
80105998:	e8 b3 e8 ff ff       	call   80104250 <acquire>
8010599d:	c7 04 24 20 55 11 80 	movl   $0x80115520,(%esp)
801059a4:	83 05 20 55 11 80 01 	addl   $0x1,0x80115520
801059ab:	e8 c0 e5 ff ff       	call   80103f70 <wakeup>
801059b0:	c7 04 24 e0 4c 11 80 	movl   $0x80114ce0,(%esp)
801059b7:	e8 74 ea ff ff       	call   80104430 <release>
801059bc:	83 c4 10             	add    $0x10,%esp
801059bf:	e9 19 fe ff ff       	jmp    801057dd <trap+0x3d>
801059c4:	0f 20 d7             	mov    %cr2,%edi
801059c7:	8b 73 38             	mov    0x38(%ebx),%esi
801059ca:	e8 01 cd ff ff       	call   801026d0 <cpunum>
801059cf:	83 ec 0c             	sub    $0xc,%esp
801059d2:	57                   	push   %edi
801059d3:	56                   	push   %esi
801059d4:	50                   	push   %eax
801059d5:	ff 73 30             	pushl  0x30(%ebx)
801059d8:	68 e8 76 10 80       	push   $0x801076e8
801059dd:	e8 7e ac ff ff       	call   80100660 <cprintf>
801059e2:	83 c4 14             	add    $0x14,%esp
801059e5:	68 be 76 10 80       	push   $0x801076be
801059ea:	e8 81 a9 ff ff       	call   80100370 <panic>
801059ef:	90                   	nop

801059f0 <uartgetc>:
801059f0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
801059f5:	55                   	push   %ebp
801059f6:	89 e5                	mov    %esp,%ebp
801059f8:	85 c0                	test   %eax,%eax
801059fa:	74 1c                	je     80105a18 <uartgetc+0x28>
801059fc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a01:	ec                   	in     (%dx),%al
80105a02:	a8 01                	test   $0x1,%al
80105a04:	74 12                	je     80105a18 <uartgetc+0x28>
80105a06:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a0b:	ec                   	in     (%dx),%al
80105a0c:	0f b6 c0             	movzbl %al,%eax
80105a0f:	5d                   	pop    %ebp
80105a10:	c3                   	ret    
80105a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a1d:	5d                   	pop    %ebp
80105a1e:	c3                   	ret    
80105a1f:	90                   	nop

80105a20 <uartputc.part.0>:
80105a20:	55                   	push   %ebp
80105a21:	89 e5                	mov    %esp,%ebp
80105a23:	57                   	push   %edi
80105a24:	56                   	push   %esi
80105a25:	53                   	push   %ebx
80105a26:	89 c7                	mov    %eax,%edi
80105a28:	bb 80 00 00 00       	mov    $0x80,%ebx
80105a2d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105a32:	83 ec 0c             	sub    $0xc,%esp
80105a35:	eb 1b                	jmp    80105a52 <uartputc.part.0+0x32>
80105a37:	89 f6                	mov    %esi,%esi
80105a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105a40:	83 ec 0c             	sub    $0xc,%esp
80105a43:	6a 0a                	push   $0xa
80105a45:	e8 46 cd ff ff       	call   80102790 <microdelay>
80105a4a:	83 c4 10             	add    $0x10,%esp
80105a4d:	83 eb 01             	sub    $0x1,%ebx
80105a50:	74 07                	je     80105a59 <uartputc.part.0+0x39>
80105a52:	89 f2                	mov    %esi,%edx
80105a54:	ec                   	in     (%dx),%al
80105a55:	a8 20                	test   $0x20,%al
80105a57:	74 e7                	je     80105a40 <uartputc.part.0+0x20>
80105a59:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a5e:	89 f8                	mov    %edi,%eax
80105a60:	ee                   	out    %al,(%dx)
80105a61:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a64:	5b                   	pop    %ebx
80105a65:	5e                   	pop    %esi
80105a66:	5f                   	pop    %edi
80105a67:	5d                   	pop    %ebp
80105a68:	c3                   	ret    
80105a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105a70 <uartinit>:
80105a70:	55                   	push   %ebp
80105a71:	31 c9                	xor    %ecx,%ecx
80105a73:	89 c8                	mov    %ecx,%eax
80105a75:	89 e5                	mov    %esp,%ebp
80105a77:	57                   	push   %edi
80105a78:	56                   	push   %esi
80105a79:	53                   	push   %ebx
80105a7a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105a7f:	89 da                	mov    %ebx,%edx
80105a81:	83 ec 0c             	sub    $0xc,%esp
80105a84:	ee                   	out    %al,(%dx)
80105a85:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105a8a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105a8f:	89 fa                	mov    %edi,%edx
80105a91:	ee                   	out    %al,(%dx)
80105a92:	b8 0c 00 00 00       	mov    $0xc,%eax
80105a97:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a9c:	ee                   	out    %al,(%dx)
80105a9d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105aa2:	89 c8                	mov    %ecx,%eax
80105aa4:	89 f2                	mov    %esi,%edx
80105aa6:	ee                   	out    %al,(%dx)
80105aa7:	b8 03 00 00 00       	mov    $0x3,%eax
80105aac:	89 fa                	mov    %edi,%edx
80105aae:	ee                   	out    %al,(%dx)
80105aaf:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105ab4:	89 c8                	mov    %ecx,%eax
80105ab6:	ee                   	out    %al,(%dx)
80105ab7:	b8 01 00 00 00       	mov    $0x1,%eax
80105abc:	89 f2                	mov    %esi,%edx
80105abe:	ee                   	out    %al,(%dx)
80105abf:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ac4:	ec                   	in     (%dx),%al
80105ac5:	3c ff                	cmp    $0xff,%al
80105ac7:	74 5a                	je     80105b23 <uartinit+0xb3>
80105ac9:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105ad0:	00 00 00 
80105ad3:	89 da                	mov    %ebx,%edx
80105ad5:	ec                   	in     (%dx),%al
80105ad6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105adb:	ec                   	in     (%dx),%al
80105adc:	83 ec 0c             	sub    $0xc,%esp
80105adf:	6a 04                	push   $0x4
80105ae1:	e8 9a d7 ff ff       	call   80103280 <picenable>
80105ae6:	59                   	pop    %ecx
80105ae7:	5b                   	pop    %ebx
80105ae8:	6a 00                	push   $0x0
80105aea:	6a 04                	push   $0x4
80105aec:	bb e0 77 10 80       	mov    $0x801077e0,%ebx
80105af1:	e8 8a c7 ff ff       	call   80102280 <ioapicenable>
80105af6:	83 c4 10             	add    $0x10,%esp
80105af9:	b8 78 00 00 00       	mov    $0x78,%eax
80105afe:	eb 0a                	jmp    80105b0a <uartinit+0x9a>
80105b00:	83 c3 01             	add    $0x1,%ebx
80105b03:	0f be 03             	movsbl (%ebx),%eax
80105b06:	84 c0                	test   %al,%al
80105b08:	74 19                	je     80105b23 <uartinit+0xb3>
80105b0a:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105b10:	85 d2                	test   %edx,%edx
80105b12:	74 ec                	je     80105b00 <uartinit+0x90>
80105b14:	83 c3 01             	add    $0x1,%ebx
80105b17:	e8 04 ff ff ff       	call   80105a20 <uartputc.part.0>
80105b1c:	0f be 03             	movsbl (%ebx),%eax
80105b1f:	84 c0                	test   %al,%al
80105b21:	75 e7                	jne    80105b0a <uartinit+0x9a>
80105b23:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b26:	5b                   	pop    %ebx
80105b27:	5e                   	pop    %esi
80105b28:	5f                   	pop    %edi
80105b29:	5d                   	pop    %ebp
80105b2a:	c3                   	ret    
80105b2b:	90                   	nop
80105b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105b30 <uartputc>:
80105b30:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105b36:	55                   	push   %ebp
80105b37:	89 e5                	mov    %esp,%ebp
80105b39:	85 d2                	test   %edx,%edx
80105b3b:	8b 45 08             	mov    0x8(%ebp),%eax
80105b3e:	74 10                	je     80105b50 <uartputc+0x20>
80105b40:	5d                   	pop    %ebp
80105b41:	e9 da fe ff ff       	jmp    80105a20 <uartputc.part.0>
80105b46:	8d 76 00             	lea    0x0(%esi),%esi
80105b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b50:	5d                   	pop    %ebp
80105b51:	c3                   	ret    
80105b52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b60 <uartintr>:
80105b60:	55                   	push   %ebp
80105b61:	89 e5                	mov    %esp,%ebp
80105b63:	83 ec 14             	sub    $0x14,%esp
80105b66:	68 f0 59 10 80       	push   $0x801059f0
80105b6b:	e8 80 ac ff ff       	call   801007f0 <consoleintr>
80105b70:	83 c4 10             	add    $0x10,%esp
80105b73:	c9                   	leave  
80105b74:	c3                   	ret    

80105b75 <vector0>:
80105b75:	6a 00                	push   $0x0
80105b77:	6a 00                	push   $0x0
80105b79:	e9 1f fb ff ff       	jmp    8010569d <alltraps>

80105b7e <vector1>:
80105b7e:	6a 00                	push   $0x0
80105b80:	6a 01                	push   $0x1
80105b82:	e9 16 fb ff ff       	jmp    8010569d <alltraps>

80105b87 <vector2>:
80105b87:	6a 00                	push   $0x0
80105b89:	6a 02                	push   $0x2
80105b8b:	e9 0d fb ff ff       	jmp    8010569d <alltraps>

80105b90 <vector3>:
80105b90:	6a 00                	push   $0x0
80105b92:	6a 03                	push   $0x3
80105b94:	e9 04 fb ff ff       	jmp    8010569d <alltraps>

80105b99 <vector4>:
80105b99:	6a 00                	push   $0x0
80105b9b:	6a 04                	push   $0x4
80105b9d:	e9 fb fa ff ff       	jmp    8010569d <alltraps>

80105ba2 <vector5>:
80105ba2:	6a 00                	push   $0x0
80105ba4:	6a 05                	push   $0x5
80105ba6:	e9 f2 fa ff ff       	jmp    8010569d <alltraps>

80105bab <vector6>:
80105bab:	6a 00                	push   $0x0
80105bad:	6a 06                	push   $0x6
80105baf:	e9 e9 fa ff ff       	jmp    8010569d <alltraps>

80105bb4 <vector7>:
80105bb4:	6a 00                	push   $0x0
80105bb6:	6a 07                	push   $0x7
80105bb8:	e9 e0 fa ff ff       	jmp    8010569d <alltraps>

80105bbd <vector8>:
80105bbd:	6a 08                	push   $0x8
80105bbf:	e9 d9 fa ff ff       	jmp    8010569d <alltraps>

80105bc4 <vector9>:
80105bc4:	6a 00                	push   $0x0
80105bc6:	6a 09                	push   $0x9
80105bc8:	e9 d0 fa ff ff       	jmp    8010569d <alltraps>

80105bcd <vector10>:
80105bcd:	6a 0a                	push   $0xa
80105bcf:	e9 c9 fa ff ff       	jmp    8010569d <alltraps>

80105bd4 <vector11>:
80105bd4:	6a 0b                	push   $0xb
80105bd6:	e9 c2 fa ff ff       	jmp    8010569d <alltraps>

80105bdb <vector12>:
80105bdb:	6a 0c                	push   $0xc
80105bdd:	e9 bb fa ff ff       	jmp    8010569d <alltraps>

80105be2 <vector13>:
80105be2:	6a 0d                	push   $0xd
80105be4:	e9 b4 fa ff ff       	jmp    8010569d <alltraps>

80105be9 <vector14>:
80105be9:	6a 0e                	push   $0xe
80105beb:	e9 ad fa ff ff       	jmp    8010569d <alltraps>

80105bf0 <vector15>:
80105bf0:	6a 00                	push   $0x0
80105bf2:	6a 0f                	push   $0xf
80105bf4:	e9 a4 fa ff ff       	jmp    8010569d <alltraps>

80105bf9 <vector16>:
80105bf9:	6a 00                	push   $0x0
80105bfb:	6a 10                	push   $0x10
80105bfd:	e9 9b fa ff ff       	jmp    8010569d <alltraps>

80105c02 <vector17>:
80105c02:	6a 11                	push   $0x11
80105c04:	e9 94 fa ff ff       	jmp    8010569d <alltraps>

80105c09 <vector18>:
80105c09:	6a 00                	push   $0x0
80105c0b:	6a 12                	push   $0x12
80105c0d:	e9 8b fa ff ff       	jmp    8010569d <alltraps>

80105c12 <vector19>:
80105c12:	6a 00                	push   $0x0
80105c14:	6a 13                	push   $0x13
80105c16:	e9 82 fa ff ff       	jmp    8010569d <alltraps>

80105c1b <vector20>:
80105c1b:	6a 00                	push   $0x0
80105c1d:	6a 14                	push   $0x14
80105c1f:	e9 79 fa ff ff       	jmp    8010569d <alltraps>

80105c24 <vector21>:
80105c24:	6a 00                	push   $0x0
80105c26:	6a 15                	push   $0x15
80105c28:	e9 70 fa ff ff       	jmp    8010569d <alltraps>

80105c2d <vector22>:
80105c2d:	6a 00                	push   $0x0
80105c2f:	6a 16                	push   $0x16
80105c31:	e9 67 fa ff ff       	jmp    8010569d <alltraps>

80105c36 <vector23>:
80105c36:	6a 00                	push   $0x0
80105c38:	6a 17                	push   $0x17
80105c3a:	e9 5e fa ff ff       	jmp    8010569d <alltraps>

80105c3f <vector24>:
80105c3f:	6a 00                	push   $0x0
80105c41:	6a 18                	push   $0x18
80105c43:	e9 55 fa ff ff       	jmp    8010569d <alltraps>

80105c48 <vector25>:
80105c48:	6a 00                	push   $0x0
80105c4a:	6a 19                	push   $0x19
80105c4c:	e9 4c fa ff ff       	jmp    8010569d <alltraps>

80105c51 <vector26>:
80105c51:	6a 00                	push   $0x0
80105c53:	6a 1a                	push   $0x1a
80105c55:	e9 43 fa ff ff       	jmp    8010569d <alltraps>

80105c5a <vector27>:
80105c5a:	6a 00                	push   $0x0
80105c5c:	6a 1b                	push   $0x1b
80105c5e:	e9 3a fa ff ff       	jmp    8010569d <alltraps>

80105c63 <vector28>:
80105c63:	6a 00                	push   $0x0
80105c65:	6a 1c                	push   $0x1c
80105c67:	e9 31 fa ff ff       	jmp    8010569d <alltraps>

80105c6c <vector29>:
80105c6c:	6a 00                	push   $0x0
80105c6e:	6a 1d                	push   $0x1d
80105c70:	e9 28 fa ff ff       	jmp    8010569d <alltraps>

80105c75 <vector30>:
80105c75:	6a 00                	push   $0x0
80105c77:	6a 1e                	push   $0x1e
80105c79:	e9 1f fa ff ff       	jmp    8010569d <alltraps>

80105c7e <vector31>:
80105c7e:	6a 00                	push   $0x0
80105c80:	6a 1f                	push   $0x1f
80105c82:	e9 16 fa ff ff       	jmp    8010569d <alltraps>

80105c87 <vector32>:
80105c87:	6a 00                	push   $0x0
80105c89:	6a 20                	push   $0x20
80105c8b:	e9 0d fa ff ff       	jmp    8010569d <alltraps>

80105c90 <vector33>:
80105c90:	6a 00                	push   $0x0
80105c92:	6a 21                	push   $0x21
80105c94:	e9 04 fa ff ff       	jmp    8010569d <alltraps>

80105c99 <vector34>:
80105c99:	6a 00                	push   $0x0
80105c9b:	6a 22                	push   $0x22
80105c9d:	e9 fb f9 ff ff       	jmp    8010569d <alltraps>

80105ca2 <vector35>:
80105ca2:	6a 00                	push   $0x0
80105ca4:	6a 23                	push   $0x23
80105ca6:	e9 f2 f9 ff ff       	jmp    8010569d <alltraps>

80105cab <vector36>:
80105cab:	6a 00                	push   $0x0
80105cad:	6a 24                	push   $0x24
80105caf:	e9 e9 f9 ff ff       	jmp    8010569d <alltraps>

80105cb4 <vector37>:
80105cb4:	6a 00                	push   $0x0
80105cb6:	6a 25                	push   $0x25
80105cb8:	e9 e0 f9 ff ff       	jmp    8010569d <alltraps>

80105cbd <vector38>:
80105cbd:	6a 00                	push   $0x0
80105cbf:	6a 26                	push   $0x26
80105cc1:	e9 d7 f9 ff ff       	jmp    8010569d <alltraps>

80105cc6 <vector39>:
80105cc6:	6a 00                	push   $0x0
80105cc8:	6a 27                	push   $0x27
80105cca:	e9 ce f9 ff ff       	jmp    8010569d <alltraps>

80105ccf <vector40>:
80105ccf:	6a 00                	push   $0x0
80105cd1:	6a 28                	push   $0x28
80105cd3:	e9 c5 f9 ff ff       	jmp    8010569d <alltraps>

80105cd8 <vector41>:
80105cd8:	6a 00                	push   $0x0
80105cda:	6a 29                	push   $0x29
80105cdc:	e9 bc f9 ff ff       	jmp    8010569d <alltraps>

80105ce1 <vector42>:
80105ce1:	6a 00                	push   $0x0
80105ce3:	6a 2a                	push   $0x2a
80105ce5:	e9 b3 f9 ff ff       	jmp    8010569d <alltraps>

80105cea <vector43>:
80105cea:	6a 00                	push   $0x0
80105cec:	6a 2b                	push   $0x2b
80105cee:	e9 aa f9 ff ff       	jmp    8010569d <alltraps>

80105cf3 <vector44>:
80105cf3:	6a 00                	push   $0x0
80105cf5:	6a 2c                	push   $0x2c
80105cf7:	e9 a1 f9 ff ff       	jmp    8010569d <alltraps>

80105cfc <vector45>:
80105cfc:	6a 00                	push   $0x0
80105cfe:	6a 2d                	push   $0x2d
80105d00:	e9 98 f9 ff ff       	jmp    8010569d <alltraps>

80105d05 <vector46>:
80105d05:	6a 00                	push   $0x0
80105d07:	6a 2e                	push   $0x2e
80105d09:	e9 8f f9 ff ff       	jmp    8010569d <alltraps>

80105d0e <vector47>:
80105d0e:	6a 00                	push   $0x0
80105d10:	6a 2f                	push   $0x2f
80105d12:	e9 86 f9 ff ff       	jmp    8010569d <alltraps>

80105d17 <vector48>:
80105d17:	6a 00                	push   $0x0
80105d19:	6a 30                	push   $0x30
80105d1b:	e9 7d f9 ff ff       	jmp    8010569d <alltraps>

80105d20 <vector49>:
80105d20:	6a 00                	push   $0x0
80105d22:	6a 31                	push   $0x31
80105d24:	e9 74 f9 ff ff       	jmp    8010569d <alltraps>

80105d29 <vector50>:
80105d29:	6a 00                	push   $0x0
80105d2b:	6a 32                	push   $0x32
80105d2d:	e9 6b f9 ff ff       	jmp    8010569d <alltraps>

80105d32 <vector51>:
80105d32:	6a 00                	push   $0x0
80105d34:	6a 33                	push   $0x33
80105d36:	e9 62 f9 ff ff       	jmp    8010569d <alltraps>

80105d3b <vector52>:
80105d3b:	6a 00                	push   $0x0
80105d3d:	6a 34                	push   $0x34
80105d3f:	e9 59 f9 ff ff       	jmp    8010569d <alltraps>

80105d44 <vector53>:
80105d44:	6a 00                	push   $0x0
80105d46:	6a 35                	push   $0x35
80105d48:	e9 50 f9 ff ff       	jmp    8010569d <alltraps>

80105d4d <vector54>:
80105d4d:	6a 00                	push   $0x0
80105d4f:	6a 36                	push   $0x36
80105d51:	e9 47 f9 ff ff       	jmp    8010569d <alltraps>

80105d56 <vector55>:
80105d56:	6a 00                	push   $0x0
80105d58:	6a 37                	push   $0x37
80105d5a:	e9 3e f9 ff ff       	jmp    8010569d <alltraps>

80105d5f <vector56>:
80105d5f:	6a 00                	push   $0x0
80105d61:	6a 38                	push   $0x38
80105d63:	e9 35 f9 ff ff       	jmp    8010569d <alltraps>

80105d68 <vector57>:
80105d68:	6a 00                	push   $0x0
80105d6a:	6a 39                	push   $0x39
80105d6c:	e9 2c f9 ff ff       	jmp    8010569d <alltraps>

80105d71 <vector58>:
80105d71:	6a 00                	push   $0x0
80105d73:	6a 3a                	push   $0x3a
80105d75:	e9 23 f9 ff ff       	jmp    8010569d <alltraps>

80105d7a <vector59>:
80105d7a:	6a 00                	push   $0x0
80105d7c:	6a 3b                	push   $0x3b
80105d7e:	e9 1a f9 ff ff       	jmp    8010569d <alltraps>

80105d83 <vector60>:
80105d83:	6a 00                	push   $0x0
80105d85:	6a 3c                	push   $0x3c
80105d87:	e9 11 f9 ff ff       	jmp    8010569d <alltraps>

80105d8c <vector61>:
80105d8c:	6a 00                	push   $0x0
80105d8e:	6a 3d                	push   $0x3d
80105d90:	e9 08 f9 ff ff       	jmp    8010569d <alltraps>

80105d95 <vector62>:
80105d95:	6a 00                	push   $0x0
80105d97:	6a 3e                	push   $0x3e
80105d99:	e9 ff f8 ff ff       	jmp    8010569d <alltraps>

80105d9e <vector63>:
80105d9e:	6a 00                	push   $0x0
80105da0:	6a 3f                	push   $0x3f
80105da2:	e9 f6 f8 ff ff       	jmp    8010569d <alltraps>

80105da7 <vector64>:
80105da7:	6a 00                	push   $0x0
80105da9:	6a 40                	push   $0x40
80105dab:	e9 ed f8 ff ff       	jmp    8010569d <alltraps>

80105db0 <vector65>:
80105db0:	6a 00                	push   $0x0
80105db2:	6a 41                	push   $0x41
80105db4:	e9 e4 f8 ff ff       	jmp    8010569d <alltraps>

80105db9 <vector66>:
80105db9:	6a 00                	push   $0x0
80105dbb:	6a 42                	push   $0x42
80105dbd:	e9 db f8 ff ff       	jmp    8010569d <alltraps>

80105dc2 <vector67>:
80105dc2:	6a 00                	push   $0x0
80105dc4:	6a 43                	push   $0x43
80105dc6:	e9 d2 f8 ff ff       	jmp    8010569d <alltraps>

80105dcb <vector68>:
80105dcb:	6a 00                	push   $0x0
80105dcd:	6a 44                	push   $0x44
80105dcf:	e9 c9 f8 ff ff       	jmp    8010569d <alltraps>

80105dd4 <vector69>:
80105dd4:	6a 00                	push   $0x0
80105dd6:	6a 45                	push   $0x45
80105dd8:	e9 c0 f8 ff ff       	jmp    8010569d <alltraps>

80105ddd <vector70>:
80105ddd:	6a 00                	push   $0x0
80105ddf:	6a 46                	push   $0x46
80105de1:	e9 b7 f8 ff ff       	jmp    8010569d <alltraps>

80105de6 <vector71>:
80105de6:	6a 00                	push   $0x0
80105de8:	6a 47                	push   $0x47
80105dea:	e9 ae f8 ff ff       	jmp    8010569d <alltraps>

80105def <vector72>:
80105def:	6a 00                	push   $0x0
80105df1:	6a 48                	push   $0x48
80105df3:	e9 a5 f8 ff ff       	jmp    8010569d <alltraps>

80105df8 <vector73>:
80105df8:	6a 00                	push   $0x0
80105dfa:	6a 49                	push   $0x49
80105dfc:	e9 9c f8 ff ff       	jmp    8010569d <alltraps>

80105e01 <vector74>:
80105e01:	6a 00                	push   $0x0
80105e03:	6a 4a                	push   $0x4a
80105e05:	e9 93 f8 ff ff       	jmp    8010569d <alltraps>

80105e0a <vector75>:
80105e0a:	6a 00                	push   $0x0
80105e0c:	6a 4b                	push   $0x4b
80105e0e:	e9 8a f8 ff ff       	jmp    8010569d <alltraps>

80105e13 <vector76>:
80105e13:	6a 00                	push   $0x0
80105e15:	6a 4c                	push   $0x4c
80105e17:	e9 81 f8 ff ff       	jmp    8010569d <alltraps>

80105e1c <vector77>:
80105e1c:	6a 00                	push   $0x0
80105e1e:	6a 4d                	push   $0x4d
80105e20:	e9 78 f8 ff ff       	jmp    8010569d <alltraps>

80105e25 <vector78>:
80105e25:	6a 00                	push   $0x0
80105e27:	6a 4e                	push   $0x4e
80105e29:	e9 6f f8 ff ff       	jmp    8010569d <alltraps>

80105e2e <vector79>:
80105e2e:	6a 00                	push   $0x0
80105e30:	6a 4f                	push   $0x4f
80105e32:	e9 66 f8 ff ff       	jmp    8010569d <alltraps>

80105e37 <vector80>:
80105e37:	6a 00                	push   $0x0
80105e39:	6a 50                	push   $0x50
80105e3b:	e9 5d f8 ff ff       	jmp    8010569d <alltraps>

80105e40 <vector81>:
80105e40:	6a 00                	push   $0x0
80105e42:	6a 51                	push   $0x51
80105e44:	e9 54 f8 ff ff       	jmp    8010569d <alltraps>

80105e49 <vector82>:
80105e49:	6a 00                	push   $0x0
80105e4b:	6a 52                	push   $0x52
80105e4d:	e9 4b f8 ff ff       	jmp    8010569d <alltraps>

80105e52 <vector83>:
80105e52:	6a 00                	push   $0x0
80105e54:	6a 53                	push   $0x53
80105e56:	e9 42 f8 ff ff       	jmp    8010569d <alltraps>

80105e5b <vector84>:
80105e5b:	6a 00                	push   $0x0
80105e5d:	6a 54                	push   $0x54
80105e5f:	e9 39 f8 ff ff       	jmp    8010569d <alltraps>

80105e64 <vector85>:
80105e64:	6a 00                	push   $0x0
80105e66:	6a 55                	push   $0x55
80105e68:	e9 30 f8 ff ff       	jmp    8010569d <alltraps>

80105e6d <vector86>:
80105e6d:	6a 00                	push   $0x0
80105e6f:	6a 56                	push   $0x56
80105e71:	e9 27 f8 ff ff       	jmp    8010569d <alltraps>

80105e76 <vector87>:
80105e76:	6a 00                	push   $0x0
80105e78:	6a 57                	push   $0x57
80105e7a:	e9 1e f8 ff ff       	jmp    8010569d <alltraps>

80105e7f <vector88>:
80105e7f:	6a 00                	push   $0x0
80105e81:	6a 58                	push   $0x58
80105e83:	e9 15 f8 ff ff       	jmp    8010569d <alltraps>

80105e88 <vector89>:
80105e88:	6a 00                	push   $0x0
80105e8a:	6a 59                	push   $0x59
80105e8c:	e9 0c f8 ff ff       	jmp    8010569d <alltraps>

80105e91 <vector90>:
80105e91:	6a 00                	push   $0x0
80105e93:	6a 5a                	push   $0x5a
80105e95:	e9 03 f8 ff ff       	jmp    8010569d <alltraps>

80105e9a <vector91>:
80105e9a:	6a 00                	push   $0x0
80105e9c:	6a 5b                	push   $0x5b
80105e9e:	e9 fa f7 ff ff       	jmp    8010569d <alltraps>

80105ea3 <vector92>:
80105ea3:	6a 00                	push   $0x0
80105ea5:	6a 5c                	push   $0x5c
80105ea7:	e9 f1 f7 ff ff       	jmp    8010569d <alltraps>

80105eac <vector93>:
80105eac:	6a 00                	push   $0x0
80105eae:	6a 5d                	push   $0x5d
80105eb0:	e9 e8 f7 ff ff       	jmp    8010569d <alltraps>

80105eb5 <vector94>:
80105eb5:	6a 00                	push   $0x0
80105eb7:	6a 5e                	push   $0x5e
80105eb9:	e9 df f7 ff ff       	jmp    8010569d <alltraps>

80105ebe <vector95>:
80105ebe:	6a 00                	push   $0x0
80105ec0:	6a 5f                	push   $0x5f
80105ec2:	e9 d6 f7 ff ff       	jmp    8010569d <alltraps>

80105ec7 <vector96>:
80105ec7:	6a 00                	push   $0x0
80105ec9:	6a 60                	push   $0x60
80105ecb:	e9 cd f7 ff ff       	jmp    8010569d <alltraps>

80105ed0 <vector97>:
80105ed0:	6a 00                	push   $0x0
80105ed2:	6a 61                	push   $0x61
80105ed4:	e9 c4 f7 ff ff       	jmp    8010569d <alltraps>

80105ed9 <vector98>:
80105ed9:	6a 00                	push   $0x0
80105edb:	6a 62                	push   $0x62
80105edd:	e9 bb f7 ff ff       	jmp    8010569d <alltraps>

80105ee2 <vector99>:
80105ee2:	6a 00                	push   $0x0
80105ee4:	6a 63                	push   $0x63
80105ee6:	e9 b2 f7 ff ff       	jmp    8010569d <alltraps>

80105eeb <vector100>:
80105eeb:	6a 00                	push   $0x0
80105eed:	6a 64                	push   $0x64
80105eef:	e9 a9 f7 ff ff       	jmp    8010569d <alltraps>

80105ef4 <vector101>:
80105ef4:	6a 00                	push   $0x0
80105ef6:	6a 65                	push   $0x65
80105ef8:	e9 a0 f7 ff ff       	jmp    8010569d <alltraps>

80105efd <vector102>:
80105efd:	6a 00                	push   $0x0
80105eff:	6a 66                	push   $0x66
80105f01:	e9 97 f7 ff ff       	jmp    8010569d <alltraps>

80105f06 <vector103>:
80105f06:	6a 00                	push   $0x0
80105f08:	6a 67                	push   $0x67
80105f0a:	e9 8e f7 ff ff       	jmp    8010569d <alltraps>

80105f0f <vector104>:
80105f0f:	6a 00                	push   $0x0
80105f11:	6a 68                	push   $0x68
80105f13:	e9 85 f7 ff ff       	jmp    8010569d <alltraps>

80105f18 <vector105>:
80105f18:	6a 00                	push   $0x0
80105f1a:	6a 69                	push   $0x69
80105f1c:	e9 7c f7 ff ff       	jmp    8010569d <alltraps>

80105f21 <vector106>:
80105f21:	6a 00                	push   $0x0
80105f23:	6a 6a                	push   $0x6a
80105f25:	e9 73 f7 ff ff       	jmp    8010569d <alltraps>

80105f2a <vector107>:
80105f2a:	6a 00                	push   $0x0
80105f2c:	6a 6b                	push   $0x6b
80105f2e:	e9 6a f7 ff ff       	jmp    8010569d <alltraps>

80105f33 <vector108>:
80105f33:	6a 00                	push   $0x0
80105f35:	6a 6c                	push   $0x6c
80105f37:	e9 61 f7 ff ff       	jmp    8010569d <alltraps>

80105f3c <vector109>:
80105f3c:	6a 00                	push   $0x0
80105f3e:	6a 6d                	push   $0x6d
80105f40:	e9 58 f7 ff ff       	jmp    8010569d <alltraps>

80105f45 <vector110>:
80105f45:	6a 00                	push   $0x0
80105f47:	6a 6e                	push   $0x6e
80105f49:	e9 4f f7 ff ff       	jmp    8010569d <alltraps>

80105f4e <vector111>:
80105f4e:	6a 00                	push   $0x0
80105f50:	6a 6f                	push   $0x6f
80105f52:	e9 46 f7 ff ff       	jmp    8010569d <alltraps>

80105f57 <vector112>:
80105f57:	6a 00                	push   $0x0
80105f59:	6a 70                	push   $0x70
80105f5b:	e9 3d f7 ff ff       	jmp    8010569d <alltraps>

80105f60 <vector113>:
80105f60:	6a 00                	push   $0x0
80105f62:	6a 71                	push   $0x71
80105f64:	e9 34 f7 ff ff       	jmp    8010569d <alltraps>

80105f69 <vector114>:
80105f69:	6a 00                	push   $0x0
80105f6b:	6a 72                	push   $0x72
80105f6d:	e9 2b f7 ff ff       	jmp    8010569d <alltraps>

80105f72 <vector115>:
80105f72:	6a 00                	push   $0x0
80105f74:	6a 73                	push   $0x73
80105f76:	e9 22 f7 ff ff       	jmp    8010569d <alltraps>

80105f7b <vector116>:
80105f7b:	6a 00                	push   $0x0
80105f7d:	6a 74                	push   $0x74
80105f7f:	e9 19 f7 ff ff       	jmp    8010569d <alltraps>

80105f84 <vector117>:
80105f84:	6a 00                	push   $0x0
80105f86:	6a 75                	push   $0x75
80105f88:	e9 10 f7 ff ff       	jmp    8010569d <alltraps>

80105f8d <vector118>:
80105f8d:	6a 00                	push   $0x0
80105f8f:	6a 76                	push   $0x76
80105f91:	e9 07 f7 ff ff       	jmp    8010569d <alltraps>

80105f96 <vector119>:
80105f96:	6a 00                	push   $0x0
80105f98:	6a 77                	push   $0x77
80105f9a:	e9 fe f6 ff ff       	jmp    8010569d <alltraps>

80105f9f <vector120>:
80105f9f:	6a 00                	push   $0x0
80105fa1:	6a 78                	push   $0x78
80105fa3:	e9 f5 f6 ff ff       	jmp    8010569d <alltraps>

80105fa8 <vector121>:
80105fa8:	6a 00                	push   $0x0
80105faa:	6a 79                	push   $0x79
80105fac:	e9 ec f6 ff ff       	jmp    8010569d <alltraps>

80105fb1 <vector122>:
80105fb1:	6a 00                	push   $0x0
80105fb3:	6a 7a                	push   $0x7a
80105fb5:	e9 e3 f6 ff ff       	jmp    8010569d <alltraps>

80105fba <vector123>:
80105fba:	6a 00                	push   $0x0
80105fbc:	6a 7b                	push   $0x7b
80105fbe:	e9 da f6 ff ff       	jmp    8010569d <alltraps>

80105fc3 <vector124>:
80105fc3:	6a 00                	push   $0x0
80105fc5:	6a 7c                	push   $0x7c
80105fc7:	e9 d1 f6 ff ff       	jmp    8010569d <alltraps>

80105fcc <vector125>:
80105fcc:	6a 00                	push   $0x0
80105fce:	6a 7d                	push   $0x7d
80105fd0:	e9 c8 f6 ff ff       	jmp    8010569d <alltraps>

80105fd5 <vector126>:
80105fd5:	6a 00                	push   $0x0
80105fd7:	6a 7e                	push   $0x7e
80105fd9:	e9 bf f6 ff ff       	jmp    8010569d <alltraps>

80105fde <vector127>:
80105fde:	6a 00                	push   $0x0
80105fe0:	6a 7f                	push   $0x7f
80105fe2:	e9 b6 f6 ff ff       	jmp    8010569d <alltraps>

80105fe7 <vector128>:
80105fe7:	6a 00                	push   $0x0
80105fe9:	68 80 00 00 00       	push   $0x80
80105fee:	e9 aa f6 ff ff       	jmp    8010569d <alltraps>

80105ff3 <vector129>:
80105ff3:	6a 00                	push   $0x0
80105ff5:	68 81 00 00 00       	push   $0x81
80105ffa:	e9 9e f6 ff ff       	jmp    8010569d <alltraps>

80105fff <vector130>:
80105fff:	6a 00                	push   $0x0
80106001:	68 82 00 00 00       	push   $0x82
80106006:	e9 92 f6 ff ff       	jmp    8010569d <alltraps>

8010600b <vector131>:
8010600b:	6a 00                	push   $0x0
8010600d:	68 83 00 00 00       	push   $0x83
80106012:	e9 86 f6 ff ff       	jmp    8010569d <alltraps>

80106017 <vector132>:
80106017:	6a 00                	push   $0x0
80106019:	68 84 00 00 00       	push   $0x84
8010601e:	e9 7a f6 ff ff       	jmp    8010569d <alltraps>

80106023 <vector133>:
80106023:	6a 00                	push   $0x0
80106025:	68 85 00 00 00       	push   $0x85
8010602a:	e9 6e f6 ff ff       	jmp    8010569d <alltraps>

8010602f <vector134>:
8010602f:	6a 00                	push   $0x0
80106031:	68 86 00 00 00       	push   $0x86
80106036:	e9 62 f6 ff ff       	jmp    8010569d <alltraps>

8010603b <vector135>:
8010603b:	6a 00                	push   $0x0
8010603d:	68 87 00 00 00       	push   $0x87
80106042:	e9 56 f6 ff ff       	jmp    8010569d <alltraps>

80106047 <vector136>:
80106047:	6a 00                	push   $0x0
80106049:	68 88 00 00 00       	push   $0x88
8010604e:	e9 4a f6 ff ff       	jmp    8010569d <alltraps>

80106053 <vector137>:
80106053:	6a 00                	push   $0x0
80106055:	68 89 00 00 00       	push   $0x89
8010605a:	e9 3e f6 ff ff       	jmp    8010569d <alltraps>

8010605f <vector138>:
8010605f:	6a 00                	push   $0x0
80106061:	68 8a 00 00 00       	push   $0x8a
80106066:	e9 32 f6 ff ff       	jmp    8010569d <alltraps>

8010606b <vector139>:
8010606b:	6a 00                	push   $0x0
8010606d:	68 8b 00 00 00       	push   $0x8b
80106072:	e9 26 f6 ff ff       	jmp    8010569d <alltraps>

80106077 <vector140>:
80106077:	6a 00                	push   $0x0
80106079:	68 8c 00 00 00       	push   $0x8c
8010607e:	e9 1a f6 ff ff       	jmp    8010569d <alltraps>

80106083 <vector141>:
80106083:	6a 00                	push   $0x0
80106085:	68 8d 00 00 00       	push   $0x8d
8010608a:	e9 0e f6 ff ff       	jmp    8010569d <alltraps>

8010608f <vector142>:
8010608f:	6a 00                	push   $0x0
80106091:	68 8e 00 00 00       	push   $0x8e
80106096:	e9 02 f6 ff ff       	jmp    8010569d <alltraps>

8010609b <vector143>:
8010609b:	6a 00                	push   $0x0
8010609d:	68 8f 00 00 00       	push   $0x8f
801060a2:	e9 f6 f5 ff ff       	jmp    8010569d <alltraps>

801060a7 <vector144>:
801060a7:	6a 00                	push   $0x0
801060a9:	68 90 00 00 00       	push   $0x90
801060ae:	e9 ea f5 ff ff       	jmp    8010569d <alltraps>

801060b3 <vector145>:
801060b3:	6a 00                	push   $0x0
801060b5:	68 91 00 00 00       	push   $0x91
801060ba:	e9 de f5 ff ff       	jmp    8010569d <alltraps>

801060bf <vector146>:
801060bf:	6a 00                	push   $0x0
801060c1:	68 92 00 00 00       	push   $0x92
801060c6:	e9 d2 f5 ff ff       	jmp    8010569d <alltraps>

801060cb <vector147>:
801060cb:	6a 00                	push   $0x0
801060cd:	68 93 00 00 00       	push   $0x93
801060d2:	e9 c6 f5 ff ff       	jmp    8010569d <alltraps>

801060d7 <vector148>:
801060d7:	6a 00                	push   $0x0
801060d9:	68 94 00 00 00       	push   $0x94
801060de:	e9 ba f5 ff ff       	jmp    8010569d <alltraps>

801060e3 <vector149>:
801060e3:	6a 00                	push   $0x0
801060e5:	68 95 00 00 00       	push   $0x95
801060ea:	e9 ae f5 ff ff       	jmp    8010569d <alltraps>

801060ef <vector150>:
801060ef:	6a 00                	push   $0x0
801060f1:	68 96 00 00 00       	push   $0x96
801060f6:	e9 a2 f5 ff ff       	jmp    8010569d <alltraps>

801060fb <vector151>:
801060fb:	6a 00                	push   $0x0
801060fd:	68 97 00 00 00       	push   $0x97
80106102:	e9 96 f5 ff ff       	jmp    8010569d <alltraps>

80106107 <vector152>:
80106107:	6a 00                	push   $0x0
80106109:	68 98 00 00 00       	push   $0x98
8010610e:	e9 8a f5 ff ff       	jmp    8010569d <alltraps>

80106113 <vector153>:
80106113:	6a 00                	push   $0x0
80106115:	68 99 00 00 00       	push   $0x99
8010611a:	e9 7e f5 ff ff       	jmp    8010569d <alltraps>

8010611f <vector154>:
8010611f:	6a 00                	push   $0x0
80106121:	68 9a 00 00 00       	push   $0x9a
80106126:	e9 72 f5 ff ff       	jmp    8010569d <alltraps>

8010612b <vector155>:
8010612b:	6a 00                	push   $0x0
8010612d:	68 9b 00 00 00       	push   $0x9b
80106132:	e9 66 f5 ff ff       	jmp    8010569d <alltraps>

80106137 <vector156>:
80106137:	6a 00                	push   $0x0
80106139:	68 9c 00 00 00       	push   $0x9c
8010613e:	e9 5a f5 ff ff       	jmp    8010569d <alltraps>

80106143 <vector157>:
80106143:	6a 00                	push   $0x0
80106145:	68 9d 00 00 00       	push   $0x9d
8010614a:	e9 4e f5 ff ff       	jmp    8010569d <alltraps>

8010614f <vector158>:
8010614f:	6a 00                	push   $0x0
80106151:	68 9e 00 00 00       	push   $0x9e
80106156:	e9 42 f5 ff ff       	jmp    8010569d <alltraps>

8010615b <vector159>:
8010615b:	6a 00                	push   $0x0
8010615d:	68 9f 00 00 00       	push   $0x9f
80106162:	e9 36 f5 ff ff       	jmp    8010569d <alltraps>

80106167 <vector160>:
80106167:	6a 00                	push   $0x0
80106169:	68 a0 00 00 00       	push   $0xa0
8010616e:	e9 2a f5 ff ff       	jmp    8010569d <alltraps>

80106173 <vector161>:
80106173:	6a 00                	push   $0x0
80106175:	68 a1 00 00 00       	push   $0xa1
8010617a:	e9 1e f5 ff ff       	jmp    8010569d <alltraps>

8010617f <vector162>:
8010617f:	6a 00                	push   $0x0
80106181:	68 a2 00 00 00       	push   $0xa2
80106186:	e9 12 f5 ff ff       	jmp    8010569d <alltraps>

8010618b <vector163>:
8010618b:	6a 00                	push   $0x0
8010618d:	68 a3 00 00 00       	push   $0xa3
80106192:	e9 06 f5 ff ff       	jmp    8010569d <alltraps>

80106197 <vector164>:
80106197:	6a 00                	push   $0x0
80106199:	68 a4 00 00 00       	push   $0xa4
8010619e:	e9 fa f4 ff ff       	jmp    8010569d <alltraps>

801061a3 <vector165>:
801061a3:	6a 00                	push   $0x0
801061a5:	68 a5 00 00 00       	push   $0xa5
801061aa:	e9 ee f4 ff ff       	jmp    8010569d <alltraps>

801061af <vector166>:
801061af:	6a 00                	push   $0x0
801061b1:	68 a6 00 00 00       	push   $0xa6
801061b6:	e9 e2 f4 ff ff       	jmp    8010569d <alltraps>

801061bb <vector167>:
801061bb:	6a 00                	push   $0x0
801061bd:	68 a7 00 00 00       	push   $0xa7
801061c2:	e9 d6 f4 ff ff       	jmp    8010569d <alltraps>

801061c7 <vector168>:
801061c7:	6a 00                	push   $0x0
801061c9:	68 a8 00 00 00       	push   $0xa8
801061ce:	e9 ca f4 ff ff       	jmp    8010569d <alltraps>

801061d3 <vector169>:
801061d3:	6a 00                	push   $0x0
801061d5:	68 a9 00 00 00       	push   $0xa9
801061da:	e9 be f4 ff ff       	jmp    8010569d <alltraps>

801061df <vector170>:
801061df:	6a 00                	push   $0x0
801061e1:	68 aa 00 00 00       	push   $0xaa
801061e6:	e9 b2 f4 ff ff       	jmp    8010569d <alltraps>

801061eb <vector171>:
801061eb:	6a 00                	push   $0x0
801061ed:	68 ab 00 00 00       	push   $0xab
801061f2:	e9 a6 f4 ff ff       	jmp    8010569d <alltraps>

801061f7 <vector172>:
801061f7:	6a 00                	push   $0x0
801061f9:	68 ac 00 00 00       	push   $0xac
801061fe:	e9 9a f4 ff ff       	jmp    8010569d <alltraps>

80106203 <vector173>:
80106203:	6a 00                	push   $0x0
80106205:	68 ad 00 00 00       	push   $0xad
8010620a:	e9 8e f4 ff ff       	jmp    8010569d <alltraps>

8010620f <vector174>:
8010620f:	6a 00                	push   $0x0
80106211:	68 ae 00 00 00       	push   $0xae
80106216:	e9 82 f4 ff ff       	jmp    8010569d <alltraps>

8010621b <vector175>:
8010621b:	6a 00                	push   $0x0
8010621d:	68 af 00 00 00       	push   $0xaf
80106222:	e9 76 f4 ff ff       	jmp    8010569d <alltraps>

80106227 <vector176>:
80106227:	6a 00                	push   $0x0
80106229:	68 b0 00 00 00       	push   $0xb0
8010622e:	e9 6a f4 ff ff       	jmp    8010569d <alltraps>

80106233 <vector177>:
80106233:	6a 00                	push   $0x0
80106235:	68 b1 00 00 00       	push   $0xb1
8010623a:	e9 5e f4 ff ff       	jmp    8010569d <alltraps>

8010623f <vector178>:
8010623f:	6a 00                	push   $0x0
80106241:	68 b2 00 00 00       	push   $0xb2
80106246:	e9 52 f4 ff ff       	jmp    8010569d <alltraps>

8010624b <vector179>:
8010624b:	6a 00                	push   $0x0
8010624d:	68 b3 00 00 00       	push   $0xb3
80106252:	e9 46 f4 ff ff       	jmp    8010569d <alltraps>

80106257 <vector180>:
80106257:	6a 00                	push   $0x0
80106259:	68 b4 00 00 00       	push   $0xb4
8010625e:	e9 3a f4 ff ff       	jmp    8010569d <alltraps>

80106263 <vector181>:
80106263:	6a 00                	push   $0x0
80106265:	68 b5 00 00 00       	push   $0xb5
8010626a:	e9 2e f4 ff ff       	jmp    8010569d <alltraps>

8010626f <vector182>:
8010626f:	6a 00                	push   $0x0
80106271:	68 b6 00 00 00       	push   $0xb6
80106276:	e9 22 f4 ff ff       	jmp    8010569d <alltraps>

8010627b <vector183>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 b7 00 00 00       	push   $0xb7
80106282:	e9 16 f4 ff ff       	jmp    8010569d <alltraps>

80106287 <vector184>:
80106287:	6a 00                	push   $0x0
80106289:	68 b8 00 00 00       	push   $0xb8
8010628e:	e9 0a f4 ff ff       	jmp    8010569d <alltraps>

80106293 <vector185>:
80106293:	6a 00                	push   $0x0
80106295:	68 b9 00 00 00       	push   $0xb9
8010629a:	e9 fe f3 ff ff       	jmp    8010569d <alltraps>

8010629f <vector186>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 ba 00 00 00       	push   $0xba
801062a6:	e9 f2 f3 ff ff       	jmp    8010569d <alltraps>

801062ab <vector187>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 bb 00 00 00       	push   $0xbb
801062b2:	e9 e6 f3 ff ff       	jmp    8010569d <alltraps>

801062b7 <vector188>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 bc 00 00 00       	push   $0xbc
801062be:	e9 da f3 ff ff       	jmp    8010569d <alltraps>

801062c3 <vector189>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 bd 00 00 00       	push   $0xbd
801062ca:	e9 ce f3 ff ff       	jmp    8010569d <alltraps>

801062cf <vector190>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 be 00 00 00       	push   $0xbe
801062d6:	e9 c2 f3 ff ff       	jmp    8010569d <alltraps>

801062db <vector191>:
801062db:	6a 00                	push   $0x0
801062dd:	68 bf 00 00 00       	push   $0xbf
801062e2:	e9 b6 f3 ff ff       	jmp    8010569d <alltraps>

801062e7 <vector192>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 c0 00 00 00       	push   $0xc0
801062ee:	e9 aa f3 ff ff       	jmp    8010569d <alltraps>

801062f3 <vector193>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 c1 00 00 00       	push   $0xc1
801062fa:	e9 9e f3 ff ff       	jmp    8010569d <alltraps>

801062ff <vector194>:
801062ff:	6a 00                	push   $0x0
80106301:	68 c2 00 00 00       	push   $0xc2
80106306:	e9 92 f3 ff ff       	jmp    8010569d <alltraps>

8010630b <vector195>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 c3 00 00 00       	push   $0xc3
80106312:	e9 86 f3 ff ff       	jmp    8010569d <alltraps>

80106317 <vector196>:
80106317:	6a 00                	push   $0x0
80106319:	68 c4 00 00 00       	push   $0xc4
8010631e:	e9 7a f3 ff ff       	jmp    8010569d <alltraps>

80106323 <vector197>:
80106323:	6a 00                	push   $0x0
80106325:	68 c5 00 00 00       	push   $0xc5
8010632a:	e9 6e f3 ff ff       	jmp    8010569d <alltraps>

8010632f <vector198>:
8010632f:	6a 00                	push   $0x0
80106331:	68 c6 00 00 00       	push   $0xc6
80106336:	e9 62 f3 ff ff       	jmp    8010569d <alltraps>

8010633b <vector199>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 c7 00 00 00       	push   $0xc7
80106342:	e9 56 f3 ff ff       	jmp    8010569d <alltraps>

80106347 <vector200>:
80106347:	6a 00                	push   $0x0
80106349:	68 c8 00 00 00       	push   $0xc8
8010634e:	e9 4a f3 ff ff       	jmp    8010569d <alltraps>

80106353 <vector201>:
80106353:	6a 00                	push   $0x0
80106355:	68 c9 00 00 00       	push   $0xc9
8010635a:	e9 3e f3 ff ff       	jmp    8010569d <alltraps>

8010635f <vector202>:
8010635f:	6a 00                	push   $0x0
80106361:	68 ca 00 00 00       	push   $0xca
80106366:	e9 32 f3 ff ff       	jmp    8010569d <alltraps>

8010636b <vector203>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 cb 00 00 00       	push   $0xcb
80106372:	e9 26 f3 ff ff       	jmp    8010569d <alltraps>

80106377 <vector204>:
80106377:	6a 00                	push   $0x0
80106379:	68 cc 00 00 00       	push   $0xcc
8010637e:	e9 1a f3 ff ff       	jmp    8010569d <alltraps>

80106383 <vector205>:
80106383:	6a 00                	push   $0x0
80106385:	68 cd 00 00 00       	push   $0xcd
8010638a:	e9 0e f3 ff ff       	jmp    8010569d <alltraps>

8010638f <vector206>:
8010638f:	6a 00                	push   $0x0
80106391:	68 ce 00 00 00       	push   $0xce
80106396:	e9 02 f3 ff ff       	jmp    8010569d <alltraps>

8010639b <vector207>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 cf 00 00 00       	push   $0xcf
801063a2:	e9 f6 f2 ff ff       	jmp    8010569d <alltraps>

801063a7 <vector208>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 d0 00 00 00       	push   $0xd0
801063ae:	e9 ea f2 ff ff       	jmp    8010569d <alltraps>

801063b3 <vector209>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 d1 00 00 00       	push   $0xd1
801063ba:	e9 de f2 ff ff       	jmp    8010569d <alltraps>

801063bf <vector210>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 d2 00 00 00       	push   $0xd2
801063c6:	e9 d2 f2 ff ff       	jmp    8010569d <alltraps>

801063cb <vector211>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 d3 00 00 00       	push   $0xd3
801063d2:	e9 c6 f2 ff ff       	jmp    8010569d <alltraps>

801063d7 <vector212>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 d4 00 00 00       	push   $0xd4
801063de:	e9 ba f2 ff ff       	jmp    8010569d <alltraps>

801063e3 <vector213>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 d5 00 00 00       	push   $0xd5
801063ea:	e9 ae f2 ff ff       	jmp    8010569d <alltraps>

801063ef <vector214>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 d6 00 00 00       	push   $0xd6
801063f6:	e9 a2 f2 ff ff       	jmp    8010569d <alltraps>

801063fb <vector215>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 d7 00 00 00       	push   $0xd7
80106402:	e9 96 f2 ff ff       	jmp    8010569d <alltraps>

80106407 <vector216>:
80106407:	6a 00                	push   $0x0
80106409:	68 d8 00 00 00       	push   $0xd8
8010640e:	e9 8a f2 ff ff       	jmp    8010569d <alltraps>

80106413 <vector217>:
80106413:	6a 00                	push   $0x0
80106415:	68 d9 00 00 00       	push   $0xd9
8010641a:	e9 7e f2 ff ff       	jmp    8010569d <alltraps>

8010641f <vector218>:
8010641f:	6a 00                	push   $0x0
80106421:	68 da 00 00 00       	push   $0xda
80106426:	e9 72 f2 ff ff       	jmp    8010569d <alltraps>

8010642b <vector219>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 db 00 00 00       	push   $0xdb
80106432:	e9 66 f2 ff ff       	jmp    8010569d <alltraps>

80106437 <vector220>:
80106437:	6a 00                	push   $0x0
80106439:	68 dc 00 00 00       	push   $0xdc
8010643e:	e9 5a f2 ff ff       	jmp    8010569d <alltraps>

80106443 <vector221>:
80106443:	6a 00                	push   $0x0
80106445:	68 dd 00 00 00       	push   $0xdd
8010644a:	e9 4e f2 ff ff       	jmp    8010569d <alltraps>

8010644f <vector222>:
8010644f:	6a 00                	push   $0x0
80106451:	68 de 00 00 00       	push   $0xde
80106456:	e9 42 f2 ff ff       	jmp    8010569d <alltraps>

8010645b <vector223>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 df 00 00 00       	push   $0xdf
80106462:	e9 36 f2 ff ff       	jmp    8010569d <alltraps>

80106467 <vector224>:
80106467:	6a 00                	push   $0x0
80106469:	68 e0 00 00 00       	push   $0xe0
8010646e:	e9 2a f2 ff ff       	jmp    8010569d <alltraps>

80106473 <vector225>:
80106473:	6a 00                	push   $0x0
80106475:	68 e1 00 00 00       	push   $0xe1
8010647a:	e9 1e f2 ff ff       	jmp    8010569d <alltraps>

8010647f <vector226>:
8010647f:	6a 00                	push   $0x0
80106481:	68 e2 00 00 00       	push   $0xe2
80106486:	e9 12 f2 ff ff       	jmp    8010569d <alltraps>

8010648b <vector227>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 e3 00 00 00       	push   $0xe3
80106492:	e9 06 f2 ff ff       	jmp    8010569d <alltraps>

80106497 <vector228>:
80106497:	6a 00                	push   $0x0
80106499:	68 e4 00 00 00       	push   $0xe4
8010649e:	e9 fa f1 ff ff       	jmp    8010569d <alltraps>

801064a3 <vector229>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 e5 00 00 00       	push   $0xe5
801064aa:	e9 ee f1 ff ff       	jmp    8010569d <alltraps>

801064af <vector230>:
801064af:	6a 00                	push   $0x0
801064b1:	68 e6 00 00 00       	push   $0xe6
801064b6:	e9 e2 f1 ff ff       	jmp    8010569d <alltraps>

801064bb <vector231>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 e7 00 00 00       	push   $0xe7
801064c2:	e9 d6 f1 ff ff       	jmp    8010569d <alltraps>

801064c7 <vector232>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 e8 00 00 00       	push   $0xe8
801064ce:	e9 ca f1 ff ff       	jmp    8010569d <alltraps>

801064d3 <vector233>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 e9 00 00 00       	push   $0xe9
801064da:	e9 be f1 ff ff       	jmp    8010569d <alltraps>

801064df <vector234>:
801064df:	6a 00                	push   $0x0
801064e1:	68 ea 00 00 00       	push   $0xea
801064e6:	e9 b2 f1 ff ff       	jmp    8010569d <alltraps>

801064eb <vector235>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 eb 00 00 00       	push   $0xeb
801064f2:	e9 a6 f1 ff ff       	jmp    8010569d <alltraps>

801064f7 <vector236>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 ec 00 00 00       	push   $0xec
801064fe:	e9 9a f1 ff ff       	jmp    8010569d <alltraps>

80106503 <vector237>:
80106503:	6a 00                	push   $0x0
80106505:	68 ed 00 00 00       	push   $0xed
8010650a:	e9 8e f1 ff ff       	jmp    8010569d <alltraps>

8010650f <vector238>:
8010650f:	6a 00                	push   $0x0
80106511:	68 ee 00 00 00       	push   $0xee
80106516:	e9 82 f1 ff ff       	jmp    8010569d <alltraps>

8010651b <vector239>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 ef 00 00 00       	push   $0xef
80106522:	e9 76 f1 ff ff       	jmp    8010569d <alltraps>

80106527 <vector240>:
80106527:	6a 00                	push   $0x0
80106529:	68 f0 00 00 00       	push   $0xf0
8010652e:	e9 6a f1 ff ff       	jmp    8010569d <alltraps>

80106533 <vector241>:
80106533:	6a 00                	push   $0x0
80106535:	68 f1 00 00 00       	push   $0xf1
8010653a:	e9 5e f1 ff ff       	jmp    8010569d <alltraps>

8010653f <vector242>:
8010653f:	6a 00                	push   $0x0
80106541:	68 f2 00 00 00       	push   $0xf2
80106546:	e9 52 f1 ff ff       	jmp    8010569d <alltraps>

8010654b <vector243>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 f3 00 00 00       	push   $0xf3
80106552:	e9 46 f1 ff ff       	jmp    8010569d <alltraps>

80106557 <vector244>:
80106557:	6a 00                	push   $0x0
80106559:	68 f4 00 00 00       	push   $0xf4
8010655e:	e9 3a f1 ff ff       	jmp    8010569d <alltraps>

80106563 <vector245>:
80106563:	6a 00                	push   $0x0
80106565:	68 f5 00 00 00       	push   $0xf5
8010656a:	e9 2e f1 ff ff       	jmp    8010569d <alltraps>

8010656f <vector246>:
8010656f:	6a 00                	push   $0x0
80106571:	68 f6 00 00 00       	push   $0xf6
80106576:	e9 22 f1 ff ff       	jmp    8010569d <alltraps>

8010657b <vector247>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 f7 00 00 00       	push   $0xf7
80106582:	e9 16 f1 ff ff       	jmp    8010569d <alltraps>

80106587 <vector248>:
80106587:	6a 00                	push   $0x0
80106589:	68 f8 00 00 00       	push   $0xf8
8010658e:	e9 0a f1 ff ff       	jmp    8010569d <alltraps>

80106593 <vector249>:
80106593:	6a 00                	push   $0x0
80106595:	68 f9 00 00 00       	push   $0xf9
8010659a:	e9 fe f0 ff ff       	jmp    8010569d <alltraps>

8010659f <vector250>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 fa 00 00 00       	push   $0xfa
801065a6:	e9 f2 f0 ff ff       	jmp    8010569d <alltraps>

801065ab <vector251>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 fb 00 00 00       	push   $0xfb
801065b2:	e9 e6 f0 ff ff       	jmp    8010569d <alltraps>

801065b7 <vector252>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 fc 00 00 00       	push   $0xfc
801065be:	e9 da f0 ff ff       	jmp    8010569d <alltraps>

801065c3 <vector253>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 fd 00 00 00       	push   $0xfd
801065ca:	e9 ce f0 ff ff       	jmp    8010569d <alltraps>

801065cf <vector254>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 fe 00 00 00       	push   $0xfe
801065d6:	e9 c2 f0 ff ff       	jmp    8010569d <alltraps>

801065db <vector255>:
801065db:	6a 00                	push   $0x0
801065dd:	68 ff 00 00 00       	push   $0xff
801065e2:	e9 b6 f0 ff ff       	jmp    8010569d <alltraps>
801065e7:	66 90                	xchg   %ax,%ax
801065e9:	66 90                	xchg   %ax,%ax
801065eb:	66 90                	xchg   %ax,%ax
801065ed:	66 90                	xchg   %ax,%ax
801065ef:	90                   	nop

801065f0 <walkpgdir>:
801065f0:	55                   	push   %ebp
801065f1:	89 e5                	mov    %esp,%ebp
801065f3:	57                   	push   %edi
801065f4:	56                   	push   %esi
801065f5:	53                   	push   %ebx
801065f6:	89 d3                	mov    %edx,%ebx
801065f8:	c1 ea 16             	shr    $0x16,%edx
801065fb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
801065fe:	83 ec 0c             	sub    $0xc,%esp
80106601:	8b 07                	mov    (%edi),%eax
80106603:	a8 01                	test   $0x1,%al
80106605:	74 29                	je     80106630 <walkpgdir+0x40>
80106607:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010660c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80106612:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106615:	c1 eb 0a             	shr    $0xa,%ebx
80106618:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010661e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
80106621:	5b                   	pop    %ebx
80106622:	5e                   	pop    %esi
80106623:	5f                   	pop    %edi
80106624:	5d                   	pop    %ebp
80106625:	c3                   	ret    
80106626:	8d 76 00             	lea    0x0(%esi),%esi
80106629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106630:	85 c9                	test   %ecx,%ecx
80106632:	74 2c                	je     80106660 <walkpgdir+0x70>
80106634:	e8 37 be ff ff       	call   80102470 <kalloc>
80106639:	85 c0                	test   %eax,%eax
8010663b:	89 c6                	mov    %eax,%esi
8010663d:	74 21                	je     80106660 <walkpgdir+0x70>
8010663f:	83 ec 04             	sub    $0x4,%esp
80106642:	68 00 10 00 00       	push   $0x1000
80106647:	6a 00                	push   $0x0
80106649:	50                   	push   %eax
8010664a:	e8 31 de ff ff       	call   80104480 <memset>
8010664f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106655:	83 c4 10             	add    $0x10,%esp
80106658:	83 c8 07             	or     $0x7,%eax
8010665b:	89 07                	mov    %eax,(%edi)
8010665d:	eb b3                	jmp    80106612 <walkpgdir+0x22>
8010665f:	90                   	nop
80106660:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106663:	31 c0                	xor    %eax,%eax
80106665:	5b                   	pop    %ebx
80106666:	5e                   	pop    %esi
80106667:	5f                   	pop    %edi
80106668:	5d                   	pop    %ebp
80106669:	c3                   	ret    
8010666a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106670 <mappages>:
80106670:	55                   	push   %ebp
80106671:	89 e5                	mov    %esp,%ebp
80106673:	57                   	push   %edi
80106674:	56                   	push   %esi
80106675:	53                   	push   %ebx
80106676:	89 d3                	mov    %edx,%ebx
80106678:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010667e:	83 ec 1c             	sub    $0x1c,%esp
80106681:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106684:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106688:	8b 7d 08             	mov    0x8(%ebp),%edi
8010668b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106690:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106693:	8b 45 0c             	mov    0xc(%ebp),%eax
80106696:	29 df                	sub    %ebx,%edi
80106698:	83 c8 01             	or     $0x1,%eax
8010669b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010669e:	eb 15                	jmp    801066b5 <mappages+0x45>
801066a0:	f6 00 01             	testb  $0x1,(%eax)
801066a3:	75 45                	jne    801066ea <mappages+0x7a>
801066a5:	0b 75 dc             	or     -0x24(%ebp),%esi
801066a8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
801066ab:	89 30                	mov    %esi,(%eax)
801066ad:	74 31                	je     801066e0 <mappages+0x70>
801066af:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801066b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801066b8:	b9 01 00 00 00       	mov    $0x1,%ecx
801066bd:	89 da                	mov    %ebx,%edx
801066bf:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801066c2:	e8 29 ff ff ff       	call   801065f0 <walkpgdir>
801066c7:	85 c0                	test   %eax,%eax
801066c9:	75 d5                	jne    801066a0 <mappages+0x30>
801066cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801066ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801066d3:	5b                   	pop    %ebx
801066d4:	5e                   	pop    %esi
801066d5:	5f                   	pop    %edi
801066d6:	5d                   	pop    %ebp
801066d7:	c3                   	ret    
801066d8:	90                   	nop
801066d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801066e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801066e3:	31 c0                	xor    %eax,%eax
801066e5:	5b                   	pop    %ebx
801066e6:	5e                   	pop    %esi
801066e7:	5f                   	pop    %edi
801066e8:	5d                   	pop    %ebp
801066e9:	c3                   	ret    
801066ea:	83 ec 0c             	sub    $0xc,%esp
801066ed:	68 e8 77 10 80       	push   $0x801077e8
801066f2:	e8 79 9c ff ff       	call   80100370 <panic>
801066f7:	89 f6                	mov    %esi,%esi
801066f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106700 <deallocuvm.part.0>:
80106700:	55                   	push   %ebp
80106701:	89 e5                	mov    %esp,%ebp
80106703:	57                   	push   %edi
80106704:	56                   	push   %esi
80106705:	53                   	push   %ebx
80106706:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010670c:	89 c7                	mov    %eax,%edi
8010670e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106714:	83 ec 1c             	sub    $0x1c,%esp
80106717:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010671a:	39 d3                	cmp    %edx,%ebx
8010671c:	73 66                	jae    80106784 <deallocuvm.part.0+0x84>
8010671e:	89 d6                	mov    %edx,%esi
80106720:	eb 3d                	jmp    8010675f <deallocuvm.part.0+0x5f>
80106722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106728:	8b 10                	mov    (%eax),%edx
8010672a:	f6 c2 01             	test   $0x1,%dl
8010672d:	74 26                	je     80106755 <deallocuvm.part.0+0x55>
8010672f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106735:	74 58                	je     8010678f <deallocuvm.part.0+0x8f>
80106737:	83 ec 0c             	sub    $0xc,%esp
8010673a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106740:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106743:	52                   	push   %edx
80106744:	e8 77 bb ff ff       	call   801022c0 <kfree>
80106749:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010674c:	83 c4 10             	add    $0x10,%esp
8010674f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106755:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010675b:	39 f3                	cmp    %esi,%ebx
8010675d:	73 25                	jae    80106784 <deallocuvm.part.0+0x84>
8010675f:	31 c9                	xor    %ecx,%ecx
80106761:	89 da                	mov    %ebx,%edx
80106763:	89 f8                	mov    %edi,%eax
80106765:	e8 86 fe ff ff       	call   801065f0 <walkpgdir>
8010676a:	85 c0                	test   %eax,%eax
8010676c:	75 ba                	jne    80106728 <deallocuvm.part.0+0x28>
8010676e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106774:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
8010677a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106780:	39 f3                	cmp    %esi,%ebx
80106782:	72 db                	jb     8010675f <deallocuvm.part.0+0x5f>
80106784:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106787:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010678a:	5b                   	pop    %ebx
8010678b:	5e                   	pop    %esi
8010678c:	5f                   	pop    %edi
8010678d:	5d                   	pop    %ebp
8010678e:	c3                   	ret    
8010678f:	83 ec 0c             	sub    $0xc,%esp
80106792:	68 b2 71 10 80       	push   $0x801071b2
80106797:	e8 d4 9b ff ff       	call   80100370 <panic>
8010679c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801067a0 <seginit>:
801067a0:	55                   	push   %ebp
801067a1:	89 e5                	mov    %esp,%ebp
801067a3:	53                   	push   %ebx
801067a4:	31 db                	xor    %ebx,%ebx
801067a6:	83 ec 14             	sub    $0x14,%esp
801067a9:	e8 22 bf ff ff       	call   801026d0 <cpunum>
801067ae:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
801067b4:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
801067b9:	8d 90 a0 27 11 80    	lea    -0x7feed860(%eax),%edx
801067bf:	c6 80 1d 28 11 80 9a 	movb   $0x9a,-0x7feed7e3(%eax)
801067c6:	c6 80 1e 28 11 80 cf 	movb   $0xcf,-0x7feed7e2(%eax)
801067cd:	c6 80 25 28 11 80 92 	movb   $0x92,-0x7feed7db(%eax)
801067d4:	c6 80 26 28 11 80 cf 	movb   $0xcf,-0x7feed7da(%eax)
801067db:	66 89 4a 78          	mov    %cx,0x78(%edx)
801067df:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
801067e4:	66 89 5a 7a          	mov    %bx,0x7a(%edx)
801067e8:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
801067ef:	31 db                	xor    %ebx,%ebx
801067f1:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
801067f6:	66 89 9a 82 00 00 00 	mov    %bx,0x82(%edx)
801067fd:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
80106804:	31 db                	xor    %ebx,%ebx
80106806:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
8010680b:	66 89 9a 92 00 00 00 	mov    %bx,0x92(%edx)
80106812:	31 db                	xor    %ebx,%ebx
80106814:	66 89 8a 98 00 00 00 	mov    %cx,0x98(%edx)
8010681b:	8d 88 54 28 11 80    	lea    -0x7feed7ac(%eax),%ecx
80106821:	66 89 9a 9a 00 00 00 	mov    %bx,0x9a(%edx)
80106828:	31 db                	xor    %ebx,%ebx
8010682a:	c6 80 35 28 11 80 fa 	movb   $0xfa,-0x7feed7cb(%eax)
80106831:	c6 80 36 28 11 80 cf 	movb   $0xcf,-0x7feed7ca(%eax)
80106838:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
8010683f:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
80106846:	89 cb                	mov    %ecx,%ebx
80106848:	c1 e9 18             	shr    $0x18,%ecx
8010684b:	c6 80 3d 28 11 80 f2 	movb   $0xf2,-0x7feed7c3(%eax)
80106852:	c6 80 3e 28 11 80 cf 	movb   $0xcf,-0x7feed7c2(%eax)
80106859:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
8010685f:	c6 80 2d 28 11 80 92 	movb   $0x92,-0x7feed7d3(%eax)
80106866:	b9 37 00 00 00       	mov    $0x37,%ecx
8010686b:	c6 80 2e 28 11 80 c0 	movb   $0xc0,-0x7feed7d2(%eax)
80106872:	05 10 28 11 80       	add    $0x80112810,%eax
80106877:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
8010687b:	c1 eb 10             	shr    $0x10,%ebx
8010687e:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106882:	c1 e8 10             	shr    $0x10,%eax
80106885:	c6 42 7c 00          	movb   $0x0,0x7c(%edx)
80106889:	c6 42 7f 00          	movb   $0x0,0x7f(%edx)
8010688d:	c6 82 84 00 00 00 00 	movb   $0x0,0x84(%edx)
80106894:	c6 82 87 00 00 00 00 	movb   $0x0,0x87(%edx)
8010689b:	c6 82 94 00 00 00 00 	movb   $0x0,0x94(%edx)
801068a2:	c6 82 97 00 00 00 00 	movb   $0x0,0x97(%edx)
801068a9:	c6 82 9c 00 00 00 00 	movb   $0x0,0x9c(%edx)
801068b0:	c6 82 9f 00 00 00 00 	movb   $0x0,0x9f(%edx)
801068b7:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
801068bd:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
801068c1:	8d 45 f2             	lea    -0xe(%ebp),%eax
801068c4:	0f 01 10             	lgdtl  (%eax)
801068c7:	b8 18 00 00 00       	mov    $0x18,%eax
801068cc:	8e e8                	mov    %eax,%gs
801068ce:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
801068d5:	00 00 00 00 
801068d9:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
801068e0:	83 c4 14             	add    $0x14,%esp
801068e3:	5b                   	pop    %ebx
801068e4:	5d                   	pop    %ebp
801068e5:	c3                   	ret    
801068e6:	8d 76 00             	lea    0x0(%esi),%esi
801068e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068f0 <setupkvm>:
801068f0:	55                   	push   %ebp
801068f1:	89 e5                	mov    %esp,%ebp
801068f3:	56                   	push   %esi
801068f4:	53                   	push   %ebx
801068f5:	e8 76 bb ff ff       	call   80102470 <kalloc>
801068fa:	85 c0                	test   %eax,%eax
801068fc:	74 52                	je     80106950 <setupkvm+0x60>
801068fe:	83 ec 04             	sub    $0x4,%esp
80106901:	89 c6                	mov    %eax,%esi
80106903:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106908:	68 00 10 00 00       	push   $0x1000
8010690d:	6a 00                	push   $0x0
8010690f:	50                   	push   %eax
80106910:	e8 6b db ff ff       	call   80104480 <memset>
80106915:	83 c4 10             	add    $0x10,%esp
80106918:	8b 43 04             	mov    0x4(%ebx),%eax
8010691b:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010691e:	83 ec 08             	sub    $0x8,%esp
80106921:	8b 13                	mov    (%ebx),%edx
80106923:	ff 73 0c             	pushl  0xc(%ebx)
80106926:	50                   	push   %eax
80106927:	29 c1                	sub    %eax,%ecx
80106929:	89 f0                	mov    %esi,%eax
8010692b:	e8 40 fd ff ff       	call   80106670 <mappages>
80106930:	83 c4 10             	add    $0x10,%esp
80106933:	85 c0                	test   %eax,%eax
80106935:	78 19                	js     80106950 <setupkvm+0x60>
80106937:	83 c3 10             	add    $0x10,%ebx
8010693a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106940:	75 d6                	jne    80106918 <setupkvm+0x28>
80106942:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106945:	89 f0                	mov    %esi,%eax
80106947:	5b                   	pop    %ebx
80106948:	5e                   	pop    %esi
80106949:	5d                   	pop    %ebp
8010694a:	c3                   	ret    
8010694b:	90                   	nop
8010694c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106950:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106953:	31 c0                	xor    %eax,%eax
80106955:	5b                   	pop    %ebx
80106956:	5e                   	pop    %esi
80106957:	5d                   	pop    %ebp
80106958:	c3                   	ret    
80106959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106960 <kvmalloc>:
80106960:	55                   	push   %ebp
80106961:	89 e5                	mov    %esp,%ebp
80106963:	83 ec 08             	sub    $0x8,%esp
80106966:	e8 85 ff ff ff       	call   801068f0 <setupkvm>
8010696b:	a3 24 55 11 80       	mov    %eax,0x80115524
80106970:	05 00 00 00 80       	add    $0x80000000,%eax
80106975:	0f 22 d8             	mov    %eax,%cr3
80106978:	c9                   	leave  
80106979:	c3                   	ret    
8010697a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106980 <switchkvm>:
80106980:	a1 24 55 11 80       	mov    0x80115524,%eax
80106985:	55                   	push   %ebp
80106986:	89 e5                	mov    %esp,%ebp
80106988:	05 00 00 00 80       	add    $0x80000000,%eax
8010698d:	0f 22 d8             	mov    %eax,%cr3
80106990:	5d                   	pop    %ebp
80106991:	c3                   	ret    
80106992:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801069a0 <switchuvm>:
801069a0:	55                   	push   %ebp
801069a1:	89 e5                	mov    %esp,%ebp
801069a3:	53                   	push   %ebx
801069a4:	83 ec 04             	sub    $0x4,%esp
801069a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801069aa:	85 db                	test   %ebx,%ebx
801069ac:	0f 84 93 00 00 00    	je     80106a45 <switchuvm+0xa5>
801069b2:	8b 43 08             	mov    0x8(%ebx),%eax
801069b5:	85 c0                	test   %eax,%eax
801069b7:	0f 84 a2 00 00 00    	je     80106a5f <switchuvm+0xbf>
801069bd:	8b 43 04             	mov    0x4(%ebx),%eax
801069c0:	85 c0                	test   %eax,%eax
801069c2:	0f 84 8a 00 00 00    	je     80106a52 <switchuvm+0xb2>
801069c8:	e8 e3 d9 ff ff       	call   801043b0 <pushcli>
801069cd:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801069d3:	b9 67 00 00 00       	mov    $0x67,%ecx
801069d8:	8d 50 08             	lea    0x8(%eax),%edx
801069db:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
801069e2:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
801069e9:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
801069f0:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
801069f7:	89 d1                	mov    %edx,%ecx
801069f9:	c1 ea 18             	shr    $0x18,%edx
801069fc:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106a02:	c1 e9 10             	shr    $0x10,%ecx
80106a05:	ba 10 00 00 00       	mov    $0x10,%edx
80106a0a:	66 89 50 10          	mov    %dx,0x10(%eax)
80106a0e:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
80106a14:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106a17:	8d 91 00 10 00 00    	lea    0x1000(%ecx),%edx
80106a1d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106a22:	66 89 48 6e          	mov    %cx,0x6e(%eax)
80106a26:	89 50 0c             	mov    %edx,0xc(%eax)
80106a29:	b8 30 00 00 00       	mov    $0x30,%eax
80106a2e:	0f 00 d8             	ltr    %ax
80106a31:	8b 43 04             	mov    0x4(%ebx),%eax
80106a34:	05 00 00 00 80       	add    $0x80000000,%eax
80106a39:	0f 22 d8             	mov    %eax,%cr3
80106a3c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106a3f:	c9                   	leave  
80106a40:	e9 9b d9 ff ff       	jmp    801043e0 <popcli>
80106a45:	83 ec 0c             	sub    $0xc,%esp
80106a48:	68 ee 77 10 80       	push   $0x801077ee
80106a4d:	e8 1e 99 ff ff       	call   80100370 <panic>
80106a52:	83 ec 0c             	sub    $0xc,%esp
80106a55:	68 19 78 10 80       	push   $0x80107819
80106a5a:	e8 11 99 ff ff       	call   80100370 <panic>
80106a5f:	83 ec 0c             	sub    $0xc,%esp
80106a62:	68 04 78 10 80       	push   $0x80107804
80106a67:	e8 04 99 ff ff       	call   80100370 <panic>
80106a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106a70 <inituvm>:
80106a70:	55                   	push   %ebp
80106a71:	89 e5                	mov    %esp,%ebp
80106a73:	57                   	push   %edi
80106a74:	56                   	push   %esi
80106a75:	53                   	push   %ebx
80106a76:	83 ec 1c             	sub    $0x1c,%esp
80106a79:	8b 75 10             	mov    0x10(%ebp),%esi
80106a7c:	8b 45 08             	mov    0x8(%ebp),%eax
80106a7f:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106a82:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106a88:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106a8b:	77 49                	ja     80106ad6 <inituvm+0x66>
80106a8d:	e8 de b9 ff ff       	call   80102470 <kalloc>
80106a92:	83 ec 04             	sub    $0x4,%esp
80106a95:	89 c3                	mov    %eax,%ebx
80106a97:	68 00 10 00 00       	push   $0x1000
80106a9c:	6a 00                	push   $0x0
80106a9e:	50                   	push   %eax
80106a9f:	e8 dc d9 ff ff       	call   80104480 <memset>
80106aa4:	58                   	pop    %eax
80106aa5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106aab:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106ab0:	5a                   	pop    %edx
80106ab1:	6a 06                	push   $0x6
80106ab3:	50                   	push   %eax
80106ab4:	31 d2                	xor    %edx,%edx
80106ab6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106ab9:	e8 b2 fb ff ff       	call   80106670 <mappages>
80106abe:	89 75 10             	mov    %esi,0x10(%ebp)
80106ac1:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106ac4:	83 c4 10             	add    $0x10,%esp
80106ac7:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106aca:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106acd:	5b                   	pop    %ebx
80106ace:	5e                   	pop    %esi
80106acf:	5f                   	pop    %edi
80106ad0:	5d                   	pop    %ebp
80106ad1:	e9 5a da ff ff       	jmp    80104530 <memmove>
80106ad6:	83 ec 0c             	sub    $0xc,%esp
80106ad9:	68 2d 78 10 80       	push   $0x8010782d
80106ade:	e8 8d 98 ff ff       	call   80100370 <panic>
80106ae3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106af0 <loaduvm>:
80106af0:	55                   	push   %ebp
80106af1:	89 e5                	mov    %esp,%ebp
80106af3:	57                   	push   %edi
80106af4:	56                   	push   %esi
80106af5:	53                   	push   %ebx
80106af6:	83 ec 0c             	sub    $0xc,%esp
80106af9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106b00:	0f 85 91 00 00 00    	jne    80106b97 <loaduvm+0xa7>
80106b06:	8b 75 18             	mov    0x18(%ebp),%esi
80106b09:	31 db                	xor    %ebx,%ebx
80106b0b:	85 f6                	test   %esi,%esi
80106b0d:	75 1a                	jne    80106b29 <loaduvm+0x39>
80106b0f:	eb 6f                	jmp    80106b80 <loaduvm+0x90>
80106b11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b18:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b1e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106b24:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106b27:	76 57                	jbe    80106b80 <loaduvm+0x90>
80106b29:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b2c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b2f:	31 c9                	xor    %ecx,%ecx
80106b31:	01 da                	add    %ebx,%edx
80106b33:	e8 b8 fa ff ff       	call   801065f0 <walkpgdir>
80106b38:	85 c0                	test   %eax,%eax
80106b3a:	74 4e                	je     80106b8a <loaduvm+0x9a>
80106b3c:	8b 00                	mov    (%eax),%eax
80106b3e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106b41:	bf 00 10 00 00       	mov    $0x1000,%edi
80106b46:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b4b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106b51:	0f 46 fe             	cmovbe %esi,%edi
80106b54:	01 d9                	add    %ebx,%ecx
80106b56:	05 00 00 00 80       	add    $0x80000000,%eax
80106b5b:	57                   	push   %edi
80106b5c:	51                   	push   %ecx
80106b5d:	50                   	push   %eax
80106b5e:	ff 75 10             	pushl  0x10(%ebp)
80106b61:	e8 aa ad ff ff       	call   80101910 <readi>
80106b66:	83 c4 10             	add    $0x10,%esp
80106b69:	39 c7                	cmp    %eax,%edi
80106b6b:	74 ab                	je     80106b18 <loaduvm+0x28>
80106b6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106b75:	5b                   	pop    %ebx
80106b76:	5e                   	pop    %esi
80106b77:	5f                   	pop    %edi
80106b78:	5d                   	pop    %ebp
80106b79:	c3                   	ret    
80106b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b80:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b83:	31 c0                	xor    %eax,%eax
80106b85:	5b                   	pop    %ebx
80106b86:	5e                   	pop    %esi
80106b87:	5f                   	pop    %edi
80106b88:	5d                   	pop    %ebp
80106b89:	c3                   	ret    
80106b8a:	83 ec 0c             	sub    $0xc,%esp
80106b8d:	68 47 78 10 80       	push   $0x80107847
80106b92:	e8 d9 97 ff ff       	call   80100370 <panic>
80106b97:	83 ec 0c             	sub    $0xc,%esp
80106b9a:	68 e8 78 10 80       	push   $0x801078e8
80106b9f:	e8 cc 97 ff ff       	call   80100370 <panic>
80106ba4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106baa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106bb0 <allocuvm>:
80106bb0:	55                   	push   %ebp
80106bb1:	89 e5                	mov    %esp,%ebp
80106bb3:	57                   	push   %edi
80106bb4:	56                   	push   %esi
80106bb5:	53                   	push   %ebx
80106bb6:	83 ec 0c             	sub    $0xc,%esp
80106bb9:	8b 7d 10             	mov    0x10(%ebp),%edi
80106bbc:	85 ff                	test   %edi,%edi
80106bbe:	0f 88 ca 00 00 00    	js     80106c8e <allocuvm+0xde>
80106bc4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106bc7:	8b 45 0c             	mov    0xc(%ebp),%eax
80106bca:	0f 82 82 00 00 00    	jb     80106c52 <allocuvm+0xa2>
80106bd0:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106bd6:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106bdc:	39 df                	cmp    %ebx,%edi
80106bde:	77 43                	ja     80106c23 <allocuvm+0x73>
80106be0:	e9 bb 00 00 00       	jmp    80106ca0 <allocuvm+0xf0>
80106be5:	8d 76 00             	lea    0x0(%esi),%esi
80106be8:	83 ec 04             	sub    $0x4,%esp
80106beb:	68 00 10 00 00       	push   $0x1000
80106bf0:	6a 00                	push   $0x0
80106bf2:	50                   	push   %eax
80106bf3:	e8 88 d8 ff ff       	call   80104480 <memset>
80106bf8:	58                   	pop    %eax
80106bf9:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106bff:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c04:	5a                   	pop    %edx
80106c05:	6a 06                	push   $0x6
80106c07:	50                   	push   %eax
80106c08:	89 da                	mov    %ebx,%edx
80106c0a:	8b 45 08             	mov    0x8(%ebp),%eax
80106c0d:	e8 5e fa ff ff       	call   80106670 <mappages>
80106c12:	83 c4 10             	add    $0x10,%esp
80106c15:	85 c0                	test   %eax,%eax
80106c17:	78 47                	js     80106c60 <allocuvm+0xb0>
80106c19:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c1f:	39 df                	cmp    %ebx,%edi
80106c21:	76 7d                	jbe    80106ca0 <allocuvm+0xf0>
80106c23:	e8 48 b8 ff ff       	call   80102470 <kalloc>
80106c28:	85 c0                	test   %eax,%eax
80106c2a:	89 c6                	mov    %eax,%esi
80106c2c:	75 ba                	jne    80106be8 <allocuvm+0x38>
80106c2e:	83 ec 0c             	sub    $0xc,%esp
80106c31:	68 65 78 10 80       	push   $0x80107865
80106c36:	e8 25 9a ff ff       	call   80100660 <cprintf>
80106c3b:	83 c4 10             	add    $0x10,%esp
80106c3e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c41:	76 4b                	jbe    80106c8e <allocuvm+0xde>
80106c43:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106c46:	8b 45 08             	mov    0x8(%ebp),%eax
80106c49:	89 fa                	mov    %edi,%edx
80106c4b:	e8 b0 fa ff ff       	call   80106700 <deallocuvm.part.0>
80106c50:	31 c0                	xor    %eax,%eax
80106c52:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c55:	5b                   	pop    %ebx
80106c56:	5e                   	pop    %esi
80106c57:	5f                   	pop    %edi
80106c58:	5d                   	pop    %ebp
80106c59:	c3                   	ret    
80106c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c60:	83 ec 0c             	sub    $0xc,%esp
80106c63:	68 7d 78 10 80       	push   $0x8010787d
80106c68:	e8 f3 99 ff ff       	call   80100660 <cprintf>
80106c6d:	83 c4 10             	add    $0x10,%esp
80106c70:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c73:	76 0d                	jbe    80106c82 <allocuvm+0xd2>
80106c75:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106c78:	8b 45 08             	mov    0x8(%ebp),%eax
80106c7b:	89 fa                	mov    %edi,%edx
80106c7d:	e8 7e fa ff ff       	call   80106700 <deallocuvm.part.0>
80106c82:	83 ec 0c             	sub    $0xc,%esp
80106c85:	56                   	push   %esi
80106c86:	e8 35 b6 ff ff       	call   801022c0 <kfree>
80106c8b:	83 c4 10             	add    $0x10,%esp
80106c8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c91:	31 c0                	xor    %eax,%eax
80106c93:	5b                   	pop    %ebx
80106c94:	5e                   	pop    %esi
80106c95:	5f                   	pop    %edi
80106c96:	5d                   	pop    %ebp
80106c97:	c3                   	ret    
80106c98:	90                   	nop
80106c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ca0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ca3:	89 f8                	mov    %edi,%eax
80106ca5:	5b                   	pop    %ebx
80106ca6:	5e                   	pop    %esi
80106ca7:	5f                   	pop    %edi
80106ca8:	5d                   	pop    %ebp
80106ca9:	c3                   	ret    
80106caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106cb0 <deallocuvm>:
80106cb0:	55                   	push   %ebp
80106cb1:	89 e5                	mov    %esp,%ebp
80106cb3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106cb6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106cb9:	8b 45 08             	mov    0x8(%ebp),%eax
80106cbc:	39 d1                	cmp    %edx,%ecx
80106cbe:	73 10                	jae    80106cd0 <deallocuvm+0x20>
80106cc0:	5d                   	pop    %ebp
80106cc1:	e9 3a fa ff ff       	jmp    80106700 <deallocuvm.part.0>
80106cc6:	8d 76 00             	lea    0x0(%esi),%esi
80106cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106cd0:	89 d0                	mov    %edx,%eax
80106cd2:	5d                   	pop    %ebp
80106cd3:	c3                   	ret    
80106cd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ce0 <freevm>:
80106ce0:	55                   	push   %ebp
80106ce1:	89 e5                	mov    %esp,%ebp
80106ce3:	57                   	push   %edi
80106ce4:	56                   	push   %esi
80106ce5:	53                   	push   %ebx
80106ce6:	83 ec 0c             	sub    $0xc,%esp
80106ce9:	8b 75 08             	mov    0x8(%ebp),%esi
80106cec:	85 f6                	test   %esi,%esi
80106cee:	74 59                	je     80106d49 <freevm+0x69>
80106cf0:	31 c9                	xor    %ecx,%ecx
80106cf2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106cf7:	89 f0                	mov    %esi,%eax
80106cf9:	e8 02 fa ff ff       	call   80106700 <deallocuvm.part.0>
80106cfe:	89 f3                	mov    %esi,%ebx
80106d00:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106d06:	eb 0f                	jmp    80106d17 <freevm+0x37>
80106d08:	90                   	nop
80106d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d10:	83 c3 04             	add    $0x4,%ebx
80106d13:	39 fb                	cmp    %edi,%ebx
80106d15:	74 23                	je     80106d3a <freevm+0x5a>
80106d17:	8b 03                	mov    (%ebx),%eax
80106d19:	a8 01                	test   $0x1,%al
80106d1b:	74 f3                	je     80106d10 <freevm+0x30>
80106d1d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d22:	83 ec 0c             	sub    $0xc,%esp
80106d25:	83 c3 04             	add    $0x4,%ebx
80106d28:	05 00 00 00 80       	add    $0x80000000,%eax
80106d2d:	50                   	push   %eax
80106d2e:	e8 8d b5 ff ff       	call   801022c0 <kfree>
80106d33:	83 c4 10             	add    $0x10,%esp
80106d36:	39 fb                	cmp    %edi,%ebx
80106d38:	75 dd                	jne    80106d17 <freevm+0x37>
80106d3a:	89 75 08             	mov    %esi,0x8(%ebp)
80106d3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d40:	5b                   	pop    %ebx
80106d41:	5e                   	pop    %esi
80106d42:	5f                   	pop    %edi
80106d43:	5d                   	pop    %ebp
80106d44:	e9 77 b5 ff ff       	jmp    801022c0 <kfree>
80106d49:	83 ec 0c             	sub    $0xc,%esp
80106d4c:	68 99 78 10 80       	push   $0x80107899
80106d51:	e8 1a 96 ff ff       	call   80100370 <panic>
80106d56:	8d 76 00             	lea    0x0(%esi),%esi
80106d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d60 <clearpteu>:
80106d60:	55                   	push   %ebp
80106d61:	31 c9                	xor    %ecx,%ecx
80106d63:	89 e5                	mov    %esp,%ebp
80106d65:	83 ec 08             	sub    $0x8,%esp
80106d68:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d6b:	8b 45 08             	mov    0x8(%ebp),%eax
80106d6e:	e8 7d f8 ff ff       	call   801065f0 <walkpgdir>
80106d73:	85 c0                	test   %eax,%eax
80106d75:	74 05                	je     80106d7c <clearpteu+0x1c>
80106d77:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106d7a:	c9                   	leave  
80106d7b:	c3                   	ret    
80106d7c:	83 ec 0c             	sub    $0xc,%esp
80106d7f:	68 aa 78 10 80       	push   $0x801078aa
80106d84:	e8 e7 95 ff ff       	call   80100370 <panic>
80106d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106d90 <copyuvm>:
80106d90:	55                   	push   %ebp
80106d91:	89 e5                	mov    %esp,%ebp
80106d93:	57                   	push   %edi
80106d94:	56                   	push   %esi
80106d95:	53                   	push   %ebx
80106d96:	83 ec 1c             	sub    $0x1c,%esp
80106d99:	e8 52 fb ff ff       	call   801068f0 <setupkvm>
80106d9e:	85 c0                	test   %eax,%eax
80106da0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106da3:	0f 84 b2 00 00 00    	je     80106e5b <copyuvm+0xcb>
80106da9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106dac:	85 c9                	test   %ecx,%ecx
80106dae:	0f 84 9c 00 00 00    	je     80106e50 <copyuvm+0xc0>
80106db4:	31 f6                	xor    %esi,%esi
80106db6:	eb 4a                	jmp    80106e02 <copyuvm+0x72>
80106db8:	90                   	nop
80106db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106dc0:	83 ec 04             	sub    $0x4,%esp
80106dc3:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106dc9:	68 00 10 00 00       	push   $0x1000
80106dce:	57                   	push   %edi
80106dcf:	50                   	push   %eax
80106dd0:	e8 5b d7 ff ff       	call   80104530 <memmove>
80106dd5:	58                   	pop    %eax
80106dd6:	5a                   	pop    %edx
80106dd7:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
80106ddd:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106de0:	ff 75 e4             	pushl  -0x1c(%ebp)
80106de3:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106de8:	52                   	push   %edx
80106de9:	89 f2                	mov    %esi,%edx
80106deb:	e8 80 f8 ff ff       	call   80106670 <mappages>
80106df0:	83 c4 10             	add    $0x10,%esp
80106df3:	85 c0                	test   %eax,%eax
80106df5:	78 3e                	js     80106e35 <copyuvm+0xa5>
80106df7:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106dfd:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106e00:	76 4e                	jbe    80106e50 <copyuvm+0xc0>
80106e02:	8b 45 08             	mov    0x8(%ebp),%eax
80106e05:	31 c9                	xor    %ecx,%ecx
80106e07:	89 f2                	mov    %esi,%edx
80106e09:	e8 e2 f7 ff ff       	call   801065f0 <walkpgdir>
80106e0e:	85 c0                	test   %eax,%eax
80106e10:	74 5a                	je     80106e6c <copyuvm+0xdc>
80106e12:	8b 18                	mov    (%eax),%ebx
80106e14:	f6 c3 01             	test   $0x1,%bl
80106e17:	74 46                	je     80106e5f <copyuvm+0xcf>
80106e19:	89 df                	mov    %ebx,%edi
80106e1b:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106e21:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80106e24:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80106e2a:	e8 41 b6 ff ff       	call   80102470 <kalloc>
80106e2f:	85 c0                	test   %eax,%eax
80106e31:	89 c3                	mov    %eax,%ebx
80106e33:	75 8b                	jne    80106dc0 <copyuvm+0x30>
80106e35:	83 ec 0c             	sub    $0xc,%esp
80106e38:	ff 75 e0             	pushl  -0x20(%ebp)
80106e3b:	e8 a0 fe ff ff       	call   80106ce0 <freevm>
80106e40:	83 c4 10             	add    $0x10,%esp
80106e43:	31 c0                	xor    %eax,%eax
80106e45:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e48:	5b                   	pop    %ebx
80106e49:	5e                   	pop    %esi
80106e4a:	5f                   	pop    %edi
80106e4b:	5d                   	pop    %ebp
80106e4c:	c3                   	ret    
80106e4d:	8d 76 00             	lea    0x0(%esi),%esi
80106e50:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e53:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e56:	5b                   	pop    %ebx
80106e57:	5e                   	pop    %esi
80106e58:	5f                   	pop    %edi
80106e59:	5d                   	pop    %ebp
80106e5a:	c3                   	ret    
80106e5b:	31 c0                	xor    %eax,%eax
80106e5d:	eb e6                	jmp    80106e45 <copyuvm+0xb5>
80106e5f:	83 ec 0c             	sub    $0xc,%esp
80106e62:	68 ce 78 10 80       	push   $0x801078ce
80106e67:	e8 04 95 ff ff       	call   80100370 <panic>
80106e6c:	83 ec 0c             	sub    $0xc,%esp
80106e6f:	68 b4 78 10 80       	push   $0x801078b4
80106e74:	e8 f7 94 ff ff       	call   80100370 <panic>
80106e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106e80 <uva2ka>:
80106e80:	55                   	push   %ebp
80106e81:	31 c9                	xor    %ecx,%ecx
80106e83:	89 e5                	mov    %esp,%ebp
80106e85:	83 ec 08             	sub    $0x8,%esp
80106e88:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e8b:	8b 45 08             	mov    0x8(%ebp),%eax
80106e8e:	e8 5d f7 ff ff       	call   801065f0 <walkpgdir>
80106e93:	8b 00                	mov    (%eax),%eax
80106e95:	89 c2                	mov    %eax,%edx
80106e97:	83 e2 05             	and    $0x5,%edx
80106e9a:	83 fa 05             	cmp    $0x5,%edx
80106e9d:	75 11                	jne    80106eb0 <uva2ka+0x30>
80106e9f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106ea4:	c9                   	leave  
80106ea5:	05 00 00 00 80       	add    $0x80000000,%eax
80106eaa:	c3                   	ret    
80106eab:	90                   	nop
80106eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106eb0:	31 c0                	xor    %eax,%eax
80106eb2:	c9                   	leave  
80106eb3:	c3                   	ret    
80106eb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106eba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ec0 <copyout>:
80106ec0:	55                   	push   %ebp
80106ec1:	89 e5                	mov    %esp,%ebp
80106ec3:	57                   	push   %edi
80106ec4:	56                   	push   %esi
80106ec5:	53                   	push   %ebx
80106ec6:	83 ec 1c             	sub    $0x1c,%esp
80106ec9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106ecc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ecf:	8b 7d 10             	mov    0x10(%ebp),%edi
80106ed2:	85 db                	test   %ebx,%ebx
80106ed4:	75 40                	jne    80106f16 <copyout+0x56>
80106ed6:	eb 70                	jmp    80106f48 <copyout+0x88>
80106ed8:	90                   	nop
80106ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ee0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106ee3:	89 f1                	mov    %esi,%ecx
80106ee5:	29 d1                	sub    %edx,%ecx
80106ee7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106eed:	39 d9                	cmp    %ebx,%ecx
80106eef:	0f 47 cb             	cmova  %ebx,%ecx
80106ef2:	29 f2                	sub    %esi,%edx
80106ef4:	83 ec 04             	sub    $0x4,%esp
80106ef7:	01 d0                	add    %edx,%eax
80106ef9:	51                   	push   %ecx
80106efa:	57                   	push   %edi
80106efb:	50                   	push   %eax
80106efc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106eff:	e8 2c d6 ff ff       	call   80104530 <memmove>
80106f04:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106f07:	83 c4 10             	add    $0x10,%esp
80106f0a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80106f10:	01 cf                	add    %ecx,%edi
80106f12:	29 cb                	sub    %ecx,%ebx
80106f14:	74 32                	je     80106f48 <copyout+0x88>
80106f16:	89 d6                	mov    %edx,%esi
80106f18:	83 ec 08             	sub    $0x8,%esp
80106f1b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106f1e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106f24:	56                   	push   %esi
80106f25:	ff 75 08             	pushl  0x8(%ebp)
80106f28:	e8 53 ff ff ff       	call   80106e80 <uva2ka>
80106f2d:	83 c4 10             	add    $0x10,%esp
80106f30:	85 c0                	test   %eax,%eax
80106f32:	75 ac                	jne    80106ee0 <copyout+0x20>
80106f34:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106f3c:	5b                   	pop    %ebx
80106f3d:	5e                   	pop    %esi
80106f3e:	5f                   	pop    %edi
80106f3f:	5d                   	pop    %ebp
80106f40:	c3                   	ret    
80106f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f4b:	31 c0                	xor    %eax,%eax
80106f4d:	5b                   	pop    %ebx
80106f4e:	5e                   	pop    %esi
80106f4f:	5f                   	pop    %edi
80106f50:	5d                   	pop    %ebp
80106f51:	c3                   	ret    
