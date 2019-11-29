#ifndef PATHEXEC_H
#define PATHEXEC_H

extern void         pathexec(const char *const *);
extern unsigned int pathexec_env(const char *, const char *);
extern void         pathexec_run(const char *, const char *const *, const char *const *);

#endif
