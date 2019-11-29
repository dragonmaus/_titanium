#include "buffer.h"

  int
buffer_copy(buffer *to, buffer *from)
{
  int n;
  char *x;

  for (;;) {
    n = buffer_feed(from);
    if (n < 0) return -2;
    if (!n) return 0;
    x = buffer_peek(from);
    if (buffer_put(to, x, n) == -1) return -3;
    buffer_seek(from, n);
  }
}
