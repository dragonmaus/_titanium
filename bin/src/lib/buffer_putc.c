#include "buffer.h"

  int
buffer_putc(buffer *s, char c)
{
  if (s->n != s->p) {
    s->x[s->p++] = c;
    return 0;
  }
  return buffer_put(s, (char[1]){ c }, 1);
}
