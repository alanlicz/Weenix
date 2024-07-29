
user/bin/ls.exec:     file format elf32-i386


Disassembly of section .text:

08048094 <do_ls>:
 8048094:	55                   	push   %ebp
 8048095:	89 e5                	mov    %esp,%ebp
 8048097:	81 ec 78 11 00 00    	sub    $0x1178,%esp
 804809d:	c7 44 24 08 80 01 00 	movl   $0x180,0x8(%esp)
 80480a4:	00 
 80480a5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80480ac:	00 
 80480ad:	8b 45 08             	mov    0x8(%ebp),%eax
 80480b0:	89 04 24             	mov    %eax,(%esp)
 80480b3:	e8 d3 07 00 00       	call   804888b <open>
 80480b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80480bb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 80480bf:	0f 89 31 01 00 00    	jns    80481f6 <do_ls+0x162>
 80480c5:	8b 15 64 f2 04 08    	mov    0x804f264,%edx
 80480cb:	a1 3c f0 04 08       	mov    0x804f03c,%eax
 80480d0:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80480d4:	8b 55 08             	mov    0x8(%ebp),%edx
 80480d7:	89 54 24 08          	mov    %edx,0x8(%esp)
 80480db:	c7 44 24 04 d4 cf 04 	movl   $0x804cfd4,0x4(%esp)
 80480e2:	08 
 80480e3:	89 04 24             	mov    %eax,(%esp)
 80480e6:	e8 1f 3a 00 00       	call   804bb0a <fprintf>
 80480eb:	b8 01 00 00 00       	mov    $0x1,%eax
 80480f0:	e9 b9 01 00 00       	jmp    80482ae <do_ls+0x21a>
 80480f5:	8d 85 b0 ee ff ff    	lea    -0x1150(%ebp),%eax
 80480fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80480fe:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 8048101:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
 8048106:	89 c8                	mov    %ecx,%eax
 8048108:	f7 e2                	mul    %edx
 804810a:	c1 ea 05             	shr    $0x5,%edx
 804810d:	89 d0                	mov    %edx,%eax
 804810f:	c1 e0 02             	shl    $0x2,%eax
 8048112:	01 d0                	add    %edx,%eax
 8048114:	c1 e0 03             	shl    $0x3,%eax
 8048117:	29 c1                	sub    %eax,%ecx
 8048119:	89 ca                	mov    %ecx,%edx
 804811b:	85 d2                	test   %edx,%edx
 804811d:	74 2e                	je     804814d <do_ls+0xb9>
 804811f:	a1 3c f0 04 08       	mov    0x804f03c,%eax
 8048124:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
 804812b:	00 
 804812c:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804812f:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048133:	c7 44 24 04 f8 cf 04 	movl   $0x804cff8,0x4(%esp)
 804813a:	08 
 804813b:	89 04 24             	mov    %eax,(%esp)
 804813e:	e8 c7 39 00 00       	call   804bb0a <fprintf>
 8048143:	b8 01 00 00 00       	mov    $0x1,%eax
 8048148:	e9 61 01 00 00       	jmp    80482ae <do_ls+0x21a>
 804814d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048150:	83 c0 08             	add    $0x8,%eax
 8048153:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048157:	8b 45 08             	mov    0x8(%ebp),%eax
 804815a:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804815e:	c7 44 24 08 55 d0 04 	movl   $0x804d055,0x8(%esp)
 8048165:	08 
 8048166:	c7 44 24 04 00 01 00 	movl   $0x100,0x4(%esp)
 804816d:	00 
 804816e:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
 8048174:	89 04 24             	mov    %eax,(%esp)
 8048177:	e8 0a 3a 00 00       	call   804bb86 <snprintf>
 804817c:	8d 85 b0 fe ff ff    	lea    -0x150(%ebp),%eax
 8048182:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048186:	8d 85 e4 fe ff ff    	lea    -0x11c(%ebp),%eax
 804818c:	89 04 24             	mov    %eax,(%esp)
 804818f:	e8 46 0e 00 00       	call   8048fda <stat>
 8048194:	85 c0                	test   %eax,%eax
 8048196:	75 0b                	jne    80481a3 <do_ls+0x10f>
 8048198:	8b 85 cc fe ff ff    	mov    -0x134(%ebp),%eax
 804819e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80481a1:	eb 07                	jmp    80481aa <do_ls+0x116>
 80481a3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 80481aa:	c7 45 e4 28 00 00 00 	movl   $0x28,-0x1c(%ebp)
 80481b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481b4:	8b 10                	mov    (%eax),%edx
 80481b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481b9:	8d 48 08             	lea    0x8(%eax),%ecx
 80481bc:	a1 38 f0 04 08       	mov    0x804f038,%eax
 80481c1:	89 54 24 10          	mov    %edx,0x10(%esp)
 80481c5:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 80481c9:	8b 55 ec             	mov    -0x14(%ebp),%edx
 80481cc:	89 54 24 08          	mov    %edx,0x8(%esp)
 80481d0:	c7 44 24 04 5b d0 04 	movl   $0x804d05b,0x4(%esp)
 80481d7:	08 
 80481d8:	89 04 24             	mov    %eax,(%esp)
 80481db:	e8 2a 39 00 00       	call   804bb0a <fprintf>
 80481e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80481e3:	01 45 f4             	add    %eax,-0xc(%ebp)
 80481e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80481e9:	29 45 f0             	sub    %eax,-0x10(%ebp)
 80481ec:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80481f0:	0f 85 57 ff ff ff    	jne    804814d <do_ls+0xb9>
 80481f6:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
 80481fd:	00 
 80481fe:	8d 85 b0 ee ff ff    	lea    -0x1150(%ebp),%eax
 8048204:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048208:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804820b:	89 04 24             	mov    %eax,(%esp)
 804820e:	e8 76 0d 00 00       	call   8048f89 <getdents>
 8048213:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048216:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 804821a:	0f 8f d5 fe ff ff    	jg     80480f5 <do_ls+0x61>
 8048220:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8048224:	79 4e                	jns    8048274 <do_ls+0x1e0>
 8048226:	a1 64 f2 04 08       	mov    0x804f264,%eax
 804822b:	83 f8 14             	cmp    $0x14,%eax
 804822e:	75 1e                	jne    804824e <do_ls+0x1ba>
 8048230:	a1 38 f0 04 08       	mov    0x804f038,%eax
 8048235:	8b 55 08             	mov    0x8(%ebp),%edx
 8048238:	89 54 24 08          	mov    %edx,0x8(%esp)
 804823c:	c7 44 24 04 6c d0 04 	movl   $0x804d06c,0x4(%esp)
 8048243:	08 
 8048244:	89 04 24             	mov    %eax,(%esp)
 8048247:	e8 be 38 00 00       	call   804bb0a <fprintf>
 804824c:	eb 26                	jmp    8048274 <do_ls+0x1e0>
 804824e:	8b 15 64 f2 04 08    	mov    0x804f264,%edx
 8048254:	a1 3c f0 04 08       	mov    0x804f03c,%eax
 8048259:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804825d:	8b 55 08             	mov    0x8(%ebp),%edx
 8048260:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048264:	c7 44 24 04 70 d0 04 	movl   $0x804d070,0x4(%esp)
 804826b:	08 
 804826c:	89 04 24             	mov    %eax,(%esp)
 804826f:	e8 96 38 00 00       	call   804bb0a <fprintf>
 8048274:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048277:	89 04 24             	mov    %eax,(%esp)
 804827a:	e8 63 07 00 00       	call   80489e2 <close>
 804827f:	85 c0                	test   %eax,%eax
 8048281:	79 26                	jns    80482a9 <do_ls+0x215>
 8048283:	8b 15 64 f2 04 08    	mov    0x804f264,%edx
 8048289:	a1 3c f0 04 08       	mov    0x804f03c,%eax
 804828e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048292:	8b 55 08             	mov    0x8(%ebp),%edx
 8048295:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048299:	c7 44 24 04 90 d0 04 	movl   $0x804d090,0x4(%esp)
 80482a0:	08 
 80482a1:	89 04 24             	mov    %eax,(%esp)
 80482a4:	e8 61 38 00 00       	call   804bb0a <fprintf>
 80482a9:	b8 00 00 00 00       	mov    $0x0,%eax
 80482ae:	c9                   	leave  
 80482af:	c3                   	ret    

080482b0 <main>:
 80482b0:	55                   	push   %ebp
 80482b1:	89 e5                	mov    %esp,%ebp
 80482b3:	83 e4 f0             	and    $0xfffffff0,%esp
 80482b6:	83 ec 20             	sub    $0x20,%esp
 80482b9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 80482bd:	7f 15                	jg     80482d4 <main+0x24>
 80482bf:	c7 04 24 a8 d0 04 08 	movl   $0x804d0a8,(%esp)
 80482c6:	e8 c9 fd ff ff       	call   8048094 <do_ls>
 80482cb:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 80482cf:	e9 a4 00 00 00       	jmp    8048378 <main+0xc8>
 80482d4:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 80482d8:	7f 19                	jg     80482f3 <main+0x43>
 80482da:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482dd:	83 c0 04             	add    $0x4,%eax
 80482e0:	8b 00                	mov    (%eax),%eax
 80482e2:	89 04 24             	mov    %eax,(%esp)
 80482e5:	e8 aa fd ff ff       	call   8048094 <do_ls>
 80482ea:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 80482ee:	e9 85 00 00 00       	jmp    8048378 <main+0xc8>
 80482f3:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
 80482fa:	00 
 80482fb:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
 8048302:	00 
 8048303:	eb 62                	jmp    8048367 <main+0xb7>
 8048305:	8b 44 24 14          	mov    0x14(%esp),%eax
 8048309:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048310:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048313:	01 d0                	add    %edx,%eax
 8048315:	8b 10                	mov    (%eax),%edx
 8048317:	a1 38 f0 04 08       	mov    0x804f038,%eax
 804831c:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048320:	c7 44 24 04 aa d0 04 	movl   $0x804d0aa,0x4(%esp)
 8048327:	08 
 8048328:	89 04 24             	mov    %eax,(%esp)
 804832b:	e8 da 37 00 00       	call   804bb0a <fprintf>
 8048330:	8b 44 24 14          	mov    0x14(%esp),%eax
 8048334:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804833b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804833e:	01 d0                	add    %edx,%eax
 8048340:	8b 00                	mov    (%eax),%eax
 8048342:	89 04 24             	mov    %eax,(%esp)
 8048345:	e8 4a fd ff ff       	call   8048094 <do_ls>
 804834a:	01 44 24 18          	add    %eax,0x18(%esp)
 804834e:	a1 38 f0 04 08       	mov    0x804f038,%eax
 8048353:	c7 44 24 04 af d0 04 	movl   $0x804d0af,0x4(%esp)
 804835a:	08 
 804835b:	89 04 24             	mov    %eax,(%esp)
 804835e:	e8 a7 37 00 00       	call   804bb0a <fprintf>
 8048363:	ff 44 24 14          	incl   0x14(%esp)
 8048367:	8b 44 24 14          	mov    0x14(%esp),%eax
 804836b:	3b 45 08             	cmp    0x8(%ebp),%eax
 804836e:	7c 95                	jl     8048305 <main+0x55>
 8048370:	8b 44 24 18          	mov    0x18(%esp),%eax
 8048374:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 8048378:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 804837c:	c9                   	leave  
 804837d:	c3                   	ret    

0804837e <__libc_static_entry>:
 804837e:	83 c4 04             	add    $0x4,%esp
 8048381:	e8 2a ff ff ff       	call   80482b0 <main>
 8048386:	50                   	push   %eax
 8048387:	e8 21 02 00 00       	call   80485ad <exit>

0804838c <trap>:
 804838c:	55                   	push   %ebp
 804838d:	89 e5                	mov    %esp,%ebp
 804838f:	83 ec 10             	sub    $0x10,%esp
 8048392:	e8 7d 0d 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048397:	81 c1 69 6c 00 00    	add    $0x6c69,%ecx
 804839d:	8b 45 08             	mov    0x8(%ebp),%eax
 80483a0:	8b 55 0c             	mov    0xc(%ebp),%edx
 80483a3:	cd 2e                	int    $0x2e
 80483a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80483a8:	b8 27 00 00 00       	mov    $0x27,%eax
 80483ad:	cd 2e                	int    $0x2e
 80483af:	89 c2                	mov    %eax,%edx
 80483b1:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 80483b7:	89 10                	mov    %edx,(%eax)
 80483b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80483bc:	c9                   	leave  
 80483bd:	c3                   	ret    

080483be <sbrk>:
 80483be:	55                   	push   %ebp
 80483bf:	89 e5                	mov    %esp,%ebp
 80483c1:	53                   	push   %ebx
 80483c2:	83 ec 24             	sub    $0x24,%esp
 80483c5:	e8 4a 0d 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 80483ca:	81 c1 36 6c 00 00    	add    $0x6c36,%ecx
 80483d0:	8b 81 60 01 00 00    	mov    0x160(%ecx),%eax
 80483d6:	85 c0                	test   %eax,%eax
 80483d8:	75 44                	jne    804841e <sbrk+0x60>
 80483da:	c7 45 f0 2c 00 00 00 	movl   $0x2c,-0x10(%ebp)
 80483e1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 80483e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80483eb:	8b 55 ec             	mov    -0x14(%ebp),%edx
 80483ee:	cd 2e                	int    $0x2e
 80483f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80483f3:	b8 27 00 00 00       	mov    $0x27,%eax
 80483f8:	cd 2e                	int    $0x2e
 80483fa:	89 c2                	mov    %eax,%edx
 80483fc:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048402:	89 10                	mov    %edx,(%eax)
 8048404:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048407:	89 81 60 01 00 00    	mov    %eax,0x160(%ecx)
 804840d:	8b 81 60 01 00 00    	mov    0x160(%ecx),%eax
 8048413:	85 c0                	test   %eax,%eax
 8048415:	79 07                	jns    804841e <sbrk+0x60>
 8048417:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804841c:	eb 63                	jmp    8048481 <sbrk+0xc3>
 804841e:	8b 81 60 01 00 00    	mov    0x160(%ecx),%eax
 8048424:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048427:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804842b:	79 2e                	jns    804845b <sbrk+0x9d>
 804842d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048430:	f7 d8                	neg    %eax
 8048432:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8048435:	76 07                	jbe    804843e <sbrk+0x80>
 8048437:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804843c:	eb 43                	jmp    8048481 <sbrk+0xc3>
 804843e:	8b 55 08             	mov    0x8(%ebp),%edx
 8048441:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048444:	01 d0                	add    %edx,%eax
 8048446:	89 04 24             	mov    %eax,(%esp)
 8048449:	89 cb                	mov    %ecx,%ebx
 804844b:	e8 37 00 00 00       	call   8048487 <brk>
 8048450:	85 c0                	test   %eax,%eax
 8048452:	79 2a                	jns    804847e <sbrk+0xc0>
 8048454:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8048459:	eb 26                	jmp    8048481 <sbrk+0xc3>
 804845b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804845f:	7e 1d                	jle    804847e <sbrk+0xc0>
 8048461:	8b 55 08             	mov    0x8(%ebp),%edx
 8048464:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048467:	01 d0                	add    %edx,%eax
 8048469:	89 04 24             	mov    %eax,(%esp)
 804846c:	89 cb                	mov    %ecx,%ebx
 804846e:	e8 14 00 00 00       	call   8048487 <brk>
 8048473:	85 c0                	test   %eax,%eax
 8048475:	79 07                	jns    804847e <sbrk+0xc0>
 8048477:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804847c:	eb 03                	jmp    8048481 <sbrk+0xc3>
 804847e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048481:	83 c4 24             	add    $0x24,%esp
 8048484:	5b                   	pop    %ebx
 8048485:	5d                   	pop    %ebp
 8048486:	c3                   	ret    

08048487 <brk>:
 8048487:	55                   	push   %ebp
 8048488:	89 e5                	mov    %esp,%ebp
 804848a:	83 ec 10             	sub    $0x10,%esp
 804848d:	e8 82 0c 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048492:	81 c1 6e 6b 00 00    	add    $0x6b6e,%ecx
 8048498:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804849c:	75 07                	jne    80484a5 <brk+0x1e>
 804849e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80484a3:	eb 4a                	jmp    80484ef <brk+0x68>
 80484a5:	8b 45 08             	mov    0x8(%ebp),%eax
 80484a8:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
 80484af:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80484b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80484b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80484b8:	cd 2e                	int    $0x2e
 80484ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80484bd:	b8 27 00 00 00       	mov    $0x27,%eax
 80484c2:	cd 2e                	int    $0x2e
 80484c4:	89 c2                	mov    %eax,%edx
 80484c6:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 80484cc:	89 10                	mov    %edx,(%eax)
 80484ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80484d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80484d4:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
 80484d8:	75 07                	jne    80484e1 <brk+0x5a>
 80484da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80484df:	eb 0e                	jmp    80484ef <brk+0x68>
 80484e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80484e4:	89 81 60 01 00 00    	mov    %eax,0x160(%ecx)
 80484ea:	b8 00 00 00 00       	mov    $0x0,%eax
 80484ef:	c9                   	leave  
 80484f0:	c3                   	ret    

080484f1 <fork>:
 80484f1:	55                   	push   %ebp
 80484f2:	89 e5                	mov    %esp,%ebp
 80484f4:	83 ec 10             	sub    $0x10,%esp
 80484f7:	e8 18 0c 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 80484fc:	81 c1 04 6b 00 00    	add    $0x6b04,%ecx
 8048502:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
 8048509:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8048510:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048513:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048516:	cd 2e                	int    $0x2e
 8048518:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804851b:	b8 27 00 00 00       	mov    $0x27,%eax
 8048520:	cd 2e                	int    $0x2e
 8048522:	89 c2                	mov    %eax,%edx
 8048524:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 804852a:	89 10                	mov    %edx,(%eax)
 804852c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804852f:	90                   	nop
 8048530:	c9                   	leave  
 8048531:	c3                   	ret    

08048532 <atexit>:
 8048532:	55                   	push   %ebp
 8048533:	89 e5                	mov    %esp,%ebp
 8048535:	e8 d6 0b 00 00       	call   8049110 <__x86.get_pc_thunk.ax>
 804853a:	05 c6 6a 00 00       	add    $0x6ac6,%eax
 804853f:	8b 90 00 02 00 00    	mov    0x200(%eax),%edx
 8048545:	83 fa 1f             	cmp    $0x1f,%edx
 8048548:	7f 20                	jg     804856a <atexit+0x38>
 804854a:	8b 90 00 02 00 00    	mov    0x200(%eax),%edx
 8048550:	8d 4a 01             	lea    0x1(%edx),%ecx
 8048553:	89 88 00 02 00 00    	mov    %ecx,0x200(%eax)
 8048559:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804855c:	89 8c 90 80 01 00 00 	mov    %ecx,0x180(%eax,%edx,4)
 8048563:	b8 00 00 00 00       	mov    $0x0,%eax
 8048568:	eb 05                	jmp    804856f <atexit+0x3d>
 804856a:	b8 01 00 00 00       	mov    $0x1,%eax
 804856f:	5d                   	pop    %ebp
 8048570:	c3                   	ret    

08048571 <_exit>:
 8048571:	55                   	push   %ebp
 8048572:	89 e5                	mov    %esp,%ebp
 8048574:	83 ec 10             	sub    $0x10,%esp
 8048577:	e8 98 0b 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 804857c:	81 c1 84 6a 00 00    	add    $0x6a84,%ecx
 8048582:	8b 45 08             	mov    0x8(%ebp),%eax
 8048585:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
 804858c:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804858f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048592:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048595:	cd 2e                	int    $0x2e
 8048597:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804859a:	b8 27 00 00 00       	mov    $0x27,%eax
 804859f:	cd 2e                	int    $0x2e
 80485a1:	89 c2                	mov    %eax,%edx
 80485a3:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 80485a9:	89 10                	mov    %edx,(%eax)
 80485ab:	eb fe                	jmp    80485ab <_exit+0x3a>

080485ad <exit>:
 80485ad:	55                   	push   %ebp
 80485ae:	89 e5                	mov    %esp,%ebp
 80485b0:	53                   	push   %ebx
 80485b1:	83 ec 14             	sub    $0x14,%esp
 80485b4:	e8 5f 0b 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 80485b9:	81 c3 47 6a 00 00    	add    $0x6a47,%ebx
 80485bf:	eb 0f                	jmp    80485d0 <exit+0x23>
 80485c1:	8b 83 00 02 00 00    	mov    0x200(%ebx),%eax
 80485c7:	8b 84 83 80 01 00 00 	mov    0x180(%ebx,%eax,4),%eax
 80485ce:	ff d0                	call   *%eax
 80485d0:	8b 83 00 02 00 00    	mov    0x200(%ebx),%eax
 80485d6:	8d 50 ff             	lea    -0x1(%eax),%edx
 80485d9:	89 93 00 02 00 00    	mov    %edx,0x200(%ebx)
 80485df:	85 c0                	test   %eax,%eax
 80485e1:	75 de                	jne    80485c1 <exit+0x14>
 80485e3:	8b 45 08             	mov    0x8(%ebp),%eax
 80485e6:	89 04 24             	mov    %eax,(%esp)
 80485e9:	e8 83 ff ff ff       	call   8048571 <_exit>
 80485ee:	8b 45 08             	mov    0x8(%ebp),%eax
 80485f1:	89 04 24             	mov    %eax,(%esp)
 80485f4:	e8 b4 ff ff ff       	call   80485ad <exit>
 80485f9:	90                   	nop
 80485fa:	83 c4 14             	add    $0x14,%esp
 80485fd:	5b                   	pop    %ebx
 80485fe:	5d                   	pop    %ebp
 80485ff:	c3                   	ret    

08048600 <yield>:
 8048600:	55                   	push   %ebp
 8048601:	89 e5                	mov    %esp,%ebp
 8048603:	53                   	push   %ebx
 8048604:	83 ec 14             	sub    $0x14,%esp
 8048607:	e8 0c 0b 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 804860c:	81 c3 f4 69 00 00    	add    $0x69f4,%ebx
 8048612:	e8 da fe ff ff       	call   80484f1 <fork>
 8048617:	85 c0                	test   %eax,%eax
 8048619:	74 0e                	je     8048629 <yield+0x29>
 804861b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048622:	e8 15 00 00 00       	call   804863c <wait>
 8048627:	eb 0c                	jmp    8048635 <yield+0x35>
 8048629:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048630:	e8 78 ff ff ff       	call   80485ad <exit>
 8048635:	90                   	nop
 8048636:	83 c4 14             	add    $0x14,%esp
 8048639:	5b                   	pop    %ebx
 804863a:	5d                   	pop    %ebp
 804863b:	c3                   	ret    

0804863c <wait>:
 804863c:	55                   	push   %ebp
 804863d:	89 e5                	mov    %esp,%ebp
 804863f:	83 ec 20             	sub    $0x20,%esp
 8048642:	e8 cd 0a 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048647:	81 c1 b9 69 00 00    	add    $0x69b9,%ecx
 804864d:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
 8048654:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804865b:	8b 45 08             	mov    0x8(%ebp),%eax
 804865e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048661:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048664:	c7 45 fc 07 00 00 00 	movl   $0x7,-0x4(%ebp)
 804866b:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804866e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048671:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048674:	cd 2e                	int    $0x2e
 8048676:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048679:	b8 27 00 00 00       	mov    $0x27,%eax
 804867e:	cd 2e                	int    $0x2e
 8048680:	89 c2                	mov    %eax,%edx
 8048682:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048688:	89 10                	mov    %edx,(%eax)
 804868a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804868d:	c9                   	leave  
 804868e:	c3                   	ret    

0804868f <waitpid>:
 804868f:	55                   	push   %ebp
 8048690:	89 e5                	mov    %esp,%ebp
 8048692:	83 ec 20             	sub    $0x20,%esp
 8048695:	e8 7a 0a 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 804869a:	81 c1 66 69 00 00    	add    $0x6966,%ecx
 80486a0:	8b 45 08             	mov    0x8(%ebp),%eax
 80486a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80486a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80486ac:	8b 45 10             	mov    0x10(%ebp),%eax
 80486af:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80486b2:	8d 45 e8             	lea    -0x18(%ebp),%eax
 80486b5:	c7 45 fc 07 00 00 00 	movl   $0x7,-0x4(%ebp)
 80486bc:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80486bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80486c2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80486c5:	cd 2e                	int    $0x2e
 80486c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80486ca:	b8 27 00 00 00       	mov    $0x27,%eax
 80486cf:	cd 2e                	int    $0x2e
 80486d1:	89 c2                	mov    %eax,%edx
 80486d3:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 80486d9:	89 10                	mov    %edx,(%eax)
 80486db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80486de:	c9                   	leave  
 80486df:	c3                   	ret    

080486e0 <thr_exit>:
 80486e0:	55                   	push   %ebp
 80486e1:	89 e5                	mov    %esp,%ebp
 80486e3:	83 ec 10             	sub    $0x10,%esp
 80486e6:	e8 29 0a 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 80486eb:	81 c1 15 69 00 00    	add    $0x6915,%ecx
 80486f1:	8b 45 08             	mov    0x8(%ebp),%eax
 80486f4:	c7 45 fc 1f 00 00 00 	movl   $0x1f,-0x4(%ebp)
 80486fb:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80486fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048701:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048704:	cd 2e                	int    $0x2e
 8048706:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048709:	b8 27 00 00 00       	mov    $0x27,%eax
 804870e:	cd 2e                	int    $0x2e
 8048710:	89 c2                	mov    %eax,%edx
 8048712:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048718:	89 10                	mov    %edx,(%eax)
 804871a:	90                   	nop
 804871b:	c9                   	leave  
 804871c:	c3                   	ret    

0804871d <getpid>:
 804871d:	55                   	push   %ebp
 804871e:	89 e5                	mov    %esp,%ebp
 8048720:	83 ec 10             	sub    $0x10,%esp
 8048723:	e8 ec 09 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048728:	81 c1 d8 68 00 00    	add    $0x68d8,%ecx
 804872e:	c7 45 fc 23 00 00 00 	movl   $0x23,-0x4(%ebp)
 8048735:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 804873c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804873f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048742:	cd 2e                	int    $0x2e
 8048744:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048747:	b8 27 00 00 00       	mov    $0x27,%eax
 804874c:	cd 2e                	int    $0x2e
 804874e:	89 c2                	mov    %eax,%edx
 8048750:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048756:	89 10                	mov    %edx,(%eax)
 8048758:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804875b:	90                   	nop
 804875c:	c9                   	leave  
 804875d:	c3                   	ret    

0804875e <halt>:
 804875e:	55                   	push   %ebp
 804875f:	89 e5                	mov    %esp,%ebp
 8048761:	83 ec 10             	sub    $0x10,%esp
 8048764:	e8 ab 09 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048769:	81 c1 97 68 00 00    	add    $0x6897,%ecx
 804876f:	c7 45 fc 28 00 00 00 	movl   $0x28,-0x4(%ebp)
 8048776:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 804877d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048780:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048783:	cd 2e                	int    $0x2e
 8048785:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048788:	b8 27 00 00 00       	mov    $0x27,%eax
 804878d:	cd 2e                	int    $0x2e
 804878f:	89 c2                	mov    %eax,%edx
 8048791:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048797:	89 10                	mov    %edx,(%eax)
 8048799:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804879c:	90                   	nop
 804879d:	c9                   	leave  
 804879e:	c3                   	ret    

0804879f <mmap>:
 804879f:	55                   	push   %ebp
 80487a0:	89 e5                	mov    %esp,%ebp
 80487a2:	83 ec 30             	sub    $0x30,%esp
 80487a5:	e8 6a 09 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 80487aa:	81 c1 56 68 00 00    	add    $0x6856,%ecx
 80487b0:	8b 45 08             	mov    0x8(%ebp),%eax
 80487b3:	89 45 dc             	mov    %eax,-0x24(%ebp)
 80487b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
 80487bc:	8b 45 10             	mov    0x10(%ebp),%eax
 80487bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80487c2:	8b 45 14             	mov    0x14(%ebp),%eax
 80487c5:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80487c8:	8b 45 18             	mov    0x18(%ebp),%eax
 80487cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80487ce:	8b 45 1c             	mov    0x1c(%ebp),%eax
 80487d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80487d4:	8d 45 dc             	lea    -0x24(%ebp),%eax
 80487d7:	c7 45 fc 18 00 00 00 	movl   $0x18,-0x4(%ebp)
 80487de:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80487e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80487e4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80487e7:	cd 2e                	int    $0x2e
 80487e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80487ec:	b8 27 00 00 00       	mov    $0x27,%eax
 80487f1:	cd 2e                	int    $0x2e
 80487f3:	89 c2                	mov    %eax,%edx
 80487f5:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 80487fb:	89 10                	mov    %edx,(%eax)
 80487fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048800:	c9                   	leave  
 8048801:	c3                   	ret    

08048802 <munmap>:
 8048802:	55                   	push   %ebp
 8048803:	89 e5                	mov    %esp,%ebp
 8048805:	83 ec 20             	sub    $0x20,%esp
 8048808:	e8 07 09 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 804880d:	81 c1 f3 67 00 00    	add    $0x67f3,%ecx
 8048813:	8b 45 08             	mov    0x8(%ebp),%eax
 8048816:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048819:	8b 45 0c             	mov    0xc(%ebp),%eax
 804881c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804881f:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8048822:	c7 45 fc 1a 00 00 00 	movl   $0x1a,-0x4(%ebp)
 8048829:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804882c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804882f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048832:	cd 2e                	int    $0x2e
 8048834:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048837:	b8 27 00 00 00       	mov    $0x27,%eax
 804883c:	cd 2e                	int    $0x2e
 804883e:	89 c2                	mov    %eax,%edx
 8048840:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048846:	89 10                	mov    %edx,(%eax)
 8048848:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804884b:	c9                   	leave  
 804884c:	c3                   	ret    

0804884d <sync>:
 804884d:	55                   	push   %ebp
 804884e:	89 e5                	mov    %esp,%ebp
 8048850:	83 ec 10             	sub    $0x10,%esp
 8048853:	e8 bc 08 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048858:	81 c1 a8 67 00 00    	add    $0x67a8,%ecx
 804885e:	c7 45 fc 0f 00 00 00 	movl   $0xf,-0x4(%ebp)
 8048865:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 804886c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804886f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048872:	cd 2e                	int    $0x2e
 8048874:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048877:	b8 27 00 00 00       	mov    $0x27,%eax
 804887c:	cd 2e                	int    $0x2e
 804887e:	89 c2                	mov    %eax,%edx
 8048880:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048886:	89 10                	mov    %edx,(%eax)
 8048888:	90                   	nop
 8048889:	c9                   	leave  
 804888a:	c3                   	ret    

0804888b <open>:
 804888b:	55                   	push   %ebp
 804888c:	89 e5                	mov    %esp,%ebp
 804888e:	53                   	push   %ebx
 804888f:	83 ec 34             	sub    $0x34,%esp
 8048892:	e8 81 08 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 8048897:	81 c3 69 67 00 00    	add    $0x6769,%ebx
 804889d:	8b 45 08             	mov    0x8(%ebp),%eax
 80488a0:	89 04 24             	mov    %eax,(%esp)
 80488a3:	e8 e1 0a 00 00       	call   8049389 <strlen>
 80488a8:	89 45 e0             	mov    %eax,-0x20(%ebp)
 80488ab:	8b 45 08             	mov    0x8(%ebp),%eax
 80488ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
 80488b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80488b7:	8b 45 10             	mov    0x10(%ebp),%eax
 80488ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80488bd:	8d 45 dc             	lea    -0x24(%ebp),%eax
 80488c0:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
 80488c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80488ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80488cd:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80488d0:	cd 2e                	int    $0x2e
 80488d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80488d5:	b8 27 00 00 00       	mov    $0x27,%eax
 80488da:	cd 2e                	int    $0x2e
 80488dc:	89 c2                	mov    %eax,%edx
 80488de:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 80488e4:	89 10                	mov    %edx,(%eax)
 80488e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80488e9:	83 c4 34             	add    $0x34,%esp
 80488ec:	5b                   	pop    %ebx
 80488ed:	5d                   	pop    %ebp
 80488ee:	c3                   	ret    

080488ef <lseek>:
 80488ef:	55                   	push   %ebp
 80488f0:	89 e5                	mov    %esp,%ebp
 80488f2:	83 ec 20             	sub    $0x20,%esp
 80488f5:	e8 1a 08 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 80488fa:	81 c1 06 67 00 00    	add    $0x6706,%ecx
 8048900:	8b 45 08             	mov    0x8(%ebp),%eax
 8048903:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048906:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048909:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804890c:	8b 45 10             	mov    0x10(%ebp),%eax
 804890f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048912:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048915:	c7 45 fc 0e 00 00 00 	movl   $0xe,-0x4(%ebp)
 804891c:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804891f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048922:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048925:	cd 2e                	int    $0x2e
 8048927:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804892a:	b8 27 00 00 00       	mov    $0x27,%eax
 804892f:	cd 2e                	int    $0x2e
 8048931:	89 c2                	mov    %eax,%edx
 8048933:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048939:	89 10                	mov    %edx,(%eax)
 804893b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804893e:	c9                   	leave  
 804893f:	c3                   	ret    

08048940 <read>:
 8048940:	55                   	push   %ebp
 8048941:	89 e5                	mov    %esp,%ebp
 8048943:	83 ec 20             	sub    $0x20,%esp
 8048946:	e8 c9 07 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 804894b:	81 c1 b5 66 00 00    	add    $0x66b5,%ecx
 8048951:	8b 45 08             	mov    0x8(%ebp),%eax
 8048954:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048957:	8b 45 0c             	mov    0xc(%ebp),%eax
 804895a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804895d:	8b 45 10             	mov    0x10(%ebp),%eax
 8048960:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048963:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048966:	c7 45 fc 03 00 00 00 	movl   $0x3,-0x4(%ebp)
 804896d:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048970:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048973:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048976:	cd 2e                	int    $0x2e
 8048978:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804897b:	b8 27 00 00 00       	mov    $0x27,%eax
 8048980:	cd 2e                	int    $0x2e
 8048982:	89 c2                	mov    %eax,%edx
 8048984:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 804898a:	89 10                	mov    %edx,(%eax)
 804898c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804898f:	c9                   	leave  
 8048990:	c3                   	ret    

08048991 <write>:
 8048991:	55                   	push   %ebp
 8048992:	89 e5                	mov    %esp,%ebp
 8048994:	83 ec 20             	sub    $0x20,%esp
 8048997:	e8 78 07 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 804899c:	81 c1 64 66 00 00    	add    $0x6664,%ecx
 80489a2:	8b 45 08             	mov    0x8(%ebp),%eax
 80489a5:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80489a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80489ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80489ae:	8b 45 10             	mov    0x10(%ebp),%eax
 80489b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80489b4:	8d 45 e8             	lea    -0x18(%ebp),%eax
 80489b7:	c7 45 fc 04 00 00 00 	movl   $0x4,-0x4(%ebp)
 80489be:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80489c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80489c4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80489c7:	cd 2e                	int    $0x2e
 80489c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80489cc:	b8 27 00 00 00       	mov    $0x27,%eax
 80489d1:	cd 2e                	int    $0x2e
 80489d3:	89 c2                	mov    %eax,%edx
 80489d5:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 80489db:	89 10                	mov    %edx,(%eax)
 80489dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80489e0:	c9                   	leave  
 80489e1:	c3                   	ret    

080489e2 <close>:
 80489e2:	55                   	push   %ebp
 80489e3:	89 e5                	mov    %esp,%ebp
 80489e5:	83 ec 10             	sub    $0x10,%esp
 80489e8:	e8 27 07 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 80489ed:	81 c1 13 66 00 00    	add    $0x6613,%ecx
 80489f3:	8b 45 08             	mov    0x8(%ebp),%eax
 80489f6:	c7 45 fc 06 00 00 00 	movl   $0x6,-0x4(%ebp)
 80489fd:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048a00:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048a03:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048a06:	cd 2e                	int    $0x2e
 8048a08:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048a0b:	b8 27 00 00 00       	mov    $0x27,%eax
 8048a10:	cd 2e                	int    $0x2e
 8048a12:	89 c2                	mov    %eax,%edx
 8048a14:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048a1a:	89 10                	mov    %edx,(%eax)
 8048a1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a1f:	90                   	nop
 8048a20:	c9                   	leave  
 8048a21:	c3                   	ret    

08048a22 <dup>:
 8048a22:	55                   	push   %ebp
 8048a23:	89 e5                	mov    %esp,%ebp
 8048a25:	83 ec 10             	sub    $0x10,%esp
 8048a28:	e8 e7 06 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048a2d:	81 c1 d3 65 00 00    	add    $0x65d3,%ecx
 8048a33:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a36:	c7 45 fc 11 00 00 00 	movl   $0x11,-0x4(%ebp)
 8048a3d:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048a40:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048a43:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048a46:	cd 2e                	int    $0x2e
 8048a48:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048a4b:	b8 27 00 00 00       	mov    $0x27,%eax
 8048a50:	cd 2e                	int    $0x2e
 8048a52:	89 c2                	mov    %eax,%edx
 8048a54:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048a5a:	89 10                	mov    %edx,(%eax)
 8048a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a5f:	90                   	nop
 8048a60:	c9                   	leave  
 8048a61:	c3                   	ret    

08048a62 <dup2>:
 8048a62:	55                   	push   %ebp
 8048a63:	89 e5                	mov    %esp,%ebp
 8048a65:	83 ec 20             	sub    $0x20,%esp
 8048a68:	e8 a7 06 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048a6d:	81 c1 93 65 00 00    	add    $0x6593,%ecx
 8048a73:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a76:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048a79:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048a7c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048a7f:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8048a82:	c7 45 fc 2b 00 00 00 	movl   $0x2b,-0x4(%ebp)
 8048a89:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048a8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048a8f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048a92:	cd 2e                	int    $0x2e
 8048a94:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048a97:	b8 27 00 00 00       	mov    $0x27,%eax
 8048a9c:	cd 2e                	int    $0x2e
 8048a9e:	89 c2                	mov    %eax,%edx
 8048aa0:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048aa6:	89 10                	mov    %edx,(%eax)
 8048aa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048aab:	c9                   	leave  
 8048aac:	c3                   	ret    

08048aad <mkdir>:
 8048aad:	55                   	push   %ebp
 8048aae:	89 e5                	mov    %esp,%ebp
 8048ab0:	53                   	push   %ebx
 8048ab1:	83 ec 34             	sub    $0x34,%esp
 8048ab4:	e8 5f 06 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 8048ab9:	81 c3 47 65 00 00    	add    $0x6547,%ebx
 8048abf:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ac2:	89 04 24             	mov    %eax,(%esp)
 8048ac5:	e8 bf 08 00 00       	call   8049389 <strlen>
 8048aca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048acd:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ad0:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048ad3:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048ad6:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048ad9:	8d 45 e0             	lea    -0x20(%ebp),%eax
 8048adc:	c7 45 f4 16 00 00 00 	movl   $0x16,-0xc(%ebp)
 8048ae3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048ae6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ae9:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048aec:	cd 2e                	int    $0x2e
 8048aee:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048af1:	b8 27 00 00 00       	mov    $0x27,%eax
 8048af6:	cd 2e                	int    $0x2e
 8048af8:	89 c2                	mov    %eax,%edx
 8048afa:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048b00:	89 10                	mov    %edx,(%eax)
 8048b02:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048b05:	83 c4 34             	add    $0x34,%esp
 8048b08:	5b                   	pop    %ebx
 8048b09:	5d                   	pop    %ebp
 8048b0a:	c3                   	ret    

08048b0b <rmdir>:
 8048b0b:	55                   	push   %ebp
 8048b0c:	89 e5                	mov    %esp,%ebp
 8048b0e:	53                   	push   %ebx
 8048b0f:	83 ec 34             	sub    $0x34,%esp
 8048b12:	e8 01 06 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 8048b17:	81 c3 e9 64 00 00    	add    $0x64e9,%ebx
 8048b1d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b20:	89 04 24             	mov    %eax,(%esp)
 8048b23:	e8 61 08 00 00       	call   8049389 <strlen>
 8048b28:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048b2b:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b2e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048b31:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8048b34:	c7 45 f4 15 00 00 00 	movl   $0x15,-0xc(%ebp)
 8048b3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048b3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b41:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048b44:	cd 2e                	int    $0x2e
 8048b46:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048b49:	b8 27 00 00 00       	mov    $0x27,%eax
 8048b4e:	cd 2e                	int    $0x2e
 8048b50:	89 c2                	mov    %eax,%edx
 8048b52:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048b58:	89 10                	mov    %edx,(%eax)
 8048b5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048b5d:	83 c4 34             	add    $0x34,%esp
 8048b60:	5b                   	pop    %ebx
 8048b61:	5d                   	pop    %ebp
 8048b62:	c3                   	ret    

08048b63 <unlink>:
 8048b63:	55                   	push   %ebp
 8048b64:	89 e5                	mov    %esp,%ebp
 8048b66:	53                   	push   %ebx
 8048b67:	83 ec 34             	sub    $0x34,%esp
 8048b6a:	e8 a9 05 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 8048b6f:	81 c3 91 64 00 00    	add    $0x6491,%ebx
 8048b75:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b78:	89 04 24             	mov    %eax,(%esp)
 8048b7b:	e8 09 08 00 00       	call   8049389 <strlen>
 8048b80:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048b83:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b86:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048b89:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8048b8c:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
 8048b93:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048b96:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b99:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048b9c:	cd 2e                	int    $0x2e
 8048b9e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048ba1:	b8 27 00 00 00       	mov    $0x27,%eax
 8048ba6:	cd 2e                	int    $0x2e
 8048ba8:	89 c2                	mov    %eax,%edx
 8048baa:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048bb0:	89 10                	mov    %edx,(%eax)
 8048bb2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048bb5:	83 c4 34             	add    $0x34,%esp
 8048bb8:	5b                   	pop    %ebx
 8048bb9:	5d                   	pop    %ebp
 8048bba:	c3                   	ret    

08048bbb <link>:
 8048bbb:	55                   	push   %ebp
 8048bbc:	89 e5                	mov    %esp,%ebp
 8048bbe:	53                   	push   %ebx
 8048bbf:	83 ec 34             	sub    $0x34,%esp
 8048bc2:	e8 51 05 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 8048bc7:	81 c3 39 64 00 00    	add    $0x6439,%ebx
 8048bcd:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bd0:	89 04 24             	mov    %eax,(%esp)
 8048bd3:	e8 b1 07 00 00       	call   8049389 <strlen>
 8048bd8:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048bdb:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bde:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048be1:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048be4:	89 04 24             	mov    %eax,(%esp)
 8048be7:	e8 9d 07 00 00       	call   8049389 <strlen>
 8048bec:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048bef:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048bf2:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8048bf5:	8d 45 dc             	lea    -0x24(%ebp),%eax
 8048bf8:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
 8048bff:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048c02:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c05:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048c08:	cd 2e                	int    $0x2e
 8048c0a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048c0d:	b8 27 00 00 00       	mov    $0x27,%eax
 8048c12:	cd 2e                	int    $0x2e
 8048c14:	89 c2                	mov    %eax,%edx
 8048c16:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048c1c:	89 10                	mov    %edx,(%eax)
 8048c1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048c21:	83 c4 34             	add    $0x34,%esp
 8048c24:	5b                   	pop    %ebx
 8048c25:	5d                   	pop    %ebp
 8048c26:	c3                   	ret    

08048c27 <rename>:
 8048c27:	55                   	push   %ebp
 8048c28:	89 e5                	mov    %esp,%ebp
 8048c2a:	53                   	push   %ebx
 8048c2b:	83 ec 34             	sub    $0x34,%esp
 8048c2e:	e8 e5 04 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 8048c33:	81 c3 cd 63 00 00    	add    $0x63cd,%ebx
 8048c39:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c3c:	89 04 24             	mov    %eax,(%esp)
 8048c3f:	e8 45 07 00 00       	call   8049389 <strlen>
 8048c44:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048c47:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c4a:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8048c4d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c50:	89 04 24             	mov    %eax,(%esp)
 8048c53:	e8 31 07 00 00       	call   8049389 <strlen>
 8048c58:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048c5b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c5e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048c61:	8d 45 dc             	lea    -0x24(%ebp),%eax
 8048c64:	c7 45 f4 1b 00 00 00 	movl   $0x1b,-0xc(%ebp)
 8048c6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c71:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048c74:	cd 2e                	int    $0x2e
 8048c76:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048c79:	b8 27 00 00 00       	mov    $0x27,%eax
 8048c7e:	cd 2e                	int    $0x2e
 8048c80:	89 c2                	mov    %eax,%edx
 8048c82:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048c88:	89 10                	mov    %edx,(%eax)
 8048c8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048c8d:	83 c4 34             	add    $0x34,%esp
 8048c90:	5b                   	pop    %ebx
 8048c91:	5d                   	pop    %ebp
 8048c92:	c3                   	ret    

08048c93 <chdir>:
 8048c93:	55                   	push   %ebp
 8048c94:	89 e5                	mov    %esp,%ebp
 8048c96:	53                   	push   %ebx
 8048c97:	83 ec 34             	sub    $0x34,%esp
 8048c9a:	e8 79 04 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 8048c9f:	81 c3 61 63 00 00    	add    $0x6361,%ebx
 8048ca5:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ca8:	89 04 24             	mov    %eax,(%esp)
 8048cab:	e8 d9 06 00 00       	call   8049389 <strlen>
 8048cb0:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048cb3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048cb6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048cb9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8048cbc:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 8048cc3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048cc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cc9:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048ccc:	cd 2e                	int    $0x2e
 8048cce:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048cd1:	b8 27 00 00 00       	mov    $0x27,%eax
 8048cd6:	cd 2e                	int    $0x2e
 8048cd8:	89 c2                	mov    %eax,%edx
 8048cda:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048ce0:	89 10                	mov    %edx,(%eax)
 8048ce2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048ce5:	83 c4 34             	add    $0x34,%esp
 8048ce8:	5b                   	pop    %ebx
 8048ce9:	5d                   	pop    %ebp
 8048cea:	c3                   	ret    

08048ceb <get_free_mem>:
 8048ceb:	55                   	push   %ebp
 8048cec:	89 e5                	mov    %esp,%ebp
 8048cee:	83 ec 10             	sub    $0x10,%esp
 8048cf1:	e8 1e 04 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048cf6:	81 c1 0a 63 00 00    	add    $0x630a,%ecx
 8048cfc:	c7 45 fc 29 00 00 00 	movl   $0x29,-0x4(%ebp)
 8048d03:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8048d0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d0d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048d10:	cd 2e                	int    $0x2e
 8048d12:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d15:	b8 27 00 00 00       	mov    $0x27,%eax
 8048d1a:	cd 2e                	int    $0x2e
 8048d1c:	89 c2                	mov    %eax,%edx
 8048d1e:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048d24:	89 10                	mov    %edx,(%eax)
 8048d26:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d29:	c9                   	leave  
 8048d2a:	c3                   	ret    

08048d2b <execve>:
 8048d2b:	55                   	push   %ebp
 8048d2c:	89 e5                	mov    %esp,%ebp
 8048d2e:	56                   	push   %esi
 8048d2f:	53                   	push   %ebx
 8048d30:	83 ec 40             	sub    $0x40,%esp
 8048d33:	e8 e0 03 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 8048d38:	81 c3 c8 62 00 00    	add    $0x62c8,%ebx
 8048d3e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d41:	89 04 24             	mov    %eax,(%esp)
 8048d44:	e8 40 06 00 00       	call   8049389 <strlen>
 8048d49:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 8048d4c:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d4f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8048d52:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048d59:	eb 03                	jmp    8048d5e <execve+0x33>
 8048d5b:	ff 45 f4             	incl   -0xc(%ebp)
 8048d5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d61:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048d68:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048d6b:	01 d0                	add    %edx,%eax
 8048d6d:	8b 00                	mov    (%eax),%eax
 8048d6f:	85 c0                	test   %eax,%eax
 8048d71:	75 e8                	jne    8048d5b <execve+0x30>
 8048d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d76:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8048d79:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048d7c:	40                   	inc    %eax
 8048d7d:	c1 e0 03             	shl    $0x3,%eax
 8048d80:	89 04 24             	mov    %eax,(%esp)
 8048d83:	e8 c5 2a 00 00       	call   804b84d <malloc>
 8048d88:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8048d8b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048d92:	eb 49                	jmp    8048ddd <execve+0xb2>
 8048d94:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048d97:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048d9a:	c1 e2 03             	shl    $0x3,%edx
 8048d9d:	8d 34 10             	lea    (%eax,%edx,1),%esi
 8048da0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048da3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048daa:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048dad:	01 d0                	add    %edx,%eax
 8048daf:	8b 00                	mov    (%eax),%eax
 8048db1:	89 04 24             	mov    %eax,(%esp)
 8048db4:	e8 d0 05 00 00       	call   8049389 <strlen>
 8048db9:	89 46 04             	mov    %eax,0x4(%esi)
 8048dbc:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048dbf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048dc2:	c1 e2 03             	shl    $0x3,%edx
 8048dc5:	01 c2                	add    %eax,%edx
 8048dc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048dca:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 8048dd1:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048dd4:	01 c8                	add    %ecx,%eax
 8048dd6:	8b 00                	mov    (%eax),%eax
 8048dd8:	89 02                	mov    %eax,(%edx)
 8048dda:	ff 45 f4             	incl   -0xc(%ebp)
 8048ddd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048de0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048de7:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048dea:	01 d0                	add    %edx,%eax
 8048dec:	8b 00                	mov    (%eax),%eax
 8048dee:	85 c0                	test   %eax,%eax
 8048df0:	75 a2                	jne    8048d94 <execve+0x69>
 8048df2:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048df5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048df8:	c1 e2 03             	shl    $0x3,%edx
 8048dfb:	01 d0                	add    %edx,%eax
 8048dfd:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8048e04:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048e07:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048e0a:	c1 e2 03             	shl    $0x3,%edx
 8048e0d:	01 d0                	add    %edx,%eax
 8048e0f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 8048e15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048e1c:	eb 03                	jmp    8048e21 <execve+0xf6>
 8048e1e:	ff 45 f4             	incl   -0xc(%ebp)
 8048e21:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e24:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048e2b:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e2e:	01 d0                	add    %edx,%eax
 8048e30:	8b 00                	mov    (%eax),%eax
 8048e32:	85 c0                	test   %eax,%eax
 8048e34:	75 e8                	jne    8048e1e <execve+0xf3>
 8048e36:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e39:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048e3c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048e3f:	40                   	inc    %eax
 8048e40:	c1 e0 03             	shl    $0x3,%eax
 8048e43:	89 04 24             	mov    %eax,(%esp)
 8048e46:	e8 02 2a 00 00       	call   804b84d <malloc>
 8048e4b:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048e4e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048e55:	eb 49                	jmp    8048ea0 <execve+0x175>
 8048e57:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048e5a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048e5d:	c1 e2 03             	shl    $0x3,%edx
 8048e60:	8d 34 10             	lea    (%eax,%edx,1),%esi
 8048e63:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e66:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048e6d:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e70:	01 d0                	add    %edx,%eax
 8048e72:	8b 00                	mov    (%eax),%eax
 8048e74:	89 04 24             	mov    %eax,(%esp)
 8048e77:	e8 0d 05 00 00       	call   8049389 <strlen>
 8048e7c:	89 46 04             	mov    %eax,0x4(%esi)
 8048e7f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048e82:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048e85:	c1 e2 03             	shl    $0x3,%edx
 8048e88:	01 c2                	add    %eax,%edx
 8048e8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e8d:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 8048e94:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e97:	01 c8                	add    %ecx,%eax
 8048e99:	8b 00                	mov    (%eax),%eax
 8048e9b:	89 02                	mov    %eax,(%edx)
 8048e9d:	ff 45 f4             	incl   -0xc(%ebp)
 8048ea0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ea3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048eaa:	8b 45 10             	mov    0x10(%ebp),%eax
 8048ead:	01 d0                	add    %edx,%eax
 8048eaf:	8b 00                	mov    (%eax),%eax
 8048eb1:	85 c0                	test   %eax,%eax
 8048eb3:	75 a2                	jne    8048e57 <execve+0x12c>
 8048eb5:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048eb8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048ebb:	c1 e2 03             	shl    $0x3,%edx
 8048ebe:	01 d0                	add    %edx,%eax
 8048ec0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8048ec7:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048eca:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048ecd:	c1 e2 03             	shl    $0x3,%edx
 8048ed0:	01 d0                	add    %edx,%eax
 8048ed2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 8048ed8:	8d 45 d0             	lea    -0x30(%ebp),%eax
 8048edb:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
 8048ee2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048ee5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048ee8:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048eeb:	cd 2e                	int    $0x2e
 8048eed:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048ef0:	b8 27 00 00 00       	mov    $0x27,%eax
 8048ef5:	cd 2e                	int    $0x2e
 8048ef7:	89 c2                	mov    %eax,%edx
 8048ef9:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048eff:	89 10                	mov    %edx,(%eax)
 8048f01:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048f04:	83 c4 40             	add    $0x40,%esp
 8048f07:	5b                   	pop    %ebx
 8048f08:	5e                   	pop    %esi
 8048f09:	5d                   	pop    %ebp
 8048f0a:	c3                   	ret    

08048f0b <thr_set_errno>:
 8048f0b:	55                   	push   %ebp
 8048f0c:	89 e5                	mov    %esp,%ebp
 8048f0e:	83 ec 10             	sub    $0x10,%esp
 8048f11:	e8 fe 01 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048f16:	81 c1 ea 60 00 00    	add    $0x60ea,%ecx
 8048f1c:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f1f:	c7 45 fc 2a 00 00 00 	movl   $0x2a,-0x4(%ebp)
 8048f26:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048f29:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048f2c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f2f:	cd 2e                	int    $0x2e
 8048f31:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048f34:	b8 27 00 00 00       	mov    $0x27,%eax
 8048f39:	cd 2e                	int    $0x2e
 8048f3b:	89 c2                	mov    %eax,%edx
 8048f3d:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048f43:	89 10                	mov    %edx,(%eax)
 8048f45:	90                   	nop
 8048f46:	c9                   	leave  
 8048f47:	c3                   	ret    

08048f48 <thr_errno>:
 8048f48:	55                   	push   %ebp
 8048f49:	89 e5                	mov    %esp,%ebp
 8048f4b:	83 ec 10             	sub    $0x10,%esp
 8048f4e:	e8 c1 01 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048f53:	81 c1 ad 60 00 00    	add    $0x60ad,%ecx
 8048f59:	c7 45 fc 27 00 00 00 	movl   $0x27,-0x4(%ebp)
 8048f60:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8048f67:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048f6a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f6d:	cd 2e                	int    $0x2e
 8048f6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048f72:	b8 27 00 00 00       	mov    $0x27,%eax
 8048f77:	cd 2e                	int    $0x2e
 8048f79:	89 c2                	mov    %eax,%edx
 8048f7b:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048f81:	89 10                	mov    %edx,(%eax)
 8048f83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f86:	90                   	nop
 8048f87:	c9                   	leave  
 8048f88:	c3                   	ret    

08048f89 <getdents>:
 8048f89:	55                   	push   %ebp
 8048f8a:	89 e5                	mov    %esp,%ebp
 8048f8c:	83 ec 20             	sub    $0x20,%esp
 8048f8f:	e8 80 01 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8048f94:	81 c1 6c 60 00 00    	add    $0x606c,%ecx
 8048f9a:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f9d:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048fa0:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048fa3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048fa6:	8b 45 10             	mov    0x10(%ebp),%eax
 8048fa9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048fac:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048faf:	c7 45 fc 17 00 00 00 	movl   $0x17,-0x4(%ebp)
 8048fb6:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048fb9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048fbc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048fbf:	cd 2e                	int    $0x2e
 8048fc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048fc4:	b8 27 00 00 00       	mov    $0x27,%eax
 8048fc9:	cd 2e                	int    $0x2e
 8048fcb:	89 c2                	mov    %eax,%edx
 8048fcd:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8048fd3:	89 10                	mov    %edx,(%eax)
 8048fd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048fd8:	c9                   	leave  
 8048fd9:	c3                   	ret    

08048fda <stat>:
 8048fda:	55                   	push   %ebp
 8048fdb:	89 e5                	mov    %esp,%ebp
 8048fdd:	53                   	push   %ebx
 8048fde:	83 ec 34             	sub    $0x34,%esp
 8048fe1:	e8 32 01 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 8048fe6:	81 c3 1a 60 00 00    	add    $0x601a,%ebx
 8048fec:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fef:	89 04 24             	mov    %eax,(%esp)
 8048ff2:	e8 92 03 00 00       	call   8049389 <strlen>
 8048ff7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048ffa:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ffd:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8049000:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049003:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049006:	8d 45 e0             	lea    -0x20(%ebp),%eax
 8049009:	c7 45 f4 2f 00 00 00 	movl   $0x2f,-0xc(%ebp)
 8049010:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049013:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049016:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8049019:	cd 2e                	int    $0x2e
 804901b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804901e:	b8 27 00 00 00       	mov    $0x27,%eax
 8049023:	cd 2e                	int    $0x2e
 8049025:	89 c2                	mov    %eax,%edx
 8049027:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 804902d:	89 10                	mov    %edx,(%eax)
 804902f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049032:	83 c4 34             	add    $0x34,%esp
 8049035:	5b                   	pop    %ebx
 8049036:	5d                   	pop    %ebp
 8049037:	c3                   	ret    

08049038 <pipe>:
 8049038:	55                   	push   %ebp
 8049039:	89 e5                	mov    %esp,%ebp
 804903b:	83 ec 10             	sub    $0x10,%esp
 804903e:	e8 d1 00 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8049043:	81 c1 bd 5f 00 00    	add    $0x5fbd,%ecx
 8049049:	8b 45 08             	mov    0x8(%ebp),%eax
 804904c:	c7 45 fc 12 00 00 00 	movl   $0x12,-0x4(%ebp)
 8049053:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049056:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049059:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804905c:	cd 2e                	int    $0x2e
 804905e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049061:	b8 27 00 00 00       	mov    $0x27,%eax
 8049066:	cd 2e                	int    $0x2e
 8049068:	89 c2                	mov    %eax,%edx
 804906a:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8049070:	89 10                	mov    %edx,(%eax)
 8049072:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049075:	90                   	nop
 8049076:	c9                   	leave  
 8049077:	c3                   	ret    

08049078 <uname>:
 8049078:	55                   	push   %ebp
 8049079:	89 e5                	mov    %esp,%ebp
 804907b:	83 ec 10             	sub    $0x10,%esp
 804907e:	e8 91 00 00 00       	call   8049114 <__x86.get_pc_thunk.cx>
 8049083:	81 c1 7d 5f 00 00    	add    $0x5f7d,%ecx
 8049089:	8b 45 08             	mov    0x8(%ebp),%eax
 804908c:	c7 45 fc 1c 00 00 00 	movl   $0x1c,-0x4(%ebp)
 8049093:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049096:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049099:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804909c:	cd 2e                	int    $0x2e
 804909e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80490a1:	b8 27 00 00 00       	mov    $0x27,%eax
 80490a6:	cd 2e                	int    $0x2e
 80490a8:	89 c2                	mov    %eax,%edx
 80490aa:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 80490b0:	89 10                	mov    %edx,(%eax)
 80490b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490b5:	90                   	nop
 80490b6:	c9                   	leave  
 80490b7:	c3                   	ret    

080490b8 <debug>:
 80490b8:	55                   	push   %ebp
 80490b9:	89 e5                	mov    %esp,%ebp
 80490bb:	53                   	push   %ebx
 80490bc:	83 ec 34             	sub    $0x34,%esp
 80490bf:	e8 54 00 00 00       	call   8049118 <__x86.get_pc_thunk.bx>
 80490c4:	81 c3 3c 5f 00 00    	add    $0x5f3c,%ebx
 80490ca:	8b 45 08             	mov    0x8(%ebp),%eax
 80490cd:	89 04 24             	mov    %eax,(%esp)
 80490d0:	e8 b4 02 00 00       	call   8049389 <strlen>
 80490d5:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80490d8:	8b 45 08             	mov    0x8(%ebp),%eax
 80490db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80490de:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 80490e1:	c7 45 f4 29 23 00 00 	movl   $0x2329,-0xc(%ebp)
 80490e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80490eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490ee:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80490f1:	cd 2e                	int    $0x2e
 80490f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80490f6:	b8 27 00 00 00       	mov    $0x27,%eax
 80490fb:	cd 2e                	int    $0x2e
 80490fd:	89 c2                	mov    %eax,%edx
 80490ff:	8d 05 64 f2 04 08    	lea    0x804f264,%eax
 8049105:	89 10                	mov    %edx,(%eax)
 8049107:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804910a:	83 c4 34             	add    $0x34,%esp
 804910d:	5b                   	pop    %ebx
 804910e:	5d                   	pop    %ebp
 804910f:	c3                   	ret    

08049110 <__x86.get_pc_thunk.ax>:
 8049110:	8b 04 24             	mov    (%esp),%eax
 8049113:	c3                   	ret    

08049114 <__x86.get_pc_thunk.cx>:
 8049114:	8b 0c 24             	mov    (%esp),%ecx
 8049117:	c3                   	ret    

08049118 <__x86.get_pc_thunk.bx>:
 8049118:	8b 1c 24             	mov    (%esp),%ebx
 804911b:	c3                   	ret    

0804911c <memcmp>:
 804911c:	55                   	push   %ebp
 804911d:	89 e5                	mov    %esp,%ebp
 804911f:	83 ec 10             	sub    $0x10,%esp
 8049122:	e8 e9 ff ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 8049127:	05 d9 5e 00 00       	add    $0x5ed9,%eax
 804912c:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
 8049130:	8b 45 08             	mov    0x8(%ebp),%eax
 8049133:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049136:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049139:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804913c:	eb 22                	jmp    8049160 <memcmp+0x44>
 804913e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049141:	0f b6 10             	movzbl (%eax),%edx
 8049144:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049147:	0f b6 00             	movzbl (%eax),%eax
 804914a:	28 c2                	sub    %al,%dl
 804914c:	88 d0                	mov    %dl,%al
 804914e:	88 45 f7             	mov    %al,-0x9(%ebp)
 8049151:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
 8049155:	75 11                	jne    8049168 <memcmp+0x4c>
 8049157:	ff 45 fc             	incl   -0x4(%ebp)
 804915a:	ff 45 f8             	incl   -0x8(%ebp)
 804915d:	ff 4d 10             	decl   0x10(%ebp)
 8049160:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049164:	75 d8                	jne    804913e <memcmp+0x22>
 8049166:	eb 01                	jmp    8049169 <memcmp+0x4d>
 8049168:	90                   	nop
 8049169:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
 804916d:	c9                   	leave  
 804916e:	c3                   	ret    

0804916f <memcpy>:
 804916f:	55                   	push   %ebp
 8049170:	89 e5                	mov    %esp,%ebp
 8049172:	83 ec 10             	sub    $0x10,%esp
 8049175:	e8 96 ff ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804917a:	05 86 5e 00 00       	add    $0x5e86,%eax
 804917f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049182:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049185:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049188:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804918b:	eb 17                	jmp    80491a4 <memcpy+0x35>
 804918d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049190:	8d 50 01             	lea    0x1(%eax),%edx
 8049193:	89 55 fc             	mov    %edx,-0x4(%ebp)
 8049196:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8049199:	8d 4a 01             	lea    0x1(%edx),%ecx
 804919c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 804919f:	0f b6 12             	movzbl (%edx),%edx
 80491a2:	88 10                	mov    %dl,(%eax)
 80491a4:	8b 45 10             	mov    0x10(%ebp),%eax
 80491a7:	8d 50 ff             	lea    -0x1(%eax),%edx
 80491aa:	89 55 10             	mov    %edx,0x10(%ebp)
 80491ad:	85 c0                	test   %eax,%eax
 80491af:	75 dc                	jne    804918d <memcpy+0x1e>
 80491b1:	8b 45 08             	mov    0x8(%ebp),%eax
 80491b4:	c9                   	leave  
 80491b5:	c3                   	ret    

080491b6 <strncmp>:
 80491b6:	55                   	push   %ebp
 80491b7:	89 e5                	mov    %esp,%ebp
 80491b9:	53                   	push   %ebx
 80491ba:	e8 51 ff ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 80491bf:	05 41 5e 00 00       	add    $0x5e41,%eax
 80491c4:	b3 00                	mov    $0x0,%bl
 80491c6:	eb 31                	jmp    80491f9 <strncmp+0x43>
 80491c8:	8b 45 08             	mov    0x8(%ebp),%eax
 80491cb:	0f b6 00             	movzbl (%eax),%eax
 80491ce:	88 c1                	mov    %al,%cl
 80491d0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491d3:	8d 50 01             	lea    0x1(%eax),%edx
 80491d6:	89 55 0c             	mov    %edx,0xc(%ebp)
 80491d9:	0f b6 00             	movzbl (%eax),%eax
 80491dc:	28 c1                	sub    %al,%cl
 80491de:	88 c8                	mov    %cl,%al
 80491e0:	88 c3                	mov    %al,%bl
 80491e2:	84 db                	test   %bl,%bl
 80491e4:	75 19                	jne    80491ff <strncmp+0x49>
 80491e6:	8b 45 08             	mov    0x8(%ebp),%eax
 80491e9:	8d 50 01             	lea    0x1(%eax),%edx
 80491ec:	89 55 08             	mov    %edx,0x8(%ebp)
 80491ef:	0f b6 00             	movzbl (%eax),%eax
 80491f2:	84 c0                	test   %al,%al
 80491f4:	74 09                	je     80491ff <strncmp+0x49>
 80491f6:	ff 4d 10             	decl   0x10(%ebp)
 80491f9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80491fd:	75 c9                	jne    80491c8 <strncmp+0x12>
 80491ff:	0f be c3             	movsbl %bl,%eax
 8049202:	5b                   	pop    %ebx
 8049203:	5d                   	pop    %ebp
 8049204:	c3                   	ret    

08049205 <strcmp>:
 8049205:	55                   	push   %ebp
 8049206:	89 e5                	mov    %esp,%ebp
 8049208:	53                   	push   %ebx
 8049209:	e8 02 ff ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804920e:	05 f2 5d 00 00       	add    $0x5df2,%eax
 8049213:	8b 45 08             	mov    0x8(%ebp),%eax
 8049216:	0f b6 00             	movzbl (%eax),%eax
 8049219:	88 c1                	mov    %al,%cl
 804921b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804921e:	8d 50 01             	lea    0x1(%eax),%edx
 8049221:	89 55 0c             	mov    %edx,0xc(%ebp)
 8049224:	0f b6 00             	movzbl (%eax),%eax
 8049227:	28 c1                	sub    %al,%cl
 8049229:	88 c8                	mov    %cl,%al
 804922b:	88 c3                	mov    %al,%bl
 804922d:	84 db                	test   %bl,%bl
 804922f:	75 12                	jne    8049243 <strcmp+0x3e>
 8049231:	8b 45 08             	mov    0x8(%ebp),%eax
 8049234:	8d 50 01             	lea    0x1(%eax),%edx
 8049237:	89 55 08             	mov    %edx,0x8(%ebp)
 804923a:	0f b6 00             	movzbl (%eax),%eax
 804923d:	84 c0                	test   %al,%al
 804923f:	74 02                	je     8049243 <strcmp+0x3e>
 8049241:	eb d0                	jmp    8049213 <strcmp+0xe>
 8049243:	0f be c3             	movsbl %bl,%eax
 8049246:	5b                   	pop    %ebx
 8049247:	5d                   	pop    %ebp
 8049248:	c3                   	ret    

08049249 <strcpy>:
 8049249:	55                   	push   %ebp
 804924a:	89 e5                	mov    %esp,%ebp
 804924c:	83 ec 10             	sub    $0x10,%esp
 804924f:	e8 bc fe ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 8049254:	05 ac 5d 00 00       	add    $0x5dac,%eax
 8049259:	8b 45 08             	mov    0x8(%ebp),%eax
 804925c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804925f:	90                   	nop
 8049260:	8b 45 08             	mov    0x8(%ebp),%eax
 8049263:	8d 50 01             	lea    0x1(%eax),%edx
 8049266:	89 55 08             	mov    %edx,0x8(%ebp)
 8049269:	8b 55 0c             	mov    0xc(%ebp),%edx
 804926c:	8d 4a 01             	lea    0x1(%edx),%ecx
 804926f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 8049272:	0f b6 12             	movzbl (%edx),%edx
 8049275:	88 10                	mov    %dl,(%eax)
 8049277:	0f b6 00             	movzbl (%eax),%eax
 804927a:	84 c0                	test   %al,%al
 804927c:	75 e2                	jne    8049260 <strcpy+0x17>
 804927e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049281:	c9                   	leave  
 8049282:	c3                   	ret    

08049283 <strncpy>:
 8049283:	55                   	push   %ebp
 8049284:	89 e5                	mov    %esp,%ebp
 8049286:	83 ec 10             	sub    $0x10,%esp
 8049289:	e8 82 fe ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804928e:	05 72 5d 00 00       	add    $0x5d72,%eax
 8049293:	8b 45 08             	mov    0x8(%ebp),%eax
 8049296:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049299:	90                   	nop
 804929a:	8b 45 10             	mov    0x10(%ebp),%eax
 804929d:	8d 50 ff             	lea    -0x1(%eax),%edx
 80492a0:	89 55 10             	mov    %edx,0x10(%ebp)
 80492a3:	85 c0                	test   %eax,%eax
 80492a5:	74 1e                	je     80492c5 <strncpy+0x42>
 80492a7:	8b 45 08             	mov    0x8(%ebp),%eax
 80492aa:	8d 50 01             	lea    0x1(%eax),%edx
 80492ad:	89 55 08             	mov    %edx,0x8(%ebp)
 80492b0:	8b 55 0c             	mov    0xc(%ebp),%edx
 80492b3:	8d 4a 01             	lea    0x1(%edx),%ecx
 80492b6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 80492b9:	0f b6 12             	movzbl (%edx),%edx
 80492bc:	88 10                	mov    %dl,(%eax)
 80492be:	0f b6 00             	movzbl (%eax),%eax
 80492c1:	84 c0                	test   %al,%al
 80492c3:	75 d5                	jne    804929a <strncpy+0x17>
 80492c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492c8:	c9                   	leave  
 80492c9:	c3                   	ret    

080492ca <memset>:
 80492ca:	55                   	push   %ebp
 80492cb:	89 e5                	mov    %esp,%ebp
 80492cd:	83 ec 10             	sub    $0x10,%esp
 80492d0:	e8 3b fe ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 80492d5:	05 2b 5d 00 00       	add    $0x5d2b,%eax
 80492da:	8b 45 08             	mov    0x8(%ebp),%eax
 80492dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80492e0:	eb 0e                	jmp    80492f0 <memset+0x26>
 80492e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492e5:	8d 50 01             	lea    0x1(%eax),%edx
 80492e8:	89 55 fc             	mov    %edx,-0x4(%ebp)
 80492eb:	8b 55 0c             	mov    0xc(%ebp),%edx
 80492ee:	88 10                	mov    %dl,(%eax)
 80492f0:	8b 45 10             	mov    0x10(%ebp),%eax
 80492f3:	8d 50 ff             	lea    -0x1(%eax),%edx
 80492f6:	89 55 10             	mov    %edx,0x10(%ebp)
 80492f9:	85 c0                	test   %eax,%eax
 80492fb:	75 e5                	jne    80492e2 <memset+0x18>
 80492fd:	8b 45 08             	mov    0x8(%ebp),%eax
 8049300:	c9                   	leave  
 8049301:	c3                   	ret    

08049302 <strnlen>:
 8049302:	55                   	push   %ebp
 8049303:	89 e5                	mov    %esp,%ebp
 8049305:	83 ec 10             	sub    $0x10,%esp
 8049308:	e8 03 fe ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804930d:	05 f3 5c 00 00       	add    $0x5cf3,%eax
 8049312:	8b 45 08             	mov    0x8(%ebp),%eax
 8049315:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049318:	eb 03                	jmp    804931d <strnlen+0x1b>
 804931a:	ff 45 fc             	incl   -0x4(%ebp)
 804931d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049320:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049323:	89 55 0c             	mov    %edx,0xc(%ebp)
 8049326:	85 c0                	test   %eax,%eax
 8049328:	74 0a                	je     8049334 <strnlen+0x32>
 804932a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804932d:	0f b6 00             	movzbl (%eax),%eax
 8049330:	84 c0                	test   %al,%al
 8049332:	75 e6                	jne    804931a <strnlen+0x18>
 8049334:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049337:	8b 45 08             	mov    0x8(%ebp),%eax
 804933a:	29 c2                	sub    %eax,%edx
 804933c:	89 d0                	mov    %edx,%eax
 804933e:	c9                   	leave  
 804933f:	c3                   	ret    

08049340 <strcat>:
 8049340:	55                   	push   %ebp
 8049341:	89 e5                	mov    %esp,%ebp
 8049343:	83 ec 10             	sub    $0x10,%esp
 8049346:	e8 c5 fd ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804934b:	05 b5 5c 00 00       	add    $0x5cb5,%eax
 8049350:	8b 45 08             	mov    0x8(%ebp),%eax
 8049353:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049356:	eb 03                	jmp    804935b <strcat+0x1b>
 8049358:	ff 45 08             	incl   0x8(%ebp)
 804935b:	8b 45 08             	mov    0x8(%ebp),%eax
 804935e:	0f b6 00             	movzbl (%eax),%eax
 8049361:	84 c0                	test   %al,%al
 8049363:	75 f3                	jne    8049358 <strcat+0x18>
 8049365:	90                   	nop
 8049366:	8b 45 08             	mov    0x8(%ebp),%eax
 8049369:	8d 50 01             	lea    0x1(%eax),%edx
 804936c:	89 55 08             	mov    %edx,0x8(%ebp)
 804936f:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049372:	8d 4a 01             	lea    0x1(%edx),%ecx
 8049375:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 8049378:	0f b6 12             	movzbl (%edx),%edx
 804937b:	88 10                	mov    %dl,(%eax)
 804937d:	0f b6 00             	movzbl (%eax),%eax
 8049380:	84 c0                	test   %al,%al
 8049382:	75 e2                	jne    8049366 <strcat+0x26>
 8049384:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049387:	c9                   	leave  
 8049388:	c3                   	ret    

08049389 <strlen>:
 8049389:	55                   	push   %ebp
 804938a:	89 e5                	mov    %esp,%ebp
 804938c:	83 ec 10             	sub    $0x10,%esp
 804938f:	e8 7c fd ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 8049394:	05 6c 5c 00 00       	add    $0x5c6c,%eax
 8049399:	8b 45 08             	mov    0x8(%ebp),%eax
 804939c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804939f:	eb 03                	jmp    80493a4 <strlen+0x1b>
 80493a1:	ff 45 fc             	incl   -0x4(%ebp)
 80493a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80493a7:	0f b6 00             	movzbl (%eax),%eax
 80493aa:	84 c0                	test   %al,%al
 80493ac:	75 f3                	jne    80493a1 <strlen+0x18>
 80493ae:	8b 55 fc             	mov    -0x4(%ebp),%edx
 80493b1:	8b 45 08             	mov    0x8(%ebp),%eax
 80493b4:	29 c2                	sub    %eax,%edx
 80493b6:	89 d0                	mov    %edx,%eax
 80493b8:	c9                   	leave  
 80493b9:	c3                   	ret    

080493ba <strchr>:
 80493ba:	55                   	push   %ebp
 80493bb:	89 e5                	mov    %esp,%ebp
 80493bd:	e8 4e fd ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 80493c2:	05 3e 5c 00 00       	add    $0x5c3e,%eax
 80493c7:	eb 14                	jmp    80493dd <strchr+0x23>
 80493c9:	8b 45 08             	mov    0x8(%ebp),%eax
 80493cc:	0f b6 00             	movzbl (%eax),%eax
 80493cf:	84 c0                	test   %al,%al
 80493d1:	75 07                	jne    80493da <strchr+0x20>
 80493d3:	b8 00 00 00 00       	mov    $0x0,%eax
 80493d8:	eb 13                	jmp    80493ed <strchr+0x33>
 80493da:	ff 45 08             	incl   0x8(%ebp)
 80493dd:	8b 45 08             	mov    0x8(%ebp),%eax
 80493e0:	0f b6 00             	movzbl (%eax),%eax
 80493e3:	8b 55 0c             	mov    0xc(%ebp),%edx
 80493e6:	38 d0                	cmp    %dl,%al
 80493e8:	75 df                	jne    80493c9 <strchr+0xf>
 80493ea:	8b 45 08             	mov    0x8(%ebp),%eax
 80493ed:	5d                   	pop    %ebp
 80493ee:	c3                   	ret    

080493ef <strrchr>:
 80493ef:	55                   	push   %ebp
 80493f0:	89 e5                	mov    %esp,%ebp
 80493f2:	83 ec 10             	sub    $0x10,%esp
 80493f5:	e8 16 fd ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 80493fa:	05 06 5c 00 00       	add    $0x5c06,%eax
 80493ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049406:	eb 16                	jmp    804941e <strrchr+0x2f>
 8049408:	8b 45 08             	mov    0x8(%ebp),%eax
 804940b:	0f b6 00             	movzbl (%eax),%eax
 804940e:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049411:	38 d0                	cmp    %dl,%al
 8049413:	75 06                	jne    804941b <strrchr+0x2c>
 8049415:	8b 45 08             	mov    0x8(%ebp),%eax
 8049418:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804941b:	ff 45 08             	incl   0x8(%ebp)
 804941e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049421:	0f b6 00             	movzbl (%eax),%eax
 8049424:	84 c0                	test   %al,%al
 8049426:	75 e0                	jne    8049408 <strrchr+0x19>
 8049428:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804942b:	c9                   	leave  
 804942c:	c3                   	ret    

0804942d <strstr>:
 804942d:	55                   	push   %ebp
 804942e:	89 e5                	mov    %esp,%ebp
 8049430:	53                   	push   %ebx
 8049431:	83 ec 24             	sub    $0x24,%esp
 8049434:	e8 df fc ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 8049439:	81 c3 c7 5b 00 00    	add    $0x5bc7,%ebx
 804943f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049442:	89 04 24             	mov    %eax,(%esp)
 8049445:	e8 3f ff ff ff       	call   8049389 <strlen>
 804944a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804944d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049451:	75 05                	jne    8049458 <strstr+0x2b>
 8049453:	8b 45 08             	mov    0x8(%ebp),%eax
 8049456:	eb 45                	jmp    804949d <strstr+0x70>
 8049458:	8b 45 08             	mov    0x8(%ebp),%eax
 804945b:	89 04 24             	mov    %eax,(%esp)
 804945e:	e8 26 ff ff ff       	call   8049389 <strlen>
 8049463:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049466:	eb 28                	jmp    8049490 <strstr+0x63>
 8049468:	ff 4d f4             	decl   -0xc(%ebp)
 804946b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804946e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049472:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049475:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049479:	8b 45 08             	mov    0x8(%ebp),%eax
 804947c:	89 04 24             	mov    %eax,(%esp)
 804947f:	e8 98 fc ff ff       	call   804911c <memcmp>
 8049484:	85 c0                	test   %eax,%eax
 8049486:	75 05                	jne    804948d <strstr+0x60>
 8049488:	8b 45 08             	mov    0x8(%ebp),%eax
 804948b:	eb 10                	jmp    804949d <strstr+0x70>
 804948d:	ff 45 08             	incl   0x8(%ebp)
 8049490:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049493:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049496:	7d d0                	jge    8049468 <strstr+0x3b>
 8049498:	b8 00 00 00 00       	mov    $0x0,%eax
 804949d:	83 c4 24             	add    $0x24,%esp
 80494a0:	5b                   	pop    %ebx
 80494a1:	5d                   	pop    %ebp
 80494a2:	c3                   	ret    

080494a3 <strdup>:
 80494a3:	55                   	push   %ebp
 80494a4:	89 e5                	mov    %esp,%ebp
 80494a6:	e8 65 fc ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 80494ab:	05 55 5b 00 00       	add    $0x5b55,%eax
 80494b0:	b8 00 00 00 00       	mov    $0x0,%eax
 80494b5:	5d                   	pop    %ebp
 80494b6:	c3                   	ret    

080494b7 <strpbrk>:
 80494b7:	55                   	push   %ebp
 80494b8:	89 e5                	mov    %esp,%ebp
 80494ba:	83 ec 10             	sub    $0x10,%esp
 80494bd:	e8 4e fc ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 80494c2:	05 3e 5b 00 00       	add    $0x5b3e,%eax
 80494c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494ca:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80494cd:	eb 03                	jmp    80494d2 <strpbrk+0x1b>
 80494cf:	ff 45 fc             	incl   -0x4(%ebp)
 80494d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80494d5:	0f b6 00             	movzbl (%eax),%eax
 80494d8:	84 c0                	test   %al,%al
 80494da:	74 10                	je     80494ec <strpbrk+0x35>
 80494dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80494df:	0f b6 10             	movzbl (%eax),%edx
 80494e2:	8b 45 08             	mov    0x8(%ebp),%eax
 80494e5:	0f b6 00             	movzbl (%eax),%eax
 80494e8:	38 c2                	cmp    %al,%dl
 80494ea:	75 e3                	jne    80494cf <strpbrk+0x18>
 80494ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80494ef:	0f b6 00             	movzbl (%eax),%eax
 80494f2:	84 c0                	test   %al,%al
 80494f4:	74 05                	je     80494fb <strpbrk+0x44>
 80494f6:	8b 45 08             	mov    0x8(%ebp),%eax
 80494f9:	eb 15                	jmp    8049510 <strpbrk+0x59>
 80494fb:	8b 45 08             	mov    0x8(%ebp),%eax
 80494fe:	8d 50 01             	lea    0x1(%eax),%edx
 8049501:	89 55 08             	mov    %edx,0x8(%ebp)
 8049504:	0f b6 00             	movzbl (%eax),%eax
 8049507:	84 c0                	test   %al,%al
 8049509:	75 bc                	jne    80494c7 <strpbrk+0x10>
 804950b:	b8 00 00 00 00       	mov    $0x0,%eax
 8049510:	c9                   	leave  
 8049511:	c3                   	ret    

08049512 <strspn>:
 8049512:	55                   	push   %ebp
 8049513:	89 e5                	mov    %esp,%ebp
 8049515:	83 ec 10             	sub    $0x10,%esp
 8049518:	e8 f3 fb ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804951d:	05 e3 5a 00 00       	add    $0x5ae3,%eax
 8049522:	8b 45 08             	mov    0x8(%ebp),%eax
 8049525:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049528:	eb 32                	jmp    804955c <strspn+0x4a>
 804952a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804952d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049530:	eb 03                	jmp    8049535 <strspn+0x23>
 8049532:	ff 45 fc             	incl   -0x4(%ebp)
 8049535:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049538:	0f b6 00             	movzbl (%eax),%eax
 804953b:	84 c0                	test   %al,%al
 804953d:	74 10                	je     804954f <strspn+0x3d>
 804953f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049542:	0f b6 10             	movzbl (%eax),%edx
 8049545:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049548:	0f b6 00             	movzbl (%eax),%eax
 804954b:	38 c2                	cmp    %al,%dl
 804954d:	75 e3                	jne    8049532 <strspn+0x20>
 804954f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049552:	0f b6 00             	movzbl (%eax),%eax
 8049555:	84 c0                	test   %al,%al
 8049557:	74 0f                	je     8049568 <strspn+0x56>
 8049559:	ff 45 f8             	incl   -0x8(%ebp)
 804955c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804955f:	0f b6 00             	movzbl (%eax),%eax
 8049562:	84 c0                	test   %al,%al
 8049564:	75 c4                	jne    804952a <strspn+0x18>
 8049566:	eb 01                	jmp    8049569 <strspn+0x57>
 8049568:	90                   	nop
 8049569:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804956c:	8b 45 08             	mov    0x8(%ebp),%eax
 804956f:	29 c2                	sub    %eax,%edx
 8049571:	89 d0                	mov    %edx,%eax
 8049573:	c9                   	leave  
 8049574:	c3                   	ret    

08049575 <strtok>:
 8049575:	55                   	push   %ebp
 8049576:	89 e5                	mov    %esp,%ebp
 8049578:	53                   	push   %ebx
 8049579:	83 ec 24             	sub    $0x24,%esp
 804957c:	e8 97 fb ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 8049581:	81 c3 7f 5a 00 00    	add    $0x5a7f,%ebx
 8049587:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804958b:	75 08                	jne    8049595 <strtok+0x20>
 804958d:	8b 83 04 02 00 00    	mov    0x204(%ebx),%eax
 8049593:	eb 03                	jmp    8049598 <strtok+0x23>
 8049595:	8b 45 08             	mov    0x8(%ebp),%eax
 8049598:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804959b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804959f:	75 07                	jne    80495a8 <strtok+0x33>
 80495a1:	b8 00 00 00 00       	mov    $0x0,%eax
 80495a6:	eb 69                	jmp    8049611 <strtok+0x9c>
 80495a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 80495af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80495b2:	89 04 24             	mov    %eax,(%esp)
 80495b5:	e8 58 ff ff ff       	call   8049512 <strspn>
 80495ba:	89 c2                	mov    %eax,%edx
 80495bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80495bf:	01 d0                	add    %edx,%eax
 80495c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80495c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80495c7:	0f b6 00             	movzbl (%eax),%eax
 80495ca:	84 c0                	test   %al,%al
 80495cc:	75 07                	jne    80495d5 <strtok+0x60>
 80495ce:	b8 00 00 00 00       	mov    $0x0,%eax
 80495d3:	eb 3c                	jmp    8049611 <strtok+0x9c>
 80495d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 80495dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80495df:	89 04 24             	mov    %eax,(%esp)
 80495e2:	e8 d0 fe ff ff       	call   80494b7 <strpbrk>
 80495e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80495ea:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 80495ee:	75 0c                	jne    80495fc <strtok+0x87>
 80495f0:	c7 83 04 02 00 00 00 	movl   $0x0,0x204(%ebx)
 80495f7:	00 00 00 
 80495fa:	eb 12                	jmp    804960e <strtok+0x99>
 80495fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80495ff:	c6 00 00             	movb   $0x0,(%eax)
 8049602:	ff 45 ec             	incl   -0x14(%ebp)
 8049605:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049608:	89 83 04 02 00 00    	mov    %eax,0x204(%ebx)
 804960e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049611:	83 c4 24             	add    $0x24,%esp
 8049614:	5b                   	pop    %ebx
 8049615:	5d                   	pop    %ebp
 8049616:	c3                   	ret    

08049617 <strerror>:
 8049617:	55                   	push   %ebp
 8049618:	89 e5                	mov    %esp,%ebp
 804961a:	e8 f1 fa ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804961f:	05 e1 59 00 00       	add    $0x59e1,%eax
 8049624:	81 7d 08 83 00 00 00 	cmpl   $0x83,0x8(%ebp)
 804962b:	0f 87 e8 04 00 00    	ja     8049b19 <.L90>
 8049631:	8b 55 08             	mov    0x8(%ebp),%edx
 8049634:	c1 e2 02             	shl    $0x2,%edx
 8049637:	8b 94 02 70 eb ff ff 	mov    -0x1490(%edx,%eax,1),%edx
 804963e:	01 c2                	add    %eax,%edx
 8049640:	ff e2                	jmp    *%edx

08049642 <.L91>:
 8049642:	8d 80 b4 e0 ff ff    	lea    -0x1f4c(%eax),%eax
 8049648:	e9 d1 04 00 00       	jmp    8049b1e <.L90+0x5>

0804964d <.L93>:
 804964d:	8d 80 c3 e0 ff ff    	lea    -0x1f3d(%eax),%eax
 8049653:	e9 c6 04 00 00       	jmp    8049b1e <.L90+0x5>

08049658 <.L94>:
 8049658:	8d 80 dd e0 ff ff    	lea    -0x1f23(%eax),%eax
 804965e:	e9 bb 04 00 00       	jmp    8049b1e <.L90+0x5>

08049663 <.L95>:
 8049663:	8d 80 ed e0 ff ff    	lea    -0x1f13(%eax),%eax
 8049669:	e9 b0 04 00 00       	jmp    8049b1e <.L90+0x5>

0804966e <.L96>:
 804966e:	8d 80 05 e1 ff ff    	lea    -0x1efb(%eax),%eax
 8049674:	e9 a5 04 00 00       	jmp    8049b1e <.L90+0x5>

08049679 <.L97>:
 8049679:	8d 80 0f e1 ff ff    	lea    -0x1ef1(%eax),%eax
 804967f:	e9 9a 04 00 00       	jmp    8049b1e <.L90+0x5>

08049684 <.L98>:
 8049684:	8d 80 29 e1 ff ff    	lea    -0x1ed7(%eax),%eax
 804968a:	e9 8f 04 00 00       	jmp    8049b1e <.L90+0x5>

0804968f <.L99>:
 804968f:	8d 80 3b e1 ff ff    	lea    -0x1ec5(%eax),%eax
 8049695:	e9 84 04 00 00       	jmp    8049b1e <.L90+0x5>

0804969a <.L100>:
 804969a:	8d 80 4d e1 ff ff    	lea    -0x1eb3(%eax),%eax
 80496a0:	e9 79 04 00 00       	jmp    8049b1e <.L90+0x5>

080496a5 <.L101>:
 80496a5:	8d 80 5d e1 ff ff    	lea    -0x1ea3(%eax),%eax
 80496ab:	e9 6e 04 00 00       	jmp    8049b1e <.L90+0x5>

080496b0 <.L102>:
 80496b0:	8d 80 6c e1 ff ff    	lea    -0x1e94(%eax),%eax
 80496b6:	e9 63 04 00 00       	jmp    8049b1e <.L90+0x5>

080496bb <.L103>:
 80496bb:	8d 80 8d e1 ff ff    	lea    -0x1e73(%eax),%eax
 80496c1:	e9 58 04 00 00       	jmp    8049b1e <.L90+0x5>

080496c6 <.L104>:
 80496c6:	8d 80 9d e1 ff ff    	lea    -0x1e63(%eax),%eax
 80496cc:	e9 4d 04 00 00       	jmp    8049b1e <.L90+0x5>

080496d1 <.L105>:
 80496d1:	8d 80 af e1 ff ff    	lea    -0x1e51(%eax),%eax
 80496d7:	e9 42 04 00 00       	jmp    8049b1e <.L90+0x5>

080496dc <.L106>:
 80496dc:	8d 80 bb e1 ff ff    	lea    -0x1e45(%eax),%eax
 80496e2:	e9 37 04 00 00       	jmp    8049b1e <.L90+0x5>

080496e7 <.L107>:
 80496e7:	8d 80 d1 e1 ff ff    	lea    -0x1e2f(%eax),%eax
 80496ed:	e9 2c 04 00 00       	jmp    8049b1e <.L90+0x5>

080496f2 <.L108>:
 80496f2:	8d 80 e3 e1 ff ff    	lea    -0x1e1d(%eax),%eax
 80496f8:	e9 21 04 00 00       	jmp    8049b1e <.L90+0x5>

080496fd <.L109>:
 80496fd:	8d 80 ef e1 ff ff    	lea    -0x1e11(%eax),%eax
 8049703:	e9 16 04 00 00       	jmp    8049b1e <.L90+0x5>

08049708 <.L110>:
 8049708:	8d 80 01 e2 ff ff    	lea    -0x1dff(%eax),%eax
 804970e:	e9 0b 04 00 00       	jmp    8049b1e <.L90+0x5>

08049713 <.L111>:
 8049713:	8d 80 10 e2 ff ff    	lea    -0x1df0(%eax),%eax
 8049719:	e9 00 04 00 00       	jmp    8049b1e <.L90+0x5>

0804971e <.L112>:
 804971e:	8d 80 20 e2 ff ff    	lea    -0x1de0(%eax),%eax
 8049724:	e9 f5 03 00 00       	jmp    8049b1e <.L90+0x5>

08049729 <.L113>:
 8049729:	8d 80 2f e2 ff ff    	lea    -0x1dd1(%eax),%eax
 804972f:	e9 ea 03 00 00       	jmp    8049b1e <.L90+0x5>

08049734 <.L114>:
 8049734:	8d 80 40 e2 ff ff    	lea    -0x1dc0(%eax),%eax
 804973a:	e9 df 03 00 00       	jmp    8049b1e <.L90+0x5>

0804973f <.L115>:
 804973f:	8d 80 54 e2 ff ff    	lea    -0x1dac(%eax),%eax
 8049745:	e9 d4 03 00 00       	jmp    8049b1e <.L90+0x5>

0804974a <.L116>:
 804974a:	8d 80 68 e2 ff ff    	lea    -0x1d98(%eax),%eax
 8049750:	e9 c9 03 00 00       	jmp    8049b1e <.L90+0x5>

08049755 <.L117>:
 8049755:	8d 80 87 e2 ff ff    	lea    -0x1d79(%eax),%eax
 804975b:	e9 be 03 00 00       	jmp    8049b1e <.L90+0x5>

08049760 <.L118>:
 8049760:	8d 80 96 e2 ff ff    	lea    -0x1d6a(%eax),%eax
 8049766:	e9 b3 03 00 00       	jmp    8049b1e <.L90+0x5>

0804976b <.L119>:
 804976b:	8d 80 a5 e2 ff ff    	lea    -0x1d5b(%eax),%eax
 8049771:	e9 a8 03 00 00       	jmp    8049b1e <.L90+0x5>

08049776 <.L120>:
 8049776:	8d 80 bd e2 ff ff    	lea    -0x1d43(%eax),%eax
 804977c:	e9 9d 03 00 00       	jmp    8049b1e <.L90+0x5>

08049781 <.L121>:
 8049781:	8d 80 ca e2 ff ff    	lea    -0x1d36(%eax),%eax
 8049787:	e9 92 03 00 00       	jmp    8049b1e <.L90+0x5>

0804978c <.L122>:
 804978c:	8d 80 e0 e2 ff ff    	lea    -0x1d20(%eax),%eax
 8049792:	e9 87 03 00 00       	jmp    8049b1e <.L90+0x5>

08049797 <.L123>:
 8049797:	8d 80 ef e2 ff ff    	lea    -0x1d11(%eax),%eax
 804979d:	e9 7c 03 00 00       	jmp    8049b1e <.L90+0x5>

080497a2 <.L124>:
 80497a2:	8d 80 fc e2 ff ff    	lea    -0x1d04(%eax),%eax
 80497a8:	e9 71 03 00 00       	jmp    8049b1e <.L90+0x5>

080497ad <.L125>:
 80497ad:	8d 80 1b e3 ff ff    	lea    -0x1ce5(%eax),%eax
 80497b3:	e9 66 03 00 00       	jmp    8049b1e <.L90+0x5>

080497b8 <.L132>:
 80497b8:	8d 80 39 e3 ff ff    	lea    -0x1cc7(%eax),%eax
 80497be:	e9 5b 03 00 00       	jmp    8049b1e <.L90+0x5>

080497c3 <.L133>:
 80497c3:	8d 80 54 e3 ff ff    	lea    -0x1cac(%eax),%eax
 80497c9:	e9 50 03 00 00       	jmp    8049b1e <.L90+0x5>

080497ce <.L134>:
 80497ce:	8d 80 67 e3 ff ff    	lea    -0x1c99(%eax),%eax
 80497d4:	e9 45 03 00 00       	jmp    8049b1e <.L90+0x5>

080497d9 <.L135>:
 80497d9:	8d 80 83 e3 ff ff    	lea    -0x1c7d(%eax),%eax
 80497df:	e9 3a 03 00 00       	jmp    8049b1e <.L90+0x5>

080497e4 <.L136>:
 80497e4:	8d 80 9c e3 ff ff    	lea    -0x1c64(%eax),%eax
 80497ea:	e9 2f 03 00 00       	jmp    8049b1e <.L90+0x5>

080497ef <.L137>:
 80497ef:	8d 80 ab e3 ff ff    	lea    -0x1c55(%eax),%eax
 80497f5:	e9 24 03 00 00       	jmp    8049b1e <.L90+0x5>

080497fa <.L138>:
 80497fa:	8d 80 b9 e3 ff ff    	lea    -0x1c47(%eax),%eax
 8049800:	e9 19 03 00 00       	jmp    8049b1e <.L90+0x5>

08049805 <.L139>:
 8049805:	8d 80 d2 e3 ff ff    	lea    -0x1c2e(%eax),%eax
 804980b:	e9 0e 03 00 00       	jmp    8049b1e <.L90+0x5>

08049810 <.L140>:
 8049810:	8d 80 ef e3 ff ff    	lea    -0x1c11(%eax),%eax
 8049816:	e9 03 03 00 00       	jmp    8049b1e <.L90+0x5>

0804981b <.L141>:
 804981b:	8d 80 0a e4 ff ff    	lea    -0x1bf6(%eax),%eax
 8049821:	e9 f8 02 00 00       	jmp    8049b1e <.L90+0x5>

08049826 <.L126>:
 8049826:	8d 80 19 e4 ff ff    	lea    -0x1be7(%eax),%eax
 804982c:	e9 ed 02 00 00       	jmp    8049b1e <.L90+0x5>

08049831 <.L128>:
 8049831:	8d 80 2d e4 ff ff    	lea    -0x1bd3(%eax),%eax
 8049837:	e9 e2 02 00 00       	jmp    8049b1e <.L90+0x5>

0804983c <.L206>:
 804983c:	8d 80 48 e4 ff ff    	lea    -0x1bb8(%eax),%eax
 8049842:	e9 d7 02 00 00       	jmp    8049b1e <.L90+0x5>

08049847 <.L183>:
 8049847:	8d 80 5b e4 ff ff    	lea    -0x1ba5(%eax),%eax
 804984d:	e9 cc 02 00 00       	jmp    8049b1e <.L90+0x5>

08049852 <.L205>:
 8049852:	8d 80 73 e4 ff ff    	lea    -0x1b8d(%eax),%eax
 8049858:	e9 c1 02 00 00       	jmp    8049b1e <.L90+0x5>

0804985d <.L142>:
 804985d:	8d 80 87 e4 ff ff    	lea    -0x1b79(%eax),%eax
 8049863:	e9 b6 02 00 00       	jmp    8049b1e <.L90+0x5>

08049868 <.L143>:
 8049868:	8d 80 98 e4 ff ff    	lea    -0x1b68(%eax),%eax
 804986e:	e9 ab 02 00 00       	jmp    8049b1e <.L90+0x5>

08049873 <.L144>:
 8049873:	8d 80 b3 e4 ff ff    	lea    -0x1b4d(%eax),%eax
 8049879:	e9 a0 02 00 00       	jmp    8049b1e <.L90+0x5>

0804987e <.L145>:
 804987e:	8d 80 c1 e4 ff ff    	lea    -0x1b3f(%eax),%eax
 8049884:	e9 95 02 00 00       	jmp    8049b1e <.L90+0x5>

08049889 <.L146>:
 8049889:	8d 80 ca e4 ff ff    	lea    -0x1b36(%eax),%eax
 804988f:	e9 8a 02 00 00       	jmp    8049b1e <.L90+0x5>

08049894 <.L147>:
 8049894:	8d 80 df e4 ff ff    	lea    -0x1b21(%eax),%eax
 804989a:	e9 7f 02 00 00       	jmp    8049b1e <.L90+0x5>

0804989f <.L148>:
 804989f:	8d 80 ec e4 ff ff    	lea    -0x1b14(%eax),%eax
 80498a5:	e9 74 02 00 00       	jmp    8049b1e <.L90+0x5>

080498aa <.L207>:
 80498aa:	8d 80 fe e4 ff ff    	lea    -0x1b02(%eax),%eax
 80498b0:	e9 69 02 00 00       	jmp    8049b1e <.L90+0x5>

080498b5 <.L208>:
 80498b5:	8d 80 19 e5 ff ff    	lea    -0x1ae7(%eax),%eax
 80498bb:	e9 5e 02 00 00       	jmp    8049b1e <.L90+0x5>

080498c0 <.L149>:
 80498c0:	8d 80 31 e5 ff ff    	lea    -0x1acf(%eax),%eax
 80498c6:	e9 53 02 00 00       	jmp    8049b1e <.L90+0x5>

080498cb <.L150>:
 80498cb:	8d 80 45 e5 ff ff    	lea    -0x1abb(%eax),%eax
 80498d1:	e9 48 02 00 00       	jmp    8049b1e <.L90+0x5>

080498d6 <.L151>:
 80498d6:	8d 80 5f e5 ff ff    	lea    -0x1aa1(%eax),%eax
 80498dc:	e9 3d 02 00 00       	jmp    8049b1e <.L90+0x5>

080498e1 <.L152>:
 80498e1:	8d 80 6d e5 ff ff    	lea    -0x1a93(%eax),%eax
 80498e7:	e9 32 02 00 00       	jmp    8049b1e <.L90+0x5>

080498ec <.L153>:
 80498ec:	8d 80 86 e5 ff ff    	lea    -0x1a7a(%eax),%eax
 80498f2:	e9 27 02 00 00       	jmp    8049b1e <.L90+0x5>

080498f7 <.L154>:
 80498f7:	8d 80 a4 e5 ff ff    	lea    -0x1a5c(%eax),%eax
 80498fd:	e9 1c 02 00 00       	jmp    8049b1e <.L90+0x5>

08049902 <.L155>:
 8049902:	8d 80 ba e5 ff ff    	lea    -0x1a46(%eax),%eax
 8049908:	e9 11 02 00 00       	jmp    8049b1e <.L90+0x5>

0804990d <.L156>:
 804990d:	8d 80 cf e5 ff ff    	lea    -0x1a31(%eax),%eax
 8049913:	e9 06 02 00 00       	jmp    8049b1e <.L90+0x5>

08049918 <.L157>:
 8049918:	8d 80 e9 e5 ff ff    	lea    -0x1a17(%eax),%eax
 804991e:	e9 fb 01 00 00       	jmp    8049b1e <.L90+0x5>

08049923 <.L158>:
 8049923:	8d 80 f9 e5 ff ff    	lea    -0x1a07(%eax),%eax
 8049929:	e9 f0 01 00 00       	jmp    8049b1e <.L90+0x5>

0804992e <.L159>:
 804992e:	8d 80 07 e6 ff ff    	lea    -0x19f9(%eax),%eax
 8049934:	e9 e5 01 00 00       	jmp    8049b1e <.L90+0x5>

08049939 <.L160>:
 8049939:	8d 80 23 e6 ff ff    	lea    -0x19dd(%eax),%eax
 804993f:	e9 da 01 00 00       	jmp    8049b1e <.L90+0x5>

08049944 <.L161>:
 8049944:	8d 80 32 e6 ff ff    	lea    -0x19ce(%eax),%eax
 804994a:	e9 cf 01 00 00       	jmp    8049b1e <.L90+0x5>

0804994f <.L162>:
 804994f:	8d 80 48 e6 ff ff    	lea    -0x19b8(%eax),%eax
 8049955:	e9 c4 01 00 00       	jmp    8049b1e <.L90+0x5>

0804995a <.L127>:
 804995a:	8d 80 6a e6 ff ff    	lea    -0x1996(%eax),%eax
 8049960:	e9 b9 01 00 00       	jmp    8049b1e <.L90+0x5>

08049965 <.L163>:
 8049965:	8d 80 80 e6 ff ff    	lea    -0x1980(%eax),%eax
 804996b:	e9 ae 01 00 00       	jmp    8049b1e <.L90+0x5>

08049970 <.L164>:
 8049970:	8d 80 aa e6 ff ff    	lea    -0x1956(%eax),%eax
 8049976:	e9 a3 01 00 00       	jmp    8049b1e <.L90+0x5>

0804997b <.L165>:
 804997b:	8d 80 c8 e6 ff ff    	lea    -0x1938(%eax),%eax
 8049981:	e9 98 01 00 00       	jmp    8049b1e <.L90+0x5>

08049986 <.L166>:
 8049986:	8d 80 e8 e6 ff ff    	lea    -0x1918(%eax),%eax
 804998c:	e9 8d 01 00 00       	jmp    8049b1e <.L90+0x5>

08049991 <.L167>:
 8049991:	8d 80 00 e7 ff ff    	lea    -0x1900(%eax),%eax
 8049997:	e9 82 01 00 00       	jmp    8049b1e <.L90+0x5>

0804999c <.L168>:
 804999c:	8d 80 24 e7 ff ff    	lea    -0x18dc(%eax),%eax
 80499a2:	e9 77 01 00 00       	jmp    8049b1e <.L90+0x5>

080499a7 <.L169>:
 80499a7:	8d 80 48 e7 ff ff    	lea    -0x18b8(%eax),%eax
 80499ad:	e9 6c 01 00 00       	jmp    8049b1e <.L90+0x5>

080499b2 <.L170>:
 80499b2:	8d 80 6c e7 ff ff    	lea    -0x1894(%eax),%eax
 80499b8:	e9 61 01 00 00       	jmp    8049b1e <.L90+0x5>

080499bd <.L171>:
 80499bd:	8d 80 94 e7 ff ff    	lea    -0x186c(%eax),%eax
 80499c3:	e9 56 01 00 00       	jmp    8049b1e <.L90+0x5>

080499c8 <.L172>:
 80499c8:	8d 80 b9 e7 ff ff    	lea    -0x1847(%eax),%eax
 80499ce:	e9 4b 01 00 00       	jmp    8049b1e <.L90+0x5>

080499d3 <.L129>:
 80499d3:	8d 80 d0 e7 ff ff    	lea    -0x1830(%eax),%eax
 80499d9:	e9 40 01 00 00       	jmp    8049b1e <.L90+0x5>

080499de <.L131>:
 80499de:	8d 80 f2 e7 ff ff    	lea    -0x180e(%eax),%eax
 80499e4:	e9 35 01 00 00       	jmp    8049b1e <.L90+0x5>

080499e9 <.L173>:
 80499e9:	8d 80 05 e8 ff ff    	lea    -0x17fb(%eax),%eax
 80499ef:	e9 2a 01 00 00       	jmp    8049b1e <.L90+0x5>

080499f4 <.L174>:
 80499f4:	8d 80 20 e8 ff ff    	lea    -0x17e0(%eax),%eax
 80499fa:	e9 1f 01 00 00       	jmp    8049b1e <.L90+0x5>

080499ff <.L130>:
 80499ff:	8d 80 49 e8 ff ff    	lea    -0x17b7(%eax),%eax
 8049a05:	e9 14 01 00 00       	jmp    8049b1e <.L90+0x5>

08049a0a <.L175>:
 8049a0a:	8d 80 5d e8 ff ff    	lea    -0x17a3(%eax),%eax
 8049a10:	e9 09 01 00 00       	jmp    8049b1e <.L90+0x5>

08049a15 <.L176>:
 8049a15:	8d 80 78 e8 ff ff    	lea    -0x1788(%eax),%eax
 8049a1b:	e9 fe 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a20 <.L177>:
 8049a20:	8d 80 97 e8 ff ff    	lea    -0x1769(%eax),%eax
 8049a26:	e9 f3 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a2b <.L178>:
 8049a2b:	8d 80 b4 e8 ff ff    	lea    -0x174c(%eax),%eax
 8049a31:	e9 e8 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a36 <.L179>:
 8049a36:	8d 80 c8 e8 ff ff    	lea    -0x1738(%eax),%eax
 8049a3c:	e9 dd 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a41 <.L180>:
 8049a41:	8d 80 e7 e8 ff ff    	lea    -0x1719(%eax),%eax
 8049a47:	e9 d2 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a4c <.L181>:
 8049a4c:	8d 80 fe e8 ff ff    	lea    -0x1702(%eax),%eax
 8049a52:	e9 c7 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a57 <.L182>:
 8049a57:	8d 80 15 e9 ff ff    	lea    -0x16eb(%eax),%eax
 8049a5d:	e9 bc 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a62 <.L184>:
 8049a62:	8d 80 2f e9 ff ff    	lea    -0x16d1(%eax),%eax
 8049a68:	e9 b1 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a6d <.L185>:
 8049a6d:	8d 80 50 e9 ff ff    	lea    -0x16b0(%eax),%eax
 8049a73:	e9 a6 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a78 <.L186>:
 8049a78:	8d 80 80 e9 ff ff    	lea    -0x1680(%eax),%eax
 8049a7e:	e9 9b 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a83 <.L187>:
 8049a83:	8d 80 98 e9 ff ff    	lea    -0x1668(%eax),%eax
 8049a89:	e9 90 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a8e <.L188>:
 8049a8e:	8d 80 b7 e9 ff ff    	lea    -0x1649(%eax),%eax
 8049a94:	e9 85 00 00 00       	jmp    8049b1e <.L90+0x5>

08049a99 <.L189>:
 8049a99:	8d 80 c7 e9 ff ff    	lea    -0x1639(%eax),%eax
 8049a9f:	eb 7d                	jmp    8049b1e <.L90+0x5>

08049aa1 <.L190>:
 8049aa1:	8d 80 e0 e9 ff ff    	lea    -0x1620(%eax),%eax
 8049aa7:	eb 75                	jmp    8049b1e <.L90+0x5>

08049aa9 <.L191>:
 8049aa9:	8d 80 0c ea ff ff    	lea    -0x15f4(%eax),%eax
 8049aaf:	eb 6d                	jmp    8049b1e <.L90+0x5>

08049ab1 <.L192>:
 8049ab1:	8d 80 2d ea ff ff    	lea    -0x15d3(%eax),%eax
 8049ab7:	eb 65                	jmp    8049b1e <.L90+0x5>

08049ab9 <.L193>:
 8049ab9:	8d 80 46 ea ff ff    	lea    -0x15ba(%eax),%eax
 8049abf:	eb 5d                	jmp    8049b1e <.L90+0x5>

08049ac1 <.L194>:
 8049ac1:	8d 80 60 ea ff ff    	lea    -0x15a0(%eax),%eax
 8049ac7:	eb 55                	jmp    8049b1e <.L90+0x5>

08049ac9 <.L195>:
 8049ac9:	8d 80 7c ea ff ff    	lea    -0x1584(%eax),%eax
 8049acf:	eb 4d                	jmp    8049b1e <.L90+0x5>

08049ad1 <.L196>:
 8049ad1:	8d 80 94 ea ff ff    	lea    -0x156c(%eax),%eax
 8049ad7:	eb 45                	jmp    8049b1e <.L90+0x5>

08049ad9 <.L197>:
 8049ad9:	8d 80 b8 ea ff ff    	lea    -0x1548(%eax),%eax
 8049adf:	eb 3d                	jmp    8049b1e <.L90+0x5>

08049ae1 <.L198>:
 8049ae1:	8d 80 da ea ff ff    	lea    -0x1526(%eax),%eax
 8049ae7:	eb 35                	jmp    8049b1e <.L90+0x5>

08049ae9 <.L199>:
 8049ae9:	8d 80 ef ea ff ff    	lea    -0x1511(%eax),%eax
 8049aef:	eb 2d                	jmp    8049b1e <.L90+0x5>

08049af1 <.L200>:
 8049af1:	8d 80 02 eb ff ff    	lea    -0x14fe(%eax),%eax
 8049af7:	eb 25                	jmp    8049b1e <.L90+0x5>

08049af9 <.L201>:
 8049af9:	8d 80 0f eb ff ff    	lea    -0x14f1(%eax),%eax
 8049aff:	eb 1d                	jmp    8049b1e <.L90+0x5>

08049b01 <.L202>:
 8049b01:	8d 80 20 eb ff ff    	lea    -0x14e0(%eax),%eax
 8049b07:	eb 15                	jmp    8049b1e <.L90+0x5>

08049b09 <.L203>:
 8049b09:	8d 80 3e eb ff ff    	lea    -0x14c2(%eax),%eax
 8049b0f:	eb 0d                	jmp    8049b1e <.L90+0x5>

08049b11 <.L204>:
 8049b11:	8d 80 58 eb ff ff    	lea    -0x14a8(%eax),%eax
 8049b17:	eb 05                	jmp    8049b1e <.L90+0x5>

08049b19 <.L90>:
 8049b19:	b8 00 00 00 00       	mov    $0x0,%eax
 8049b1e:	5d                   	pop    %ebp
 8049b1f:	c3                   	ret    

08049b20 <wrterror>:
 8049b20:	55                   	push   %ebp
 8049b21:	89 e5                	mov    %esp,%ebp
 8049b23:	53                   	push   %ebx
 8049b24:	83 ec 24             	sub    $0x24,%esp
 8049b27:	e8 ec f5 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 8049b2c:	81 c3 d4 54 00 00    	add    $0x54d4,%ebx
 8049b32:	8d 83 81 ed ff ff    	lea    -0x127f(%ebx),%eax
 8049b38:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049b3b:	8b 83 24 00 00 00    	mov    0x24(%ebx),%eax
 8049b41:	89 04 24             	mov    %eax,(%esp)
 8049b44:	e8 40 f8 ff ff       	call   8049389 <strlen>
 8049b49:	89 c2                	mov    %eax,%edx
 8049b4b:	8b 83 24 00 00 00    	mov    0x24(%ebx),%eax
 8049b51:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049b55:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b59:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049b60:	e8 2c ee ff ff       	call   8048991 <write>
 8049b65:	8b 83 60 02 00 00    	mov    0x260(%ebx),%eax
 8049b6b:	89 04 24             	mov    %eax,(%esp)
 8049b6e:	e8 16 f8 ff ff       	call   8049389 <strlen>
 8049b73:	89 c2                	mov    %eax,%edx
 8049b75:	8b 83 60 02 00 00    	mov    0x260(%ebx),%eax
 8049b7b:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049b7f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b83:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049b8a:	e8 02 ee ff ff       	call   8048991 <write>
 8049b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049b92:	89 04 24             	mov    %eax,(%esp)
 8049b95:	e8 ef f7 ff ff       	call   8049389 <strlen>
 8049b9a:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049b9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049ba1:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ba5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049bac:	e8 e0 ed ff ff       	call   8048991 <write>
 8049bb1:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bb4:	89 04 24             	mov    %eax,(%esp)
 8049bb7:	e8 cd f7 ff ff       	call   8049389 <strlen>
 8049bbc:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049bc0:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bc3:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bc7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049bce:	e8 be ed ff ff       	call   8048991 <write>
 8049bd3:	c7 83 3c 02 00 00 01 	movl   $0x1,0x23c(%ebx)
 8049bda:	00 00 00 
 8049bdd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049be4:	e8 c4 e9 ff ff       	call   80485ad <exit>
 8049be9:	90                   	nop
 8049bea:	83 c4 24             	add    $0x24,%esp
 8049bed:	5b                   	pop    %ebx
 8049bee:	5d                   	pop    %ebp
 8049bef:	c3                   	ret    

08049bf0 <wrtwarning>:
 8049bf0:	55                   	push   %ebp
 8049bf1:	89 e5                	mov    %esp,%ebp
 8049bf3:	53                   	push   %ebx
 8049bf4:	83 ec 24             	sub    $0x24,%esp
 8049bf7:	e8 1c f5 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 8049bfc:	81 c3 04 54 00 00    	add    $0x5404,%ebx
 8049c02:	8d 83 8a ed ff ff    	lea    -0x1276(%ebx),%eax
 8049c08:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049c0b:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
 8049c11:	85 c0                	test   %eax,%eax
 8049c13:	74 0b                	je     8049c20 <wrtwarning+0x30>
 8049c15:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c18:	89 04 24             	mov    %eax,(%esp)
 8049c1b:	e8 00 ff ff ff       	call   8049b20 <wrterror>
 8049c20:	8b 83 24 00 00 00    	mov    0x24(%ebx),%eax
 8049c26:	89 04 24             	mov    %eax,(%esp)
 8049c29:	e8 5b f7 ff ff       	call   8049389 <strlen>
 8049c2e:	89 c2                	mov    %eax,%edx
 8049c30:	8b 83 24 00 00 00    	mov    0x24(%ebx),%eax
 8049c36:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049c3a:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c3e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049c45:	e8 47 ed ff ff       	call   8048991 <write>
 8049c4a:	8b 83 60 02 00 00    	mov    0x260(%ebx),%eax
 8049c50:	89 04 24             	mov    %eax,(%esp)
 8049c53:	e8 31 f7 ff ff       	call   8049389 <strlen>
 8049c58:	89 c2                	mov    %eax,%edx
 8049c5a:	8b 83 60 02 00 00    	mov    0x260(%ebx),%eax
 8049c60:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049c64:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049c6f:	e8 1d ed ff ff       	call   8048991 <write>
 8049c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049c77:	89 04 24             	mov    %eax,(%esp)
 8049c7a:	e8 0a f7 ff ff       	call   8049389 <strlen>
 8049c7f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049c83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049c86:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c8a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049c91:	e8 fb ec ff ff       	call   8048991 <write>
 8049c96:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c99:	89 04 24             	mov    %eax,(%esp)
 8049c9c:	e8 e8 f6 ff ff       	call   8049389 <strlen>
 8049ca1:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049ca5:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ca8:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049cac:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049cb3:	e8 d9 ec ff ff       	call   8048991 <write>
 8049cb8:	90                   	nop
 8049cb9:	83 c4 24             	add    $0x24,%esp
 8049cbc:	5b                   	pop    %ebx
 8049cbd:	5d                   	pop    %ebp
 8049cbe:	c3                   	ret    

08049cbf <map_pages>:
 8049cbf:	55                   	push   %ebp
 8049cc0:	89 e5                	mov    %esp,%ebp
 8049cc2:	53                   	push   %ebx
 8049cc3:	83 ec 24             	sub    $0x24,%esp
 8049cc6:	e8 4d f4 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 8049ccb:	81 c3 35 53 00 00    	add    $0x5335,%ebx
 8049cd1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049cd8:	e8 e1 e6 ff ff       	call   80483be <sbrk>
 8049cdd:	05 ff 0f 00 00       	add    $0xfff,%eax
 8049ce2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 8049ce7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049cea:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ced:	c1 e0 0c             	shl    $0xc,%eax
 8049cf0:	89 c2                	mov    %eax,%edx
 8049cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049cf5:	01 d0                	add    %edx,%eax
 8049cf7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049cfa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049cfd:	89 04 24             	mov    %eax,(%esp)
 8049d00:	e8 82 e7 ff ff       	call   8048487 <brk>
 8049d05:	85 c0                	test   %eax,%eax
 8049d07:	74 07                	je     8049d10 <map_pages+0x51>
 8049d09:	b8 00 00 00 00       	mov    $0x0,%eax
 8049d0e:	eb 51                	jmp    8049d61 <map_pages+0xa2>
 8049d10:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049d13:	c1 e8 0c             	shr    $0xc,%eax
 8049d16:	89 c2                	mov    %eax,%edx
 8049d18:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
 8049d1e:	29 c2                	sub    %eax,%edx
 8049d20:	89 d0                	mov    %edx,%eax
 8049d22:	48                   	dec    %eax
 8049d23:	89 83 18 02 00 00    	mov    %eax,0x218(%ebx)
 8049d29:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049d2c:	89 83 58 02 00 00    	mov    %eax,0x258(%ebx)
 8049d32:	8b 83 18 02 00 00    	mov    0x218(%ebx),%eax
 8049d38:	8d 50 01             	lea    0x1(%eax),%edx
 8049d3b:	8b 83 20 02 00 00    	mov    0x220(%ebx),%eax
 8049d41:	39 c2                	cmp    %eax,%edx
 8049d43:	72 19                	jb     8049d5e <map_pages+0x9f>
 8049d45:	8b 83 18 02 00 00    	mov    0x218(%ebx),%eax
 8049d4b:	89 04 24             	mov    %eax,(%esp)
 8049d4e:	e8 14 00 00 00       	call   8049d67 <extend_pgdir>
 8049d53:	85 c0                	test   %eax,%eax
 8049d55:	75 07                	jne    8049d5e <map_pages+0x9f>
 8049d57:	b8 00 00 00 00       	mov    $0x0,%eax
 8049d5c:	eb 03                	jmp    8049d61 <map_pages+0xa2>
 8049d5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049d61:	83 c4 24             	add    $0x24,%esp
 8049d64:	5b                   	pop    %ebx
 8049d65:	5d                   	pop    %ebp
 8049d66:	c3                   	ret    

08049d67 <extend_pgdir>:
 8049d67:	55                   	push   %ebp
 8049d68:	89 e5                	mov    %esp,%ebp
 8049d6a:	53                   	push   %ebx
 8049d6b:	83 ec 34             	sub    $0x34,%esp
 8049d6e:	e8 a5 f3 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 8049d73:	81 c3 8d 52 00 00    	add    $0x528d,%ebx
 8049d79:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d7c:	c1 e0 02             	shl    $0x2,%eax
 8049d7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049d82:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049d85:	c1 e8 0c             	shr    $0xc,%eax
 8049d88:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049d8b:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
 8049d8f:	8b 83 20 02 00 00    	mov    0x220(%ebx),%eax
 8049d95:	c1 e0 02             	shl    $0x2,%eax
 8049d98:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049d9b:	8b 83 08 02 00 00    	mov    0x208(%ebx),%eax
 8049da1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049da4:	c1 e2 0c             	shl    $0xc,%edx
 8049da7:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
 8049dae:	00 
 8049daf:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049db3:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 8049dba:	00 
 8049dbb:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
 8049dc2:	00 
 8049dc3:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049dc7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049dce:	e8 cc e9 ff ff       	call   804879f <mmap>
 8049dd3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049dd6:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
 8049dda:	75 07                	jne    8049de3 <extend_pgdir+0x7c>
 8049ddc:	b8 00 00 00 00       	mov    $0x0,%eax
 8049de1:	eb 5e                	jmp    8049e41 <extend_pgdir+0xda>
 8049de3:	8b 83 20 02 00 00    	mov    0x220(%ebx),%eax
 8049de9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8049df0:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 8049df6:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049dfa:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049dfe:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049e01:	89 04 24             	mov    %eax,(%esp)
 8049e04:	e8 66 f3 ff ff       	call   804916f <memcpy>
 8049e09:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049e0c:	c1 e0 0c             	shl    $0xc,%eax
 8049e0f:	c1 e8 02             	shr    $0x2,%eax
 8049e12:	89 83 20 02 00 00    	mov    %eax,0x220(%ebx)
 8049e18:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 8049e1e:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049e21:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049e24:	89 83 1c 02 00 00    	mov    %eax,0x21c(%ebx)
 8049e2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049e2d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049e31:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049e34:	89 04 24             	mov    %eax,(%esp)
 8049e37:	e8 c6 e9 ff ff       	call   8048802 <munmap>
 8049e3c:	b8 01 00 00 00       	mov    $0x1,%eax
 8049e41:	83 c4 34             	add    $0x34,%esp
 8049e44:	5b                   	pop    %ebx
 8049e45:	5d                   	pop    %ebp
 8049e46:	c3                   	ret    

08049e47 <malloc_init>:
 8049e47:	55                   	push   %ebp
 8049e48:	89 e5                	mov    %esp,%ebp
 8049e4a:	53                   	push   %ebx
 8049e4b:	83 ec 34             	sub    $0x34,%esp
 8049e4e:	e8 c5 f2 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 8049e53:	81 c3 ad 51 00 00    	add    $0x51ad,%ebx
 8049e59:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8049e60:	00 
 8049e61:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 8049e68:	00 
 8049e69:	8d 83 95 ed ff ff    	lea    -0x126b(%ebx),%eax
 8049e6f:	89 04 24             	mov    %eax,(%esp)
 8049e72:	e8 14 ea ff ff       	call   804888b <open>
 8049e77:	89 83 08 02 00 00    	mov    %eax,0x208(%ebx)
 8049e7d:	8b 83 08 02 00 00    	mov    0x208(%ebx),%eax
 8049e83:	83 f8 ff             	cmp    $0xffffffff,%eax
 8049e86:	75 0e                	jne    8049e96 <malloc_init+0x4f>
 8049e88:	8d 83 9f ed ff ff    	lea    -0x1261(%ebx),%eax
 8049e8e:	89 04 24             	mov    %eax,(%esp)
 8049e91:	e8 8a fc ff ff       	call   8049b20 <wrterror>
 8049e96:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8049e9d:	e9 7c 01 00 00       	jmp    804a01e <.L18+0x45>
 8049ea2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049ea6:	75 0c                	jne    8049eb4 <malloc_init+0x6d>
 8049ea8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049eaf:	e9 53 01 00 00       	jmp    804a007 <.L18+0x2e>
 8049eb4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
 8049eb8:	75 0c                	jne    8049ec6 <malloc_init+0x7f>
 8049eba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049ec1:	e9 41 01 00 00       	jmp    804a007 <.L18+0x2e>
 8049ec6:	8d 05 68 f2 04 08    	lea    0x804f268,%eax
 8049ecc:	8b 00                	mov    (%eax),%eax
 8049ece:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049ed1:	e9 31 01 00 00       	jmp    804a007 <.L18+0x2e>
 8049ed6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049ed9:	0f b6 00             	movzbl (%eax),%eax
 8049edc:	0f be c0             	movsbl %al,%eax
 8049edf:	83 e8 3c             	sub    $0x3c,%eax
 8049ee2:	83 f8 3e             	cmp    $0x3e,%eax
 8049ee5:	0f 87 ee 00 00 00    	ja     8049fd9 <.L18>
 8049eeb:	c1 e0 02             	shl    $0x2,%eax
 8049eee:	8b 84 18 f4 ed ff ff 	mov    -0x120c(%eax,%ebx,1),%eax
 8049ef5:	01 d8                	add    %ebx,%eax
 8049ef7:	ff e0                	jmp    *%eax

08049ef9 <.L21>:
 8049ef9:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
 8049eff:	01 c0                	add    %eax,%eax
 8049f01:	89 83 20 00 00 00    	mov    %eax,0x20(%ebx)
 8049f07:	e9 f8 00 00 00       	jmp    804a004 <.L18+0x2b>

08049f0c <.L19>:
 8049f0c:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
 8049f12:	d1 e8                	shr    %eax
 8049f14:	89 83 20 00 00 00    	mov    %eax,0x20(%ebx)
 8049f1a:	e9 e5 00 00 00       	jmp    804a004 <.L18+0x2b>

08049f1f <.L29>:
 8049f1f:	c7 83 38 02 00 00 00 	movl   $0x0,0x238(%ebx)
 8049f26:	00 00 00 
 8049f29:	e9 d6 00 00 00       	jmp    804a004 <.L18+0x2b>

08049f2e <.L22>:
 8049f2e:	c7 83 38 02 00 00 01 	movl   $0x1,0x238(%ebx)
 8049f35:	00 00 00 
 8049f38:	e9 c7 00 00 00       	jmp    804a004 <.L18+0x2b>

08049f3d <.L30>:
 8049f3d:	c7 83 44 02 00 00 00 	movl   $0x0,0x244(%ebx)
 8049f44:	00 00 00 
 8049f47:	e9 b8 00 00 00       	jmp    804a004 <.L18+0x2b>

08049f4c <.L23>:
 8049f4c:	c7 83 44 02 00 00 01 	movl   $0x1,0x244(%ebx)
 8049f53:	00 00 00 
 8049f56:	e9 a9 00 00 00       	jmp    804a004 <.L18+0x2b>

08049f5b <.L32>:
 8049f5b:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
 8049f62:	00 00 00 
 8049f65:	e9 9a 00 00 00       	jmp    804a004 <.L18+0x2b>

08049f6a <.L25>:
 8049f6a:	c7 83 40 02 00 00 01 	movl   $0x1,0x240(%ebx)
 8049f71:	00 00 00 
 8049f74:	e9 8b 00 00 00       	jmp    804a004 <.L18+0x2b>

08049f79 <.L31>:
 8049f79:	c7 83 54 02 00 00 00 	movl   $0x0,0x254(%ebx)
 8049f80:	00 00 00 
 8049f83:	eb 7f                	jmp    804a004 <.L18+0x2b>

08049f85 <.L24>:
 8049f85:	c7 83 54 02 00 00 01 	movl   $0x1,0x254(%ebx)
 8049f8c:	00 00 00 
 8049f8f:	eb 73                	jmp    804a004 <.L18+0x2b>

08049f91 <.L33>:
 8049f91:	c7 83 4c 02 00 00 00 	movl   $0x0,0x24c(%ebx)
 8049f98:	00 00 00 
 8049f9b:	eb 67                	jmp    804a004 <.L18+0x2b>

08049f9d <.L26>:
 8049f9d:	c7 83 4c 02 00 00 01 	movl   $0x1,0x24c(%ebx)
 8049fa4:	00 00 00 
 8049fa7:	eb 5b                	jmp    804a004 <.L18+0x2b>

08049fa9 <.L34>:
 8049fa9:	c7 83 48 02 00 00 00 	movl   $0x0,0x248(%ebx)
 8049fb0:	00 00 00 
 8049fb3:	eb 4f                	jmp    804a004 <.L18+0x2b>

08049fb5 <.L27>:
 8049fb5:	c7 83 48 02 00 00 01 	movl   $0x1,0x248(%ebx)
 8049fbc:	00 00 00 
 8049fbf:	eb 43                	jmp    804a004 <.L18+0x2b>

08049fc1 <.L35>:
 8049fc1:	c7 83 50 02 00 00 00 	movl   $0x0,0x250(%ebx)
 8049fc8:	00 00 00 
 8049fcb:	eb 37                	jmp    804a004 <.L18+0x2b>

08049fcd <.L28>:
 8049fcd:	c7 83 50 02 00 00 01 	movl   $0x1,0x250(%ebx)
 8049fd4:	00 00 00 
 8049fd7:	eb 2b                	jmp    804a004 <.L18+0x2b>

08049fd9 <.L18>:
 8049fd9:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
 8049fdf:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049fe2:	c7 83 38 02 00 00 00 	movl   $0x0,0x238(%ebx)
 8049fe9:	00 00 00 
 8049fec:	8d 83 b4 ed ff ff    	lea    -0x124c(%ebx),%eax
 8049ff2:	89 04 24             	mov    %eax,(%esp)
 8049ff5:	e8 f6 fb ff ff       	call   8049bf0 <wrtwarning>
 8049ffa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049ffd:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
 804a003:	90                   	nop
 804a004:	ff 45 f4             	incl   -0xc(%ebp)
 804a007:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a00b:	74 0e                	je     804a01b <.L18+0x42>
 804a00d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a010:	0f b6 00             	movzbl (%eax),%eax
 804a013:	84 c0                	test   %al,%al
 804a015:	0f 85 bb fe ff ff    	jne    8049ed6 <malloc_init+0x8f>
 804a01b:	ff 45 f0             	incl   -0x10(%ebp)
 804a01e:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
 804a022:	0f 8e 7a fe ff ff    	jle    8049ea2 <malloc_init+0x5b>
 804a028:	8b 83 50 02 00 00    	mov    0x250(%ebx),%eax
 804a02e:	85 c0                	test   %eax,%eax
 804a030:	74 0a                	je     804a03c <.L18+0x63>
 804a032:	c7 83 54 02 00 00 01 	movl   $0x1,0x254(%ebx)
 804a039:	00 00 00 
 804a03c:	8b 83 54 02 00 00    	mov    0x254(%ebx),%eax
 804a042:	85 c0                	test   %eax,%eax
 804a044:	74 0a                	je     804a050 <.L18+0x77>
 804a046:	c7 83 40 02 00 00 01 	movl   $0x1,0x240(%ebx)
 804a04d:	00 00 00 
 804a050:	8b 83 08 02 00 00    	mov    0x208(%ebx),%eax
 804a056:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
 804a05d:	00 
 804a05e:	89 44 24 10          	mov    %eax,0x10(%esp)
 804a062:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 804a069:	00 
 804a06a:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
 804a071:	00 
 804a072:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 804a079:	00 
 804a07a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804a081:	e8 19 e7 ff ff       	call   804879f <mmap>
 804a086:	89 83 1c 02 00 00    	mov    %eax,0x21c(%ebx)
 804a08c:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a092:	83 f8 ff             	cmp    $0xffffffff,%eax
 804a095:	75 0e                	jne    804a0a5 <.L18+0xcc>
 804a097:	8d 83 d4 ed ff ff    	lea    -0x122c(%ebx),%eax
 804a09d:	89 04 24             	mov    %eax,(%esp)
 804a0a0:	e8 7b fa ff ff       	call   8049b20 <wrterror>
 804a0a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804a0ac:	e8 0d e3 ff ff       	call   80483be <sbrk>
 804a0b1:	05 ff 0f 00 00       	add    $0xfff,%eax
 804a0b6:	c1 e8 0c             	shr    $0xc,%eax
 804a0b9:	89 83 14 02 00 00    	mov    %eax,0x214(%ebx)
 804a0bf:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
 804a0c5:	83 e8 0c             	sub    $0xc,%eax
 804a0c8:	89 83 14 02 00 00    	mov    %eax,0x214(%ebx)
 804a0ce:	c7 83 20 02 00 00 00 	movl   $0x400,0x220(%ebx)
 804a0d5:	04 00 00 
 804a0d8:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
 804a0de:	85 c0                	test   %eax,%eax
 804a0e0:	75 0d                	jne    804a0ef <.L18+0x116>
 804a0e2:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
 804a0e8:	40                   	inc    %eax
 804a0e9:	89 83 20 00 00 00    	mov    %eax,0x20(%ebx)
 804a0ef:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
 804a0f5:	c1 e0 0c             	shl    $0xc,%eax
 804a0f8:	89 83 20 00 00 00    	mov    %eax,0x20(%ebx)
 804a0fe:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
 804a105:	e8 5d 07 00 00       	call   804a867 <imalloc>
 804a10a:	89 83 5c 02 00 00    	mov    %eax,0x25c(%ebx)
 804a110:	8b 83 0c 02 00 00    	mov    0x20c(%ebx),%eax
 804a116:	40                   	inc    %eax
 804a117:	89 83 0c 02 00 00    	mov    %eax,0x20c(%ebx)
 804a11d:	90                   	nop
 804a11e:	83 c4 34             	add    $0x34,%esp
 804a121:	5b                   	pop    %ebx
 804a122:	5d                   	pop    %ebp
 804a123:	c3                   	ret    

0804a124 <malloc_pages>:
 804a124:	55                   	push   %ebp
 804a125:	89 e5                	mov    %esp,%ebp
 804a127:	53                   	push   %ebx
 804a128:	83 ec 34             	sub    $0x34,%esp
 804a12b:	e8 e8 ef ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804a130:	81 c3 d0 4e 00 00    	add    $0x4ed0,%ebx
 804a136:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804a13d:	8b 45 08             	mov    0x8(%ebp),%eax
 804a140:	05 ff 0f 00 00       	add    $0xfff,%eax
 804a145:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 804a14a:	89 45 08             	mov    %eax,0x8(%ebp)
 804a14d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804a154:	8b 83 24 02 00 00    	mov    0x224(%ebx),%eax
 804a15a:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804a15d:	e9 82 00 00 00       	jmp    804a1e4 <malloc_pages+0xc0>
 804a162:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a165:	8b 40 10             	mov    0x10(%eax),%eax
 804a168:	3b 45 08             	cmp    0x8(%ebp),%eax
 804a16b:	73 0a                	jae    804a177 <malloc_pages+0x53>
 804a16d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a170:	8b 00                	mov    (%eax),%eax
 804a172:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804a175:	eb 6d                	jmp    804a1e4 <malloc_pages+0xc0>
 804a177:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a17a:	8b 40 10             	mov    0x10(%eax),%eax
 804a17d:	3b 45 08             	cmp    0x8(%ebp),%eax
 804a180:	75 35                	jne    804a1b7 <malloc_pages+0x93>
 804a182:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a185:	8b 40 08             	mov    0x8(%eax),%eax
 804a188:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a18b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a18e:	8b 00                	mov    (%eax),%eax
 804a190:	85 c0                	test   %eax,%eax
 804a192:	74 0e                	je     804a1a2 <malloc_pages+0x7e>
 804a194:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a197:	8b 00                	mov    (%eax),%eax
 804a199:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804a19c:	8b 52 04             	mov    0x4(%edx),%edx
 804a19f:	89 50 04             	mov    %edx,0x4(%eax)
 804a1a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1a5:	8b 40 04             	mov    0x4(%eax),%eax
 804a1a8:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804a1ab:	8b 12                	mov    (%edx),%edx
 804a1ad:	89 10                	mov    %edx,(%eax)
 804a1af:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804a1b5:	eb 37                	jmp    804a1ee <malloc_pages+0xca>
 804a1b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1ba:	8b 40 08             	mov    0x8(%eax),%eax
 804a1bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a1c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1c3:	8b 50 08             	mov    0x8(%eax),%edx
 804a1c6:	8b 45 08             	mov    0x8(%ebp),%eax
 804a1c9:	01 c2                	add    %eax,%edx
 804a1cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1ce:	89 50 08             	mov    %edx,0x8(%eax)
 804a1d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1d4:	8b 40 10             	mov    0x10(%eax),%eax
 804a1d7:	2b 45 08             	sub    0x8(%ebp),%eax
 804a1da:	89 c2                	mov    %eax,%edx
 804a1dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1df:	89 50 10             	mov    %edx,0x10(%eax)
 804a1e2:	eb 0a                	jmp    804a1ee <malloc_pages+0xca>
 804a1e4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 804a1e8:	0f 85 74 ff ff ff    	jne    804a162 <malloc_pages+0x3e>
 804a1ee:	c1 6d 08 0c          	shrl   $0xc,0x8(%ebp)
 804a1f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a1f6:	75 0e                	jne    804a206 <malloc_pages+0xe2>
 804a1f8:	8b 45 08             	mov    0x8(%ebp),%eax
 804a1fb:	89 04 24             	mov    %eax,(%esp)
 804a1fe:	e8 bc fa ff ff       	call   8049cbf <map_pages>
 804a203:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a206:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a20a:	74 7d                	je     804a289 <malloc_pages+0x165>
 804a20c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a20f:	c1 e8 0c             	shr    $0xc,%eax
 804a212:	89 c2                	mov    %eax,%edx
 804a214:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
 804a21a:	29 c2                	sub    %eax,%edx
 804a21c:	89 d0                	mov    %edx,%eax
 804a21e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804a221:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a227:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804a22a:	c1 e2 02             	shl    $0x2,%edx
 804a22d:	01 d0                	add    %edx,%eax
 804a22f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
 804a235:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
 804a23c:	eb 1c                	jmp    804a25a <malloc_pages+0x136>
 804a23e:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a244:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804a247:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804a24a:	01 ca                	add    %ecx,%edx
 804a24c:	c1 e2 02             	shl    $0x2,%edx
 804a24f:	01 d0                	add    %edx,%eax
 804a251:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
 804a257:	ff 45 ec             	incl   -0x14(%ebp)
 804a25a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a25d:	3b 45 08             	cmp    0x8(%ebp),%eax
 804a260:	72 dc                	jb     804a23e <malloc_pages+0x11a>
 804a262:	8b 83 54 02 00 00    	mov    0x254(%ebx),%eax
 804a268:	85 c0                	test   %eax,%eax
 804a26a:	74 1d                	je     804a289 <malloc_pages+0x165>
 804a26c:	8b 45 08             	mov    0x8(%ebp),%eax
 804a26f:	c1 e0 0c             	shl    $0xc,%eax
 804a272:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a276:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804a27d:	00 
 804a27e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a281:	89 04 24             	mov    %eax,(%esp)
 804a284:	e8 41 f0 ff ff       	call   80492ca <memset>
 804a289:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 804a28d:	74 20                	je     804a2af <malloc_pages+0x18b>
 804a28f:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804a295:	85 c0                	test   %eax,%eax
 804a297:	75 0b                	jne    804a2a4 <malloc_pages+0x180>
 804a299:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a29c:	89 83 5c 02 00 00    	mov    %eax,0x25c(%ebx)
 804a2a2:	eb 0b                	jmp    804a2af <malloc_pages+0x18b>
 804a2a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a2a7:	89 04 24             	mov    %eax,(%esp)
 804a2aa:	e8 d7 0e 00 00       	call   804b186 <ifree>
 804a2af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a2b2:	83 c4 34             	add    $0x34,%esp
 804a2b5:	5b                   	pop    %ebx
 804a2b6:	5d                   	pop    %ebp
 804a2b7:	c3                   	ret    

0804a2b8 <malloc_make_chunks>:
 804a2b8:	55                   	push   %ebp
 804a2b9:	89 e5                	mov    %esp,%ebp
 804a2bb:	56                   	push   %esi
 804a2bc:	53                   	push   %ebx
 804a2bd:	83 ec 30             	sub    $0x30,%esp
 804a2c0:	e8 53 ee ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804a2c5:	81 c3 3b 4d 00 00    	add    $0x4d3b,%ebx
 804a2cb:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
 804a2d2:	e8 4d fe ff ff       	call   804a124 <malloc_pages>
 804a2d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804a2da:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 804a2de:	75 0a                	jne    804a2ea <malloc_make_chunks+0x32>
 804a2e0:	b8 00 00 00 00       	mov    $0x0,%eax
 804a2e5:	e9 f4 01 00 00       	jmp    804a4de <malloc_make_chunks+0x226>
 804a2ea:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
 804a2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 804a2f4:	ba 00 10 00 00       	mov    $0x1000,%edx
 804a2f9:	88 c1                	mov    %al,%cl
 804a2fb:	d3 ea                	shr    %cl,%edx
 804a2fd:	89 d0                	mov    %edx,%eax
 804a2ff:	83 c0 1f             	add    $0x1f,%eax
 804a302:	c1 e8 05             	shr    $0x5,%eax
 804a305:	c1 e0 02             	shl    $0x2,%eax
 804a308:	01 45 ec             	add    %eax,-0x14(%ebp)
 804a30b:	8b 45 08             	mov    0x8(%ebp),%eax
 804a30e:	ba 01 00 00 00       	mov    $0x1,%edx
 804a313:	88 c1                	mov    %al,%cl
 804a315:	d3 e2                	shl    %cl,%edx
 804a317:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a31a:	01 c0                	add    %eax,%eax
 804a31c:	39 c2                	cmp    %eax,%edx
 804a31e:	77 08                	ja     804a328 <malloc_make_chunks+0x70>
 804a320:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a323:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a326:	eb 29                	jmp    804a351 <malloc_make_chunks+0x99>
 804a328:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a32b:	89 04 24             	mov    %eax,(%esp)
 804a32e:	e8 34 05 00 00       	call   804a867 <imalloc>
 804a333:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a336:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a33a:	75 15                	jne    804a351 <malloc_make_chunks+0x99>
 804a33c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a33f:	89 04 24             	mov    %eax,(%esp)
 804a342:	e8 3f 0e 00 00       	call   804b186 <ifree>
 804a347:	b8 00 00 00 00       	mov    $0x0,%eax
 804a34c:	e9 8d 01 00 00       	jmp    804a4de <malloc_make_chunks+0x226>
 804a351:	8b 45 08             	mov    0x8(%ebp),%eax
 804a354:	ba 01 00 00 00       	mov    $0x1,%edx
 804a359:	88 c1                	mov    %al,%cl
 804a35b:	d3 e2                	shl    %cl,%edx
 804a35d:	89 d0                	mov    %edx,%eax
 804a35f:	0f b7 d0             	movzwl %ax,%edx
 804a362:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a365:	66 89 50 08          	mov    %dx,0x8(%eax)
 804a369:	8b 45 08             	mov    0x8(%ebp),%eax
 804a36c:	0f b7 d0             	movzwl %ax,%edx
 804a36f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a372:	66 89 50 0a          	mov    %dx,0xa(%eax)
 804a376:	8b 45 08             	mov    0x8(%ebp),%eax
 804a379:	ba 00 10 00 00       	mov    $0x1000,%edx
 804a37e:	88 c1                	mov    %al,%cl
 804a380:	d3 ea                	shr    %cl,%edx
 804a382:	89 d0                	mov    %edx,%eax
 804a384:	0f b7 d0             	movzwl %ax,%edx
 804a387:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a38a:	66 89 50 0c          	mov    %dx,0xc(%eax)
 804a38e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a391:	0f b7 50 0c          	movzwl 0xc(%eax),%edx
 804a395:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a398:	66 89 50 0e          	mov    %dx,0xe(%eax)
 804a39c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a39f:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804a3a2:	89 50 04             	mov    %edx,0x4(%eax)
 804a3a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a3a8:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804a3ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804a3af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804a3b6:	eb 19                	jmp    804a3d1 <malloc_make_chunks+0x119>
 804a3b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a3bb:	c1 e8 05             	shr    $0x5,%eax
 804a3be:	89 c2                	mov    %eax,%edx
 804a3c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a3c3:	83 c2 04             	add    $0x4,%edx
 804a3c6:	c7 04 90 ff ff ff ff 	movl   $0xffffffff,(%eax,%edx,4)
 804a3cd:	83 45 f0 20          	addl   $0x20,-0x10(%ebp)
 804a3d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a3d4:	2b 45 f0             	sub    -0x10(%ebp),%eax
 804a3d7:	83 f8 1f             	cmp    $0x1f,%eax
 804a3da:	77 dc                	ja     804a3b8 <malloc_make_chunks+0x100>
 804a3dc:	eb 2c                	jmp    804a40a <malloc_make_chunks+0x152>
 804a3de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a3e1:	c1 e8 05             	shr    $0x5,%eax
 804a3e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a3e7:	8d 48 04             	lea    0x4(%eax),%ecx
 804a3ea:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804a3ed:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 804a3f0:	83 e1 1f             	and    $0x1f,%ecx
 804a3f3:	be 01 00 00 00       	mov    $0x1,%esi
 804a3f8:	d3 e6                	shl    %cl,%esi
 804a3fa:	89 f1                	mov    %esi,%ecx
 804a3fc:	09 d1                	or     %edx,%ecx
 804a3fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a401:	83 c0 04             	add    $0x4,%eax
 804a404:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
 804a407:	ff 45 f0             	incl   -0x10(%ebp)
 804a40a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a40d:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 804a410:	72 cc                	jb     804a3de <malloc_make_chunks+0x126>
 804a412:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a415:	8b 40 04             	mov    0x4(%eax),%eax
 804a418:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804a41b:	75 72                	jne    804a48f <malloc_make_chunks+0x1d7>
 804a41d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804a424:	eb 63                	jmp    804a489 <malloc_make_chunks+0x1d1>
 804a426:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a429:	c1 e8 05             	shr    $0x5,%eax
 804a42c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a42f:	8d 48 04             	lea    0x4(%eax),%ecx
 804a432:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804a435:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 804a438:	83 e1 1f             	and    $0x1f,%ecx
 804a43b:	be 01 00 00 00       	mov    $0x1,%esi
 804a440:	d3 e6                	shl    %cl,%esi
 804a442:	89 f1                	mov    %esi,%ecx
 804a444:	f7 d1                	not    %ecx
 804a446:	21 d1                	and    %edx,%ecx
 804a448:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a44b:	83 c0 04             	add    $0x4,%eax
 804a44e:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
 804a451:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a454:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804a458:	48                   	dec    %eax
 804a459:	0f b7 d0             	movzwl %ax,%edx
 804a45c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a45f:	66 89 50 0c          	mov    %dx,0xc(%eax)
 804a463:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a466:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804a46a:	48                   	dec    %eax
 804a46b:	0f b7 d0             	movzwl %ax,%edx
 804a46e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a471:	66 89 50 0e          	mov    %dx,0xe(%eax)
 804a475:	8b 45 08             	mov    0x8(%ebp),%eax
 804a478:	ba 01 00 00 00       	mov    $0x1,%edx
 804a47d:	88 c1                	mov    %al,%cl
 804a47f:	d3 e2                	shl    %cl,%edx
 804a481:	89 d0                	mov    %edx,%eax
 804a483:	29 45 ec             	sub    %eax,-0x14(%ebp)
 804a486:	ff 45 f0             	incl   -0x10(%ebp)
 804a489:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 804a48d:	75 97                	jne    804a426 <malloc_make_chunks+0x16e>
 804a48f:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a495:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804a498:	89 d1                	mov    %edx,%ecx
 804a49a:	c1 e9 0c             	shr    $0xc,%ecx
 804a49d:	8b 93 14 02 00 00    	mov    0x214(%ebx),%edx
 804a4a3:	29 d1                	sub    %edx,%ecx
 804a4a5:	89 ca                	mov    %ecx,%edx
 804a4a7:	c1 e2 02             	shl    $0x2,%edx
 804a4aa:	01 c2                	add    %eax,%edx
 804a4ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a4af:	89 02                	mov    %eax,(%edx)
 804a4b1:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a4b7:	8b 55 08             	mov    0x8(%ebp),%edx
 804a4ba:	c1 e2 02             	shl    $0x2,%edx
 804a4bd:	01 d0                	add    %edx,%eax
 804a4bf:	8b 10                	mov    (%eax),%edx
 804a4c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a4c4:	89 10                	mov    %edx,(%eax)
 804a4c6:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a4cc:	8b 55 08             	mov    0x8(%ebp),%edx
 804a4cf:	c1 e2 02             	shl    $0x2,%edx
 804a4d2:	01 c2                	add    %eax,%edx
 804a4d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a4d7:	89 02                	mov    %eax,(%edx)
 804a4d9:	b8 01 00 00 00       	mov    $0x1,%eax
 804a4de:	83 c4 30             	add    $0x30,%esp
 804a4e1:	5b                   	pop    %ebx
 804a4e2:	5e                   	pop    %esi
 804a4e3:	5d                   	pop    %ebp
 804a4e4:	c3                   	ret    

0804a4e5 <malloc_bytes>:
 804a4e5:	55                   	push   %ebp
 804a4e6:	89 e5                	mov    %esp,%ebp
 804a4e8:	56                   	push   %esi
 804a4e9:	53                   	push   %ebx
 804a4ea:	83 ec 40             	sub    $0x40,%esp
 804a4ed:	e8 26 ec ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804a4f2:	81 c3 0e 4b 00 00    	add    $0x4b0e,%ebx
 804a4f8:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
 804a4fc:	77 07                	ja     804a505 <malloc_bytes+0x20>
 804a4fe:	c7 45 08 10 00 00 00 	movl   $0x10,0x8(%ebp)
 804a505:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 804a50c:	8b 45 08             	mov    0x8(%ebp),%eax
 804a50f:	48                   	dec    %eax
 804a510:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a513:	eb 03                	jmp    804a518 <malloc_bytes+0x33>
 804a515:	ff 45 f0             	incl   -0x10(%ebp)
 804a518:	d1 7d f4             	sarl   -0xc(%ebp)
 804a51b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a51f:	75 f4                	jne    804a515 <malloc_bytes+0x30>
 804a521:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a527:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804a52a:	c1 e2 02             	shl    $0x2,%edx
 804a52d:	01 d0                	add    %edx,%eax
 804a52f:	8b 00                	mov    (%eax),%eax
 804a531:	85 c0                	test   %eax,%eax
 804a533:	0f 85 27 02 00 00    	jne    804a760 <malloc_bytes+0x27b>
 804a539:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a53c:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804a53f:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
 804a546:	e8 d9 fb ff ff       	call   804a124 <malloc_pages>
 804a54b:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804a54e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
 804a552:	75 0a                	jne    804a55e <malloc_bytes+0x79>
 804a554:	b8 00 00 00 00       	mov    $0x0,%eax
 804a559:	e9 f4 01 00 00       	jmp    804a752 <malloc_bytes+0x26d>
 804a55e:	c7 45 d4 10 00 00 00 	movl   $0x10,-0x2c(%ebp)
 804a565:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a568:	ba 00 10 00 00       	mov    $0x1000,%edx
 804a56d:	88 c1                	mov    %al,%cl
 804a56f:	d3 ea                	shr    %cl,%edx
 804a571:	89 d0                	mov    %edx,%eax
 804a573:	83 c0 1f             	add    $0x1f,%eax
 804a576:	c1 e8 05             	shr    $0x5,%eax
 804a579:	c1 e0 02             	shl    $0x2,%eax
 804a57c:	01 45 d4             	add    %eax,-0x2c(%ebp)
 804a57f:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a582:	ba 01 00 00 00       	mov    $0x1,%edx
 804a587:	88 c1                	mov    %al,%cl
 804a589:	d3 e2                	shl    %cl,%edx
 804a58b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804a58e:	01 c0                	add    %eax,%eax
 804a590:	39 c2                	cmp    %eax,%edx
 804a592:	77 08                	ja     804a59c <malloc_bytes+0xb7>
 804a594:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804a597:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804a59a:	eb 29                	jmp    804a5c5 <malloc_bytes+0xe0>
 804a59c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804a59f:	89 04 24             	mov    %eax,(%esp)
 804a5a2:	e8 c0 02 00 00       	call   804a867 <imalloc>
 804a5a7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804a5aa:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
 804a5ae:	75 15                	jne    804a5c5 <malloc_bytes+0xe0>
 804a5b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804a5b3:	89 04 24             	mov    %eax,(%esp)
 804a5b6:	e8 cb 0b 00 00       	call   804b186 <ifree>
 804a5bb:	b8 00 00 00 00       	mov    $0x0,%eax
 804a5c0:	e9 8d 01 00 00       	jmp    804a752 <malloc_bytes+0x26d>
 804a5c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a5c8:	ba 01 00 00 00       	mov    $0x1,%edx
 804a5cd:	88 c1                	mov    %al,%cl
 804a5cf:	d3 e2                	shl    %cl,%edx
 804a5d1:	89 d0                	mov    %edx,%eax
 804a5d3:	0f b7 d0             	movzwl %ax,%edx
 804a5d6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a5d9:	66 89 50 08          	mov    %dx,0x8(%eax)
 804a5dd:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a5e0:	0f b7 d0             	movzwl %ax,%edx
 804a5e3:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a5e6:	66 89 50 0a          	mov    %dx,0xa(%eax)
 804a5ea:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a5ed:	ba 00 10 00 00       	mov    $0x1000,%edx
 804a5f2:	88 c1                	mov    %al,%cl
 804a5f4:	d3 ea                	shr    %cl,%edx
 804a5f6:	89 d0                	mov    %edx,%eax
 804a5f8:	0f b7 d0             	movzwl %ax,%edx
 804a5fb:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a5fe:	66 89 50 0c          	mov    %dx,0xc(%eax)
 804a602:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a605:	0f b7 50 0c          	movzwl 0xc(%eax),%edx
 804a609:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a60c:	66 89 50 0e          	mov    %dx,0xe(%eax)
 804a610:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a613:	8b 55 d8             	mov    -0x28(%ebp),%edx
 804a616:	89 50 04             	mov    %edx,0x4(%eax)
 804a619:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a61c:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804a620:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804a623:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
 804a62a:	eb 19                	jmp    804a645 <malloc_bytes+0x160>
 804a62c:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804a62f:	c1 e8 05             	shr    $0x5,%eax
 804a632:	89 c2                	mov    %eax,%edx
 804a634:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a637:	83 c2 04             	add    $0x4,%edx
 804a63a:	c7 04 90 ff ff ff ff 	movl   $0xffffffff,(%eax,%edx,4)
 804a641:	83 45 c8 20          	addl   $0x20,-0x38(%ebp)
 804a645:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804a648:	2b 45 c8             	sub    -0x38(%ebp),%eax
 804a64b:	83 f8 1f             	cmp    $0x1f,%eax
 804a64e:	77 dc                	ja     804a62c <malloc_bytes+0x147>
 804a650:	eb 2c                	jmp    804a67e <malloc_bytes+0x199>
 804a652:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804a655:	c1 e8 05             	shr    $0x5,%eax
 804a658:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804a65b:	8d 48 04             	lea    0x4(%eax),%ecx
 804a65e:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804a661:	8b 4d c8             	mov    -0x38(%ebp),%ecx
 804a664:	83 e1 1f             	and    $0x1f,%ecx
 804a667:	be 01 00 00 00       	mov    $0x1,%esi
 804a66c:	d3 e6                	shl    %cl,%esi
 804a66e:	89 f1                	mov    %esi,%ecx
 804a670:	09 d1                	or     %edx,%ecx
 804a672:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804a675:	83 c0 04             	add    $0x4,%eax
 804a678:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
 804a67b:	ff 45 c8             	incl   -0x38(%ebp)
 804a67e:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804a681:	3b 45 c8             	cmp    -0x38(%ebp),%eax
 804a684:	77 cc                	ja     804a652 <malloc_bytes+0x16d>
 804a686:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a689:	8b 40 04             	mov    0x4(%eax),%eax
 804a68c:	39 45 d0             	cmp    %eax,-0x30(%ebp)
 804a68f:	75 72                	jne    804a703 <malloc_bytes+0x21e>
 804a691:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
 804a698:	eb 63                	jmp    804a6fd <malloc_bytes+0x218>
 804a69a:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804a69d:	c1 e8 05             	shr    $0x5,%eax
 804a6a0:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804a6a3:	8d 48 04             	lea    0x4(%eax),%ecx
 804a6a6:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804a6a9:	8b 4d c8             	mov    -0x38(%ebp),%ecx
 804a6ac:	83 e1 1f             	and    $0x1f,%ecx
 804a6af:	be 01 00 00 00       	mov    $0x1,%esi
 804a6b4:	d3 e6                	shl    %cl,%esi
 804a6b6:	89 f1                	mov    %esi,%ecx
 804a6b8:	f7 d1                	not    %ecx
 804a6ba:	21 d1                	and    %edx,%ecx
 804a6bc:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804a6bf:	83 c0 04             	add    $0x4,%eax
 804a6c2:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
 804a6c5:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a6c8:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804a6cc:	48                   	dec    %eax
 804a6cd:	0f b7 d0             	movzwl %ax,%edx
 804a6d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a6d3:	66 89 50 0c          	mov    %dx,0xc(%eax)
 804a6d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a6da:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804a6de:	48                   	dec    %eax
 804a6df:	0f b7 d0             	movzwl %ax,%edx
 804a6e2:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a6e5:	66 89 50 0e          	mov    %dx,0xe(%eax)
 804a6e9:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a6ec:	ba 01 00 00 00       	mov    $0x1,%edx
 804a6f1:	88 c1                	mov    %al,%cl
 804a6f3:	d3 e2                	shl    %cl,%edx
 804a6f5:	89 d0                	mov    %edx,%eax
 804a6f7:	29 45 d4             	sub    %eax,-0x2c(%ebp)
 804a6fa:	ff 45 c8             	incl   -0x38(%ebp)
 804a6fd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 804a701:	75 97                	jne    804a69a <malloc_bytes+0x1b5>
 804a703:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a709:	8b 55 d8             	mov    -0x28(%ebp),%edx
 804a70c:	89 d1                	mov    %edx,%ecx
 804a70e:	c1 e9 0c             	shr    $0xc,%ecx
 804a711:	8b 93 14 02 00 00    	mov    0x214(%ebx),%edx
 804a717:	29 d1                	sub    %edx,%ecx
 804a719:	89 ca                	mov    %ecx,%edx
 804a71b:	c1 e2 02             	shl    $0x2,%edx
 804a71e:	01 c2                	add    %eax,%edx
 804a720:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a723:	89 02                	mov    %eax,(%edx)
 804a725:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a72b:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804a72e:	c1 e2 02             	shl    $0x2,%edx
 804a731:	01 d0                	add    %edx,%eax
 804a733:	8b 10                	mov    (%eax),%edx
 804a735:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a738:	89 10                	mov    %edx,(%eax)
 804a73a:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a740:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804a743:	c1 e2 02             	shl    $0x2,%edx
 804a746:	01 c2                	add    %eax,%edx
 804a748:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a74b:	89 02                	mov    %eax,(%edx)
 804a74d:	b8 01 00 00 00       	mov    $0x1,%eax
 804a752:	85 c0                	test   %eax,%eax
 804a754:	75 0a                	jne    804a760 <malloc_bytes+0x27b>
 804a756:	b8 00 00 00 00       	mov    $0x0,%eax
 804a75b:	e9 00 01 00 00       	jmp    804a860 <malloc_bytes+0x37b>
 804a760:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a766:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804a769:	c1 e2 02             	shl    $0x2,%edx
 804a76c:	01 d0                	add    %edx,%eax
 804a76e:	8b 00                	mov    (%eax),%eax
 804a770:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804a773:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a776:	83 c0 10             	add    $0x10,%eax
 804a779:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804a77c:	eb 04                	jmp    804a782 <malloc_bytes+0x29d>
 804a77e:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 804a782:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a785:	8b 00                	mov    (%eax),%eax
 804a787:	85 c0                	test   %eax,%eax
 804a789:	74 f3                	je     804a77e <malloc_bytes+0x299>
 804a78b:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
 804a792:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804a799:	eb 0b                	jmp    804a7a6 <malloc_bytes+0x2c1>
 804a79b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a79e:	01 c0                	add    %eax,%eax
 804a7a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804a7a3:	ff 45 e8             	incl   -0x18(%ebp)
 804a7a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a7a9:	8b 00                	mov    (%eax),%eax
 804a7ab:	23 45 ec             	and    -0x14(%ebp),%eax
 804a7ae:	85 c0                	test   %eax,%eax
 804a7b0:	74 e9                	je     804a79b <malloc_bytes+0x2b6>
 804a7b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a7b5:	8b 00                	mov    (%eax),%eax
 804a7b7:	33 45 ec             	xor    -0x14(%ebp),%eax
 804a7ba:	89 c2                	mov    %eax,%edx
 804a7bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a7bf:	89 10                	mov    %edx,(%eax)
 804a7c1:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a7c4:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804a7c8:	48                   	dec    %eax
 804a7c9:	0f b7 d0             	movzwl %ax,%edx
 804a7cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a7cf:	66 89 50 0c          	mov    %dx,0xc(%eax)
 804a7d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a7d6:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804a7da:	85 c0                	test   %eax,%eax
 804a7dc:	75 1e                	jne    804a7fc <malloc_bytes+0x317>
 804a7de:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a7e4:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804a7e7:	c1 e2 02             	shl    $0x2,%edx
 804a7ea:	01 c2                	add    %eax,%edx
 804a7ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a7ef:	8b 00                	mov    (%eax),%eax
 804a7f1:	89 02                	mov    %eax,(%edx)
 804a7f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a7f6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804a7fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a7ff:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804a802:	83 c2 10             	add    $0x10,%edx
 804a805:	29 d0                	sub    %edx,%eax
 804a807:	c1 f8 02             	sar    $0x2,%eax
 804a80a:	c1 e0 05             	shl    $0x5,%eax
 804a80d:	89 c2                	mov    %eax,%edx
 804a80f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a812:	01 d0                	add    %edx,%eax
 804a814:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804a817:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a81a:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804a81e:	88 c1                	mov    %al,%cl
 804a820:	d3 65 e8             	shll   %cl,-0x18(%ebp)
 804a823:	8b 83 54 02 00 00    	mov    0x254(%ebx),%eax
 804a829:	85 c0                	test   %eax,%eax
 804a82b:	74 28                	je     804a855 <malloc_bytes+0x370>
 804a82d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a830:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804a834:	89 c2                	mov    %eax,%edx
 804a836:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a839:	8b 48 04             	mov    0x4(%eax),%ecx
 804a83c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a83f:	01 c8                	add    %ecx,%eax
 804a841:	89 54 24 08          	mov    %edx,0x8(%esp)
 804a845:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804a84c:	00 
 804a84d:	89 04 24             	mov    %eax,(%esp)
 804a850:	e8 75 ea ff ff       	call   80492ca <memset>
 804a855:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a858:	8b 50 04             	mov    0x4(%eax),%edx
 804a85b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a85e:	01 d0                	add    %edx,%eax
 804a860:	83 c4 40             	add    $0x40,%esp
 804a863:	5b                   	pop    %ebx
 804a864:	5e                   	pop    %esi
 804a865:	5d                   	pop    %ebp
 804a866:	c3                   	ret    

0804a867 <imalloc>:
 804a867:	55                   	push   %ebp
 804a868:	89 e5                	mov    %esp,%ebp
 804a86a:	53                   	push   %ebx
 804a86b:	83 ec 24             	sub    $0x24,%esp
 804a86e:	e8 a5 e8 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804a873:	81 c3 8d 47 00 00    	add    $0x478d,%ebx
 804a879:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
 804a87f:	85 c0                	test   %eax,%eax
 804a881:	74 0c                	je     804a88f <imalloc+0x28>
 804a883:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804a88a:	e8 1e dd ff ff       	call   80485ad <exit>
 804a88f:	8b 45 08             	mov    0x8(%ebp),%eax
 804a892:	05 00 10 00 00       	add    $0x1000,%eax
 804a897:	3b 45 08             	cmp    0x8(%ebp),%eax
 804a89a:	73 09                	jae    804a8a5 <imalloc+0x3e>
 804a89c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804a8a3:	eb 27                	jmp    804a8cc <imalloc+0x65>
 804a8a5:	81 7d 08 00 08 00 00 	cmpl   $0x800,0x8(%ebp)
 804a8ac:	77 10                	ja     804a8be <imalloc+0x57>
 804a8ae:	8b 45 08             	mov    0x8(%ebp),%eax
 804a8b1:	89 04 24             	mov    %eax,(%esp)
 804a8b4:	e8 2c fc ff ff       	call   804a4e5 <malloc_bytes>
 804a8b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a8bc:	eb 0e                	jmp    804a8cc <imalloc+0x65>
 804a8be:	8b 45 08             	mov    0x8(%ebp),%eax
 804a8c1:	89 04 24             	mov    %eax,(%esp)
 804a8c4:	e8 5b f8 ff ff       	call   804a124 <malloc_pages>
 804a8c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a8cc:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
 804a8d2:	85 c0                	test   %eax,%eax
 804a8d4:	74 14                	je     804a8ea <imalloc+0x83>
 804a8d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a8da:	75 0e                	jne    804a8ea <imalloc+0x83>
 804a8dc:	8d 83 f0 ee ff ff    	lea    -0x1110(%ebx),%eax
 804a8e2:	89 04 24             	mov    %eax,(%esp)
 804a8e5:	e8 36 f2 ff ff       	call   8049b20 <wrterror>
 804a8ea:	8b 83 50 02 00 00    	mov    0x250(%ebx),%eax
 804a8f0:	85 c0                	test   %eax,%eax
 804a8f2:	74 20                	je     804a914 <imalloc+0xad>
 804a8f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a8f8:	74 1a                	je     804a914 <imalloc+0xad>
 804a8fa:	8b 45 08             	mov    0x8(%ebp),%eax
 804a8fd:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a901:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804a908:	00 
 804a909:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a90c:	89 04 24             	mov    %eax,(%esp)
 804a90f:	e8 b6 e9 ff ff       	call   80492ca <memset>
 804a914:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a917:	83 c4 24             	add    $0x24,%esp
 804a91a:	5b                   	pop    %ebx
 804a91b:	5d                   	pop    %ebp
 804a91c:	c3                   	ret    

0804a91d <irealloc>:
 804a91d:	55                   	push   %ebp
 804a91e:	89 e5                	mov    %esp,%ebp
 804a920:	56                   	push   %esi
 804a921:	53                   	push   %ebx
 804a922:	83 ec 30             	sub    $0x30,%esp
 804a925:	e8 ee e7 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804a92a:	81 c3 d6 46 00 00    	add    $0x46d6,%ebx
 804a930:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
 804a936:	85 c0                	test   %eax,%eax
 804a938:	74 0c                	je     804a946 <irealloc+0x29>
 804a93a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804a941:	e8 67 dc ff ff       	call   80485ad <exit>
 804a946:	8b 45 08             	mov    0x8(%ebp),%eax
 804a949:	c1 e8 0c             	shr    $0xc,%eax
 804a94c:	89 c2                	mov    %eax,%edx
 804a94e:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
 804a954:	29 c2                	sub    %eax,%edx
 804a956:	89 d0                	mov    %edx,%eax
 804a958:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804a95b:	83 7d ec 0b          	cmpl   $0xb,-0x14(%ebp)
 804a95f:	77 18                	ja     804a979 <irealloc+0x5c>
 804a961:	8d 83 04 ef ff ff    	lea    -0x10fc(%ebx),%eax
 804a967:	89 04 24             	mov    %eax,(%esp)
 804a96a:	e8 81 f2 ff ff       	call   8049bf0 <wrtwarning>
 804a96f:	b8 00 00 00 00       	mov    $0x0,%eax
 804a974:	e9 fc 01 00 00       	jmp    804ab75 <irealloc+0x258>
 804a979:	8b 83 18 02 00 00    	mov    0x218(%ebx),%eax
 804a97f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 804a982:	76 18                	jbe    804a99c <irealloc+0x7f>
 804a984:	8d 83 2c ef ff ff    	lea    -0x10d4(%ebx),%eax
 804a98a:	89 04 24             	mov    %eax,(%esp)
 804a98d:	e8 5e f2 ff ff       	call   8049bf0 <wrtwarning>
 804a992:	b8 00 00 00 00       	mov    $0x0,%eax
 804a997:	e9 d9 01 00 00       	jmp    804ab75 <irealloc+0x258>
 804a99c:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804a9a2:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804a9a5:	c1 e2 02             	shl    $0x2,%edx
 804a9a8:	01 d0                	add    %edx,%eax
 804a9aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804a9ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a9b0:	8b 00                	mov    (%eax),%eax
 804a9b2:	83 f8 02             	cmp    $0x2,%eax
 804a9b5:	75 75                	jne    804aa2c <irealloc+0x10f>
 804a9b7:	8b 45 08             	mov    0x8(%ebp),%eax
 804a9ba:	25 ff 0f 00 00       	and    $0xfff,%eax
 804a9bf:	85 c0                	test   %eax,%eax
 804a9c1:	74 18                	je     804a9db <irealloc+0xbe>
 804a9c3:	8d 83 53 ef ff ff    	lea    -0x10ad(%ebx),%eax
 804a9c9:	89 04 24             	mov    %eax,(%esp)
 804a9cc:	e8 1f f2 ff ff       	call   8049bf0 <wrtwarning>
 804a9d1:	b8 00 00 00 00       	mov    $0x0,%eax
 804a9d6:	e9 9a 01 00 00       	jmp    804ab75 <irealloc+0x258>
 804a9db:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%ebp)
 804a9e2:	eb 07                	jmp    804a9eb <irealloc+0xce>
 804a9e4:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
 804a9eb:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
 804a9ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a9f2:	8b 00                	mov    (%eax),%eax
 804a9f4:	83 f8 03             	cmp    $0x3,%eax
 804a9f7:	74 eb                	je     804a9e4 <irealloc+0xc7>
 804a9f9:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
 804a9ff:	85 c0                	test   %eax,%eax
 804aa01:	0f 85 04 01 00 00    	jne    804ab0b <irealloc+0x1ee>
 804aa07:	8b 45 0c             	mov    0xc(%ebp),%eax
 804aa0a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804aa0d:	0f 87 f8 00 00 00    	ja     804ab0b <irealloc+0x1ee>
 804aa13:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804aa16:	2d 00 10 00 00       	sub    $0x1000,%eax
 804aa1b:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804aa1e:	0f 83 e7 00 00 00    	jae    804ab0b <irealloc+0x1ee>
 804aa24:	8b 45 08             	mov    0x8(%ebp),%eax
 804aa27:	e9 49 01 00 00       	jmp    804ab75 <irealloc+0x258>
 804aa2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aa2f:	8b 00                	mov    (%eax),%eax
 804aa31:	83 f8 03             	cmp    $0x3,%eax
 804aa34:	0f 86 bc 00 00 00    	jbe    804aaf6 <irealloc+0x1d9>
 804aa3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aa3d:	8b 00                	mov    (%eax),%eax
 804aa3f:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804aa43:	48                   	dec    %eax
 804aa44:	89 c2                	mov    %eax,%edx
 804aa46:	8b 45 08             	mov    0x8(%ebp),%eax
 804aa49:	21 d0                	and    %edx,%eax
 804aa4b:	85 c0                	test   %eax,%eax
 804aa4d:	74 18                	je     804aa67 <irealloc+0x14a>
 804aa4f:	8d 83 6e ef ff ff    	lea    -0x1092(%ebx),%eax
 804aa55:	89 04 24             	mov    %eax,(%esp)
 804aa58:	e8 93 f1 ff ff       	call   8049bf0 <wrtwarning>
 804aa5d:	b8 00 00 00 00       	mov    $0x0,%eax
 804aa62:	e9 0e 01 00 00       	jmp    804ab75 <irealloc+0x258>
 804aa67:	8b 45 08             	mov    0x8(%ebp),%eax
 804aa6a:	25 ff 0f 00 00       	and    $0xfff,%eax
 804aa6f:	89 c2                	mov    %eax,%edx
 804aa71:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aa74:	8b 00                	mov    (%eax),%eax
 804aa76:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804aa7a:	88 c1                	mov    %al,%cl
 804aa7c:	d3 ea                	shr    %cl,%edx
 804aa7e:	89 d0                	mov    %edx,%eax
 804aa80:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804aa83:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aa86:	8b 00                	mov    (%eax),%eax
 804aa88:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804aa8b:	c1 ea 05             	shr    $0x5,%edx
 804aa8e:	83 c2 04             	add    $0x4,%edx
 804aa91:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804aa94:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804aa97:	83 e2 1f             	and    $0x1f,%edx
 804aa9a:	be 01 00 00 00       	mov    $0x1,%esi
 804aa9f:	88 d1                	mov    %dl,%cl
 804aaa1:	d3 e6                	shl    %cl,%esi
 804aaa3:	89 f2                	mov    %esi,%edx
 804aaa5:	21 d0                	and    %edx,%eax
 804aaa7:	85 c0                	test   %eax,%eax
 804aaa9:	74 18                	je     804aac3 <irealloc+0x1a6>
 804aaab:	8d 83 8a ef ff ff    	lea    -0x1076(%ebx),%eax
 804aab1:	89 04 24             	mov    %eax,(%esp)
 804aab4:	e8 37 f1 ff ff       	call   8049bf0 <wrtwarning>
 804aab9:	b8 00 00 00 00       	mov    $0x0,%eax
 804aabe:	e9 b2 00 00 00       	jmp    804ab75 <irealloc+0x258>
 804aac3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aac6:	8b 00                	mov    (%eax),%eax
 804aac8:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804aacc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804aacf:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
 804aad5:	85 c0                	test   %eax,%eax
 804aad7:	75 32                	jne    804ab0b <irealloc+0x1ee>
 804aad9:	8b 45 0c             	mov    0xc(%ebp),%eax
 804aadc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804aadf:	73 2a                	jae    804ab0b <irealloc+0x1ee>
 804aae1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804aae4:	d1 e8                	shr    %eax
 804aae6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804aae9:	72 06                	jb     804aaf1 <irealloc+0x1d4>
 804aaeb:	83 7d f4 10          	cmpl   $0x10,-0xc(%ebp)
 804aaef:	75 1a                	jne    804ab0b <irealloc+0x1ee>
 804aaf1:	8b 45 08             	mov    0x8(%ebp),%eax
 804aaf4:	eb 7f                	jmp    804ab75 <irealloc+0x258>
 804aaf6:	8d 83 a2 ef ff ff    	lea    -0x105e(%ebx),%eax
 804aafc:	89 04 24             	mov    %eax,(%esp)
 804aaff:	e8 ec f0 ff ff       	call   8049bf0 <wrtwarning>
 804ab04:	b8 00 00 00 00       	mov    $0x0,%eax
 804ab09:	eb 6a                	jmp    804ab75 <irealloc+0x258>
 804ab0b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab0e:	89 04 24             	mov    %eax,(%esp)
 804ab11:	e8 51 fd ff ff       	call   804a867 <imalloc>
 804ab16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804ab19:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804ab1d:	74 53                	je     804ab72 <irealloc+0x255>
 804ab1f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804ab23:	74 42                	je     804ab67 <irealloc+0x24a>
 804ab25:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804ab29:	74 3c                	je     804ab67 <irealloc+0x24a>
 804ab2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ab2e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804ab31:	73 1b                	jae    804ab4e <irealloc+0x231>
 804ab33:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ab36:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ab3a:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab3d:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ab41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804ab44:	89 04 24             	mov    %eax,(%esp)
 804ab47:	e8 23 e6 ff ff       	call   804916f <memcpy>
 804ab4c:	eb 19                	jmp    804ab67 <irealloc+0x24a>
 804ab4e:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab51:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ab55:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab58:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ab5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804ab5f:	89 04 24             	mov    %eax,(%esp)
 804ab62:	e8 08 e6 ff ff       	call   804916f <memcpy>
 804ab67:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab6a:	89 04 24             	mov    %eax,(%esp)
 804ab6d:	e8 14 06 00 00       	call   804b186 <ifree>
 804ab72:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804ab75:	83 c4 30             	add    $0x30,%esp
 804ab78:	5b                   	pop    %ebx
 804ab79:	5e                   	pop    %esi
 804ab7a:	5d                   	pop    %ebp
 804ab7b:	c3                   	ret    

0804ab7c <free_pages>:
 804ab7c:	55                   	push   %ebp
 804ab7d:	89 e5                	mov    %esp,%ebp
 804ab7f:	53                   	push   %ebx
 804ab80:	83 ec 34             	sub    $0x34,%esp
 804ab83:	e8 90 e5 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804ab88:	81 c3 78 44 00 00    	add    $0x4478,%ebx
 804ab8e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804ab95:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
 804ab99:	75 13                	jne    804abae <free_pages+0x32>
 804ab9b:	8d 83 ba ef ff ff    	lea    -0x1046(%ebx),%eax
 804aba1:	89 04 24             	mov    %eax,(%esp)
 804aba4:	e8 47 f0 ff ff       	call   8049bf0 <wrtwarning>
 804aba9:	e9 db 03 00 00       	jmp    804af89 <free_pages+0x40d>
 804abae:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
 804abb2:	74 13                	je     804abc7 <free_pages+0x4b>
 804abb4:	8d 83 a2 ef ff ff    	lea    -0x105e(%ebx),%eax
 804abba:	89 04 24             	mov    %eax,(%esp)
 804abbd:	e8 2e f0 ff ff       	call   8049bf0 <wrtwarning>
 804abc2:	e9 c2 03 00 00       	jmp    804af89 <free_pages+0x40d>
 804abc7:	8b 45 08             	mov    0x8(%ebp),%eax
 804abca:	25 ff 0f 00 00       	and    $0xfff,%eax
 804abcf:	85 c0                	test   %eax,%eax
 804abd1:	74 13                	je     804abe6 <free_pages+0x6a>
 804abd3:	8d 83 53 ef ff ff    	lea    -0x10ad(%ebx),%eax
 804abd9:	89 04 24             	mov    %eax,(%esp)
 804abdc:	e8 0f f0 ff ff       	call   8049bf0 <wrtwarning>
 804abe1:	e9 a3 03 00 00       	jmp    804af89 <free_pages+0x40d>
 804abe6:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804abec:	8b 55 0c             	mov    0xc(%ebp),%edx
 804abef:	c1 e2 02             	shl    $0x2,%edx
 804abf2:	01 d0                	add    %edx,%eax
 804abf4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
 804abfa:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 804ac01:	eb 1c                	jmp    804ac1f <free_pages+0xa3>
 804ac03:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804ac09:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804ac0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804ac0f:	01 ca                	add    %ecx,%edx
 804ac11:	c1 e2 02             	shl    $0x2,%edx
 804ac14:	01 d0                	add    %edx,%eax
 804ac16:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
 804ac1c:	ff 45 f4             	incl   -0xc(%ebp)
 804ac1f:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804ac25:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804ac28:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804ac2b:	01 ca                	add    %ecx,%edx
 804ac2d:	c1 e2 02             	shl    $0x2,%edx
 804ac30:	01 d0                	add    %edx,%eax
 804ac32:	8b 00                	mov    (%eax),%eax
 804ac34:	83 f8 03             	cmp    $0x3,%eax
 804ac37:	74 ca                	je     804ac03 <free_pages+0x87>
 804ac39:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ac3c:	c1 e0 0c             	shl    $0xc,%eax
 804ac3f:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804ac42:	8b 83 54 02 00 00    	mov    0x254(%ebx),%eax
 804ac48:	85 c0                	test   %eax,%eax
 804ac4a:	74 1a                	je     804ac66 <free_pages+0xea>
 804ac4c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ac4f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ac53:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804ac5a:	00 
 804ac5b:	8b 45 08             	mov    0x8(%ebp),%eax
 804ac5e:	89 04 24             	mov    %eax,(%esp)
 804ac61:	e8 64 e6 ff ff       	call   80492ca <memset>
 804ac66:	8b 55 08             	mov    0x8(%ebp),%edx
 804ac69:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ac6c:	01 d0                	add    %edx,%eax
 804ac6e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804ac71:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804ac77:	85 c0                	test   %eax,%eax
 804ac79:	75 12                	jne    804ac8d <free_pages+0x111>
 804ac7b:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
 804ac82:	e8 e0 fb ff ff       	call   804a867 <imalloc>
 804ac87:	89 83 5c 02 00 00    	mov    %eax,0x25c(%ebx)
 804ac8d:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804ac93:	8b 55 08             	mov    0x8(%ebp),%edx
 804ac96:	89 50 08             	mov    %edx,0x8(%eax)
 804ac99:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804ac9f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804aca2:	89 50 0c             	mov    %edx,0xc(%eax)
 804aca5:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804acab:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804acae:	89 50 10             	mov    %edx,0x10(%eax)
 804acb1:	8b 83 24 02 00 00    	mov    0x224(%ebx),%eax
 804acb7:	85 c0                	test   %eax,%eax
 804acb9:	75 41                	jne    804acfc <free_pages+0x180>
 804acbb:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804acc1:	8b 93 24 02 00 00    	mov    0x224(%ebx),%edx
 804acc7:	89 10                	mov    %edx,(%eax)
 804acc9:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804accf:	8d 93 24 02 00 00    	lea    0x224(%ebx),%edx
 804acd5:	89 50 04             	mov    %edx,0x4(%eax)
 804acd8:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804acde:	89 83 24 02 00 00    	mov    %eax,0x224(%ebx)
 804ace4:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804acea:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804aced:	c7 83 5c 02 00 00 00 	movl   $0x0,0x25c(%ebx)
 804acf4:	00 00 00 
 804acf7:	e9 a2 01 00 00       	jmp    804ae9e <free_pages+0x322>
 804acfc:	8b 55 08             	mov    0x8(%ebp),%edx
 804acff:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ad02:	01 d0                	add    %edx,%eax
 804ad04:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804ad07:	8b 83 24 02 00 00    	mov    0x224(%ebx),%eax
 804ad0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804ad10:	eb 08                	jmp    804ad1a <free_pages+0x19e>
 804ad12:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ad15:	8b 00                	mov    (%eax),%eax
 804ad17:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804ad1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ad1d:	8b 40 0c             	mov    0xc(%eax),%eax
 804ad20:	3b 45 08             	cmp    0x8(%ebp),%eax
 804ad23:	73 09                	jae    804ad2e <free_pages+0x1b2>
 804ad25:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ad28:	8b 00                	mov    (%eax),%eax
 804ad2a:	85 c0                	test   %eax,%eax
 804ad2c:	75 e4                	jne    804ad12 <free_pages+0x196>
 804ad2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ad31:	8b 40 08             	mov    0x8(%eax),%eax
 804ad34:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 804ad37:	76 4f                	jbe    804ad88 <free_pages+0x20c>
 804ad39:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804ad3f:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804ad42:	89 10                	mov    %edx,(%eax)
 804ad44:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804ad4a:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804ad4d:	8b 52 04             	mov    0x4(%edx),%edx
 804ad50:	89 50 04             	mov    %edx,0x4(%eax)
 804ad53:	8b 93 5c 02 00 00    	mov    0x25c(%ebx),%edx
 804ad59:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ad5c:	89 50 04             	mov    %edx,0x4(%eax)
 804ad5f:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804ad65:	8b 40 04             	mov    0x4(%eax),%eax
 804ad68:	8b 93 5c 02 00 00    	mov    0x25c(%ebx),%edx
 804ad6e:	89 10                	mov    %edx,(%eax)
 804ad70:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804ad76:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804ad79:	c7 83 5c 02 00 00 00 	movl   $0x0,0x25c(%ebx)
 804ad80:	00 00 00 
 804ad83:	e9 16 01 00 00       	jmp    804ae9e <free_pages+0x322>
 804ad88:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ad8b:	8b 40 0c             	mov    0xc(%eax),%eax
 804ad8e:	3b 45 08             	cmp    0x8(%ebp),%eax
 804ad91:	0f 85 91 00 00 00    	jne    804ae28 <free_pages+0x2ac>
 804ad97:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ad9a:	8b 50 0c             	mov    0xc(%eax),%edx
 804ad9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ada0:	01 c2                	add    %eax,%edx
 804ada2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ada5:	89 50 0c             	mov    %edx,0xc(%eax)
 804ada8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804adab:	8b 50 10             	mov    0x10(%eax),%edx
 804adae:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804adb1:	01 c2                	add    %eax,%edx
 804adb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804adb6:	89 50 10             	mov    %edx,0x10(%eax)
 804adb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804adbc:	8b 00                	mov    (%eax),%eax
 804adbe:	85 c0                	test   %eax,%eax
 804adc0:	0f 84 d8 00 00 00    	je     804ae9e <free_pages+0x322>
 804adc6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804adc9:	8b 50 0c             	mov    0xc(%eax),%edx
 804adcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804adcf:	8b 00                	mov    (%eax),%eax
 804add1:	8b 40 08             	mov    0x8(%eax),%eax
 804add4:	39 c2                	cmp    %eax,%edx
 804add6:	0f 85 c2 00 00 00    	jne    804ae9e <free_pages+0x322>
 804addc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804addf:	8b 00                	mov    (%eax),%eax
 804ade1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804ade4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804ade7:	8b 50 0c             	mov    0xc(%eax),%edx
 804adea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aded:	89 50 0c             	mov    %edx,0xc(%eax)
 804adf0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804adf3:	8b 50 10             	mov    0x10(%eax),%edx
 804adf6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804adf9:	8b 40 10             	mov    0x10(%eax),%eax
 804adfc:	01 c2                	add    %eax,%edx
 804adfe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ae01:	89 50 10             	mov    %edx,0x10(%eax)
 804ae04:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804ae07:	8b 10                	mov    (%eax),%edx
 804ae09:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ae0c:	89 10                	mov    %edx,(%eax)
 804ae0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ae11:	8b 00                	mov    (%eax),%eax
 804ae13:	85 c0                	test   %eax,%eax
 804ae15:	0f 84 83 00 00 00    	je     804ae9e <free_pages+0x322>
 804ae1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ae1e:	8b 00                	mov    (%eax),%eax
 804ae20:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804ae23:	89 50 04             	mov    %edx,0x4(%eax)
 804ae26:	eb 76                	jmp    804ae9e <free_pages+0x322>
 804ae28:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ae2b:	8b 40 08             	mov    0x8(%eax),%eax
 804ae2e:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 804ae31:	75 1c                	jne    804ae4f <free_pages+0x2d3>
 804ae33:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ae36:	8b 50 10             	mov    0x10(%eax),%edx
 804ae39:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ae3c:	01 c2                	add    %eax,%edx
 804ae3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ae41:	89 50 10             	mov    %edx,0x10(%eax)
 804ae44:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ae47:	8b 55 08             	mov    0x8(%ebp),%edx
 804ae4a:	89 50 08             	mov    %edx,0x8(%eax)
 804ae4d:	eb 4f                	jmp    804ae9e <free_pages+0x322>
 804ae4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ae52:	8b 00                	mov    (%eax),%eax
 804ae54:	85 c0                	test   %eax,%eax
 804ae56:	75 38                	jne    804ae90 <free_pages+0x314>
 804ae58:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804ae5e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804ae64:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804ae6a:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804ae6d:	89 50 04             	mov    %edx,0x4(%eax)
 804ae70:	8b 93 5c 02 00 00    	mov    0x25c(%ebx),%edx
 804ae76:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ae79:	89 10                	mov    %edx,(%eax)
 804ae7b:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804ae81:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804ae84:	c7 83 5c 02 00 00 00 	movl   $0x0,0x25c(%ebx)
 804ae8b:	00 00 00 
 804ae8e:	eb 0e                	jmp    804ae9e <free_pages+0x322>
 804ae90:	8d 83 d1 ef ff ff    	lea    -0x102f(%ebx),%eax
 804ae96:	89 04 24             	mov    %eax,(%esp)
 804ae99:	e8 82 ec ff ff       	call   8049b20 <wrterror>
 804ae9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aea1:	8b 00                	mov    (%eax),%eax
 804aea3:	85 c0                	test   %eax,%eax
 804aea5:	0f 85 cd 00 00 00    	jne    804af78 <free_pages+0x3fc>
 804aeab:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aeae:	8b 50 10             	mov    0x10(%eax),%edx
 804aeb1:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
 804aeb7:	39 c2                	cmp    %eax,%edx
 804aeb9:	0f 86 b9 00 00 00    	jbe    804af78 <free_pages+0x3fc>
 804aebf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aec2:	8b 50 0c             	mov    0xc(%eax),%edx
 804aec5:	8b 83 58 02 00 00    	mov    0x258(%ebx),%eax
 804aecb:	39 c2                	cmp    %eax,%edx
 804aecd:	0f 85 a5 00 00 00    	jne    804af78 <free_pages+0x3fc>
 804aed3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804aeda:	e8 df d4 ff ff       	call   80483be <sbrk>
 804aedf:	89 c2                	mov    %eax,%edx
 804aee1:	8b 83 58 02 00 00    	mov    0x258(%ebx),%eax
 804aee7:	39 c2                	cmp    %eax,%edx
 804aee9:	0f 85 89 00 00 00    	jne    804af78 <free_pages+0x3fc>
 804aeef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aef2:	8b 50 08             	mov    0x8(%eax),%edx
 804aef5:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
 804aefb:	01 c2                	add    %eax,%edx
 804aefd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804af00:	89 50 0c             	mov    %edx,0xc(%eax)
 804af03:	8b 93 20 00 00 00    	mov    0x20(%ebx),%edx
 804af09:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804af0c:	89 50 10             	mov    %edx,0x10(%eax)
 804af0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804af12:	8b 40 0c             	mov    0xc(%eax),%eax
 804af15:	89 04 24             	mov    %eax,(%esp)
 804af18:	e8 6a d5 ff ff       	call   8048487 <brk>
 804af1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804af20:	8b 40 0c             	mov    0xc(%eax),%eax
 804af23:	89 83 58 02 00 00    	mov    %eax,0x258(%ebx)
 804af29:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804af2c:	8b 40 0c             	mov    0xc(%eax),%eax
 804af2f:	c1 e8 0c             	shr    $0xc,%eax
 804af32:	89 c2                	mov    %eax,%edx
 804af34:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
 804af3a:	29 c2                	sub    %eax,%edx
 804af3c:	89 d0                	mov    %edx,%eax
 804af3e:	89 45 0c             	mov    %eax,0xc(%ebp)
 804af41:	8b 45 0c             	mov    0xc(%ebp),%eax
 804af44:	48                   	dec    %eax
 804af45:	89 83 18 02 00 00    	mov    %eax,0x218(%ebx)
 804af4b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804af4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804af51:	eb 1a                	jmp    804af6d <free_pages+0x3f1>
 804af53:	8b 8b 1c 02 00 00    	mov    0x21c(%ebx),%ecx
 804af59:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804af5c:	8d 50 01             	lea    0x1(%eax),%edx
 804af5f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804af62:	c1 e0 02             	shl    $0x2,%eax
 804af65:	01 c8                	add    %ecx,%eax
 804af67:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804af6d:	8b 83 18 02 00 00    	mov    0x218(%ebx),%eax
 804af73:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 804af76:	76 db                	jbe    804af53 <free_pages+0x3d7>
 804af78:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 804af7c:	74 0b                	je     804af89 <free_pages+0x40d>
 804af7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804af81:	89 04 24             	mov    %eax,(%esp)
 804af84:	e8 fd 01 00 00       	call   804b186 <ifree>
 804af89:	83 c4 34             	add    $0x34,%esp
 804af8c:	5b                   	pop    %ebx
 804af8d:	5d                   	pop    %ebp
 804af8e:	c3                   	ret    

0804af8f <free_bytes>:
 804af8f:	55                   	push   %ebp
 804af90:	89 e5                	mov    %esp,%ebp
 804af92:	56                   	push   %esi
 804af93:	53                   	push   %ebx
 804af94:	83 ec 20             	sub    $0x20,%esp
 804af97:	e8 7c e1 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804af9c:	81 c3 64 40 00 00    	add    $0x4064,%ebx
 804afa2:	8b 45 08             	mov    0x8(%ebp),%eax
 804afa5:	25 ff 0f 00 00       	and    $0xfff,%eax
 804afaa:	89 c2                	mov    %eax,%edx
 804afac:	8b 45 10             	mov    0x10(%ebp),%eax
 804afaf:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804afb3:	88 c1                	mov    %al,%cl
 804afb5:	d3 ea                	shr    %cl,%edx
 804afb7:	89 d0                	mov    %edx,%eax
 804afb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804afbc:	8b 45 10             	mov    0x10(%ebp),%eax
 804afbf:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804afc3:	48                   	dec    %eax
 804afc4:	89 c2                	mov    %eax,%edx
 804afc6:	8b 45 08             	mov    0x8(%ebp),%eax
 804afc9:	21 d0                	and    %edx,%eax
 804afcb:	85 c0                	test   %eax,%eax
 804afcd:	74 13                	je     804afe2 <free_bytes+0x53>
 804afcf:	8d 83 6e ef ff ff    	lea    -0x1092(%ebx),%eax
 804afd5:	89 04 24             	mov    %eax,(%esp)
 804afd8:	e8 13 ec ff ff       	call   8049bf0 <wrtwarning>
 804afdd:	e9 9d 01 00 00       	jmp    804b17f <free_bytes+0x1f0>
 804afe2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804afe5:	c1 e8 05             	shr    $0x5,%eax
 804afe8:	89 c2                	mov    %eax,%edx
 804afea:	8b 45 10             	mov    0x10(%ebp),%eax
 804afed:	83 c2 04             	add    $0x4,%edx
 804aff0:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804aff3:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804aff6:	83 e2 1f             	and    $0x1f,%edx
 804aff9:	be 01 00 00 00       	mov    $0x1,%esi
 804affe:	88 d1                	mov    %dl,%cl
 804b000:	d3 e6                	shl    %cl,%esi
 804b002:	89 f2                	mov    %esi,%edx
 804b004:	21 d0                	and    %edx,%eax
 804b006:	85 c0                	test   %eax,%eax
 804b008:	74 13                	je     804b01d <free_bytes+0x8e>
 804b00a:	8d 83 8a ef ff ff    	lea    -0x1076(%ebx),%eax
 804b010:	89 04 24             	mov    %eax,(%esp)
 804b013:	e8 d8 eb ff ff       	call   8049bf0 <wrtwarning>
 804b018:	e9 62 01 00 00       	jmp    804b17f <free_bytes+0x1f0>
 804b01d:	8b 83 54 02 00 00    	mov    0x254(%ebx),%eax
 804b023:	85 c0                	test   %eax,%eax
 804b025:	74 1e                	je     804b045 <free_bytes+0xb6>
 804b027:	8b 45 10             	mov    0x10(%ebp),%eax
 804b02a:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804b02e:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b032:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804b039:	00 
 804b03a:	8b 45 08             	mov    0x8(%ebp),%eax
 804b03d:	89 04 24             	mov    %eax,(%esp)
 804b040:	e8 85 e2 ff ff       	call   80492ca <memset>
 804b045:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804b048:	c1 e8 05             	shr    $0x5,%eax
 804b04b:	8b 55 10             	mov    0x10(%ebp),%edx
 804b04e:	8d 48 04             	lea    0x4(%eax),%ecx
 804b051:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804b054:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 804b057:	83 e1 1f             	and    $0x1f,%ecx
 804b05a:	be 01 00 00 00       	mov    $0x1,%esi
 804b05f:	d3 e6                	shl    %cl,%esi
 804b061:	89 f1                	mov    %esi,%ecx
 804b063:	09 d1                	or     %edx,%ecx
 804b065:	8b 55 10             	mov    0x10(%ebp),%edx
 804b068:	83 c0 04             	add    $0x4,%eax
 804b06b:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
 804b06e:	8b 45 10             	mov    0x10(%ebp),%eax
 804b071:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804b075:	40                   	inc    %eax
 804b076:	0f b7 d0             	movzwl %ax,%edx
 804b079:	8b 45 10             	mov    0x10(%ebp),%eax
 804b07c:	66 89 50 0c          	mov    %dx,0xc(%eax)
 804b080:	8b 93 1c 02 00 00    	mov    0x21c(%ebx),%edx
 804b086:	8b 45 10             	mov    0x10(%ebp),%eax
 804b089:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804b08d:	c1 e0 02             	shl    $0x2,%eax
 804b090:	01 d0                	add    %edx,%eax
 804b092:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b095:	8b 45 10             	mov    0x10(%ebp),%eax
 804b098:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804b09c:	83 f8 01             	cmp    $0x1,%eax
 804b09f:	75 5e                	jne    804b0ff <free_bytes+0x170>
 804b0a1:	8b 93 1c 02 00 00    	mov    0x21c(%ebx),%edx
 804b0a7:	8b 45 10             	mov    0x10(%ebp),%eax
 804b0aa:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804b0ae:	c1 e0 02             	shl    $0x2,%eax
 804b0b1:	01 d0                	add    %edx,%eax
 804b0b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b0b6:	eb 08                	jmp    804b0c0 <free_bytes+0x131>
 804b0b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b0bb:	8b 00                	mov    (%eax),%eax
 804b0bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b0c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b0c3:	8b 00                	mov    (%eax),%eax
 804b0c5:	85 c0                	test   %eax,%eax
 804b0c7:	74 1f                	je     804b0e8 <free_bytes+0x159>
 804b0c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b0cc:	8b 00                	mov    (%eax),%eax
 804b0ce:	8b 00                	mov    (%eax),%eax
 804b0d0:	85 c0                	test   %eax,%eax
 804b0d2:	74 14                	je     804b0e8 <free_bytes+0x159>
 804b0d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b0d7:	8b 00                	mov    (%eax),%eax
 804b0d9:	8b 00                	mov    (%eax),%eax
 804b0db:	8b 50 04             	mov    0x4(%eax),%edx
 804b0de:	8b 45 10             	mov    0x10(%ebp),%eax
 804b0e1:	8b 40 04             	mov    0x4(%eax),%eax
 804b0e4:	39 c2                	cmp    %eax,%edx
 804b0e6:	72 d0                	jb     804b0b8 <free_bytes+0x129>
 804b0e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b0eb:	8b 10                	mov    (%eax),%edx
 804b0ed:	8b 45 10             	mov    0x10(%ebp),%eax
 804b0f0:	89 10                	mov    %edx,(%eax)
 804b0f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b0f5:	8b 55 10             	mov    0x10(%ebp),%edx
 804b0f8:	89 10                	mov    %edx,(%eax)
 804b0fa:	e9 80 00 00 00       	jmp    804b17f <free_bytes+0x1f0>
 804b0ff:	8b 45 10             	mov    0x10(%ebp),%eax
 804b102:	0f b7 50 0c          	movzwl 0xc(%eax),%edx
 804b106:	8b 45 10             	mov    0x10(%ebp),%eax
 804b109:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804b10d:	39 c2                	cmp    %eax,%edx
 804b10f:	75 6d                	jne    804b17e <free_bytes+0x1ef>
 804b111:	eb 08                	jmp    804b11b <free_bytes+0x18c>
 804b113:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b116:	8b 00                	mov    (%eax),%eax
 804b118:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b11b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b11e:	8b 00                	mov    (%eax),%eax
 804b120:	3b 45 10             	cmp    0x10(%ebp),%eax
 804b123:	75 ee                	jne    804b113 <free_bytes+0x184>
 804b125:	8b 45 10             	mov    0x10(%ebp),%eax
 804b128:	8b 10                	mov    (%eax),%edx
 804b12a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b12d:	89 10                	mov    %edx,(%eax)
 804b12f:	8b 93 1c 02 00 00    	mov    0x21c(%ebx),%edx
 804b135:	8b 45 10             	mov    0x10(%ebp),%eax
 804b138:	8b 40 04             	mov    0x4(%eax),%eax
 804b13b:	c1 e8 0c             	shr    $0xc,%eax
 804b13e:	89 c1                	mov    %eax,%ecx
 804b140:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
 804b146:	29 c1                	sub    %eax,%ecx
 804b148:	89 c8                	mov    %ecx,%eax
 804b14a:	c1 e0 02             	shl    $0x2,%eax
 804b14d:	01 d0                	add    %edx,%eax
 804b14f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
 804b155:	8b 45 10             	mov    0x10(%ebp),%eax
 804b158:	8b 40 04             	mov    0x4(%eax),%eax
 804b15b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804b15e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b161:	3b 45 10             	cmp    0x10(%ebp),%eax
 804b164:	74 0b                	je     804b171 <free_bytes+0x1e2>
 804b166:	8b 45 10             	mov    0x10(%ebp),%eax
 804b169:	89 04 24             	mov    %eax,(%esp)
 804b16c:	e8 15 00 00 00       	call   804b186 <ifree>
 804b171:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b174:	89 04 24             	mov    %eax,(%esp)
 804b177:	e8 0a 00 00 00       	call   804b186 <ifree>
 804b17c:	eb 01                	jmp    804b17f <free_bytes+0x1f0>
 804b17e:	90                   	nop
 804b17f:	83 c4 20             	add    $0x20,%esp
 804b182:	5b                   	pop    %ebx
 804b183:	5e                   	pop    %esi
 804b184:	5d                   	pop    %ebp
 804b185:	c3                   	ret    

0804b186 <ifree>:
 804b186:	55                   	push   %ebp
 804b187:	89 e5                	mov    %esp,%ebp
 804b189:	56                   	push   %esi
 804b18a:	53                   	push   %ebx
 804b18b:	83 ec 50             	sub    $0x50,%esp
 804b18e:	e8 85 df ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804b193:	81 c3 6d 3e 00 00    	add    $0x3e6d,%ebx
 804b199:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804b19d:	0f 84 9c 06 00 00    	je     804b83f <ifree+0x6b9>
 804b1a3:	8b 83 0c 02 00 00    	mov    0x20c(%ebx),%eax
 804b1a9:	85 c0                	test   %eax,%eax
 804b1ab:	75 13                	jne    804b1c0 <ifree+0x3a>
 804b1ad:	8d 83 ec ef ff ff    	lea    -0x1014(%ebx),%eax
 804b1b3:	89 04 24             	mov    %eax,(%esp)
 804b1b6:	e8 35 ea ff ff       	call   8049bf0 <wrtwarning>
 804b1bb:	e9 86 06 00 00       	jmp    804b846 <ifree+0x6c0>
 804b1c0:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
 804b1c6:	85 c0                	test   %eax,%eax
 804b1c8:	0f 85 74 06 00 00    	jne    804b842 <ifree+0x6bc>
 804b1ce:	8b 45 08             	mov    0x8(%ebp),%eax
 804b1d1:	c1 e8 0c             	shr    $0xc,%eax
 804b1d4:	89 c2                	mov    %eax,%edx
 804b1d6:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
 804b1dc:	29 c2                	sub    %eax,%edx
 804b1de:	89 d0                	mov    %edx,%eax
 804b1e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b1e3:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
 804b1e7:	77 13                	ja     804b1fc <ifree+0x76>
 804b1e9:	8d 83 04 ef ff ff    	lea    -0x10fc(%ebx),%eax
 804b1ef:	89 04 24             	mov    %eax,(%esp)
 804b1f2:	e8 f9 e9 ff ff       	call   8049bf0 <wrtwarning>
 804b1f7:	e9 4a 06 00 00       	jmp    804b846 <ifree+0x6c0>
 804b1fc:	8b 83 18 02 00 00    	mov    0x218(%ebx),%eax
 804b202:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 804b205:	76 13                	jbe    804b21a <ifree+0x94>
 804b207:	8d 83 2c ef ff ff    	lea    -0x10d4(%ebx),%eax
 804b20d:	89 04 24             	mov    %eax,(%esp)
 804b210:	e8 db e9 ff ff       	call   8049bf0 <wrtwarning>
 804b215:	e9 2c 06 00 00       	jmp    804b846 <ifree+0x6c0>
 804b21a:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804b220:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804b223:	c1 e2 02             	shl    $0x2,%edx
 804b226:	01 d0                	add    %edx,%eax
 804b228:	8b 00                	mov    (%eax),%eax
 804b22a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804b22d:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
 804b231:	0f 87 19 04 00 00    	ja     804b650 <ifree+0x4ca>
 804b237:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b23a:	8b 55 08             	mov    0x8(%ebp),%edx
 804b23d:	89 55 e8             	mov    %edx,-0x18(%ebp)
 804b240:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804b243:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804b246:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804b249:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 804b250:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
 804b254:	75 13                	jne    804b269 <ifree+0xe3>
 804b256:	8d 83 ba ef ff ff    	lea    -0x1046(%ebx),%eax
 804b25c:	89 04 24             	mov    %eax,(%esp)
 804b25f:	e8 8c e9 ff ff       	call   8049bf0 <wrtwarning>
 804b264:	e9 dc 05 00 00       	jmp    804b845 <ifree+0x6bf>
 804b269:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
 804b26d:	74 13                	je     804b282 <ifree+0xfc>
 804b26f:	8d 83 a2 ef ff ff    	lea    -0x105e(%ebx),%eax
 804b275:	89 04 24             	mov    %eax,(%esp)
 804b278:	e8 73 e9 ff ff       	call   8049bf0 <wrtwarning>
 804b27d:	e9 c3 05 00 00       	jmp    804b845 <ifree+0x6bf>
 804b282:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804b285:	25 ff 0f 00 00       	and    $0xfff,%eax
 804b28a:	85 c0                	test   %eax,%eax
 804b28c:	74 13                	je     804b2a1 <ifree+0x11b>
 804b28e:	8d 83 53 ef ff ff    	lea    -0x10ad(%ebx),%eax
 804b294:	89 04 24             	mov    %eax,(%esp)
 804b297:	e8 54 e9 ff ff       	call   8049bf0 <wrtwarning>
 804b29c:	e9 a4 05 00 00       	jmp    804b845 <ifree+0x6bf>
 804b2a1:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804b2a7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804b2aa:	c1 e2 02             	shl    $0x2,%edx
 804b2ad:	01 d0                	add    %edx,%eax
 804b2af:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
 804b2b5:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
 804b2bc:	eb 1c                	jmp    804b2da <ifree+0x154>
 804b2be:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804b2c4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804b2c7:	8b 55 d8             	mov    -0x28(%ebp),%edx
 804b2ca:	01 ca                	add    %ecx,%edx
 804b2cc:	c1 e2 02             	shl    $0x2,%edx
 804b2cf:	01 d0                	add    %edx,%eax
 804b2d1:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
 804b2d7:	ff 45 d8             	incl   -0x28(%ebp)
 804b2da:	8b 83 1c 02 00 00    	mov    0x21c(%ebx),%eax
 804b2e0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804b2e3:	8b 55 d8             	mov    -0x28(%ebp),%edx
 804b2e6:	01 ca                	add    %ecx,%edx
 804b2e8:	c1 e2 02             	shl    $0x2,%edx
 804b2eb:	01 d0                	add    %edx,%eax
 804b2ed:	8b 00                	mov    (%eax),%eax
 804b2ef:	83 f8 03             	cmp    $0x3,%eax
 804b2f2:	74 ca                	je     804b2be <ifree+0x138>
 804b2f4:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804b2f7:	c1 e0 0c             	shl    $0xc,%eax
 804b2fa:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804b2fd:	8b 83 54 02 00 00    	mov    0x254(%ebx),%eax
 804b303:	85 c0                	test   %eax,%eax
 804b305:	74 1a                	je     804b321 <ifree+0x19b>
 804b307:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b30a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b30e:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804b315:	00 
 804b316:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804b319:	89 04 24             	mov    %eax,(%esp)
 804b31c:	e8 a9 df ff ff       	call   80492ca <memset>
 804b321:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804b324:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b327:	01 d0                	add    %edx,%eax
 804b329:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804b32c:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b332:	85 c0                	test   %eax,%eax
 804b334:	75 12                	jne    804b348 <ifree+0x1c2>
 804b336:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
 804b33d:	e8 25 f5 ff ff       	call   804a867 <imalloc>
 804b342:	89 83 5c 02 00 00    	mov    %eax,0x25c(%ebx)
 804b348:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b34e:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804b351:	89 50 08             	mov    %edx,0x8(%eax)
 804b354:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b35a:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804b35d:	89 50 0c             	mov    %edx,0xc(%eax)
 804b360:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b366:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804b369:	89 50 10             	mov    %edx,0x10(%eax)
 804b36c:	8b 83 24 02 00 00    	mov    0x224(%ebx),%eax
 804b372:	85 c0                	test   %eax,%eax
 804b374:	75 41                	jne    804b3b7 <ifree+0x231>
 804b376:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b37c:	8b 93 24 02 00 00    	mov    0x224(%ebx),%edx
 804b382:	89 10                	mov    %edx,(%eax)
 804b384:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b38a:	8d 93 24 02 00 00    	lea    0x224(%ebx),%edx
 804b390:	89 50 04             	mov    %edx,0x4(%eax)
 804b393:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b399:	89 83 24 02 00 00    	mov    %eax,0x224(%ebx)
 804b39f:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b3a5:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804b3a8:	c7 83 5c 02 00 00 00 	movl   $0x0,0x25c(%ebx)
 804b3af:	00 00 00 
 804b3b2:	e9 a5 01 00 00       	jmp    804b55c <ifree+0x3d6>
 804b3b7:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804b3ba:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b3bd:	01 d0                	add    %edx,%eax
 804b3bf:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804b3c2:	8b 83 24 02 00 00    	mov    0x224(%ebx),%eax
 804b3c8:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804b3cb:	eb 08                	jmp    804b3d5 <ifree+0x24f>
 804b3cd:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b3d0:	8b 00                	mov    (%eax),%eax
 804b3d2:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804b3d5:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b3d8:	8b 40 0c             	mov    0xc(%eax),%eax
 804b3db:	39 45 e8             	cmp    %eax,-0x18(%ebp)
 804b3de:	76 09                	jbe    804b3e9 <ifree+0x263>
 804b3e0:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b3e3:	8b 00                	mov    (%eax),%eax
 804b3e5:	85 c0                	test   %eax,%eax
 804b3e7:	75 e4                	jne    804b3cd <ifree+0x247>
 804b3e9:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b3ec:	8b 40 08             	mov    0x8(%eax),%eax
 804b3ef:	39 45 d0             	cmp    %eax,-0x30(%ebp)
 804b3f2:	73 4f                	jae    804b443 <ifree+0x2bd>
 804b3f4:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b3fa:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804b3fd:	89 10                	mov    %edx,(%eax)
 804b3ff:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b405:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804b408:	8b 52 04             	mov    0x4(%edx),%edx
 804b40b:	89 50 04             	mov    %edx,0x4(%eax)
 804b40e:	8b 93 5c 02 00 00    	mov    0x25c(%ebx),%edx
 804b414:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b417:	89 50 04             	mov    %edx,0x4(%eax)
 804b41a:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b420:	8b 40 04             	mov    0x4(%eax),%eax
 804b423:	8b 93 5c 02 00 00    	mov    0x25c(%ebx),%edx
 804b429:	89 10                	mov    %edx,(%eax)
 804b42b:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b431:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804b434:	c7 83 5c 02 00 00 00 	movl   $0x0,0x25c(%ebx)
 804b43b:	00 00 00 
 804b43e:	e9 19 01 00 00       	jmp    804b55c <ifree+0x3d6>
 804b443:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b446:	8b 40 0c             	mov    0xc(%eax),%eax
 804b449:	39 45 e8             	cmp    %eax,-0x18(%ebp)
 804b44c:	0f 85 91 00 00 00    	jne    804b4e3 <ifree+0x35d>
 804b452:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b455:	8b 50 0c             	mov    0xc(%eax),%edx
 804b458:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b45b:	01 c2                	add    %eax,%edx
 804b45d:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b460:	89 50 0c             	mov    %edx,0xc(%eax)
 804b463:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b466:	8b 50 10             	mov    0x10(%eax),%edx
 804b469:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b46c:	01 c2                	add    %eax,%edx
 804b46e:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b471:	89 50 10             	mov    %edx,0x10(%eax)
 804b474:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b477:	8b 00                	mov    (%eax),%eax
 804b479:	85 c0                	test   %eax,%eax
 804b47b:	0f 84 da 00 00 00    	je     804b55b <ifree+0x3d5>
 804b481:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b484:	8b 50 0c             	mov    0xc(%eax),%edx
 804b487:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b48a:	8b 00                	mov    (%eax),%eax
 804b48c:	8b 40 08             	mov    0x8(%eax),%eax
 804b48f:	39 c2                	cmp    %eax,%edx
 804b491:	0f 85 c4 00 00 00    	jne    804b55b <ifree+0x3d5>
 804b497:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b49a:	8b 00                	mov    (%eax),%eax
 804b49c:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804b49f:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804b4a2:	8b 50 0c             	mov    0xc(%eax),%edx
 804b4a5:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b4a8:	89 50 0c             	mov    %edx,0xc(%eax)
 804b4ab:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b4ae:	8b 50 10             	mov    0x10(%eax),%edx
 804b4b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804b4b4:	8b 40 10             	mov    0x10(%eax),%eax
 804b4b7:	01 c2                	add    %eax,%edx
 804b4b9:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b4bc:	89 50 10             	mov    %edx,0x10(%eax)
 804b4bf:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804b4c2:	8b 10                	mov    (%eax),%edx
 804b4c4:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b4c7:	89 10                	mov    %edx,(%eax)
 804b4c9:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b4cc:	8b 00                	mov    (%eax),%eax
 804b4ce:	85 c0                	test   %eax,%eax
 804b4d0:	0f 84 85 00 00 00    	je     804b55b <ifree+0x3d5>
 804b4d6:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b4d9:	8b 00                	mov    (%eax),%eax
 804b4db:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804b4de:	89 50 04             	mov    %edx,0x4(%eax)
 804b4e1:	eb 79                	jmp    804b55c <ifree+0x3d6>
 804b4e3:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b4e6:	8b 40 08             	mov    0x8(%eax),%eax
 804b4e9:	39 45 d0             	cmp    %eax,-0x30(%ebp)
 804b4ec:	75 1c                	jne    804b50a <ifree+0x384>
 804b4ee:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b4f1:	8b 50 10             	mov    0x10(%eax),%edx
 804b4f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b4f7:	01 c2                	add    %eax,%edx
 804b4f9:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b4fc:	89 50 10             	mov    %edx,0x10(%eax)
 804b4ff:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b502:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804b505:	89 50 08             	mov    %edx,0x8(%eax)
 804b508:	eb 52                	jmp    804b55c <ifree+0x3d6>
 804b50a:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b50d:	8b 00                	mov    (%eax),%eax
 804b50f:	85 c0                	test   %eax,%eax
 804b511:	75 38                	jne    804b54b <ifree+0x3c5>
 804b513:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b519:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804b51f:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b525:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804b528:	89 50 04             	mov    %edx,0x4(%eax)
 804b52b:	8b 93 5c 02 00 00    	mov    0x25c(%ebx),%edx
 804b531:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b534:	89 10                	mov    %edx,(%eax)
 804b536:	8b 83 5c 02 00 00    	mov    0x25c(%ebx),%eax
 804b53c:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804b53f:	c7 83 5c 02 00 00 00 	movl   $0x0,0x25c(%ebx)
 804b546:	00 00 00 
 804b549:	eb 11                	jmp    804b55c <ifree+0x3d6>
 804b54b:	8d 83 d1 ef ff ff    	lea    -0x102f(%ebx),%eax
 804b551:	89 04 24             	mov    %eax,(%esp)
 804b554:	e8 c7 e5 ff ff       	call   8049b20 <wrterror>
 804b559:	eb 01                	jmp    804b55c <ifree+0x3d6>
 804b55b:	90                   	nop
 804b55c:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b55f:	8b 00                	mov    (%eax),%eax
 804b561:	85 c0                	test   %eax,%eax
 804b563:	0f 85 cd 00 00 00    	jne    804b636 <ifree+0x4b0>
 804b569:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b56c:	8b 50 10             	mov    0x10(%eax),%edx
 804b56f:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
 804b575:	39 c2                	cmp    %eax,%edx
 804b577:	0f 86 b9 00 00 00    	jbe    804b636 <ifree+0x4b0>
 804b57d:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b580:	8b 50 0c             	mov    0xc(%eax),%edx
 804b583:	8b 83 58 02 00 00    	mov    0x258(%ebx),%eax
 804b589:	39 c2                	cmp    %eax,%edx
 804b58b:	0f 85 a5 00 00 00    	jne    804b636 <ifree+0x4b0>
 804b591:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804b598:	e8 21 ce ff ff       	call   80483be <sbrk>
 804b59d:	89 c2                	mov    %eax,%edx
 804b59f:	8b 83 58 02 00 00    	mov    0x258(%ebx),%eax
 804b5a5:	39 c2                	cmp    %eax,%edx
 804b5a7:	0f 85 89 00 00 00    	jne    804b636 <ifree+0x4b0>
 804b5ad:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b5b0:	8b 50 08             	mov    0x8(%eax),%edx
 804b5b3:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
 804b5b9:	01 c2                	add    %eax,%edx
 804b5bb:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b5be:	89 50 0c             	mov    %edx,0xc(%eax)
 804b5c1:	8b 93 20 00 00 00    	mov    0x20(%ebx),%edx
 804b5c7:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b5ca:	89 50 10             	mov    %edx,0x10(%eax)
 804b5cd:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b5d0:	8b 40 0c             	mov    0xc(%eax),%eax
 804b5d3:	89 04 24             	mov    %eax,(%esp)
 804b5d6:	e8 ac ce ff ff       	call   8048487 <brk>
 804b5db:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b5de:	8b 40 0c             	mov    0xc(%eax),%eax
 804b5e1:	89 83 58 02 00 00    	mov    %eax,0x258(%ebx)
 804b5e7:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b5ea:	8b 40 0c             	mov    0xc(%eax),%eax
 804b5ed:	c1 e8 0c             	shr    $0xc,%eax
 804b5f0:	89 c2                	mov    %eax,%edx
 804b5f2:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
 804b5f8:	29 c2                	sub    %eax,%edx
 804b5fa:	89 d0                	mov    %edx,%eax
 804b5fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804b5ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804b602:	48                   	dec    %eax
 804b603:	89 83 18 02 00 00    	mov    %eax,0x218(%ebx)
 804b609:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804b60c:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804b60f:	eb 1a                	jmp    804b62b <ifree+0x4a5>
 804b611:	8b 8b 1c 02 00 00    	mov    0x21c(%ebx),%ecx
 804b617:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804b61a:	8d 50 01             	lea    0x1(%eax),%edx
 804b61d:	89 55 d8             	mov    %edx,-0x28(%ebp)
 804b620:	c1 e0 02             	shl    $0x2,%eax
 804b623:	01 c8                	add    %ecx,%eax
 804b625:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804b62b:	8b 83 18 02 00 00    	mov    0x218(%ebx),%eax
 804b631:	39 45 d8             	cmp    %eax,-0x28(%ebp)
 804b634:	76 db                	jbe    804b611 <ifree+0x48b>
 804b636:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 804b63a:	0f 84 05 02 00 00    	je     804b845 <ifree+0x6bf>
 804b640:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804b643:	89 04 24             	mov    %eax,(%esp)
 804b646:	e8 3b fb ff ff       	call   804b186 <ifree>
 804b64b:	e9 f5 01 00 00       	jmp    804b845 <ifree+0x6bf>
 804b650:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b653:	8b 55 08             	mov    0x8(%ebp),%edx
 804b656:	89 55 ec             	mov    %edx,-0x14(%ebp)
 804b659:	89 45 c8             	mov    %eax,-0x38(%ebp)
 804b65c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804b65f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 804b662:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b665:	25 ff 0f 00 00       	and    $0xfff,%eax
 804b66a:	89 c2                	mov    %eax,%edx
 804b66c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b66f:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804b673:	88 c1                	mov    %al,%cl
 804b675:	d3 ea                	shr    %cl,%edx
 804b677:	89 d0                	mov    %edx,%eax
 804b679:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804b67c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b67f:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804b683:	48                   	dec    %eax
 804b684:	89 c2                	mov    %eax,%edx
 804b686:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b689:	21 d0                	and    %edx,%eax
 804b68b:	85 c0                	test   %eax,%eax
 804b68d:	74 13                	je     804b6a2 <ifree+0x51c>
 804b68f:	8d 83 6e ef ff ff    	lea    -0x1092(%ebx),%eax
 804b695:	89 04 24             	mov    %eax,(%esp)
 804b698:	e8 53 e5 ff ff       	call   8049bf0 <wrtwarning>
 804b69d:	e9 a3 01 00 00       	jmp    804b845 <ifree+0x6bf>
 804b6a2:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804b6a5:	c1 e8 05             	shr    $0x5,%eax
 804b6a8:	89 c2                	mov    %eax,%edx
 804b6aa:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b6ad:	83 c2 04             	add    $0x4,%edx
 804b6b0:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804b6b3:	8b 55 c0             	mov    -0x40(%ebp),%edx
 804b6b6:	83 e2 1f             	and    $0x1f,%edx
 804b6b9:	be 01 00 00 00       	mov    $0x1,%esi
 804b6be:	88 d1                	mov    %dl,%cl
 804b6c0:	d3 e6                	shl    %cl,%esi
 804b6c2:	89 f2                	mov    %esi,%edx
 804b6c4:	21 d0                	and    %edx,%eax
 804b6c6:	85 c0                	test   %eax,%eax
 804b6c8:	74 13                	je     804b6dd <ifree+0x557>
 804b6ca:	8d 83 8a ef ff ff    	lea    -0x1076(%ebx),%eax
 804b6d0:	89 04 24             	mov    %eax,(%esp)
 804b6d3:	e8 18 e5 ff ff       	call   8049bf0 <wrtwarning>
 804b6d8:	e9 68 01 00 00       	jmp    804b845 <ifree+0x6bf>
 804b6dd:	8b 83 54 02 00 00    	mov    0x254(%ebx),%eax
 804b6e3:	85 c0                	test   %eax,%eax
 804b6e5:	74 1e                	je     804b705 <ifree+0x57f>
 804b6e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b6ea:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804b6ee:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b6f2:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804b6f9:	00 
 804b6fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b6fd:	89 04 24             	mov    %eax,(%esp)
 804b700:	e8 c5 db ff ff       	call   80492ca <memset>
 804b705:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804b708:	c1 e8 05             	shr    $0x5,%eax
 804b70b:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 804b70e:	8d 48 04             	lea    0x4(%eax),%ecx
 804b711:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804b714:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 804b717:	83 e1 1f             	and    $0x1f,%ecx
 804b71a:	be 01 00 00 00       	mov    $0x1,%esi
 804b71f:	d3 e6                	shl    %cl,%esi
 804b721:	89 f1                	mov    %esi,%ecx
 804b723:	09 d1                	or     %edx,%ecx
 804b725:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 804b728:	83 c0 04             	add    $0x4,%eax
 804b72b:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
 804b72e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b731:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804b735:	40                   	inc    %eax
 804b736:	0f b7 d0             	movzwl %ax,%edx
 804b739:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b73c:	66 89 50 0c          	mov    %dx,0xc(%eax)
 804b740:	8b 93 1c 02 00 00    	mov    0x21c(%ebx),%edx
 804b746:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b749:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804b74d:	c1 e0 02             	shl    $0x2,%eax
 804b750:	01 d0                	add    %edx,%eax
 804b752:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804b755:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b758:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804b75c:	83 f8 01             	cmp    $0x1,%eax
 804b75f:	75 5e                	jne    804b7bf <ifree+0x639>
 804b761:	8b 93 1c 02 00 00    	mov    0x21c(%ebx),%edx
 804b767:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b76a:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804b76e:	c1 e0 02             	shl    $0x2,%eax
 804b771:	01 d0                	add    %edx,%eax
 804b773:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804b776:	eb 08                	jmp    804b780 <ifree+0x5fa>
 804b778:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b77b:	8b 00                	mov    (%eax),%eax
 804b77d:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804b780:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b783:	8b 00                	mov    (%eax),%eax
 804b785:	85 c0                	test   %eax,%eax
 804b787:	74 1f                	je     804b7a8 <ifree+0x622>
 804b789:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b78c:	8b 00                	mov    (%eax),%eax
 804b78e:	8b 00                	mov    (%eax),%eax
 804b790:	85 c0                	test   %eax,%eax
 804b792:	74 14                	je     804b7a8 <ifree+0x622>
 804b794:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b797:	8b 00                	mov    (%eax),%eax
 804b799:	8b 00                	mov    (%eax),%eax
 804b79b:	8b 50 04             	mov    0x4(%eax),%edx
 804b79e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b7a1:	8b 40 04             	mov    0x4(%eax),%eax
 804b7a4:	39 c2                	cmp    %eax,%edx
 804b7a6:	72 d0                	jb     804b778 <ifree+0x5f2>
 804b7a8:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b7ab:	8b 10                	mov    (%eax),%edx
 804b7ad:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b7b0:	89 10                	mov    %edx,(%eax)
 804b7b2:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b7b5:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 804b7b8:	89 10                	mov    %edx,(%eax)
 804b7ba:	e9 86 00 00 00       	jmp    804b845 <ifree+0x6bf>
 804b7bf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b7c2:	0f b7 50 0c          	movzwl 0xc(%eax),%edx
 804b7c6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b7c9:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804b7cd:	39 c2                	cmp    %eax,%edx
 804b7cf:	75 74                	jne    804b845 <ifree+0x6bf>
 804b7d1:	eb 08                	jmp    804b7db <ifree+0x655>
 804b7d3:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b7d6:	8b 00                	mov    (%eax),%eax
 804b7d8:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804b7db:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b7de:	8b 00                	mov    (%eax),%eax
 804b7e0:	39 45 c4             	cmp    %eax,-0x3c(%ebp)
 804b7e3:	75 ee                	jne    804b7d3 <ifree+0x64d>
 804b7e5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b7e8:	8b 10                	mov    (%eax),%edx
 804b7ea:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b7ed:	89 10                	mov    %edx,(%eax)
 804b7ef:	8b 93 1c 02 00 00    	mov    0x21c(%ebx),%edx
 804b7f5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b7f8:	8b 40 04             	mov    0x4(%eax),%eax
 804b7fb:	c1 e8 0c             	shr    $0xc,%eax
 804b7fe:	89 c1                	mov    %eax,%ecx
 804b800:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
 804b806:	29 c1                	sub    %eax,%ecx
 804b808:	89 c8                	mov    %ecx,%eax
 804b80a:	c1 e0 02             	shl    $0x2,%eax
 804b80d:	01 d0                	add    %edx,%eax
 804b80f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
 804b815:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b818:	8b 40 04             	mov    0x4(%eax),%eax
 804b81b:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804b81e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b821:	3b 45 b8             	cmp    -0x48(%ebp),%eax
 804b824:	74 0b                	je     804b831 <ifree+0x6ab>
 804b826:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b829:	89 04 24             	mov    %eax,(%esp)
 804b82c:	e8 55 f9 ff ff       	call   804b186 <ifree>
 804b831:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804b834:	89 04 24             	mov    %eax,(%esp)
 804b837:	e8 4a f9 ff ff       	call   804b186 <ifree>
 804b83c:	90                   	nop
 804b83d:	eb 06                	jmp    804b845 <ifree+0x6bf>
 804b83f:	90                   	nop
 804b840:	eb 04                	jmp    804b846 <ifree+0x6c0>
 804b842:	90                   	nop
 804b843:	eb 01                	jmp    804b846 <ifree+0x6c0>
 804b845:	90                   	nop
 804b846:	83 c4 50             	add    $0x50,%esp
 804b849:	5b                   	pop    %ebx
 804b84a:	5e                   	pop    %esi
 804b84b:	5d                   	pop    %ebp
 804b84c:	c3                   	ret    

0804b84d <malloc>:
 804b84d:	55                   	push   %ebp
 804b84e:	89 e5                	mov    %esp,%ebp
 804b850:	56                   	push   %esi
 804b851:	53                   	push   %ebx
 804b852:	83 ec 10             	sub    $0x10,%esp
 804b855:	e8 be d8 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804b85a:	81 c3 a6 37 00 00    	add    $0x37a6,%ebx
 804b860:	8d 83 0d f0 ff ff    	lea    -0xff3(%ebx),%eax
 804b866:	89 83 60 02 00 00    	mov    %eax,0x260(%ebx)
 804b86c:	8b 83 10 02 00 00    	mov    0x210(%ebx),%eax
 804b872:	8d 50 01             	lea    0x1(%eax),%edx
 804b875:	89 93 10 02 00 00    	mov    %edx,0x210(%ebx)
 804b87b:	85 c0                	test   %eax,%eax
 804b87d:	74 22                	je     804b8a1 <malloc+0x54>
 804b87f:	8d 83 1b f0 ff ff    	lea    -0xfe5(%ebx),%eax
 804b885:	89 04 24             	mov    %eax,(%esp)
 804b888:	e8 63 e3 ff ff       	call   8049bf0 <wrtwarning>
 804b88d:	8b 83 10 02 00 00    	mov    0x210(%ebx),%eax
 804b893:	48                   	dec    %eax
 804b894:	89 83 10 02 00 00    	mov    %eax,0x210(%ebx)
 804b89a:	b8 00 00 00 00       	mov    $0x0,%eax
 804b89f:	eb 5e                	jmp    804b8ff <malloc+0xb2>
 804b8a1:	8b 83 0c 02 00 00    	mov    0x20c(%ebx),%eax
 804b8a7:	85 c0                	test   %eax,%eax
 804b8a9:	75 05                	jne    804b8b0 <malloc+0x63>
 804b8ab:	e8 97 e5 ff ff       	call   8049e47 <malloc_init>
 804b8b0:	8b 83 4c 02 00 00    	mov    0x24c(%ebx),%eax
 804b8b6:	85 c0                	test   %eax,%eax
 804b8b8:	74 0d                	je     804b8c7 <malloc+0x7a>
 804b8ba:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804b8be:	75 07                	jne    804b8c7 <malloc+0x7a>
 804b8c0:	be 00 00 00 00       	mov    $0x0,%esi
 804b8c5:	eb 0d                	jmp    804b8d4 <malloc+0x87>
 804b8c7:	8b 45 08             	mov    0x8(%ebp),%eax
 804b8ca:	89 04 24             	mov    %eax,(%esp)
 804b8cd:	e8 95 ef ff ff       	call   804a867 <imalloc>
 804b8d2:	89 c6                	mov    %eax,%esi
 804b8d4:	8b 83 10 02 00 00    	mov    0x210(%ebx),%eax
 804b8da:	48                   	dec    %eax
 804b8db:	89 83 10 02 00 00    	mov    %eax,0x210(%ebx)
 804b8e1:	8b 83 48 02 00 00    	mov    0x248(%ebx),%eax
 804b8e7:	85 c0                	test   %eax,%eax
 804b8e9:	74 12                	je     804b8fd <malloc+0xb0>
 804b8eb:	85 f6                	test   %esi,%esi
 804b8ed:	75 0e                	jne    804b8fd <malloc+0xb0>
 804b8ef:	8d 83 2c f0 ff ff    	lea    -0xfd4(%ebx),%eax
 804b8f5:	89 04 24             	mov    %eax,(%esp)
 804b8f8:	e8 23 e2 ff ff       	call   8049b20 <wrterror>
 804b8fd:	89 f0                	mov    %esi,%eax
 804b8ff:	83 c4 10             	add    $0x10,%esp
 804b902:	5b                   	pop    %ebx
 804b903:	5e                   	pop    %esi
 804b904:	5d                   	pop    %ebp
 804b905:	c3                   	ret    

0804b906 <free>:
 804b906:	55                   	push   %ebp
 804b907:	89 e5                	mov    %esp,%ebp
 804b909:	53                   	push   %ebx
 804b90a:	83 ec 14             	sub    $0x14,%esp
 804b90d:	e8 06 d8 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804b912:	81 c3 ee 36 00 00    	add    $0x36ee,%ebx
 804b918:	8d 83 3c f0 ff ff    	lea    -0xfc4(%ebx),%eax
 804b91e:	89 83 60 02 00 00    	mov    %eax,0x260(%ebx)
 804b924:	8b 83 10 02 00 00    	mov    0x210(%ebx),%eax
 804b92a:	8d 50 01             	lea    0x1(%eax),%edx
 804b92d:	89 93 10 02 00 00    	mov    %edx,0x210(%ebx)
 804b933:	85 c0                	test   %eax,%eax
 804b935:	74 1d                	je     804b954 <free+0x4e>
 804b937:	8d 83 1b f0 ff ff    	lea    -0xfe5(%ebx),%eax
 804b93d:	89 04 24             	mov    %eax,(%esp)
 804b940:	e8 ab e2 ff ff       	call   8049bf0 <wrtwarning>
 804b945:	8b 83 10 02 00 00    	mov    0x210(%ebx),%eax
 804b94b:	48                   	dec    %eax
 804b94c:	89 83 10 02 00 00    	mov    %eax,0x210(%ebx)
 804b952:	eb 19                	jmp    804b96d <free+0x67>
 804b954:	8b 45 08             	mov    0x8(%ebp),%eax
 804b957:	89 04 24             	mov    %eax,(%esp)
 804b95a:	e8 27 f8 ff ff       	call   804b186 <ifree>
 804b95f:	8b 83 10 02 00 00    	mov    0x210(%ebx),%eax
 804b965:	48                   	dec    %eax
 804b966:	89 83 10 02 00 00    	mov    %eax,0x210(%ebx)
 804b96c:	90                   	nop
 804b96d:	83 c4 14             	add    $0x14,%esp
 804b970:	5b                   	pop    %ebx
 804b971:	5d                   	pop    %ebp
 804b972:	c3                   	ret    

0804b973 <realloc>:
 804b973:	55                   	push   %ebp
 804b974:	89 e5                	mov    %esp,%ebp
 804b976:	56                   	push   %esi
 804b977:	53                   	push   %ebx
 804b978:	83 ec 10             	sub    $0x10,%esp
 804b97b:	e8 98 d7 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804b980:	81 c3 80 36 00 00    	add    $0x3680,%ebx
 804b986:	8d 83 48 f0 ff ff    	lea    -0xfb8(%ebx),%eax
 804b98c:	89 83 60 02 00 00    	mov    %eax,0x260(%ebx)
 804b992:	8b 83 10 02 00 00    	mov    0x210(%ebx),%eax
 804b998:	8d 50 01             	lea    0x1(%eax),%edx
 804b99b:	89 93 10 02 00 00    	mov    %edx,0x210(%ebx)
 804b9a1:	85 c0                	test   %eax,%eax
 804b9a3:	74 25                	je     804b9ca <realloc+0x57>
 804b9a5:	8d 83 1b f0 ff ff    	lea    -0xfe5(%ebx),%eax
 804b9ab:	89 04 24             	mov    %eax,(%esp)
 804b9ae:	e8 3d e2 ff ff       	call   8049bf0 <wrtwarning>
 804b9b3:	8b 83 10 02 00 00    	mov    0x210(%ebx),%eax
 804b9b9:	48                   	dec    %eax
 804b9ba:	89 83 10 02 00 00    	mov    %eax,0x210(%ebx)
 804b9c0:	b8 00 00 00 00       	mov    $0x0,%eax
 804b9c5:	e9 aa 00 00 00       	jmp    804ba74 <realloc+0x101>
 804b9ca:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804b9ce:	74 1f                	je     804b9ef <realloc+0x7c>
 804b9d0:	8b 83 0c 02 00 00    	mov    0x20c(%ebx),%eax
 804b9d6:	85 c0                	test   %eax,%eax
 804b9d8:	75 15                	jne    804b9ef <realloc+0x7c>
 804b9da:	8d 83 ec ef ff ff    	lea    -0x1014(%ebx),%eax
 804b9e0:	89 04 24             	mov    %eax,(%esp)
 804b9e3:	e8 08 e2 ff ff       	call   8049bf0 <wrtwarning>
 804b9e8:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 804b9ef:	8b 83 0c 02 00 00    	mov    0x20c(%ebx),%eax
 804b9f5:	85 c0                	test   %eax,%eax
 804b9f7:	75 05                	jne    804b9fe <realloc+0x8b>
 804b9f9:	e8 49 e4 ff ff       	call   8049e47 <malloc_init>
 804b9fe:	8b 83 4c 02 00 00    	mov    0x24c(%ebx),%eax
 804ba04:	85 c0                	test   %eax,%eax
 804ba06:	74 18                	je     804ba20 <realloc+0xad>
 804ba08:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804ba0c:	75 12                	jne    804ba20 <realloc+0xad>
 804ba0e:	8b 45 08             	mov    0x8(%ebp),%eax
 804ba11:	89 04 24             	mov    %eax,(%esp)
 804ba14:	e8 6d f7 ff ff       	call   804b186 <ifree>
 804ba19:	be 00 00 00 00       	mov    $0x0,%esi
 804ba1e:	eb 29                	jmp    804ba49 <realloc+0xd6>
 804ba20:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804ba24:	75 0f                	jne    804ba35 <realloc+0xc2>
 804ba26:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ba29:	89 04 24             	mov    %eax,(%esp)
 804ba2c:	e8 36 ee ff ff       	call   804a867 <imalloc>
 804ba31:	89 c6                	mov    %eax,%esi
 804ba33:	eb 14                	jmp    804ba49 <realloc+0xd6>
 804ba35:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ba38:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ba3c:	8b 45 08             	mov    0x8(%ebp),%eax
 804ba3f:	89 04 24             	mov    %eax,(%esp)
 804ba42:	e8 d6 ee ff ff       	call   804a91d <irealloc>
 804ba47:	89 c6                	mov    %eax,%esi
 804ba49:	8b 83 10 02 00 00    	mov    0x210(%ebx),%eax
 804ba4f:	48                   	dec    %eax
 804ba50:	89 83 10 02 00 00    	mov    %eax,0x210(%ebx)
 804ba56:	8b 83 48 02 00 00    	mov    0x248(%ebx),%eax
 804ba5c:	85 c0                	test   %eax,%eax
 804ba5e:	74 12                	je     804ba72 <realloc+0xff>
 804ba60:	85 f6                	test   %esi,%esi
 804ba62:	75 0e                	jne    804ba72 <realloc+0xff>
 804ba64:	8d 83 2c f0 ff ff    	lea    -0xfd4(%ebx),%eax
 804ba6a:	89 04 24             	mov    %eax,(%esp)
 804ba6d:	e8 ae e0 ff ff       	call   8049b20 <wrterror>
 804ba72:	89 f0                	mov    %esi,%eax
 804ba74:	83 c4 10             	add    $0x10,%esp
 804ba77:	5b                   	pop    %ebx
 804ba78:	5e                   	pop    %esi
 804ba79:	5d                   	pop    %ebp
 804ba7a:	c3                   	ret    

0804ba7b <calloc>:
 804ba7b:	55                   	push   %ebp
 804ba7c:	89 e5                	mov    %esp,%ebp
 804ba7e:	53                   	push   %ebx
 804ba7f:	83 ec 24             	sub    $0x24,%esp
 804ba82:	e8 91 d6 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804ba87:	81 c3 79 35 00 00    	add    $0x3579,%ebx
 804ba8d:	8b 45 08             	mov    0x8(%ebp),%eax
 804ba90:	0f af 45 0c          	imul   0xc(%ebp),%eax
 804ba94:	89 04 24             	mov    %eax,(%esp)
 804ba97:	e8 b1 fd ff ff       	call   804b84d <malloc>
 804ba9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804ba9f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804baa3:	75 07                	jne    804baac <calloc+0x31>
 804baa5:	b8 00 00 00 00       	mov    $0x0,%eax
 804baaa:	eb 21                	jmp    804bacd <calloc+0x52>
 804baac:	8b 45 08             	mov    0x8(%ebp),%eax
 804baaf:	0f af 45 0c          	imul   0xc(%ebp),%eax
 804bab3:	89 44 24 08          	mov    %eax,0x8(%esp)
 804bab7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804babe:	00 
 804babf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804bac2:	89 04 24             	mov    %eax,(%esp)
 804bac5:	e8 00 d8 ff ff       	call   80492ca <memset>
 804baca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804bacd:	83 c4 24             	add    $0x24,%esp
 804bad0:	5b                   	pop    %ebx
 804bad1:	5d                   	pop    %ebp
 804bad2:	c3                   	ret    

0804bad3 <printf>:
 804bad3:	55                   	push   %ebp
 804bad4:	89 e5                	mov    %esp,%ebp
 804bad6:	53                   	push   %ebx
 804bad7:	83 ec 24             	sub    $0x24,%esp
 804bada:	e8 31 d6 ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804badf:	05 21 35 00 00       	add    $0x3521,%eax
 804bae4:	8d 55 0c             	lea    0xc(%ebp),%edx
 804bae7:	89 55 f0             	mov    %edx,-0x10(%ebp)
 804baea:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804baed:	89 54 24 04          	mov    %edx,0x4(%esp)
 804baf1:	8b 55 08             	mov    0x8(%ebp),%edx
 804baf4:	89 14 24             	mov    %edx,(%esp)
 804baf7:	89 c3                	mov    %eax,%ebx
 804baf9:	e8 cd 00 00 00       	call   804bbcb <vprintf>
 804bafe:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804bb01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804bb04:	83 c4 24             	add    $0x24,%esp
 804bb07:	5b                   	pop    %ebx
 804bb08:	5d                   	pop    %ebp
 804bb09:	c3                   	ret    

0804bb0a <fprintf>:
 804bb0a:	55                   	push   %ebp
 804bb0b:	89 e5                	mov    %esp,%ebp
 804bb0d:	53                   	push   %ebx
 804bb0e:	83 ec 24             	sub    $0x24,%esp
 804bb11:	e8 fa d5 ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804bb16:	05 ea 34 00 00       	add    $0x34ea,%eax
 804bb1b:	8d 55 10             	lea    0x10(%ebp),%edx
 804bb1e:	89 55 f0             	mov    %edx,-0x10(%ebp)
 804bb21:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804bb24:	89 54 24 08          	mov    %edx,0x8(%esp)
 804bb28:	8b 55 0c             	mov    0xc(%ebp),%edx
 804bb2b:	89 54 24 04          	mov    %edx,0x4(%esp)
 804bb2f:	8b 55 08             	mov    0x8(%ebp),%edx
 804bb32:	89 14 24             	mov    %edx,(%esp)
 804bb35:	89 c3                	mov    %eax,%ebx
 804bb37:	e8 c6 00 00 00       	call   804bc02 <vfprintf>
 804bb3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804bb3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804bb42:	83 c4 24             	add    $0x24,%esp
 804bb45:	5b                   	pop    %ebx
 804bb46:	5d                   	pop    %ebp
 804bb47:	c3                   	ret    

0804bb48 <sprintf>:
 804bb48:	55                   	push   %ebp
 804bb49:	89 e5                	mov    %esp,%ebp
 804bb4b:	53                   	push   %ebx
 804bb4c:	83 ec 24             	sub    $0x24,%esp
 804bb4f:	e8 bc d5 ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804bb54:	05 ac 34 00 00       	add    $0x34ac,%eax
 804bb59:	8d 55 10             	lea    0x10(%ebp),%edx
 804bb5c:	89 55 f0             	mov    %edx,-0x10(%ebp)
 804bb5f:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804bb62:	89 54 24 08          	mov    %edx,0x8(%esp)
 804bb66:	8b 55 0c             	mov    0xc(%ebp),%edx
 804bb69:	89 54 24 04          	mov    %edx,0x4(%esp)
 804bb6d:	8b 55 08             	mov    0x8(%ebp),%edx
 804bb70:	89 14 24             	mov    %edx,(%esp)
 804bb73:	89 c3                	mov    %eax,%ebx
 804bb75:	e8 f4 00 00 00       	call   804bc6e <vsprintf>
 804bb7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804bb7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804bb80:	83 c4 24             	add    $0x24,%esp
 804bb83:	5b                   	pop    %ebx
 804bb84:	5d                   	pop    %ebp
 804bb85:	c3                   	ret    

0804bb86 <snprintf>:
 804bb86:	55                   	push   %ebp
 804bb87:	89 e5                	mov    %esp,%ebp
 804bb89:	53                   	push   %ebx
 804bb8a:	83 ec 24             	sub    $0x24,%esp
 804bb8d:	e8 7e d5 ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804bb92:	05 6e 34 00 00       	add    $0x346e,%eax
 804bb97:	8d 55 14             	lea    0x14(%ebp),%edx
 804bb9a:	89 55 f0             	mov    %edx,-0x10(%ebp)
 804bb9d:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804bba0:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804bba4:	8b 55 10             	mov    0x10(%ebp),%edx
 804bba7:	89 54 24 08          	mov    %edx,0x8(%esp)
 804bbab:	8b 55 0c             	mov    0xc(%ebp),%edx
 804bbae:	89 54 24 04          	mov    %edx,0x4(%esp)
 804bbb2:	8b 55 08             	mov    0x8(%ebp),%edx
 804bbb5:	89 14 24             	mov    %edx,(%esp)
 804bbb8:	89 c3                	mov    %eax,%ebx
 804bbba:	e8 8b 05 00 00       	call   804c14a <vsnprintf>
 804bbbf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804bbc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804bbc5:	83 c4 24             	add    $0x24,%esp
 804bbc8:	5b                   	pop    %ebx
 804bbc9:	5d                   	pop    %ebp
 804bbca:	c3                   	ret    

0804bbcb <vprintf>:
 804bbcb:	55                   	push   %ebp
 804bbcc:	89 e5                	mov    %esp,%ebp
 804bbce:	53                   	push   %ebx
 804bbcf:	83 ec 14             	sub    $0x14,%esp
 804bbd2:	e8 39 d5 ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804bbd7:	05 29 34 00 00       	add    $0x3429,%eax
 804bbdc:	8d 15 38 f0 04 08    	lea    0x804f038,%edx
 804bbe2:	8b 12                	mov    (%edx),%edx
 804bbe4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804bbe7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804bbeb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804bbee:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804bbf2:	89 14 24             	mov    %edx,(%esp)
 804bbf5:	89 c3                	mov    %eax,%ebx
 804bbf7:	e8 06 00 00 00       	call   804bc02 <vfprintf>
 804bbfc:	83 c4 14             	add    $0x14,%esp
 804bbff:	5b                   	pop    %ebx
 804bc00:	5d                   	pop    %ebp
 804bc01:	c3                   	ret    

0804bc02 <vfprintf>:
 804bc02:	55                   	push   %ebp
 804bc03:	89 e5                	mov    %esp,%ebp
 804bc05:	53                   	push   %ebx
 804bc06:	81 ec 24 04 00 00    	sub    $0x424,%esp
 804bc0c:	e8 07 d5 ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804bc11:	81 c3 ef 33 00 00    	add    $0x33ef,%ebx
 804bc17:	8b 45 10             	mov    0x10(%ebp),%eax
 804bc1a:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804bc1e:	8b 45 0c             	mov    0xc(%ebp),%eax
 804bc21:	89 44 24 08          	mov    %eax,0x8(%esp)
 804bc25:	c7 44 24 04 00 04 00 	movl   $0x400,0x4(%esp)
 804bc2c:	00 
 804bc2d:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
 804bc33:	89 04 24             	mov    %eax,(%esp)
 804bc36:	e8 0f 05 00 00       	call   804c14a <vsnprintf>
 804bc3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804bc3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804bc42:	7e 1e                	jle    804bc62 <vfprintf+0x60>
 804bc44:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804bc47:	8b 45 08             	mov    0x8(%ebp),%eax
 804bc4a:	8b 00                	mov    (%eax),%eax
 804bc4c:	89 54 24 08          	mov    %edx,0x8(%esp)
 804bc50:	8d 95 f4 fb ff ff    	lea    -0x40c(%ebp),%edx
 804bc56:	89 54 24 04          	mov    %edx,0x4(%esp)
 804bc5a:	89 04 24             	mov    %eax,(%esp)
 804bc5d:	e8 2f cd ff ff       	call   8048991 <write>
 804bc62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804bc65:	81 c4 24 04 00 00    	add    $0x424,%esp
 804bc6b:	5b                   	pop    %ebx
 804bc6c:	5d                   	pop    %ebp
 804bc6d:	c3                   	ret    

0804bc6e <vsprintf>:
 804bc6e:	55                   	push   %ebp
 804bc6f:	89 e5                	mov    %esp,%ebp
 804bc71:	53                   	push   %ebx
 804bc72:	83 ec 14             	sub    $0x14,%esp
 804bc75:	e8 96 d4 ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804bc7a:	05 86 33 00 00       	add    $0x3386,%eax
 804bc7f:	8b 55 10             	mov    0x10(%ebp),%edx
 804bc82:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804bc86:	8b 55 0c             	mov    0xc(%ebp),%edx
 804bc89:	89 54 24 08          	mov    %edx,0x8(%esp)
 804bc8d:	c7 44 24 04 ff ff ff 	movl   $0xffffffff,0x4(%esp)
 804bc94:	ff 
 804bc95:	8b 55 08             	mov    0x8(%ebp),%edx
 804bc98:	89 14 24             	mov    %edx,(%esp)
 804bc9b:	89 c3                	mov    %eax,%ebx
 804bc9d:	e8 a8 04 00 00       	call   804c14a <vsnprintf>
 804bca2:	83 c4 14             	add    $0x14,%esp
 804bca5:	5b                   	pop    %ebx
 804bca6:	5d                   	pop    %ebp
 804bca7:	c3                   	ret    

0804bca8 <fflush>:
 804bca8:	55                   	push   %ebp
 804bca9:	89 e5                	mov    %esp,%ebp
 804bcab:	e8 60 d4 ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804bcb0:	05 50 33 00 00       	add    $0x3350,%eax
 804bcb5:	b8 00 00 00 00       	mov    $0x0,%eax
 804bcba:	5d                   	pop    %ebp
 804bcbb:	c3                   	ret    

0804bcbc <__tolower>:
 804bcbc:	55                   	push   %ebp
 804bcbd:	89 e5                	mov    %esp,%ebp
 804bcbf:	83 ec 04             	sub    $0x4,%esp
 804bcc2:	e8 66 0a 00 00       	call   804c72d <__x86.get_pc_thunk.dx>
 804bcc7:	81 c2 39 33 00 00    	add    $0x3339,%edx
 804bccd:	8b 45 08             	mov    0x8(%ebp),%eax
 804bcd0:	88 45 fc             	mov    %al,-0x4(%ebp)
 804bcd3:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
 804bcd7:	0f b6 84 02 40 00 00 	movzbl 0x40(%edx,%eax,1),%eax
 804bcde:	00 
 804bcdf:	0f b6 c0             	movzbl %al,%eax
 804bce2:	83 e0 01             	and    $0x1,%eax
 804bce5:	85 c0                	test   %eax,%eax
 804bce7:	74 04                	je     804bced <__tolower+0x31>
 804bce9:	80 45 fc 20          	addb   $0x20,-0x4(%ebp)
 804bced:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
 804bcf1:	c9                   	leave  
 804bcf2:	c3                   	ret    

0804bcf3 <__toupper>:
 804bcf3:	55                   	push   %ebp
 804bcf4:	89 e5                	mov    %esp,%ebp
 804bcf6:	83 ec 04             	sub    $0x4,%esp
 804bcf9:	e8 2f 0a 00 00       	call   804c72d <__x86.get_pc_thunk.dx>
 804bcfe:	81 c2 02 33 00 00    	add    $0x3302,%edx
 804bd04:	8b 45 08             	mov    0x8(%ebp),%eax
 804bd07:	88 45 fc             	mov    %al,-0x4(%ebp)
 804bd0a:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
 804bd0e:	0f b6 84 02 40 00 00 	movzbl 0x40(%edx,%eax,1),%eax
 804bd15:	00 
 804bd16:	0f b6 c0             	movzbl %al,%eax
 804bd19:	83 e0 02             	and    $0x2,%eax
 804bd1c:	85 c0                	test   %eax,%eax
 804bd1e:	74 04                	je     804bd24 <__toupper+0x31>
 804bd20:	80 6d fc 20          	subb   $0x20,-0x4(%ebp)
 804bd24:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
 804bd28:	c9                   	leave  
 804bd29:	c3                   	ret    

0804bd2a <skip_atoi>:
 804bd2a:	55                   	push   %ebp
 804bd2b:	89 e5                	mov    %esp,%ebp
 804bd2d:	56                   	push   %esi
 804bd2e:	53                   	push   %ebx
 804bd2f:	83 ec 10             	sub    $0x10,%esp
 804bd32:	e8 dd d3 ff ff       	call   8049114 <__x86.get_pc_thunk.cx>
 804bd37:	81 c1 c9 32 00 00    	add    $0x32c9,%ecx
 804bd3d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804bd44:	eb 29                	jmp    804bd6f <skip_atoi+0x45>
 804bd46:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804bd49:	89 d0                	mov    %edx,%eax
 804bd4b:	c1 e0 02             	shl    $0x2,%eax
 804bd4e:	01 d0                	add    %edx,%eax
 804bd50:	01 c0                	add    %eax,%eax
 804bd52:	89 c6                	mov    %eax,%esi
 804bd54:	8b 45 08             	mov    0x8(%ebp),%eax
 804bd57:	8b 00                	mov    (%eax),%eax
 804bd59:	8d 58 01             	lea    0x1(%eax),%ebx
 804bd5c:	8b 55 08             	mov    0x8(%ebp),%edx
 804bd5f:	89 1a                	mov    %ebx,(%edx)
 804bd61:	0f b6 00             	movzbl (%eax),%eax
 804bd64:	0f be c0             	movsbl %al,%eax
 804bd67:	01 f0                	add    %esi,%eax
 804bd69:	83 e8 30             	sub    $0x30,%eax
 804bd6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804bd6f:	8b 45 08             	mov    0x8(%ebp),%eax
 804bd72:	8b 00                	mov    (%eax),%eax
 804bd74:	0f b6 00             	movzbl (%eax),%eax
 804bd77:	0f b6 c0             	movzbl %al,%eax
 804bd7a:	0f b6 84 01 40 00 00 	movzbl 0x40(%ecx,%eax,1),%eax
 804bd81:	00 
 804bd82:	0f b6 c0             	movzbl %al,%eax
 804bd85:	83 e0 04             	and    $0x4,%eax
 804bd88:	85 c0                	test   %eax,%eax
 804bd8a:	75 ba                	jne    804bd46 <skip_atoi+0x1c>
 804bd8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804bd8f:	83 c4 10             	add    $0x10,%esp
 804bd92:	5b                   	pop    %ebx
 804bd93:	5e                   	pop    %esi
 804bd94:	5d                   	pop    %ebp
 804bd95:	c3                   	ret    

0804bd96 <number>:
 804bd96:	55                   	push   %ebp
 804bd97:	89 e5                	mov    %esp,%ebp
 804bd99:	57                   	push   %edi
 804bd9a:	56                   	push   %esi
 804bd9b:	53                   	push   %ebx
 804bd9c:	81 ec dc 00 00 00    	sub    $0xdc,%esp
 804bda2:	e8 8a 09 00 00       	call   804c731 <__x86.get_pc_thunk.si>
 804bda7:	81 c6 59 32 00 00    	add    $0x3259,%esi
 804bdad:	8b 45 10             	mov    0x10(%ebp),%eax
 804bdb0:	89 85 30 ff ff ff    	mov    %eax,-0xd0(%ebp)
 804bdb6:	8b 45 14             	mov    0x14(%ebp),%eax
 804bdb9:	89 85 34 ff ff ff    	mov    %eax,-0xcc(%ebp)
 804bdbf:	8d 85 65 ff ff ff    	lea    -0x9b(%ebp),%eax
 804bdc5:	8d 96 58 f0 ff ff    	lea    -0xfa8(%esi),%edx
 804bdcb:	bb 25 00 00 00       	mov    $0x25,%ebx
 804bdd0:	89 c1                	mov    %eax,%ecx
 804bdd2:	83 e1 01             	and    $0x1,%ecx
 804bdd5:	85 c9                	test   %ecx,%ecx
 804bdd7:	74 0c                	je     804bde5 <number+0x4f>
 804bdd9:	0f b6 0a             	movzbl (%edx),%ecx
 804bddc:	88 08                	mov    %cl,(%eax)
 804bdde:	8d 40 01             	lea    0x1(%eax),%eax
 804bde1:	8d 52 01             	lea    0x1(%edx),%edx
 804bde4:	4b                   	dec    %ebx
 804bde5:	89 c1                	mov    %eax,%ecx
 804bde7:	83 e1 02             	and    $0x2,%ecx
 804bdea:	85 c9                	test   %ecx,%ecx
 804bdec:	74 0f                	je     804bdfd <number+0x67>
 804bdee:	0f b7 0a             	movzwl (%edx),%ecx
 804bdf1:	66 89 08             	mov    %cx,(%eax)
 804bdf4:	8d 40 02             	lea    0x2(%eax),%eax
 804bdf7:	8d 52 02             	lea    0x2(%edx),%edx
 804bdfa:	83 eb 02             	sub    $0x2,%ebx
 804bdfd:	89 df                	mov    %ebx,%edi
 804bdff:	83 e7 fc             	and    $0xfffffffc,%edi
 804be02:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%ebp)
 804be08:	b9 00 00 00 00       	mov    $0x0,%ecx
 804be0d:	8b 3c 0a             	mov    (%edx,%ecx,1),%edi
 804be10:	89 3c 08             	mov    %edi,(%eax,%ecx,1)
 804be13:	83 c1 04             	add    $0x4,%ecx
 804be16:	3b 8d 2c ff ff ff    	cmp    -0xd4(%ebp),%ecx
 804be1c:	72 ef                	jb     804be0d <number+0x77>
 804be1e:	01 c8                	add    %ecx,%eax
 804be20:	01 ca                	add    %ecx,%edx
 804be22:	b9 00 00 00 00       	mov    $0x0,%ecx
 804be27:	89 df                	mov    %ebx,%edi
 804be29:	83 e7 02             	and    $0x2,%edi
 804be2c:	85 ff                	test   %edi,%edi
 804be2e:	74 0b                	je     804be3b <number+0xa5>
 804be30:	0f b7 3c 0a          	movzwl (%edx,%ecx,1),%edi
 804be34:	66 89 3c 08          	mov    %di,(%eax,%ecx,1)
 804be38:	83 c1 02             	add    $0x2,%ecx
 804be3b:	83 e3 01             	and    $0x1,%ebx
 804be3e:	85 db                	test   %ebx,%ebx
 804be40:	74 07                	je     804be49 <number+0xb3>
 804be42:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
 804be46:	88 14 08             	mov    %dl,(%eax,%ecx,1)
 804be49:	8d 8d 40 ff ff ff    	lea    -0xc0(%ebp),%ecx
 804be4f:	8d 96 80 f0 ff ff    	lea    -0xf80(%esi),%edx
 804be55:	b8 25 00 00 00       	mov    $0x25,%eax
 804be5a:	83 e0 fc             	and    $0xfffffffc,%eax
 804be5d:	89 c7                	mov    %eax,%edi
 804be5f:	b8 00 00 00 00       	mov    $0x0,%eax
 804be64:	8b 9c 06 80 f0 ff ff 	mov    -0xf80(%esi,%eax,1),%ebx
 804be6b:	89 9c 05 40 ff ff ff 	mov    %ebx,-0xc0(%ebp,%eax,1)
 804be72:	83 c0 04             	add    $0x4,%eax
 804be75:	39 f8                	cmp    %edi,%eax
 804be77:	72 eb                	jb     804be64 <number+0xce>
 804be79:	01 c1                	add    %eax,%ecx
 804be7b:	01 c2                	add    %eax,%edx
 804be7d:	0f b6 02             	movzbl (%edx),%eax
 804be80:	88 01                	mov    %al,(%ecx)
 804be82:	8b 45 24             	mov    0x24(%ebp),%eax
 804be85:	83 e0 40             	and    $0x40,%eax
 804be88:	85 c0                	test   %eax,%eax
 804be8a:	74 08                	je     804be94 <number+0xfe>
 804be8c:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
 804be92:	eb 06                	jmp    804be9a <number+0x104>
 804be94:	8d 85 65 ff ff ff    	lea    -0x9b(%ebp),%eax
 804be9a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804be9d:	8b 45 24             	mov    0x24(%ebp),%eax
 804bea0:	83 e0 10             	and    $0x10,%eax
 804bea3:	85 c0                	test   %eax,%eax
 804bea5:	74 04                	je     804beab <number+0x115>
 804bea7:	83 65 24 fe          	andl   $0xfffffffe,0x24(%ebp)
 804beab:	83 7d 18 01          	cmpl   $0x1,0x18(%ebp)
 804beaf:	7e 06                	jle    804beb7 <number+0x121>
 804beb1:	83 7d 18 24          	cmpl   $0x24,0x18(%ebp)
 804beb5:	7e 08                	jle    804bebf <number+0x129>
 804beb7:	8b 45 08             	mov    0x8(%ebp),%eax
 804beba:	e9 80 02 00 00       	jmp    804c13f <number+0x3a9>
 804bebf:	8b 45 24             	mov    0x24(%ebp),%eax
 804bec2:	83 e0 01             	and    $0x1,%eax
 804bec5:	85 c0                	test   %eax,%eax
 804bec7:	74 04                	je     804becd <number+0x137>
 804bec9:	b0 30                	mov    $0x30,%al
 804becb:	eb 02                	jmp    804becf <number+0x139>
 804becd:	b0 20                	mov    $0x20,%al
 804becf:	88 45 d3             	mov    %al,-0x2d(%ebp)
 804bed2:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
 804bed6:	8b 45 24             	mov    0x24(%ebp),%eax
 804bed9:	83 e0 02             	and    $0x2,%eax
 804bedc:	85 c0                	test   %eax,%eax
 804bede:	74 49                	je     804bf29 <number+0x193>
 804bee0:	83 bd 34 ff ff ff 00 	cmpl   $0x0,-0xcc(%ebp)
 804bee7:	79 1c                	jns    804bf05 <number+0x16f>
 804bee9:	c6 45 e7 2d          	movb   $0x2d,-0x19(%ebp)
 804beed:	f7 9d 30 ff ff ff    	negl   -0xd0(%ebp)
 804bef3:	83 95 34 ff ff ff 00 	adcl   $0x0,-0xcc(%ebp)
 804befa:	f7 9d 34 ff ff ff    	negl   -0xcc(%ebp)
 804bf00:	ff 4d 1c             	decl   0x1c(%ebp)
 804bf03:	eb 24                	jmp    804bf29 <number+0x193>
 804bf05:	8b 45 24             	mov    0x24(%ebp),%eax
 804bf08:	83 e0 04             	and    $0x4,%eax
 804bf0b:	85 c0                	test   %eax,%eax
 804bf0d:	74 09                	je     804bf18 <number+0x182>
 804bf0f:	c6 45 e7 2b          	movb   $0x2b,-0x19(%ebp)
 804bf13:	ff 4d 1c             	decl   0x1c(%ebp)
 804bf16:	eb 11                	jmp    804bf29 <number+0x193>
 804bf18:	8b 45 24             	mov    0x24(%ebp),%eax
 804bf1b:	83 e0 08             	and    $0x8,%eax
 804bf1e:	85 c0                	test   %eax,%eax
 804bf20:	74 07                	je     804bf29 <number+0x193>
 804bf22:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
 804bf26:	ff 4d 1c             	decl   0x1c(%ebp)
 804bf29:	8b 45 24             	mov    0x24(%ebp),%eax
 804bf2c:	83 e0 20             	and    $0x20,%eax
 804bf2f:	85 c0                	test   %eax,%eax
 804bf31:	74 15                	je     804bf48 <number+0x1b2>
 804bf33:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
 804bf37:	75 06                	jne    804bf3f <number+0x1a9>
 804bf39:	83 6d 1c 02          	subl   $0x2,0x1c(%ebp)
 804bf3d:	eb 09                	jmp    804bf48 <number+0x1b2>
 804bf3f:	83 7d 18 08          	cmpl   $0x8,0x18(%ebp)
 804bf43:	75 03                	jne    804bf48 <number+0x1b2>
 804bf45:	ff 4d 1c             	decl   0x1c(%ebp)
 804bf48:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 804bf4f:	8b 85 34 ff ff ff    	mov    -0xcc(%ebp),%eax
 804bf55:	0b 85 30 ff ff ff    	or     -0xd0(%ebp),%eax
 804bf5b:	85 c0                	test   %eax,%eax
 804bf5d:	75 13                	jne    804bf72 <number+0x1dc>
 804bf5f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804bf62:	8d 50 01             	lea    0x1(%eax),%edx
 804bf65:	89 55 e0             	mov    %edx,-0x20(%ebp)
 804bf68:	c6 44 05 8a 30       	movb   $0x30,-0x76(%ebp,%eax,1)
 804bf6d:	e9 89 00 00 00       	jmp    804bffb <number+0x265>
 804bf72:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
 804bf78:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
 804bf7e:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804bf81:	89 55 dc             	mov    %edx,-0x24(%ebp)
 804bf84:	8b 45 18             	mov    0x18(%ebp),%eax
 804bf87:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804bf8a:	eb 65                	jmp    804bff1 <number+0x25b>
 804bf8c:	8b 7d e0             	mov    -0x20(%ebp),%edi
 804bf8f:	8d 47 01             	lea    0x1(%edi),%eax
 804bf92:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804bf95:	8b 4d cc             	mov    -0x34(%ebp),%ecx
 804bf98:	bb 00 00 00 00       	mov    $0x0,%ebx
 804bf9d:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804bfa0:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804bfa3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804bfa7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 804bfab:	89 04 24             	mov    %eax,(%esp)
 804bfae:	89 54 24 04          	mov    %edx,0x4(%esp)
 804bfb2:	89 f3                	mov    %esi,%ebx
 804bfb4:	e8 b9 0f 00 00       	call   804cf72 <__umoddi3>
 804bfb9:	89 c2                	mov    %eax,%edx
 804bfbb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804bfbe:	01 d0                	add    %edx,%eax
 804bfc0:	0f b6 00             	movzbl (%eax),%eax
 804bfc3:	88 44 3d 8a          	mov    %al,-0x76(%ebp,%edi,1)
 804bfc7:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804bfca:	ba 00 00 00 00       	mov    $0x0,%edx
 804bfcf:	89 44 24 08          	mov    %eax,0x8(%esp)
 804bfd3:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804bfd7:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804bfda:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804bfdd:	89 04 24             	mov    %eax,(%esp)
 804bfe0:	89 54 24 04          	mov    %edx,0x4(%esp)
 804bfe4:	89 f3                	mov    %esi,%ebx
 804bfe6:	e8 2d 0f 00 00       	call   804cf18 <__udivdi3>
 804bfeb:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804bfee:	89 55 dc             	mov    %edx,-0x24(%ebp)
 804bff1:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804bff4:	0b 45 d8             	or     -0x28(%ebp),%eax
 804bff7:	85 c0                	test   %eax,%eax
 804bff9:	75 91                	jne    804bf8c <number+0x1f6>
 804bffb:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804bffe:	3b 45 20             	cmp    0x20(%ebp),%eax
 804c001:	7e 06                	jle    804c009 <number+0x273>
 804c003:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804c006:	89 45 20             	mov    %eax,0x20(%ebp)
 804c009:	8b 45 20             	mov    0x20(%ebp),%eax
 804c00c:	29 45 1c             	sub    %eax,0x1c(%ebp)
 804c00f:	8b 45 24             	mov    0x24(%ebp),%eax
 804c012:	83 e0 11             	and    $0x11,%eax
 804c015:	85 c0                	test   %eax,%eax
 804c017:	75 20                	jne    804c039 <number+0x2a3>
 804c019:	eb 11                	jmp    804c02c <number+0x296>
 804c01b:	8b 45 08             	mov    0x8(%ebp),%eax
 804c01e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804c021:	77 06                	ja     804c029 <number+0x293>
 804c023:	8b 45 08             	mov    0x8(%ebp),%eax
 804c026:	c6 00 20             	movb   $0x20,(%eax)
 804c029:	ff 45 08             	incl   0x8(%ebp)
 804c02c:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804c02f:	8d 50 ff             	lea    -0x1(%eax),%edx
 804c032:	89 55 1c             	mov    %edx,0x1c(%ebp)
 804c035:	85 c0                	test   %eax,%eax
 804c037:	7f e2                	jg     804c01b <number+0x285>
 804c039:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 804c03d:	74 14                	je     804c053 <number+0x2bd>
 804c03f:	8b 45 08             	mov    0x8(%ebp),%eax
 804c042:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804c045:	77 09                	ja     804c050 <number+0x2ba>
 804c047:	8b 45 08             	mov    0x8(%ebp),%eax
 804c04a:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
 804c04e:	88 10                	mov    %dl,(%eax)
 804c050:	ff 45 08             	incl   0x8(%ebp)
 804c053:	8b 45 24             	mov    0x24(%ebp),%eax
 804c056:	83 e0 20             	and    $0x20,%eax
 804c059:	85 c0                	test   %eax,%eax
 804c05b:	74 47                	je     804c0a4 <number+0x30e>
 804c05d:	83 7d 18 08          	cmpl   $0x8,0x18(%ebp)
 804c061:	75 13                	jne    804c076 <number+0x2e0>
 804c063:	8b 45 08             	mov    0x8(%ebp),%eax
 804c066:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804c069:	77 06                	ja     804c071 <number+0x2db>
 804c06b:	8b 45 08             	mov    0x8(%ebp),%eax
 804c06e:	c6 00 30             	movb   $0x30,(%eax)
 804c071:	ff 45 08             	incl   0x8(%ebp)
 804c074:	eb 2e                	jmp    804c0a4 <number+0x30e>
 804c076:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
 804c07a:	75 28                	jne    804c0a4 <number+0x30e>
 804c07c:	8b 45 08             	mov    0x8(%ebp),%eax
 804c07f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804c082:	77 06                	ja     804c08a <number+0x2f4>
 804c084:	8b 45 08             	mov    0x8(%ebp),%eax
 804c087:	c6 00 30             	movb   $0x30,(%eax)
 804c08a:	ff 45 08             	incl   0x8(%ebp)
 804c08d:	8b 45 08             	mov    0x8(%ebp),%eax
 804c090:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804c093:	77 0c                	ja     804c0a1 <number+0x30b>
 804c095:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804c098:	0f b6 50 21          	movzbl 0x21(%eax),%edx
 804c09c:	8b 45 08             	mov    0x8(%ebp),%eax
 804c09f:	88 10                	mov    %dl,(%eax)
 804c0a1:	ff 45 08             	incl   0x8(%ebp)
 804c0a4:	8b 45 24             	mov    0x24(%ebp),%eax
 804c0a7:	83 e0 10             	and    $0x10,%eax
 804c0aa:	85 c0                	test   %eax,%eax
 804c0ac:	75 36                	jne    804c0e4 <number+0x34e>
 804c0ae:	eb 14                	jmp    804c0c4 <number+0x32e>
 804c0b0:	8b 45 08             	mov    0x8(%ebp),%eax
 804c0b3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804c0b6:	77 09                	ja     804c0c1 <number+0x32b>
 804c0b8:	8b 45 08             	mov    0x8(%ebp),%eax
 804c0bb:	0f b6 55 d3          	movzbl -0x2d(%ebp),%edx
 804c0bf:	88 10                	mov    %dl,(%eax)
 804c0c1:	ff 45 08             	incl   0x8(%ebp)
 804c0c4:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804c0c7:	8d 50 ff             	lea    -0x1(%eax),%edx
 804c0ca:	89 55 1c             	mov    %edx,0x1c(%ebp)
 804c0cd:	85 c0                	test   %eax,%eax
 804c0cf:	7f df                	jg     804c0b0 <number+0x31a>
 804c0d1:	eb 11                	jmp    804c0e4 <number+0x34e>
 804c0d3:	8b 45 08             	mov    0x8(%ebp),%eax
 804c0d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804c0d9:	77 06                	ja     804c0e1 <number+0x34b>
 804c0db:	8b 45 08             	mov    0x8(%ebp),%eax
 804c0de:	c6 00 30             	movb   $0x30,(%eax)
 804c0e1:	ff 45 08             	incl   0x8(%ebp)
 804c0e4:	8b 45 20             	mov    0x20(%ebp),%eax
 804c0e7:	8d 50 ff             	lea    -0x1(%eax),%edx
 804c0ea:	89 55 20             	mov    %edx,0x20(%ebp)
 804c0ed:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c0f0:	7f e1                	jg     804c0d3 <number+0x33d>
 804c0f2:	eb 1b                	jmp    804c10f <number+0x379>
 804c0f4:	8b 45 08             	mov    0x8(%ebp),%eax
 804c0f7:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804c0fa:	77 10                	ja     804c10c <number+0x376>
 804c0fc:	8d 55 8a             	lea    -0x76(%ebp),%edx
 804c0ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804c102:	01 d0                	add    %edx,%eax
 804c104:	0f b6 10             	movzbl (%eax),%edx
 804c107:	8b 45 08             	mov    0x8(%ebp),%eax
 804c10a:	88 10                	mov    %dl,(%eax)
 804c10c:	ff 45 08             	incl   0x8(%ebp)
 804c10f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804c112:	8d 50 ff             	lea    -0x1(%eax),%edx
 804c115:	89 55 e0             	mov    %edx,-0x20(%ebp)
 804c118:	85 c0                	test   %eax,%eax
 804c11a:	7f d8                	jg     804c0f4 <number+0x35e>
 804c11c:	eb 11                	jmp    804c12f <number+0x399>
 804c11e:	8b 45 08             	mov    0x8(%ebp),%eax
 804c121:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804c124:	77 06                	ja     804c12c <number+0x396>
 804c126:	8b 45 08             	mov    0x8(%ebp),%eax
 804c129:	c6 00 20             	movb   $0x20,(%eax)
 804c12c:	ff 45 08             	incl   0x8(%ebp)
 804c12f:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804c132:	8d 50 ff             	lea    -0x1(%eax),%edx
 804c135:	89 55 1c             	mov    %edx,0x1c(%ebp)
 804c138:	85 c0                	test   %eax,%eax
 804c13a:	7f e2                	jg     804c11e <number+0x388>
 804c13c:	8b 45 08             	mov    0x8(%ebp),%eax
 804c13f:	81 c4 dc 00 00 00    	add    $0xdc,%esp
 804c145:	5b                   	pop    %ebx
 804c146:	5e                   	pop    %esi
 804c147:	5f                   	pop    %edi
 804c148:	5d                   	pop    %ebp
 804c149:	c3                   	ret    

0804c14a <vsnprintf>:
 804c14a:	55                   	push   %ebp
 804c14b:	89 e5                	mov    %esp,%ebp
 804c14d:	53                   	push   %ebx
 804c14e:	83 ec 64             	sub    $0x64,%esp
 804c151:	e8 c2 cf ff ff       	call   8049118 <__x86.get_pc_thunk.bx>
 804c156:	81 c3 aa 2e 00 00    	add    $0x2eaa,%ebx
 804c15c:	8b 45 08             	mov    0x8(%ebp),%eax
 804c15f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804c162:	8b 45 0c             	mov    0xc(%ebp),%eax
 804c165:	8d 50 ff             	lea    -0x1(%eax),%edx
 804c168:	8b 45 08             	mov    0x8(%ebp),%eax
 804c16b:	01 d0                	add    %edx,%eax
 804c16d:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804c170:	8b 45 08             	mov    0x8(%ebp),%eax
 804c173:	48                   	dec    %eax
 804c174:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c177:	0f 86 76 05 00 00    	jbe    804c6f3 <.L138+0x116>
 804c17d:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
 804c184:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804c187:	8b 45 08             	mov    0x8(%ebp),%eax
 804c18a:	29 c2                	sub    %eax,%edx
 804c18c:	89 d0                	mov    %edx,%eax
 804c18e:	40                   	inc    %eax
 804c18f:	89 45 0c             	mov    %eax,0xc(%ebp)
 804c192:	e9 5c 05 00 00       	jmp    804c6f3 <.L138+0x116>
 804c197:	8b 45 10             	mov    0x10(%ebp),%eax
 804c19a:	0f b6 00             	movzbl (%eax),%eax
 804c19d:	3c 25                	cmp    $0x25,%al
 804c19f:	74 1b                	je     804c1bc <vsnprintf+0x72>
 804c1a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c1a4:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c1a7:	77 0b                	ja     804c1b4 <vsnprintf+0x6a>
 804c1a9:	8b 45 10             	mov    0x10(%ebp),%eax
 804c1ac:	0f b6 10             	movzbl (%eax),%edx
 804c1af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c1b2:	88 10                	mov    %dl,(%eax)
 804c1b4:	ff 45 e4             	incl   -0x1c(%ebp)
 804c1b7:	e9 30 05 00 00       	jmp    804c6ec <.L138+0x10f>
 804c1bc:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 804c1c3:	8b 45 10             	mov    0x10(%ebp),%eax
 804c1c6:	40                   	inc    %eax
 804c1c7:	89 45 10             	mov    %eax,0x10(%ebp)
 804c1ca:	8b 45 10             	mov    0x10(%ebp),%eax
 804c1cd:	0f b6 00             	movzbl (%eax),%eax
 804c1d0:	0f be c0             	movsbl %al,%eax
 804c1d3:	83 e8 20             	sub    $0x20,%eax
 804c1d6:	83 f8 10             	cmp    $0x10,%eax
 804c1d9:	77 2c                	ja     804c207 <.L70>
 804c1db:	c1 e0 02             	shl    $0x2,%eax
 804c1de:	8b 84 18 ac f0 ff ff 	mov    -0xf54(%eax,%ebx,1),%eax
 804c1e5:	01 d8                	add    %ebx,%eax
 804c1e7:	ff e0                	jmp    *%eax

0804c1e9 <.L75>:
 804c1e9:	83 4d d8 10          	orl    $0x10,-0x28(%ebp)
 804c1ed:	eb d4                	jmp    804c1c3 <vsnprintf+0x79>

0804c1ef <.L74>:
 804c1ef:	83 4d d8 04          	orl    $0x4,-0x28(%ebp)
 804c1f3:	eb ce                	jmp    804c1c3 <vsnprintf+0x79>

0804c1f5 <.L71>:
 804c1f5:	83 4d d8 08          	orl    $0x8,-0x28(%ebp)
 804c1f9:	eb c8                	jmp    804c1c3 <vsnprintf+0x79>

0804c1fb <.L73>:
 804c1fb:	83 4d d8 20          	orl    $0x20,-0x28(%ebp)
 804c1ff:	eb c2                	jmp    804c1c3 <vsnprintf+0x79>

0804c201 <.L76>:
 804c201:	83 4d d8 01          	orl    $0x1,-0x28(%ebp)
 804c205:	eb bc                	jmp    804c1c3 <vsnprintf+0x79>

0804c207 <.L70>:
 804c207:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
 804c20e:	8b 45 10             	mov    0x10(%ebp),%eax
 804c211:	0f b6 00             	movzbl (%eax),%eax
 804c214:	0f b6 c0             	movzbl %al,%eax
 804c217:	0f b6 84 03 40 00 00 	movzbl 0x40(%ebx,%eax,1),%eax
 804c21e:	00 
 804c21f:	0f b6 c0             	movzbl %al,%eax
 804c222:	83 e0 04             	and    $0x4,%eax
 804c225:	85 c0                	test   %eax,%eax
 804c227:	74 10                	je     804c239 <.L70+0x32>
 804c229:	8d 45 10             	lea    0x10(%ebp),%eax
 804c22c:	89 04 24             	mov    %eax,(%esp)
 804c22f:	e8 f6 fa ff ff       	call   804bd2a <skip_atoi>
 804c234:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804c237:	eb 2c                	jmp    804c265 <.L70+0x5e>
 804c239:	8b 45 10             	mov    0x10(%ebp),%eax
 804c23c:	0f b6 00             	movzbl (%eax),%eax
 804c23f:	3c 2a                	cmp    $0x2a,%al
 804c241:	75 22                	jne    804c265 <.L70+0x5e>
 804c243:	8b 45 10             	mov    0x10(%ebp),%eax
 804c246:	40                   	inc    %eax
 804c247:	89 45 10             	mov    %eax,0x10(%ebp)
 804c24a:	8b 45 14             	mov    0x14(%ebp),%eax
 804c24d:	8d 50 04             	lea    0x4(%eax),%edx
 804c250:	89 55 14             	mov    %edx,0x14(%ebp)
 804c253:	8b 00                	mov    (%eax),%eax
 804c255:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804c258:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 804c25c:	79 07                	jns    804c265 <.L70+0x5e>
 804c25e:	f7 5d d4             	negl   -0x2c(%ebp)
 804c261:	83 4d d8 10          	orl    $0x10,-0x28(%ebp)
 804c265:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
 804c26c:	8b 45 10             	mov    0x10(%ebp),%eax
 804c26f:	0f b6 00             	movzbl (%eax),%eax
 804c272:	3c 2e                	cmp    $0x2e,%al
 804c274:	75 5e                	jne    804c2d4 <.L70+0xcd>
 804c276:	8b 45 10             	mov    0x10(%ebp),%eax
 804c279:	40                   	inc    %eax
 804c27a:	89 45 10             	mov    %eax,0x10(%ebp)
 804c27d:	8b 45 10             	mov    0x10(%ebp),%eax
 804c280:	0f b6 00             	movzbl (%eax),%eax
 804c283:	0f b6 c0             	movzbl %al,%eax
 804c286:	0f b6 84 03 40 00 00 	movzbl 0x40(%ebx,%eax,1),%eax
 804c28d:	00 
 804c28e:	0f b6 c0             	movzbl %al,%eax
 804c291:	83 e0 04             	and    $0x4,%eax
 804c294:	85 c0                	test   %eax,%eax
 804c296:	74 10                	je     804c2a8 <.L70+0xa1>
 804c298:	8d 45 10             	lea    0x10(%ebp),%eax
 804c29b:	89 04 24             	mov    %eax,(%esp)
 804c29e:	e8 87 fa ff ff       	call   804bd2a <skip_atoi>
 804c2a3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804c2a6:	eb 1f                	jmp    804c2c7 <.L70+0xc0>
 804c2a8:	8b 45 10             	mov    0x10(%ebp),%eax
 804c2ab:	0f b6 00             	movzbl (%eax),%eax
 804c2ae:	3c 2a                	cmp    $0x2a,%al
 804c2b0:	75 15                	jne    804c2c7 <.L70+0xc0>
 804c2b2:	8b 45 10             	mov    0x10(%ebp),%eax
 804c2b5:	40                   	inc    %eax
 804c2b6:	89 45 10             	mov    %eax,0x10(%ebp)
 804c2b9:	8b 45 14             	mov    0x14(%ebp),%eax
 804c2bc:	8d 50 04             	lea    0x4(%eax),%edx
 804c2bf:	89 55 14             	mov    %edx,0x14(%ebp)
 804c2c2:	8b 00                	mov    (%eax),%eax
 804c2c4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804c2c7:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
 804c2cb:	79 07                	jns    804c2d4 <.L70+0xcd>
 804c2cd:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
 804c2d4:	c7 45 cc ff ff ff ff 	movl   $0xffffffff,-0x34(%ebp)
 804c2db:	8b 45 10             	mov    0x10(%ebp),%eax
 804c2de:	0f b6 00             	movzbl (%eax),%eax
 804c2e1:	3c 68                	cmp    $0x68,%al
 804c2e3:	74 1e                	je     804c303 <.L70+0xfc>
 804c2e5:	8b 45 10             	mov    0x10(%ebp),%eax
 804c2e8:	0f b6 00             	movzbl (%eax),%eax
 804c2eb:	3c 6c                	cmp    $0x6c,%al
 804c2ed:	74 14                	je     804c303 <.L70+0xfc>
 804c2ef:	8b 45 10             	mov    0x10(%ebp),%eax
 804c2f2:	0f b6 00             	movzbl (%eax),%eax
 804c2f5:	3c 4c                	cmp    $0x4c,%al
 804c2f7:	74 0a                	je     804c303 <.L70+0xfc>
 804c2f9:	8b 45 10             	mov    0x10(%ebp),%eax
 804c2fc:	0f b6 00             	movzbl (%eax),%eax
 804c2ff:	3c 5a                	cmp    $0x5a,%al
 804c301:	75 31                	jne    804c334 <.L70+0x12d>
 804c303:	8b 45 10             	mov    0x10(%ebp),%eax
 804c306:	0f b6 00             	movzbl (%eax),%eax
 804c309:	0f be c0             	movsbl %al,%eax
 804c30c:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804c30f:	8b 45 10             	mov    0x10(%ebp),%eax
 804c312:	40                   	inc    %eax
 804c313:	89 45 10             	mov    %eax,0x10(%ebp)
 804c316:	83 7d cc 6c          	cmpl   $0x6c,-0x34(%ebp)
 804c31a:	75 18                	jne    804c334 <.L70+0x12d>
 804c31c:	8b 45 10             	mov    0x10(%ebp),%eax
 804c31f:	0f b6 00             	movzbl (%eax),%eax
 804c322:	3c 6c                	cmp    $0x6c,%al
 804c324:	75 0e                	jne    804c334 <.L70+0x12d>
 804c326:	c7 45 cc 4c 00 00 00 	movl   $0x4c,-0x34(%ebp)
 804c32d:	8b 45 10             	mov    0x10(%ebp),%eax
 804c330:	40                   	inc    %eax
 804c331:	89 45 10             	mov    %eax,0x10(%ebp)
 804c334:	8b 45 10             	mov    0x10(%ebp),%eax
 804c337:	0f b6 00             	movzbl (%eax),%eax
 804c33a:	3c 71                	cmp    $0x71,%al
 804c33c:	75 0e                	jne    804c34c <.L70+0x145>
 804c33e:	c7 45 cc 4c 00 00 00 	movl   $0x4c,-0x34(%ebp)
 804c345:	8b 45 10             	mov    0x10(%ebp),%eax
 804c348:	40                   	inc    %eax
 804c349:	89 45 10             	mov    %eax,0x10(%ebp)
 804c34c:	c7 45 e8 0a 00 00 00 	movl   $0xa,-0x18(%ebp)
 804c353:	8b 45 10             	mov    0x10(%ebp),%eax
 804c356:	0f b6 00             	movzbl (%eax),%eax
 804c359:	0f be c0             	movsbl %al,%eax
 804c35c:	83 e8 25             	sub    $0x25,%eax
 804c35f:	83 f8 53             	cmp    $0x53,%eax
 804c362:	0f 87 33 02 00 00    	ja     804c59b <.L85>
 804c368:	c1 e0 02             	shl    $0x2,%eax
 804c36b:	8b 84 18 f0 f0 ff ff 	mov    -0xf10(%eax,%ebx,1),%eax
 804c372:	01 d8                	add    %ebx,%eax
 804c374:	ff e0                	jmp    *%eax

0804c376 <.L90>:
 804c376:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804c379:	83 e0 10             	and    $0x10,%eax
 804c37c:	85 c0                	test   %eax,%eax
 804c37e:	75 1c                	jne    804c39c <.L90+0x26>
 804c380:	eb 11                	jmp    804c393 <.L90+0x1d>
 804c382:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c385:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c388:	77 06                	ja     804c390 <.L90+0x1a>
 804c38a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c38d:	c6 00 20             	movb   $0x20,(%eax)
 804c390:	ff 45 e4             	incl   -0x1c(%ebp)
 804c393:	ff 4d d4             	decl   -0x2c(%ebp)
 804c396:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 804c39a:	7f e6                	jg     804c382 <.L90+0xc>
 804c39c:	8b 45 14             	mov    0x14(%ebp),%eax
 804c39f:	8d 50 04             	lea    0x4(%eax),%edx
 804c3a2:	89 55 14             	mov    %edx,0x14(%ebp)
 804c3a5:	8b 00                	mov    (%eax),%eax
 804c3a7:	88 45 cb             	mov    %al,-0x35(%ebp)
 804c3aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c3ad:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c3b0:	77 09                	ja     804c3bb <.L90+0x45>
 804c3b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c3b5:	0f b6 55 cb          	movzbl -0x35(%ebp),%edx
 804c3b9:	88 10                	mov    %dl,(%eax)
 804c3bb:	ff 45 e4             	incl   -0x1c(%ebp)
 804c3be:	eb 11                	jmp    804c3d1 <.L90+0x5b>
 804c3c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c3c3:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c3c6:	77 06                	ja     804c3ce <.L90+0x58>
 804c3c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c3cb:	c6 00 20             	movb   $0x20,(%eax)
 804c3ce:	ff 45 e4             	incl   -0x1c(%ebp)
 804c3d1:	ff 4d d4             	decl   -0x2c(%ebp)
 804c3d4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 804c3d8:	7f e6                	jg     804c3c0 <.L90+0x4a>
 804c3da:	e9 0d 03 00 00       	jmp    804c6ec <.L138+0x10f>

0804c3df <.L95>:
 804c3df:	8b 45 14             	mov    0x14(%ebp),%eax
 804c3e2:	8d 50 04             	lea    0x4(%eax),%edx
 804c3e5:	89 55 14             	mov    %edx,0x14(%ebp)
 804c3e8:	8b 00                	mov    (%eax),%eax
 804c3ea:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804c3ed:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 804c3f1:	75 09                	jne    804c3fc <.L95+0x1d>
 804c3f3:	8d 83 a5 f0 ff ff    	lea    -0xf5b(%ebx),%eax
 804c3f9:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804c3fc:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804c3ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c403:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804c406:	89 04 24             	mov    %eax,(%esp)
 804c409:	e8 f4 ce ff ff       	call   8049302 <strnlen>
 804c40e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 804c411:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804c414:	83 e0 10             	and    $0x10,%eax
 804c417:	85 c0                	test   %eax,%eax
 804c419:	75 21                	jne    804c43c <.L95+0x5d>
 804c41b:	eb 11                	jmp    804c42e <.L95+0x4f>
 804c41d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c420:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c423:	77 06                	ja     804c42b <.L95+0x4c>
 804c425:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c428:	c6 00 20             	movb   $0x20,(%eax)
 804c42b:	ff 45 e4             	incl   -0x1c(%ebp)
 804c42e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804c431:	8d 50 ff             	lea    -0x1(%eax),%edx
 804c434:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 804c437:	3b 45 c4             	cmp    -0x3c(%ebp),%eax
 804c43a:	7f e1                	jg     804c41d <.L95+0x3e>
 804c43c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804c443:	eb 1c                	jmp    804c461 <.L95+0x82>
 804c445:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c448:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c44b:	77 0b                	ja     804c458 <.L95+0x79>
 804c44d:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804c450:	0f b6 10             	movzbl (%eax),%edx
 804c453:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c456:	88 10                	mov    %dl,(%eax)
 804c458:	ff 45 e4             	incl   -0x1c(%ebp)
 804c45b:	ff 45 dc             	incl   -0x24(%ebp)
 804c45e:	ff 45 ec             	incl   -0x14(%ebp)
 804c461:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c464:	3b 45 c4             	cmp    -0x3c(%ebp),%eax
 804c467:	7c dc                	jl     804c445 <.L95+0x66>
 804c469:	eb 11                	jmp    804c47c <.L95+0x9d>
 804c46b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c46e:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c471:	77 06                	ja     804c479 <.L95+0x9a>
 804c473:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c476:	c6 00 20             	movb   $0x20,(%eax)
 804c479:	ff 45 e4             	incl   -0x1c(%ebp)
 804c47c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804c47f:	8d 50 ff             	lea    -0x1(%eax),%edx
 804c482:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 804c485:	3b 45 c4             	cmp    -0x3c(%ebp),%eax
 804c488:	7f e1                	jg     804c46b <.L95+0x8c>
 804c48a:	e9 5d 02 00 00       	jmp    804c6ec <.L138+0x10f>

0804c48f <.L94>:
 804c48f:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%ebp)
 804c493:	75 0b                	jne    804c4a0 <.L94+0x11>
 804c495:	c7 45 d4 08 00 00 00 	movl   $0x8,-0x2c(%ebp)
 804c49c:	83 4d d8 01          	orl    $0x1,-0x28(%ebp)
 804c4a0:	8b 45 14             	mov    0x14(%ebp),%eax
 804c4a3:	8d 50 04             	lea    0x4(%eax),%edx
 804c4a6:	89 55 14             	mov    %edx,0x14(%ebp)
 804c4a9:	8b 00                	mov    (%eax),%eax
 804c4ab:	ba 00 00 00 00       	mov    $0x0,%edx
 804c4b0:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 804c4b3:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
 804c4b7:	8b 4d d0             	mov    -0x30(%ebp),%ecx
 804c4ba:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 804c4be:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 804c4c1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 804c4c5:	c7 44 24 10 10 00 00 	movl   $0x10,0x10(%esp)
 804c4cc:	00 
 804c4cd:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c4d1:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804c4d5:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804c4d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c4dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c4df:	89 04 24             	mov    %eax,(%esp)
 804c4e2:	e8 af f8 ff ff       	call   804bd96 <number>
 804c4e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804c4ea:	e9 fd 01 00 00       	jmp    804c6ec <.L138+0x10f>

0804c4ef <.L92>:
 804c4ef:	83 7d cc 6c          	cmpl   $0x6c,-0x34(%ebp)
 804c4f3:	75 20                	jne    804c515 <.L92+0x26>
 804c4f5:	8b 45 14             	mov    0x14(%ebp),%eax
 804c4f8:	8d 50 04             	lea    0x4(%eax),%edx
 804c4fb:	89 55 14             	mov    %edx,0x14(%ebp)
 804c4fe:	8b 00                	mov    (%eax),%eax
 804c500:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804c503:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804c506:	8b 45 08             	mov    0x8(%ebp),%eax
 804c509:	29 c2                	sub    %eax,%edx
 804c50b:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804c50e:	89 10                	mov    %edx,(%eax)
 804c510:	e9 d7 01 00 00       	jmp    804c6ec <.L138+0x10f>
 804c515:	83 7d cc 5a          	cmpl   $0x5a,-0x34(%ebp)
 804c519:	75 24                	jne    804c53f <.L92+0x50>
 804c51b:	8b 45 14             	mov    0x14(%ebp),%eax
 804c51e:	8d 50 04             	lea    0x4(%eax),%edx
 804c521:	89 55 14             	mov    %edx,0x14(%ebp)
 804c524:	8b 00                	mov    (%eax),%eax
 804c526:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804c529:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804c52c:	8b 45 08             	mov    0x8(%ebp),%eax
 804c52f:	29 c2                	sub    %eax,%edx
 804c531:	89 d0                	mov    %edx,%eax
 804c533:	89 c2                	mov    %eax,%edx
 804c535:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804c538:	89 10                	mov    %edx,(%eax)
 804c53a:	e9 ad 01 00 00       	jmp    804c6ec <.L138+0x10f>
 804c53f:	8b 45 14             	mov    0x14(%ebp),%eax
 804c542:	8d 50 04             	lea    0x4(%eax),%edx
 804c545:	89 55 14             	mov    %edx,0x14(%ebp)
 804c548:	8b 00                	mov    (%eax),%eax
 804c54a:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804c54d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804c550:	8b 45 08             	mov    0x8(%ebp),%eax
 804c553:	29 c2                	sub    %eax,%edx
 804c555:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804c558:	89 10                	mov    %edx,(%eax)
 804c55a:	e9 8d 01 00 00       	jmp    804c6ec <.L138+0x10f>

0804c55f <.L86>:
 804c55f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c562:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c565:	77 06                	ja     804c56d <.L86+0xe>
 804c567:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c56a:	c6 00 25             	movb   $0x25,(%eax)
 804c56d:	ff 45 e4             	incl   -0x1c(%ebp)
 804c570:	e9 77 01 00 00       	jmp    804c6ec <.L138+0x10f>

0804c575 <.L93>:
 804c575:	c7 45 e8 08 00 00 00 	movl   $0x8,-0x18(%ebp)
 804c57c:	eb 60                	jmp    804c5de <.L138+0x1>

0804c57e <.L89>:
 804c57e:	83 4d d8 40          	orl    $0x40,-0x28(%ebp)

0804c582 <.L97>:
 804c582:	c7 45 e8 10 00 00 00 	movl   $0x10,-0x18(%ebp)
 804c589:	eb 53                	jmp    804c5de <.L138+0x1>

0804c58b <.L91>:
 804c58b:	83 4d d8 02          	orl    $0x2,-0x28(%ebp)
 804c58f:	eb 4c                	jmp    804c5dd <.L138>

0804c591 <.L88>:
 804c591:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804c596:	e9 8c 01 00 00       	jmp    804c727 <.L138+0x14a>

0804c59b <.L85>:
 804c59b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c59e:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c5a1:	77 06                	ja     804c5a9 <.L85+0xe>
 804c5a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c5a6:	c6 00 25             	movb   $0x25,(%eax)
 804c5a9:	ff 45 e4             	incl   -0x1c(%ebp)
 804c5ac:	8b 45 10             	mov    0x10(%ebp),%eax
 804c5af:	0f b6 00             	movzbl (%eax),%eax
 804c5b2:	84 c0                	test   %al,%al
 804c5b4:	74 1b                	je     804c5d1 <.L85+0x36>
 804c5b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c5b9:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c5bc:	77 0b                	ja     804c5c9 <.L85+0x2e>
 804c5be:	8b 45 10             	mov    0x10(%ebp),%eax
 804c5c1:	0f b6 10             	movzbl (%eax),%edx
 804c5c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c5c7:	88 10                	mov    %dl,(%eax)
 804c5c9:	ff 45 e4             	incl   -0x1c(%ebp)
 804c5cc:	e9 1b 01 00 00       	jmp    804c6ec <.L138+0x10f>
 804c5d1:	8b 45 10             	mov    0x10(%ebp),%eax
 804c5d4:	48                   	dec    %eax
 804c5d5:	89 45 10             	mov    %eax,0x10(%ebp)
 804c5d8:	e9 0f 01 00 00       	jmp    804c6ec <.L138+0x10f>

0804c5dd <.L138>:
 804c5dd:	90                   	nop
 804c5de:	83 7d cc 4c          	cmpl   $0x4c,-0x34(%ebp)
 804c5e2:	75 19                	jne    804c5fd <.L138+0x20>
 804c5e4:	8b 45 14             	mov    0x14(%ebp),%eax
 804c5e7:	8d 50 08             	lea    0x8(%eax),%edx
 804c5ea:	89 55 14             	mov    %edx,0x14(%ebp)
 804c5ed:	8b 50 04             	mov    0x4(%eax),%edx
 804c5f0:	8b 00                	mov    (%eax),%eax
 804c5f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804c5f5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804c5f8:	e9 b0 00 00 00       	jmp    804c6ad <.L138+0xd0>
 804c5fd:	83 7d cc 6c          	cmpl   $0x6c,-0x34(%ebp)
 804c601:	75 2f                	jne    804c632 <.L138+0x55>
 804c603:	8b 45 14             	mov    0x14(%ebp),%eax
 804c606:	8d 50 04             	lea    0x4(%eax),%edx
 804c609:	89 55 14             	mov    %edx,0x14(%ebp)
 804c60c:	8b 00                	mov    (%eax),%eax
 804c60e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804c611:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804c618:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804c61b:	83 e0 02             	and    $0x2,%eax
 804c61e:	85 c0                	test   %eax,%eax
 804c620:	0f 84 87 00 00 00    	je     804c6ad <.L138+0xd0>
 804c626:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804c629:	99                   	cltd   
 804c62a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804c62d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804c630:	eb 7b                	jmp    804c6ad <.L138+0xd0>
 804c632:	83 7d cc 5a          	cmpl   $0x5a,-0x34(%ebp)
 804c636:	75 17                	jne    804c64f <.L138+0x72>
 804c638:	8b 45 14             	mov    0x14(%ebp),%eax
 804c63b:	8d 50 04             	lea    0x4(%eax),%edx
 804c63e:	89 55 14             	mov    %edx,0x14(%ebp)
 804c641:	8b 00                	mov    (%eax),%eax
 804c643:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804c646:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804c64d:	eb 5e                	jmp    804c6ad <.L138+0xd0>
 804c64f:	83 7d cc 68          	cmpl   $0x68,-0x34(%ebp)
 804c653:	75 2f                	jne    804c684 <.L138+0xa7>
 804c655:	8b 45 14             	mov    0x14(%ebp),%eax
 804c658:	8d 50 04             	lea    0x4(%eax),%edx
 804c65b:	89 55 14             	mov    %edx,0x14(%ebp)
 804c65e:	8b 00                	mov    (%eax),%eax
 804c660:	0f b7 c0             	movzwl %ax,%eax
 804c663:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804c666:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804c66d:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804c670:	83 e0 02             	and    $0x2,%eax
 804c673:	85 c0                	test   %eax,%eax
 804c675:	74 36                	je     804c6ad <.L138+0xd0>
 804c677:	0f bf 45 f0          	movswl -0x10(%ebp),%eax
 804c67b:	99                   	cltd   
 804c67c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804c67f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804c682:	eb 29                	jmp    804c6ad <.L138+0xd0>
 804c684:	8b 45 14             	mov    0x14(%ebp),%eax
 804c687:	8d 50 04             	lea    0x4(%eax),%edx
 804c68a:	89 55 14             	mov    %edx,0x14(%ebp)
 804c68d:	8b 00                	mov    (%eax),%eax
 804c68f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804c692:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804c699:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804c69c:	83 e0 02             	and    $0x2,%eax
 804c69f:	85 c0                	test   %eax,%eax
 804c6a1:	74 0a                	je     804c6ad <.L138+0xd0>
 804c6a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804c6a6:	99                   	cltd   
 804c6a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804c6aa:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804c6ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804c6b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804c6b3:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 804c6b6:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
 804c6ba:	8b 4d d0             	mov    -0x30(%ebp),%ecx
 804c6bd:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 804c6c1:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 804c6c4:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 804c6c8:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 804c6cb:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 804c6cf:	89 44 24 08          	mov    %eax,0x8(%esp)
 804c6d3:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804c6d7:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804c6da:	89 44 24 04          	mov    %eax,0x4(%esp)
 804c6de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c6e1:	89 04 24             	mov    %eax,(%esp)
 804c6e4:	e8 ad f6 ff ff       	call   804bd96 <number>
 804c6e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804c6ec:	8b 45 10             	mov    0x10(%ebp),%eax
 804c6ef:	40                   	inc    %eax
 804c6f0:	89 45 10             	mov    %eax,0x10(%ebp)
 804c6f3:	8b 45 10             	mov    0x10(%ebp),%eax
 804c6f6:	0f b6 00             	movzbl (%eax),%eax
 804c6f9:	84 c0                	test   %al,%al
 804c6fb:	0f 85 96 fa ff ff    	jne    804c197 <vsnprintf+0x4d>
 804c701:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c704:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804c707:	77 08                	ja     804c711 <.L138+0x134>
 804c709:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804c70c:	c6 00 00             	movb   $0x0,(%eax)
 804c70f:	eb 0c                	jmp    804c71d <.L138+0x140>
 804c711:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804c715:	74 06                	je     804c71d <.L138+0x140>
 804c717:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804c71a:	c6 00 00             	movb   $0x0,(%eax)
 804c71d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804c720:	8b 45 08             	mov    0x8(%ebp),%eax
 804c723:	29 c2                	sub    %eax,%edx
 804c725:	89 d0                	mov    %edx,%eax
 804c727:	83 c4 64             	add    $0x64,%esp
 804c72a:	5b                   	pop    %ebx
 804c72b:	5d                   	pop    %ebp
 804c72c:	c3                   	ret    

0804c72d <__x86.get_pc_thunk.dx>:
 804c72d:	8b 14 24             	mov    (%esp),%edx
 804c730:	c3                   	ret    

0804c731 <__x86.get_pc_thunk.si>:
 804c731:	8b 34 24             	mov    (%esp),%esi
 804c734:	c3                   	ret    

0804c735 <shl>:
 804c735:	55                   	push   %ebp
 804c736:	89 e5                	mov    %esp,%ebp
 804c738:	57                   	push   %edi
 804c739:	56                   	push   %esi
 804c73a:	53                   	push   %ebx
 804c73b:	83 ec 04             	sub    $0x4,%esp
 804c73e:	e8 cd c9 ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804c743:	05 bd 28 00 00       	add    $0x28bd,%eax
 804c748:	8b 75 08             	mov    0x8(%ebp),%esi
 804c74b:	bb 00 00 00 00       	mov    $0x0,%ebx
 804c750:	eb 41                	jmp    804c793 <shl+0x5e>
 804c752:	89 d8                	mov    %ebx,%eax
 804c754:	c1 e0 02             	shl    $0x2,%eax
 804c757:	8d 3c 06             	lea    (%esi,%eax,1),%edi
 804c75a:	89 d8                	mov    %ebx,%eax
 804c75c:	c1 e0 02             	shl    $0x2,%eax
 804c75f:	01 f0                	add    %esi,%eax
 804c761:	8b 00                	mov    (%eax),%eax
 804c763:	0f b6 4d 10          	movzbl 0x10(%ebp),%ecx
 804c767:	d3 e0                	shl    %cl,%eax
 804c769:	0f b7 c0             	movzwl %ax,%eax
 804c76c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804c76f:	89 d8                	mov    %ebx,%eax
 804c771:	40                   	inc    %eax
 804c772:	c1 e0 02             	shl    $0x2,%eax
 804c775:	01 f0                	add    %esi,%eax
 804c777:	8b 00                	mov    (%eax),%eax
 804c779:	89 c1                	mov    %eax,%ecx
 804c77b:	8b 55 10             	mov    0x10(%ebp),%edx
 804c77e:	b8 10 00 00 00       	mov    $0x10,%eax
 804c783:	29 d0                	sub    %edx,%eax
 804c785:	89 ca                	mov    %ecx,%edx
 804c787:	88 c1                	mov    %al,%cl
 804c789:	d3 ea                	shr    %cl,%edx
 804c78b:	89 d0                	mov    %edx,%eax
 804c78d:	0b 45 f0             	or     -0x10(%ebp),%eax
 804c790:	89 07                	mov    %eax,(%edi)
 804c792:	43                   	inc    %ebx
 804c793:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 804c796:	7c ba                	jl     804c752 <shl+0x1d>
 804c798:	89 d8                	mov    %ebx,%eax
 804c79a:	c1 e0 02             	shl    $0x2,%eax
 804c79d:	8d 14 06             	lea    (%esi,%eax,1),%edx
 804c7a0:	89 d8                	mov    %ebx,%eax
 804c7a2:	c1 e0 02             	shl    $0x2,%eax
 804c7a5:	01 f0                	add    %esi,%eax
 804c7a7:	8b 00                	mov    (%eax),%eax
 804c7a9:	0f b6 4d 10          	movzbl 0x10(%ebp),%ecx
 804c7ad:	d3 e0                	shl    %cl,%eax
 804c7af:	0f b7 c0             	movzwl %ax,%eax
 804c7b2:	89 02                	mov    %eax,(%edx)
 804c7b4:	90                   	nop
 804c7b5:	83 c4 04             	add    $0x4,%esp
 804c7b8:	5b                   	pop    %ebx
 804c7b9:	5e                   	pop    %esi
 804c7ba:	5f                   	pop    %edi
 804c7bb:	5d                   	pop    %ebp
 804c7bc:	c3                   	ret    

0804c7bd <__qdivrem>:
 804c7bd:	55                   	push   %ebp
 804c7be:	89 e5                	mov    %esp,%ebp
 804c7c0:	57                   	push   %edi
 804c7c1:	56                   	push   %esi
 804c7c2:	53                   	push   %ebx
 804c7c3:	81 ec b8 00 00 00    	sub    $0xb8,%esp
 804c7c9:	e8 42 c9 ff ff       	call   8049110 <__x86.get_pc_thunk.ax>
 804c7ce:	05 32 28 00 00       	add    $0x2832,%eax
 804c7d3:	8b 55 08             	mov    0x8(%ebp),%edx
 804c7d6:	89 95 58 ff ff ff    	mov    %edx,-0xa8(%ebp)
 804c7dc:	8b 55 0c             	mov    0xc(%ebp),%edx
 804c7df:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
 804c7e5:	8b 55 10             	mov    0x10(%ebp),%edx
 804c7e8:	89 95 50 ff ff ff    	mov    %edx,-0xb0(%ebp)
 804c7ee:	8b 55 14             	mov    0x14(%ebp),%edx
 804c7f1:	89 95 54 ff ff ff    	mov    %edx,-0xac(%ebp)
 804c7f7:	8b 95 54 ff ff ff    	mov    -0xac(%ebp),%edx
 804c7fd:	0b 95 50 ff ff ff    	or     -0xb0(%ebp),%edx
 804c803:	85 d2                	test   %edx,%edx
 804c805:	75 40                	jne    804c847 <__qdivrem+0x8a>
 804c807:	8b b8 40 01 00 00    	mov    0x140(%eax),%edi
 804c80d:	b8 01 00 00 00       	mov    $0x1,%eax
 804c812:	ba 00 00 00 00       	mov    $0x0,%edx
 804c817:	f7 f7                	div    %edi
 804c819:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804c81c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804c81f:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804c822:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 804c826:	74 14                	je     804c83c <__qdivrem+0x7f>
 804c828:	8b 4d 18             	mov    0x18(%ebp),%ecx
 804c82b:	8b 85 58 ff ff ff    	mov    -0xa8(%ebp),%eax
 804c831:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
 804c837:	89 01                	mov    %eax,(%ecx)
 804c839:	89 51 04             	mov    %edx,0x4(%ecx)
 804c83c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804c83f:	8b 55 a8             	mov    -0x58(%ebp),%edx
 804c842:	e9 eb 05 00 00       	jmp    804ce32 <__qdivrem+0x675>
 804c847:	8b 85 58 ff ff ff    	mov    -0xa8(%ebp),%eax
 804c84d:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
 804c853:	3b 95 54 ff ff ff    	cmp    -0xac(%ebp),%edx
 804c859:	77 39                	ja     804c894 <__qdivrem+0xd7>
 804c85b:	3b 95 54 ff ff ff    	cmp    -0xac(%ebp),%edx
 804c861:	72 08                	jb     804c86b <__qdivrem+0xae>
 804c863:	3b 85 50 ff ff ff    	cmp    -0xb0(%ebp),%eax
 804c869:	73 29                	jae    804c894 <__qdivrem+0xd7>
 804c86b:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 804c86f:	74 14                	je     804c885 <__qdivrem+0xc8>
 804c871:	8b 4d 18             	mov    0x18(%ebp),%ecx
 804c874:	8b 85 58 ff ff ff    	mov    -0xa8(%ebp),%eax
 804c87a:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
 804c880:	89 01                	mov    %eax,(%ecx)
 804c882:	89 51 04             	mov    %edx,0x4(%ecx)
 804c885:	b8 00 00 00 00       	mov    $0x0,%eax
 804c88a:	ba 00 00 00 00       	mov    $0x0,%edx
 804c88f:	e9 9e 05 00 00       	jmp    804ce32 <__qdivrem+0x675>
 804c894:	8d 45 90             	lea    -0x70(%ebp),%eax
 804c897:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804c89a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
 804c8a0:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804c8a3:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
 804c8a9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 804c8ac:	8b 85 58 ff ff ff    	mov    -0xa8(%ebp),%eax
 804c8b2:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
 804c8b8:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804c8bb:	89 55 a8             	mov    %edx,-0x58(%ebp)
 804c8be:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c8c1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804c8c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c8ca:	83 c0 04             	add    $0x4,%eax
 804c8cd:	8b 55 a8             	mov    -0x58(%ebp),%edx
 804c8d0:	c1 ea 10             	shr    $0x10,%edx
 804c8d3:	89 10                	mov    %edx,(%eax)
 804c8d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c8d8:	8d 50 08             	lea    0x8(%eax),%edx
 804c8db:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804c8de:	0f b7 c0             	movzwl %ax,%eax
 804c8e1:	89 02                	mov    %eax,(%edx)
 804c8e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c8e6:	83 c0 0c             	add    $0xc,%eax
 804c8e9:	8b 55 a4             	mov    -0x5c(%ebp),%edx
 804c8ec:	c1 ea 10             	shr    $0x10,%edx
 804c8ef:	89 10                	mov    %edx,(%eax)
 804c8f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c8f4:	8d 50 10             	lea    0x10(%eax),%edx
 804c8f7:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804c8fa:	0f b7 c0             	movzwl %ax,%eax
 804c8fd:	89 02                	mov    %eax,(%edx)
 804c8ff:	8b 85 50 ff ff ff    	mov    -0xb0(%ebp),%eax
 804c905:	8b 95 54 ff ff ff    	mov    -0xac(%ebp),%edx
 804c90b:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804c90e:	89 55 a8             	mov    %edx,-0x58(%ebp)
 804c911:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804c914:	83 c0 04             	add    $0x4,%eax
 804c917:	8b 55 a8             	mov    -0x58(%ebp),%edx
 804c91a:	c1 ea 10             	shr    $0x10,%edx
 804c91d:	89 10                	mov    %edx,(%eax)
 804c91f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804c922:	8d 50 08             	lea    0x8(%eax),%edx
 804c925:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804c928:	0f b7 c0             	movzwl %ax,%eax
 804c92b:	89 02                	mov    %eax,(%edx)
 804c92d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804c930:	83 c0 0c             	add    $0xc,%eax
 804c933:	8b 55 a4             	mov    -0x5c(%ebp),%edx
 804c936:	c1 ea 10             	shr    $0x10,%edx
 804c939:	89 10                	mov    %edx,(%eax)
 804c93b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804c93e:	8d 50 10             	lea    0x10(%eax),%edx
 804c941:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804c944:	0f b7 c0             	movzwl %ax,%eax
 804c947:	89 02                	mov    %eax,(%edx)
 804c949:	c7 45 d4 04 00 00 00 	movl   $0x4,-0x2c(%ebp)
 804c950:	e9 fc 00 00 00       	jmp    804ca51 <__qdivrem+0x294>
 804c955:	ff 4d d4             	decl   -0x2c(%ebp)
 804c958:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
 804c95c:	0f 85 eb 00 00 00    	jne    804ca4d <__qdivrem+0x290>
 804c962:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804c965:	8b 40 08             	mov    0x8(%eax),%eax
 804c968:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804c96b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c96e:	83 c0 04             	add    $0x4,%eax
 804c971:	8b 00                	mov    (%eax),%eax
 804c973:	ba 00 00 00 00       	mov    $0x0,%edx
 804c978:	f7 75 dc             	divl   -0x24(%ebp)
 804c97b:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804c97e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c981:	83 c0 04             	add    $0x4,%eax
 804c984:	8b 00                	mov    (%eax),%eax
 804c986:	ba 00 00 00 00       	mov    $0x0,%edx
 804c98b:	f7 75 dc             	divl   -0x24(%ebp)
 804c98e:	89 d0                	mov    %edx,%eax
 804c990:	c1 e0 10             	shl    $0x10,%eax
 804c993:	89 c2                	mov    %eax,%edx
 804c995:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c998:	83 c0 08             	add    $0x8,%eax
 804c99b:	8b 00                	mov    (%eax),%eax
 804c99d:	09 d0                	or     %edx,%eax
 804c99f:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804c9a2:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804c9a5:	ba 00 00 00 00       	mov    $0x0,%edx
 804c9aa:	f7 75 dc             	divl   -0x24(%ebp)
 804c9ad:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804c9b0:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804c9b3:	ba 00 00 00 00       	mov    $0x0,%edx
 804c9b8:	f7 75 dc             	divl   -0x24(%ebp)
 804c9bb:	89 d0                	mov    %edx,%eax
 804c9bd:	c1 e0 10             	shl    $0x10,%eax
 804c9c0:	89 c2                	mov    %eax,%edx
 804c9c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c9c5:	83 c0 0c             	add    $0xc,%eax
 804c9c8:	8b 00                	mov    (%eax),%eax
 804c9ca:	09 d0                	or     %edx,%eax
 804c9cc:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804c9cf:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804c9d2:	ba 00 00 00 00       	mov    $0x0,%edx
 804c9d7:	f7 75 dc             	divl   -0x24(%ebp)
 804c9da:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804c9dd:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804c9e0:	ba 00 00 00 00       	mov    $0x0,%edx
 804c9e5:	f7 75 dc             	divl   -0x24(%ebp)
 804c9e8:	89 d0                	mov    %edx,%eax
 804c9ea:	c1 e0 10             	shl    $0x10,%eax
 804c9ed:	89 c2                	mov    %eax,%edx
 804c9ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804c9f2:	83 c0 10             	add    $0x10,%eax
 804c9f5:	8b 00                	mov    (%eax),%eax
 804c9f7:	09 d0                	or     %edx,%eax
 804c9f9:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804c9fc:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804c9ff:	ba 00 00 00 00       	mov    $0x0,%edx
 804ca04:	f7 75 dc             	divl   -0x24(%ebp)
 804ca07:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804ca0a:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 804ca0e:	74 1a                	je     804ca2a <__qdivrem+0x26d>
 804ca10:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804ca13:	ba 00 00 00 00       	mov    $0x0,%edx
 804ca18:	f7 75 dc             	divl   -0x24(%ebp)
 804ca1b:	89 d0                	mov    %edx,%eax
 804ca1d:	ba 00 00 00 00       	mov    $0x0,%edx
 804ca22:	8b 4d 18             	mov    0x18(%ebp),%ecx
 804ca25:	89 01                	mov    %eax,(%ecx)
 804ca27:	89 51 04             	mov    %edx,0x4(%ecx)
 804ca2a:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804ca2d:	c1 e0 10             	shl    $0x10,%eax
 804ca30:	0b 45 b8             	or     -0x48(%ebp),%eax
 804ca33:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804ca36:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804ca39:	c1 e0 10             	shl    $0x10,%eax
 804ca3c:	0b 45 b0             	or     -0x50(%ebp),%eax
 804ca3f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804ca42:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804ca45:	8b 55 a8             	mov    -0x58(%ebp),%edx
 804ca48:	e9 e5 03 00 00       	jmp    804ce32 <__qdivrem+0x675>
 804ca4d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 804ca51:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ca54:	83 c0 04             	add    $0x4,%eax
 804ca57:	8b 00                	mov    (%eax),%eax
 804ca59:	85 c0                	test   %eax,%eax
 804ca5b:	0f 84 f4 fe ff ff    	je     804c955 <__qdivrem+0x198>
 804ca61:	b8 04 00 00 00       	mov    $0x4,%eax
 804ca66:	2b 45 d4             	sub    -0x2c(%ebp),%eax
 804ca69:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804ca6c:	eb 07                	jmp    804ca75 <__qdivrem+0x2b8>
 804ca6e:	ff 4d d8             	decl   -0x28(%ebp)
 804ca71:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
 804ca75:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804ca78:	83 c0 04             	add    $0x4,%eax
 804ca7b:	8b 00                	mov    (%eax),%eax
 804ca7d:	85 c0                	test   %eax,%eax
 804ca7f:	74 ed                	je     804ca6e <__qdivrem+0x2b1>
 804ca81:	b8 04 00 00 00       	mov    $0x4,%eax
 804ca86:	2b 45 d8             	sub    -0x28(%ebp),%eax
 804ca89:	89 45 c8             	mov    %eax,-0x38(%ebp)
 804ca8c:	eb 15                	jmp    804caa3 <__qdivrem+0x2e6>
 804ca8e:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804ca91:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804ca98:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804ca9b:	01 d0                	add    %edx,%eax
 804ca9d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804caa3:	ff 4d c8             	decl   -0x38(%ebp)
 804caa6:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
 804caaa:	79 e2                	jns    804ca8e <__qdivrem+0x2d1>
 804caac:	b8 04 00 00 00       	mov    $0x4,%eax
 804cab1:	2b 45 d8             	sub    -0x28(%ebp),%eax
 804cab4:	c1 e0 02             	shl    $0x2,%eax
 804cab7:	01 45 c4             	add    %eax,-0x3c(%ebp)
 804caba:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
 804cac1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804cac4:	8b 40 04             	mov    0x4(%eax),%eax
 804cac7:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804caca:	eb 06                	jmp    804cad2 <__qdivrem+0x315>
 804cacc:	ff 45 d0             	incl   -0x30(%ebp)
 804cacf:	d1 65 dc             	shll   -0x24(%ebp)
 804cad2:	81 7d dc ff 7f 00 00 	cmpl   $0x7fff,-0x24(%ebp)
 804cad9:	76 f1                	jbe    804cacc <__qdivrem+0x30f>
 804cadb:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
 804cadf:	7e 3d                	jle    804cb1e <__qdivrem+0x361>
 804cae1:	8b 55 d8             	mov    -0x28(%ebp),%edx
 804cae4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804cae7:	01 c2                	add    %eax,%edx
 804cae9:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804caec:	89 44 24 08          	mov    %eax,0x8(%esp)
 804caf0:	89 54 24 04          	mov    %edx,0x4(%esp)
 804caf4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804caf7:	89 04 24             	mov    %eax,(%esp)
 804cafa:	e8 36 fc ff ff       	call   804c735 <shl>
 804caff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804cb02:	8d 48 ff             	lea    -0x1(%eax),%ecx
 804cb05:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804cb08:	8d 50 04             	lea    0x4(%eax),%edx
 804cb0b:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804cb0e:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cb12:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804cb16:	89 14 24             	mov    %edx,(%esp)
 804cb19:	e8 17 fc ff ff       	call   804c735 <shl>
 804cb1e:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
 804cb25:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804cb28:	8b 58 04             	mov    0x4(%eax),%ebx
 804cb2b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804cb2e:	8b 40 08             	mov    0x8(%eax),%eax
 804cb31:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
 804cb37:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804cb3a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cb41:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cb44:	01 d0                	add    %edx,%eax
 804cb46:	8b 38                	mov    (%eax),%edi
 804cb48:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804cb4b:	40                   	inc    %eax
 804cb4c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cb53:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cb56:	01 d0                	add    %edx,%eax
 804cb58:	8b 30                	mov    (%eax),%esi
 804cb5a:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804cb5d:	83 c0 02             	add    $0x2,%eax
 804cb60:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cb67:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cb6a:	01 d0                	add    %edx,%eax
 804cb6c:	8b 00                	mov    (%eax),%eax
 804cb6e:	89 c1                	mov    %eax,%ecx
 804cb70:	39 df                	cmp    %ebx,%edi
 804cb72:	75 0c                	jne    804cb80 <__qdivrem+0x3c3>
 804cb74:	c7 45 e4 00 00 01 00 	movl   $0x10000,-0x1c(%ebp)
 804cb7b:	89 75 e0             	mov    %esi,-0x20(%ebp)
 804cb7e:	eb 26                	jmp    804cba6 <__qdivrem+0x3e9>
 804cb80:	89 f8                	mov    %edi,%eax
 804cb82:	c1 e0 10             	shl    $0x10,%eax
 804cb85:	09 f0                	or     %esi,%eax
 804cb87:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804cb8a:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804cb8d:	ba 00 00 00 00       	mov    $0x0,%edx
 804cb92:	f7 f3                	div    %ebx
 804cb94:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804cb97:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804cb9a:	ba 00 00 00 00       	mov    $0x0,%edx
 804cb9f:	f7 f3                	div    %ebx
 804cba1:	89 55 e0             	mov    %edx,-0x20(%ebp)
 804cba4:	eb 0f                	jmp    804cbb5 <__qdivrem+0x3f8>
 804cba6:	ff 4d e4             	decl   -0x1c(%ebp)
 804cba9:	01 5d e0             	add    %ebx,-0x20(%ebp)
 804cbac:	81 7d e0 ff ff 00 00 	cmpl   $0xffff,-0x20(%ebp)
 804cbb3:	77 1a                	ja     804cbcf <__qdivrem+0x412>
 804cbb5:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
 804cbbb:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
 804cbbf:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804cbc2:	c1 e2 10             	shl    $0x10,%edx
 804cbc5:	89 cf                	mov    %ecx,%edi
 804cbc7:	09 fa                	or     %edi,%edx
 804cbc9:	39 d0                	cmp    %edx,%eax
 804cbcb:	77 d9                	ja     804cba6 <__qdivrem+0x3e9>
 804cbcd:	eb 01                	jmp    804cbd0 <__qdivrem+0x413>
 804cbcf:	90                   	nop
 804cbd0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 804cbd7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804cbda:	89 45 c8             	mov    %eax,-0x38(%ebp)
 804cbdd:	eb 64                	jmp    804cc43 <__qdivrem+0x486>
 804cbdf:	8b 55 c8             	mov    -0x38(%ebp),%edx
 804cbe2:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804cbe5:	01 d0                	add    %edx,%eax
 804cbe7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cbee:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cbf1:	01 d0                	add    %edx,%eax
 804cbf3:	8b 10                	mov    (%eax),%edx
 804cbf5:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804cbf8:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 804cbff:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804cc02:	01 c8                	add    %ecx,%eax
 804cc04:	8b 00                	mov    (%eax),%eax
 804cc06:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
 804cc0a:	29 c2                	sub    %eax,%edx
 804cc0c:	89 d0                	mov    %edx,%eax
 804cc0e:	2b 45 dc             	sub    -0x24(%ebp),%eax
 804cc11:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804cc14:	8b 55 c8             	mov    -0x38(%ebp),%edx
 804cc17:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804cc1a:	01 d0                	add    %edx,%eax
 804cc1c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cc23:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cc26:	01 c2                	add    %eax,%edx
 804cc28:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804cc2b:	0f b7 c0             	movzwl %ax,%eax
 804cc2e:	89 02                	mov    %eax,(%edx)
 804cc30:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804cc33:	c1 e8 10             	shr    $0x10,%eax
 804cc36:	f7 d8                	neg    %eax
 804cc38:	25 ff ff 00 00       	and    $0xffff,%eax
 804cc3d:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804cc40:	ff 4d c8             	decl   -0x38(%ebp)
 804cc43:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
 804cc47:	7f 96                	jg     804cbdf <__qdivrem+0x422>
 804cc49:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804cc4c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cc53:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cc56:	01 d0                	add    %edx,%eax
 804cc58:	8b 00                	mov    (%eax),%eax
 804cc5a:	2b 45 dc             	sub    -0x24(%ebp),%eax
 804cc5d:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804cc60:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804cc63:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cc6a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cc6d:	01 c2                	add    %eax,%edx
 804cc6f:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804cc72:	0f b7 c0             	movzwl %ax,%eax
 804cc75:	89 02                	mov    %eax,(%edx)
 804cc77:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804cc7a:	c1 e8 10             	shr    $0x10,%eax
 804cc7d:	85 c0                	test   %eax,%eax
 804cc7f:	0f 84 91 00 00 00    	je     804cd16 <__qdivrem+0x559>
 804cc85:	ff 4d e4             	decl   -0x1c(%ebp)
 804cc88:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 804cc8f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804cc92:	89 45 c8             	mov    %eax,-0x38(%ebp)
 804cc95:	eb 4f                	jmp    804cce6 <__qdivrem+0x529>
 804cc97:	8b 55 c8             	mov    -0x38(%ebp),%edx
 804cc9a:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804cc9d:	01 d0                	add    %edx,%eax
 804cc9f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cca6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cca9:	01 d0                	add    %edx,%eax
 804ccab:	8b 10                	mov    (%eax),%edx
 804ccad:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804ccb0:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 804ccb7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ccba:	01 c8                	add    %ecx,%eax
 804ccbc:	8b 00                	mov    (%eax),%eax
 804ccbe:	01 d0                	add    %edx,%eax
 804ccc0:	01 45 dc             	add    %eax,-0x24(%ebp)
 804ccc3:	8b 55 c8             	mov    -0x38(%ebp),%edx
 804ccc6:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804ccc9:	01 d0                	add    %edx,%eax
 804cccb:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804ccd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804ccd5:	01 c2                	add    %eax,%edx
 804ccd7:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804ccda:	0f b7 c0             	movzwl %ax,%eax
 804ccdd:	89 02                	mov    %eax,(%edx)
 804ccdf:	c1 6d dc 10          	shrl   $0x10,-0x24(%ebp)
 804cce3:	ff 4d c8             	decl   -0x38(%ebp)
 804cce6:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
 804ccea:	7f ab                	jg     804cc97 <__qdivrem+0x4da>
 804ccec:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804ccef:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804ccf6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804ccf9:	01 c2                	add    %eax,%edx
 804ccfb:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804ccfe:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 804cd05:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cd08:	01 c8                	add    %ecx,%eax
 804cd0a:	8b 08                	mov    (%eax),%ecx
 804cd0c:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804cd0f:	01 c8                	add    %ecx,%eax
 804cd11:	0f b7 c0             	movzwl %ax,%eax
 804cd14:	89 02                	mov    %eax,(%edx)
 804cd16:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804cd19:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cd20:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804cd23:	01 c2                	add    %eax,%edx
 804cd25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804cd28:	89 02                	mov    %eax,(%edx)
 804cd2a:	ff 45 cc             	incl   -0x34(%ebp)
 804cd2d:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804cd30:	3b 45 d8             	cmp    -0x28(%ebp),%eax
 804cd33:	0f 8e fe fd ff ff    	jle    804cb37 <__qdivrem+0x37a>
 804cd39:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 804cd3d:	0f 84 bd 00 00 00    	je     804ce00 <__qdivrem+0x643>
 804cd43:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
 804cd47:	0f 84 85 00 00 00    	je     804cdd2 <__qdivrem+0x615>
 804cd4d:	8b 55 d8             	mov    -0x28(%ebp),%edx
 804cd50:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804cd53:	01 d0                	add    %edx,%eax
 804cd55:	89 45 c8             	mov    %eax,-0x38(%ebp)
 804cd58:	eb 5b                	jmp    804cdb5 <__qdivrem+0x5f8>
 804cd5a:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804cd5d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cd64:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cd67:	01 c2                	add    %eax,%edx
 804cd69:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804cd6c:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 804cd73:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cd76:	01 c8                	add    %ecx,%eax
 804cd78:	8b 18                	mov    (%eax),%ebx
 804cd7a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804cd7d:	89 de                	mov    %ebx,%esi
 804cd7f:	88 c1                	mov    %al,%cl
 804cd81:	d3 ee                	shr    %cl,%esi
 804cd83:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804cd86:	05 ff ff ff 3f       	add    $0x3fffffff,%eax
 804cd8b:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 804cd92:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cd95:	01 c8                	add    %ecx,%eax
 804cd97:	8b 18                	mov    (%eax),%ebx
 804cd99:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804cd9c:	b9 10 00 00 00       	mov    $0x10,%ecx
 804cda1:	29 c1                	sub    %eax,%ecx
 804cda3:	89 c8                	mov    %ecx,%eax
 804cda5:	88 c1                	mov    %al,%cl
 804cda7:	d3 e3                	shl    %cl,%ebx
 804cda9:	89 d8                	mov    %ebx,%eax
 804cdab:	0f b7 c0             	movzwl %ax,%eax
 804cdae:	09 f0                	or     %esi,%eax
 804cdb0:	89 02                	mov    %eax,(%edx)
 804cdb2:	ff 4d c8             	decl   -0x38(%ebp)
 804cdb5:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804cdb8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
 804cdbb:	7f 9d                	jg     804cd5a <__qdivrem+0x59d>
 804cdbd:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804cdc0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804cdc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804cdca:	01 d0                	add    %edx,%eax
 804cdcc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804cdd2:	8b 45 94             	mov    -0x6c(%ebp),%eax
 804cdd5:	c1 e0 10             	shl    $0x10,%eax
 804cdd8:	89 c2                	mov    %eax,%edx
 804cdda:	8b 45 98             	mov    -0x68(%ebp),%eax
 804cddd:	09 d0                	or     %edx,%eax
 804cddf:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804cde2:	8b 45 9c             	mov    -0x64(%ebp),%eax
 804cde5:	c1 e0 10             	shl    $0x10,%eax
 804cde8:	89 c2                	mov    %eax,%edx
 804cdea:	8b 45 a0             	mov    -0x60(%ebp),%eax
 804cded:	09 d0                	or     %edx,%eax
 804cdef:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804cdf2:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804cdf5:	8b 55 a8             	mov    -0x58(%ebp),%edx
 804cdf8:	8b 4d 18             	mov    0x18(%ebp),%ecx
 804cdfb:	89 01                	mov    %eax,(%ecx)
 804cdfd:	89 51 04             	mov    %edx,0x4(%ecx)
 804ce00:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
 804ce06:	c1 e0 10             	shl    $0x10,%eax
 804ce09:	89 c2                	mov    %eax,%edx
 804ce0b:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
 804ce11:	09 d0                	or     %edx,%eax
 804ce13:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804ce16:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
 804ce1c:	c1 e0 10             	shl    $0x10,%eax
 804ce1f:	89 c2                	mov    %eax,%edx
 804ce21:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
 804ce27:	09 d0                	or     %edx,%eax
 804ce29:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804ce2c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804ce2f:	8b 55 a8             	mov    -0x58(%ebp),%edx
 804ce32:	81 c4 b8 00 00 00    	add    $0xb8,%esp
 804ce38:	5b                   	pop    %ebx
 804ce39:	5e                   	pop    %esi
 804ce3a:	5f                   	pop    %edi
 804ce3b:	5d                   	pop    %ebp
 804ce3c:	c3                   	ret    

0804ce3d <__divdi3>:
 804ce3d:	55                   	push   %ebp
 804ce3e:	89 e5                	mov    %esp,%ebp
 804ce40:	53                   	push   %ebx
 804ce41:	83 ec 54             	sub    $0x54,%esp
 804ce44:	e8 cb c2 ff ff       	call   8049114 <__x86.get_pc_thunk.cx>
 804ce49:	81 c1 b7 21 00 00    	add    $0x21b7,%ecx
 804ce4f:	8b 45 08             	mov    0x8(%ebp),%eax
 804ce52:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804ce55:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ce58:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804ce5b:	8b 45 10             	mov    0x10(%ebp),%eax
 804ce5e:	89 45 c8             	mov    %eax,-0x38(%ebp)
 804ce61:	8b 45 14             	mov    0x14(%ebp),%eax
 804ce64:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804ce67:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 804ce6b:	79 1c                	jns    804ce89 <__divdi3+0x4c>
 804ce6d:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804ce70:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804ce73:	f7 d8                	neg    %eax
 804ce75:	83 d2 00             	adc    $0x0,%edx
 804ce78:	f7 da                	neg    %edx
 804ce7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804ce7d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804ce80:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
 804ce87:	eb 13                	jmp    804ce9c <__divdi3+0x5f>
 804ce89:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804ce8c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804ce8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804ce92:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804ce95:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 804ce9c:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
 804cea0:	79 19                	jns    804cebb <__divdi3+0x7e>
 804cea2:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804cea5:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804cea8:	f7 d8                	neg    %eax
 804ceaa:	83 d2 00             	adc    $0x0,%edx
 804cead:	f7 da                	neg    %edx
 804ceaf:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804ceb2:	89 55 ec             	mov    %edx,-0x14(%ebp)
 804ceb5:	83 75 e4 01          	xorl   $0x1,-0x1c(%ebp)
 804ceb9:	eb 0c                	jmp    804cec7 <__divdi3+0x8a>
 804cebb:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804cebe:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804cec1:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804cec4:	89 55 ec             	mov    %edx,-0x14(%ebp)
 804cec7:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
 804cece:	00 
 804cecf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ced2:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804ced5:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ced9:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804cedd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804cee0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804cee3:	89 04 24             	mov    %eax,(%esp)
 804cee6:	89 54 24 04          	mov    %edx,0x4(%esp)
 804ceea:	89 cb                	mov    %ecx,%ebx
 804ceec:	e8 cc f8 ff ff       	call   804c7bd <__qdivrem>
 804cef1:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804cef4:	89 55 dc             	mov    %edx,-0x24(%ebp)
 804cef7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804cefb:	74 0f                	je     804cf0c <__divdi3+0xcf>
 804cefd:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804cf00:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804cf03:	f7 d8                	neg    %eax
 804cf05:	83 d2 00             	adc    $0x0,%edx
 804cf08:	f7 da                	neg    %edx
 804cf0a:	eb 06                	jmp    804cf12 <__divdi3+0xd5>
 804cf0c:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804cf0f:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804cf12:	83 c4 54             	add    $0x54,%esp
 804cf15:	5b                   	pop    %ebx
 804cf16:	5d                   	pop    %ebp
 804cf17:	c3                   	ret    

0804cf18 <__udivdi3>:
 804cf18:	55                   	push   %ebp
 804cf19:	89 e5                	mov    %esp,%ebp
 804cf1b:	53                   	push   %ebx
 804cf1c:	83 ec 34             	sub    $0x34,%esp
 804cf1f:	e8 f0 c1 ff ff       	call   8049114 <__x86.get_pc_thunk.cx>
 804cf24:	81 c1 dc 20 00 00    	add    $0x20dc,%ecx
 804cf2a:	8b 45 08             	mov    0x8(%ebp),%eax
 804cf2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804cf30:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cf33:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804cf36:	8b 45 10             	mov    0x10(%ebp),%eax
 804cf39:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804cf3c:	8b 45 14             	mov    0x14(%ebp),%eax
 804cf3f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804cf42:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
 804cf49:	00 
 804cf4a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804cf4d:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804cf50:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cf54:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804cf58:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804cf5b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804cf5e:	89 04 24             	mov    %eax,(%esp)
 804cf61:	89 54 24 04          	mov    %edx,0x4(%esp)
 804cf65:	89 cb                	mov    %ecx,%ebx
 804cf67:	e8 51 f8 ff ff       	call   804c7bd <__qdivrem>
 804cf6c:	83 c4 34             	add    $0x34,%esp
 804cf6f:	5b                   	pop    %ebx
 804cf70:	5d                   	pop    %ebp
 804cf71:	c3                   	ret    

0804cf72 <__umoddi3>:
 804cf72:	55                   	push   %ebp
 804cf73:	89 e5                	mov    %esp,%ebp
 804cf75:	53                   	push   %ebx
 804cf76:	83 ec 44             	sub    $0x44,%esp
 804cf79:	e8 96 c1 ff ff       	call   8049114 <__x86.get_pc_thunk.cx>
 804cf7e:	81 c1 82 20 00 00    	add    $0x2082,%ecx
 804cf84:	8b 45 08             	mov    0x8(%ebp),%eax
 804cf87:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804cf8a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804cf8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804cf90:	8b 45 10             	mov    0x10(%ebp),%eax
 804cf93:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804cf96:	8b 45 14             	mov    0x14(%ebp),%eax
 804cf99:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804cf9c:	8d 45 f0             	lea    -0x10(%ebp),%eax
 804cf9f:	89 44 24 10          	mov    %eax,0x10(%esp)
 804cfa3:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804cfa6:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804cfa9:	89 44 24 08          	mov    %eax,0x8(%esp)
 804cfad:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804cfb1:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804cfb4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804cfb7:	89 04 24             	mov    %eax,(%esp)
 804cfba:	89 54 24 04          	mov    %edx,0x4(%esp)
 804cfbe:	89 cb                	mov    %ecx,%ebx
 804cfc0:	e8 f8 f7 ff ff       	call   804c7bd <__qdivrem>
 804cfc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804cfc8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804cfcb:	83 c4 44             	add    $0x44,%esp
 804cfce:	5b                   	pop    %ebx
 804cfcf:	5d                   	pop    %ebp
 804cfd0:	c3                   	ret    
