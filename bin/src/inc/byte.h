#ifndef BYTE_H
#define BYTE_H

extern void         byte_copy(char *, const char *, unsigned int);
extern void         byte_copyr(char *, const char *, unsigned int);
extern int          byte_diff(const char *, const char *, unsigned int);
extern unsigned int byte_find(const char *, char, unsigned int);
extern unsigned int byte_findr(const char *, char, unsigned int);
extern void         byte_zero(char *, unsigned int);

#define byte_equal(s,t,n) (!byte_diff((s),(t),(n)))

#endif
