#include <unistd.h>
#include "strerr.h"

  void
strerr_die(int e, const char *x1, const char *x2, const char *x3, const char *x4, const char *x5, const char *x6, const struct strerr *se)
{
  strerr_warn(x1, x2, x3, x4, x5, x6, se);
  _exit(e);
}
