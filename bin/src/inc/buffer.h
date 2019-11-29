#ifndef BUFFER_H
#define BUFFER_H

typedef struct buffer {
  char *x;
  unsigned int p;
  unsigned int n;
  unsigned int fd;
  int (*op)();
} buffer;

#define BUFFER_INIT(op,fd,buf,len) { (buf), 0, (len), (fd), (op) }
#define BUFFER_INSIZE 8192
#define BUFFER_OUTSIZE 8192

extern void  buffer_init(buffer *, int (*)(unsigned int, char *, unsigned int), unsigned int, char *, unsigned int);

extern int   buffer_flush(buffer *);
extern int   buffer_put(buffer *, const char *, unsigned int);
extern int   buffer_putalign(buffer *, const char *, unsigned int);
extern int   buffer_putflush(buffer *, const char *, unsigned int);
extern int   buffer_putc(buffer *, char);
extern int   buffer_puts(buffer *, const char *);
extern int   buffer_putsalign(buffer *, const char *);
extern int   buffer_putsflush(buffer *, const char *);

extern int   buffer_get(buffer *, char *, unsigned int);
extern int   buffer_bget(buffer *, char *, unsigned int);
extern int   buffer_getc(buffer *, char *);
extern int   buffer_feed(buffer *);

extern int   buffer_copy(buffer *, buffer *);

extern char *buffer_peek(const buffer *);
extern void  buffer_seek(buffer *, unsigned int);

extern int   buffer_read(unsigned int, char *, unsigned int);
extern int   buffer_write(unsigned int, const char *, unsigned int);

extern buffer *buffer_0;
extern buffer *buffer_0small;
extern buffer *buffer_1;
extern buffer *buffer_1small;
extern buffer *buffer_2;

#endif
