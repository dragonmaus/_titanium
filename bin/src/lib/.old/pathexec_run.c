#include <sys.h>
#include "env.h"
#include "error.h"
#include "pathexec.h"
#include "str.h"
#include "stralloc.h"

static stralloc temp;

  void
pathexec_run(const char *file, const char *const *argv, const char *const *envv)
{
  const char *path;
  unsigned int split;
  int savederrno;

  if (file[str_find(file, '/')]) {
    execve(file, (char **)argv, (char **)envv);
    return;
  }

  path = env_get("PATH");
  if (!path) path = "/bin:/usr/bin";

  savederrno = 0;
  for (;;) {
    split = str_find(path, ':');
    if (!stralloc_copyb(&temp, split, path)) return;
    if (!split && !stralloc_cats(&temp, ".")) return;
    if (!stralloc_cats(&temp, "/")) return;
    if (!stralloc_cats(&temp, file)) return;
    if (!stralloc_0(&temp)) return;

    execve(temp.s, (char **)argv, (char **)envv);
    if (errno != error_noent) {
      savederrno = errno;
      if (errno != error_acces && errno != error_perm && errno != error_isdir) return;
    }

    if (!path[split]) {
      if (savederrno) errno = savederrno;
      return;
    }
    path += split + 1;
  }
}
