#include "stralloc.h"

  unsigned int
stralloc_cat(stralloc *to, const stralloc *from)
{
  return stralloc_catb(to, from->len, from->s);
}
