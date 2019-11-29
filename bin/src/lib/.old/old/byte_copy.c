  void
byte_copy(register char *s, register const char *t, register unsigned int n)
{
  for (;;) {
    if (!n) return; *s = *t; ++s; ++t; --n;
    if (!n) return; *s = *t; ++s; ++t; --n;
    if (!n) return; *s = *t; ++s; ++t; --n;
    if (!n) return; *s = *t; ++s; ++t; --n;
  }
}
