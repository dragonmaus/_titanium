#ifndef ALLOC_H
#define ALLOC_H

extern char *       alloc(unsigned int);
extern void         alloc_free(char *);
extern unsigned int alloc_re(char **, unsigned int, unsigned int);

#endif
