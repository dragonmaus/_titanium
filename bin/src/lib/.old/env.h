#ifndef ENV_H
#define ENV_H

extern char **environ;
extern int env_isinit;

extern void        env_clear(void);
extern int         env_init(void);
extern int         env_put(const char *);
extern int         env_put2(const char *, const char *);
extern int         env_unset(const char *);
extern const char *env_get(const char *);
extern const char *env_pick(void);
extern const char *env_findeq(const char *);

#endif
