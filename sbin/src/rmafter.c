#include <err.h>
#include <libgen.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/event.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

#ifndef PID_MAX
#define PID_MAX 99999
#endif

	int
main(int argc, char **argv)
{
	struct kevent ch;
	struct kevent ev;
	pid_t pid;
	int kq, nev, i;
	const char *errstr;

	if (argc < 3) {
		fprintf(stderr, "Usage: %s pid file [file ...]\n", basename(*argv));
		return EXIT_FAILURE;
	}

	pid = (pid_t)strtonum(argv[1], 0, PID_MAX, &errstr);
	if (errstr) {
		err(EXIT_FAILURE, "strtonum() error: %s", errstr);
	}

	if ((kq = kqueue()) == -1) {
		err(EXIT_FAILURE, "kqueue() error");
	}

	EV_SET(&ch, pid, EVFILT_PROC, EV_ADD | EV_ENABLE, NOTE_EXIT, 0, 0);

	for (;;) {
		nev = kevent(kq, &ch, 1, &ev, 1, NULL);
		if (nev < 0) {
			err(EXIT_FAILURE, "kevent() error");
		}
		if (nev > 0) {
			if (ev.flags & EV_ERROR) {
				err(EXIT_FAILURE, "%s", argv[1]);
			}
			break;
		}
	}

	close(kq);

	for (i = 2; i < argc; ++i) {
		if (!unlink(argv[i])) {
			printf("Removed file '%s'\n", argv[i]);
		}
	}

	return EXIT_SUCCESS;
}
