#include "char.h"

  char
char_toupper(const char c)
{
  if (char_islower(c)) return (c - ('a' - 'A'));
  return c;
}
