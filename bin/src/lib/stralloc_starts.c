#include "byte.h"
#include "str.h"
#include "stralloc.h"

  unsigned int
stralloc_starts(const stralloc *sa, const char *s)
{
  int len;

  len = str_len(s);
  return (sa->len >= len) && byte_equal(s, sa->s, len);
}
