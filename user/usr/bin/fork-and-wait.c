/*
 * Does the basic fork and wait to make sure that the
 * fork and waitpid system calls are working correctly.
 */

#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int Data = 0x017;

int main(int argc, char **argv)
{
        pid_t pid;
        char buf[80];

        open("/dev/tty0", O_RDONLY, 0);
        open("/dev/tty0", O_WRONLY, 0);

        sprintf(buf, "(Before fork(), Data should be 0x17) Data = 0x%08x\n", Data);
        write(1, buf, strlen(buf));
        write(1, "Ready to fork()...\n", 19);

        pid = fork();

        if (pid == 0) {
                sprintf(buf, "(Child, Data should first be 0x17) Data = 0x%08x\n", Data);
                write(1, buf, strlen(buf));
                Data = 0x0129e;
                sprintf(buf, "(Child, Data should now be 0x129e) Data = 0x%08x\n", Data);
                write(1, buf, strlen(buf));
                write(1, "(Child) Hello, world!\n", 22);
                exit(0);
        } else if (pid == (pid_t)(-1)) {
                write(1, "fork() failed.\n", 15);
        } else {
                sprintf(buf, "(Parent, Data should first be 0x17) Data = 0x%08x\n", Data);
                write(1, buf, strlen(buf));
                Data = 0x0b38e;
                sprintf(buf, "(Parent, Data should now be 0xb38e) Data = 0x%08x\n", Data);
                write(1, buf, strlen(buf));
                write(1, "(Parent) Calling waitpid()...\n", 30);
                waitpid(pid, 0, NULL);
                write(1, "(Parent) waitpid() returned successfully.\n", 42);
        }
        return 0;
}

