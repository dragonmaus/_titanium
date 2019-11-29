#include <sys.h>
#include "alloc.h"
#include "dir.h"

  int
dir_close(struct dir *dir)
{
  int r;

  r = close(dir->fd);
  alloc_free(dir);
  return r;
}
