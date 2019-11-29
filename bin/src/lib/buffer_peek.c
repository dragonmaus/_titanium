#include "buffer.h"

  char *
buffer_peek(const buffer *s)
{
  return s->x + s->n;
}
