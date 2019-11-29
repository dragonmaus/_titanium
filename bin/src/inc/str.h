#ifndef STR_H
#define STR_H

extern unsigned int str_copy(char *, const char *);
extern int          str_diff(const char *, const char *);
extern int          str_diffn(const char *, const char *, unsigned int);
extern unsigned int str_find(const char *, char);
extern unsigned int str_findr(const char *, char);
extern unsigned int str_len(const char *);
extern unsigned int str_start(const char *, const char *);

#define str_equal(s,t) (!str_diff((s), (t)))
#define str_equaln(s,t,n) (!str_diffn((s), (t), (n)))

#endif
