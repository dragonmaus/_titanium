#include <fcntl.h>
#include "open.h"

  int
open_append(const char *fn)
{
  return open(fn, O_WRONLY | O_CREAT | O_APPEND | O_NONBLOCK, 0600);
}
