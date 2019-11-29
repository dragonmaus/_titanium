#include "char.h"

  unsigned int
char_isprint(const char c)
{
  return (c >= ' ' && c <= '~');
}
