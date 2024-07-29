#include <errno.h>
#include <stdlib.h>
#include <stdio.h> 
#include <string.h>
#include <unistd.h>

#define IMAX 256
#define JMAX 16
#define KMAX 16
#define ISTEP (JMAX*KMAX)

#define WAIT \
  do { \
    while(waitpid(-1, 0, &status) > 0) { \
      if (status == 0) { \
        passed++; \
      } else { \
        failed++; \
      } \
    } \
  } while(0)

int main(int argc, char **argv) {
  int passed = 0;
  int failed = 0;

  int status;
  int pipefd[2];

  /* First test: normal operation.
   * The writer writes a specific sequence of 64K
   * bytes into the pipe, and the reader expects
   * the same bytes out.
   */
  printf("Testing normal operation...\n");
  int ret = pipe(pipefd);

  if (ret < 0) {
    fprintf(stderr, "pipe: %s\n", strerror(errno));
    exit(1);
  }

  int i, j, k;
  unsigned char buf[KMAX];

  if (!fork()) {
    close(pipefd[0]);
    for (i = 0; i < IMAX; ++i) {
      for (j = 0; j < JMAX; ++j) {
        for (k = 0; k < KMAX; ++k) {
          buf[k] = i ^ (j*KMAX+k);
        }
        if (write(pipefd[1], buf, KMAX) < 0) {
          printf("Write to pipe failed\n");
          exit(1);
        }
      }
    }
    exit(0);
  }
    
  if (!fork()) {
    close(pipefd[1]);
    for (i = 0; i < IMAX; ++i) {
      for (j = 0; j < JMAX; ++j) {
        if (read(pipefd[0], buf, KMAX) == 0) {
          printf("Unexpected end of pipe\n");
          exit(1);
        }
        for (k = 0; k < KMAX; ++k) {
          if (buf[k] != (i ^ (j*KMAX+k))) {
            printf("Byte %d incorrect (expected %2x, got %2x)\n",
                i*ISTEP + j*KMAX + k, (i ^ (j*KMAX+k)), buf[k]);
            exit(1);
          }
        }
      }
    }
    exit(0);
  }

  close(pipefd[0]);
  close(pipefd[1]);

  WAIT;

  /* Second test: broken pipe.
   * All readers quit immediately. The writer should get EPIPE.
   */
  printf("Testing with no readers...\n");
  ret = pipe(pipefd);

  if (ret < 0) {
    fprintf(stderr, "pipe: %s\n", strerror(errno));
    exit(1);
  }

  if (!fork()) {
    close(pipefd[0]);
    for (i = 0; i < IMAX; ++i) {
      for (j = 0; j < JMAX; ++j) {
        for (k = 0; k < KMAX; ++k) {
          buf[k] = i ^ (j*KMAX+k);
        }
        if (write(pipefd[1], buf, KMAX) < 0) {
          if (errno == EPIPE) {
            exit(0);
          } else {
            printf("Write to pipe failed\n");
            exit(1);
          }
        }
      }
    }
    exit(1);
  }

  close(pipefd[0]);
  close(pipefd[1]);

  WAIT;

  /* Third test: writers quit.
   * The readers should get no bytes, and this program
   * should not block in the kernel forever.
   */
  printf("Testing with no writers...\n");
  ret = pipe(pipefd);

  if (ret < 0) {
    fprintf(stderr, "pipe: %s\n", strerror(errno));
    exit(1);
  }
    
  if (!fork()) {
    close(pipefd[1]);
    if (read(pipefd[0], buf, KMAX) == 0) {
      exit(0);
    }
    exit(1);
  }

  if (!fork()) {
    close(pipefd[1]);
    if (read(pipefd[0], buf, KMAX) == 0) {
      exit(0);
    }
    exit(1);
  }

  close(pipefd[0]);
  close(pipefd[1]);

  WAIT;

  printf("%d passed. %d failed.\n", passed, failed);
  return 0;
}
