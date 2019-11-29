#include <unistd.h>
#include "buffer.h"

  int
buffer_write(unsigned int fd, const char *buf, unsigned int len)
{
  return write(fd, buf, len);
}
