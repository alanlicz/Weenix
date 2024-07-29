
user/usr/bin/hello.exec:     file format elf32-i386


Disassembly of section .text:

08048094 <main>:

#include <unistd.h>
#include <fcntl.h>

int main(int argc, char **argv)
{
 8048094:	55                   	push   %ebp
 8048095:	89 e5                	mov    %esp,%ebp
 8048097:	83 e4 f0             	and    $0xfffffff0,%esp
 804809a:	83 ec 10             	sub    $0x10,%esp
        open("/dev/tty0", O_RDONLY, 0);
 804809d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 80480a4:	00 
 80480a5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80480ac:	00 
 80480ad:	c7 04 24 50 b8 04 08 	movl   $0x804b850,(%esp)
 80480b4:	e8 4c 05 00 00       	call   8048605 <open>
        open("/dev/tty0", O_WRONLY, 0);
 80480b9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 80480c0:	00 
 80480c1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80480c8:	00 
 80480c9:	c7 04 24 50 b8 04 08 	movl   $0x804b850,(%esp)
 80480d0:	e8 30 05 00 00       	call   8048605 <open>

        write(1, "Hello, world!\n", 14);
 80480d5:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 80480dc:	00 
 80480dd:	c7 44 24 04 5a b8 04 	movl   $0x804b85a,0x4(%esp)
 80480e4:	08 
 80480e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80480ec:	e8 1a 06 00 00       	call   804870b <write>

        return 0;
 80480f1:	b8 00 00 00 00       	mov    $0x0,%eax
}
 80480f6:	c9                   	leave  
 80480f7:	c3                   	ret    

080480f8 <__libc_static_entry>:
#ifndef __DYNAMIC__

.globl __libc_static_entry

__libc_static_entry:
	addl $4, %esp; /* Make sure when we overwrite dummy return address
 80480f8:	83 c4 04             	add    $0x4,%esp
	                  with the correct one, so args will be in the right
	                  place when we call main */
	call main;
 80480fb:	e8 94 ff ff ff       	call   8048094 <main>
	push %eax; /* Argument to exit is return value from main */
 8048100:	50                   	push   %eax
	call exit;
 8048101:	e8 21 02 00 00       	call   8048327 <exit>

08048106 <trap>:
#include "errno.h"

#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
 8048106:	55                   	push   %ebp
 8048107:	89 e5                	mov    %esp,%ebp
 8048109:	83 ec 10             	sub    $0x10,%esp
 804810c:	e8 7d 0d 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048111:	81 c1 5b 61 00 00    	add    $0x615b,%ecx
        int ret;
        __asm__ volatile(
 8048117:	8b 45 08             	mov    0x8(%ebp),%eax
 804811a:	8b 55 0c             	mov    0xc(%ebp),%edx
 804811d:	cd 2e                	int    $0x2e
 804811f:	89 45 fc             	mov    %eax,-0x4(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048122:	b8 27 00 00 00       	mov    $0x27,%eax
 8048127:	cd 2e                	int    $0x2e
 8048129:	89 c2                	mov    %eax,%edx
 804812b:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048131:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048133:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8048136:	c9                   	leave  
 8048137:	c3                   	ret    

08048138 <sbrk>:
static void     (*atexit_func[MAX_EXIT_HANDLERS])();
static int      atexit_handlers = 0;


void *sbrk(intptr_t incr)
{
 8048138:	55                   	push   %ebp
 8048139:	89 e5                	mov    %esp,%ebp
 804813b:	53                   	push   %ebx
 804813c:	83 ec 24             	sub    $0x24,%esp
 804813f:	e8 4a 0d 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048144:	81 c1 28 61 00 00    	add    $0x6128,%ecx
        uintptr_t oldbrk;

        /* If we don't have a saved break, find it from the kernel */
        if (!__curbrk) {
 804814a:	8b 81 14 00 00 00    	mov    0x14(%ecx),%eax
 8048150:	85 c0                	test   %eax,%eax
 8048152:	75 44                	jne    8048198 <sbrk+0x60>
 8048154:	c7 45 f0 2c 00 00 00 	movl   $0x2c,-0x10(%ebp)
 804815b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048162:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048165:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048168:	cd 2e                	int    $0x2e
 804816a:	89 45 e8             	mov    %eax,-0x18(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 804816d:	b8 27 00 00 00       	mov    $0x27,%eax
 8048172:	cd 2e                	int    $0x2e
 8048174:	89 c2                	mov    %eax,%edx
 8048176:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 804817c:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 804817e:	8b 45 e8             	mov    -0x18(%ebp),%eax
                if (0 > (long)(__curbrk = (void *) trap(SYS_brk, (uint32_t) NULL))) {
 8048181:	89 81 14 00 00 00    	mov    %eax,0x14(%ecx)
 8048187:	8b 81 14 00 00 00    	mov    0x14(%ecx),%eax
 804818d:	85 c0                	test   %eax,%eax
 804818f:	79 07                	jns    8048198 <sbrk+0x60>
                        return (void *) -1;
 8048191:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8048196:	eb 63                	jmp    80481fb <sbrk+0xc3>
                }
        }

        oldbrk = (uintptr_t) __curbrk;
 8048198:	8b 81 14 00 00 00    	mov    0x14(%ecx),%eax
 804819e:	89 45 f4             	mov    %eax,-0xc(%ebp)

        /* Increment or decrement the saved break */

        if (incr < 0) {
 80481a1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80481a5:	79 2e                	jns    80481d5 <sbrk+0x9d>
                if ((uintptr_t) - incr > oldbrk) {
 80481a7:	8b 45 08             	mov    0x8(%ebp),%eax
 80481aa:	f7 d8                	neg    %eax
 80481ac:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 80481af:	76 07                	jbe    80481b8 <sbrk+0x80>
                        return (void *) -1;
 80481b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80481b6:	eb 43                	jmp    80481fb <sbrk+0xc3>
                } else if (brk((void *)(oldbrk - (uintptr_t) - incr)) < 0) {
 80481b8:	8b 55 08             	mov    0x8(%ebp),%edx
 80481bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481be:	01 d0                	add    %edx,%eax
 80481c0:	89 04 24             	mov    %eax,(%esp)
 80481c3:	89 cb                	mov    %ecx,%ebx
 80481c5:	e8 37 00 00 00       	call   8048201 <brk>
 80481ca:	85 c0                	test   %eax,%eax
 80481cc:	79 2a                	jns    80481f8 <sbrk+0xc0>
                        return (void *) -1;
 80481ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80481d3:	eb 26                	jmp    80481fb <sbrk+0xc3>
                }
        } else if (incr > 0) {
 80481d5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80481d9:	7e 1d                	jle    80481f8 <sbrk+0xc0>
                if (brk((void *)(oldbrk + (uintptr_t) incr)) < 0) {
 80481db:	8b 55 08             	mov    0x8(%ebp),%edx
 80481de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481e1:	01 d0                	add    %edx,%eax
 80481e3:	89 04 24             	mov    %eax,(%esp)
 80481e6:	89 cb                	mov    %ecx,%ebx
 80481e8:	e8 14 00 00 00       	call   8048201 <brk>
 80481ed:	85 c0                	test   %eax,%eax
 80481ef:	79 07                	jns    80481f8 <sbrk+0xc0>
                        return (void *) -1;
 80481f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80481f6:	eb 03                	jmp    80481fb <sbrk+0xc3>
                }
        }
        return (void *) oldbrk;
 80481f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 80481fb:	83 c4 24             	add    $0x24,%esp
 80481fe:	5b                   	pop    %ebx
 80481ff:	5d                   	pop    %ebp
 8048200:	c3                   	ret    

08048201 <brk>:

int brk(void *addr)
{
 8048201:	55                   	push   %ebp
 8048202:	89 e5                	mov    %esp,%ebp
 8048204:	83 ec 10             	sub    $0x10,%esp
 8048207:	e8 82 0c 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 804820c:	81 c1 60 60 00 00    	add    $0x6060,%ecx
        if (NULL == addr)
 8048212:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048216:	75 07                	jne    804821f <brk+0x1e>
                return -1;
 8048218:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804821d:	eb 4a                	jmp    8048269 <brk+0x68>
        void *newbrk = (void *) trap(SYS_brk, (uint32_t) addr);
 804821f:	8b 45 08             	mov    0x8(%ebp),%eax
 8048222:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
 8048229:	89 45 f4             	mov    %eax,-0xc(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 804822c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804822f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048232:	cd 2e                	int    $0x2e
 8048234:	89 45 f0             	mov    %eax,-0x10(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048237:	b8 27 00 00 00       	mov    $0x27,%eax
 804823c:	cd 2e                	int    $0x2e
 804823e:	89 c2                	mov    %eax,%edx
 8048240:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048246:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048248:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804824b:	89 45 fc             	mov    %eax,-0x4(%ebp)
        if (newbrk == (void *) -1)
 804824e:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
 8048252:	75 07                	jne    804825b <brk+0x5a>
                return -1;
 8048254:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8048259:	eb 0e                	jmp    8048269 <brk+0x68>
        __curbrk = newbrk;
 804825b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804825e:	89 81 14 00 00 00    	mov    %eax,0x14(%ecx)
        return 0;
 8048264:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8048269:	c9                   	leave  
 804826a:	c3                   	ret    

0804826b <fork>:

int fork(void)
{
 804826b:	55                   	push   %ebp
 804826c:	89 e5                	mov    %esp,%ebp
 804826e:	83 ec 10             	sub    $0x10,%esp
 8048271:	e8 18 0c 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048276:	81 c1 f6 5f 00 00    	add    $0x5ff6,%ecx
 804827c:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
 8048283:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 804828a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804828d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048290:	cd 2e                	int    $0x2e
 8048292:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048295:	b8 27 00 00 00       	mov    $0x27,%eax
 804829a:	cd 2e                	int    $0x2e
 804829c:	89 c2                	mov    %eax,%edx
 804829e:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 80482a4:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 80482a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
        return trap(SYS_fork, 0);
 80482a9:	90                   	nop
}
 80482aa:	c9                   	leave  
 80482ab:	c3                   	ret    

080482ac <atexit>:

int atexit(void (*func)(void))
{
 80482ac:	55                   	push   %ebp
 80482ad:	89 e5                	mov    %esp,%ebp
 80482af:	e8 d6 0b 00 00       	call   8048e8a <__x86.get_pc_thunk.ax>
 80482b4:	05 b8 5f 00 00       	add    $0x5fb8,%eax
        if (atexit_handlers < MAX_EXIT_HANDLERS) {
 80482b9:	8b 90 b4 00 00 00    	mov    0xb4(%eax),%edx
 80482bf:	83 fa 1f             	cmp    $0x1f,%edx
 80482c2:	7f 20                	jg     80482e4 <atexit+0x38>
                atexit_func[atexit_handlers++] = func;
 80482c4:	8b 90 b4 00 00 00    	mov    0xb4(%eax),%edx
 80482ca:	8d 4a 01             	lea    0x1(%edx),%ecx
 80482cd:	89 88 b4 00 00 00    	mov    %ecx,0xb4(%eax)
 80482d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80482d6:	89 8c 90 34 00 00 00 	mov    %ecx,0x34(%eax,%edx,4)
                return 0;
 80482dd:	b8 00 00 00 00       	mov    $0x0,%eax
 80482e2:	eb 05                	jmp    80482e9 <atexit+0x3d>
        }

        return 1;
 80482e4:	b8 01 00 00 00       	mov    $0x1,%eax
}
 80482e9:	5d                   	pop    %ebp
 80482ea:	c3                   	ret    

080482eb <_exit>:

void _exit(int status)
{
 80482eb:	55                   	push   %ebp
 80482ec:	89 e5                	mov    %esp,%ebp
 80482ee:	83 ec 10             	sub    $0x10,%esp
 80482f1:	e8 98 0b 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 80482f6:	81 c1 76 5f 00 00    	add    $0x5f76,%ecx
        trap(SYS_exit, (uint32_t) status);
 80482fc:	8b 45 08             	mov    0x8(%ebp),%eax
 80482ff:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
 8048306:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048309:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804830c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804830f:	cd 2e                	int    $0x2e
 8048311:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048314:	b8 27 00 00 00       	mov    $0x27,%eax
 8048319:	cd 2e                	int    $0x2e
 804831b:	89 c2                	mov    %eax,%edx
 804831d:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048323:	89 10                	mov    %edx,(%eax)

        /* this keeps gcc from warning us about exit returning, because it
         * expects exit not to. We never actually get here. */
        for (;;);
 8048325:	eb fe                	jmp    8048325 <_exit+0x3a>

08048327 <exit>:
}

void exit(int status)
{
 8048327:	55                   	push   %ebp
 8048328:	89 e5                	mov    %esp,%ebp
 804832a:	53                   	push   %ebx
 804832b:	83 ec 14             	sub    $0x14,%esp
 804832e:	e8 5f 0b 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 8048333:	81 c3 39 5f 00 00    	add    $0x5f39,%ebx
        while (atexit_handlers--) {
 8048339:	eb 0f                	jmp    804834a <exit+0x23>
                atexit_func[atexit_handlers]();
 804833b:	8b 83 b4 00 00 00    	mov    0xb4(%ebx),%eax
 8048341:	8b 84 83 34 00 00 00 	mov    0x34(%ebx,%eax,4),%eax
 8048348:	ff d0                	call   *%eax
        for (;;);
}

void exit(int status)
{
        while (atexit_handlers--) {
 804834a:	8b 83 b4 00 00 00    	mov    0xb4(%ebx),%eax
 8048350:	8d 50 ff             	lea    -0x1(%eax),%edx
 8048353:	89 93 b4 00 00 00    	mov    %edx,0xb4(%ebx)
 8048359:	85 c0                	test   %eax,%eax
 804835b:	75 de                	jne    804833b <exit+0x14>
                atexit_func[atexit_handlers]();
        }

        _exit(status);
 804835d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048360:	89 04 24             	mov    %eax,(%esp)
 8048363:	e8 83 ff ff ff       	call   80482eb <_exit>
        exit(status); /* gcc doesn't realize that _exit() exits */
 8048368:	8b 45 08             	mov    0x8(%ebp),%eax
 804836b:	89 04 24             	mov    %eax,(%esp)
 804836e:	e8 b4 ff ff ff       	call   8048327 <exit>
}
 8048373:	90                   	nop
 8048374:	83 c4 14             	add    $0x14,%esp
 8048377:	5b                   	pop    %ebx
 8048378:	5d                   	pop    %ebp
 8048379:	c3                   	ret    

0804837a <yield>:

void yield(void)
{
 804837a:	55                   	push   %ebp
 804837b:	89 e5                	mov    %esp,%ebp
 804837d:	53                   	push   %ebx
 804837e:	83 ec 14             	sub    $0x14,%esp
 8048381:	e8 0c 0b 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 8048386:	81 c3 e6 5e 00 00    	add    $0x5ee6,%ebx
        /* Due to a Bochs bug, the yield syscall itself is highly unyielding
         * (for instance, it's impossible to type while a process is in a yield
         * loop. This is good enough. */
        (fork() ? wait(NULL) : exit(0));
 804838c:	e8 da fe ff ff       	call   804826b <fork>
 8048391:	85 c0                	test   %eax,%eax
 8048393:	74 0e                	je     80483a3 <yield+0x29>
 8048395:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804839c:	e8 15 00 00 00       	call   80483b6 <wait>
}
 80483a1:	eb 0c                	jmp    80483af <yield+0x35>
void yield(void)
{
        /* Due to a Bochs bug, the yield syscall itself is highly unyielding
         * (for instance, it's impossible to type while a process is in a yield
         * loop. This is good enough. */
        (fork() ? wait(NULL) : exit(0));
 80483a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80483aa:	e8 78 ff ff ff       	call   8048327 <exit>
}
 80483af:	90                   	nop
 80483b0:	83 c4 14             	add    $0x14,%esp
 80483b3:	5b                   	pop    %ebx
 80483b4:	5d                   	pop    %ebp
 80483b5:	c3                   	ret    

080483b6 <wait>:

pid_t wait(int *status)
{
 80483b6:	55                   	push   %ebp
 80483b7:	89 e5                	mov    %esp,%ebp
 80483b9:	83 ec 20             	sub    $0x20,%esp
 80483bc:	e8 cd 0a 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 80483c1:	81 c1 ab 5e 00 00    	add    $0x5eab,%ecx
        waitpid_args_t args;

        args.wpa_pid = -1;
 80483c7:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
        args.wpa_options = 0;
 80483ce:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
        args.wpa_status = status;
 80483d5:	8b 45 08             	mov    0x8(%ebp),%eax
 80483d8:	89 45 f0             	mov    %eax,-0x10(%ebp)

        return trap(SYS_waitpid, (uint32_t) &args);
 80483db:	8d 45 e8             	lea    -0x18(%ebp),%eax
 80483de:	c7 45 fc 07 00 00 00 	movl   $0x7,-0x4(%ebp)
 80483e5:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 80483e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80483eb:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80483ee:	cd 2e                	int    $0x2e
 80483f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 80483f3:	b8 27 00 00 00       	mov    $0x27,%eax
 80483f8:	cd 2e                	int    $0x2e
 80483fa:	89 c2                	mov    %eax,%edx
 80483fc:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048402:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048404:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048407:	c9                   	leave  
 8048408:	c3                   	ret    

08048409 <waitpid>:

pid_t waitpid(pid_t pid, int options, int *status)
{
 8048409:	55                   	push   %ebp
 804840a:	89 e5                	mov    %esp,%ebp
 804840c:	83 ec 20             	sub    $0x20,%esp
 804840f:	e8 7a 0a 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048414:	81 c1 58 5e 00 00    	add    $0x5e58,%ecx
        waitpid_args_t args;

        args.wpa_pid = pid;
 804841a:	8b 45 08             	mov    0x8(%ebp),%eax
 804841d:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.wpa_options = options;
 8048420:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048423:	89 45 ec             	mov    %eax,-0x14(%ebp)
        args.wpa_status = status;
 8048426:	8b 45 10             	mov    0x10(%ebp),%eax
 8048429:	89 45 f0             	mov    %eax,-0x10(%ebp)

        return trap(SYS_waitpid, (uint32_t) &args);
 804842c:	8d 45 e8             	lea    -0x18(%ebp),%eax
 804842f:	c7 45 fc 07 00 00 00 	movl   $0x7,-0x4(%ebp)
 8048436:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048439:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804843c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804843f:	cd 2e                	int    $0x2e
 8048441:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048444:	b8 27 00 00 00       	mov    $0x27,%eax
 8048449:	cd 2e                	int    $0x2e
 804844b:	89 c2                	mov    %eax,%edx
 804844d:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048453:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048455:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048458:	c9                   	leave  
 8048459:	c3                   	ret    

0804845a <thr_exit>:

void thr_exit(int status)
{
 804845a:	55                   	push   %ebp
 804845b:	89 e5                	mov    %esp,%ebp
 804845d:	83 ec 10             	sub    $0x10,%esp
 8048460:	e8 29 0a 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048465:	81 c1 07 5e 00 00    	add    $0x5e07,%ecx
        trap(SYS_thr_exit, (uint32_t) status);
 804846b:	8b 45 08             	mov    0x8(%ebp),%eax
 804846e:	c7 45 fc 1f 00 00 00 	movl   $0x1f,-0x4(%ebp)
 8048475:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048478:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804847b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804847e:	cd 2e                	int    $0x2e
 8048480:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048483:	b8 27 00 00 00       	mov    $0x27,%eax
 8048488:	cd 2e                	int    $0x2e
 804848a:	89 c2                	mov    %eax,%edx
 804848c:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048492:	89 10                	mov    %edx,(%eax)
}
 8048494:	90                   	nop
 8048495:	c9                   	leave  
 8048496:	c3                   	ret    

08048497 <getpid>:

pid_t getpid(void)
{
 8048497:	55                   	push   %ebp
 8048498:	89 e5                	mov    %esp,%ebp
 804849a:	83 ec 10             	sub    $0x10,%esp
 804849d:	e8 ec 09 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 80484a2:	81 c1 ca 5d 00 00    	add    $0x5dca,%ecx
 80484a8:	c7 45 fc 23 00 00 00 	movl   $0x23,-0x4(%ebp)
 80484af:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 80484b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80484b9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80484bc:	cd 2e                	int    $0x2e
 80484be:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 80484c1:	b8 27 00 00 00       	mov    $0x27,%eax
 80484c6:	cd 2e                	int    $0x2e
 80484c8:	89 c2                	mov    %eax,%edx
 80484ca:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 80484d0:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 80484d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
        return trap(SYS_getpid, 0);
 80484d5:	90                   	nop
}
 80484d6:	c9                   	leave  
 80484d7:	c3                   	ret    

080484d8 <halt>:

int halt(void)
{
 80484d8:	55                   	push   %ebp
 80484d9:	89 e5                	mov    %esp,%ebp
 80484db:	83 ec 10             	sub    $0x10,%esp
 80484de:	e8 ab 09 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 80484e3:	81 c1 89 5d 00 00    	add    $0x5d89,%ecx
 80484e9:	c7 45 fc 28 00 00 00 	movl   $0x28,-0x4(%ebp)
 80484f0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 80484f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80484fa:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80484fd:	cd 2e                	int    $0x2e
 80484ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048502:	b8 27 00 00 00       	mov    $0x27,%eax
 8048507:	cd 2e                	int    $0x2e
 8048509:	89 c2                	mov    %eax,%edx
 804850b:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048511:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048513:	8b 45 f4             	mov    -0xc(%ebp),%eax
        return trap(SYS_halt, 0);
 8048516:	90                   	nop
}
 8048517:	c9                   	leave  
 8048518:	c3                   	ret    

08048519 <mmap>:

void *mmap(void *addr, size_t len, int prot, int flags, int fd, off_t off)
{
 8048519:	55                   	push   %ebp
 804851a:	89 e5                	mov    %esp,%ebp
 804851c:	83 ec 30             	sub    $0x30,%esp
 804851f:	e8 6a 09 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048524:	81 c1 48 5d 00 00    	add    $0x5d48,%ecx
        mmap_args_t args;

        args.mma_addr = addr;
 804852a:	8b 45 08             	mov    0x8(%ebp),%eax
 804852d:	89 45 dc             	mov    %eax,-0x24(%ebp)
        args.mma_len = len;
 8048530:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048533:	89 45 e0             	mov    %eax,-0x20(%ebp)
        args.mma_prot = prot;
 8048536:	8b 45 10             	mov    0x10(%ebp),%eax
 8048539:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        args.mma_flags = flags;
 804853c:	8b 45 14             	mov    0x14(%ebp),%eax
 804853f:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.mma_fd = fd;
 8048542:	8b 45 18             	mov    0x18(%ebp),%eax
 8048545:	89 45 ec             	mov    %eax,-0x14(%ebp)
        args.mma_off = off;
 8048548:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804854b:	89 45 f0             	mov    %eax,-0x10(%ebp)

        return (void *) trap(SYS_mmap, (uint32_t) &args);
 804854e:	8d 45 dc             	lea    -0x24(%ebp),%eax
 8048551:	c7 45 fc 18 00 00 00 	movl   $0x18,-0x4(%ebp)
 8048558:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 804855b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804855e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048561:	cd 2e                	int    $0x2e
 8048563:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048566:	b8 27 00 00 00       	mov    $0x27,%eax
 804856b:	cd 2e                	int    $0x2e
 804856d:	89 c2                	mov    %eax,%edx
 804856f:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048575:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048577:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 804857a:	c9                   	leave  
 804857b:	c3                   	ret    

0804857c <munmap>:

int munmap(void *addr, size_t len)
{
 804857c:	55                   	push   %ebp
 804857d:	89 e5                	mov    %esp,%ebp
 804857f:	83 ec 20             	sub    $0x20,%esp
 8048582:	e8 07 09 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048587:	81 c1 e5 5c 00 00    	add    $0x5ce5,%ecx
        munmap_args_t args;

        args.addr = addr;
 804858d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048590:	89 45 ec             	mov    %eax,-0x14(%ebp)
        args.len = len;
 8048593:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048596:	89 45 f0             	mov    %eax,-0x10(%ebp)

        return trap(SYS_munmap, (uint32_t) &args);
 8048599:	8d 45 ec             	lea    -0x14(%ebp),%eax
 804859c:	c7 45 fc 1a 00 00 00 	movl   $0x1a,-0x4(%ebp)
 80485a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 80485a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80485a9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80485ac:	cd 2e                	int    $0x2e
 80485ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 80485b1:	b8 27 00 00 00       	mov    $0x27,%eax
 80485b6:	cd 2e                	int    $0x2e
 80485b8:	89 c2                	mov    %eax,%edx
 80485ba:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 80485c0:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 80485c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 80485c5:	c9                   	leave  
 80485c6:	c3                   	ret    

080485c7 <sync>:

void sync(void)
{
 80485c7:	55                   	push   %ebp
 80485c8:	89 e5                	mov    %esp,%ebp
 80485ca:	83 ec 10             	sub    $0x10,%esp
 80485cd:	e8 bc 08 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 80485d2:	81 c1 9a 5c 00 00    	add    $0x5c9a,%ecx
 80485d8:	c7 45 fc 0f 00 00 00 	movl   $0xf,-0x4(%ebp)
 80485df:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 80485e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80485e9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80485ec:	cd 2e                	int    $0x2e
 80485ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 80485f1:	b8 27 00 00 00       	mov    $0x27,%eax
 80485f6:	cd 2e                	int    $0x2e
 80485f8:	89 c2                	mov    %eax,%edx
 80485fa:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048600:	89 10                	mov    %edx,(%eax)
        trap(SYS_sync, 0);
}
 8048602:	90                   	nop
 8048603:	c9                   	leave  
 8048604:	c3                   	ret    

08048605 <open>:

int open(const char *filename, int flags, int mode)
{
 8048605:	55                   	push   %ebp
 8048606:	89 e5                	mov    %esp,%ebp
 8048608:	53                   	push   %ebx
 8048609:	83 ec 34             	sub    $0x34,%esp
 804860c:	e8 81 08 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 8048611:	81 c3 5b 5c 00 00    	add    $0x5c5b,%ebx
        open_args_t args;

        args.filename.as_len = strlen(filename);
 8048617:	8b 45 08             	mov    0x8(%ebp),%eax
 804861a:	89 04 24             	mov    %eax,(%esp)
 804861d:	e8 e1 0a 00 00       	call   8049103 <strlen>
 8048622:	89 45 e0             	mov    %eax,-0x20(%ebp)
        args.filename.as_str = filename;
 8048625:	8b 45 08             	mov    0x8(%ebp),%eax
 8048628:	89 45 dc             	mov    %eax,-0x24(%ebp)
        args.flags = flags;
 804862b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804862e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        args.mode = mode;
 8048631:	8b 45 10             	mov    0x10(%ebp),%eax
 8048634:	89 45 e8             	mov    %eax,-0x18(%ebp)

        return trap(SYS_open, (uint32_t) &args);
 8048637:	8d 45 dc             	lea    -0x24(%ebp),%eax
 804863a:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
 8048641:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048644:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048647:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804864a:	cd 2e                	int    $0x2e
 804864c:	89 45 ec             	mov    %eax,-0x14(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 804864f:	b8 27 00 00 00       	mov    $0x27,%eax
 8048654:	cd 2e                	int    $0x2e
 8048656:	89 c2                	mov    %eax,%edx
 8048658:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 804865e:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048660:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
 8048663:	83 c4 34             	add    $0x34,%esp
 8048666:	5b                   	pop    %ebx
 8048667:	5d                   	pop    %ebp
 8048668:	c3                   	ret    

08048669 <lseek>:

off_t lseek(int fd, off_t offset, int whence)
{
 8048669:	55                   	push   %ebp
 804866a:	89 e5                	mov    %esp,%ebp
 804866c:	83 ec 20             	sub    $0x20,%esp
 804866f:	e8 1a 08 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048674:	81 c1 f8 5b 00 00    	add    $0x5bf8,%ecx
        lseek_args_t args;

        args.fd = fd;
 804867a:	8b 45 08             	mov    0x8(%ebp),%eax
 804867d:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.offset = offset;
 8048680:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048683:	89 45 ec             	mov    %eax,-0x14(%ebp)
        args.whence = whence;
 8048686:	8b 45 10             	mov    0x10(%ebp),%eax
 8048689:	89 45 f0             	mov    %eax,-0x10(%ebp)

        return trap(SYS_lseek, (uint32_t) &args);
 804868c:	8d 45 e8             	lea    -0x18(%ebp),%eax
 804868f:	c7 45 fc 0e 00 00 00 	movl   $0xe,-0x4(%ebp)
 8048696:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048699:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804869c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804869f:	cd 2e                	int    $0x2e
 80486a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 80486a4:	b8 27 00 00 00       	mov    $0x27,%eax
 80486a9:	cd 2e                	int    $0x2e
 80486ab:	89 c2                	mov    %eax,%edx
 80486ad:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 80486b3:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 80486b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 80486b8:	c9                   	leave  
 80486b9:	c3                   	ret    

080486ba <read>:


int read(int fd, void *buf, size_t nbytes)
{
 80486ba:	55                   	push   %ebp
 80486bb:	89 e5                	mov    %esp,%ebp
 80486bd:	83 ec 20             	sub    $0x20,%esp
 80486c0:	e8 c9 07 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 80486c5:	81 c1 a7 5b 00 00    	add    $0x5ba7,%ecx
        read_args_t args;

        args.fd = fd;
 80486cb:	8b 45 08             	mov    0x8(%ebp),%eax
 80486ce:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.buf = buf;
 80486d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
        args.nbytes = nbytes;
 80486d7:	8b 45 10             	mov    0x10(%ebp),%eax
 80486da:	89 45 f0             	mov    %eax,-0x10(%ebp)


        return trap(SYS_read, (uint32_t) &args);
 80486dd:	8d 45 e8             	lea    -0x18(%ebp),%eax
 80486e0:	c7 45 fc 03 00 00 00 	movl   $0x3,-0x4(%ebp)
 80486e7:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 80486ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80486ed:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80486f0:	cd 2e                	int    $0x2e
 80486f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 80486f5:	b8 27 00 00 00       	mov    $0x27,%eax
 80486fa:	cd 2e                	int    $0x2e
 80486fc:	89 c2                	mov    %eax,%edx
 80486fe:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048704:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048706:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048709:	c9                   	leave  
 804870a:	c3                   	ret    

0804870b <write>:

int write(int fd, const void *buf, size_t nbytes)
{
 804870b:	55                   	push   %ebp
 804870c:	89 e5                	mov    %esp,%ebp
 804870e:	83 ec 20             	sub    $0x20,%esp
 8048711:	e8 78 07 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048716:	81 c1 56 5b 00 00    	add    $0x5b56,%ecx
        write_args_t args;

        args.fd = fd;
 804871c:	8b 45 08             	mov    0x8(%ebp),%eax
 804871f:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.buf = (void *) buf;
 8048722:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048725:	89 45 ec             	mov    %eax,-0x14(%ebp)
        args.nbytes = nbytes;
 8048728:	8b 45 10             	mov    0x10(%ebp),%eax
 804872b:	89 45 f0             	mov    %eax,-0x10(%ebp)

        return trap(SYS_write, (uint32_t) &args);
 804872e:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048731:	c7 45 fc 04 00 00 00 	movl   $0x4,-0x4(%ebp)
 8048738:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 804873b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804873e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048741:	cd 2e                	int    $0x2e
 8048743:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048746:	b8 27 00 00 00       	mov    $0x27,%eax
 804874b:	cd 2e                	int    $0x2e
 804874d:	89 c2                	mov    %eax,%edx
 804874f:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048755:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048757:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 804875a:	c9                   	leave  
 804875b:	c3                   	ret    

0804875c <close>:

int close(int fd)
{
 804875c:	55                   	push   %ebp
 804875d:	89 e5                	mov    %esp,%ebp
 804875f:	83 ec 10             	sub    $0x10,%esp
 8048762:	e8 27 07 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048767:	81 c1 05 5b 00 00    	add    $0x5b05,%ecx
        return trap(SYS_close, (uint32_t) fd);
 804876d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048770:	c7 45 fc 06 00 00 00 	movl   $0x6,-0x4(%ebp)
 8048777:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 804877a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804877d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048780:	cd 2e                	int    $0x2e
 8048782:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048785:	b8 27 00 00 00       	mov    $0x27,%eax
 804878a:	cd 2e                	int    $0x2e
 804878c:	89 c2                	mov    %eax,%edx
 804878e:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048794:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048796:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048799:	90                   	nop
}
 804879a:	c9                   	leave  
 804879b:	c3                   	ret    

0804879c <dup>:

int dup(int fd)
{
 804879c:	55                   	push   %ebp
 804879d:	89 e5                	mov    %esp,%ebp
 804879f:	83 ec 10             	sub    $0x10,%esp
 80487a2:	e8 e7 06 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 80487a7:	81 c1 c5 5a 00 00    	add    $0x5ac5,%ecx
        return trap(SYS_dup, (uint32_t) fd);
 80487ad:	8b 45 08             	mov    0x8(%ebp),%eax
 80487b0:	c7 45 fc 11 00 00 00 	movl   $0x11,-0x4(%ebp)
 80487b7:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 80487ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80487bd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80487c0:	cd 2e                	int    $0x2e
 80487c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 80487c5:	b8 27 00 00 00       	mov    $0x27,%eax
 80487ca:	cd 2e                	int    $0x2e
 80487cc:	89 c2                	mov    %eax,%edx
 80487ce:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 80487d4:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 80487d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80487d9:	90                   	nop
}
 80487da:	c9                   	leave  
 80487db:	c3                   	ret    

080487dc <dup2>:

int dup2(int ofd, int nfd)
{
 80487dc:	55                   	push   %ebp
 80487dd:	89 e5                	mov    %esp,%ebp
 80487df:	83 ec 20             	sub    $0x20,%esp
 80487e2:	e8 a7 06 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 80487e7:	81 c1 85 5a 00 00    	add    $0x5a85,%ecx
        dup2_args_t args;

        args.ofd = ofd;
 80487ed:	8b 45 08             	mov    0x8(%ebp),%eax
 80487f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
        args.nfd = nfd;
 80487f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487f6:	89 45 f0             	mov    %eax,-0x10(%ebp)

        return trap(SYS_dup2, (uint32_t) &args);
 80487f9:	8d 45 ec             	lea    -0x14(%ebp),%eax
 80487fc:	c7 45 fc 2b 00 00 00 	movl   $0x2b,-0x4(%ebp)
 8048803:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048806:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048809:	8b 55 f8             	mov    -0x8(%ebp),%edx
 804880c:	cd 2e                	int    $0x2e
 804880e:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048811:	b8 27 00 00 00       	mov    $0x27,%eax
 8048816:	cd 2e                	int    $0x2e
 8048818:	89 c2                	mov    %eax,%edx
 804881a:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048820:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048822:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048825:	c9                   	leave  
 8048826:	c3                   	ret    

08048827 <mkdir>:

int mkdir(const char *path, int mode)
{
 8048827:	55                   	push   %ebp
 8048828:	89 e5                	mov    %esp,%ebp
 804882a:	53                   	push   %ebx
 804882b:	83 ec 34             	sub    $0x34,%esp
 804882e:	e8 5f 06 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 8048833:	81 c3 39 5a 00 00    	add    $0x5a39,%ebx
        mkdir_args_t args;

        args.path.as_len = strlen(path);
 8048839:	8b 45 08             	mov    0x8(%ebp),%eax
 804883c:	89 04 24             	mov    %eax,(%esp)
 804883f:	e8 bf 08 00 00       	call   8049103 <strlen>
 8048844:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        args.path.as_str = path;
 8048847:	8b 45 08             	mov    0x8(%ebp),%eax
 804884a:	89 45 e0             	mov    %eax,-0x20(%ebp)
        args.mode = mode;
 804884d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048850:	89 45 e8             	mov    %eax,-0x18(%ebp)

        return trap(SYS_mkdir, (uint32_t) &args);
 8048853:	8d 45 e0             	lea    -0x20(%ebp),%eax
 8048856:	c7 45 f4 16 00 00 00 	movl   $0x16,-0xc(%ebp)
 804885d:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048860:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048863:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048866:	cd 2e                	int    $0x2e
 8048868:	89 45 ec             	mov    %eax,-0x14(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 804886b:	b8 27 00 00 00       	mov    $0x27,%eax
 8048870:	cd 2e                	int    $0x2e
 8048872:	89 c2                	mov    %eax,%edx
 8048874:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 804887a:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 804887c:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
 804887f:	83 c4 34             	add    $0x34,%esp
 8048882:	5b                   	pop    %ebx
 8048883:	5d                   	pop    %ebp
 8048884:	c3                   	ret    

08048885 <rmdir>:

int rmdir(const char *path)
{
 8048885:	55                   	push   %ebp
 8048886:	89 e5                	mov    %esp,%ebp
 8048888:	53                   	push   %ebx
 8048889:	83 ec 34             	sub    $0x34,%esp
 804888c:	e8 01 06 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 8048891:	81 c3 db 59 00 00    	add    $0x59db,%ebx
        argstr_t args;
        args.as_len = strlen(path);
 8048897:	8b 45 08             	mov    0x8(%ebp),%eax
 804889a:	89 04 24             	mov    %eax,(%esp)
 804889d:	e8 61 08 00 00       	call   8049103 <strlen>
 80488a2:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.as_str = path;
 80488a5:	8b 45 08             	mov    0x8(%ebp),%eax
 80488a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        return trap(SYS_rmdir, (uint32_t) &args);
 80488ab:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 80488ae:	c7 45 f4 15 00 00 00 	movl   $0x15,-0xc(%ebp)
 80488b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 80488b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80488bb:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80488be:	cd 2e                	int    $0x2e
 80488c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 80488c3:	b8 27 00 00 00       	mov    $0x27,%eax
 80488c8:	cd 2e                	int    $0x2e
 80488ca:	89 c2                	mov    %eax,%edx
 80488cc:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 80488d2:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 80488d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
 80488d7:	83 c4 34             	add    $0x34,%esp
 80488da:	5b                   	pop    %ebx
 80488db:	5d                   	pop    %ebp
 80488dc:	c3                   	ret    

080488dd <unlink>:

int unlink(const char *path)
{
 80488dd:	55                   	push   %ebp
 80488de:	89 e5                	mov    %esp,%ebp
 80488e0:	53                   	push   %ebx
 80488e1:	83 ec 34             	sub    $0x34,%esp
 80488e4:	e8 a9 05 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 80488e9:	81 c3 83 59 00 00    	add    $0x5983,%ebx
        argstr_t args;
        args.as_len = strlen(path);
 80488ef:	8b 45 08             	mov    0x8(%ebp),%eax
 80488f2:	89 04 24             	mov    %eax,(%esp)
 80488f5:	e8 09 08 00 00       	call   8049103 <strlen>
 80488fa:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.as_str = path;
 80488fd:	8b 45 08             	mov    0x8(%ebp),%eax
 8048900:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        return trap(SYS_unlink, (uint32_t) &args);
 8048903:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8048906:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
 804890d:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048910:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048913:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048916:	cd 2e                	int    $0x2e
 8048918:	89 45 ec             	mov    %eax,-0x14(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 804891b:	b8 27 00 00 00       	mov    $0x27,%eax
 8048920:	cd 2e                	int    $0x2e
 8048922:	89 c2                	mov    %eax,%edx
 8048924:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 804892a:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 804892c:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
 804892f:	83 c4 34             	add    $0x34,%esp
 8048932:	5b                   	pop    %ebx
 8048933:	5d                   	pop    %ebp
 8048934:	c3                   	ret    

08048935 <link>:

int link(const char *from, const char *to)
{
 8048935:	55                   	push   %ebp
 8048936:	89 e5                	mov    %esp,%ebp
 8048938:	53                   	push   %ebx
 8048939:	83 ec 34             	sub    $0x34,%esp
 804893c:	e8 51 05 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 8048941:	81 c3 2b 59 00 00    	add    $0x592b,%ebx
        link_args_t args;

        args.from.as_len = strlen(from);
 8048947:	8b 45 08             	mov    0x8(%ebp),%eax
 804894a:	89 04 24             	mov    %eax,(%esp)
 804894d:	e8 b1 07 00 00       	call   8049103 <strlen>
 8048952:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.from.as_str = from;
 8048955:	8b 45 08             	mov    0x8(%ebp),%eax
 8048958:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        args.to.as_len = strlen(to);
 804895b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804895e:	89 04 24             	mov    %eax,(%esp)
 8048961:	e8 9d 07 00 00       	call   8049103 <strlen>
 8048966:	89 45 e0             	mov    %eax,-0x20(%ebp)
        args.to.as_str = to;
 8048969:	8b 45 0c             	mov    0xc(%ebp),%eax
 804896c:	89 45 dc             	mov    %eax,-0x24(%ebp)

        return trap(SYS_link, (uint32_t) &args);
 804896f:	8d 45 dc             	lea    -0x24(%ebp),%eax
 8048972:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
 8048979:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 804897c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804897f:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048982:	cd 2e                	int    $0x2e
 8048984:	89 45 ec             	mov    %eax,-0x14(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048987:	b8 27 00 00 00       	mov    $0x27,%eax
 804898c:	cd 2e                	int    $0x2e
 804898e:	89 c2                	mov    %eax,%edx
 8048990:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048996:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048998:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
 804899b:	83 c4 34             	add    $0x34,%esp
 804899e:	5b                   	pop    %ebx
 804899f:	5d                   	pop    %ebp
 80489a0:	c3                   	ret    

080489a1 <rename>:

int rename(const char *oldname, const char *newname)
{
 80489a1:	55                   	push   %ebp
 80489a2:	89 e5                	mov    %esp,%ebp
 80489a4:	53                   	push   %ebx
 80489a5:	83 ec 34             	sub    $0x34,%esp
 80489a8:	e8 e5 04 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 80489ad:	81 c3 bf 58 00 00    	add    $0x58bf,%ebx
        rename_args_t args;

        args.oldname.as_len = strlen(oldname);
 80489b3:	8b 45 08             	mov    0x8(%ebp),%eax
 80489b6:	89 04 24             	mov    %eax,(%esp)
 80489b9:	e8 45 07 00 00       	call   8049103 <strlen>
 80489be:	89 45 e0             	mov    %eax,-0x20(%ebp)
        args.oldname.as_str = oldname;
 80489c1:	8b 45 08             	mov    0x8(%ebp),%eax
 80489c4:	89 45 dc             	mov    %eax,-0x24(%ebp)
        args.newname.as_len = strlen(newname);
 80489c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80489ca:	89 04 24             	mov    %eax,(%esp)
 80489cd:	e8 31 07 00 00       	call   8049103 <strlen>
 80489d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.newname.as_str = newname;
 80489d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80489d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)

        return trap(SYS_rename, (uint32_t) &args);
 80489db:	8d 45 dc             	lea    -0x24(%ebp),%eax
 80489de:	c7 45 f4 1b 00 00 00 	movl   $0x1b,-0xc(%ebp)
 80489e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 80489e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80489eb:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80489ee:	cd 2e                	int    $0x2e
 80489f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 80489f3:	b8 27 00 00 00       	mov    $0x27,%eax
 80489f8:	cd 2e                	int    $0x2e
 80489fa:	89 c2                	mov    %eax,%edx
 80489fc:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048a02:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048a04:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
 8048a07:	83 c4 34             	add    $0x34,%esp
 8048a0a:	5b                   	pop    %ebx
 8048a0b:	5d                   	pop    %ebp
 8048a0c:	c3                   	ret    

08048a0d <chdir>:

int chdir(const char *path)
{
 8048a0d:	55                   	push   %ebp
 8048a0e:	89 e5                	mov    %esp,%ebp
 8048a10:	53                   	push   %ebx
 8048a11:	83 ec 34             	sub    $0x34,%esp
 8048a14:	e8 79 04 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 8048a19:	81 c3 53 58 00 00    	add    $0x5853,%ebx
        argstr_t args;
        args.as_len = strlen(path);
 8048a1f:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a22:	89 04 24             	mov    %eax,(%esp)
 8048a25:	e8 d9 06 00 00       	call   8049103 <strlen>
 8048a2a:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.as_str = path;
 8048a2d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a30:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        return trap(SYS_chdir, (uint32_t) &args);
 8048a33:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8048a36:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 8048a3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048a40:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a43:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048a46:	cd 2e                	int    $0x2e
 8048a48:	89 45 ec             	mov    %eax,-0x14(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048a4b:	b8 27 00 00 00       	mov    $0x27,%eax
 8048a50:	cd 2e                	int    $0x2e
 8048a52:	89 c2                	mov    %eax,%edx
 8048a54:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048a5a:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048a5c:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
 8048a5f:	83 c4 34             	add    $0x34,%esp
 8048a62:	5b                   	pop    %ebx
 8048a63:	5d                   	pop    %ebp
 8048a64:	c3                   	ret    

08048a65 <get_free_mem>:

size_t get_free_mem(void)
{
 8048a65:	55                   	push   %ebp
 8048a66:	89 e5                	mov    %esp,%ebp
 8048a68:	83 ec 10             	sub    $0x10,%esp
 8048a6b:	e8 1e 04 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048a70:	81 c1 fc 57 00 00    	add    $0x57fc,%ecx
 8048a76:	c7 45 fc 29 00 00 00 	movl   $0x29,-0x4(%ebp)
 8048a7d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048a84:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048a87:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048a8a:	cd 2e                	int    $0x2e
 8048a8c:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048a8f:	b8 27 00 00 00       	mov    $0x27,%eax
 8048a94:	cd 2e                	int    $0x2e
 8048a96:	89 c2                	mov    %eax,%edx
 8048a98:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048a9e:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
        return (size_t) trap(SYS_get_free_mem, 0);
}
 8048aa3:	c9                   	leave  
 8048aa4:	c3                   	ret    

08048aa5 <execve>:

int execve(const char *filename, char *const argv[], char *const envp[])
{
 8048aa5:	55                   	push   %ebp
 8048aa6:	89 e5                	mov    %esp,%ebp
 8048aa8:	56                   	push   %esi
 8048aa9:	53                   	push   %ebx
 8048aaa:	83 ec 40             	sub    $0x40,%esp
 8048aad:	e8 e0 03 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 8048ab2:	81 c3 ba 57 00 00    	add    $0x57ba,%ebx
        execve_args_t           args;

        int i;

        args.filename.as_len = strlen(filename);
 8048ab8:	8b 45 08             	mov    0x8(%ebp),%eax
 8048abb:	89 04 24             	mov    %eax,(%esp)
 8048abe:	e8 40 06 00 00       	call   8049103 <strlen>
 8048ac3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        args.filename.as_str = filename;
 8048ac6:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ac9:	89 45 d0             	mov    %eax,-0x30(%ebp)

        /* Build argv vector */
        for (i = 0; argv[i] != NULL; i++)
 8048acc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048ad3:	eb 03                	jmp    8048ad8 <execve+0x33>
 8048ad5:	ff 45 f4             	incl   -0xc(%ebp)
 8048ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048adb:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048ae2:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048ae5:	01 d0                	add    %edx,%eax
 8048ae7:	8b 00                	mov    (%eax),%eax
 8048ae9:	85 c0                	test   %eax,%eax
 8048aeb:	75 e8                	jne    8048ad5 <execve+0x30>
                ;
        args.argv.av_len = i;
 8048aed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048af0:	89 45 dc             	mov    %eax,-0x24(%ebp)
        args.argv.av_vec = malloc((args.argv.av_len + 1) * sizeof(argstr_t));
 8048af3:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048af6:	40                   	inc    %eax
 8048af7:	c1 e0 03             	shl    $0x3,%eax
 8048afa:	89 04 24             	mov    %eax,(%esp)
 8048afd:	e8 c5 2a 00 00       	call   804b5c7 <malloc>
 8048b02:	89 45 d8             	mov    %eax,-0x28(%ebp)
        for (i = 0; argv[i] != NULL; i++) {
 8048b05:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048b0c:	eb 49                	jmp    8048b57 <execve+0xb2>
                args.argv.av_vec[i].as_len = strlen(argv[i]);
 8048b0e:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048b11:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048b14:	c1 e2 03             	shl    $0x3,%edx
 8048b17:	8d 34 10             	lea    (%eax,%edx,1),%esi
 8048b1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b1d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048b24:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048b27:	01 d0                	add    %edx,%eax
 8048b29:	8b 00                	mov    (%eax),%eax
 8048b2b:	89 04 24             	mov    %eax,(%esp)
 8048b2e:	e8 d0 05 00 00       	call   8049103 <strlen>
 8048b33:	89 46 04             	mov    %eax,0x4(%esi)
                args.argv.av_vec[i].as_str = argv[i];
 8048b36:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048b39:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048b3c:	c1 e2 03             	shl    $0x3,%edx
 8048b3f:	01 c2                	add    %eax,%edx
 8048b41:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b44:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 8048b4b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048b4e:	01 c8                	add    %ecx,%eax
 8048b50:	8b 00                	mov    (%eax),%eax
 8048b52:	89 02                	mov    %eax,(%edx)
        /* Build argv vector */
        for (i = 0; argv[i] != NULL; i++)
                ;
        args.argv.av_len = i;
        args.argv.av_vec = malloc((args.argv.av_len + 1) * sizeof(argstr_t));
        for (i = 0; argv[i] != NULL; i++) {
 8048b54:	ff 45 f4             	incl   -0xc(%ebp)
 8048b57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b5a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048b61:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048b64:	01 d0                	add    %edx,%eax
 8048b66:	8b 00                	mov    (%eax),%eax
 8048b68:	85 c0                	test   %eax,%eax
 8048b6a:	75 a2                	jne    8048b0e <execve+0x69>
                args.argv.av_vec[i].as_len = strlen(argv[i]);
                args.argv.av_vec[i].as_str = argv[i];
        }
        args.argv.av_vec[i].as_len = 0;
 8048b6c:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048b6f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048b72:	c1 e2 03             	shl    $0x3,%edx
 8048b75:	01 d0                	add    %edx,%eax
 8048b77:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
        args.argv.av_vec[i].as_str = NULL;
 8048b7e:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048b81:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048b84:	c1 e2 03             	shl    $0x3,%edx
 8048b87:	01 d0                	add    %edx,%eax
 8048b89:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

        /* Build envp vector */
        for (i = 0; envp[i] != NULL; i++)
 8048b8f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048b96:	eb 03                	jmp    8048b9b <execve+0xf6>
 8048b98:	ff 45 f4             	incl   -0xc(%ebp)
 8048b9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b9e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048ba5:	8b 45 10             	mov    0x10(%ebp),%eax
 8048ba8:	01 d0                	add    %edx,%eax
 8048baa:	8b 00                	mov    (%eax),%eax
 8048bac:	85 c0                	test   %eax,%eax
 8048bae:	75 e8                	jne    8048b98 <execve+0xf3>
                ;
        args.envp.av_len = i;
 8048bb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048bb3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        args.envp.av_vec = malloc((args.envp.av_len + 1) * sizeof(argstr_t));
 8048bb6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048bb9:	40                   	inc    %eax
 8048bba:	c1 e0 03             	shl    $0x3,%eax
 8048bbd:	89 04 24             	mov    %eax,(%esp)
 8048bc0:	e8 02 2a 00 00       	call   804b5c7 <malloc>
 8048bc5:	89 45 e0             	mov    %eax,-0x20(%ebp)
        for (i = 0; envp[i] != NULL; i++) {
 8048bc8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048bcf:	eb 49                	jmp    8048c1a <execve+0x175>
                args.envp.av_vec[i].as_len = strlen(envp[i]);
 8048bd1:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048bd4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048bd7:	c1 e2 03             	shl    $0x3,%edx
 8048bda:	8d 34 10             	lea    (%eax,%edx,1),%esi
 8048bdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048be0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048be7:	8b 45 10             	mov    0x10(%ebp),%eax
 8048bea:	01 d0                	add    %edx,%eax
 8048bec:	8b 00                	mov    (%eax),%eax
 8048bee:	89 04 24             	mov    %eax,(%esp)
 8048bf1:	e8 0d 05 00 00       	call   8049103 <strlen>
 8048bf6:	89 46 04             	mov    %eax,0x4(%esi)
                args.envp.av_vec[i].as_str = envp[i];
 8048bf9:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048bfc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048bff:	c1 e2 03             	shl    $0x3,%edx
 8048c02:	01 c2                	add    %eax,%edx
 8048c04:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c07:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
 8048c0e:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c11:	01 c8                	add    %ecx,%eax
 8048c13:	8b 00                	mov    (%eax),%eax
 8048c15:	89 02                	mov    %eax,(%edx)
        /* Build envp vector */
        for (i = 0; envp[i] != NULL; i++)
                ;
        args.envp.av_len = i;
        args.envp.av_vec = malloc((args.envp.av_len + 1) * sizeof(argstr_t));
        for (i = 0; envp[i] != NULL; i++) {
 8048c17:	ff 45 f4             	incl   -0xc(%ebp)
 8048c1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c1d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048c24:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c27:	01 d0                	add    %edx,%eax
 8048c29:	8b 00                	mov    (%eax),%eax
 8048c2b:	85 c0                	test   %eax,%eax
 8048c2d:	75 a2                	jne    8048bd1 <execve+0x12c>
                args.envp.av_vec[i].as_len = strlen(envp[i]);
                args.envp.av_vec[i].as_str = envp[i];
        }
        args.envp.av_vec[i].as_len = 0;
 8048c2f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048c32:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c35:	c1 e2 03             	shl    $0x3,%edx
 8048c38:	01 d0                	add    %edx,%eax
 8048c3a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
        args.envp.av_vec[i].as_str = NULL;
 8048c41:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048c44:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c47:	c1 e2 03             	shl    $0x3,%edx
 8048c4a:	01 d0                	add    %edx,%eax
 8048c4c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

        /* Note that we don't need to worry about freeing since we are going to exec
         * (so all our memory will be cleaned up) */

        return trap(SYS_execve, (uint32_t) &args);
 8048c52:	8d 45 d0             	lea    -0x30(%ebp),%eax
 8048c55:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
 8048c5c:	89 45 ec             	mov    %eax,-0x14(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048c5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048c62:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048c65:	cd 2e                	int    $0x2e
 8048c67:	89 45 e8             	mov    %eax,-0x18(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048c6a:	b8 27 00 00 00       	mov    $0x27,%eax
 8048c6f:	cd 2e                	int    $0x2e
 8048c71:	89 c2                	mov    %eax,%edx
 8048c73:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048c79:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048c7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
 8048c7e:	83 c4 40             	add    $0x40,%esp
 8048c81:	5b                   	pop    %ebx
 8048c82:	5e                   	pop    %esi
 8048c83:	5d                   	pop    %ebp
 8048c84:	c3                   	ret    

08048c85 <thr_set_errno>:

void thr_set_errno(int n)
{
 8048c85:	55                   	push   %ebp
 8048c86:	89 e5                	mov    %esp,%ebp
 8048c88:	83 ec 10             	sub    $0x10,%esp
 8048c8b:	e8 fe 01 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048c90:	81 c1 dc 55 00 00    	add    $0x55dc,%ecx
        trap(SYS_set_errno, (uint32_t) n);
 8048c96:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c99:	c7 45 fc 2a 00 00 00 	movl   $0x2a,-0x4(%ebp)
 8048ca0:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048ca3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048ca6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048ca9:	cd 2e                	int    $0x2e
 8048cab:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048cae:	b8 27 00 00 00       	mov    $0x27,%eax
 8048cb3:	cd 2e                	int    $0x2e
 8048cb5:	89 c2                	mov    %eax,%edx
 8048cb7:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048cbd:	89 10                	mov    %edx,(%eax)
}
 8048cbf:	90                   	nop
 8048cc0:	c9                   	leave  
 8048cc1:	c3                   	ret    

08048cc2 <thr_errno>:

int thr_errno(void)
{
 8048cc2:	55                   	push   %ebp
 8048cc3:	89 e5                	mov    %esp,%ebp
 8048cc5:	83 ec 10             	sub    $0x10,%esp
 8048cc8:	e8 c1 01 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048ccd:	81 c1 9f 55 00 00    	add    $0x559f,%ecx
 8048cd3:	c7 45 fc 27 00 00 00 	movl   $0x27,-0x4(%ebp)
 8048cda:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048ce1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048ce4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048ce7:	cd 2e                	int    $0x2e
 8048ce9:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048cec:	b8 27 00 00 00       	mov    $0x27,%eax
 8048cf1:	cd 2e                	int    $0x2e
 8048cf3:	89 c2                	mov    %eax,%edx
 8048cf5:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048cfb:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048cfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
        return trap(SYS_errno, 0);
 8048d00:	90                   	nop
}
 8048d01:	c9                   	leave  
 8048d02:	c3                   	ret    

08048d03 <getdents>:

int getdents(int fd, dirent_t *dir, size_t size)
{
 8048d03:	55                   	push   %ebp
 8048d04:	89 e5                	mov    %esp,%ebp
 8048d06:	83 ec 20             	sub    $0x20,%esp
 8048d09:	e8 80 01 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048d0e:	81 c1 5e 55 00 00    	add    $0x555e,%ecx
        getdents_args_t args;

        args.fd = fd;
 8048d14:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d17:	89 45 e8             	mov    %eax,-0x18(%ebp)
        args.dirp = dir;
 8048d1a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048d1d:	89 45 ec             	mov    %eax,-0x14(%ebp)
        args.count = size;
 8048d20:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d23:	89 45 f0             	mov    %eax,-0x10(%ebp)

        return trap(SYS_getdents, (uint32_t) &args);
 8048d26:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048d29:	c7 45 fc 17 00 00 00 	movl   $0x17,-0x4(%ebp)
 8048d30:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048d33:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048d36:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048d39:	cd 2e                	int    $0x2e
 8048d3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048d3e:	b8 27 00 00 00       	mov    $0x27,%eax
 8048d43:	cd 2e                	int    $0x2e
 8048d45:	89 c2                	mov    %eax,%edx
 8048d47:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048d4d:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048d4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8048d52:	c9                   	leave  
 8048d53:	c3                   	ret    

08048d54 <stat>:
}
#endif /* MOUNTING */

int
stat(const char *path, struct stat *buf)
{
 8048d54:	55                   	push   %ebp
 8048d55:	89 e5                	mov    %esp,%ebp
 8048d57:	53                   	push   %ebx
 8048d58:	83 ec 34             	sub    $0x34,%esp
 8048d5b:	e8 32 01 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 8048d60:	81 c3 0c 55 00 00    	add    $0x550c,%ebx
        stat_args_t args;

        args.path.as_len = strlen(path);
 8048d66:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d69:	89 04 24             	mov    %eax,(%esp)
 8048d6c:	e8 92 03 00 00       	call   8049103 <strlen>
 8048d71:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        args.path.as_str = path;
 8048d74:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d77:	89 45 e0             	mov    %eax,-0x20(%ebp)
        args.buf = buf;
 8048d7a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048d7d:	89 45 e8             	mov    %eax,-0x18(%ebp)

        return trap(SYS_stat, (uint32_t) &args);
 8048d80:	8d 45 e0             	lea    -0x20(%ebp),%eax
 8048d83:	c7 45 f4 2f 00 00 00 	movl   $0x2f,-0xc(%ebp)
 8048d8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048d8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d90:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048d93:	cd 2e                	int    $0x2e
 8048d95:	89 45 ec             	mov    %eax,-0x14(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048d98:	b8 27 00 00 00       	mov    $0x27,%eax
 8048d9d:	cd 2e                	int    $0x2e
 8048d9f:	89 c2                	mov    %eax,%edx
 8048da1:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048da7:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048da9:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
 8048dac:	83 c4 34             	add    $0x34,%esp
 8048daf:	5b                   	pop    %ebx
 8048db0:	5d                   	pop    %ebp
 8048db1:	c3                   	ret    

08048db2 <pipe>:

int
pipe(int pipefd[2])
{
 8048db2:	55                   	push   %ebp
 8048db3:	89 e5                	mov    %esp,%ebp
 8048db5:	83 ec 10             	sub    $0x10,%esp
 8048db8:	e8 d1 00 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048dbd:	81 c1 af 54 00 00    	add    $0x54af,%ecx
        return trap(SYS_pipe, (uint32_t) pipefd);
 8048dc3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048dc6:	c7 45 fc 12 00 00 00 	movl   $0x12,-0x4(%ebp)
 8048dcd:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048dd0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048dd3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048dd6:	cd 2e                	int    $0x2e
 8048dd8:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048ddb:	b8 27 00 00 00       	mov    $0x27,%eax
 8048de0:	cd 2e                	int    $0x2e
 8048de2:	89 c2                	mov    %eax,%edx
 8048de4:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048dea:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048dec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048def:	90                   	nop
}
 8048df0:	c9                   	leave  
 8048df1:	c3                   	ret    

08048df2 <uname>:

int
uname(struct utsname *buf)
{
 8048df2:	55                   	push   %ebp
 8048df3:	89 e5                	mov    %esp,%ebp
 8048df5:	83 ec 10             	sub    $0x10,%esp
 8048df8:	e8 91 00 00 00       	call   8048e8e <__x86.get_pc_thunk.cx>
 8048dfd:	81 c1 6f 54 00 00    	add    $0x546f,%ecx
        return trap(SYS_uname, (uint32_t) buf);
 8048e03:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e06:	c7 45 fc 1c 00 00 00 	movl   $0x1c,-0x4(%ebp)
 8048e0d:	89 45 f8             	mov    %eax,-0x8(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048e10:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e13:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048e16:	cd 2e                	int    $0x2e
 8048e18:	89 45 f4             	mov    %eax,-0xc(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048e1b:	b8 27 00 00 00       	mov    $0x27,%eax
 8048e20:	cd 2e                	int    $0x2e
 8048e22:	89 c2                	mov    %eax,%edx
 8048e24:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048e2a:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048e2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e2f:	90                   	nop
}
 8048e30:	c9                   	leave  
 8048e31:	c3                   	ret    

08048e32 <debug>:

int
debug(const char *str)
{
 8048e32:	55                   	push   %ebp
 8048e33:	89 e5                	mov    %esp,%ebp
 8048e35:	53                   	push   %ebx
 8048e36:	83 ec 34             	sub    $0x34,%esp
 8048e39:	e8 54 00 00 00       	call   8048e92 <__x86.get_pc_thunk.bx>
 8048e3e:	81 c3 2e 54 00 00    	add    $0x542e,%ebx
        argstr_t argstr;
        argstr.as_len = strlen(str);
 8048e44:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e47:	89 04 24             	mov    %eax,(%esp)
 8048e4a:	e8 b4 02 00 00       	call   8049103 <strlen>
 8048e4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
        argstr.as_str = str;
 8048e52:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e55:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        return trap(SYS_debug, (uint32_t) &argstr);
 8048e58:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8048e5b:	c7 45 f4 29 23 00 00 	movl   $0x2329,-0xc(%ebp)
 8048e62:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define TRAP_INTR_STRING QUOTE(INTR_SYSCALL)

static inline int trap(uint32_t num, uint32_t arg)
{
        int ret;
        __asm__ volatile(
 8048e65:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e68:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048e6b:	cd 2e                	int    $0x2e
 8048e6d:	89 45 ec             	mov    %eax,-0x14(%ebp)
                "int $" TRAP_INTR_STRING
                : "=a"(ret)
                : "a"(num), "d"(arg)
        );
        /* Copy in errno */
        __asm__ volatile(
 8048e70:	b8 27 00 00 00       	mov    $0x27,%eax
 8048e75:	cd 2e                	int    $0x2e
 8048e77:	89 c2                	mov    %eax,%edx
 8048e79:	8d 05 84 e3 04 08    	lea    0x804e384,%eax
 8048e7f:	89 10                	mov    %edx,(%eax)
                "int $" TRAP_INTR_STRING
                : "=a"(errno)
                : "a"(SYS_errno)
        );
        return ret;
 8048e81:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
 8048e84:	83 c4 34             	add    $0x34,%esp
 8048e87:	5b                   	pop    %ebx
 8048e88:	5d                   	pop    %ebp
 8048e89:	c3                   	ret    

08048e8a <__x86.get_pc_thunk.ax>:
 8048e8a:	8b 04 24             	mov    (%esp),%eax
 8048e8d:	c3                   	ret    

08048e8e <__x86.get_pc_thunk.cx>:
 8048e8e:	8b 0c 24             	mov    (%esp),%ecx
 8048e91:	c3                   	ret    

08048e92 <__x86.get_pc_thunk.bx>:
 8048e92:	8b 1c 24             	mov    (%esp),%ebx
 8048e95:	c3                   	ret    

08048e96 <memcmp>:
#include "stdlib.h"
#include "string.h"
#include "errno.h"

int memcmp(const void *cs, const void *ct, size_t count)
{
 8048e96:	55                   	push   %ebp
 8048e97:	89 e5                	mov    %esp,%ebp
 8048e99:	83 ec 10             	sub    $0x10,%esp
 8048e9c:	e8 e9 ff ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8048ea1:	05 cb 53 00 00       	add    $0x53cb,%eax
        const unsigned char *su1, *su2;
        signed char res = 0;
 8048ea6:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)

        for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
 8048eaa:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ead:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048eb0:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048eb3:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048eb6:	eb 22                	jmp    8048eda <memcmp+0x44>
                if ((res = *su1 - *su2) != 0)
 8048eb8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048ebb:	0f b6 10             	movzbl (%eax),%edx
 8048ebe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048ec1:	0f b6 00             	movzbl (%eax),%eax
 8048ec4:	28 c2                	sub    %al,%dl
 8048ec6:	88 d0                	mov    %dl,%al
 8048ec8:	88 45 f7             	mov    %al,-0x9(%ebp)
 8048ecb:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
 8048ecf:	75 11                	jne    8048ee2 <memcmp+0x4c>
int memcmp(const void *cs, const void *ct, size_t count)
{
        const unsigned char *su1, *su2;
        signed char res = 0;

        for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
 8048ed1:	ff 45 fc             	incl   -0x4(%ebp)
 8048ed4:	ff 45 f8             	incl   -0x8(%ebp)
 8048ed7:	ff 4d 10             	decl   0x10(%ebp)
 8048eda:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8048ede:	75 d8                	jne    8048eb8 <memcmp+0x22>
 8048ee0:	eb 01                	jmp    8048ee3 <memcmp+0x4d>
                if ((res = *su1 - *su2) != 0)
                        break;
 8048ee2:	90                   	nop
        return res;
 8048ee3:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
}
 8048ee7:	c9                   	leave  
 8048ee8:	c3                   	ret    

08048ee9 <memcpy>:

void *memcpy(void *dest, const void *src, size_t count)
{
 8048ee9:	55                   	push   %ebp
 8048eea:	89 e5                	mov    %esp,%ebp
 8048eec:	83 ec 10             	sub    $0x10,%esp
 8048eef:	e8 96 ff ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8048ef4:	05 78 53 00 00       	add    $0x5378,%eax
        char *tmp = (char *) dest;
 8048ef9:	8b 45 08             	mov    0x8(%ebp),%eax
 8048efc:	89 45 fc             	mov    %eax,-0x4(%ebp)
        const char *s = src;
 8048eff:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f02:	89 45 f8             	mov    %eax,-0x8(%ebp)

        while (count--)
 8048f05:	eb 17                	jmp    8048f1e <memcpy+0x35>
                *tmp++ = *s++;
 8048f07:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048f0a:	8d 50 01             	lea    0x1(%eax),%edx
 8048f0d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 8048f10:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048f13:	8d 4a 01             	lea    0x1(%edx),%ecx
 8048f16:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 8048f19:	0f b6 12             	movzbl (%edx),%edx
 8048f1c:	88 10                	mov    %dl,(%eax)
void *memcpy(void *dest, const void *src, size_t count)
{
        char *tmp = (char *) dest;
        const char *s = src;

        while (count--)
 8048f1e:	8b 45 10             	mov    0x10(%ebp),%eax
 8048f21:	8d 50 ff             	lea    -0x1(%eax),%edx
 8048f24:	89 55 10             	mov    %edx,0x10(%ebp)
 8048f27:	85 c0                	test   %eax,%eax
 8048f29:	75 dc                	jne    8048f07 <memcpy+0x1e>
                *tmp++ = *s++;

        return dest;
 8048f2b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8048f2e:	c9                   	leave  
 8048f2f:	c3                   	ret    

08048f30 <strncmp>:

int strncmp(const char *cs, const char *ct, size_t count)
{
 8048f30:	55                   	push   %ebp
 8048f31:	89 e5                	mov    %esp,%ebp
 8048f33:	53                   	push   %ebx
 8048f34:	e8 51 ff ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8048f39:	05 33 53 00 00       	add    $0x5333,%eax
        register signed char __res = 0;
 8048f3e:	b3 00                	mov    $0x0,%bl

        while (count) {
 8048f40:	eb 31                	jmp    8048f73 <strncmp+0x43>
                if ((__res = *cs - *ct++) != 0 || !*cs++)
 8048f42:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f45:	0f b6 00             	movzbl (%eax),%eax
 8048f48:	88 c1                	mov    %al,%cl
 8048f4a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f4d:	8d 50 01             	lea    0x1(%eax),%edx
 8048f50:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048f53:	0f b6 00             	movzbl (%eax),%eax
 8048f56:	28 c1                	sub    %al,%cl
 8048f58:	88 c8                	mov    %cl,%al
 8048f5a:	88 c3                	mov    %al,%bl
 8048f5c:	84 db                	test   %bl,%bl
 8048f5e:	75 19                	jne    8048f79 <strncmp+0x49>
 8048f60:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f63:	8d 50 01             	lea    0x1(%eax),%edx
 8048f66:	89 55 08             	mov    %edx,0x8(%ebp)
 8048f69:	0f b6 00             	movzbl (%eax),%eax
 8048f6c:	84 c0                	test   %al,%al
 8048f6e:	74 09                	je     8048f79 <strncmp+0x49>
                        break;
                count--;
 8048f70:	ff 4d 10             	decl   0x10(%ebp)

int strncmp(const char *cs, const char *ct, size_t count)
{
        register signed char __res = 0;

        while (count) {
 8048f73:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8048f77:	75 c9                	jne    8048f42 <strncmp+0x12>
                if ((__res = *cs - *ct++) != 0 || !*cs++)
                        break;
                count--;
        }

        return __res;
 8048f79:	0f be c3             	movsbl %bl,%eax
}
 8048f7c:	5b                   	pop    %ebx
 8048f7d:	5d                   	pop    %ebp
 8048f7e:	c3                   	ret    

08048f7f <strcmp>:

int strcmp(const char *cs, const char *ct)
{
 8048f7f:	55                   	push   %ebp
 8048f80:	89 e5                	mov    %esp,%ebp
 8048f82:	53                   	push   %ebx
 8048f83:	e8 02 ff ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8048f88:	05 e4 52 00 00       	add    $0x52e4,%eax
        register signed char __res;

        while (1) {
                if ((__res = *cs - *ct++) != 0 || !*cs++)
 8048f8d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f90:	0f b6 00             	movzbl (%eax),%eax
 8048f93:	88 c1                	mov    %al,%cl
 8048f95:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f98:	8d 50 01             	lea    0x1(%eax),%edx
 8048f9b:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048f9e:	0f b6 00             	movzbl (%eax),%eax
 8048fa1:	28 c1                	sub    %al,%cl
 8048fa3:	88 c8                	mov    %cl,%al
 8048fa5:	88 c3                	mov    %al,%bl
 8048fa7:	84 db                	test   %bl,%bl
 8048fa9:	75 12                	jne    8048fbd <strcmp+0x3e>
 8048fab:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fae:	8d 50 01             	lea    0x1(%eax),%edx
 8048fb1:	89 55 08             	mov    %edx,0x8(%ebp)
 8048fb4:	0f b6 00             	movzbl (%eax),%eax
 8048fb7:	84 c0                	test   %al,%al
 8048fb9:	74 02                	je     8048fbd <strcmp+0x3e>
                        break;
        }
 8048fbb:	eb d0                	jmp    8048f8d <strcmp+0xe>

        return __res;
 8048fbd:	0f be c3             	movsbl %bl,%eax
}
 8048fc0:	5b                   	pop    %ebx
 8048fc1:	5d                   	pop    %ebp
 8048fc2:	c3                   	ret    

08048fc3 <strcpy>:

char *strcpy(char *dest, const char *src)
{
 8048fc3:	55                   	push   %ebp
 8048fc4:	89 e5                	mov    %esp,%ebp
 8048fc6:	83 ec 10             	sub    $0x10,%esp
 8048fc9:	e8 bc fe ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8048fce:	05 9e 52 00 00       	add    $0x529e,%eax
        char *tmp = dest;
 8048fd3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fd6:	89 45 fc             	mov    %eax,-0x4(%ebp)

        while ((*dest++ = *src++) != '\0')
 8048fd9:	90                   	nop
 8048fda:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fdd:	8d 50 01             	lea    0x1(%eax),%edx
 8048fe0:	89 55 08             	mov    %edx,0x8(%ebp)
 8048fe3:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048fe6:	8d 4a 01             	lea    0x1(%edx),%ecx
 8048fe9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 8048fec:	0f b6 12             	movzbl (%edx),%edx
 8048fef:	88 10                	mov    %dl,(%eax)
 8048ff1:	0f b6 00             	movzbl (%eax),%eax
 8048ff4:	84 c0                	test   %al,%al
 8048ff6:	75 e2                	jne    8048fda <strcpy+0x17>
                /* nothing */;
        return tmp;
 8048ff8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8048ffb:	c9                   	leave  
 8048ffc:	c3                   	ret    

08048ffd <strncpy>:

char *strncpy(char *dest, const char *src, size_t count)
{
 8048ffd:	55                   	push   %ebp
 8048ffe:	89 e5                	mov    %esp,%ebp
 8049000:	83 ec 10             	sub    $0x10,%esp
 8049003:	e8 82 fe ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8049008:	05 64 52 00 00       	add    $0x5264,%eax
        char *tmp = dest;
 804900d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049010:	89 45 fc             	mov    %eax,-0x4(%ebp)

        while (count-- && (*dest++ = *src++) != '\0')
 8049013:	90                   	nop
 8049014:	8b 45 10             	mov    0x10(%ebp),%eax
 8049017:	8d 50 ff             	lea    -0x1(%eax),%edx
 804901a:	89 55 10             	mov    %edx,0x10(%ebp)
 804901d:	85 c0                	test   %eax,%eax
 804901f:	74 1e                	je     804903f <strncpy+0x42>
 8049021:	8b 45 08             	mov    0x8(%ebp),%eax
 8049024:	8d 50 01             	lea    0x1(%eax),%edx
 8049027:	89 55 08             	mov    %edx,0x8(%ebp)
 804902a:	8b 55 0c             	mov    0xc(%ebp),%edx
 804902d:	8d 4a 01             	lea    0x1(%edx),%ecx
 8049030:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 8049033:	0f b6 12             	movzbl (%edx),%edx
 8049036:	88 10                	mov    %dl,(%eax)
 8049038:	0f b6 00             	movzbl (%eax),%eax
 804903b:	84 c0                	test   %al,%al
 804903d:	75 d5                	jne    8049014 <strncpy+0x17>
                /* nothing */;

        return tmp;
 804903f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049042:	c9                   	leave  
 8049043:	c3                   	ret    

08049044 <memset>:

void *memset(void *s, int c, size_t count)
{
 8049044:	55                   	push   %ebp
 8049045:	89 e5                	mov    %esp,%ebp
 8049047:	83 ec 10             	sub    $0x10,%esp
 804904a:	e8 3b fe ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 804904f:	05 1d 52 00 00       	add    $0x521d,%eax
        char *xs = (char *) s;
 8049054:	8b 45 08             	mov    0x8(%ebp),%eax
 8049057:	89 45 fc             	mov    %eax,-0x4(%ebp)

        while (count--)
 804905a:	eb 0e                	jmp    804906a <memset+0x26>
                *xs++ = c;
 804905c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804905f:	8d 50 01             	lea    0x1(%eax),%edx
 8049062:	89 55 fc             	mov    %edx,-0x4(%ebp)
 8049065:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049068:	88 10                	mov    %dl,(%eax)

void *memset(void *s, int c, size_t count)
{
        char *xs = (char *) s;

        while (count--)
 804906a:	8b 45 10             	mov    0x10(%ebp),%eax
 804906d:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049070:	89 55 10             	mov    %edx,0x10(%ebp)
 8049073:	85 c0                	test   %eax,%eax
 8049075:	75 e5                	jne    804905c <memset+0x18>
                *xs++ = c;

        return s;
 8049077:	8b 45 08             	mov    0x8(%ebp),%eax
}
 804907a:	c9                   	leave  
 804907b:	c3                   	ret    

0804907c <strnlen>:

size_t strnlen(const char *s, size_t count)
{
 804907c:	55                   	push   %ebp
 804907d:	89 e5                	mov    %esp,%ebp
 804907f:	83 ec 10             	sub    $0x10,%esp
 8049082:	e8 03 fe ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8049087:	05 e5 51 00 00       	add    $0x51e5,%eax
        const char *sc;

        for (sc = s; count-- && *sc != '\0'; ++sc)
 804908c:	8b 45 08             	mov    0x8(%ebp),%eax
 804908f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049092:	eb 03                	jmp    8049097 <strnlen+0x1b>
 8049094:	ff 45 fc             	incl   -0x4(%ebp)
 8049097:	8b 45 0c             	mov    0xc(%ebp),%eax
 804909a:	8d 50 ff             	lea    -0x1(%eax),%edx
 804909d:	89 55 0c             	mov    %edx,0xc(%ebp)
 80490a0:	85 c0                	test   %eax,%eax
 80490a2:	74 0a                	je     80490ae <strnlen+0x32>
 80490a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80490a7:	0f b6 00             	movzbl (%eax),%eax
 80490aa:	84 c0                	test   %al,%al
 80490ac:	75 e6                	jne    8049094 <strnlen+0x18>
                /* nothing */;
        return sc - s;
 80490ae:	8b 55 fc             	mov    -0x4(%ebp),%edx
 80490b1:	8b 45 08             	mov    0x8(%ebp),%eax
 80490b4:	29 c2                	sub    %eax,%edx
 80490b6:	89 d0                	mov    %edx,%eax
}
 80490b8:	c9                   	leave  
 80490b9:	c3                   	ret    

080490ba <strcat>:


char *strcat(char *dest, const char *src)
{
 80490ba:	55                   	push   %ebp
 80490bb:	89 e5                	mov    %esp,%ebp
 80490bd:	83 ec 10             	sub    $0x10,%esp
 80490c0:	e8 c5 fd ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 80490c5:	05 a7 51 00 00       	add    $0x51a7,%eax
        char *tmp = dest;
 80490ca:	8b 45 08             	mov    0x8(%ebp),%eax
 80490cd:	89 45 fc             	mov    %eax,-0x4(%ebp)

        while (*dest)
 80490d0:	eb 03                	jmp    80490d5 <strcat+0x1b>
                dest++;
 80490d2:	ff 45 08             	incl   0x8(%ebp)

char *strcat(char *dest, const char *src)
{
        char *tmp = dest;

        while (*dest)
 80490d5:	8b 45 08             	mov    0x8(%ebp),%eax
 80490d8:	0f b6 00             	movzbl (%eax),%eax
 80490db:	84 c0                	test   %al,%al
 80490dd:	75 f3                	jne    80490d2 <strcat+0x18>
                dest++;

        while ((*dest++ = *src++) != '\0');
 80490df:	90                   	nop
 80490e0:	8b 45 08             	mov    0x8(%ebp),%eax
 80490e3:	8d 50 01             	lea    0x1(%eax),%edx
 80490e6:	89 55 08             	mov    %edx,0x8(%ebp)
 80490e9:	8b 55 0c             	mov    0xc(%ebp),%edx
 80490ec:	8d 4a 01             	lea    0x1(%edx),%ecx
 80490ef:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 80490f2:	0f b6 12             	movzbl (%edx),%edx
 80490f5:	88 10                	mov    %dl,(%eax)
 80490f7:	0f b6 00             	movzbl (%eax),%eax
 80490fa:	84 c0                	test   %al,%al
 80490fc:	75 e2                	jne    80490e0 <strcat+0x26>

        return tmp;
 80490fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8049101:	c9                   	leave  
 8049102:	c3                   	ret    

08049103 <strlen>:

size_t strlen(const char *s)
{
 8049103:	55                   	push   %ebp
 8049104:	89 e5                	mov    %esp,%ebp
 8049106:	83 ec 10             	sub    $0x10,%esp
 8049109:	e8 7c fd ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 804910e:	05 5e 51 00 00       	add    $0x515e,%eax
        const char *sc;

        for (sc = s; *sc != '\0'; ++sc)
 8049113:	8b 45 08             	mov    0x8(%ebp),%eax
 8049116:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049119:	eb 03                	jmp    804911e <strlen+0x1b>
 804911b:	ff 45 fc             	incl   -0x4(%ebp)
 804911e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049121:	0f b6 00             	movzbl (%eax),%eax
 8049124:	84 c0                	test   %al,%al
 8049126:	75 f3                	jne    804911b <strlen+0x18>
                /* nothing */;
        return sc - s;
 8049128:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804912b:	8b 45 08             	mov    0x8(%ebp),%eax
 804912e:	29 c2                	sub    %eax,%edx
 8049130:	89 d0                	mov    %edx,%eax
}
 8049132:	c9                   	leave  
 8049133:	c3                   	ret    

08049134 <strchr>:

char *strchr(const char *s, int c)
{
 8049134:	55                   	push   %ebp
 8049135:	89 e5                	mov    %esp,%ebp
 8049137:	e8 4e fd ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 804913c:	05 30 51 00 00       	add    $0x5130,%eax
        for (; *s != (char) c; ++s)
 8049141:	eb 14                	jmp    8049157 <strchr+0x23>
                if (*s == '\0')
 8049143:	8b 45 08             	mov    0x8(%ebp),%eax
 8049146:	0f b6 00             	movzbl (%eax),%eax
 8049149:	84 c0                	test   %al,%al
 804914b:	75 07                	jne    8049154 <strchr+0x20>
                        return NULL;
 804914d:	b8 00 00 00 00       	mov    $0x0,%eax
 8049152:	eb 13                	jmp    8049167 <strchr+0x33>
        return sc - s;
}

char *strchr(const char *s, int c)
{
        for (; *s != (char) c; ++s)
 8049154:	ff 45 08             	incl   0x8(%ebp)
 8049157:	8b 45 08             	mov    0x8(%ebp),%eax
 804915a:	0f b6 00             	movzbl (%eax),%eax
 804915d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049160:	38 d0                	cmp    %dl,%al
 8049162:	75 df                	jne    8049143 <strchr+0xf>
                if (*s == '\0')
                        return NULL;
        return (char *)s;
 8049164:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8049167:	5d                   	pop    %ebp
 8049168:	c3                   	ret    

08049169 <strrchr>:

char *strrchr(const char *s, int c)
{
 8049169:	55                   	push   %ebp
 804916a:	89 e5                	mov    %esp,%ebp
 804916c:	83 ec 10             	sub    $0x10,%esp
 804916f:	e8 16 fd ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8049174:	05 f8 50 00 00       	add    $0x50f8,%eax
        char *r = NULL;
 8049179:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
        for (; *s; ++s)
 8049180:	eb 16                	jmp    8049198 <strrchr+0x2f>
                if (*s == (char)c)
 8049182:	8b 45 08             	mov    0x8(%ebp),%eax
 8049185:	0f b6 00             	movzbl (%eax),%eax
 8049188:	8b 55 0c             	mov    0xc(%ebp),%edx
 804918b:	38 d0                	cmp    %dl,%al
 804918d:	75 06                	jne    8049195 <strrchr+0x2c>
                        r = (char *)s;
 804918f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049192:	89 45 fc             	mov    %eax,-0x4(%ebp)
}

char *strrchr(const char *s, int c)
{
        char *r = NULL;
        for (; *s; ++s)
 8049195:	ff 45 08             	incl   0x8(%ebp)
 8049198:	8b 45 08             	mov    0x8(%ebp),%eax
 804919b:	0f b6 00             	movzbl (%eax),%eax
 804919e:	84 c0                	test   %al,%al
 80491a0:	75 e0                	jne    8049182 <strrchr+0x19>
                if (*s == (char)c)
                        r = (char *)s;
        return r;
 80491a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 80491a5:	c9                   	leave  
 80491a6:	c3                   	ret    

080491a7 <strstr>:

char *strstr(const char *s1, const char *s2)
{
 80491a7:	55                   	push   %ebp
 80491a8:	89 e5                	mov    %esp,%ebp
 80491aa:	53                   	push   %ebx
 80491ab:	83 ec 24             	sub    $0x24,%esp
 80491ae:	e8 df fc ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 80491b3:	81 c3 b9 50 00 00    	add    $0x50b9,%ebx
        int l1, l2;

        l2 = strlen(s2);
 80491b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491bc:	89 04 24             	mov    %eax,(%esp)
 80491bf:	e8 3f ff ff ff       	call   8049103 <strlen>
 80491c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (!l2)
 80491c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80491cb:	75 05                	jne    80491d2 <strstr+0x2b>
                return (char *) s1;
 80491cd:	8b 45 08             	mov    0x8(%ebp),%eax
 80491d0:	eb 45                	jmp    8049217 <strstr+0x70>
        l1 = strlen(s1);
 80491d2:	8b 45 08             	mov    0x8(%ebp),%eax
 80491d5:	89 04 24             	mov    %eax,(%esp)
 80491d8:	e8 26 ff ff ff       	call   8049103 <strlen>
 80491dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
        while (l1 >= l2) {
 80491e0:	eb 28                	jmp    804920a <strstr+0x63>
                l1--;
 80491e2:	ff 4d f4             	decl   -0xc(%ebp)
                if (!memcmp(s1, s2, l2))
 80491e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80491e8:	89 44 24 08          	mov    %eax,0x8(%esp)
 80491ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 80491f3:	8b 45 08             	mov    0x8(%ebp),%eax
 80491f6:	89 04 24             	mov    %eax,(%esp)
 80491f9:	e8 98 fc ff ff       	call   8048e96 <memcmp>
 80491fe:	85 c0                	test   %eax,%eax
 8049200:	75 05                	jne    8049207 <strstr+0x60>
                        return (char *) s1;
 8049202:	8b 45 08             	mov    0x8(%ebp),%eax
 8049205:	eb 10                	jmp    8049217 <strstr+0x70>
                s1++;
 8049207:	ff 45 08             	incl   0x8(%ebp)

        l2 = strlen(s2);
        if (!l2)
                return (char *) s1;
        l1 = strlen(s1);
        while (l1 >= l2) {
 804920a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804920d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049210:	7d d0                	jge    80491e2 <strstr+0x3b>
                l1--;
                if (!memcmp(s1, s2, l2))
                        return (char *) s1;
                s1++;
        }
        return NULL;
 8049212:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8049217:	83 c4 24             	add    $0x24,%esp
 804921a:	5b                   	pop    %ebx
 804921b:	5d                   	pop    %ebp
 804921c:	c3                   	ret    

0804921d <strdup>:

char *strdup(const char *s)
{
 804921d:	55                   	push   %ebp
 804921e:	89 e5                	mov    %esp,%ebp
 8049220:	e8 65 fc ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8049225:	05 47 50 00 00       	add    $0x5047,%eax
        /* TODO - alvin */
        return NULL;
 804922a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 804922f:	5d                   	pop    %ebp
 8049230:	c3                   	ret    

08049231 <strpbrk>:
 * Got this from /onnv-gate/usr/src/common/uti/string.c.
 */

char *
strpbrk(const char *string, const char *brkset)
{
 8049231:	55                   	push   %ebp
 8049232:	89 e5                	mov    %esp,%ebp
 8049234:	83 ec 10             	sub    $0x10,%esp
 8049237:	e8 4e fc ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 804923c:	05 30 50 00 00       	add    $0x5030,%eax
        const char *p;

        do {
                for (p = brkset; *p != '\0' && *p != *string; ++p)
 8049241:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049244:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049247:	eb 03                	jmp    804924c <strpbrk+0x1b>
 8049249:	ff 45 fc             	incl   -0x4(%ebp)
 804924c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804924f:	0f b6 00             	movzbl (%eax),%eax
 8049252:	84 c0                	test   %al,%al
 8049254:	74 10                	je     8049266 <strpbrk+0x35>
 8049256:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049259:	0f b6 10             	movzbl (%eax),%edx
 804925c:	8b 45 08             	mov    0x8(%ebp),%eax
 804925f:	0f b6 00             	movzbl (%eax),%eax
 8049262:	38 c2                	cmp    %al,%dl
 8049264:	75 e3                	jne    8049249 <strpbrk+0x18>
                        ;
                if (*p != '\0')
 8049266:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049269:	0f b6 00             	movzbl (%eax),%eax
 804926c:	84 c0                	test   %al,%al
 804926e:	74 05                	je     8049275 <strpbrk+0x44>
                        return ((char *)string);
 8049270:	8b 45 08             	mov    0x8(%ebp),%eax
 8049273:	eb 15                	jmp    804928a <strpbrk+0x59>
        } while (*string++);
 8049275:	8b 45 08             	mov    0x8(%ebp),%eax
 8049278:	8d 50 01             	lea    0x1(%eax),%edx
 804927b:	89 55 08             	mov    %edx,0x8(%ebp)
 804927e:	0f b6 00             	movzbl (%eax),%eax
 8049281:	84 c0                	test   %al,%al
 8049283:	75 bc                	jne    8049241 <strpbrk+0x10>

        return (NULL);
 8049285:	b8 00 00 00 00       	mov    $0x0,%eax
}
 804928a:	c9                   	leave  
 804928b:	c3                   	ret    

0804928c <strspn>:

size_t
strspn(const char *string, const char *charset)
{
 804928c:	55                   	push   %ebp
 804928d:	89 e5                	mov    %esp,%ebp
 804928f:	83 ec 10             	sub    $0x10,%esp
 8049292:	e8 f3 fb ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8049297:	05 d5 4f 00 00       	add    $0x4fd5,%eax
        const char *p, *q;

        for (q = string; *q != '\0'; ++q) {
 804929c:	8b 45 08             	mov    0x8(%ebp),%eax
 804929f:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80492a2:	eb 32                	jmp    80492d6 <strspn+0x4a>
                for (p = charset; *p != '\0' && *p != *q; ++p)
 80492a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80492aa:	eb 03                	jmp    80492af <strspn+0x23>
 80492ac:	ff 45 fc             	incl   -0x4(%ebp)
 80492af:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492b2:	0f b6 00             	movzbl (%eax),%eax
 80492b5:	84 c0                	test   %al,%al
 80492b7:	74 10                	je     80492c9 <strspn+0x3d>
 80492b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492bc:	0f b6 10             	movzbl (%eax),%edx
 80492bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80492c2:	0f b6 00             	movzbl (%eax),%eax
 80492c5:	38 c2                	cmp    %al,%dl
 80492c7:	75 e3                	jne    80492ac <strspn+0x20>
                        ;
                if (*p == '\0')
 80492c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492cc:	0f b6 00             	movzbl (%eax),%eax
 80492cf:	84 c0                	test   %al,%al
 80492d1:	74 0f                	je     80492e2 <strspn+0x56>
size_t
strspn(const char *string, const char *charset)
{
        const char *p, *q;

        for (q = string; *q != '\0'; ++q) {
 80492d3:	ff 45 f8             	incl   -0x8(%ebp)
 80492d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80492d9:	0f b6 00             	movzbl (%eax),%eax
 80492dc:	84 c0                	test   %al,%al
 80492de:	75 c4                	jne    80492a4 <strspn+0x18>
 80492e0:	eb 01                	jmp    80492e3 <strspn+0x57>
                for (p = charset; *p != '\0' && *p != *q; ++p)
                        ;
                if (*p == '\0')
                        break;
 80492e2:	90                   	nop
        }

        return (q - string);
 80492e3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80492e6:	8b 45 08             	mov    0x8(%ebp),%eax
 80492e9:	29 c2                	sub    %eax,%edx
 80492eb:	89 d0                	mov    %edx,%eax
}
 80492ed:	c9                   	leave  
 80492ee:	c3                   	ret    

080492ef <strtok>:

char *
strtok(char *string, const char *sepset)
{
 80492ef:	55                   	push   %ebp
 80492f0:	89 e5                	mov    %esp,%ebp
 80492f2:	53                   	push   %ebx
 80492f3:	83 ec 24             	sub    $0x24,%esp
 80492f6:	e8 97 fb ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 80492fb:	81 c3 71 4f 00 00    	add    $0x4f71,%ebx
        static char     *savept;

        /*
         * Set `p' to our current location in the string.
         */
        p = (string == NULL) ? savept : string;
 8049301:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049305:	75 08                	jne    804930f <strtok+0x20>
 8049307:	8b 83 b8 00 00 00    	mov    0xb8(%ebx),%eax
 804930d:	eb 03                	jmp    8049312 <strtok+0x23>
 804930f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049312:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (p == NULL)
 8049315:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049319:	75 07                	jne    8049322 <strtok+0x33>
                return (NULL);
 804931b:	b8 00 00 00 00       	mov    $0x0,%eax
 8049320:	eb 69                	jmp    804938b <strtok+0x9c>

        /*
         * Skip leading separators; bail if no tokens remain.
         */
        q = p + strspn(p, sepset);
 8049322:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049325:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049329:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804932c:	89 04 24             	mov    %eax,(%esp)
 804932f:	e8 58 ff ff ff       	call   804928c <strspn>
 8049334:	89 c2                	mov    %eax,%edx
 8049336:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049339:	01 d0                	add    %edx,%eax
 804933b:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (*q == '\0')
 804933e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049341:	0f b6 00             	movzbl (%eax),%eax
 8049344:	84 c0                	test   %al,%al
 8049346:	75 07                	jne    804934f <strtok+0x60>
                return (NULL);
 8049348:	b8 00 00 00 00       	mov    $0x0,%eax
 804934d:	eb 3c                	jmp    804938b <strtok+0x9c>

        /*
         * Mark the end of the token and set `savept' for the next iteration.
         */
        if ((r = strpbrk(q, sepset)) == NULL)
 804934f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049352:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049356:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049359:	89 04 24             	mov    %eax,(%esp)
 804935c:	e8 d0 fe ff ff       	call   8049231 <strpbrk>
 8049361:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049364:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8049368:	75 0c                	jne    8049376 <strtok+0x87>
                savept = NULL;
 804936a:	c7 83 b8 00 00 00 00 	movl   $0x0,0xb8(%ebx)
 8049371:	00 00 00 
 8049374:	eb 12                	jmp    8049388 <strtok+0x99>
        else {
                *r = '\0';
 8049376:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049379:	c6 00 00             	movb   $0x0,(%eax)
                savept = ++r;
 804937c:	ff 45 ec             	incl   -0x14(%ebp)
 804937f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049382:	89 83 b8 00 00 00    	mov    %eax,0xb8(%ebx)
        }

        return (q);
 8049388:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 804938b:	83 c4 24             	add    $0x24,%esp
 804938e:	5b                   	pop    %ebx
 804938f:	5d                   	pop    %ebp
 8049390:	c3                   	ret    

08049391 <strerror>:

/* created with the help of:
 * perl -p -e 's/#define\s+(\w+)\s+\d+\s+\/\* ([^\t\*]+)\s*\*\/\s*$/case $1: return "$2";\n/' < /usr/include/sys/errno.h
 */
char *strerror(int errnum)
{
 8049391:	55                   	push   %ebp
 8049392:	89 e5                	mov    %esp,%ebp
 8049394:	e8 f1 fa ff ff       	call   8048e8a <__x86.get_pc_thunk.ax>
 8049399:	05 d3 4e 00 00       	add    $0x4ed3,%eax
        switch (errnum) {
 804939e:	81 7d 08 83 00 00 00 	cmpl   $0x83,0x8(%ebp)
 80493a5:	0f 87 e8 04 00 00    	ja     8049893 <.L90>
 80493ab:	8b 55 08             	mov    0x8(%ebp),%edx
 80493ae:	c1 e2 02             	shl    $0x2,%edx
 80493b1:	8b 94 02 bc e0 ff ff 	mov    -0x1f44(%edx,%eax,1),%edx
 80493b8:	01 c2                	add    %eax,%edx
 80493ba:	ff e2                	jmp    *%edx

080493bc <.L91>:
                case EPERM: return "Not super-user";
 80493bc:	8d 80 00 d6 ff ff    	lea    -0x2a00(%eax),%eax
 80493c2:	e9 d1 04 00 00       	jmp    8049898 <.L90+0x5>

080493c7 <.L93>:
                case ENOENT: return "No such file or directory";
 80493c7:	8d 80 0f d6 ff ff    	lea    -0x29f1(%eax),%eax
 80493cd:	e9 c6 04 00 00       	jmp    8049898 <.L90+0x5>

080493d2 <.L94>:
                case ESRCH: return "No such process";
 80493d2:	8d 80 29 d6 ff ff    	lea    -0x29d7(%eax),%eax
 80493d8:	e9 bb 04 00 00       	jmp    8049898 <.L90+0x5>

080493dd <.L95>:
                case EINTR: return "interrupted system call";
 80493dd:	8d 80 39 d6 ff ff    	lea    -0x29c7(%eax),%eax
 80493e3:	e9 b0 04 00 00       	jmp    8049898 <.L90+0x5>

080493e8 <.L96>:
                case EIO: return "I/O error";
 80493e8:	8d 80 51 d6 ff ff    	lea    -0x29af(%eax),%eax
 80493ee:	e9 a5 04 00 00       	jmp    8049898 <.L90+0x5>

080493f3 <.L97>:
                case ENXIO: return "No such device or address";
 80493f3:	8d 80 5b d6 ff ff    	lea    -0x29a5(%eax),%eax
 80493f9:	e9 9a 04 00 00       	jmp    8049898 <.L90+0x5>

080493fe <.L98>:
                case E2BIG: return "Arg list too long";
 80493fe:	8d 80 75 d6 ff ff    	lea    -0x298b(%eax),%eax
 8049404:	e9 8f 04 00 00       	jmp    8049898 <.L90+0x5>

08049409 <.L99>:
                case ENOEXEC: return "Exec format error";
 8049409:	8d 80 87 d6 ff ff    	lea    -0x2979(%eax),%eax
 804940f:	e9 84 04 00 00       	jmp    8049898 <.L90+0x5>

08049414 <.L100>:
                case EBADF: return "Bad file number";
 8049414:	8d 80 99 d6 ff ff    	lea    -0x2967(%eax),%eax
 804941a:	e9 79 04 00 00       	jmp    8049898 <.L90+0x5>

0804941f <.L101>:
                case ECHILD: return "No children";
 804941f:	8d 80 a9 d6 ff ff    	lea    -0x2957(%eax),%eax
 8049425:	e9 6e 04 00 00       	jmp    8049898 <.L90+0x5>

0804942a <.L102>:
                case EAGAIN: return "Resource temporarily unavailable";
 804942a:	8d 80 b8 d6 ff ff    	lea    -0x2948(%eax),%eax
 8049430:	e9 63 04 00 00       	jmp    8049898 <.L90+0x5>

08049435 <.L103>:
                case ENOMEM: return "Not enough core";
 8049435:	8d 80 d9 d6 ff ff    	lea    -0x2927(%eax),%eax
 804943b:	e9 58 04 00 00       	jmp    8049898 <.L90+0x5>

08049440 <.L104>:
                case EACCES: return "Permission denied";
 8049440:	8d 80 e9 d6 ff ff    	lea    -0x2917(%eax),%eax
 8049446:	e9 4d 04 00 00       	jmp    8049898 <.L90+0x5>

0804944b <.L105>:
                case EFAULT: return "Bad address";
 804944b:	8d 80 fb d6 ff ff    	lea    -0x2905(%eax),%eax
 8049451:	e9 42 04 00 00       	jmp    8049898 <.L90+0x5>

08049456 <.L106>:
                case ENOTBLK: return "Block device required";
 8049456:	8d 80 07 d7 ff ff    	lea    -0x28f9(%eax),%eax
 804945c:	e9 37 04 00 00       	jmp    8049898 <.L90+0x5>

08049461 <.L107>:
                case EBUSY: return "Mount device busy";
 8049461:	8d 80 1d d7 ff ff    	lea    -0x28e3(%eax),%eax
 8049467:	e9 2c 04 00 00       	jmp    8049898 <.L90+0x5>

0804946c <.L108>:
                case EEXIST: return "File exists";
 804946c:	8d 80 2f d7 ff ff    	lea    -0x28d1(%eax),%eax
 8049472:	e9 21 04 00 00       	jmp    8049898 <.L90+0x5>

08049477 <.L109>:
                case EXDEV: return "Cross-device link";
 8049477:	8d 80 3b d7 ff ff    	lea    -0x28c5(%eax),%eax
 804947d:	e9 16 04 00 00       	jmp    8049898 <.L90+0x5>

08049482 <.L110>:
                case ENODEV: return "No such device";
 8049482:	8d 80 4d d7 ff ff    	lea    -0x28b3(%eax),%eax
 8049488:	e9 0b 04 00 00       	jmp    8049898 <.L90+0x5>

0804948d <.L111>:
                case ENOTDIR: return "Not a directory";
 804948d:	8d 80 5c d7 ff ff    	lea    -0x28a4(%eax),%eax
 8049493:	e9 00 04 00 00       	jmp    8049898 <.L90+0x5>

08049498 <.L112>:
                case EISDIR: return "Is a directory";
 8049498:	8d 80 6c d7 ff ff    	lea    -0x2894(%eax),%eax
 804949e:	e9 f5 03 00 00       	jmp    8049898 <.L90+0x5>

080494a3 <.L113>:
                case EINVAL: return "Invalid argument";
 80494a3:	8d 80 7b d7 ff ff    	lea    -0x2885(%eax),%eax
 80494a9:	e9 ea 03 00 00       	jmp    8049898 <.L90+0x5>

080494ae <.L114>:
                case ENFILE: return "File table overflow";
 80494ae:	8d 80 8c d7 ff ff    	lea    -0x2874(%eax),%eax
 80494b4:	e9 df 03 00 00       	jmp    8049898 <.L90+0x5>

080494b9 <.L115>:
                case EMFILE: return "Too many open files";
 80494b9:	8d 80 a0 d7 ff ff    	lea    -0x2860(%eax),%eax
 80494bf:	e9 d4 03 00 00       	jmp    8049898 <.L90+0x5>

080494c4 <.L116>:
                case ENOTTY: return "Inappropriate ioctl for device";
 80494c4:	8d 80 b4 d7 ff ff    	lea    -0x284c(%eax),%eax
 80494ca:	e9 c9 03 00 00       	jmp    8049898 <.L90+0x5>

080494cf <.L117>:
                case ETXTBSY: return "Text file busy";
 80494cf:	8d 80 d3 d7 ff ff    	lea    -0x282d(%eax),%eax
 80494d5:	e9 be 03 00 00       	jmp    8049898 <.L90+0x5>

080494da <.L118>:
                case EFBIG: return "File too large";
 80494da:	8d 80 e2 d7 ff ff    	lea    -0x281e(%eax),%eax
 80494e0:	e9 b3 03 00 00       	jmp    8049898 <.L90+0x5>

080494e5 <.L119>:
                case ENOSPC: return "No space left on device";
 80494e5:	8d 80 f1 d7 ff ff    	lea    -0x280f(%eax),%eax
 80494eb:	e9 a8 03 00 00       	jmp    8049898 <.L90+0x5>

080494f0 <.L120>:
                case ESPIPE: return "Illegal seek";
 80494f0:	8d 80 09 d8 ff ff    	lea    -0x27f7(%eax),%eax
 80494f6:	e9 9d 03 00 00       	jmp    8049898 <.L90+0x5>

080494fb <.L121>:
                case EROFS: return "Read only file system";
 80494fb:	8d 80 16 d8 ff ff    	lea    -0x27ea(%eax),%eax
 8049501:	e9 92 03 00 00       	jmp    8049898 <.L90+0x5>

08049506 <.L122>:
                case EMLINK: return "Too many links";
 8049506:	8d 80 2c d8 ff ff    	lea    -0x27d4(%eax),%eax
 804950c:	e9 87 03 00 00       	jmp    8049898 <.L90+0x5>

08049511 <.L123>:
                case EPIPE: return "Broken pipe";
 8049511:	8d 80 3b d8 ff ff    	lea    -0x27c5(%eax),%eax
 8049517:	e9 7c 03 00 00       	jmp    8049898 <.L90+0x5>

0804951c <.L124>:
                case EDOM: return "Math arg out of domain of func";
 804951c:	8d 80 48 d8 ff ff    	lea    -0x27b8(%eax),%eax
 8049522:	e9 71 03 00 00       	jmp    8049898 <.L90+0x5>

08049527 <.L125>:
                case ERANGE: return "Math result not representable";
 8049527:	8d 80 67 d8 ff ff    	lea    -0x2799(%eax),%eax
 804952d:	e9 66 03 00 00       	jmp    8049898 <.L90+0x5>

08049532 <.L132>:
                case ENOMSG: return "No message of desired type";
 8049532:	8d 80 85 d8 ff ff    	lea    -0x277b(%eax),%eax
 8049538:	e9 5b 03 00 00       	jmp    8049898 <.L90+0x5>

0804953d <.L133>:
                case EIDRM: return "Identifier removed";
 804953d:	8d 80 a0 d8 ff ff    	lea    -0x2760(%eax),%eax
 8049543:	e9 50 03 00 00       	jmp    8049898 <.L90+0x5>

08049548 <.L134>:
                case ECHRNG: return "Channel number out of range";
 8049548:	8d 80 b3 d8 ff ff    	lea    -0x274d(%eax),%eax
 804954e:	e9 45 03 00 00       	jmp    8049898 <.L90+0x5>

08049553 <.L135>:
                case EL2NSYNC: return "Level 2 not synchronized";
 8049553:	8d 80 cf d8 ff ff    	lea    -0x2731(%eax),%eax
 8049559:	e9 3a 03 00 00       	jmp    8049898 <.L90+0x5>

0804955e <.L136>:
                case EL3HLT: return "Level 3 halted";
 804955e:	8d 80 e8 d8 ff ff    	lea    -0x2718(%eax),%eax
 8049564:	e9 2f 03 00 00       	jmp    8049898 <.L90+0x5>

08049569 <.L137>:
                case EL3RST: return "Level 3 reset";
 8049569:	8d 80 f7 d8 ff ff    	lea    -0x2709(%eax),%eax
 804956f:	e9 24 03 00 00       	jmp    8049898 <.L90+0x5>

08049574 <.L138>:
                case ELNRNG: return "Link number out of range";
 8049574:	8d 80 05 d9 ff ff    	lea    -0x26fb(%eax),%eax
 804957a:	e9 19 03 00 00       	jmp    8049898 <.L90+0x5>

0804957f <.L139>:
                case EUNATCH: return "Protocol driver not attached";
 804957f:	8d 80 1e d9 ff ff    	lea    -0x26e2(%eax),%eax
 8049585:	e9 0e 03 00 00       	jmp    8049898 <.L90+0x5>

0804958a <.L140>:
                case ENOCSI: return "No CSI structure available";
 804958a:	8d 80 3b d9 ff ff    	lea    -0x26c5(%eax),%eax
 8049590:	e9 03 03 00 00       	jmp    8049898 <.L90+0x5>

08049595 <.L141>:
                case EL2HLT: return "Level 2 halted";
 8049595:	8d 80 56 d9 ff ff    	lea    -0x26aa(%eax),%eax
 804959b:	e9 f8 02 00 00       	jmp    8049898 <.L90+0x5>

080495a0 <.L126>:
                case EDEADLK: return "Deadlock condition.";
 80495a0:	8d 80 65 d9 ff ff    	lea    -0x269b(%eax),%eax
 80495a6:	e9 ed 02 00 00       	jmp    8049898 <.L90+0x5>

080495ab <.L128>:
                case ENOLCK: return "No record locks available.";
 80495ab:	8d 80 79 d9 ff ff    	lea    -0x2687(%eax),%eax
 80495b1:	e9 e2 02 00 00       	jmp    8049898 <.L90+0x5>

080495b6 <.L206>:
                case ECANCELED: return "Operation canceled";
 80495b6:	8d 80 94 d9 ff ff    	lea    -0x266c(%eax),%eax
 80495bc:	e9 d7 02 00 00       	jmp    8049898 <.L90+0x5>

080495c1 <.L183>:
                case ENOTSUP: return "Operation not supported";
 80495c1:	8d 80 a7 d9 ff ff    	lea    -0x2659(%eax),%eax
 80495c7:	e9 cc 02 00 00       	jmp    8049898 <.L90+0x5>

080495cc <.L205>:
                case EDQUOT: return "Disc quota exceeded";
 80495cc:	8d 80 bf d9 ff ff    	lea    -0x2641(%eax),%eax
 80495d2:	e9 c1 02 00 00       	jmp    8049898 <.L90+0x5>

080495d7 <.L142>:
                case EBADE: return "invalid exchange";
 80495d7:	8d 80 d3 d9 ff ff    	lea    -0x262d(%eax),%eax
 80495dd:	e9 b6 02 00 00       	jmp    8049898 <.L90+0x5>

080495e2 <.L143>:
                case EBADR: return "invalid request descriptor";
 80495e2:	8d 80 e4 d9 ff ff    	lea    -0x261c(%eax),%eax
 80495e8:	e9 ab 02 00 00       	jmp    8049898 <.L90+0x5>

080495ed <.L144>:
                case EXFULL: return "exchange full";
 80495ed:	8d 80 ff d9 ff ff    	lea    -0x2601(%eax),%eax
 80495f3:	e9 a0 02 00 00       	jmp    8049898 <.L90+0x5>

080495f8 <.L145>:
                case ENOANO: return "no anode";
 80495f8:	8d 80 0d da ff ff    	lea    -0x25f3(%eax),%eax
 80495fe:	e9 95 02 00 00       	jmp    8049898 <.L90+0x5>

08049603 <.L146>:
                case EBADRQC: return "invalid request code";
 8049603:	8d 80 16 da ff ff    	lea    -0x25ea(%eax),%eax
 8049609:	e9 8a 02 00 00       	jmp    8049898 <.L90+0x5>

0804960e <.L147>:
                case EBADSLT: return "invalid slot";
 804960e:	8d 80 2b da ff ff    	lea    -0x25d5(%eax),%eax
 8049614:	e9 7f 02 00 00       	jmp    8049898 <.L90+0x5>

08049619 <.L148>:
                case EBFONT: return "bad font file fmt";
 8049619:	8d 80 38 da ff ff    	lea    -0x25c8(%eax),%eax
 804961f:	e9 74 02 00 00       	jmp    8049898 <.L90+0x5>

08049624 <.L207>:
                case EOWNERDEAD: return "process died with the lock";
 8049624:	8d 80 4a da ff ff    	lea    -0x25b6(%eax),%eax
 804962a:	e9 69 02 00 00       	jmp    8049898 <.L90+0x5>

0804962f <.L208>:
                case ENOTRECOVERABLE: return "lock is not recoverable";
 804962f:	8d 80 65 da ff ff    	lea    -0x259b(%eax),%eax
 8049635:	e9 5e 02 00 00       	jmp    8049898 <.L90+0x5>

0804963a <.L149>:
                case ENOSTR: return "Device not a stream";
 804963a:	8d 80 7d da ff ff    	lea    -0x2583(%eax),%eax
 8049640:	e9 53 02 00 00       	jmp    8049898 <.L90+0x5>

08049645 <.L150>:
                case ENODATA: return "no data (for no delay io)";
 8049645:	8d 80 91 da ff ff    	lea    -0x256f(%eax),%eax
 804964b:	e9 48 02 00 00       	jmp    8049898 <.L90+0x5>

08049650 <.L151>:
                case ETIME: return "timer expired";
 8049650:	8d 80 ab da ff ff    	lea    -0x2555(%eax),%eax
 8049656:	e9 3d 02 00 00       	jmp    8049898 <.L90+0x5>

0804965b <.L152>:
                case ENOSR: return "out of streams resources";
 804965b:	8d 80 b9 da ff ff    	lea    -0x2547(%eax),%eax
 8049661:	e9 32 02 00 00       	jmp    8049898 <.L90+0x5>

08049666 <.L153>:
                case ENONET: return "Machine is not on the network";
 8049666:	8d 80 d2 da ff ff    	lea    -0x252e(%eax),%eax
 804966c:	e9 27 02 00 00       	jmp    8049898 <.L90+0x5>

08049671 <.L154>:
                case ENOPKG: return "Package not installed";
 8049671:	8d 80 f0 da ff ff    	lea    -0x2510(%eax),%eax
 8049677:	e9 1c 02 00 00       	jmp    8049898 <.L90+0x5>

0804967c <.L155>:
                case EREMOTE: return "The object is remote";
 804967c:	8d 80 06 db ff ff    	lea    -0x24fa(%eax),%eax
 8049682:	e9 11 02 00 00       	jmp    8049898 <.L90+0x5>

08049687 <.L156>:
                case ENOLINK: return "the link has been severed";
 8049687:	8d 80 1b db ff ff    	lea    -0x24e5(%eax),%eax
 804968d:	e9 06 02 00 00       	jmp    8049898 <.L90+0x5>

08049692 <.L157>:
                case EADV: return "advertise error";
 8049692:	8d 80 35 db ff ff    	lea    -0x24cb(%eax),%eax
 8049698:	e9 fb 01 00 00       	jmp    8049898 <.L90+0x5>

0804969d <.L158>:
                case ESRMNT: return "srmount error";
 804969d:	8d 80 45 db ff ff    	lea    -0x24bb(%eax),%eax
 80496a3:	e9 f0 01 00 00       	jmp    8049898 <.L90+0x5>

080496a8 <.L159>:
                case ECOMM: return "Communication error on send";
 80496a8:	8d 80 53 db ff ff    	lea    -0x24ad(%eax),%eax
 80496ae:	e9 e5 01 00 00       	jmp    8049898 <.L90+0x5>

080496b3 <.L160>:
                case EPROTO: return "Protocol error";
 80496b3:	8d 80 6f db ff ff    	lea    -0x2491(%eax),%eax
 80496b9:	e9 da 01 00 00       	jmp    8049898 <.L90+0x5>

080496be <.L161>:
                case EMULTIHOP: return "multihop attempted";
 80496be:	8d 80 7e db ff ff    	lea    -0x2482(%eax),%eax
 80496c4:	e9 cf 01 00 00       	jmp    8049898 <.L90+0x5>

080496c9 <.L162>:
                case EBADMSG: return "trying to read unreadable message";
 80496c9:	8d 80 94 db ff ff    	lea    -0x246c(%eax),%eax
 80496cf:	e9 c4 01 00 00       	jmp    8049898 <.L90+0x5>

080496d4 <.L127>:
                case ENAMETOOLONG: return "path name is too long";
 80496d4:	8d 80 b6 db ff ff    	lea    -0x244a(%eax),%eax
 80496da:	e9 b9 01 00 00       	jmp    8049898 <.L90+0x5>

080496df <.L163>:
                case EOVERFLOW: return "value too large to be stored in data type";
 80496df:	8d 80 cc db ff ff    	lea    -0x2434(%eax),%eax
 80496e5:	e9 ae 01 00 00       	jmp    8049898 <.L90+0x5>

080496ea <.L164>:
                case ENOTUNIQ: return "given log. name not unique";
 80496ea:	8d 80 f6 db ff ff    	lea    -0x240a(%eax),%eax
 80496f0:	e9 a3 01 00 00       	jmp    8049898 <.L90+0x5>

080496f5 <.L165>:
                case EBADFD: return "f.d. invalid for this operation";
 80496f5:	8d 80 14 dc ff ff    	lea    -0x23ec(%eax),%eax
 80496fb:	e9 98 01 00 00       	jmp    8049898 <.L90+0x5>

08049700 <.L166>:
                case EREMCHG: return "Remote address changed";
 8049700:	8d 80 34 dc ff ff    	lea    -0x23cc(%eax),%eax
 8049706:	e9 8d 01 00 00       	jmp    8049898 <.L90+0x5>

0804970b <.L167>:
                case ELIBACC: return "Can't access a needed shared lib.";
 804970b:	8d 80 4c dc ff ff    	lea    -0x23b4(%eax),%eax
 8049711:	e9 82 01 00 00       	jmp    8049898 <.L90+0x5>

08049716 <.L168>:
                case ELIBBAD: return "Accessing a corrupted shared lib.";
 8049716:	8d 80 70 dc ff ff    	lea    -0x2390(%eax),%eax
 804971c:	e9 77 01 00 00       	jmp    8049898 <.L90+0x5>

08049721 <.L169>:
                case ELIBSCN: return ".lib section in a.out corrupted.";
 8049721:	8d 80 94 dc ff ff    	lea    -0x236c(%eax),%eax
 8049727:	e9 6c 01 00 00       	jmp    8049898 <.L90+0x5>

0804972c <.L170>:
                case ELIBMAX: return "Attempting to link in too many libs.";
 804972c:	8d 80 b8 dc ff ff    	lea    -0x2348(%eax),%eax
 8049732:	e9 61 01 00 00       	jmp    8049898 <.L90+0x5>

08049737 <.L171>:
                case ELIBEXEC: return "Attempting to exec a shared library.";
 8049737:	8d 80 e0 dc ff ff    	lea    -0x2320(%eax),%eax
 804973d:	e9 56 01 00 00       	jmp    8049898 <.L90+0x5>

08049742 <.L172>:
                case EILSEQ: return "Illegal byte sequence.";
 8049742:	8d 80 05 dd ff ff    	lea    -0x22fb(%eax),%eax
 8049748:	e9 4b 01 00 00       	jmp    8049898 <.L90+0x5>

0804974d <.L129>:
                case ENOSYS: return "Unsupported file system operation";
 804974d:	8d 80 1c dd ff ff    	lea    -0x22e4(%eax),%eax
 8049753:	e9 40 01 00 00       	jmp    8049898 <.L90+0x5>

08049758 <.L131>:
                case ELOOP: return "Symbolic link loop";
 8049758:	8d 80 3e dd ff ff    	lea    -0x22c2(%eax),%eax
 804975e:	e9 35 01 00 00       	jmp    8049898 <.L90+0x5>

08049763 <.L173>:
                case ERESTART: return "Restartable system call";
 8049763:	8d 80 51 dd ff ff    	lea    -0x22af(%eax),%eax
 8049769:	e9 2a 01 00 00       	jmp    8049898 <.L90+0x5>

0804976e <.L174>:
                case ESTRPIPE: return "if pipe/FIFO, don't sleep in stream head";
 804976e:	8d 80 6c dd ff ff    	lea    -0x2294(%eax),%eax
 8049774:	e9 1f 01 00 00       	jmp    8049898 <.L90+0x5>

08049779 <.L130>:
                case ENOTEMPTY: return "directory not empty";
 8049779:	8d 80 95 dd ff ff    	lea    -0x226b(%eax),%eax
 804977f:	e9 14 01 00 00       	jmp    8049898 <.L90+0x5>

08049784 <.L175>:
                case EUSERS: return "Too many users (for UFS)";
 8049784:	8d 80 a9 dd ff ff    	lea    -0x2257(%eax),%eax
 804978a:	e9 09 01 00 00       	jmp    8049898 <.L90+0x5>

0804978f <.L176>:
                case ENOTSOCK: return "Socket operation on non-socket";
 804978f:	8d 80 c4 dd ff ff    	lea    -0x223c(%eax),%eax
 8049795:	e9 fe 00 00 00       	jmp    8049898 <.L90+0x5>

0804979a <.L177>:
                case EDESTADDRREQ: return "Destination address required";
 804979a:	8d 80 e3 dd ff ff    	lea    -0x221d(%eax),%eax
 80497a0:	e9 f3 00 00 00       	jmp    8049898 <.L90+0x5>

080497a5 <.L178>:
                case EMSGSIZE: return "Message too long";
 80497a5:	8d 80 00 de ff ff    	lea    -0x2200(%eax),%eax
 80497ab:	e9 e8 00 00 00       	jmp    8049898 <.L90+0x5>

080497b0 <.L179>:
                case EPROTOTYPE: return "Protocol wrong type for socket";
 80497b0:	8d 80 14 de ff ff    	lea    -0x21ec(%eax),%eax
 80497b6:	e9 dd 00 00 00       	jmp    8049898 <.L90+0x5>

080497bb <.L180>:
                case ENOPROTOOPT: return "Protocol not available";
 80497bb:	8d 80 33 de ff ff    	lea    -0x21cd(%eax),%eax
 80497c1:	e9 d2 00 00 00       	jmp    8049898 <.L90+0x5>

080497c6 <.L181>:
                case EPROTONOSUPPORT: return "Protocol not supported";
 80497c6:	8d 80 4a de ff ff    	lea    -0x21b6(%eax),%eax
 80497cc:	e9 c7 00 00 00       	jmp    8049898 <.L90+0x5>

080497d1 <.L182>:
                case ESOCKTNOSUPPORT: return "Socket type not supported";
 80497d1:	8d 80 61 de ff ff    	lea    -0x219f(%eax),%eax
 80497d7:	e9 bc 00 00 00       	jmp    8049898 <.L90+0x5>

080497dc <.L184>:
                case EPFNOSUPPORT: return "Protocol family not supported";
 80497dc:	8d 80 7b de ff ff    	lea    -0x2185(%eax),%eax
 80497e2:	e9 b1 00 00 00       	jmp    8049898 <.L90+0x5>

080497e7 <.L185>:
                case EAFNOSUPPORT: return "Address family not supported by protocol family";
 80497e7:	8d 80 9c de ff ff    	lea    -0x2164(%eax),%eax
 80497ed:	e9 a6 00 00 00       	jmp    8049898 <.L90+0x5>

080497f2 <.L186>:
                case EADDRINUSE: return "Address already in use";
 80497f2:	8d 80 cc de ff ff    	lea    -0x2134(%eax),%eax
 80497f8:	e9 9b 00 00 00       	jmp    8049898 <.L90+0x5>

080497fd <.L187>:
                case EADDRNOTAVAIL: return "Can't assign requested address";
 80497fd:	8d 80 e4 de ff ff    	lea    -0x211c(%eax),%eax
 8049803:	e9 90 00 00 00       	jmp    8049898 <.L90+0x5>

08049808 <.L188>:
                case ENETDOWN: return "Network is down";
 8049808:	8d 80 03 df ff ff    	lea    -0x20fd(%eax),%eax
 804980e:	e9 85 00 00 00       	jmp    8049898 <.L90+0x5>

08049813 <.L189>:
                case ENETUNREACH: return "Network is unreachable";
 8049813:	8d 80 13 df ff ff    	lea    -0x20ed(%eax),%eax
 8049819:	eb 7d                	jmp    8049898 <.L90+0x5>

0804981b <.L190>:
                case ENETRESET: return "Network dropped connection because of reset";
 804981b:	8d 80 2c df ff ff    	lea    -0x20d4(%eax),%eax
 8049821:	eb 75                	jmp    8049898 <.L90+0x5>

08049823 <.L191>:
                case ECONNABORTED: return "Software caused connection abort";
 8049823:	8d 80 58 df ff ff    	lea    -0x20a8(%eax),%eax
 8049829:	eb 6d                	jmp    8049898 <.L90+0x5>

0804982b <.L192>:
                case ECONNRESET: return "Connection reset by peer";
 804982b:	8d 80 79 df ff ff    	lea    -0x2087(%eax),%eax
 8049831:	eb 65                	jmp    8049898 <.L90+0x5>

08049833 <.L193>:
                case ENOBUFS: return "No buffer space available";
 8049833:	8d 80 92 df ff ff    	lea    -0x206e(%eax),%eax
 8049839:	eb 5d                	jmp    8049898 <.L90+0x5>

0804983b <.L194>:
                case EISCONN: return "Socket is already connected";
 804983b:	8d 80 ac df ff ff    	lea    -0x2054(%eax),%eax
 8049841:	eb 55                	jmp    8049898 <.L90+0x5>

08049843 <.L195>:
                case ENOTCONN: return "Socket is not connected";
 8049843:	8d 80 c8 df ff ff    	lea    -0x2038(%eax),%eax
 8049849:	eb 4d                	jmp    8049898 <.L90+0x5>

0804984b <.L196>:
                case ESHUTDOWN: return "Can't send after socket shutdown";
 804984b:	8d 80 e0 df ff ff    	lea    -0x2020(%eax),%eax
 8049851:	eb 45                	jmp    8049898 <.L90+0x5>

08049853 <.L197>:
                case ETOOMANYREFS: return "Too many references: can't splice";
 8049853:	8d 80 04 e0 ff ff    	lea    -0x1ffc(%eax),%eax
 8049859:	eb 3d                	jmp    8049898 <.L90+0x5>

0804985b <.L198>:
                case ETIMEDOUT: return "Connection timed out";
 804985b:	8d 80 26 e0 ff ff    	lea    -0x1fda(%eax),%eax
 8049861:	eb 35                	jmp    8049898 <.L90+0x5>

08049863 <.L199>:
                case ECONNREFUSED: return "Connection refused";
 8049863:	8d 80 3b e0 ff ff    	lea    -0x1fc5(%eax),%eax
 8049869:	eb 2d                	jmp    8049898 <.L90+0x5>

0804986b <.L200>:
                case EHOSTDOWN: return "Host is down";
 804986b:	8d 80 4e e0 ff ff    	lea    -0x1fb2(%eax),%eax
 8049871:	eb 25                	jmp    8049898 <.L90+0x5>

08049873 <.L201>:
                case EHOSTUNREACH: return "No route to host";
 8049873:	8d 80 5b e0 ff ff    	lea    -0x1fa5(%eax),%eax
 8049879:	eb 1d                	jmp    8049898 <.L90+0x5>

0804987b <.L202>:
                case EALREADY: return "operation already in progress";
 804987b:	8d 80 6c e0 ff ff    	lea    -0x1f94(%eax),%eax
 8049881:	eb 15                	jmp    8049898 <.L90+0x5>

08049883 <.L203>:
                case EINPROGRESS: return "operation now in progress";
 8049883:	8d 80 8a e0 ff ff    	lea    -0x1f76(%eax),%eax
 8049889:	eb 0d                	jmp    8049898 <.L90+0x5>

0804988b <.L204>:
                case ESTALE: return "Stale NFS file handle";
 804988b:	8d 80 a4 e0 ff ff    	lea    -0x1f5c(%eax),%eax
 8049891:	eb 05                	jmp    8049898 <.L90+0x5>

08049893 <.L90>:
                default: return 0;
 8049893:	b8 00 00 00 00       	mov    $0x0,%eax
        }
}
 8049898:	5d                   	pop    %ebp
 8049899:	c3                   	ret    

0804989a <wrterror>:
#define abort() exit(1)
#endif

static void
wrterror(char *p)
{
 804989a:	55                   	push   %ebp
 804989b:	89 e5                	mov    %esp,%ebp
 804989d:	53                   	push   %ebx
 804989e:	83 ec 24             	sub    $0x24,%esp
 80498a1:	e8 ec f5 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 80498a6:	81 c3 c6 49 00 00    	add    $0x49c6,%ebx
        char *q = " error: ";
 80498ac:	8d 83 cd e2 ff ff    	lea    -0x1d33(%ebx),%eax
 80498b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        _write(STDERR_FILENO, __progname, strlen(__progname));
 80498b5:	8b 83 10 00 00 00    	mov    0x10(%ebx),%eax
 80498bb:	89 04 24             	mov    %eax,(%esp)
 80498be:	e8 40 f8 ff ff       	call   8049103 <strlen>
 80498c3:	89 c2                	mov    %eax,%edx
 80498c5:	8b 83 10 00 00 00    	mov    0x10(%ebx),%eax
 80498cb:	89 54 24 08          	mov    %edx,0x8(%esp)
 80498cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498d3:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80498da:	e8 2c ee ff ff       	call   804870b <write>
        _write(STDERR_FILENO, malloc_func, strlen(malloc_func));
 80498df:	8b 83 14 01 00 00    	mov    0x114(%ebx),%eax
 80498e5:	89 04 24             	mov    %eax,(%esp)
 80498e8:	e8 16 f8 ff ff       	call   8049103 <strlen>
 80498ed:	89 c2                	mov    %eax,%edx
 80498ef:	8b 83 14 01 00 00    	mov    0x114(%ebx),%eax
 80498f5:	89 54 24 08          	mov    %edx,0x8(%esp)
 80498f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498fd:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049904:	e8 02 ee ff ff       	call   804870b <write>
        _write(STDERR_FILENO, q, strlen(q));
 8049909:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804990c:	89 04 24             	mov    %eax,(%esp)
 804990f:	e8 ef f7 ff ff       	call   8049103 <strlen>
 8049914:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049918:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804991b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804991f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049926:	e8 e0 ed ff ff       	call   804870b <write>
        _write(STDERR_FILENO, p, strlen(p));
 804992b:	8b 45 08             	mov    0x8(%ebp),%eax
 804992e:	89 04 24             	mov    %eax,(%esp)
 8049931:	e8 cd f7 ff ff       	call   8049103 <strlen>
 8049936:	89 44 24 08          	mov    %eax,0x8(%esp)
 804993a:	8b 45 08             	mov    0x8(%ebp),%eax
 804993d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049941:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049948:	e8 be ed ff ff       	call   804870b <write>
        suicide = 1;
 804994d:	c7 83 f0 00 00 00 01 	movl   $0x1,0xf0(%ebx)
 8049954:	00 00 00 
        abort();
 8049957:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804995e:	e8 c4 e9 ff ff       	call   8048327 <exit>
}
 8049963:	90                   	nop
 8049964:	83 c4 24             	add    $0x24,%esp
 8049967:	5b                   	pop    %ebx
 8049968:	5d                   	pop    %ebp
 8049969:	c3                   	ret    

0804996a <wrtwarning>:

static void
wrtwarning(char *p)
{
 804996a:	55                   	push   %ebp
 804996b:	89 e5                	mov    %esp,%ebp
 804996d:	53                   	push   %ebx
 804996e:	83 ec 24             	sub    $0x24,%esp
 8049971:	e8 1c f5 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 8049976:	81 c3 f6 48 00 00    	add    $0x48f6,%ebx
        char *q = " warning: ";
 804997c:	8d 83 d6 e2 ff ff    	lea    -0x1d2a(%ebx),%eax
 8049982:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (malloc_abort)
 8049985:	8b 83 ec 00 00 00    	mov    0xec(%ebx),%eax
 804998b:	85 c0                	test   %eax,%eax
 804998d:	74 0b                	je     804999a <wrtwarning+0x30>
                wrterror(p);
 804998f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049992:	89 04 24             	mov    %eax,(%esp)
 8049995:	e8 00 ff ff ff       	call   804989a <wrterror>
        _write(STDERR_FILENO, __progname, strlen(__progname));
 804999a:	8b 83 10 00 00 00    	mov    0x10(%ebx),%eax
 80499a0:	89 04 24             	mov    %eax,(%esp)
 80499a3:	e8 5b f7 ff ff       	call   8049103 <strlen>
 80499a8:	89 c2                	mov    %eax,%edx
 80499aa:	8b 83 10 00 00 00    	mov    0x10(%ebx),%eax
 80499b0:	89 54 24 08          	mov    %edx,0x8(%esp)
 80499b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499b8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80499bf:	e8 47 ed ff ff       	call   804870b <write>
        _write(STDERR_FILENO, malloc_func, strlen(malloc_func));
 80499c4:	8b 83 14 01 00 00    	mov    0x114(%ebx),%eax
 80499ca:	89 04 24             	mov    %eax,(%esp)
 80499cd:	e8 31 f7 ff ff       	call   8049103 <strlen>
 80499d2:	89 c2                	mov    %eax,%edx
 80499d4:	8b 83 14 01 00 00    	mov    0x114(%ebx),%eax
 80499da:	89 54 24 08          	mov    %edx,0x8(%esp)
 80499de:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499e2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80499e9:	e8 1d ed ff ff       	call   804870b <write>
        _write(STDERR_FILENO, q, strlen(q));
 80499ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80499f1:	89 04 24             	mov    %eax,(%esp)
 80499f4:	e8 0a f7 ff ff       	call   8049103 <strlen>
 80499f9:	89 44 24 08          	mov    %eax,0x8(%esp)
 80499fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049a00:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a04:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049a0b:	e8 fb ec ff ff       	call   804870b <write>
        _write(STDERR_FILENO, p, strlen(p));
 8049a10:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a13:	89 04 24             	mov    %eax,(%esp)
 8049a16:	e8 e8 f6 ff ff       	call   8049103 <strlen>
 8049a1b:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049a1f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a22:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a26:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049a2d:	e8 d9 ec ff ff       	call   804870b <write>
}
 8049a32:	90                   	nop
 8049a33:	83 c4 24             	add    $0x24,%esp
 8049a36:	5b                   	pop    %ebx
 8049a37:	5d                   	pop    %ebp
 8049a38:	c3                   	ret    

08049a39 <map_pages>:
/*
 * Allocate a number of pages from the OS
 */
static void *
map_pages(int pages)
{
 8049a39:	55                   	push   %ebp
 8049a3a:	89 e5                	mov    %esp,%ebp
 8049a3c:	53                   	push   %ebx
 8049a3d:	83 ec 24             	sub    $0x24,%esp
 8049a40:	e8 4d f4 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 8049a45:	81 c3 27 48 00 00    	add    $0x4827,%ebx
        caddr_t result, tail;

        result = (caddr_t)pageround((u_long)sbrk(0));
 8049a4b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049a52:	e8 e1 e6 ff ff       	call   8048138 <sbrk>
 8049a57:	05 ff 0f 00 00       	add    $0xfff,%eax
 8049a5c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 8049a61:	89 45 f4             	mov    %eax,-0xc(%ebp)
        tail = result + (pages << malloc_pageshift);
 8049a64:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a67:	c1 e0 0c             	shl    $0xc,%eax
 8049a6a:	89 c2                	mov    %eax,%edx
 8049a6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049a6f:	01 d0                	add    %edx,%eax
 8049a71:	89 45 f0             	mov    %eax,-0x10(%ebp)

        if (brk(tail)) {
 8049a74:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049a77:	89 04 24             	mov    %eax,(%esp)
 8049a7a:	e8 82 e7 ff ff       	call   8048201 <brk>
 8049a7f:	85 c0                	test   %eax,%eax
 8049a81:	74 07                	je     8049a8a <map_pages+0x51>
#ifdef EXTRA_SANITY
                wrterror("(ES): map_pages fails\n");
#endif /* EXTRA_SANITY */
                return 0;
 8049a83:	b8 00 00 00 00       	mov    $0x0,%eax
 8049a88:	eb 51                	jmp    8049adb <map_pages+0xa2>
        }

        last_index = ptr2index(tail) - 1;
 8049a8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049a8d:	c1 e8 0c             	shr    $0xc,%eax
 8049a90:	89 c2                	mov    %eax,%edx
 8049a92:	8b 83 c8 00 00 00    	mov    0xc8(%ebx),%eax
 8049a98:	29 c2                	sub    %eax,%edx
 8049a9a:	89 d0                	mov    %edx,%eax
 8049a9c:	48                   	dec    %eax
 8049a9d:	89 83 cc 00 00 00    	mov    %eax,0xcc(%ebx)
        malloc_brk = tail;
 8049aa3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049aa6:	89 83 0c 01 00 00    	mov    %eax,0x10c(%ebx)

        if ((last_index + 1) >= malloc_ninfo && !extend_pgdir(last_index))
 8049aac:	8b 83 cc 00 00 00    	mov    0xcc(%ebx),%eax
 8049ab2:	8d 50 01             	lea    0x1(%eax),%edx
 8049ab5:	8b 83 d4 00 00 00    	mov    0xd4(%ebx),%eax
 8049abb:	39 c2                	cmp    %eax,%edx
 8049abd:	72 19                	jb     8049ad8 <map_pages+0x9f>
 8049abf:	8b 83 cc 00 00 00    	mov    0xcc(%ebx),%eax
 8049ac5:	89 04 24             	mov    %eax,(%esp)
 8049ac8:	e8 14 00 00 00       	call   8049ae1 <extend_pgdir>
 8049acd:	85 c0                	test   %eax,%eax
 8049acf:	75 07                	jne    8049ad8 <map_pages+0x9f>
                return 0;;
 8049ad1:	b8 00 00 00 00       	mov    $0x0,%eax
 8049ad6:	eb 03                	jmp    8049adb <map_pages+0xa2>

        return result;
 8049ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8049adb:	83 c4 24             	add    $0x24,%esp
 8049ade:	5b                   	pop    %ebx
 8049adf:	5d                   	pop    %ebp
 8049ae0:	c3                   	ret    

08049ae1 <extend_pgdir>:
/*
 * Extend page directory
 */
static int
extend_pgdir(u_long index)
{
 8049ae1:	55                   	push   %ebp
 8049ae2:	89 e5                	mov    %esp,%ebp
 8049ae4:	53                   	push   %ebx
 8049ae5:	83 ec 34             	sub    $0x34,%esp
 8049ae8:	e8 a5 f3 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 8049aed:	81 c3 7f 47 00 00    	add    $0x477f,%ebx
        struct  pginfo **new, **old;
        int i, oldlen;

        /* Make it this many pages */
        i = index * sizeof * page_dir;
 8049af3:	8b 45 08             	mov    0x8(%ebp),%eax
 8049af6:	c1 e0 02             	shl    $0x2,%eax
 8049af9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        i /= malloc_pagesize;
 8049afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049aff:	c1 e8 0c             	shr    $0xc,%eax
 8049b02:	89 45 f4             	mov    %eax,-0xc(%ebp)
        i += 2;
 8049b05:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)

        /* remember the old mapping size */
        oldlen = malloc_ninfo * sizeof * page_dir;
 8049b09:	8b 83 d4 00 00 00    	mov    0xd4(%ebx),%eax
 8049b0f:	c1 e0 02             	shl    $0x2,%eax
 8049b12:	89 45 f0             	mov    %eax,-0x10(%ebp)
         * address, the old pages will be "magically" remapped..  But this means
         * keeping open a "secret" file descriptor.....
         */

        /* Get new pages */
        new = (struct pginfo **) MMAP(i * malloc_pagesize);
 8049b15:	8b 83 bc 00 00 00    	mov    0xbc(%ebx),%eax
 8049b1b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049b1e:	c1 e2 0c             	shl    $0xc,%edx
 8049b21:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
 8049b28:	00 
 8049b29:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049b2d:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 8049b34:	00 
 8049b35:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
 8049b3c:	00 
 8049b3d:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049b41:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049b48:	e8 cc e9 ff ff       	call   8048519 <mmap>
 8049b4d:	89 45 ec             	mov    %eax,-0x14(%ebp)
        if (new == (struct pginfo **) - 1)
 8049b50:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
 8049b54:	75 07                	jne    8049b5d <extend_pgdir+0x7c>
                return 0;
 8049b56:	b8 00 00 00 00       	mov    $0x0,%eax
 8049b5b:	eb 5e                	jmp    8049bbb <extend_pgdir+0xda>

        /* Copy the old stuff */
        memcpy(new, page_dir,
 8049b5d:	8b 83 d4 00 00 00    	mov    0xd4(%ebx),%eax
 8049b63:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8049b6a:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 8049b70:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049b74:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b78:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049b7b:	89 04 24             	mov    %eax,(%esp)
 8049b7e:	e8 66 f3 ff ff       	call   8048ee9 <memcpy>
               malloc_ninfo * sizeof * page_dir);

        /* register the new size */
        malloc_ninfo = i * malloc_pagesize / sizeof * page_dir;
 8049b83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049b86:	c1 e0 0c             	shl    $0xc,%eax
 8049b89:	c1 e8 02             	shr    $0x2,%eax
 8049b8c:	89 83 d4 00 00 00    	mov    %eax,0xd4(%ebx)

        /* swap the pointers */
        old = page_dir;
 8049b92:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 8049b98:	89 45 e8             	mov    %eax,-0x18(%ebp)
        page_dir = new;
 8049b9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049b9e:	89 83 d0 00 00 00    	mov    %eax,0xd0(%ebx)

        /* Now free the old stuff */
        munmap((char *)old, oldlen);
 8049ba4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049ba7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bab:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049bae:	89 04 24             	mov    %eax,(%esp)
 8049bb1:	e8 c6 e9 ff ff       	call   804857c <munmap>
        return 1;
 8049bb6:	b8 01 00 00 00       	mov    $0x1,%eax
}
 8049bbb:	83 c4 34             	add    $0x34,%esp
 8049bbe:	5b                   	pop    %ebx
 8049bbf:	5d                   	pop    %ebp
 8049bc0:	c3                   	ret    

08049bc1 <malloc_init>:
/*
 * Initialize the world
 */
static void
malloc_init()
{
 8049bc1:	55                   	push   %ebp
 8049bc2:	89 e5                	mov    %esp,%ebp
 8049bc4:	53                   	push   %ebx
 8049bc5:	83 ec 34             	sub    $0x34,%esp
 8049bc8:	e8 c5 f2 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 8049bcd:	81 c3 9f 46 00 00    	add    $0x469f,%ebx
        char *p;
        int i, j;

        INIT_MMAP();
 8049bd3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8049bda:	00 
 8049bdb:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 8049be2:	00 
 8049be3:	8d 83 e1 e2 ff ff    	lea    -0x1d1f(%ebx),%eax
 8049be9:	89 04 24             	mov    %eax,(%esp)
 8049bec:	e8 14 ea ff ff       	call   8048605 <open>
 8049bf1:	89 83 bc 00 00 00    	mov    %eax,0xbc(%ebx)
 8049bf7:	8b 83 bc 00 00 00    	mov    0xbc(%ebx),%eax
 8049bfd:	83 f8 ff             	cmp    $0xffffffff,%eax
 8049c00:	75 0e                	jne    8049c10 <malloc_init+0x4f>
 8049c02:	8d 83 eb e2 ff ff    	lea    -0x1d15(%ebx),%eax
 8049c08:	89 04 24             	mov    %eax,(%esp)
 8049c0b:	e8 8a fc ff ff       	call   804989a <wrterror>

#ifdef EXTRA_SANITY
        malloc_junk = 1;
#endif /* EXTRA_SANITY */

        for (i = 0; i < 3; i++) {
 8049c10:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8049c17:	e9 7c 01 00 00       	jmp    8049d98 <.L18+0x45>
                if (i == 0) {
 8049c1c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049c20:	75 0c                	jne    8049c2e <malloc_init+0x6d>
                        if (j <= 0)
                                continue;
                        b[j] = '\0';
                        p = b;
#else
                        p = NULL;
 8049c22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049c29:	e9 53 01 00 00       	jmp    8049d81 <.L18+0x2e>
#endif
                } else if (i == 1) {
 8049c2e:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
 8049c32:	75 0c                	jne    8049c40 <malloc_init+0x7f>
#ifdef HAS_GETENV
                        p = getenv("MALLOC_OPTIONS");
#else
                        p = NULL;
 8049c34:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049c3b:	e9 41 01 00 00       	jmp    8049d81 <.L18+0x2e>
#endif
                } else {
                        p = malloc_options;
 8049c40:	8d 05 88 e3 04 08    	lea    0x804e388,%eax
 8049c46:	8b 00                	mov    (%eax),%eax
 8049c48:	89 45 f4             	mov    %eax,-0xc(%ebp)
                }
                for (; p && *p; p++) {
 8049c4b:	e9 31 01 00 00       	jmp    8049d81 <.L18+0x2e>
                        switch (*p) {
 8049c50:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049c53:	0f b6 00             	movzbl (%eax),%eax
 8049c56:	0f be c0             	movsbl %al,%eax
 8049c59:	83 e8 3c             	sub    $0x3c,%eax
 8049c5c:	83 f8 3e             	cmp    $0x3e,%eax
 8049c5f:	0f 87 ee 00 00 00    	ja     8049d53 <.L18>
 8049c65:	c1 e0 02             	shl    $0x2,%eax
 8049c68:	8b 84 18 40 e3 ff ff 	mov    -0x1cc0(%eax,%ebx,1),%eax
 8049c6f:	01 d8                	add    %ebx,%eax
 8049c71:	ff e0                	jmp    *%eax

08049c73 <.L21>:
                                case '>': malloc_cache   <<= 1; break;
 8049c73:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
 8049c79:	01 c0                	add    %eax,%eax
 8049c7b:	89 83 0c 00 00 00    	mov    %eax,0xc(%ebx)
 8049c81:	e9 f8 00 00 00       	jmp    8049d7e <.L18+0x2b>

08049c86 <.L19>:
                                case '<': malloc_cache   >>= 1; break;
 8049c86:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
 8049c8c:	d1 e8                	shr    %eax
 8049c8e:	89 83 0c 00 00 00    	mov    %eax,0xc(%ebx)
 8049c94:	e9 e5 00 00 00       	jmp    8049d7e <.L18+0x2b>

08049c99 <.L29>:
                                case 'a': malloc_abort   = 0; break;
 8049c99:	c7 83 ec 00 00 00 00 	movl   $0x0,0xec(%ebx)
 8049ca0:	00 00 00 
 8049ca3:	e9 d6 00 00 00       	jmp    8049d7e <.L18+0x2b>

08049ca8 <.L22>:
                                case 'A': malloc_abort   = 1; break;
 8049ca8:	c7 83 ec 00 00 00 01 	movl   $0x1,0xec(%ebx)
 8049caf:	00 00 00 
 8049cb2:	e9 c7 00 00 00       	jmp    8049d7e <.L18+0x2b>

08049cb7 <.L30>:
                                case 'h': malloc_hint    = 0; break;
 8049cb7:	c7 83 f8 00 00 00 00 	movl   $0x0,0xf8(%ebx)
 8049cbe:	00 00 00 
 8049cc1:	e9 b8 00 00 00       	jmp    8049d7e <.L18+0x2b>

08049cc6 <.L23>:
                                case 'H': malloc_hint    = 1; break;
 8049cc6:	c7 83 f8 00 00 00 01 	movl   $0x1,0xf8(%ebx)
 8049ccd:	00 00 00 
 8049cd0:	e9 a9 00 00 00       	jmp    8049d7e <.L18+0x2b>

08049cd5 <.L32>:
                                case 'r': malloc_realloc = 0; break;
 8049cd5:	c7 83 f4 00 00 00 00 	movl   $0x0,0xf4(%ebx)
 8049cdc:	00 00 00 
 8049cdf:	e9 9a 00 00 00       	jmp    8049d7e <.L18+0x2b>

08049ce4 <.L25>:
                                case 'R': malloc_realloc = 1; break;
 8049ce4:	c7 83 f4 00 00 00 01 	movl   $0x1,0xf4(%ebx)
 8049ceb:	00 00 00 
 8049cee:	e9 8b 00 00 00       	jmp    8049d7e <.L18+0x2b>

08049cf3 <.L31>:
                                case 'j': malloc_junk    = 0; break;
 8049cf3:	c7 83 08 01 00 00 00 	movl   $0x0,0x108(%ebx)
 8049cfa:	00 00 00 
 8049cfd:	eb 7f                	jmp    8049d7e <.L18+0x2b>

08049cff <.L24>:
                                case 'J': malloc_junk    = 1; break;
 8049cff:	c7 83 08 01 00 00 01 	movl   $0x1,0x108(%ebx)
 8049d06:	00 00 00 
 8049d09:	eb 73                	jmp    8049d7e <.L18+0x2b>

08049d0b <.L33>:
#ifdef HAS_UTRACE
                                case 'u': malloc_utrace  = 0; break;
                                case 'U': malloc_utrace  = 1; break;
#endif
                                case 'v': malloc_sysv    = 0; break;
 8049d0b:	c7 83 00 01 00 00 00 	movl   $0x0,0x100(%ebx)
 8049d12:	00 00 00 
 8049d15:	eb 67                	jmp    8049d7e <.L18+0x2b>

08049d17 <.L26>:
                                case 'V': malloc_sysv    = 1; break;
 8049d17:	c7 83 00 01 00 00 01 	movl   $0x1,0x100(%ebx)
 8049d1e:	00 00 00 
 8049d21:	eb 5b                	jmp    8049d7e <.L18+0x2b>

08049d23 <.L34>:
                                case 'x': malloc_xmalloc = 0; break;
 8049d23:	c7 83 fc 00 00 00 00 	movl   $0x0,0xfc(%ebx)
 8049d2a:	00 00 00 
 8049d2d:	eb 4f                	jmp    8049d7e <.L18+0x2b>

08049d2f <.L27>:
                                case 'X': malloc_xmalloc = 1; break;
 8049d2f:	c7 83 fc 00 00 00 01 	movl   $0x1,0xfc(%ebx)
 8049d36:	00 00 00 
 8049d39:	eb 43                	jmp    8049d7e <.L18+0x2b>

08049d3b <.L35>:
                                case 'z': malloc_zero    = 0; break;
 8049d3b:	c7 83 04 01 00 00 00 	movl   $0x0,0x104(%ebx)
 8049d42:	00 00 00 
 8049d45:	eb 37                	jmp    8049d7e <.L18+0x2b>

08049d47 <.L28>:
                                case 'Z': malloc_zero    = 1; break;
 8049d47:	c7 83 04 01 00 00 01 	movl   $0x1,0x104(%ebx)
 8049d4e:	00 00 00 
 8049d51:	eb 2b                	jmp    8049d7e <.L18+0x2b>

08049d53 <.L18>:
                                default:
                                        j = malloc_abort;
 8049d53:	8b 83 ec 00 00 00    	mov    0xec(%ebx),%eax
 8049d59:	89 45 ec             	mov    %eax,-0x14(%ebp)
                                        malloc_abort = 0;
 8049d5c:	c7 83 ec 00 00 00 00 	movl   $0x0,0xec(%ebx)
 8049d63:	00 00 00 
                                        wrtwarning("unknown char in MALLOC_OPTIONS\n");
 8049d66:	8d 83 00 e3 ff ff    	lea    -0x1d00(%ebx),%eax
 8049d6c:	89 04 24             	mov    %eax,(%esp)
 8049d6f:	e8 f6 fb ff ff       	call   804996a <wrtwarning>
                                        malloc_abort = j;
 8049d74:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049d77:	89 83 ec 00 00 00    	mov    %eax,0xec(%ebx)
                                        break;
 8049d7d:	90                   	nop
                        p = NULL;
#endif
                } else {
                        p = malloc_options;
                }
                for (; p && *p; p++) {
 8049d7e:	ff 45 f4             	incl   -0xc(%ebp)
 8049d81:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049d85:	74 0e                	je     8049d95 <.L18+0x42>
 8049d87:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049d8a:	0f b6 00             	movzbl (%eax),%eax
 8049d8d:	84 c0                	test   %al,%al
 8049d8f:	0f 85 bb fe ff ff    	jne    8049c50 <malloc_init+0x8f>

#ifdef EXTRA_SANITY
        malloc_junk = 1;
#endif /* EXTRA_SANITY */

        for (i = 0; i < 3; i++) {
 8049d95:	ff 45 f0             	incl   -0x10(%ebp)
 8049d98:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
 8049d9c:	0f 8e 7a fe ff ff    	jle    8049c1c <malloc_init+0x5b>

        /*
         * We want junk in the entire allocation, and zero only in the part
         * the user asked for.
         */
        if (malloc_zero)
 8049da2:	8b 83 04 01 00 00    	mov    0x104(%ebx),%eax
 8049da8:	85 c0                	test   %eax,%eax
 8049daa:	74 0a                	je     8049db6 <.L18+0x63>
                malloc_junk = 1;
 8049dac:	c7 83 08 01 00 00 01 	movl   $0x1,0x108(%ebx)
 8049db3:	00 00 00 

        /*
         * If we run with junk (or implicitly from above: zero), we want to
         * force realloc() to get new storage, so we can DTRT with it.
         */
        if (malloc_junk)
 8049db6:	8b 83 08 01 00 00    	mov    0x108(%ebx),%eax
 8049dbc:	85 c0                	test   %eax,%eax
 8049dbe:	74 0a                	je     8049dca <.L18+0x77>
                malloc_realloc = 1;
 8049dc0:	c7 83 f4 00 00 00 01 	movl   $0x1,0xf4(%ebx)
 8049dc7:	00 00 00 

        /* Allocate one page for the page directory */
        page_dir = (struct pginfo **) MMAP(malloc_pagesize);
 8049dca:	8b 83 bc 00 00 00    	mov    0xbc(%ebx),%eax
 8049dd0:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
 8049dd7:	00 
 8049dd8:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049ddc:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 8049de3:	00 
 8049de4:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
 8049deb:	00 
 8049dec:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 8049df3:	00 
 8049df4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049dfb:	e8 19 e7 ff ff       	call   8048519 <mmap>
 8049e00:	89 83 d0 00 00 00    	mov    %eax,0xd0(%ebx)

        if (page_dir == (struct pginfo **) - 1)
 8049e06:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 8049e0c:	83 f8 ff             	cmp    $0xffffffff,%eax
 8049e0f:	75 0e                	jne    8049e1f <.L18+0xcc>
                wrterror("mmap(2) failed, check limits\n");
 8049e11:	8d 83 20 e3 ff ff    	lea    -0x1ce0(%ebx),%eax
 8049e17:	89 04 24             	mov    %eax,(%esp)
 8049e1a:	e8 7b fa ff ff       	call   804989a <wrterror>

        /*
         * We need a maximum of malloc_pageshift buckets, steal these from the
         * front of the page_directory;
         */
        malloc_origo = ((u_long)pageround((u_long)sbrk(0))) >> malloc_pageshift;
 8049e1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049e26:	e8 0d e3 ff ff       	call   8048138 <sbrk>
 8049e2b:	05 ff 0f 00 00       	add    $0xfff,%eax
 8049e30:	c1 e8 0c             	shr    $0xc,%eax
 8049e33:	89 83 c8 00 00 00    	mov    %eax,0xc8(%ebx)
        malloc_origo -= malloc_pageshift;
 8049e39:	8b 83 c8 00 00 00    	mov    0xc8(%ebx),%eax
 8049e3f:	83 e8 0c             	sub    $0xc,%eax
 8049e42:	89 83 c8 00 00 00    	mov    %eax,0xc8(%ebx)

        malloc_ninfo = malloc_pagesize / sizeof * page_dir;
 8049e48:	c7 83 d4 00 00 00 00 	movl   $0x400,0xd4(%ebx)
 8049e4f:	04 00 00 

        /* Recalculate the cache size in bytes, and make sure it's nonzero */

        if (!malloc_cache)
 8049e52:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
 8049e58:	85 c0                	test   %eax,%eax
 8049e5a:	75 0d                	jne    8049e69 <.L18+0x116>
                malloc_cache++;
 8049e5c:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
 8049e62:	40                   	inc    %eax
 8049e63:	89 83 0c 00 00 00    	mov    %eax,0xc(%ebx)

        malloc_cache <<= malloc_pageshift;
 8049e69:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
 8049e6f:	c1 e0 0c             	shl    $0xc,%eax
 8049e72:	89 83 0c 00 00 00    	mov    %eax,0xc(%ebx)

        /*
         * This is a nice hack from Kaleb Keithly (kaleb@x.org).
         * We can sbrk(2) further back when we keep this on a low address.
         */
        px = (struct pgfree *) imalloc(sizeof * px);
 8049e78:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
 8049e7f:	e8 5d 07 00 00       	call   804a5e1 <imalloc>
 8049e84:	89 83 10 01 00 00    	mov    %eax,0x110(%ebx)

        /* Been here, done that */
        malloc_started++;
 8049e8a:	8b 83 c0 00 00 00    	mov    0xc0(%ebx),%eax
 8049e90:	40                   	inc    %eax
 8049e91:	89 83 c0 00 00 00    	mov    %eax,0xc0(%ebx)
}
 8049e97:	90                   	nop
 8049e98:	83 c4 34             	add    $0x34,%esp
 8049e9b:	5b                   	pop    %ebx
 8049e9c:	5d                   	pop    %ebp
 8049e9d:	c3                   	ret    

08049e9e <malloc_pages>:
/*
 * Allocate a number of complete pages
 */
static void *
malloc_pages(size_t size)
{
 8049e9e:	55                   	push   %ebp
 8049e9f:	89 e5                	mov    %esp,%ebp
 8049ea1:	53                   	push   %ebx
 8049ea2:	83 ec 34             	sub    $0x34,%esp
 8049ea5:	e8 e8 ef ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 8049eaa:	81 c3 c2 43 00 00    	add    $0x43c2,%ebx
        void *p, *delay_free = 0;
 8049eb0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
        unsigned int i;
        struct pgfree *pf;
        u_long index;

        size = pageround(size);
 8049eb7:	8b 45 08             	mov    0x8(%ebp),%eax
 8049eba:	05 ff 0f 00 00       	add    $0xfff,%eax
 8049ebf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 8049ec4:	89 45 08             	mov    %eax,0x8(%ebp)

        p = 0;
 8049ec7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

        /* Look for free pages before asking for more */
        for (pf = free_list.next; pf; pf = pf->next) {
 8049ece:	8b 83 d8 00 00 00    	mov    0xd8(%ebx),%eax
 8049ed4:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049ed7:	e9 82 00 00 00       	jmp    8049f5e <malloc_pages+0xc0>
                        wrterror("(ES): non-free first page on free-list\n");
                if (page_dir[ptr2index(pf->end) - 1] != MALLOC_FREE)
                        wrterror("(ES): non-free last page on free-list\n");
#endif /* EXTRA_SANITY */

                if (pf->size < size)
 8049edc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049edf:	8b 40 10             	mov    0x10(%eax),%eax
 8049ee2:	3b 45 08             	cmp    0x8(%ebp),%eax
 8049ee5:	73 0a                	jae    8049ef1 <malloc_pages+0x53>
        size = pageround(size);

        p = 0;

        /* Look for free pages before asking for more */
        for (pf = free_list.next; pf; pf = pf->next) {
 8049ee7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049eea:	8b 00                	mov    (%eax),%eax
 8049eec:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049eef:	eb 6d                	jmp    8049f5e <malloc_pages+0xc0>
#endif /* EXTRA_SANITY */

                if (pf->size < size)
                        continue;

                if (pf->size == size) {
 8049ef1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049ef4:	8b 40 10             	mov    0x10(%eax),%eax
 8049ef7:	3b 45 08             	cmp    0x8(%ebp),%eax
 8049efa:	75 35                	jne    8049f31 <malloc_pages+0x93>
                        p = pf->page;
 8049efc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049eff:	8b 40 08             	mov    0x8(%eax),%eax
 8049f02:	89 45 f4             	mov    %eax,-0xc(%ebp)
                        if (pf->next)
 8049f05:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049f08:	8b 00                	mov    (%eax),%eax
 8049f0a:	85 c0                	test   %eax,%eax
 8049f0c:	74 0e                	je     8049f1c <malloc_pages+0x7e>
                                pf->next->prev = pf->prev;
 8049f0e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049f11:	8b 00                	mov    (%eax),%eax
 8049f13:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8049f16:	8b 52 04             	mov    0x4(%edx),%edx
 8049f19:	89 50 04             	mov    %edx,0x4(%eax)
                        pf->prev->next = pf->next;
 8049f1c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049f1f:	8b 40 04             	mov    0x4(%eax),%eax
 8049f22:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8049f25:	8b 12                	mov    (%edx),%edx
 8049f27:	89 10                	mov    %edx,(%eax)
                        delay_free = pf;
 8049f29:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049f2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
                        break;
 8049f2f:	eb 37                	jmp    8049f68 <malloc_pages+0xca>
                }

                p = pf->page;
 8049f31:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049f34:	8b 40 08             	mov    0x8(%eax),%eax
 8049f37:	89 45 f4             	mov    %eax,-0xc(%ebp)
                pf->page = (char *)pf->page + size;
 8049f3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049f3d:	8b 50 08             	mov    0x8(%eax),%edx
 8049f40:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f43:	01 c2                	add    %eax,%edx
 8049f45:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049f48:	89 50 08             	mov    %edx,0x8(%eax)
                pf->size -= size;
 8049f4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049f4e:	8b 40 10             	mov    0x10(%eax),%eax
 8049f51:	2b 45 08             	sub    0x8(%ebp),%eax
 8049f54:	89 c2                	mov    %eax,%edx
 8049f56:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049f59:	89 50 10             	mov    %edx,0x10(%eax)
                break;
 8049f5c:	eb 0a                	jmp    8049f68 <malloc_pages+0xca>
        size = pageround(size);

        p = 0;

        /* Look for free pages before asking for more */
        for (pf = free_list.next; pf; pf = pf->next) {
 8049f5e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 8049f62:	0f 85 74 ff ff ff    	jne    8049edc <malloc_pages+0x3e>
#ifdef EXTRA_SANITY
        if (p && page_dir[ptr2index(p)] != MALLOC_FREE)
                wrterror("(ES): allocated non-free page on free-list\n");
#endif /* EXTRA_SANITY */

        size >>= malloc_pageshift;
 8049f68:	c1 6d 08 0c          	shrl   $0xc,0x8(%ebp)

        /* Map new pages */
        if (!p)
 8049f6c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049f70:	75 0e                	jne    8049f80 <malloc_pages+0xe2>
                p = map_pages(size);
 8049f72:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f75:	89 04 24             	mov    %eax,(%esp)
 8049f78:	e8 bc fa ff ff       	call   8049a39 <map_pages>
 8049f7d:	89 45 f4             	mov    %eax,-0xc(%ebp)

        if (p) {
 8049f80:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049f84:	74 7d                	je     804a003 <malloc_pages+0x165>

                index = ptr2index(p);
 8049f86:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049f89:	c1 e8 0c             	shr    $0xc,%eax
 8049f8c:	89 c2                	mov    %eax,%edx
 8049f8e:	8b 83 c8 00 00 00    	mov    0xc8(%ebx),%eax
 8049f94:	29 c2                	sub    %eax,%edx
 8049f96:	89 d0                	mov    %edx,%eax
 8049f98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                page_dir[index] = MALLOC_FIRST;
 8049f9b:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 8049fa1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049fa4:	c1 e2 02             	shl    $0x2,%edx
 8049fa7:	01 d0                	add    %edx,%eax
 8049fa9:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
                for (i = 1; i < size; i++)
 8049faf:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
 8049fb6:	eb 1c                	jmp    8049fd4 <malloc_pages+0x136>
                        page_dir[index + i] = MALLOC_FOLLOW;
 8049fb8:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 8049fbe:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8049fc1:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8049fc4:	01 ca                	add    %ecx,%edx
 8049fc6:	c1 e2 02             	shl    $0x2,%edx
 8049fc9:	01 d0                	add    %edx,%eax
 8049fcb:	c7 00 03 00 00 00    	movl   $0x3,(%eax)

        if (p) {

                index = ptr2index(p);
                page_dir[index] = MALLOC_FIRST;
                for (i = 1; i < size; i++)
 8049fd1:	ff 45 ec             	incl   -0x14(%ebp)
 8049fd4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049fd7:	3b 45 08             	cmp    0x8(%ebp),%eax
 8049fda:	72 dc                	jb     8049fb8 <malloc_pages+0x11a>
                        page_dir[index + i] = MALLOC_FOLLOW;

                if (malloc_junk)
 8049fdc:	8b 83 08 01 00 00    	mov    0x108(%ebx),%eax
 8049fe2:	85 c0                	test   %eax,%eax
 8049fe4:	74 1d                	je     804a003 <malloc_pages+0x165>
                        memset(p, SOME_JUNK, size << malloc_pageshift);
 8049fe6:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fe9:	c1 e0 0c             	shl    $0xc,%eax
 8049fec:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049ff0:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 8049ff7:	00 
 8049ff8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049ffb:	89 04 24             	mov    %eax,(%esp)
 8049ffe:	e8 41 f0 ff ff       	call   8049044 <memset>
        }

        if (delay_free) {
 804a003:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 804a007:	74 20                	je     804a029 <malloc_pages+0x18b>
                if (!px)
 804a009:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804a00f:	85 c0                	test   %eax,%eax
 804a011:	75 0b                	jne    804a01e <malloc_pages+0x180>
                        px = delay_free;
 804a013:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a016:	89 83 10 01 00 00    	mov    %eax,0x110(%ebx)
 804a01c:	eb 0b                	jmp    804a029 <malloc_pages+0x18b>
                else
                        ifree(delay_free);
 804a01e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a021:	89 04 24             	mov    %eax,(%esp)
 804a024:	e8 d7 0e 00 00       	call   804af00 <ifree>
        }

        return p;
 804a029:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 804a02c:	83 c4 34             	add    $0x34,%esp
 804a02f:	5b                   	pop    %ebx
 804a030:	5d                   	pop    %ebp
 804a031:	c3                   	ret    

0804a032 <malloc_make_chunks>:
 * Allocate a page of fragments
 */

static __inline__ int
malloc_make_chunks(int bits)
{
 804a032:	55                   	push   %ebp
 804a033:	89 e5                	mov    %esp,%ebp
 804a035:	56                   	push   %esi
 804a036:	53                   	push   %ebx
 804a037:	83 ec 30             	sub    $0x30,%esp
 804a03a:	e8 53 ee ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804a03f:	81 c3 2d 42 00 00    	add    $0x422d,%ebx
        struct  pginfo *bp;
        void *pp;
        unsigned int i, k, l;

        /* Allocate a new bucket */
        pp = malloc_pages(malloc_pagesize);
 804a045:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
 804a04c:	e8 4d fe ff ff       	call   8049e9e <malloc_pages>
 804a051:	89 45 e8             	mov    %eax,-0x18(%ebp)
        if (!pp)
 804a054:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 804a058:	75 0a                	jne    804a064 <malloc_make_chunks+0x32>
                return 0;
 804a05a:	b8 00 00 00 00       	mov    $0x0,%eax
 804a05f:	e9 f4 01 00 00       	jmp    804a258 <malloc_make_chunks+0x226>

        /* Find length of admin structure */
        l = offsetof(struct pginfo, bits[0]);
 804a064:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        l += sizeof bp->bits[0] *
             (((malloc_pagesize >> bits) + MALLOC_BITS - 1) / MALLOC_BITS);
 804a06b:	8b 45 08             	mov    0x8(%ebp),%eax
 804a06e:	ba 00 10 00 00       	mov    $0x1000,%edx
 804a073:	88 c1                	mov    %al,%cl
 804a075:	d3 ea                	shr    %cl,%edx
 804a077:	89 d0                	mov    %edx,%eax
 804a079:	83 c0 1f             	add    $0x1f,%eax
 804a07c:	c1 e8 05             	shr    $0x5,%eax
        if (!pp)
                return 0;

        /* Find length of admin structure */
        l = offsetof(struct pginfo, bits[0]);
        l += sizeof bp->bits[0] *
 804a07f:	c1 e0 02             	shl    $0x2,%eax
 804a082:	01 45 ec             	add    %eax,-0x14(%ebp)
             (((malloc_pagesize >> bits) + MALLOC_BITS - 1) / MALLOC_BITS);

        /* Don't waste more than two chunks on this */
        if ((1U << (bits)) <= l + l) {
 804a085:	8b 45 08             	mov    0x8(%ebp),%eax
 804a088:	ba 01 00 00 00       	mov    $0x1,%edx
 804a08d:	88 c1                	mov    %al,%cl
 804a08f:	d3 e2                	shl    %cl,%edx
 804a091:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a094:	01 c0                	add    %eax,%eax
 804a096:	39 c2                	cmp    %eax,%edx
 804a098:	77 08                	ja     804a0a2 <malloc_make_chunks+0x70>
                bp = (struct  pginfo *)pp;
 804a09a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a09d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a0a0:	eb 29                	jmp    804a0cb <malloc_make_chunks+0x99>
        } else {
                bp = (struct  pginfo *)imalloc(l);
 804a0a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a0a5:	89 04 24             	mov    %eax,(%esp)
 804a0a8:	e8 34 05 00 00       	call   804a5e1 <imalloc>
 804a0ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
                if (!bp) {
 804a0b0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a0b4:	75 15                	jne    804a0cb <malloc_make_chunks+0x99>
                        ifree(pp);
 804a0b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a0b9:	89 04 24             	mov    %eax,(%esp)
 804a0bc:	e8 3f 0e 00 00       	call   804af00 <ifree>
                        return 0;
 804a0c1:	b8 00 00 00 00       	mov    $0x0,%eax
 804a0c6:	e9 8d 01 00 00       	jmp    804a258 <malloc_make_chunks+0x226>
                }
        }

        bp->size = (1 << bits);
 804a0cb:	8b 45 08             	mov    0x8(%ebp),%eax
 804a0ce:	ba 01 00 00 00       	mov    $0x1,%edx
 804a0d3:	88 c1                	mov    %al,%cl
 804a0d5:	d3 e2                	shl    %cl,%edx
 804a0d7:	89 d0                	mov    %edx,%eax
 804a0d9:	0f b7 d0             	movzwl %ax,%edx
 804a0dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a0df:	66 89 50 08          	mov    %dx,0x8(%eax)
        bp->shift = bits;
 804a0e3:	8b 45 08             	mov    0x8(%ebp),%eax
 804a0e6:	0f b7 d0             	movzwl %ax,%edx
 804a0e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a0ec:	66 89 50 0a          	mov    %dx,0xa(%eax)
        bp->total = bp->free = malloc_pagesize >> bits;
 804a0f0:	8b 45 08             	mov    0x8(%ebp),%eax
 804a0f3:	ba 00 10 00 00       	mov    $0x1000,%edx
 804a0f8:	88 c1                	mov    %al,%cl
 804a0fa:	d3 ea                	shr    %cl,%edx
 804a0fc:	89 d0                	mov    %edx,%eax
 804a0fe:	0f b7 d0             	movzwl %ax,%edx
 804a101:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a104:	66 89 50 0c          	mov    %dx,0xc(%eax)
 804a108:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a10b:	0f b7 50 0c          	movzwl 0xc(%eax),%edx
 804a10f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a112:	66 89 50 0e          	mov    %dx,0xe(%eax)
        bp->page = pp;
 804a116:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a119:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804a11c:	89 50 04             	mov    %edx,0x4(%eax)

        /* set all valid bits in the bitmap */
        k = bp->total;
 804a11f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a122:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804a126:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        i = 0;
 804a129:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

        /* Do a bunch at a time */
        for (; k - i >= MALLOC_BITS; i += MALLOC_BITS)
 804a130:	eb 19                	jmp    804a14b <malloc_make_chunks+0x119>
                bp->bits[i / MALLOC_BITS] = ~0;
 804a132:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a135:	c1 e8 05             	shr    $0x5,%eax
 804a138:	89 c2                	mov    %eax,%edx
 804a13a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a13d:	83 c2 04             	add    $0x4,%edx
 804a140:	c7 04 90 ff ff ff ff 	movl   $0xffffffff,(%eax,%edx,4)
        /* set all valid bits in the bitmap */
        k = bp->total;
        i = 0;

        /* Do a bunch at a time */
        for (; k - i >= MALLOC_BITS; i += MALLOC_BITS)
 804a147:	83 45 f0 20          	addl   $0x20,-0x10(%ebp)
 804a14b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a14e:	2b 45 f0             	sub    -0x10(%ebp),%eax
 804a151:	83 f8 1f             	cmp    $0x1f,%eax
 804a154:	77 dc                	ja     804a132 <malloc_make_chunks+0x100>
                bp->bits[i / MALLOC_BITS] = ~0;

        for (; i < k; i++)
 804a156:	eb 2c                	jmp    804a184 <malloc_make_chunks+0x152>
                bp->bits[i / MALLOC_BITS] |= 1 << (i % MALLOC_BITS);
 804a158:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a15b:	c1 e8 05             	shr    $0x5,%eax
 804a15e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a161:	8d 48 04             	lea    0x4(%eax),%ecx
 804a164:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804a167:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 804a16a:	83 e1 1f             	and    $0x1f,%ecx
 804a16d:	be 01 00 00 00       	mov    $0x1,%esi
 804a172:	d3 e6                	shl    %cl,%esi
 804a174:	89 f1                	mov    %esi,%ecx
 804a176:	09 d1                	or     %edx,%ecx
 804a178:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a17b:	83 c0 04             	add    $0x4,%eax
 804a17e:	89 0c 82             	mov    %ecx,(%edx,%eax,4)

        /* Do a bunch at a time */
        for (; k - i >= MALLOC_BITS; i += MALLOC_BITS)
                bp->bits[i / MALLOC_BITS] = ~0;

        for (; i < k; i++)
 804a181:	ff 45 f0             	incl   -0x10(%ebp)
 804a184:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a187:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 804a18a:	72 cc                	jb     804a158 <malloc_make_chunks+0x126>
                bp->bits[i / MALLOC_BITS] |= 1 << (i % MALLOC_BITS);

        if (bp == bp->page) {
 804a18c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a18f:	8b 40 04             	mov    0x4(%eax),%eax
 804a192:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804a195:	75 72                	jne    804a209 <malloc_make_chunks+0x1d7>
                /* Mark the ones we stole for ourselves */
                for (i = 0; l > 0; i++) {
 804a197:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804a19e:	eb 63                	jmp    804a203 <malloc_make_chunks+0x1d1>
                        bp->bits[i / MALLOC_BITS] &= ~(1 << (i % MALLOC_BITS));
 804a1a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a1a3:	c1 e8 05             	shr    $0x5,%eax
 804a1a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a1a9:	8d 48 04             	lea    0x4(%eax),%ecx
 804a1ac:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804a1af:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 804a1b2:	83 e1 1f             	and    $0x1f,%ecx
 804a1b5:	be 01 00 00 00       	mov    $0x1,%esi
 804a1ba:	d3 e6                	shl    %cl,%esi
 804a1bc:	89 f1                	mov    %esi,%ecx
 804a1be:	f7 d1                	not    %ecx
 804a1c0:	21 d1                	and    %edx,%ecx
 804a1c2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a1c5:	83 c0 04             	add    $0x4,%eax
 804a1c8:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
                        bp->free--;
 804a1cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a1ce:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804a1d2:	48                   	dec    %eax
 804a1d3:	0f b7 d0             	movzwl %ax,%edx
 804a1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a1d9:	66 89 50 0c          	mov    %dx,0xc(%eax)
                        bp->total--;
 804a1dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a1e0:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804a1e4:	48                   	dec    %eax
 804a1e5:	0f b7 d0             	movzwl %ax,%edx
 804a1e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a1eb:	66 89 50 0e          	mov    %dx,0xe(%eax)
                        l -= (1 << bits);
 804a1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 804a1f2:	ba 01 00 00 00       	mov    $0x1,%edx
 804a1f7:	88 c1                	mov    %al,%cl
 804a1f9:	d3 e2                	shl    %cl,%edx
 804a1fb:	89 d0                	mov    %edx,%eax
 804a1fd:	29 45 ec             	sub    %eax,-0x14(%ebp)
        for (; i < k; i++)
                bp->bits[i / MALLOC_BITS] |= 1 << (i % MALLOC_BITS);

        if (bp == bp->page) {
                /* Mark the ones we stole for ourselves */
                for (i = 0; l > 0; i++) {
 804a200:	ff 45 f0             	incl   -0x10(%ebp)
 804a203:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 804a207:	75 97                	jne    804a1a0 <malloc_make_chunks+0x16e>
                }
        }

        /* MALLOC_LOCK */

        page_dir[ptr2index(pp)] = bp;
 804a209:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a20f:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804a212:	89 d1                	mov    %edx,%ecx
 804a214:	c1 e9 0c             	shr    $0xc,%ecx
 804a217:	8b 93 c8 00 00 00    	mov    0xc8(%ebx),%edx
 804a21d:	29 d1                	sub    %edx,%ecx
 804a21f:	89 ca                	mov    %ecx,%edx
 804a221:	c1 e2 02             	shl    $0x2,%edx
 804a224:	01 c2                	add    %eax,%edx
 804a226:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a229:	89 02                	mov    %eax,(%edx)

        bp->next = page_dir[bits];
 804a22b:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a231:	8b 55 08             	mov    0x8(%ebp),%edx
 804a234:	c1 e2 02             	shl    $0x2,%edx
 804a237:	01 d0                	add    %edx,%eax
 804a239:	8b 10                	mov    (%eax),%edx
 804a23b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a23e:	89 10                	mov    %edx,(%eax)
        page_dir[bits] = bp;
 804a240:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a246:	8b 55 08             	mov    0x8(%ebp),%edx
 804a249:	c1 e2 02             	shl    $0x2,%edx
 804a24c:	01 c2                	add    %eax,%edx
 804a24e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a251:	89 02                	mov    %eax,(%edx)

        /* MALLOC_UNLOCK */

        return 1;
 804a253:	b8 01 00 00 00       	mov    $0x1,%eax
}
 804a258:	83 c4 30             	add    $0x30,%esp
 804a25b:	5b                   	pop    %ebx
 804a25c:	5e                   	pop    %esi
 804a25d:	5d                   	pop    %ebp
 804a25e:	c3                   	ret    

0804a25f <malloc_bytes>:
/*
 * Allocate a fragment
 */
static void *
malloc_bytes(size_t size)
{
 804a25f:	55                   	push   %ebp
 804a260:	89 e5                	mov    %esp,%ebp
 804a262:	56                   	push   %esi
 804a263:	53                   	push   %ebx
 804a264:	83 ec 40             	sub    $0x40,%esp
 804a267:	e8 26 ec ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804a26c:	81 c3 00 40 00 00    	add    $0x4000,%ebx
        struct  pginfo *bp;
        int k;
        u_int *lp;

        /* Don't bother with anything less than this */
        if (size < malloc_minsize)
 804a272:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
 804a276:	77 07                	ja     804a27f <malloc_bytes+0x20>
                size = malloc_minsize;
 804a278:	c7 45 08 10 00 00 00 	movl   $0x10,0x8(%ebp)

        /* Find the right bucket */
        j = 1;
 804a27f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
        i = size - 1;
 804a286:	8b 45 08             	mov    0x8(%ebp),%eax
 804a289:	48                   	dec    %eax
 804a28a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        while (i >>= 1)
 804a28d:	eb 03                	jmp    804a292 <malloc_bytes+0x33>
                j++;
 804a28f:	ff 45 f0             	incl   -0x10(%ebp)
                size = malloc_minsize;

        /* Find the right bucket */
        j = 1;
        i = size - 1;
        while (i >>= 1)
 804a292:	d1 7d f4             	sarl   -0xc(%ebp)
 804a295:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a299:	75 f4                	jne    804a28f <malloc_bytes+0x30>
                j++;

        /* If it's empty, make a page more of that size chunks */
        if (!page_dir[j] && !malloc_make_chunks(j))
 804a29b:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a2a1:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804a2a4:	c1 e2 02             	shl    $0x2,%edx
 804a2a7:	01 d0                	add    %edx,%eax
 804a2a9:	8b 00                	mov    (%eax),%eax
 804a2ab:	85 c0                	test   %eax,%eax
 804a2ad:	0f 85 27 02 00 00    	jne    804a4da <malloc_bytes+0x27b>
 804a2b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a2b6:	89 45 dc             	mov    %eax,-0x24(%ebp)
        struct  pginfo *bp;
        void *pp;
        unsigned int i, k, l;

        /* Allocate a new bucket */
        pp = malloc_pages(malloc_pagesize);
 804a2b9:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
 804a2c0:	e8 d9 fb ff ff       	call   8049e9e <malloc_pages>
 804a2c5:	89 45 d8             	mov    %eax,-0x28(%ebp)
        if (!pp)
 804a2c8:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
 804a2cc:	75 0a                	jne    804a2d8 <malloc_bytes+0x79>
                return 0;
 804a2ce:	b8 00 00 00 00       	mov    $0x0,%eax
 804a2d3:	e9 f4 01 00 00       	jmp    804a4cc <malloc_bytes+0x26d>

        /* Find length of admin structure */
        l = offsetof(struct pginfo, bits[0]);
 804a2d8:	c7 45 d4 10 00 00 00 	movl   $0x10,-0x2c(%ebp)
        l += sizeof bp->bits[0] *
             (((malloc_pagesize >> bits) + MALLOC_BITS - 1) / MALLOC_BITS);
 804a2df:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a2e2:	ba 00 10 00 00       	mov    $0x1000,%edx
 804a2e7:	88 c1                	mov    %al,%cl
 804a2e9:	d3 ea                	shr    %cl,%edx
 804a2eb:	89 d0                	mov    %edx,%eax
 804a2ed:	83 c0 1f             	add    $0x1f,%eax
 804a2f0:	c1 e8 05             	shr    $0x5,%eax
        if (!pp)
                return 0;

        /* Find length of admin structure */
        l = offsetof(struct pginfo, bits[0]);
        l += sizeof bp->bits[0] *
 804a2f3:	c1 e0 02             	shl    $0x2,%eax
 804a2f6:	01 45 d4             	add    %eax,-0x2c(%ebp)
             (((malloc_pagesize >> bits) + MALLOC_BITS - 1) / MALLOC_BITS);

        /* Don't waste more than two chunks on this */
        if ((1U << (bits)) <= l + l) {
 804a2f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a2fc:	ba 01 00 00 00       	mov    $0x1,%edx
 804a301:	88 c1                	mov    %al,%cl
 804a303:	d3 e2                	shl    %cl,%edx
 804a305:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804a308:	01 c0                	add    %eax,%eax
 804a30a:	39 c2                	cmp    %eax,%edx
 804a30c:	77 08                	ja     804a316 <malloc_bytes+0xb7>
                bp = (struct  pginfo *)pp;
 804a30e:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804a311:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804a314:	eb 29                	jmp    804a33f <malloc_bytes+0xe0>
        } else {
                bp = (struct  pginfo *)imalloc(l);
 804a316:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804a319:	89 04 24             	mov    %eax,(%esp)
 804a31c:	e8 c0 02 00 00       	call   804a5e1 <imalloc>
 804a321:	89 45 d0             	mov    %eax,-0x30(%ebp)
                if (!bp) {
 804a324:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
 804a328:	75 15                	jne    804a33f <malloc_bytes+0xe0>
                        ifree(pp);
 804a32a:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804a32d:	89 04 24             	mov    %eax,(%esp)
 804a330:	e8 cb 0b 00 00       	call   804af00 <ifree>
                        return 0;
 804a335:	b8 00 00 00 00       	mov    $0x0,%eax
 804a33a:	e9 8d 01 00 00       	jmp    804a4cc <malloc_bytes+0x26d>
                }
        }

        bp->size = (1 << bits);
 804a33f:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a342:	ba 01 00 00 00       	mov    $0x1,%edx
 804a347:	88 c1                	mov    %al,%cl
 804a349:	d3 e2                	shl    %cl,%edx
 804a34b:	89 d0                	mov    %edx,%eax
 804a34d:	0f b7 d0             	movzwl %ax,%edx
 804a350:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a353:	66 89 50 08          	mov    %dx,0x8(%eax)
        bp->shift = bits;
 804a357:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a35a:	0f b7 d0             	movzwl %ax,%edx
 804a35d:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a360:	66 89 50 0a          	mov    %dx,0xa(%eax)
        bp->total = bp->free = malloc_pagesize >> bits;
 804a364:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a367:	ba 00 10 00 00       	mov    $0x1000,%edx
 804a36c:	88 c1                	mov    %al,%cl
 804a36e:	d3 ea                	shr    %cl,%edx
 804a370:	89 d0                	mov    %edx,%eax
 804a372:	0f b7 d0             	movzwl %ax,%edx
 804a375:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a378:	66 89 50 0c          	mov    %dx,0xc(%eax)
 804a37c:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a37f:	0f b7 50 0c          	movzwl 0xc(%eax),%edx
 804a383:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a386:	66 89 50 0e          	mov    %dx,0xe(%eax)
        bp->page = pp;
 804a38a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a38d:	8b 55 d8             	mov    -0x28(%ebp),%edx
 804a390:	89 50 04             	mov    %edx,0x4(%eax)

        /* set all valid bits in the bitmap */
        k = bp->total;
 804a393:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a396:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804a39a:	89 45 cc             	mov    %eax,-0x34(%ebp)
        i = 0;
 804a39d:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
 804a3a4:	eb 19                	jmp    804a3bf <malloc_bytes+0x160>

        /* Do a bunch at a time */
        for (; k - i >= MALLOC_BITS; i += MALLOC_BITS)
                bp->bits[i / MALLOC_BITS] = ~0;
 804a3a6:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804a3a9:	c1 e8 05             	shr    $0x5,%eax
 804a3ac:	89 c2                	mov    %eax,%edx
 804a3ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a3b1:	83 c2 04             	add    $0x4,%edx
 804a3b4:	c7 04 90 ff ff ff ff 	movl   $0xffffffff,(%eax,%edx,4)
        /* set all valid bits in the bitmap */
        k = bp->total;
        i = 0;

        /* Do a bunch at a time */
        for (; k - i >= MALLOC_BITS; i += MALLOC_BITS)
 804a3bb:	83 45 c8 20          	addl   $0x20,-0x38(%ebp)
 804a3bf:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804a3c2:	2b 45 c8             	sub    -0x38(%ebp),%eax
 804a3c5:	83 f8 1f             	cmp    $0x1f,%eax
 804a3c8:	77 dc                	ja     804a3a6 <malloc_bytes+0x147>
 804a3ca:	eb 2c                	jmp    804a3f8 <malloc_bytes+0x199>
                bp->bits[i / MALLOC_BITS] = ~0;

        for (; i < k; i++)
                bp->bits[i / MALLOC_BITS] |= 1 << (i % MALLOC_BITS);
 804a3cc:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804a3cf:	c1 e8 05             	shr    $0x5,%eax
 804a3d2:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804a3d5:	8d 48 04             	lea    0x4(%eax),%ecx
 804a3d8:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804a3db:	8b 4d c8             	mov    -0x38(%ebp),%ecx
 804a3de:	83 e1 1f             	and    $0x1f,%ecx
 804a3e1:	be 01 00 00 00       	mov    $0x1,%esi
 804a3e6:	d3 e6                	shl    %cl,%esi
 804a3e8:	89 f1                	mov    %esi,%ecx
 804a3ea:	09 d1                	or     %edx,%ecx
 804a3ec:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804a3ef:	83 c0 04             	add    $0x4,%eax
 804a3f2:	89 0c 82             	mov    %ecx,(%edx,%eax,4)

        /* Do a bunch at a time */
        for (; k - i >= MALLOC_BITS; i += MALLOC_BITS)
                bp->bits[i / MALLOC_BITS] = ~0;

        for (; i < k; i++)
 804a3f5:	ff 45 c8             	incl   -0x38(%ebp)
 804a3f8:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804a3fb:	3b 45 c8             	cmp    -0x38(%ebp),%eax
 804a3fe:	77 cc                	ja     804a3cc <malloc_bytes+0x16d>
                bp->bits[i / MALLOC_BITS] |= 1 << (i % MALLOC_BITS);

        if (bp == bp->page) {
 804a400:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a403:	8b 40 04             	mov    0x4(%eax),%eax
 804a406:	39 45 d0             	cmp    %eax,-0x30(%ebp)
 804a409:	75 72                	jne    804a47d <malloc_bytes+0x21e>
                /* Mark the ones we stole for ourselves */
                for (i = 0; l > 0; i++) {
 804a40b:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
 804a412:	eb 63                	jmp    804a477 <malloc_bytes+0x218>
                        bp->bits[i / MALLOC_BITS] &= ~(1 << (i % MALLOC_BITS));
 804a414:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804a417:	c1 e8 05             	shr    $0x5,%eax
 804a41a:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804a41d:	8d 48 04             	lea    0x4(%eax),%ecx
 804a420:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804a423:	8b 4d c8             	mov    -0x38(%ebp),%ecx
 804a426:	83 e1 1f             	and    $0x1f,%ecx
 804a429:	be 01 00 00 00       	mov    $0x1,%esi
 804a42e:	d3 e6                	shl    %cl,%esi
 804a430:	89 f1                	mov    %esi,%ecx
 804a432:	f7 d1                	not    %ecx
 804a434:	21 d1                	and    %edx,%ecx
 804a436:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804a439:	83 c0 04             	add    $0x4,%eax
 804a43c:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
                        bp->free--;
 804a43f:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a442:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804a446:	48                   	dec    %eax
 804a447:	0f b7 d0             	movzwl %ax,%edx
 804a44a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a44d:	66 89 50 0c          	mov    %dx,0xc(%eax)
                        bp->total--;
 804a451:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a454:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804a458:	48                   	dec    %eax
 804a459:	0f b7 d0             	movzwl %ax,%edx
 804a45c:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a45f:	66 89 50 0e          	mov    %dx,0xe(%eax)
                        l -= (1 << bits);
 804a463:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804a466:	ba 01 00 00 00       	mov    $0x1,%edx
 804a46b:	88 c1                	mov    %al,%cl
 804a46d:	d3 e2                	shl    %cl,%edx
 804a46f:	89 d0                	mov    %edx,%eax
 804a471:	29 45 d4             	sub    %eax,-0x2c(%ebp)
        for (; i < k; i++)
                bp->bits[i / MALLOC_BITS] |= 1 << (i % MALLOC_BITS);

        if (bp == bp->page) {
                /* Mark the ones we stole for ourselves */
                for (i = 0; l > 0; i++) {
 804a474:	ff 45 c8             	incl   -0x38(%ebp)
 804a477:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 804a47b:	75 97                	jne    804a414 <malloc_bytes+0x1b5>
                }
        }

        /* MALLOC_LOCK */

        page_dir[ptr2index(pp)] = bp;
 804a47d:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a483:	8b 55 d8             	mov    -0x28(%ebp),%edx
 804a486:	89 d1                	mov    %edx,%ecx
 804a488:	c1 e9 0c             	shr    $0xc,%ecx
 804a48b:	8b 93 c8 00 00 00    	mov    0xc8(%ebx),%edx
 804a491:	29 d1                	sub    %edx,%ecx
 804a493:	89 ca                	mov    %ecx,%edx
 804a495:	c1 e2 02             	shl    $0x2,%edx
 804a498:	01 c2                	add    %eax,%edx
 804a49a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a49d:	89 02                	mov    %eax,(%edx)

        bp->next = page_dir[bits];
 804a49f:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a4a5:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804a4a8:	c1 e2 02             	shl    $0x2,%edx
 804a4ab:	01 d0                	add    %edx,%eax
 804a4ad:	8b 10                	mov    (%eax),%edx
 804a4af:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a4b2:	89 10                	mov    %edx,(%eax)
        page_dir[bits] = bp;
 804a4b4:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a4ba:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804a4bd:	c1 e2 02             	shl    $0x2,%edx
 804a4c0:	01 c2                	add    %eax,%edx
 804a4c2:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a4c5:	89 02                	mov    %eax,(%edx)

        /* MALLOC_UNLOCK */

        return 1;
 804a4c7:	b8 01 00 00 00       	mov    $0x1,%eax
        i = size - 1;
        while (i >>= 1)
                j++;

        /* If it's empty, make a page more of that size chunks */
        if (!page_dir[j] && !malloc_make_chunks(j))
 804a4cc:	85 c0                	test   %eax,%eax
 804a4ce:	75 0a                	jne    804a4da <malloc_bytes+0x27b>
                return 0;
 804a4d0:	b8 00 00 00 00       	mov    $0x0,%eax
 804a4d5:	e9 00 01 00 00       	jmp    804a5da <malloc_bytes+0x37b>

        bp = page_dir[j];
 804a4da:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a4e0:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804a4e3:	c1 e2 02             	shl    $0x2,%edx
 804a4e6:	01 d0                	add    %edx,%eax
 804a4e8:	8b 00                	mov    (%eax),%eax
 804a4ea:	89 45 e0             	mov    %eax,-0x20(%ebp)

        /* Find first word of bitmap which isn't empty */
        for (lp = bp->bits; !*lp; lp++)
 804a4ed:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a4f0:	83 c0 10             	add    $0x10,%eax
 804a4f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804a4f6:	eb 04                	jmp    804a4fc <malloc_bytes+0x29d>
 804a4f8:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 804a4fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a4ff:	8b 00                	mov    (%eax),%eax
 804a501:	85 c0                	test   %eax,%eax
 804a503:	74 f3                	je     804a4f8 <malloc_bytes+0x299>
                ;

        /* Find that bit, and tweak it */
        u = 1;
 804a505:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
        k = 0;
 804a50c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
        while (!(*lp & u)) {
 804a513:	eb 0b                	jmp    804a520 <malloc_bytes+0x2c1>
                u += u;
 804a515:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a518:	01 c0                	add    %eax,%eax
 804a51a:	89 45 ec             	mov    %eax,-0x14(%ebp)
                k++;
 804a51d:	ff 45 e8             	incl   -0x18(%ebp)
                ;

        /* Find that bit, and tweak it */
        u = 1;
        k = 0;
        while (!(*lp & u)) {
 804a520:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a523:	8b 00                	mov    (%eax),%eax
 804a525:	23 45 ec             	and    -0x14(%ebp),%eax
 804a528:	85 c0                	test   %eax,%eax
 804a52a:	74 e9                	je     804a515 <malloc_bytes+0x2b6>
                u += u;
                k++;
        }
        *lp ^= u;
 804a52c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a52f:	8b 00                	mov    (%eax),%eax
 804a531:	33 45 ec             	xor    -0x14(%ebp),%eax
 804a534:	89 c2                	mov    %eax,%edx
 804a536:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a539:	89 10                	mov    %edx,(%eax)

        /* If there are no more free, remove from free-list */
        if (!--bp->free) {
 804a53b:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a53e:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804a542:	48                   	dec    %eax
 804a543:	0f b7 d0             	movzwl %ax,%edx
 804a546:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a549:	66 89 50 0c          	mov    %dx,0xc(%eax)
 804a54d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a550:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804a554:	85 c0                	test   %eax,%eax
 804a556:	75 1e                	jne    804a576 <malloc_bytes+0x317>
                page_dir[j] = bp->next;
 804a558:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a55e:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804a561:	c1 e2 02             	shl    $0x2,%edx
 804a564:	01 c2                	add    %eax,%edx
 804a566:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a569:	8b 00                	mov    (%eax),%eax
 804a56b:	89 02                	mov    %eax,(%edx)
                bp->next = 0;
 804a56d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a570:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
        }

        /* Adjust to the real offset of that chunk */
        k += (lp - bp->bits) * MALLOC_BITS;
 804a576:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a579:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804a57c:	83 c2 10             	add    $0x10,%edx
 804a57f:	29 d0                	sub    %edx,%eax
 804a581:	c1 f8 02             	sar    $0x2,%eax
 804a584:	c1 e0 05             	shl    $0x5,%eax
 804a587:	89 c2                	mov    %eax,%edx
 804a589:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a58c:	01 d0                	add    %edx,%eax
 804a58e:	89 45 e8             	mov    %eax,-0x18(%ebp)
        k <<= bp->shift;
 804a591:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a594:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804a598:	88 c1                	mov    %al,%cl
 804a59a:	d3 65 e8             	shll   %cl,-0x18(%ebp)

        if (malloc_junk)
 804a59d:	8b 83 08 01 00 00    	mov    0x108(%ebx),%eax
 804a5a3:	85 c0                	test   %eax,%eax
 804a5a5:	74 28                	je     804a5cf <malloc_bytes+0x370>
                memset((u_char *)bp->page + k, SOME_JUNK, bp->size);
 804a5a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a5aa:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804a5ae:	89 c2                	mov    %eax,%edx
 804a5b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a5b3:	8b 48 04             	mov    0x4(%eax),%ecx
 804a5b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a5b9:	01 c8                	add    %ecx,%eax
 804a5bb:	89 54 24 08          	mov    %edx,0x8(%esp)
 804a5bf:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804a5c6:	00 
 804a5c7:	89 04 24             	mov    %eax,(%esp)
 804a5ca:	e8 75 ea ff ff       	call   8049044 <memset>

        return (u_char *)bp->page + k;
 804a5cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a5d2:	8b 50 04             	mov    0x4(%eax),%edx
 804a5d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a5d8:	01 d0                	add    %edx,%eax
}
 804a5da:	83 c4 40             	add    $0x40,%esp
 804a5dd:	5b                   	pop    %ebx
 804a5de:	5e                   	pop    %esi
 804a5df:	5d                   	pop    %ebp
 804a5e0:	c3                   	ret    

0804a5e1 <imalloc>:
/*
 * Allocate a piece of memory
 */
static void *
imalloc(size_t size)
{
 804a5e1:	55                   	push   %ebp
 804a5e2:	89 e5                	mov    %esp,%ebp
 804a5e4:	53                   	push   %ebx
 804a5e5:	83 ec 24             	sub    $0x24,%esp
 804a5e8:	e8 a5 e8 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804a5ed:	81 c3 7f 3c 00 00    	add    $0x3c7f,%ebx
        void *result;

        if (suicide)
 804a5f3:	8b 83 f0 00 00 00    	mov    0xf0(%ebx),%eax
 804a5f9:	85 c0                	test   %eax,%eax
 804a5fb:	74 0c                	je     804a609 <imalloc+0x28>
                abort();
 804a5fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804a604:	e8 1e dd ff ff       	call   8048327 <exit>

        if ((size + malloc_pagesize) < size)        /* Check for overflow */
 804a609:	8b 45 08             	mov    0x8(%ebp),%eax
 804a60c:	05 00 10 00 00       	add    $0x1000,%eax
 804a611:	3b 45 08             	cmp    0x8(%ebp),%eax
 804a614:	73 09                	jae    804a61f <imalloc+0x3e>
                result = 0;
 804a616:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804a61d:	eb 27                	jmp    804a646 <imalloc+0x65>
        else if (size <= malloc_maxsize)
 804a61f:	81 7d 08 00 08 00 00 	cmpl   $0x800,0x8(%ebp)
 804a626:	77 10                	ja     804a638 <imalloc+0x57>
                result =  malloc_bytes(size);
 804a628:	8b 45 08             	mov    0x8(%ebp),%eax
 804a62b:	89 04 24             	mov    %eax,(%esp)
 804a62e:	e8 2c fc ff ff       	call   804a25f <malloc_bytes>
 804a633:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a636:	eb 0e                	jmp    804a646 <imalloc+0x65>
        else
                result =  malloc_pages(size);
 804a638:	8b 45 08             	mov    0x8(%ebp),%eax
 804a63b:	89 04 24             	mov    %eax,(%esp)
 804a63e:	e8 5b f8 ff ff       	call   8049e9e <malloc_pages>
 804a643:	89 45 f4             	mov    %eax,-0xc(%ebp)

        if (malloc_abort && !result)
 804a646:	8b 83 ec 00 00 00    	mov    0xec(%ebx),%eax
 804a64c:	85 c0                	test   %eax,%eax
 804a64e:	74 14                	je     804a664 <imalloc+0x83>
 804a650:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a654:	75 0e                	jne    804a664 <imalloc+0x83>
                wrterror("allocation failed.\n");
 804a656:	8d 83 3c e4 ff ff    	lea    -0x1bc4(%ebx),%eax
 804a65c:	89 04 24             	mov    %eax,(%esp)
 804a65f:	e8 36 f2 ff ff       	call   804989a <wrterror>

        if (malloc_zero && result)
 804a664:	8b 83 04 01 00 00    	mov    0x104(%ebx),%eax
 804a66a:	85 c0                	test   %eax,%eax
 804a66c:	74 20                	je     804a68e <imalloc+0xad>
 804a66e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a672:	74 1a                	je     804a68e <imalloc+0xad>
                memset(result, 0, size);
 804a674:	8b 45 08             	mov    0x8(%ebp),%eax
 804a677:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a67b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804a682:	00 
 804a683:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a686:	89 04 24             	mov    %eax,(%esp)
 804a689:	e8 b6 e9 ff ff       	call   8049044 <memset>

        return result;
 804a68e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 804a691:	83 c4 24             	add    $0x24,%esp
 804a694:	5b                   	pop    %ebx
 804a695:	5d                   	pop    %ebp
 804a696:	c3                   	ret    

0804a697 <irealloc>:
/*
 * Change the size of an allocation.
 */
static void *
irealloc(void *ptr, size_t size)
{
 804a697:	55                   	push   %ebp
 804a698:	89 e5                	mov    %esp,%ebp
 804a69a:	56                   	push   %esi
 804a69b:	53                   	push   %ebx
 804a69c:	83 ec 30             	sub    $0x30,%esp
 804a69f:	e8 ee e7 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804a6a4:	81 c3 c8 3b 00 00    	add    $0x3bc8,%ebx
        void *p;
        u_long osize, index;
        struct pginfo **mp;
        int i;

        if (suicide)
 804a6aa:	8b 83 f0 00 00 00    	mov    0xf0(%ebx),%eax
 804a6b0:	85 c0                	test   %eax,%eax
 804a6b2:	74 0c                	je     804a6c0 <irealloc+0x29>
                abort();
 804a6b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804a6bb:	e8 67 dc ff ff       	call   8048327 <exit>

        index = ptr2index(ptr);
 804a6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 804a6c3:	c1 e8 0c             	shr    $0xc,%eax
 804a6c6:	89 c2                	mov    %eax,%edx
 804a6c8:	8b 83 c8 00 00 00    	mov    0xc8(%ebx),%eax
 804a6ce:	29 c2                	sub    %eax,%edx
 804a6d0:	89 d0                	mov    %edx,%eax
 804a6d2:	89 45 ec             	mov    %eax,-0x14(%ebp)

        if (index < malloc_pageshift) {
 804a6d5:	83 7d ec 0b          	cmpl   $0xb,-0x14(%ebp)
 804a6d9:	77 18                	ja     804a6f3 <irealloc+0x5c>
                wrtwarning("junk pointer, too low to make sense.\n");
 804a6db:	8d 83 50 e4 ff ff    	lea    -0x1bb0(%ebx),%eax
 804a6e1:	89 04 24             	mov    %eax,(%esp)
 804a6e4:	e8 81 f2 ff ff       	call   804996a <wrtwarning>
                return 0;
 804a6e9:	b8 00 00 00 00       	mov    $0x0,%eax
 804a6ee:	e9 fc 01 00 00       	jmp    804a8ef <irealloc+0x258>
        }

        if (index > last_index) {
 804a6f3:	8b 83 cc 00 00 00    	mov    0xcc(%ebx),%eax
 804a6f9:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 804a6fc:	76 18                	jbe    804a716 <irealloc+0x7f>
                wrtwarning("junk pointer, too high to make sense.\n");
 804a6fe:	8d 83 78 e4 ff ff    	lea    -0x1b88(%ebx),%eax
 804a704:	89 04 24             	mov    %eax,(%esp)
 804a707:	e8 5e f2 ff ff       	call   804996a <wrtwarning>
                return 0;
 804a70c:	b8 00 00 00 00       	mov    $0x0,%eax
 804a711:	e9 d9 01 00 00       	jmp    804a8ef <irealloc+0x258>
        }

        mp = &page_dir[index];
 804a716:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a71c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804a71f:	c1 e2 02             	shl    $0x2,%edx
 804a722:	01 d0                	add    %edx,%eax
 804a724:	89 45 f0             	mov    %eax,-0x10(%ebp)

        if (*mp == MALLOC_FIRST) {                  /* Page allocation */
 804a727:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a72a:	8b 00                	mov    (%eax),%eax
 804a72c:	83 f8 02             	cmp    $0x2,%eax
 804a72f:	75 75                	jne    804a7a6 <irealloc+0x10f>

                /* Check the pointer */
                if ((u_long)ptr & malloc_pagemask) {
 804a731:	8b 45 08             	mov    0x8(%ebp),%eax
 804a734:	25 ff 0f 00 00       	and    $0xfff,%eax
 804a739:	85 c0                	test   %eax,%eax
 804a73b:	74 18                	je     804a755 <irealloc+0xbe>
                        wrtwarning("modified (page-) pointer.\n");
 804a73d:	8d 83 9f e4 ff ff    	lea    -0x1b61(%ebx),%eax
 804a743:	89 04 24             	mov    %eax,(%esp)
 804a746:	e8 1f f2 ff ff       	call   804996a <wrtwarning>
                        return 0;
 804a74b:	b8 00 00 00 00       	mov    $0x0,%eax
 804a750:	e9 9a 01 00 00       	jmp    804a8ef <irealloc+0x258>
                }

                /* Find the size in bytes */
                for (osize = malloc_pagesize; *++mp == MALLOC_FOLLOW;)
 804a755:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%ebp)
 804a75c:	eb 07                	jmp    804a765 <irealloc+0xce>
                        osize += malloc_pagesize;
 804a75e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
                        wrtwarning("modified (page-) pointer.\n");
                        return 0;
                }

                /* Find the size in bytes */
                for (osize = malloc_pagesize; *++mp == MALLOC_FOLLOW;)
 804a765:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
 804a769:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a76c:	8b 00                	mov    (%eax),%eax
 804a76e:	83 f8 03             	cmp    $0x3,%eax
 804a771:	74 eb                	je     804a75e <irealloc+0xc7>
                        osize += malloc_pagesize;

                if (!malloc_realloc &&                  /* unless we have to, */
 804a773:	8b 83 f4 00 00 00    	mov    0xf4(%ebx),%eax
 804a779:	85 c0                	test   %eax,%eax
 804a77b:	0f 85 04 01 00 00    	jne    804a885 <irealloc+0x1ee>
 804a781:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a784:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804a787:	0f 87 f8 00 00 00    	ja     804a885 <irealloc+0x1ee>
                    size <= osize &&                      /* .. or are too small, */
                    size > (osize - malloc_pagesize)) {   /* .. or can free a page, */
 804a78d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a790:	2d 00 10 00 00       	sub    $0x1000,%eax
                /* Find the size in bytes */
                for (osize = malloc_pagesize; *++mp == MALLOC_FOLLOW;)
                        osize += malloc_pagesize;

                if (!malloc_realloc &&                  /* unless we have to, */
                    size <= osize &&                      /* .. or are too small, */
 804a795:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804a798:	0f 83 e7 00 00 00    	jae    804a885 <irealloc+0x1ee>
                    size > (osize - malloc_pagesize)) {   /* .. or can free a page, */
                        return ptr;                         /* don't do anything. */
 804a79e:	8b 45 08             	mov    0x8(%ebp),%eax
 804a7a1:	e9 49 01 00 00       	jmp    804a8ef <irealloc+0x258>
                }

        } else if (*mp >= MALLOC_MAGIC) {           /* Chunk allocation */
 804a7a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a7a9:	8b 00                	mov    (%eax),%eax
 804a7ab:	83 f8 03             	cmp    $0x3,%eax
 804a7ae:	0f 86 bc 00 00 00    	jbe    804a870 <irealloc+0x1d9>

                /* Check the pointer for sane values */
                if (((u_long)ptr & ((*mp)->size - 1))) {
 804a7b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a7b7:	8b 00                	mov    (%eax),%eax
 804a7b9:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804a7bd:	48                   	dec    %eax
 804a7be:	89 c2                	mov    %eax,%edx
 804a7c0:	8b 45 08             	mov    0x8(%ebp),%eax
 804a7c3:	21 d0                	and    %edx,%eax
 804a7c5:	85 c0                	test   %eax,%eax
 804a7c7:	74 18                	je     804a7e1 <irealloc+0x14a>
                        wrtwarning("modified (chunk-) pointer.\n");
 804a7c9:	8d 83 ba e4 ff ff    	lea    -0x1b46(%ebx),%eax
 804a7cf:	89 04 24             	mov    %eax,(%esp)
 804a7d2:	e8 93 f1 ff ff       	call   804996a <wrtwarning>
                        return 0;
 804a7d7:	b8 00 00 00 00       	mov    $0x0,%eax
 804a7dc:	e9 0e 01 00 00       	jmp    804a8ef <irealloc+0x258>
                }

                /* Find the chunk index in the page */
                i = ((u_long)ptr & malloc_pagemask) >> (*mp)->shift;
 804a7e1:	8b 45 08             	mov    0x8(%ebp),%eax
 804a7e4:	25 ff 0f 00 00       	and    $0xfff,%eax
 804a7e9:	89 c2                	mov    %eax,%edx
 804a7eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a7ee:	8b 00                	mov    (%eax),%eax
 804a7f0:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804a7f4:	88 c1                	mov    %al,%cl
 804a7f6:	d3 ea                	shr    %cl,%edx
 804a7f8:	89 d0                	mov    %edx,%eax
 804a7fa:	89 45 e8             	mov    %eax,-0x18(%ebp)

                /* Verify that it isn't a free chunk already */
                if ((*mp)->bits[i / MALLOC_BITS] & (1 << (i % MALLOC_BITS))) {
 804a7fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a800:	8b 00                	mov    (%eax),%eax
 804a802:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804a805:	c1 ea 05             	shr    $0x5,%edx
 804a808:	83 c2 04             	add    $0x4,%edx
 804a80b:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804a80e:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804a811:	83 e2 1f             	and    $0x1f,%edx
 804a814:	be 01 00 00 00       	mov    $0x1,%esi
 804a819:	88 d1                	mov    %dl,%cl
 804a81b:	d3 e6                	shl    %cl,%esi
 804a81d:	89 f2                	mov    %esi,%edx
 804a81f:	21 d0                	and    %edx,%eax
 804a821:	85 c0                	test   %eax,%eax
 804a823:	74 18                	je     804a83d <irealloc+0x1a6>
                        wrtwarning("chunk is already free.\n");
 804a825:	8d 83 d6 e4 ff ff    	lea    -0x1b2a(%ebx),%eax
 804a82b:	89 04 24             	mov    %eax,(%esp)
 804a82e:	e8 37 f1 ff ff       	call   804996a <wrtwarning>
                        return 0;
 804a833:	b8 00 00 00 00       	mov    $0x0,%eax
 804a838:	e9 b2 00 00 00       	jmp    804a8ef <irealloc+0x258>
                }

                osize = (*mp)->size;
 804a83d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a840:	8b 00                	mov    (%eax),%eax
 804a842:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804a846:	89 45 f4             	mov    %eax,-0xc(%ebp)

                if (!malloc_realloc &&          /* Unless we have to, */
 804a849:	8b 83 f4 00 00 00    	mov    0xf4(%ebx),%eax
 804a84f:	85 c0                	test   %eax,%eax
 804a851:	75 32                	jne    804a885 <irealloc+0x1ee>
 804a853:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a856:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804a859:	73 2a                	jae    804a885 <irealloc+0x1ee>
                    size < osize &&               /* ..or are too small, */
                    (size > osize / 2 ||          /* ..or could use a smaller size, */
 804a85b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a85e:	d1 e8                	shr    %eax
                }

                osize = (*mp)->size;

                if (!malloc_realloc &&          /* Unless we have to, */
                    size < osize &&               /* ..or are too small, */
 804a860:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804a863:	72 06                	jb     804a86b <irealloc+0x1d4>
                    (size > osize / 2 ||          /* ..or could use a smaller size, */
 804a865:	83 7d f4 10          	cmpl   $0x10,-0xc(%ebp)
 804a869:	75 1a                	jne    804a885 <irealloc+0x1ee>
                     osize == malloc_minsize)) {   /* ..(if there is one) */
                        return ptr;                 /* ..Don't do anything */
 804a86b:	8b 45 08             	mov    0x8(%ebp),%eax
 804a86e:	eb 7f                	jmp    804a8ef <irealloc+0x258>
                }

        } else {
                wrtwarning("pointer to wrong page.\n");
 804a870:	8d 83 ee e4 ff ff    	lea    -0x1b12(%ebx),%eax
 804a876:	89 04 24             	mov    %eax,(%esp)
 804a879:	e8 ec f0 ff ff       	call   804996a <wrtwarning>
                return 0;
 804a87e:	b8 00 00 00 00       	mov    $0x0,%eax
 804a883:	eb 6a                	jmp    804a8ef <irealloc+0x258>
        }

        p = imalloc(size);
 804a885:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a888:	89 04 24             	mov    %eax,(%esp)
 804a88b:	e8 51 fd ff ff       	call   804a5e1 <imalloc>
 804a890:	89 45 e4             	mov    %eax,-0x1c(%ebp)

        if (p) {
 804a893:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804a897:	74 53                	je     804a8ec <irealloc+0x255>
                /* copy the lesser of the two sizes, and free the old one */
                if (!size || !osize)
 804a899:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804a89d:	74 42                	je     804a8e1 <irealloc+0x24a>
 804a89f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a8a3:	74 3c                	je     804a8e1 <irealloc+0x24a>
                        ;
                else if (osize < size)
 804a8a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a8a8:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804a8ab:	73 1b                	jae    804a8c8 <irealloc+0x231>
                        memcpy(p, ptr, osize);
 804a8ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a8b0:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a8b4:	8b 45 08             	mov    0x8(%ebp),%eax
 804a8b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a8bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a8be:	89 04 24             	mov    %eax,(%esp)
 804a8c1:	e8 23 e6 ff ff       	call   8048ee9 <memcpy>
 804a8c6:	eb 19                	jmp    804a8e1 <irealloc+0x24a>
                else
                        memcpy(p, ptr, size);
 804a8c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a8cb:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a8cf:	8b 45 08             	mov    0x8(%ebp),%eax
 804a8d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a8d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a8d9:	89 04 24             	mov    %eax,(%esp)
 804a8dc:	e8 08 e6 ff ff       	call   8048ee9 <memcpy>
                ifree(ptr);
 804a8e1:	8b 45 08             	mov    0x8(%ebp),%eax
 804a8e4:	89 04 24             	mov    %eax,(%esp)
 804a8e7:	e8 14 06 00 00       	call   804af00 <ifree>
        }
        return p;
 804a8ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
 804a8ef:	83 c4 30             	add    $0x30,%esp
 804a8f2:	5b                   	pop    %ebx
 804a8f3:	5e                   	pop    %esi
 804a8f4:	5d                   	pop    %ebp
 804a8f5:	c3                   	ret    

0804a8f6 <free_pages>:
 * Free a sequence of pages
 */

static __inline__ void
free_pages(void *ptr, int index, struct pginfo *info)
{
 804a8f6:	55                   	push   %ebp
 804a8f7:	89 e5                	mov    %esp,%ebp
 804a8f9:	53                   	push   %ebx
 804a8fa:	83 ec 34             	sub    $0x34,%esp
 804a8fd:	e8 90 e5 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804a902:	81 c3 6a 39 00 00    	add    $0x396a,%ebx
        unsigned int i;
        struct pgfree *pf, *pt = 0;
 804a908:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
        u_long l;
        void *tail;

        if (info == MALLOC_FREE) {
 804a90f:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
 804a913:	75 13                	jne    804a928 <free_pages+0x32>
                wrtwarning("page is already free.\n");
 804a915:	8d 83 06 e5 ff ff    	lea    -0x1afa(%ebx),%eax
 804a91b:	89 04 24             	mov    %eax,(%esp)
 804a91e:	e8 47 f0 ff ff       	call   804996a <wrtwarning>
                return;
 804a923:	e9 db 03 00 00       	jmp    804ad03 <free_pages+0x40d>
        }

        if (info != MALLOC_FIRST) {
 804a928:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
 804a92c:	74 13                	je     804a941 <free_pages+0x4b>
                wrtwarning("pointer to wrong page.\n");
 804a92e:	8d 83 ee e4 ff ff    	lea    -0x1b12(%ebx),%eax
 804a934:	89 04 24             	mov    %eax,(%esp)
 804a937:	e8 2e f0 ff ff       	call   804996a <wrtwarning>
                return;
 804a93c:	e9 c2 03 00 00       	jmp    804ad03 <free_pages+0x40d>
        }

        if ((u_long)ptr & malloc_pagemask) {
 804a941:	8b 45 08             	mov    0x8(%ebp),%eax
 804a944:	25 ff 0f 00 00       	and    $0xfff,%eax
 804a949:	85 c0                	test   %eax,%eax
 804a94b:	74 13                	je     804a960 <free_pages+0x6a>
                wrtwarning("modified (page-) pointer.\n");
 804a94d:	8d 83 9f e4 ff ff    	lea    -0x1b61(%ebx),%eax
 804a953:	89 04 24             	mov    %eax,(%esp)
 804a956:	e8 0f f0 ff ff       	call   804996a <wrtwarning>
                return;
 804a95b:	e9 a3 03 00 00       	jmp    804ad03 <free_pages+0x40d>
        }

        /* Count how many pages and mark them free at the same time */
        page_dir[index] = MALLOC_FREE;
 804a960:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a966:	8b 55 0c             	mov    0xc(%ebp),%edx
 804a969:	c1 e2 02             	shl    $0x2,%edx
 804a96c:	01 d0                	add    %edx,%eax
 804a96e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        for (i = 1; page_dir[index + i] == MALLOC_FOLLOW; i++)
 804a974:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 804a97b:	eb 1c                	jmp    804a999 <free_pages+0xa3>
                page_dir[index + i] = MALLOC_FREE;
 804a97d:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a983:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804a986:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a989:	01 ca                	add    %ecx,%edx
 804a98b:	c1 e2 02             	shl    $0x2,%edx
 804a98e:	01 d0                	add    %edx,%eax
 804a990:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                return;
        }

        /* Count how many pages and mark them free at the same time */
        page_dir[index] = MALLOC_FREE;
        for (i = 1; page_dir[index + i] == MALLOC_FOLLOW; i++)
 804a996:	ff 45 f4             	incl   -0xc(%ebp)
 804a999:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804a99f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804a9a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a9a5:	01 ca                	add    %ecx,%edx
 804a9a7:	c1 e2 02             	shl    $0x2,%edx
 804a9aa:	01 d0                	add    %edx,%eax
 804a9ac:	8b 00                	mov    (%eax),%eax
 804a9ae:	83 f8 03             	cmp    $0x3,%eax
 804a9b1:	74 ca                	je     804a97d <free_pages+0x87>
                page_dir[index + i] = MALLOC_FREE;

        l = i << malloc_pageshift;
 804a9b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a9b6:	c1 e0 0c             	shl    $0xc,%eax
 804a9b9:	89 45 e8             	mov    %eax,-0x18(%ebp)

        if (malloc_junk)
 804a9bc:	8b 83 08 01 00 00    	mov    0x108(%ebx),%eax
 804a9c2:	85 c0                	test   %eax,%eax
 804a9c4:	74 1a                	je     804a9e0 <free_pages+0xea>
                memset(ptr, SOME_JUNK, l);
 804a9c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a9c9:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a9cd:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804a9d4:	00 
 804a9d5:	8b 45 08             	mov    0x8(%ebp),%eax
 804a9d8:	89 04 24             	mov    %eax,(%esp)
 804a9db:	e8 64 e6 ff ff       	call   8049044 <memset>
#ifdef HAS_MADVISE
        if (malloc_hint)
                madvise(ptr, l, MADV_FREE);
#endif

        tail = (char *)ptr + l;
 804a9e0:	8b 55 08             	mov    0x8(%ebp),%edx
 804a9e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a9e6:	01 d0                	add    %edx,%eax
 804a9e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)

        /* add to free-list */
        if (!px)
 804a9eb:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804a9f1:	85 c0                	test   %eax,%eax
 804a9f3:	75 12                	jne    804aa07 <free_pages+0x111>
                px = imalloc(sizeof * pt);      /* This cannot fail... */
 804a9f5:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
 804a9fc:	e8 e0 fb ff ff       	call   804a5e1 <imalloc>
 804aa01:	89 83 10 01 00 00    	mov    %eax,0x110(%ebx)
        px->page = ptr;
 804aa07:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aa0d:	8b 55 08             	mov    0x8(%ebp),%edx
 804aa10:	89 50 08             	mov    %edx,0x8(%eax)
        px->end =  tail;
 804aa13:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aa19:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804aa1c:	89 50 0c             	mov    %edx,0xc(%eax)
        px->size = l;
 804aa1f:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aa25:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804aa28:	89 50 10             	mov    %edx,0x10(%eax)
        if (!free_list.next) {
 804aa2b:	8b 83 d8 00 00 00    	mov    0xd8(%ebx),%eax
 804aa31:	85 c0                	test   %eax,%eax
 804aa33:	75 41                	jne    804aa76 <free_pages+0x180>

                /* Nothing on free list, put this at head */
                px->next = free_list.next;
 804aa35:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aa3b:	8b 93 d8 00 00 00    	mov    0xd8(%ebx),%edx
 804aa41:	89 10                	mov    %edx,(%eax)
                px->prev = &free_list;
 804aa43:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aa49:	8d 93 d8 00 00 00    	lea    0xd8(%ebx),%edx
 804aa4f:	89 50 04             	mov    %edx,0x4(%eax)
                free_list.next = px;
 804aa52:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aa58:	89 83 d8 00 00 00    	mov    %eax,0xd8(%ebx)
                pf = px;
 804aa5e:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aa64:	89 45 f0             	mov    %eax,-0x10(%ebp)
                px = 0;
 804aa67:	c7 83 10 01 00 00 00 	movl   $0x0,0x110(%ebx)
 804aa6e:	00 00 00 
 804aa71:	e9 a2 01 00 00       	jmp    804ac18 <free_pages+0x322>

        } else {

                /* Find the right spot, leave pf pointing to the modified entry. */
                tail = (char *)ptr + l;
 804aa76:	8b 55 08             	mov    0x8(%ebp),%edx
 804aa79:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aa7c:	01 d0                	add    %edx,%eax
 804aa7e:	89 45 e4             	mov    %eax,-0x1c(%ebp)

                for (pf = free_list.next; pf->end < ptr && pf->next; pf = pf->next)
 804aa81:	8b 83 d8 00 00 00    	mov    0xd8(%ebx),%eax
 804aa87:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804aa8a:	eb 08                	jmp    804aa94 <free_pages+0x19e>
 804aa8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aa8f:	8b 00                	mov    (%eax),%eax
 804aa91:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804aa94:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aa97:	8b 40 0c             	mov    0xc(%eax),%eax
 804aa9a:	3b 45 08             	cmp    0x8(%ebp),%eax
 804aa9d:	73 09                	jae    804aaa8 <free_pages+0x1b2>
 804aa9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aaa2:	8b 00                	mov    (%eax),%eax
 804aaa4:	85 c0                	test   %eax,%eax
 804aaa6:	75 e4                	jne    804aa8c <free_pages+0x196>
                        ; /* Race ahead here */

                if (pf->page > tail) {
 804aaa8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aaab:	8b 40 08             	mov    0x8(%eax),%eax
 804aaae:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 804aab1:	76 4f                	jbe    804ab02 <free_pages+0x20c>
                        /* Insert before entry */
                        px->next = pf;
 804aab3:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aab9:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804aabc:	89 10                	mov    %edx,(%eax)
                        px->prev = pf->prev;
 804aabe:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aac4:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804aac7:	8b 52 04             	mov    0x4(%edx),%edx
 804aaca:	89 50 04             	mov    %edx,0x4(%eax)
                        pf->prev = px;
 804aacd:	8b 93 10 01 00 00    	mov    0x110(%ebx),%edx
 804aad3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aad6:	89 50 04             	mov    %edx,0x4(%eax)
                        px->prev->next = px;
 804aad9:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aadf:	8b 40 04             	mov    0x4(%eax),%eax
 804aae2:	8b 93 10 01 00 00    	mov    0x110(%ebx),%edx
 804aae8:	89 10                	mov    %edx,(%eax)
                        pf = px;
 804aaea:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804aaf0:	89 45 f0             	mov    %eax,-0x10(%ebp)
                        px = 0;
 804aaf3:	c7 83 10 01 00 00 00 	movl   $0x0,0x110(%ebx)
 804aafa:	00 00 00 
 804aafd:	e9 16 01 00 00       	jmp    804ac18 <free_pages+0x322>
                } else if (pf->end == ptr) {
 804ab02:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab05:	8b 40 0c             	mov    0xc(%eax),%eax
 804ab08:	3b 45 08             	cmp    0x8(%ebp),%eax
 804ab0b:	0f 85 91 00 00 00    	jne    804aba2 <free_pages+0x2ac>
                        /* Append to the previous entry */
                        pf->end = (char *)pf->end + l;
 804ab11:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab14:	8b 50 0c             	mov    0xc(%eax),%edx
 804ab17:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ab1a:	01 c2                	add    %eax,%edx
 804ab1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab1f:	89 50 0c             	mov    %edx,0xc(%eax)
                        pf->size += l;
 804ab22:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab25:	8b 50 10             	mov    0x10(%eax),%edx
 804ab28:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ab2b:	01 c2                	add    %eax,%edx
 804ab2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab30:	89 50 10             	mov    %edx,0x10(%eax)
                        if (pf->next && pf->end == pf->next->page) {
 804ab33:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab36:	8b 00                	mov    (%eax),%eax
 804ab38:	85 c0                	test   %eax,%eax
 804ab3a:	0f 84 d8 00 00 00    	je     804ac18 <free_pages+0x322>
 804ab40:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab43:	8b 50 0c             	mov    0xc(%eax),%edx
 804ab46:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab49:	8b 00                	mov    (%eax),%eax
 804ab4b:	8b 40 08             	mov    0x8(%eax),%eax
 804ab4e:	39 c2                	cmp    %eax,%edx
 804ab50:	0f 85 c2 00 00 00    	jne    804ac18 <free_pages+0x322>
                                /* And collapse the next too. */
                                pt = pf->next;
 804ab56:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab59:	8b 00                	mov    (%eax),%eax
 804ab5b:	89 45 ec             	mov    %eax,-0x14(%ebp)
                                pf->end = pt->end;
 804ab5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804ab61:	8b 50 0c             	mov    0xc(%eax),%edx
 804ab64:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab67:	89 50 0c             	mov    %edx,0xc(%eax)
                                pf->size += pt->size;
 804ab6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab6d:	8b 50 10             	mov    0x10(%eax),%edx
 804ab70:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804ab73:	8b 40 10             	mov    0x10(%eax),%eax
 804ab76:	01 c2                	add    %eax,%edx
 804ab78:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab7b:	89 50 10             	mov    %edx,0x10(%eax)
                                pf->next = pt->next;
 804ab7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804ab81:	8b 10                	mov    (%eax),%edx
 804ab83:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab86:	89 10                	mov    %edx,(%eax)
                                if (pf->next)
 804ab88:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab8b:	8b 00                	mov    (%eax),%eax
 804ab8d:	85 c0                	test   %eax,%eax
 804ab8f:	0f 84 83 00 00 00    	je     804ac18 <free_pages+0x322>
                                        pf->next->prev = pf;
 804ab95:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab98:	8b 00                	mov    (%eax),%eax
 804ab9a:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804ab9d:	89 50 04             	mov    %edx,0x4(%eax)
 804aba0:	eb 76                	jmp    804ac18 <free_pages+0x322>
                        }
                } else if (pf->page == tail) {
 804aba2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aba5:	8b 40 08             	mov    0x8(%eax),%eax
 804aba8:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 804abab:	75 1c                	jne    804abc9 <free_pages+0x2d3>
                        /* Prepend to entry */
                        pf->size += l;
 804abad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804abb0:	8b 50 10             	mov    0x10(%eax),%edx
 804abb3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804abb6:	01 c2                	add    %eax,%edx
 804abb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804abbb:	89 50 10             	mov    %edx,0x10(%eax)
                        pf->page = ptr;
 804abbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804abc1:	8b 55 08             	mov    0x8(%ebp),%edx
 804abc4:	89 50 08             	mov    %edx,0x8(%eax)
 804abc7:	eb 4f                	jmp    804ac18 <free_pages+0x322>
                } else if (!pf->next) {
 804abc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804abcc:	8b 00                	mov    (%eax),%eax
 804abce:	85 c0                	test   %eax,%eax
 804abd0:	75 38                	jne    804ac0a <free_pages+0x314>
                        /* Append at tail of chain */
                        px->next = 0;
 804abd2:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804abd8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
                        px->prev = pf;
 804abde:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804abe4:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804abe7:	89 50 04             	mov    %edx,0x4(%eax)
                        pf->next = px;
 804abea:	8b 93 10 01 00 00    	mov    0x110(%ebx),%edx
 804abf0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804abf3:	89 10                	mov    %edx,(%eax)
                        pf = px;
 804abf5:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804abfb:	89 45 f0             	mov    %eax,-0x10(%ebp)
                        px = 0;
 804abfe:	c7 83 10 01 00 00 00 	movl   $0x0,0x110(%ebx)
 804ac05:	00 00 00 
 804ac08:	eb 0e                	jmp    804ac18 <free_pages+0x322>
                } else {
                        wrterror("freelist is destroyed.\n");
 804ac0a:	8d 83 1d e5 ff ff    	lea    -0x1ae3(%ebx),%eax
 804ac10:	89 04 24             	mov    %eax,(%esp)
 804ac13:	e8 82 ec ff ff       	call   804989a <wrterror>
                }
        }

        /* Return something to OS ? */
        if (!pf->next &&                            /* If we're the last one, */
 804ac18:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ac1b:	8b 00                	mov    (%eax),%eax
 804ac1d:	85 c0                	test   %eax,%eax
 804ac1f:	0f 85 cd 00 00 00    	jne    804acf2 <free_pages+0x3fc>
            pf->size > malloc_cache &&                /* ..and the cache is full, */
 804ac25:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ac28:	8b 50 10             	mov    0x10(%eax),%edx
 804ac2b:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
                        wrterror("freelist is destroyed.\n");
                }
        }

        /* Return something to OS ? */
        if (!pf->next &&                            /* If we're the last one, */
 804ac31:	39 c2                	cmp    %eax,%edx
 804ac33:	0f 86 b9 00 00 00    	jbe    804acf2 <free_pages+0x3fc>
            pf->size > malloc_cache &&                /* ..and the cache is full, */
            pf->end == malloc_brk &&                  /* ..and none behind us, */
 804ac39:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ac3c:	8b 50 0c             	mov    0xc(%eax),%edx
 804ac3f:	8b 83 0c 01 00 00    	mov    0x10c(%ebx),%eax
                }
        }

        /* Return something to OS ? */
        if (!pf->next &&                            /* If we're the last one, */
            pf->size > malloc_cache &&                /* ..and the cache is full, */
 804ac45:	39 c2                	cmp    %eax,%edx
 804ac47:	0f 85 a5 00 00 00    	jne    804acf2 <free_pages+0x3fc>
            pf->end == malloc_brk &&                  /* ..and none behind us, */
            malloc_brk == sbrk(0)) {                  /* ..and it's OK to do... */
 804ac4d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804ac54:	e8 df d4 ff ff       	call   8048138 <sbrk>
 804ac59:	89 c2                	mov    %eax,%edx
 804ac5b:	8b 83 0c 01 00 00    	mov    0x10c(%ebx),%eax
        }

        /* Return something to OS ? */
        if (!pf->next &&                            /* If we're the last one, */
            pf->size > malloc_cache &&                /* ..and the cache is full, */
            pf->end == malloc_brk &&                  /* ..and none behind us, */
 804ac61:	39 c2                	cmp    %eax,%edx
 804ac63:	0f 85 89 00 00 00    	jne    804acf2 <free_pages+0x3fc>

                /*
                 * Keep the cache intact.  Notice that the '>' above guarantees that
                 * the pf will always have at least one page afterwards.
                 */
                pf->end = (char *)pf->page + malloc_cache;
 804ac69:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ac6c:	8b 50 08             	mov    0x8(%eax),%edx
 804ac6f:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
 804ac75:	01 c2                	add    %eax,%edx
 804ac77:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ac7a:	89 50 0c             	mov    %edx,0xc(%eax)
                pf->size = malloc_cache;
 804ac7d:	8b 93 0c 00 00 00    	mov    0xc(%ebx),%edx
 804ac83:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ac86:	89 50 10             	mov    %edx,0x10(%eax)

                brk(pf->end);
 804ac89:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ac8c:	8b 40 0c             	mov    0xc(%eax),%eax
 804ac8f:	89 04 24             	mov    %eax,(%esp)
 804ac92:	e8 6a d5 ff ff       	call   8048201 <brk>
                malloc_brk = pf->end;
 804ac97:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ac9a:	8b 40 0c             	mov    0xc(%eax),%eax
 804ac9d:	89 83 0c 01 00 00    	mov    %eax,0x10c(%ebx)

                index = ptr2index(pf->end);
 804aca3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aca6:	8b 40 0c             	mov    0xc(%eax),%eax
 804aca9:	c1 e8 0c             	shr    $0xc,%eax
 804acac:	89 c2                	mov    %eax,%edx
 804acae:	8b 83 c8 00 00 00    	mov    0xc8(%ebx),%eax
 804acb4:	29 c2                	sub    %eax,%edx
 804acb6:	89 d0                	mov    %edx,%eax
 804acb8:	89 45 0c             	mov    %eax,0xc(%ebp)
                last_index = index - 1;
 804acbb:	8b 45 0c             	mov    0xc(%ebp),%eax
 804acbe:	48                   	dec    %eax
 804acbf:	89 83 cc 00 00 00    	mov    %eax,0xcc(%ebx)

                for (i = index; i <= last_index;)
 804acc5:	8b 45 0c             	mov    0xc(%ebp),%eax
 804acc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804accb:	eb 1a                	jmp    804ace7 <free_pages+0x3f1>
                        page_dir[i++] = MALLOC_NOT_MINE;
 804accd:	8b 8b d0 00 00 00    	mov    0xd0(%ebx),%ecx
 804acd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804acd6:	8d 50 01             	lea    0x1(%eax),%edx
 804acd9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804acdc:	c1 e0 02             	shl    $0x2,%eax
 804acdf:	01 c8                	add    %ecx,%eax
 804ace1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
                malloc_brk = pf->end;

                index = ptr2index(pf->end);
                last_index = index - 1;

                for (i = index; i <= last_index;)
 804ace7:	8b 83 cc 00 00 00    	mov    0xcc(%ebx),%eax
 804aced:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 804acf0:	76 db                	jbe    804accd <free_pages+0x3d7>
                        page_dir[i++] = MALLOC_NOT_MINE;

                /* XXX: We could realloc/shrink the pagedir here I guess. */
        }
        if (pt)
 804acf2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 804acf6:	74 0b                	je     804ad03 <free_pages+0x40d>
                ifree(pt);
 804acf8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804acfb:	89 04 24             	mov    %eax,(%esp)
 804acfe:	e8 fd 01 00 00       	call   804af00 <ifree>
}
 804ad03:	83 c4 34             	add    $0x34,%esp
 804ad06:	5b                   	pop    %ebx
 804ad07:	5d                   	pop    %ebp
 804ad08:	c3                   	ret    

0804ad09 <free_bytes>:
 * Free a chunk, and possibly the page it's on, if the page becomes empty.
 */

static __inline__ void
free_bytes(void *ptr, int index, struct pginfo *info)
{
 804ad09:	55                   	push   %ebp
 804ad0a:	89 e5                	mov    %esp,%ebp
 804ad0c:	56                   	push   %esi
 804ad0d:	53                   	push   %ebx
 804ad0e:	83 ec 20             	sub    $0x20,%esp
 804ad11:	e8 7c e1 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804ad16:	81 c3 56 35 00 00    	add    $0x3556,%ebx
        int i;
        struct pginfo **mp;
        void *vp;

        /* Find the chunk number on the page */
        i = ((u_long)ptr & malloc_pagemask) >> info->shift;
 804ad1c:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad1f:	25 ff 0f 00 00       	and    $0xfff,%eax
 804ad24:	89 c2                	mov    %eax,%edx
 804ad26:	8b 45 10             	mov    0x10(%ebp),%eax
 804ad29:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804ad2d:	88 c1                	mov    %al,%cl
 804ad2f:	d3 ea                	shr    %cl,%edx
 804ad31:	89 d0                	mov    %edx,%eax
 804ad33:	89 45 f0             	mov    %eax,-0x10(%ebp)

        if (((u_long)ptr & (info->size - 1))) {
 804ad36:	8b 45 10             	mov    0x10(%ebp),%eax
 804ad39:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804ad3d:	48                   	dec    %eax
 804ad3e:	89 c2                	mov    %eax,%edx
 804ad40:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad43:	21 d0                	and    %edx,%eax
 804ad45:	85 c0                	test   %eax,%eax
 804ad47:	74 13                	je     804ad5c <free_bytes+0x53>
                wrtwarning("modified (chunk-) pointer.\n");
 804ad49:	8d 83 ba e4 ff ff    	lea    -0x1b46(%ebx),%eax
 804ad4f:	89 04 24             	mov    %eax,(%esp)
 804ad52:	e8 13 ec ff ff       	call   804996a <wrtwarning>
                return;
 804ad57:	e9 9d 01 00 00       	jmp    804aef9 <free_bytes+0x1f0>
        }

        if (info->bits[i / MALLOC_BITS] & (1 << (i % MALLOC_BITS))) {
 804ad5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ad5f:	c1 e8 05             	shr    $0x5,%eax
 804ad62:	89 c2                	mov    %eax,%edx
 804ad64:	8b 45 10             	mov    0x10(%ebp),%eax
 804ad67:	83 c2 04             	add    $0x4,%edx
 804ad6a:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804ad6d:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804ad70:	83 e2 1f             	and    $0x1f,%edx
 804ad73:	be 01 00 00 00       	mov    $0x1,%esi
 804ad78:	88 d1                	mov    %dl,%cl
 804ad7a:	d3 e6                	shl    %cl,%esi
 804ad7c:	89 f2                	mov    %esi,%edx
 804ad7e:	21 d0                	and    %edx,%eax
 804ad80:	85 c0                	test   %eax,%eax
 804ad82:	74 13                	je     804ad97 <free_bytes+0x8e>
                wrtwarning("chunk is already free.\n");
 804ad84:	8d 83 d6 e4 ff ff    	lea    -0x1b2a(%ebx),%eax
 804ad8a:	89 04 24             	mov    %eax,(%esp)
 804ad8d:	e8 d8 eb ff ff       	call   804996a <wrtwarning>
                return;
 804ad92:	e9 62 01 00 00       	jmp    804aef9 <free_bytes+0x1f0>
        }

        if (malloc_junk)
 804ad97:	8b 83 08 01 00 00    	mov    0x108(%ebx),%eax
 804ad9d:	85 c0                	test   %eax,%eax
 804ad9f:	74 1e                	je     804adbf <free_bytes+0xb6>
                memset(ptr, SOME_JUNK, info->size);
 804ada1:	8b 45 10             	mov    0x10(%ebp),%eax
 804ada4:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804ada8:	89 44 24 08          	mov    %eax,0x8(%esp)
 804adac:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804adb3:	00 
 804adb4:	8b 45 08             	mov    0x8(%ebp),%eax
 804adb7:	89 04 24             	mov    %eax,(%esp)
 804adba:	e8 85 e2 ff ff       	call   8049044 <memset>

        info->bits[i / MALLOC_BITS] |= 1 << (i % MALLOC_BITS);
 804adbf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804adc2:	c1 e8 05             	shr    $0x5,%eax
 804adc5:	8b 55 10             	mov    0x10(%ebp),%edx
 804adc8:	8d 48 04             	lea    0x4(%eax),%ecx
 804adcb:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804adce:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 804add1:	83 e1 1f             	and    $0x1f,%ecx
 804add4:	be 01 00 00 00       	mov    $0x1,%esi
 804add9:	d3 e6                	shl    %cl,%esi
 804addb:	89 f1                	mov    %esi,%ecx
 804addd:	09 d1                	or     %edx,%ecx
 804addf:	8b 55 10             	mov    0x10(%ebp),%edx
 804ade2:	83 c0 04             	add    $0x4,%eax
 804ade5:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
        info->free++;
 804ade8:	8b 45 10             	mov    0x10(%ebp),%eax
 804adeb:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804adef:	40                   	inc    %eax
 804adf0:	0f b7 d0             	movzwl %ax,%edx
 804adf3:	8b 45 10             	mov    0x10(%ebp),%eax
 804adf6:	66 89 50 0c          	mov    %dx,0xc(%eax)

        mp = page_dir + info->shift;
 804adfa:	8b 93 d0 00 00 00    	mov    0xd0(%ebx),%edx
 804ae00:	8b 45 10             	mov    0x10(%ebp),%eax
 804ae03:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804ae07:	c1 e0 02             	shl    $0x2,%eax
 804ae0a:	01 d0                	add    %edx,%eax
 804ae0c:	89 45 f4             	mov    %eax,-0xc(%ebp)

        if (info->free == 1) {
 804ae0f:	8b 45 10             	mov    0x10(%ebp),%eax
 804ae12:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804ae16:	83 f8 01             	cmp    $0x1,%eax
 804ae19:	75 5e                	jne    804ae79 <free_bytes+0x170>

                /* Page became non-full */

                mp = page_dir + info->shift;
 804ae1b:	8b 93 d0 00 00 00    	mov    0xd0(%ebx),%edx
 804ae21:	8b 45 10             	mov    0x10(%ebp),%eax
 804ae24:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804ae28:	c1 e0 02             	shl    $0x2,%eax
 804ae2b:	01 d0                	add    %edx,%eax
 804ae2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
                /* Insert in address order */
                while (*mp && (*mp)->next && (*mp)->next->page < info->page)
 804ae30:	eb 08                	jmp    804ae3a <free_bytes+0x131>
                        mp = &(*mp)->next;
 804ae32:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ae35:	8b 00                	mov    (%eax),%eax
 804ae37:	89 45 f4             	mov    %eax,-0xc(%ebp)

                /* Page became non-full */

                mp = page_dir + info->shift;
                /* Insert in address order */
                while (*mp && (*mp)->next && (*mp)->next->page < info->page)
 804ae3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ae3d:	8b 00                	mov    (%eax),%eax
 804ae3f:	85 c0                	test   %eax,%eax
 804ae41:	74 1f                	je     804ae62 <free_bytes+0x159>
 804ae43:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ae46:	8b 00                	mov    (%eax),%eax
 804ae48:	8b 00                	mov    (%eax),%eax
 804ae4a:	85 c0                	test   %eax,%eax
 804ae4c:	74 14                	je     804ae62 <free_bytes+0x159>
 804ae4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ae51:	8b 00                	mov    (%eax),%eax
 804ae53:	8b 00                	mov    (%eax),%eax
 804ae55:	8b 50 04             	mov    0x4(%eax),%edx
 804ae58:	8b 45 10             	mov    0x10(%ebp),%eax
 804ae5b:	8b 40 04             	mov    0x4(%eax),%eax
 804ae5e:	39 c2                	cmp    %eax,%edx
 804ae60:	72 d0                	jb     804ae32 <free_bytes+0x129>
                        mp = &(*mp)->next;
                info->next = *mp;
 804ae62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ae65:	8b 10                	mov    (%eax),%edx
 804ae67:	8b 45 10             	mov    0x10(%ebp),%eax
 804ae6a:	89 10                	mov    %edx,(%eax)
                *mp = info;
 804ae6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ae6f:	8b 55 10             	mov    0x10(%ebp),%edx
 804ae72:	89 10                	mov    %edx,(%eax)
                return;
 804ae74:	e9 80 00 00 00       	jmp    804aef9 <free_bytes+0x1f0>
        }

        if (info->free != info->total)
 804ae79:	8b 45 10             	mov    0x10(%ebp),%eax
 804ae7c:	0f b7 50 0c          	movzwl 0xc(%eax),%edx
 804ae80:	8b 45 10             	mov    0x10(%ebp),%eax
 804ae83:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804ae87:	39 c2                	cmp    %eax,%edx
 804ae89:	75 6d                	jne    804aef8 <free_bytes+0x1ef>
                return;

        /* Find & remove this page in the queue */
        while (*mp != info) {
 804ae8b:	eb 08                	jmp    804ae95 <free_bytes+0x18c>
                mp = &((*mp)->next);
 804ae8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ae90:	8b 00                	mov    (%eax),%eax
 804ae92:	89 45 f4             	mov    %eax,-0xc(%ebp)

        if (info->free != info->total)
                return;

        /* Find & remove this page in the queue */
        while (*mp != info) {
 804ae95:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ae98:	8b 00                	mov    (%eax),%eax
 804ae9a:	3b 45 10             	cmp    0x10(%ebp),%eax
 804ae9d:	75 ee                	jne    804ae8d <free_bytes+0x184>
#ifdef EXTRA_SANITY
                if (!*mp)
                        wrterror("(ES): Not on queue\n");
#endif /* EXTRA_SANITY */
        }
        *mp = info->next;
 804ae9f:	8b 45 10             	mov    0x10(%ebp),%eax
 804aea2:	8b 10                	mov    (%eax),%edx
 804aea4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804aea7:	89 10                	mov    %edx,(%eax)

        /* Free the page & the info structure if need be */
        page_dir[ptr2index(info->page)] = MALLOC_FIRST;
 804aea9:	8b 93 d0 00 00 00    	mov    0xd0(%ebx),%edx
 804aeaf:	8b 45 10             	mov    0x10(%ebp),%eax
 804aeb2:	8b 40 04             	mov    0x4(%eax),%eax
 804aeb5:	c1 e8 0c             	shr    $0xc,%eax
 804aeb8:	89 c1                	mov    %eax,%ecx
 804aeba:	8b 83 c8 00 00 00    	mov    0xc8(%ebx),%eax
 804aec0:	29 c1                	sub    %eax,%ecx
 804aec2:	89 c8                	mov    %ecx,%eax
 804aec4:	c1 e0 02             	shl    $0x2,%eax
 804aec7:	01 d0                	add    %edx,%eax
 804aec9:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        vp = info->page;            /* Order is important ! */
 804aecf:	8b 45 10             	mov    0x10(%ebp),%eax
 804aed2:	8b 40 04             	mov    0x4(%eax),%eax
 804aed5:	89 45 ec             	mov    %eax,-0x14(%ebp)
        if (vp != (void *)info)
 804aed8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804aedb:	3b 45 10             	cmp    0x10(%ebp),%eax
 804aede:	74 0b                	je     804aeeb <free_bytes+0x1e2>
                ifree(info);
 804aee0:	8b 45 10             	mov    0x10(%ebp),%eax
 804aee3:	89 04 24             	mov    %eax,(%esp)
 804aee6:	e8 15 00 00 00       	call   804af00 <ifree>
        ifree(vp);
 804aeeb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804aeee:	89 04 24             	mov    %eax,(%esp)
 804aef1:	e8 0a 00 00 00       	call   804af00 <ifree>
 804aef6:	eb 01                	jmp    804aef9 <free_bytes+0x1f0>
                *mp = info;
                return;
        }

        if (info->free != info->total)
                return;
 804aef8:	90                   	nop
        page_dir[ptr2index(info->page)] = MALLOC_FIRST;
        vp = info->page;            /* Order is important ! */
        if (vp != (void *)info)
                ifree(info);
        ifree(vp);
}
 804aef9:	83 c4 20             	add    $0x20,%esp
 804aefc:	5b                   	pop    %ebx
 804aefd:	5e                   	pop    %esi
 804aefe:	5d                   	pop    %ebp
 804aeff:	c3                   	ret    

0804af00 <ifree>:

static void
ifree(void *ptr)
{
 804af00:	55                   	push   %ebp
 804af01:	89 e5                	mov    %esp,%ebp
 804af03:	56                   	push   %esi
 804af04:	53                   	push   %ebx
 804af05:	83 ec 50             	sub    $0x50,%esp
 804af08:	e8 85 df ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804af0d:	81 c3 5f 33 00 00    	add    $0x335f,%ebx
        struct pginfo *info;
        unsigned int index;

        /* This is legal */
        if (!ptr)
 804af13:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804af17:	0f 84 9c 06 00 00    	je     804b5b9 <ifree+0x6b9>
                return;

        if (!malloc_started) {
 804af1d:	8b 83 c0 00 00 00    	mov    0xc0(%ebx),%eax
 804af23:	85 c0                	test   %eax,%eax
 804af25:	75 13                	jne    804af3a <ifree+0x3a>
                wrtwarning("malloc() has never been called.\n");
 804af27:	8d 83 38 e5 ff ff    	lea    -0x1ac8(%ebx),%eax
 804af2d:	89 04 24             	mov    %eax,(%esp)
 804af30:	e8 35 ea ff ff       	call   804996a <wrtwarning>
                return;
 804af35:	e9 86 06 00 00       	jmp    804b5c0 <ifree+0x6c0>
        }

        /* If we're already sinking, don't make matters any worse. */
        if (suicide)
 804af3a:	8b 83 f0 00 00 00    	mov    0xf0(%ebx),%eax
 804af40:	85 c0                	test   %eax,%eax
 804af42:	0f 85 74 06 00 00    	jne    804b5bc <ifree+0x6bc>
                return;

        index = ptr2index(ptr);
 804af48:	8b 45 08             	mov    0x8(%ebp),%eax
 804af4b:	c1 e8 0c             	shr    $0xc,%eax
 804af4e:	89 c2                	mov    %eax,%edx
 804af50:	8b 83 c8 00 00 00    	mov    0xc8(%ebx),%eax
 804af56:	29 c2                	sub    %eax,%edx
 804af58:	89 d0                	mov    %edx,%eax
 804af5a:	89 45 f4             	mov    %eax,-0xc(%ebp)

        if (index < malloc_pageshift) {
 804af5d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
 804af61:	77 13                	ja     804af76 <ifree+0x76>
                wrtwarning("junk pointer, too low to make sense.\n");
 804af63:	8d 83 50 e4 ff ff    	lea    -0x1bb0(%ebx),%eax
 804af69:	89 04 24             	mov    %eax,(%esp)
 804af6c:	e8 f9 e9 ff ff       	call   804996a <wrtwarning>
                return;
 804af71:	e9 4a 06 00 00       	jmp    804b5c0 <ifree+0x6c0>
        }

        if (index > last_index) {
 804af76:	8b 83 cc 00 00 00    	mov    0xcc(%ebx),%eax
 804af7c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 804af7f:	76 13                	jbe    804af94 <ifree+0x94>
                wrtwarning("junk pointer, too high to make sense.\n");
 804af81:	8d 83 78 e4 ff ff    	lea    -0x1b88(%ebx),%eax
 804af87:	89 04 24             	mov    %eax,(%esp)
 804af8a:	e8 db e9 ff ff       	call   804996a <wrtwarning>
                return;
 804af8f:	e9 2c 06 00 00       	jmp    804b5c0 <ifree+0x6c0>
        }

        info = page_dir[index];
 804af94:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804af9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804af9d:	c1 e2 02             	shl    $0x2,%edx
 804afa0:	01 d0                	add    %edx,%eax
 804afa2:	8b 00                	mov    (%eax),%eax
 804afa4:	89 45 f0             	mov    %eax,-0x10(%ebp)

        if (info < MALLOC_MAGIC)
 804afa7:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
 804afab:	0f 87 19 04 00 00    	ja     804b3ca <ifree+0x4ca>
                free_pages(ptr, index, info);
 804afb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804afb4:	8b 55 08             	mov    0x8(%ebp),%edx
 804afb7:	89 55 e8             	mov    %edx,-0x18(%ebp)
 804afba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804afbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804afc0:	89 45 e0             	mov    %eax,-0x20(%ebp)

static __inline__ void
free_pages(void *ptr, int index, struct pginfo *info)
{
        unsigned int i;
        struct pgfree *pf, *pt = 0;
 804afc3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
        u_long l;
        void *tail;

        if (info == MALLOC_FREE) {
 804afca:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
 804afce:	75 13                	jne    804afe3 <ifree+0xe3>
                wrtwarning("page is already free.\n");
 804afd0:	8d 83 06 e5 ff ff    	lea    -0x1afa(%ebx),%eax
 804afd6:	89 04 24             	mov    %eax,(%esp)
 804afd9:	e8 8c e9 ff ff       	call   804996a <wrtwarning>

        if (info < MALLOC_MAGIC)
                free_pages(ptr, index, info);
        else
                free_bytes(ptr, index, info);
        return;
 804afde:	e9 dc 05 00 00       	jmp    804b5bf <ifree+0x6bf>
        if (info == MALLOC_FREE) {
                wrtwarning("page is already free.\n");
                return;
        }

        if (info != MALLOC_FIRST) {
 804afe3:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
 804afe7:	74 13                	je     804affc <ifree+0xfc>
                wrtwarning("pointer to wrong page.\n");
 804afe9:	8d 83 ee e4 ff ff    	lea    -0x1b12(%ebx),%eax
 804afef:	89 04 24             	mov    %eax,(%esp)
 804aff2:	e8 73 e9 ff ff       	call   804996a <wrtwarning>

        if (info < MALLOC_MAGIC)
                free_pages(ptr, index, info);
        else
                free_bytes(ptr, index, info);
        return;
 804aff7:	e9 c3 05 00 00       	jmp    804b5bf <ifree+0x6bf>
        if (info != MALLOC_FIRST) {
                wrtwarning("pointer to wrong page.\n");
                return;
        }

        if ((u_long)ptr & malloc_pagemask) {
 804affc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804afff:	25 ff 0f 00 00       	and    $0xfff,%eax
 804b004:	85 c0                	test   %eax,%eax
 804b006:	74 13                	je     804b01b <ifree+0x11b>
                wrtwarning("modified (page-) pointer.\n");
 804b008:	8d 83 9f e4 ff ff    	lea    -0x1b61(%ebx),%eax
 804b00e:	89 04 24             	mov    %eax,(%esp)
 804b011:	e8 54 e9 ff ff       	call   804996a <wrtwarning>

        if (info < MALLOC_MAGIC)
                free_pages(ptr, index, info);
        else
                free_bytes(ptr, index, info);
        return;
 804b016:	e9 a4 05 00 00       	jmp    804b5bf <ifree+0x6bf>
                wrtwarning("modified (page-) pointer.\n");
                return;
        }

        /* Count how many pages and mark them free at the same time */
        page_dir[index] = MALLOC_FREE;
 804b01b:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804b021:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804b024:	c1 e2 02             	shl    $0x2,%edx
 804b027:	01 d0                	add    %edx,%eax
 804b029:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
        for (i = 1; page_dir[index + i] == MALLOC_FOLLOW; i++)
 804b02f:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
 804b036:	eb 1c                	jmp    804b054 <ifree+0x154>
                page_dir[index + i] = MALLOC_FREE;
 804b038:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804b03e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804b041:	8b 55 d8             	mov    -0x28(%ebp),%edx
 804b044:	01 ca                	add    %ecx,%edx
 804b046:	c1 e2 02             	shl    $0x2,%edx
 804b049:	01 d0                	add    %edx,%eax
 804b04b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
                return;
        }

        /* Count how many pages and mark them free at the same time */
        page_dir[index] = MALLOC_FREE;
        for (i = 1; page_dir[index + i] == MALLOC_FOLLOW; i++)
 804b051:	ff 45 d8             	incl   -0x28(%ebp)
 804b054:	8b 83 d0 00 00 00    	mov    0xd0(%ebx),%eax
 804b05a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 804b05d:	8b 55 d8             	mov    -0x28(%ebp),%edx
 804b060:	01 ca                	add    %ecx,%edx
 804b062:	c1 e2 02             	shl    $0x2,%edx
 804b065:	01 d0                	add    %edx,%eax
 804b067:	8b 00                	mov    (%eax),%eax
 804b069:	83 f8 03             	cmp    $0x3,%eax
 804b06c:	74 ca                	je     804b038 <ifree+0x138>
                page_dir[index + i] = MALLOC_FREE;

        l = i << malloc_pageshift;
 804b06e:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804b071:	c1 e0 0c             	shl    $0xc,%eax
 804b074:	89 45 d4             	mov    %eax,-0x2c(%ebp)

        if (malloc_junk)
 804b077:	8b 83 08 01 00 00    	mov    0x108(%ebx),%eax
 804b07d:	85 c0                	test   %eax,%eax
 804b07f:	74 1a                	je     804b09b <ifree+0x19b>
                memset(ptr, SOME_JUNK, l);
 804b081:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b084:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b088:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804b08f:	00 
 804b090:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804b093:	89 04 24             	mov    %eax,(%esp)
 804b096:	e8 a9 df ff ff       	call   8049044 <memset>
#ifdef HAS_MADVISE
        if (malloc_hint)
                madvise(ptr, l, MADV_FREE);
#endif

        tail = (char *)ptr + l;
 804b09b:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804b09e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b0a1:	01 d0                	add    %edx,%eax
 804b0a3:	89 45 d0             	mov    %eax,-0x30(%ebp)

        /* add to free-list */
        if (!px)
 804b0a6:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b0ac:	85 c0                	test   %eax,%eax
 804b0ae:	75 12                	jne    804b0c2 <ifree+0x1c2>
                px = imalloc(sizeof * pt);      /* This cannot fail... */
 804b0b0:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
 804b0b7:	e8 25 f5 ff ff       	call   804a5e1 <imalloc>
 804b0bc:	89 83 10 01 00 00    	mov    %eax,0x110(%ebx)
        px->page = ptr;
 804b0c2:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b0c8:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804b0cb:	89 50 08             	mov    %edx,0x8(%eax)
        px->end =  tail;
 804b0ce:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b0d4:	8b 55 d0             	mov    -0x30(%ebp),%edx
 804b0d7:	89 50 0c             	mov    %edx,0xc(%eax)
        px->size = l;
 804b0da:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b0e0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804b0e3:	89 50 10             	mov    %edx,0x10(%eax)
        if (!free_list.next) {
 804b0e6:	8b 83 d8 00 00 00    	mov    0xd8(%ebx),%eax
 804b0ec:	85 c0                	test   %eax,%eax
 804b0ee:	75 41                	jne    804b131 <ifree+0x231>

                /* Nothing on free list, put this at head */
                px->next = free_list.next;
 804b0f0:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b0f6:	8b 93 d8 00 00 00    	mov    0xd8(%ebx),%edx
 804b0fc:	89 10                	mov    %edx,(%eax)
                px->prev = &free_list;
 804b0fe:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b104:	8d 93 d8 00 00 00    	lea    0xd8(%ebx),%edx
 804b10a:	89 50 04             	mov    %edx,0x4(%eax)
                free_list.next = px;
 804b10d:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b113:	89 83 d8 00 00 00    	mov    %eax,0xd8(%ebx)
                pf = px;
 804b119:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b11f:	89 45 cc             	mov    %eax,-0x34(%ebp)
                px = 0;
 804b122:	c7 83 10 01 00 00 00 	movl   $0x0,0x110(%ebx)
 804b129:	00 00 00 
 804b12c:	e9 a5 01 00 00       	jmp    804b2d6 <ifree+0x3d6>

        } else {

                /* Find the right spot, leave pf pointing to the modified entry. */
                tail = (char *)ptr + l;
 804b131:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804b134:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b137:	01 d0                	add    %edx,%eax
 804b139:	89 45 d0             	mov    %eax,-0x30(%ebp)

                for (pf = free_list.next; pf->end < ptr && pf->next; pf = pf->next)
 804b13c:	8b 83 d8 00 00 00    	mov    0xd8(%ebx),%eax
 804b142:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804b145:	eb 08                	jmp    804b14f <ifree+0x24f>
 804b147:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b14a:	8b 00                	mov    (%eax),%eax
 804b14c:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804b14f:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b152:	8b 40 0c             	mov    0xc(%eax),%eax
 804b155:	39 45 e8             	cmp    %eax,-0x18(%ebp)
 804b158:	76 09                	jbe    804b163 <ifree+0x263>
 804b15a:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b15d:	8b 00                	mov    (%eax),%eax
 804b15f:	85 c0                	test   %eax,%eax
 804b161:	75 e4                	jne    804b147 <ifree+0x247>
                        ; /* Race ahead here */

                if (pf->page > tail) {
 804b163:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b166:	8b 40 08             	mov    0x8(%eax),%eax
 804b169:	39 45 d0             	cmp    %eax,-0x30(%ebp)
 804b16c:	73 4f                	jae    804b1bd <ifree+0x2bd>
                        /* Insert before entry */
                        px->next = pf;
 804b16e:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b174:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804b177:	89 10                	mov    %edx,(%eax)
                        px->prev = pf->prev;
 804b179:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b17f:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804b182:	8b 52 04             	mov    0x4(%edx),%edx
 804b185:	89 50 04             	mov    %edx,0x4(%eax)
                        pf->prev = px;
 804b188:	8b 93 10 01 00 00    	mov    0x110(%ebx),%edx
 804b18e:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b191:	89 50 04             	mov    %edx,0x4(%eax)
                        px->prev->next = px;
 804b194:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b19a:	8b 40 04             	mov    0x4(%eax),%eax
 804b19d:	8b 93 10 01 00 00    	mov    0x110(%ebx),%edx
 804b1a3:	89 10                	mov    %edx,(%eax)
                        pf = px;
 804b1a5:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b1ab:	89 45 cc             	mov    %eax,-0x34(%ebp)
                        px = 0;
 804b1ae:	c7 83 10 01 00 00 00 	movl   $0x0,0x110(%ebx)
 804b1b5:	00 00 00 
 804b1b8:	e9 19 01 00 00       	jmp    804b2d6 <ifree+0x3d6>
                } else if (pf->end == ptr) {
 804b1bd:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b1c0:	8b 40 0c             	mov    0xc(%eax),%eax
 804b1c3:	39 45 e8             	cmp    %eax,-0x18(%ebp)
 804b1c6:	0f 85 91 00 00 00    	jne    804b25d <ifree+0x35d>
                        /* Append to the previous entry */
                        pf->end = (char *)pf->end + l;
 804b1cc:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b1cf:	8b 50 0c             	mov    0xc(%eax),%edx
 804b1d2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b1d5:	01 c2                	add    %eax,%edx
 804b1d7:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b1da:	89 50 0c             	mov    %edx,0xc(%eax)
                        pf->size += l;
 804b1dd:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b1e0:	8b 50 10             	mov    0x10(%eax),%edx
 804b1e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b1e6:	01 c2                	add    %eax,%edx
 804b1e8:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b1eb:	89 50 10             	mov    %edx,0x10(%eax)
                        if (pf->next && pf->end == pf->next->page) {
 804b1ee:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b1f1:	8b 00                	mov    (%eax),%eax
 804b1f3:	85 c0                	test   %eax,%eax
 804b1f5:	0f 84 da 00 00 00    	je     804b2d5 <ifree+0x3d5>
 804b1fb:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b1fe:	8b 50 0c             	mov    0xc(%eax),%edx
 804b201:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b204:	8b 00                	mov    (%eax),%eax
 804b206:	8b 40 08             	mov    0x8(%eax),%eax
 804b209:	39 c2                	cmp    %eax,%edx
 804b20b:	0f 85 c4 00 00 00    	jne    804b2d5 <ifree+0x3d5>
                                /* And collapse the next too. */
                                pt = pf->next;
 804b211:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b214:	8b 00                	mov    (%eax),%eax
 804b216:	89 45 dc             	mov    %eax,-0x24(%ebp)
                                pf->end = pt->end;
 804b219:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804b21c:	8b 50 0c             	mov    0xc(%eax),%edx
 804b21f:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b222:	89 50 0c             	mov    %edx,0xc(%eax)
                                pf->size += pt->size;
 804b225:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b228:	8b 50 10             	mov    0x10(%eax),%edx
 804b22b:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804b22e:	8b 40 10             	mov    0x10(%eax),%eax
 804b231:	01 c2                	add    %eax,%edx
 804b233:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b236:	89 50 10             	mov    %edx,0x10(%eax)
                                pf->next = pt->next;
 804b239:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804b23c:	8b 10                	mov    (%eax),%edx
 804b23e:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b241:	89 10                	mov    %edx,(%eax)
                                if (pf->next)
 804b243:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b246:	8b 00                	mov    (%eax),%eax
 804b248:	85 c0                	test   %eax,%eax
 804b24a:	0f 84 85 00 00 00    	je     804b2d5 <ifree+0x3d5>
                                        pf->next->prev = pf;
 804b250:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b253:	8b 00                	mov    (%eax),%eax
 804b255:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804b258:	89 50 04             	mov    %edx,0x4(%eax)
 804b25b:	eb 79                	jmp    804b2d6 <ifree+0x3d6>
                        }
                } else if (pf->page == tail) {
 804b25d:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b260:	8b 40 08             	mov    0x8(%eax),%eax
 804b263:	39 45 d0             	cmp    %eax,-0x30(%ebp)
 804b266:	75 1c                	jne    804b284 <ifree+0x384>
                        /* Prepend to entry */
                        pf->size += l;
 804b268:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b26b:	8b 50 10             	mov    0x10(%eax),%edx
 804b26e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804b271:	01 c2                	add    %eax,%edx
 804b273:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b276:	89 50 10             	mov    %edx,0x10(%eax)
                        pf->page = ptr;
 804b279:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b27c:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804b27f:	89 50 08             	mov    %edx,0x8(%eax)
 804b282:	eb 52                	jmp    804b2d6 <ifree+0x3d6>
                } else if (!pf->next) {
 804b284:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b287:	8b 00                	mov    (%eax),%eax
 804b289:	85 c0                	test   %eax,%eax
 804b28b:	75 38                	jne    804b2c5 <ifree+0x3c5>
                        /* Append at tail of chain */
                        px->next = 0;
 804b28d:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b293:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
                        px->prev = pf;
 804b299:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b29f:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804b2a2:	89 50 04             	mov    %edx,0x4(%eax)
                        pf->next = px;
 804b2a5:	8b 93 10 01 00 00    	mov    0x110(%ebx),%edx
 804b2ab:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b2ae:	89 10                	mov    %edx,(%eax)
                        pf = px;
 804b2b0:	8b 83 10 01 00 00    	mov    0x110(%ebx),%eax
 804b2b6:	89 45 cc             	mov    %eax,-0x34(%ebp)
                        px = 0;
 804b2b9:	c7 83 10 01 00 00 00 	movl   $0x0,0x110(%ebx)
 804b2c0:	00 00 00 
 804b2c3:	eb 11                	jmp    804b2d6 <ifree+0x3d6>
                } else {
                        wrterror("freelist is destroyed.\n");
 804b2c5:	8d 83 1d e5 ff ff    	lea    -0x1ae3(%ebx),%eax
 804b2cb:	89 04 24             	mov    %eax,(%esp)
 804b2ce:	e8 c7 e5 ff ff       	call   804989a <wrterror>
 804b2d3:	eb 01                	jmp    804b2d6 <ifree+0x3d6>
                                pt = pf->next;
                                pf->end = pt->end;
                                pf->size += pt->size;
                                pf->next = pt->next;
                                if (pf->next)
                                        pf->next->prev = pf;
 804b2d5:	90                   	nop
                        wrterror("freelist is destroyed.\n");
                }
        }

        /* Return something to OS ? */
        if (!pf->next &&                            /* If we're the last one, */
 804b2d6:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b2d9:	8b 00                	mov    (%eax),%eax
 804b2db:	85 c0                	test   %eax,%eax
 804b2dd:	0f 85 cd 00 00 00    	jne    804b3b0 <ifree+0x4b0>
            pf->size > malloc_cache &&                /* ..and the cache is full, */
 804b2e3:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b2e6:	8b 50 10             	mov    0x10(%eax),%edx
 804b2e9:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
                        wrterror("freelist is destroyed.\n");
                }
        }

        /* Return something to OS ? */
        if (!pf->next &&                            /* If we're the last one, */
 804b2ef:	39 c2                	cmp    %eax,%edx
 804b2f1:	0f 86 b9 00 00 00    	jbe    804b3b0 <ifree+0x4b0>
            pf->size > malloc_cache &&                /* ..and the cache is full, */
            pf->end == malloc_brk &&                  /* ..and none behind us, */
 804b2f7:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b2fa:	8b 50 0c             	mov    0xc(%eax),%edx
 804b2fd:	8b 83 0c 01 00 00    	mov    0x10c(%ebx),%eax
                }
        }

        /* Return something to OS ? */
        if (!pf->next &&                            /* If we're the last one, */
            pf->size > malloc_cache &&                /* ..and the cache is full, */
 804b303:	39 c2                	cmp    %eax,%edx
 804b305:	0f 85 a5 00 00 00    	jne    804b3b0 <ifree+0x4b0>
            pf->end == malloc_brk &&                  /* ..and none behind us, */
            malloc_brk == sbrk(0)) {                  /* ..and it's OK to do... */
 804b30b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804b312:	e8 21 ce ff ff       	call   8048138 <sbrk>
 804b317:	89 c2                	mov    %eax,%edx
 804b319:	8b 83 0c 01 00 00    	mov    0x10c(%ebx),%eax
        }

        /* Return something to OS ? */
        if (!pf->next &&                            /* If we're the last one, */
            pf->size > malloc_cache &&                /* ..and the cache is full, */
            pf->end == malloc_brk &&                  /* ..and none behind us, */
 804b31f:	39 c2                	cmp    %eax,%edx
 804b321:	0f 85 89 00 00 00    	jne    804b3b0 <ifree+0x4b0>

                /*
                 * Keep the cache intact.  Notice that the '>' above guarantees that
                 * the pf will always have at least one page afterwards.
                 */
                pf->end = (char *)pf->page + malloc_cache;
 804b327:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b32a:	8b 50 08             	mov    0x8(%eax),%edx
 804b32d:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
 804b333:	01 c2                	add    %eax,%edx
 804b335:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b338:	89 50 0c             	mov    %edx,0xc(%eax)
                pf->size = malloc_cache;
 804b33b:	8b 93 0c 00 00 00    	mov    0xc(%ebx),%edx
 804b341:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b344:	89 50 10             	mov    %edx,0x10(%eax)

                brk(pf->end);
 804b347:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b34a:	8b 40 0c             	mov    0xc(%eax),%eax
 804b34d:	89 04 24             	mov    %eax,(%esp)
 804b350:	e8 ac ce ff ff       	call   8048201 <brk>
                malloc_brk = pf->end;
 804b355:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b358:	8b 40 0c             	mov    0xc(%eax),%eax
 804b35b:	89 83 0c 01 00 00    	mov    %eax,0x10c(%ebx)

                index = ptr2index(pf->end);
 804b361:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804b364:	8b 40 0c             	mov    0xc(%eax),%eax
 804b367:	c1 e8 0c             	shr    $0xc,%eax
 804b36a:	89 c2                	mov    %eax,%edx
 804b36c:	8b 83 c8 00 00 00    	mov    0xc8(%ebx),%eax
 804b372:	29 c2                	sub    %eax,%edx
 804b374:	89 d0                	mov    %edx,%eax
 804b376:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                last_index = index - 1;
 804b379:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804b37c:	48                   	dec    %eax
 804b37d:	89 83 cc 00 00 00    	mov    %eax,0xcc(%ebx)

                for (i = index; i <= last_index;)
 804b383:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804b386:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804b389:	eb 1a                	jmp    804b3a5 <ifree+0x4a5>
                        page_dir[i++] = MALLOC_NOT_MINE;
 804b38b:	8b 8b d0 00 00 00    	mov    0xd0(%ebx),%ecx
 804b391:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804b394:	8d 50 01             	lea    0x1(%eax),%edx
 804b397:	89 55 d8             	mov    %edx,-0x28(%ebp)
 804b39a:	c1 e0 02             	shl    $0x2,%eax
 804b39d:	01 c8                	add    %ecx,%eax
 804b39f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
                malloc_brk = pf->end;

                index = ptr2index(pf->end);
                last_index = index - 1;

                for (i = index; i <= last_index;)
 804b3a5:	8b 83 cc 00 00 00    	mov    0xcc(%ebx),%eax
 804b3ab:	39 45 d8             	cmp    %eax,-0x28(%ebp)
 804b3ae:	76 db                	jbe    804b38b <ifree+0x48b>
                        page_dir[i++] = MALLOC_NOT_MINE;

                /* XXX: We could realloc/shrink the pagedir here I guess. */
        }
        if (pt)
 804b3b0:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 804b3b4:	0f 84 05 02 00 00    	je     804b5bf <ifree+0x6bf>
                ifree(pt);
 804b3ba:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804b3bd:	89 04 24             	mov    %eax,(%esp)
 804b3c0:	e8 3b fb ff ff       	call   804af00 <ifree>

        if (info < MALLOC_MAGIC)
                free_pages(ptr, index, info);
        else
                free_bytes(ptr, index, info);
        return;
 804b3c5:	e9 f5 01 00 00       	jmp    804b5bf <ifree+0x6bf>
        info = page_dir[index];

        if (info < MALLOC_MAGIC)
                free_pages(ptr, index, info);
        else
                free_bytes(ptr, index, info);
 804b3ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b3cd:	8b 55 08             	mov    0x8(%ebp),%edx
 804b3d0:	89 55 ec             	mov    %edx,-0x14(%ebp)
 804b3d3:	89 45 c8             	mov    %eax,-0x38(%ebp)
 804b3d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804b3d9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
        int i;
        struct pginfo **mp;
        void *vp;

        /* Find the chunk number on the page */
        i = ((u_long)ptr & malloc_pagemask) >> info->shift;
 804b3dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b3df:	25 ff 0f 00 00       	and    $0xfff,%eax
 804b3e4:	89 c2                	mov    %eax,%edx
 804b3e6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b3e9:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804b3ed:	88 c1                	mov    %al,%cl
 804b3ef:	d3 ea                	shr    %cl,%edx
 804b3f1:	89 d0                	mov    %edx,%eax
 804b3f3:	89 45 c0             	mov    %eax,-0x40(%ebp)

        if (((u_long)ptr & (info->size - 1))) {
 804b3f6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b3f9:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804b3fd:	48                   	dec    %eax
 804b3fe:	89 c2                	mov    %eax,%edx
 804b400:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b403:	21 d0                	and    %edx,%eax
 804b405:	85 c0                	test   %eax,%eax
 804b407:	74 13                	je     804b41c <ifree+0x51c>
                wrtwarning("modified (chunk-) pointer.\n");
 804b409:	8d 83 ba e4 ff ff    	lea    -0x1b46(%ebx),%eax
 804b40f:	89 04 24             	mov    %eax,(%esp)
 804b412:	e8 53 e5 ff ff       	call   804996a <wrtwarning>

        if (info < MALLOC_MAGIC)
                free_pages(ptr, index, info);
        else
                free_bytes(ptr, index, info);
        return;
 804b417:	e9 a3 01 00 00       	jmp    804b5bf <ifree+0x6bf>
        if (((u_long)ptr & (info->size - 1))) {
                wrtwarning("modified (chunk-) pointer.\n");
                return;
        }

        if (info->bits[i / MALLOC_BITS] & (1 << (i % MALLOC_BITS))) {
 804b41c:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804b41f:	c1 e8 05             	shr    $0x5,%eax
 804b422:	89 c2                	mov    %eax,%edx
 804b424:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b427:	83 c2 04             	add    $0x4,%edx
 804b42a:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804b42d:	8b 55 c0             	mov    -0x40(%ebp),%edx
 804b430:	83 e2 1f             	and    $0x1f,%edx
 804b433:	be 01 00 00 00       	mov    $0x1,%esi
 804b438:	88 d1                	mov    %dl,%cl
 804b43a:	d3 e6                	shl    %cl,%esi
 804b43c:	89 f2                	mov    %esi,%edx
 804b43e:	21 d0                	and    %edx,%eax
 804b440:	85 c0                	test   %eax,%eax
 804b442:	74 13                	je     804b457 <ifree+0x557>
                wrtwarning("chunk is already free.\n");
 804b444:	8d 83 d6 e4 ff ff    	lea    -0x1b2a(%ebx),%eax
 804b44a:	89 04 24             	mov    %eax,(%esp)
 804b44d:	e8 18 e5 ff ff       	call   804996a <wrtwarning>

        if (info < MALLOC_MAGIC)
                free_pages(ptr, index, info);
        else
                free_bytes(ptr, index, info);
        return;
 804b452:	e9 68 01 00 00       	jmp    804b5bf <ifree+0x6bf>
        if (info->bits[i / MALLOC_BITS] & (1 << (i % MALLOC_BITS))) {
                wrtwarning("chunk is already free.\n");
                return;
        }

        if (malloc_junk)
 804b457:	8b 83 08 01 00 00    	mov    0x108(%ebx),%eax
 804b45d:	85 c0                	test   %eax,%eax
 804b45f:	74 1e                	je     804b47f <ifree+0x57f>
                memset(ptr, SOME_JUNK, info->size);
 804b461:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b464:	0f b7 40 08          	movzwl 0x8(%eax),%eax
 804b468:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b46c:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
 804b473:	00 
 804b474:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b477:	89 04 24             	mov    %eax,(%esp)
 804b47a:	e8 c5 db ff ff       	call   8049044 <memset>

        info->bits[i / MALLOC_BITS] |= 1 << (i % MALLOC_BITS);
 804b47f:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804b482:	c1 e8 05             	shr    $0x5,%eax
 804b485:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 804b488:	8d 48 04             	lea    0x4(%eax),%ecx
 804b48b:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
 804b48e:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 804b491:	83 e1 1f             	and    $0x1f,%ecx
 804b494:	be 01 00 00 00       	mov    $0x1,%esi
 804b499:	d3 e6                	shl    %cl,%esi
 804b49b:	89 f1                	mov    %esi,%ecx
 804b49d:	09 d1                	or     %edx,%ecx
 804b49f:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 804b4a2:	83 c0 04             	add    $0x4,%eax
 804b4a5:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
        info->free++;
 804b4a8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b4ab:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804b4af:	40                   	inc    %eax
 804b4b0:	0f b7 d0             	movzwl %ax,%edx
 804b4b3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b4b6:	66 89 50 0c          	mov    %dx,0xc(%eax)

        mp = page_dir + info->shift;
 804b4ba:	8b 93 d0 00 00 00    	mov    0xd0(%ebx),%edx
 804b4c0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b4c3:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804b4c7:	c1 e0 02             	shl    $0x2,%eax
 804b4ca:	01 d0                	add    %edx,%eax
 804b4cc:	89 45 bc             	mov    %eax,-0x44(%ebp)

        if (info->free == 1) {
 804b4cf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b4d2:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
 804b4d6:	83 f8 01             	cmp    $0x1,%eax
 804b4d9:	75 5e                	jne    804b539 <ifree+0x639>

                /* Page became non-full */

                mp = page_dir + info->shift;
 804b4db:	8b 93 d0 00 00 00    	mov    0xd0(%ebx),%edx
 804b4e1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b4e4:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
 804b4e8:	c1 e0 02             	shl    $0x2,%eax
 804b4eb:	01 d0                	add    %edx,%eax
 804b4ed:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804b4f0:	eb 08                	jmp    804b4fa <ifree+0x5fa>
                /* Insert in address order */
                while (*mp && (*mp)->next && (*mp)->next->page < info->page)
                        mp = &(*mp)->next;
 804b4f2:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b4f5:	8b 00                	mov    (%eax),%eax
 804b4f7:	89 45 bc             	mov    %eax,-0x44(%ebp)

                /* Page became non-full */

                mp = page_dir + info->shift;
                /* Insert in address order */
                while (*mp && (*mp)->next && (*mp)->next->page < info->page)
 804b4fa:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b4fd:	8b 00                	mov    (%eax),%eax
 804b4ff:	85 c0                	test   %eax,%eax
 804b501:	74 1f                	je     804b522 <ifree+0x622>
 804b503:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b506:	8b 00                	mov    (%eax),%eax
 804b508:	8b 00                	mov    (%eax),%eax
 804b50a:	85 c0                	test   %eax,%eax
 804b50c:	74 14                	je     804b522 <ifree+0x622>
 804b50e:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b511:	8b 00                	mov    (%eax),%eax
 804b513:	8b 00                	mov    (%eax),%eax
 804b515:	8b 50 04             	mov    0x4(%eax),%edx
 804b518:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b51b:	8b 40 04             	mov    0x4(%eax),%eax
 804b51e:	39 c2                	cmp    %eax,%edx
 804b520:	72 d0                	jb     804b4f2 <ifree+0x5f2>
                        mp = &(*mp)->next;
                info->next = *mp;
 804b522:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b525:	8b 10                	mov    (%eax),%edx
 804b527:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b52a:	89 10                	mov    %edx,(%eax)
                *mp = info;
 804b52c:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b52f:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 804b532:	89 10                	mov    %edx,(%eax)

        if (info < MALLOC_MAGIC)
                free_pages(ptr, index, info);
        else
                free_bytes(ptr, index, info);
        return;
 804b534:	e9 86 00 00 00       	jmp    804b5bf <ifree+0x6bf>
                info->next = *mp;
                *mp = info;
                return;
        }

        if (info->free != info->total)
 804b539:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b53c:	0f b7 50 0c          	movzwl 0xc(%eax),%edx
 804b540:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b543:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
 804b547:	39 c2                	cmp    %eax,%edx
 804b549:	75 74                	jne    804b5bf <ifree+0x6bf>
 804b54b:	eb 08                	jmp    804b555 <ifree+0x655>
                return;

        /* Find & remove this page in the queue */
        while (*mp != info) {
                mp = &((*mp)->next);
 804b54d:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b550:	8b 00                	mov    (%eax),%eax
 804b552:	89 45 bc             	mov    %eax,-0x44(%ebp)

        if (info->free != info->total)
                return;

        /* Find & remove this page in the queue */
        while (*mp != info) {
 804b555:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b558:	8b 00                	mov    (%eax),%eax
 804b55a:	39 45 c4             	cmp    %eax,-0x3c(%ebp)
 804b55d:	75 ee                	jne    804b54d <ifree+0x64d>
#ifdef EXTRA_SANITY
                if (!*mp)
                        wrterror("(ES): Not on queue\n");
#endif /* EXTRA_SANITY */
        }
        *mp = info->next;
 804b55f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b562:	8b 10                	mov    (%eax),%edx
 804b564:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804b567:	89 10                	mov    %edx,(%eax)

        /* Free the page & the info structure if need be */
        page_dir[ptr2index(info->page)] = MALLOC_FIRST;
 804b569:	8b 93 d0 00 00 00    	mov    0xd0(%ebx),%edx
 804b56f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b572:	8b 40 04             	mov    0x4(%eax),%eax
 804b575:	c1 e8 0c             	shr    $0xc,%eax
 804b578:	89 c1                	mov    %eax,%ecx
 804b57a:	8b 83 c8 00 00 00    	mov    0xc8(%ebx),%eax
 804b580:	29 c1                	sub    %eax,%ecx
 804b582:	89 c8                	mov    %ecx,%eax
 804b584:	c1 e0 02             	shl    $0x2,%eax
 804b587:	01 d0                	add    %edx,%eax
 804b589:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
        vp = info->page;            /* Order is important ! */
 804b58f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b592:	8b 40 04             	mov    0x4(%eax),%eax
 804b595:	89 45 b8             	mov    %eax,-0x48(%ebp)
        if (vp != (void *)info)
 804b598:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b59b:	3b 45 b8             	cmp    -0x48(%ebp),%eax
 804b59e:	74 0b                	je     804b5ab <ifree+0x6ab>
                ifree(info);
 804b5a0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804b5a3:	89 04 24             	mov    %eax,(%esp)
 804b5a6:	e8 55 f9 ff ff       	call   804af00 <ifree>
        ifree(vp);
 804b5ab:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804b5ae:	89 04 24             	mov    %eax,(%esp)
 804b5b1:	e8 4a f9 ff ff       	call   804af00 <ifree>

        if (info < MALLOC_MAGIC)
                free_pages(ptr, index, info);
        else
                free_bytes(ptr, index, info);
        return;
 804b5b6:	90                   	nop
 804b5b7:	eb 06                	jmp    804b5bf <ifree+0x6bf>
        struct pginfo *info;
        unsigned int index;

        /* This is legal */
        if (!ptr)
                return;
 804b5b9:	90                   	nop
 804b5ba:	eb 04                	jmp    804b5c0 <ifree+0x6c0>
                return;
        }

        /* If we're already sinking, don't make matters any worse. */
        if (suicide)
                return;
 804b5bc:	90                   	nop
 804b5bd:	eb 01                	jmp    804b5c0 <ifree+0x6c0>

        if (info < MALLOC_MAGIC)
                free_pages(ptr, index, info);
        else
                free_bytes(ptr, index, info);
        return;
 804b5bf:	90                   	nop
}
 804b5c0:	83 c4 50             	add    $0x50,%esp
 804b5c3:	5b                   	pop    %ebx
 804b5c4:	5e                   	pop    %esi
 804b5c5:	5d                   	pop    %ebp
 804b5c6:	c3                   	ret    

0804b5c7 <malloc>:
 */


void *
malloc(size_t size)
{
 804b5c7:	55                   	push   %ebp
 804b5c8:	89 e5                	mov    %esp,%ebp
 804b5ca:	56                   	push   %esi
 804b5cb:	53                   	push   %ebx
 804b5cc:	83 ec 10             	sub    $0x10,%esp
 804b5cf:	e8 be d8 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804b5d4:	81 c3 98 2c 00 00    	add    $0x2c98,%ebx
        register void *r;

        THREAD_LOCK();
        malloc_func = " in malloc():";
 804b5da:	8d 83 59 e5 ff ff    	lea    -0x1aa7(%ebx),%eax
 804b5e0:	89 83 14 01 00 00    	mov    %eax,0x114(%ebx)
        if (malloc_active++) {
 804b5e6:	8b 83 c4 00 00 00    	mov    0xc4(%ebx),%eax
 804b5ec:	8d 50 01             	lea    0x1(%eax),%edx
 804b5ef:	89 93 c4 00 00 00    	mov    %edx,0xc4(%ebx)
 804b5f5:	85 c0                	test   %eax,%eax
 804b5f7:	74 22                	je     804b61b <malloc+0x54>
                wrtwarning("recursive call.\n");
 804b5f9:	8d 83 67 e5 ff ff    	lea    -0x1a99(%ebx),%eax
 804b5ff:	89 04 24             	mov    %eax,(%esp)
 804b602:	e8 63 e3 ff ff       	call   804996a <wrtwarning>
                malloc_active--;
 804b607:	8b 83 c4 00 00 00    	mov    0xc4(%ebx),%eax
 804b60d:	48                   	dec    %eax
 804b60e:	89 83 c4 00 00 00    	mov    %eax,0xc4(%ebx)
                return (0);
 804b614:	b8 00 00 00 00       	mov    $0x0,%eax
 804b619:	eb 5e                	jmp    804b679 <malloc+0xb2>
        }
        if (!malloc_started) {
 804b61b:	8b 83 c0 00 00 00    	mov    0xc0(%ebx),%eax
 804b621:	85 c0                	test   %eax,%eax
 804b623:	75 05                	jne    804b62a <malloc+0x63>
                malloc_init();
 804b625:	e8 97 e5 ff ff       	call   8049bc1 <malloc_init>
        }
        if (malloc_sysv && !size)
 804b62a:	8b 83 00 01 00 00    	mov    0x100(%ebx),%eax
 804b630:	85 c0                	test   %eax,%eax
 804b632:	74 0d                	je     804b641 <malloc+0x7a>
 804b634:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804b638:	75 07                	jne    804b641 <malloc+0x7a>
                r = 0;
 804b63a:	be 00 00 00 00       	mov    $0x0,%esi
 804b63f:	eb 0d                	jmp    804b64e <malloc+0x87>
        else
                r = imalloc(size);
 804b641:	8b 45 08             	mov    0x8(%ebp),%eax
 804b644:	89 04 24             	mov    %eax,(%esp)
 804b647:	e8 95 ef ff ff       	call   804a5e1 <imalloc>
 804b64c:	89 c6                	mov    %eax,%esi
        UTRACE(0, size, r);
        malloc_active--;
 804b64e:	8b 83 c4 00 00 00    	mov    0xc4(%ebx),%eax
 804b654:	48                   	dec    %eax
 804b655:	89 83 c4 00 00 00    	mov    %eax,0xc4(%ebx)
        THREAD_UNLOCK();
        if (malloc_xmalloc && !r)
 804b65b:	8b 83 fc 00 00 00    	mov    0xfc(%ebx),%eax
 804b661:	85 c0                	test   %eax,%eax
 804b663:	74 12                	je     804b677 <malloc+0xb0>
 804b665:	85 f6                	test   %esi,%esi
 804b667:	75 0e                	jne    804b677 <malloc+0xb0>
                wrterror("out of memory.\n");
 804b669:	8d 83 78 e5 ff ff    	lea    -0x1a88(%ebx),%eax
 804b66f:	89 04 24             	mov    %eax,(%esp)
 804b672:	e8 23 e2 ff ff       	call   804989a <wrterror>
        return (r);
 804b677:	89 f0                	mov    %esi,%eax
}
 804b679:	83 c4 10             	add    $0x10,%esp
 804b67c:	5b                   	pop    %ebx
 804b67d:	5e                   	pop    %esi
 804b67e:	5d                   	pop    %ebp
 804b67f:	c3                   	ret    

0804b680 <free>:

void
free(void *ptr)
{
 804b680:	55                   	push   %ebp
 804b681:	89 e5                	mov    %esp,%ebp
 804b683:	53                   	push   %ebx
 804b684:	83 ec 14             	sub    $0x14,%esp
 804b687:	e8 06 d8 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804b68c:	81 c3 e0 2b 00 00    	add    $0x2be0,%ebx
        THREAD_LOCK();
        malloc_func = " in free():";
 804b692:	8d 83 88 e5 ff ff    	lea    -0x1a78(%ebx),%eax
 804b698:	89 83 14 01 00 00    	mov    %eax,0x114(%ebx)
        if (malloc_active++) {
 804b69e:	8b 83 c4 00 00 00    	mov    0xc4(%ebx),%eax
 804b6a4:	8d 50 01             	lea    0x1(%eax),%edx
 804b6a7:	89 93 c4 00 00 00    	mov    %edx,0xc4(%ebx)
 804b6ad:	85 c0                	test   %eax,%eax
 804b6af:	74 1d                	je     804b6ce <free+0x4e>
                wrtwarning("recursive call.\n");
 804b6b1:	8d 83 67 e5 ff ff    	lea    -0x1a99(%ebx),%eax
 804b6b7:	89 04 24             	mov    %eax,(%esp)
 804b6ba:	e8 ab e2 ff ff       	call   804996a <wrtwarning>
                malloc_active--;
 804b6bf:	8b 83 c4 00 00 00    	mov    0xc4(%ebx),%eax
 804b6c5:	48                   	dec    %eax
 804b6c6:	89 83 c4 00 00 00    	mov    %eax,0xc4(%ebx)
                return;
 804b6cc:	eb 19                	jmp    804b6e7 <free+0x67>
        } else {
                ifree(ptr);
 804b6ce:	8b 45 08             	mov    0x8(%ebp),%eax
 804b6d1:	89 04 24             	mov    %eax,(%esp)
 804b6d4:	e8 27 f8 ff ff       	call   804af00 <ifree>
                UTRACE(ptr, 0, 0);
        }
        malloc_active--;
 804b6d9:	8b 83 c4 00 00 00    	mov    0xc4(%ebx),%eax
 804b6df:	48                   	dec    %eax
 804b6e0:	89 83 c4 00 00 00    	mov    %eax,0xc4(%ebx)
        THREAD_UNLOCK();
        return;
 804b6e6:	90                   	nop
}
 804b6e7:	83 c4 14             	add    $0x14,%esp
 804b6ea:	5b                   	pop    %ebx
 804b6eb:	5d                   	pop    %ebp
 804b6ec:	c3                   	ret    

0804b6ed <realloc>:

void *
realloc(void *ptr, size_t size)
{
 804b6ed:	55                   	push   %ebp
 804b6ee:	89 e5                	mov    %esp,%ebp
 804b6f0:	56                   	push   %esi
 804b6f1:	53                   	push   %ebx
 804b6f2:	83 ec 10             	sub    $0x10,%esp
 804b6f5:	e8 98 d7 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804b6fa:	81 c3 72 2b 00 00    	add    $0x2b72,%ebx
        register void *r;

        THREAD_LOCK();
        malloc_func = " in realloc():";
 804b700:	8d 83 94 e5 ff ff    	lea    -0x1a6c(%ebx),%eax
 804b706:	89 83 14 01 00 00    	mov    %eax,0x114(%ebx)
        if (malloc_active++) {
 804b70c:	8b 83 c4 00 00 00    	mov    0xc4(%ebx),%eax
 804b712:	8d 50 01             	lea    0x1(%eax),%edx
 804b715:	89 93 c4 00 00 00    	mov    %edx,0xc4(%ebx)
 804b71b:	85 c0                	test   %eax,%eax
 804b71d:	74 25                	je     804b744 <realloc+0x57>
                wrtwarning("recursive call.\n");
 804b71f:	8d 83 67 e5 ff ff    	lea    -0x1a99(%ebx),%eax
 804b725:	89 04 24             	mov    %eax,(%esp)
 804b728:	e8 3d e2 ff ff       	call   804996a <wrtwarning>
                malloc_active--;
 804b72d:	8b 83 c4 00 00 00    	mov    0xc4(%ebx),%eax
 804b733:	48                   	dec    %eax
 804b734:	89 83 c4 00 00 00    	mov    %eax,0xc4(%ebx)
                return (0);
 804b73a:	b8 00 00 00 00       	mov    $0x0,%eax
 804b73f:	e9 aa 00 00 00       	jmp    804b7ee <realloc+0x101>
        }
        if (ptr && !malloc_started) {
 804b744:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804b748:	74 1f                	je     804b769 <realloc+0x7c>
 804b74a:	8b 83 c0 00 00 00    	mov    0xc0(%ebx),%eax
 804b750:	85 c0                	test   %eax,%eax
 804b752:	75 15                	jne    804b769 <realloc+0x7c>
                wrtwarning("malloc() has never been called.\n");
 804b754:	8d 83 38 e5 ff ff    	lea    -0x1ac8(%ebx),%eax
 804b75a:	89 04 24             	mov    %eax,(%esp)
 804b75d:	e8 08 e2 ff ff       	call   804996a <wrtwarning>
                ptr = 0;
 804b762:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
        }
        if (!malloc_started)
 804b769:	8b 83 c0 00 00 00    	mov    0xc0(%ebx),%eax
 804b76f:	85 c0                	test   %eax,%eax
 804b771:	75 05                	jne    804b778 <realloc+0x8b>
                malloc_init();
 804b773:	e8 49 e4 ff ff       	call   8049bc1 <malloc_init>
        if (malloc_sysv && !size) {
 804b778:	8b 83 00 01 00 00    	mov    0x100(%ebx),%eax
 804b77e:	85 c0                	test   %eax,%eax
 804b780:	74 18                	je     804b79a <realloc+0xad>
 804b782:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804b786:	75 12                	jne    804b79a <realloc+0xad>
                ifree(ptr);
 804b788:	8b 45 08             	mov    0x8(%ebp),%eax
 804b78b:	89 04 24             	mov    %eax,(%esp)
 804b78e:	e8 6d f7 ff ff       	call   804af00 <ifree>
                r = 0;
 804b793:	be 00 00 00 00       	mov    $0x0,%esi
 804b798:	eb 29                	jmp    804b7c3 <realloc+0xd6>
        } else if (!ptr) {
 804b79a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804b79e:	75 0f                	jne    804b7af <realloc+0xc2>
                r = imalloc(size);
 804b7a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b7a3:	89 04 24             	mov    %eax,(%esp)
 804b7a6:	e8 36 ee ff ff       	call   804a5e1 <imalloc>
 804b7ab:	89 c6                	mov    %eax,%esi
 804b7ad:	eb 14                	jmp    804b7c3 <realloc+0xd6>
        } else {
                r = irealloc(ptr, size);
 804b7af:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b7b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b7b6:	8b 45 08             	mov    0x8(%ebp),%eax
 804b7b9:	89 04 24             	mov    %eax,(%esp)
 804b7bc:	e8 d6 ee ff ff       	call   804a697 <irealloc>
 804b7c1:	89 c6                	mov    %eax,%esi
        }
        UTRACE(ptr, size, r);
        malloc_active--;
 804b7c3:	8b 83 c4 00 00 00    	mov    0xc4(%ebx),%eax
 804b7c9:	48                   	dec    %eax
 804b7ca:	89 83 c4 00 00 00    	mov    %eax,0xc4(%ebx)
        THREAD_UNLOCK();
        if (malloc_xmalloc && !r)
 804b7d0:	8b 83 fc 00 00 00    	mov    0xfc(%ebx),%eax
 804b7d6:	85 c0                	test   %eax,%eax
 804b7d8:	74 12                	je     804b7ec <realloc+0xff>
 804b7da:	85 f6                	test   %esi,%esi
 804b7dc:	75 0e                	jne    804b7ec <realloc+0xff>
                wrterror("out of memory.\n");
 804b7de:	8d 83 78 e5 ff ff    	lea    -0x1a88(%ebx),%eax
 804b7e4:	89 04 24             	mov    %eax,(%esp)
 804b7e7:	e8 ae e0 ff ff       	call   804989a <wrterror>
        return (r);
 804b7ec:	89 f0                	mov    %esi,%eax
}
 804b7ee:	83 c4 10             	add    $0x10,%esp
 804b7f1:	5b                   	pop    %ebx
 804b7f2:	5e                   	pop    %esi
 804b7f3:	5d                   	pop    %ebp
 804b7f4:	c3                   	ret    

0804b7f5 <calloc>:

/* Added */
void *calloc(size_t nelem, size_t elsize)
{
 804b7f5:	55                   	push   %ebp
 804b7f6:	89 e5                	mov    %esp,%ebp
 804b7f8:	53                   	push   %ebx
 804b7f9:	83 ec 24             	sub    $0x24,%esp
 804b7fc:	e8 91 d6 ff ff       	call   8048e92 <__x86.get_pc_thunk.bx>
 804b801:	81 c3 6b 2a 00 00    	add    $0x2a6b,%ebx
        void *tmp;
        if (NULL == (tmp = malloc(nelem * elsize))) {
 804b807:	8b 45 08             	mov    0x8(%ebp),%eax
 804b80a:	0f af 45 0c          	imul   0xc(%ebp),%eax
 804b80e:	89 04 24             	mov    %eax,(%esp)
 804b811:	e8 b1 fd ff ff       	call   804b5c7 <malloc>
 804b816:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b819:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804b81d:	75 07                	jne    804b826 <calloc+0x31>
                return NULL;
 804b81f:	b8 00 00 00 00       	mov    $0x0,%eax
 804b824:	eb 21                	jmp    804b847 <calloc+0x52>
        } else {
                memset(tmp, 0, nelem * elsize);
 804b826:	8b 45 08             	mov    0x8(%ebp),%eax
 804b829:	0f af 45 0c          	imul   0xc(%ebp),%eax
 804b82d:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b831:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804b838:	00 
 804b839:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b83c:	89 04 24             	mov    %eax,(%esp)
 804b83f:	e8 00 d8 ff ff       	call   8049044 <memset>
                return tmp;
 804b844:	8b 45 f4             	mov    -0xc(%ebp),%eax
        }
}
 804b847:	83 c4 24             	add    $0x24,%esp
 804b84a:	5b                   	pop    %ebx
 804b84b:	5d                   	pop    %ebp
 804b84c:	c3                   	ret    