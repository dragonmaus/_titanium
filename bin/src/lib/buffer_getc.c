#include "buffer.h"

  int
buffer_getc(buffer *s, char *c)
{
  if (s->p <= 0) return buffer_get(s, c, 1);
  *c = s->x[s->n];
  buffer_seek(s, 1);
  return 1;
}
