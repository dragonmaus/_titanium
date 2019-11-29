#include "char.h"

  unsigned int
char_isalpha(const char c)
{
  return (char_islower(c) || char_isupper(c));
}
