#include <sys.h>
#include "error.h"
#include "path.h"
#include "str.h"

  static unsigned int
next(char *elem, char *path)
{
  path[str_find(path, '/')] = 0;
  return str_copy(elem, path) + 1;
}

  int
path_canonical(char *path, int bufsize)
{
  char full[bufsize];
  char elem[bufsize];
  register char *f;
  register char *p;
  unsigned int size;
  int i;
  struct stat sb;

  if (!*path) {
    errno = error_inval;
    return -1;
  }

  /* get absolute, non-normalised version of path */
  f = full;
  if (*path != '/') {
    if ((i = getcwd(f, bufsize)) < 0) {
      errno = -i;
      return -1;
    }
    f += str_len(f);
    if (*(f - 1) != '/') *f++ = '/';
  }
  f += str_copy(f, path);
  *f = 0;

  size = f - full;
  f = full;
  p = path;
  *p = 0;
  while ((f - full) < size && *f) {
    f += next(elem, f);
    if (!*elem || str_equal(".", elem)) continue;
    if (str_equal("..", elem)) {
      p = path + str_findr(path, '/');
      *p = 0;
      continue;
    }
    p += str_copy(p, "/");
    p += str_copy(p, elem);
    if (lstat(path, &sb) == -1) return -1;
    if (S_ISLNK(sb.st_mode)) {
      if (readlink(path, elem, bufsize) == -1) return -1;
      p = path + str_findr(path, '/');
      *p = 0;
      p += str_copy(p, "/");
      p += str_copy(p, elem);
      p = path + path_canonical(path, bufsize);
    }
  }

  if (p == path) p += str_copy(p, "/");

  return p - path;
}
