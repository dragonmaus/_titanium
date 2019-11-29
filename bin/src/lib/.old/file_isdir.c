#include <sys.h>
#include "file.h"

  unsigned int
file_isdir(const char *file)
{
  struct stat sb;

  if (stat(file, &sb) == -1) return -1;
  return S_ISDIR(sb.st_mode);
}
