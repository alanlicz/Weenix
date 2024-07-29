#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

/* TODO add options for different ways of forkbombing
   (kind of low priority but would be fun) */

int main(int argc, char **argv)
{
        int n = 1;
        pid_t pid;
        int limit = (-1);

        if (argc > 0 && strcmp(argv[argc-1], "limit250") == 0) {
                limit = 250;
        } else if (argc > 0 && strcmp(argv[argc-1], "limit500") == 0) {
                limit = 500;
        }
        open("/dev/tty0", O_RDONLY, 0);
        open("/dev/tty0", O_WRONLY, 0);
        printf("Forking up a storm!\n");
        printf("If this runs for 10 minutes without crashing, then you ");
        printf("probably aren't \nleaking resources\n");
        if (!fork()) {
                for (;;) {
                        printf("I am fork number %d\n", n);
                        if ((pid = fork())) {
                                /* parent */
                                /* pid should be > 2 or pid should be -1 if
                                 * the fork failed */
                                if (-1 != pid) {
                                        exit(0);
                                } else {
                                        printf("%d-th fork failed. "
                                               "forkbomb stopping.", n);
                                        exit(1);
                                }
                        }
                        ++n;
                        if (limit > 0 && n > limit) {
                                printf("Limit (specified in the commandline) of %1d reached.\n", limit);
                                exit(0);
                        }
                }
        } else {
                int status;
                while (wait(&status) > 0)
                        ;
        }
        return 0;
}
