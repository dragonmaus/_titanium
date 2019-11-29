/* automatically generated */
#ifndef ERROR_H
#define ERROR_H

extern int errno;

extern int error_perm;
extern int error_noent;
extern int error_intr;
extern int error_nomem;
extern int error_acces;
extern int error_isdir;
extern int error_inval;
extern int error_loop;

extern const char * error_str(int);
extern unsigned int error_temp(int);

#endif
