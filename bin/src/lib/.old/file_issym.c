#include <sys.h>
#include "file.h"

  unsigned int
file_issym(const char *file)
{
  struct stat sb;

  if (lstat(file, &sb) == -1) return -1;
  return S_ISLNK(sb.st_mode);
}
