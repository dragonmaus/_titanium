#include "buffer.h"
#include "str.h"

  int
buffer_puts(buffer *s, const char *buf)
{
  return buffer_put(s, buf, str_len(buf));
}

  int
buffer_putsalign(buffer *s, const char *buf)
{
  return buffer_putalign(s, buf, str_len(buf));
}

  int
buffer_putsflush(buffer *s, const char *buf)
{
  return buffer_putflush(s, buf, str_len(buf));
}
