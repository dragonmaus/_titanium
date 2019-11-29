#include "env.h"

  const char *
env_pick(void)
{
  return environ[0];
}
