#include "alloc.h"
#include "byte.h"
#include "env.h"
#include "pathexec.h"
#include "str.h"
#include "stralloc.h"

static stralloc plus;
static stralloc temp;

  void
pathexec(const char *const *argv)
{
  const char **e;
  unsigned int elen;
  unsigned int i;
  unsigned int j;
  unsigned int split;
  unsigned int t;

  if (!stralloc_cats(&plus, "")) return;

  elen = 0;
  for (i = 0; environ[i]; ++i) ++elen;
  for (i = 0; i < plus.len; ++i) if (!plus.s[i]) ++elen;

  e = (const char **)alloc((elen + 1) * sizeof(char *));
  if (!e) return;

  elen = 0;
  for (i = 0; environ[i]; ++i) e[elen++] = environ[i];

  j = 0;
  for (i = 0; i < plus.len; ++i) if (!plus.s[i]) {
    split = str_find(plus.s + j, '=');
    for (t = 0; t < elen; ++t) if (byte_equal(plus.s + j, e[t], split) && e[t][split] == '=') {
      --elen;
      e[t] = e[elen];
      break;
    }
    if (plus.s[j + split]) e[elen++] = plus.s + j;
    j = i + 1;
  }
  e[elen] = 0;

  pathexec_run(*argv, argv, e);
  alloc_free((char *)e);
}

  unsigned int
pathexec_env(const char *s, const char *t)
{
  if (!s) return 1;
  if (!stralloc_copys(&temp, s)) return 0;
  if (t) {
    if (!stralloc_cats(&temp, "=")) return 0;
    if (!stralloc_cats(&temp, t)) return 0;
  }
  if (!stralloc_0(&temp)) return 0;
  return stralloc_cat(&plus, &temp);
}
