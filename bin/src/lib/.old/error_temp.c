/* automatically generated */
#include <errno.h>
#include "error.h"

#undef errno

#define X(n) if (e == n) return 1

  unsigned int
error_temp(int e)
{
  X(error_intr);
#ifdef EIO
  X(EIO);
#endif
#ifdef EAGAIN
  X(EAGAIN);
#endif
#ifdef EWOULDBLOCK
  X(EWOULDBLOCK);
#endif
  X(error_nomem);
#ifdef EBUSY
  X(EBUSY);
#endif
#ifdef ENFILE
  X(ENFILE);
#endif
#ifdef EMFILE
  X(EMFILE);
#endif
#ifdef ETXTBSY
  X(ETXTBSY);
#endif
#ifdef EFBIG
  X(EFBIG);
#endif
#ifdef ENOSPC
  X(ENOSPC);
#endif
#ifdef EDEADLK
  X(EDEADLK);
#endif
#ifdef EDEADLOCK
  X(EDEADLOCK);
#endif
#ifdef ENOLCK
  X(ENOLCK);
#endif
#ifdef EUSERS
  X(EUSERS);
#endif
#ifdef ENETDOWN
  X(ENETDOWN);
#endif
#ifdef ENETUNREACH
  X(ENETUNREACH);
#endif
#ifdef ENETRESET
  X(ENETRESET);
#endif
#ifdef ECONNABORTED
  X(ECONNABORTED);
#endif
#ifdef ECONNRESET
  X(ECONNRESET);
#endif
#ifdef ENOBUFS
  X(ENOBUFS);
#endif
#ifdef ETOOMANYREFS
  X(ETOOMANYREFS);
#endif
#ifdef ETIMEDOUT
  X(ETIMEDOUT);
#endif
#ifdef ECONNREFUSED
  X(ECONNREFUSED);
#endif
#ifdef EHOSTDOWN
  X(EHOSTDOWN);
#endif
#ifdef EHOSTUNREACH
  X(EHOSTUNREACH);
#endif
#ifdef ESTALE
  X(ESTALE);
#endif
#ifdef EDQUOT
  X(EDQUOT);
#endif
#ifdef EPROCLIM
  X(EPROCLIM);
#endif
  return 0;
}
