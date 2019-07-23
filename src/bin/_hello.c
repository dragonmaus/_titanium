#include <unistd.h>

  int
main(int argc, char **argv, char **envv)
{
  return write(1, "Hello, world!\n", 14);
}
