#include "case.h"

  void
case_lowers(register char *s)
{
  register unsigned char x;

  for (;;) {
    x = *s; if (!x) return; x -= 'A'; if (x <= 'Z' - 'A') *s = x + 'a'; ++s;
    x = *s; if (!x) return; x -= 'A'; if (x <= 'Z' - 'A') *s = x + 'a'; ++s;
    x = *s; if (!x) return; x -= 'A'; if (x <= 'Z' - 'A') *s = x + 'a'; ++s;
    x = *s; if (!x) return; x -= 'A'; if (x <= 'Z' - 'A') *s = x + 'a'; ++s;
  }
}
