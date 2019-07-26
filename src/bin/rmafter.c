#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/event.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

#ifndef PID_MAX
#define PID_MAX 99999
#endif

void die1(int, const char *);
void die2(int, const char *, const char *);
void die3(int, const char *, const char *, const char *);

  int
main(int argc, char **argv)
{
	struct kevent ch;
	struct kevent ev;
	pid_t pid;
	int kq, nev, i;
	const char *err;

	if (argc < 3) die1(1, "Usage: rmafter pid file [file ...]");
	pid = (pid_t)strtonum(argv[1], 0, PID_MAX, &err);
	if (err) die2(1, "rmafter: strtonum() error", strerror(errno));

	if ((kq = kqueue()) == -1) die2(1, "rmafter: kqueue() error", strerror(errno));

	EV_SET(&ch, pid, EVFILT_PROC, EV_ADD | EV_ENABLE, NOTE_EXIT, 0, 0);

	for (;;) {
		nev = kevent(kq, &ch, 1, &ev, 1, NULL);
		if (nev < 0) die2(1, "rmafter: kevent() error", strerror(errno));
		if (nev > 0) {
			if (ev.flags & EV_ERROR) die3(1, "rmafter", argv[1], strerror(ev.data));
			break;
		}
	}

	close(kq);
	for (i = 2; i < argc; ++i) if (!unlink(argv[i])) printf("Removed file '%s'\n", argv[i]);
	return EXIT_SUCCESS;
}

  void
die1(int r, const char *s)
{
	fprintf(stderr, "%s\n", s);
	exit(r);
}

  void
die2(int r, const char *s, const char *t)
{
	fprintf(stderr, "%s: %s\n", s, t);
	exit(r);
}

  void
die3(int r, const char *s, const char *t, const char *u)
{
	fprintf(stderr, "%s: %s: %s\n", s, t, u);
	exit(r);
}
