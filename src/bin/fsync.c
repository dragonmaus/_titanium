#include <sys.h>
#include "open.h"
#include "strerr.h"

#define FATAL "fsync: fatal: "
#define USAGE "usage: fsync file [file...]"

  int
main(int argc, const char **argv)
{
  register int fd;

  if (!--argc) strerr_die1x(1, USAGE);
  while (*++argv) {
    fd = open_read(*argv);
    if (fd == -1) strerr_die4sys(1, FATAL, "unable to open file '", *argv, "': ");
    if (fsync(fd) == -1) strerr_die4sys(1, FATAL, "unable to sync file '", *argv, "': ");
    close(fd);
  }
  return 0;
}
