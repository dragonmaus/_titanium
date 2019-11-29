#include "case.h"

  void
case_lowerb(register char *s, register unsigned int len)
{
  register unsigned char x;

  for (;;) {
    if (!len) return; x = *s - 'A'; if (x <= 'Z' - 'A') *s = x + 'a'; ++s;
    if (!len) return; x = *s - 'A'; if (x <= 'Z' - 'A') *s = x + 'a'; ++s;
    if (!len) return; x = *s - 'A'; if (x <= 'Z' - 'A') *s = x + 'a'; ++s;
    if (!len) return; x = *s - 'A'; if (x <= 'Z' - 'A') *s = x + 'a'; ++s;
  }
}
