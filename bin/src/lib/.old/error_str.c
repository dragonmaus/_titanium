/* automatically generated */
#include <errno.h>
#include "error.h"

#undef errno

#define X(n,s) if (e == n) return s

  const char *
error_str(int e)
{
  X(0, "no error");
  X(error_perm, "permission denied");
  X(error_noent, "no such file or directory");
#ifdef ESRCH
  X(ESRCH, "no such process");
#endif
  X(error_intr, "interrupted system call");
#ifdef EIO
  X(EIO, "input/output error");
#endif
#ifdef ENXIO
  X(ENXIO, "device not configured");
#endif
#ifdef E2BIG
  X(E2BIG, "argument list too long");
#endif
#ifdef ENOEXEC
  X(ENOEXEC, "exec format error");
#endif
#ifdef EBADF
  X(EBADF, "file descriptor not open");
#endif
#ifdef ECHILD
  X(ECHILD, "no child processes");
#endif
#ifdef EAGAIN
  X(EAGAIN, "temporary failure");
#endif
#ifdef EWOULDBLOCK
  X(EWOULDBLOCK, "input/output would block");
#endif
  X(error_nomem, "out of memory");
  X(error_acces, "access denied");
#ifdef EFAULT
  X(EFAULT, "bad address");
#endif
#ifdef ENOTBLK
  X(ENOTBLK, "not a block device");
#endif
#ifdef EBUSY
  X(EBUSY, "device busy");
#endif
#ifdef EEXIST
  X(EEXIST, "file already exists");
#endif
#ifdef EXDEV
  X(EXDEV, "cross-device link");
#endif
#ifdef ENODEV
  X(ENODEV, "no such device");
#endif
#ifdef ENOTDIR
  X(ENOTDIR, "not a directory");
#endif
  X(error_isdir, "is a directory");
  X(error_inval, "invalid argument");
#ifdef ENFILE
  X(ENFILE, "system cannot open more files");
#endif
#ifdef EMFILE
  X(EMFILE, "process cannot open more files");
#endif
#ifdef ENOTTY
  X(ENOTTY, "not a tty");
#endif
#ifdef ETXTBSY
  X(ETXTBSY, "text file busy");
#endif
#ifdef EFBIG
  X(EFBIG, "file too big");
#endif
#ifdef ENOSPC
  X(ENOSPC, "no space left on device");
#endif
#ifdef ESPIPE
  X(ESPIPE, "unseekable descriptor");
#endif
#ifdef EROFS
  X(EROFS, "read-only file system");
#endif
#ifdef EMLINK
  X(EMLINK, "too many links");
#endif
#ifdef EPIPE
  X(EPIPE, "broken pipe");
#endif
#ifdef EDOM
  X(EDOM, "input out of range");
#endif
#ifdef ERANGE
  X(ERANGE, "output out of range");
#endif
#ifdef EDEADLK
  X(EDEADLK, "operation would cause deadlock");
#endif
#ifdef EDEADLOCK
  X(EDEADLOCK, "operation would cause deadlock");
#endif
#ifdef ENAMETOOLONG
  X(ENAMETOOLONG, "file name too long");
#endif
#ifdef ENOLCK
  X(ENOLCK, "no locks available");
#endif
#ifdef ENOSYS
  X(ENOSYS, "system call not available");
#endif
#ifdef ENOTEMPTY
  X(ENOTEMPTY, "directory not empty");
#endif
  X(error_loop, "symbolic link loop");
#ifdef ENOMSG
  X(ENOMSG, "no message of desired type");
#endif
#ifdef EIDRM
  X(EIDRM, "identifier removed");
#endif
#ifdef ECHRNG
  X(ECHRNG, "channel number out of range");
#endif
#ifdef EL2NSYNC
  X(EL2NSYNC, "level 2 not synchronized");
#endif
#ifdef EL3HLT
  X(EL3HLT, "level 3 halted");
#endif
#ifdef EL3RST
  X(EL3RST, "level 3 reset");
#endif
#ifdef ELNRNG
  X(ELNRNG, "link number out of range");
#endif
#ifdef EUNATCH
  X(EUNATCH, "protocol driver not attached");
#endif
#ifdef ENOCSI
  X(ENOCSI, "no CSI structure available");
#endif
#ifdef EL2HLT
  X(EL2HLT, "level 2 halted");
#endif
#ifdef EBADE
  X(EBADE, "invalid exchange");
#endif
#ifdef EBADR
  X(EBADR, "invalid request descriptor");
#endif
#ifdef EXFULL
  X(EXFULL, "exchange full");
#endif
#ifdef ENOANO
  X(ENOANO, "no anode");
#endif
#ifdef EBADRQC
  X(EBADRQC, "invalid request code");
#endif
#ifdef EBADSLT
  X(EBADSLT, "invalid slot");
#endif
#ifdef EBFONT
  X(EBFONT, "bad font file format");
#endif
#ifdef ENOSTR
  X(ENOSTR, "not a stream device");
#endif
#ifdef ENODATA
  X(ENODATA, "no data available");
#endif
#ifdef ETIME
  X(ETIME, "timer expired");
#endif
#ifdef ENOSR
  X(ENOSR, "out of stream resources");
#endif
#ifdef ENONET
  X(ENONET, "machine not on network");
#endif
#ifdef ENOPKG
  X(ENOPKG, "package not installed");
#endif
#ifdef EREMOTE
  X(EREMOTE, "too many levels of remote in path");
#endif
#ifdef ENOLINK
  X(ENOLINK, "link severed");
#endif
#ifdef EADV
  X(EADV, "advertise error");
#endif
#ifdef ESRMNT
  X(ESRMNT, "srmount error");
#endif
#ifdef ECOMM
  X(ECOMM, "communication error");
#endif
#ifdef EPROTO
  X(EPROTO, "protocol error");
#endif
#ifdef EMULTIHOP
  X(EMULTIHOP, "multihop attempted");
#endif
#ifdef EDOTDOT
  X(EDOTDOT, "RFS specific error");
#endif
#ifdef EBADMSG
  X(EBADMSG, "bad message type");
#endif
#ifdef EOVERFLOW
  X(EOVERFLOW, "value too large for defined data type");
#endif
#ifdef ENOTUNIQ
  X(ENOTUNIQ, "name not unique on network");
#endif
#ifdef EBADFD
  X(EBADFD, "file descriptor in bad state");
#endif
#ifdef EREMCHG
  X(EREMCHG, "remote address changed");
#endif
#ifdef ELIBACC
  X(ELIBACC, "can not access a needed shared library");
#endif
#ifdef ELIBBAD
  X(ELIBBAD, "accessing a corrupted shared library");
#endif
#ifdef ELIBSCN
  X(ELIBSCN, ".lib section in a.out corrupted");
#endif
#ifdef ELIBMAX
  X(ELIBMAX, "attempting to link in too many shared libraries");
#endif
#ifdef ELIBEXEC
  X(ELIBEXEC, "cannot exec a shared library directly");
#endif
#ifdef EILSEQ
  X(EILSEQ, "invalid or incomplete multibyte or wide character");
#endif
#ifdef ERESTART
  X(ERESTART, "interrupted system call should be restarted");
#endif
#ifdef ESTRPIPE
  X(ESTRPIPE, "streams pipe error");
#endif
#ifdef EUSERS
  X(EUSERS, "too many users");
#endif
#ifdef ENOTSOCK
  X(ENOTSOCK, "not a socket");
#endif
#ifdef EDESTADDRREQ
  X(EDESTADDRREQ, "destination address required");
#endif
#ifdef EMSGSIZE
  X(EMSGSIZE, "message too long");
#endif
#ifdef EPROTOTYPE
  X(EPROTOTYPE, "incorrect protocol type");
#endif
#ifdef ENOPROTOOPT
  X(ENOPROTOOPT, "protocol not available");
#endif
#ifdef EPROTONOSUPPORT
  X(EPROTONOSUPPORT, "protocol not supported");
#endif
#ifdef ESOCKTNOSUPPORT
  X(ESOCKTNOSUPPORT, "socket type not supported");
#endif
#ifdef ENOTSUP
  X(ENOTSUP, "operation not supported");
#endif
#ifdef EOPNOTSUPP
  X(EOPNOTSUPP, "operation not supported");
#endif
#ifdef EPFNOSUPPORT
  X(EPFNOSUPPORT, "protocol family not supported");
#endif
#ifdef EAFNOSUPPORT
  X(EAFNOSUPPORT, "address family not supported");
#endif
#ifdef EADDRINUSE
  X(EADDRINUSE, "address already used");
#endif
#ifdef EADDRNOTAVAIL
  X(EADDRNOTAVAIL, "address not available");
#endif
#ifdef ENETDOWN
  X(ENETDOWN, "network down");
#endif
#ifdef ENETUNREACH
  X(ENETUNREACH, "network unreachable");
#endif
#ifdef ENETRESET
  X(ENETRESET, "network reset");
#endif
#ifdef ECONNABORTED
  X(ECONNABORTED, "connection aborted");
#endif
#ifdef ECONNRESET
  X(ECONNRESET, "connection reset");
#endif
#ifdef ENOBUFS
  X(ENOBUFS, "out of buffer space");
#endif
#ifdef EISCONN
  X(EISCONN, "already connected");
#endif
#ifdef ENOTCONN
  X(ENOTCONN, "not connected");
#endif
#ifdef ESHUTDOWN
  X(ESHUTDOWN, "socket shut down");
#endif
#ifdef ETOOMANYREFS
  X(ETOOMANYREFS, "too many references");
#endif
#ifdef ETIMEDOUT
  X(ETIMEDOUT, "timed out");
#endif
#ifdef ECONNREFUSED
  X(ECONNREFUSED, "connection refused");
#endif
#ifdef EHOSTDOWN
  X(EHOSTDOWN, "host down");
#endif
#ifdef EHOSTUNREACH
  X(EHOSTUNREACH, "host unreachable");
#endif
#ifdef EALREADY
  X(EALREADY, "operation already in progress");
#endif
#ifdef EINPROGRESS
  X(EINPROGRESS, "operation in progress");
#endif
#ifdef ESTALE
  X(ESTALE, "stale file handle");
#endif
#ifdef EUCLEAN
  X(EUCLEAN, "structure needs cleaning");
#endif
#ifdef ENOTNAM
  X(ENOTNAM, "not a XENIX named type file");
#endif
#ifdef ENAVAIL
  X(ENAVAIL, "no XENIX semaphores available");
#endif
#ifdef EISNAM
  X(EISNAM, "is a named type file");
#endif
#ifdef EREMOTEIO
  X(EREMOTEIO, "remote I/O error");
#endif
#ifdef EDQUOT
  X(EDQUOT, "disk quota exceeded");
#endif
#ifdef ENOMEDIUM
  X(ENOMEDIUM, "no medium found");
#endif
#ifdef EMEDIUMTYPE
  X(EMEDIUMTYPE, "wrong medium type");
#endif
#ifdef ECANCELED
  X(ECANCELED, "operation canceled");
#endif
#ifdef ENOKEY
  X(ENOKEY, "required key not available");
#endif
#ifdef EKEYEXPIRED
  X(EKEYEXPIRED, "key has expired");
#endif
#ifdef EKEYREVOKED
  X(EKEYREVOKED, "key has been revoked");
#endif
#ifdef EKEYREJECTED
  X(EKEYREJECTED, "key was rejected by service");
#endif
#ifdef EOWNERDEAD
  X(EOWNERDEAD, "owner died");
#endif
#ifdef ENOTRECOVERABLE
  X(ENOTRECOVERABLE, "state not recoverable");
#endif
#ifdef ERFKILL
  X(ERFKILL, "operation not possible due to RF-kill");
#endif
#ifdef EHWPOISON
  X(EHWPOISON, "memory page has hardware error");
#endif
#ifdef EPROCLIM
  X(EPROCLIM, "too many processes");
#endif
#ifdef EBADRPC
  X(EBADRPC, "RPC structure is bad");
#endif
#ifdef ERPCMISMATCH
  X(ERPCMISMATCH, "RPC version mismatch");
#endif
#ifdef EPROGUNAVAIL
  X(EPROGUNAVAIL, "RPC program unavailable");
#endif
#ifdef EPROGMISMATCH
  X(EPROGMISMATCH, "program version mismatch");
#endif
#ifdef EPROCUNAVAIL
  X(EPROCUNAVAIL, "bad procedure for program");
#endif
#ifdef EFTYPE
  X(EFTYPE, "bad file type");
#endif
#ifdef EAUTH
  X(EAUTH, "authentication error");
#endif
#ifdef ENEEDAUTH
  X(ENEEDAUTH, "not authenticated");
#endif
#ifdef ERREMOTE
  X(ERREMOTE, "object not local");
#endif
  return "unknown error";
}
