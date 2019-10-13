#include <sys.h>
#include "buffer.h"
#include "direntry.h"
#include "error.h"
#include "file.h"
#include "option.h"
#include "path.h"
#include "pathexec.h"
#include "str.h"
#include "strerr.h"

#define FATAL "cargo-foreach: fatal: "
#define USAGE "usage: cargo-foreach [-hqv]"

#define safe_buffer_flush(b) ( (buffer_flush((b)) == -1) ? strerr_die2sys(1, FATAL, "error flushing buffer: ") : 0 )
#define safe_buffer_putc(b,c) ( (buffer_putc((b), (c)) == -1) ? strerr_die2sys(1, FATAL, "error writing to buffer: ") : 0 )
#define safe_buffer_puts(b,s) ( (buffer_puts((b), (s)) == -1) ? strerr_die2sys(1, FATAL, "error writing to buffer: ") : 0 )

  static const char *
help = USAGE "\n\n\
  -h   display this help\n\
  -q   do not report errors\n\
  -v   list directories being processed";

  static int
direxec(const char *dir, const char **argv)
{
  int status;
  int pid;

  pid = fork();
  if (pid == -1) strerr_die2sys(1, FATAL, "unable to fork: ");
  if (!pid) {
    if (chdir(dir) == -1) strerr_die4sys(1, FATAL, "unable to change directory to '", dir, "': ");
    pathexec(argv);
  }
  if (waitpid(pid, &status, 0) == -1) strerr_die2sys(1, FATAL, "error waiting for child: ");
  if (!WIFEXITED(status)) return -1;
  status = WEXITSTATUS(status);
  return status;
}

  static unsigned int
is_crate(const char *file)
{
  DIR *dir;
  direntry *d;
  unsigned int result;

  if (!file) return 0;
  if (!file_isdir(file)) return 0;
  dir = opendir(file);
  if (!dir) strerr_die4sys(1, FATAL, "unable to open directory '", file, "': ");
  result = 0;
  for (;;) {
    errno = 0;
    d = readdir(dir);
    if (!d) {
      if (errno) strerr_die4sys(1, FATAL, "unable to read directory '", file, "': ");
      break;
    }
    if (str_equal("Cargo.toml", d->d_name)) {
      ++result;
      break;
    }
  }
  closedir(dir);
  return result;
}

  int
main(int argc, const char **argv)
{
  const char *program = path_base(*argv);
  char opt;
  unsigned int quiet, verbose;
  DIR *dir;
  direntry *d;
  char *n;
  int status;
  int i;

  /* cargo passes its arguments unchanged to subcommands */
  if (str_equal("foreach", argv[1])) {
    --argc;
    ++argv;
  }

  quiet = verbose = 0;
  while ((opt = option_next(argc, argv, "hqv")) != -1) {
    switch (opt) {
    case 'h':
      strerr_die1x(0, help);
    case 'q':
      quiet = 1;
      break;
    case 'v':
      verbose = 1;
      break;
    case '?':
      strerr_die4x(1, FATAL, "unknown option '", &option_error, "'");
    }
  }
  argc -= option_index;
  argv += option_index;

  if (!argc) strerr_die1x(1, USAGE);

  dir = opendir(".");
  if (!dir) strerr_die2sys(1, FATAL, "unable to open current directory");
  for (;;) {
    errno = 0;
    d = readdir(dir);
    if (!d) {
      if (errno) strerr_die2sys(1, FATAL, "unable to read current directory");
      break;
    }
    n = d->d_name;
    if (str_equal(".", n) || str_equal("..", n)) continue;
    if (!is_crate(n)) continue;
    if (verbose) {
      safe_buffer_puts(buffer_2, ">> ");
      safe_buffer_puts(buffer_2, n);
      safe_buffer_putc(buffer_2, '\n');
      safe_buffer_flush(buffer_2);
    }
    status = direxec(n, argv);
    if (status == -1) strerr_die4sys(1, FATAL, "unable to execute '", *argv, "': ");
    if (!quiet && status) {
      safe_buffer_puts(buffer_2, "command ");
      safe_buffer_puts(buffer_2, *argv);
      for (i = 1; argv[i]; ++i) {
        safe_buffer_putc(buffer_2, ' ');
        safe_buffer_puts(buffer_2, argv[i]);
      }
      safe_buffer_puts(buffer_2, " failed in directory ");
      safe_buffer_puts(buffer_2, n);
      safe_buffer_putc(buffer_2, '\n');
      safe_buffer_flush(buffer_2);
    }
  }

  return 0;
}
