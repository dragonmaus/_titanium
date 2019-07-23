#include "buffer.h"
#include "strerr.h"

#define FATAL "lefix: fatal: "

#define safe_buffer_flush(b) ( (buffer_flush((b)) == -1) ? strerr_die2sys(1, FATAL, "error flushing buffer: ") : 0 )
#define safe_buffer_putc(b,c) ( (buffer_putc((b), (c)) == -1) ? strerr_die2sys(1, FATAL, "error writing to buffer: ") : 0 )

  int
main(int argc, const char **argv)
{
  char c;

  while (buffer_getc(buffer_0, &c) > 0) {
    if (c != '\r') safe_buffer_putc(buffer_1, c);
    else {
      safe_buffer_putc(buffer_1, '\n');
      if (*buffer_peek(buffer_0) == '\n') buffer_seek(buffer_0, 1);
    }
  }
  safe_buffer_flush(buffer_1);
  return 0;
}
