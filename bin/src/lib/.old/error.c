/* automatically generated */
#include <errno.h>
#include "error.h"

#undef errno

int error_perm =
#ifdef EPERM
EPERM;
#else
-1;
#endif

int error_noent =
#ifdef ENOENT
ENOENT;
#else
-2;
#endif

int error_intr =
#ifdef EINTR
EINTR;
#else
-3;
#endif

int error_nomem =
#ifdef ENOMEM
ENOMEM;
#else
-4;
#endif

int error_acces =
#ifdef EACCES
EACCES;
#else
-5;
#endif

int error_isdir =
#ifdef EISDIR
EISDIR;
#else
-6;
#endif

int error_inval =
#ifdef EINVAL
EINVAL;
#else
-7;
#endif

int error_loop =
#ifdef ELOOP
ELOOP;
#else
-8;
#endif
