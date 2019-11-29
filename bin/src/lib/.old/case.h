#ifndef CASE_H
#define CASE_H

extern void         case_lowers(char *);
extern void         case_lowerb(char *, unsigned int);
extern int          case_diffs(const char *, const char *);
extern int          case_diffb(const char *, unsigned int, const char *);
extern unsigned int case_starts(const char *, const char *);
extern unsigned int case_startb(const char *, unsigned int, const char *);

#define case_equals(s,t) (!case_diffs((s),(t)))
#define case_equalb(s,n,t) (!case_diffb((s),(n),(t)))

#endif
