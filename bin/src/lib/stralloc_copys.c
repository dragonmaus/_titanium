#include "str.h"
#include "stralloc.h"

  unsigned int
stralloc_copys(stralloc *sa, const char *s)
{
  return stralloc_copyb(sa, str_len(s), s);
}
