  void
byte_zero(register char *s, register unsigned int n)
{
  for (;;) {
    if (!n) break; *s = 0; ++s; --n;
    if (!n) break; *s = 0; ++s; --n;
    if (!n) break; *s = 0; ++s; --n;
    if (!n) break; *s = 0; ++s; --n;
  }
}
