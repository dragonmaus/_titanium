  void
byte_copyr(register char *s, register const char *t, register unsigned int n)
{
  s += n;
  t += n;
  for (;;) {
    if (!n) return; *s = *t; --s; --t; --n;
    if (!n) return; *s = *t; --s; --t; --n;
    if (!n) return; *s = *t; --s; --t; --n;
    if (!n) return; *s = *t; --s; --t; --n;
  }
}
