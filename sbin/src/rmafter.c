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

	if (pledge("stdio cpath proc unveil", NULL) != 0) {
		err(EXIT_FAILURE, "Unable to restrict operations");
	}

	if (argc < 3) {
		fprintf(stderr, "Usage: %s pid file [file ...]\n", basename(*argv));
		return EXIT_FAILURE;
	}

	pid = (pid_t)strtonum(argv[1], 0, PID_MAX, &errstr);
	if (errstr) {
		err(EXIT_FAILURE, "Unable to parse '%s'", argv[1]);
	}

	for (i = 2; i < argc; ++i) {
		if (unveil(argv[i], "c") != 0) {
			err(EXIT_FAILURE, "Unable to unveil '%s'", argv[i]);
		}
	}

	if (pledge("stdio cpath proc", NULL) != 0) {
		err(EXIT_FAILURE, "Unable to restrict operations");
	}

	if ((kq = kqueue()) == -1) {
		err(EXIT_FAILURE, "Unable to create event queue");
	}

	EV_SET(&ch, pid, EVFILT_PROC, EV_ADD | EV_ENABLE, NOTE_EXIT, 0, 0);

	for (;;) {
		nev = kevent(kq, &ch, 1, &ev, 1, NULL);
		if (nev < 0) {
			err(EXIT_FAILURE, "Unable to register event for PID %d", pid);
		}
		if (nev > 0) {
			if (ev.flags & EV_ERROR) {
				errx(EXIT_FAILURE, "Unable to register event for PID %d: No such process found", pid);
			}
			break;
		}
	}

	close(kq);

	if (pledge("stdio cpath", NULL) != 0) {
		err(EXIT_FAILURE, "Unable to restrict operations");
	}

	for (i = 2; i < argc; ++i) {
		if (unlink(argv[i]) != 0) {
			warn("Unable to remove '%s'", argv[i]);
		}
		else {
			printf("Removed file '%s'\n", argv[i]);
		}
	}

	return EXIT_SUCCESS;
}
