#define ISIZE 16
#define OSIZE 79

extern void exit(int);
extern int read(int, char *, unsigned int);
extern int write(int, const char *, unsigned int);

static int add_char(char *b, unsigned char c);
static int add_chardump(char *b, unsigned char c);
static int add_hexdump(char *b, unsigned char c);
static int add_index(char *b, unsigned int i);
static int add_string(char *b, char *s);
static char nibble2char(unsigned char n);

const char *htable = "0123456789abcdef";

  void
_start(void)
{
  char ibuf[ISIZE];
  char obuf[OSIZE];
  char *o;
  int index;
  int length;
  int i;

  index = 0;
  for (;;) {
    length = read(0, ibuf, ISIZE);
    if (!length) break;
    if (length < 0) {
      switch (-length) {
      case 0x15:
        write(2, "hd: fatal: input is a directory\n", 32);
        break;
      case 0x16:
        write(2, "hd: fatal: invalid input\n", 25);
        break;
      default:
        write(2, "hd: fatal: unknown error\n", 25);
        break;
      }
      exit(1);
    }
    o = obuf;
    o += add_index(o, index);
    o += add_char(o, ' ');
    for (i = 0; i < ISIZE; ++i) {
      if (i == 8) o += add_char(o, ' ');
      o += add_char(o, ' ');
      if (i < length) o += add_hexdump(o, ibuf[i]);
      else o += add_string(o, "  ");
    }
    o += add_string(o, "  |");
    for (i = 0; i < length; ++i) {
      o += add_chardump(o, ibuf[i]);
    }
    o += add_string(o, "|\n");
    write(1, obuf, o - obuf);
    index += length;
    if (length < ISIZE) break;
  }
  if (index) {
    o = obuf;
    o += add_index(o, index);
    o += add_char(o, '\n');
    write(1, obuf, o - obuf);
  }
  exit(0);
}

  int
add_char(char *b, unsigned char c)
{
  *b = c;
  return 1;
}

  int
add_chardump(char *b, unsigned char c)
{
  if (c < ' ' || c > '~') return add_char(b, '.');
  return add_char(b, c);
}

  int
add_hexdump(char *b, unsigned char c)
{
  char hex[3];

  if ((hex[0] = nibble2char(c >> 4)) == -1) return -1;
  if ((hex[1] = nibble2char(c)) == -1) return -1;
  hex[2] = 0;
  return add_string(b, hex);
}

  int
add_index(char *b, unsigned int index)
{
  char s[9];
  int i;

  for (i = 7; i >= 0; --i) {
    s[i] = nibble2char(index);
    index >>= 4;
  }
  s[8] = 0;
  return add_string(b, s);
}

  int
add_string(char *b, char *s)
{
  char *u;

  u = b;
  for (;;) {
    *b = *s;
    if (!*s) return b - u;
    ++b;
    ++s;
  }
}

  char
nibble2char(unsigned char n)
{
  return htable[n & 0xf];
}
