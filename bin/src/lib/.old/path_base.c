#include "path.h"
#include "str.h"

  const char *
path_base(const char *path)
{
  int i;

  i = str_findr(path, '/');
  if (i >= str_len(path)) return path;
  return path + i;
}
