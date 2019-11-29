#include "char.h"

  char
char_tolower(const char c)
{
  if (char_isupper(c)) return (c - ('A' - 'a'));
  return c;
}
