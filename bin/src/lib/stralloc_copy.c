#include "stralloc.h"

  unsigned int
stralloc_copy(stralloc *to, const stralloc *from)
{
  return stralloc_copyb(to, from->len, from->s);
}
