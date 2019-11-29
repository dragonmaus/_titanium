#include <fcntl.h>
#include "open.h"

  int
open_excl(const char *fn)
{
  return open(fn, O_WRONLY | O_CREAT | O_EXCL | O_NONBLOCK, 0644);
}
