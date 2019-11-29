#include <fcntl.h>
#include "open.h"

  int
open_path(const char *fn)
{
  return open(fn, O_PATH | O_CLOEXEC | O_NONBLOCK, 0);
}
