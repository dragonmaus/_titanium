#include <fcntl.h>
#include "open.h"

  int
open_trunc(const char *fn)
{
  return open(fn, O_WRONLY | O_CREAT | O_TRUNC | O_NONBLOCK, 0644);
}
