#include "stralloc.h"
#include "strerr.h"

static stralloc sa = { 0 };

  const char *
strerr(const struct strerr *se)
{
  strerr_sysinit();
  if (!stralloc_copys(&sa, "")) return "out of memory";
  while (se) {
    if (se->x && !stralloc_cats(&sa, se->x)) return "out of memory";
    if (se->y && !stralloc_cats(&sa, se->y)) return "out of memory";
    if (se->z && !stralloc_cats(&sa, se->z)) return "out of memory";
    se = se->who;
  }
  if (!stralloc_0(&sa)) return "out of memory";
  return sa.s;
}
