#ifndef FMT_H
#define FMT_H

#define FMT_ULONG 40 /* enough space to hold 2^128 - 1 in decimal, plus \0 */
#define FMT_LEN 0 /* convenient abbreviation */

extern unsigned int fmt_ushort(char *, unsigned short int);
extern unsigned int fmt_ushort0(char *, unsigned short int, unsigned int);
extern unsigned int fmt_ushorto(char *, unsigned short int);
extern unsigned int fmt_ushortx(char *, unsigned short int);
extern unsigned int fmt_uint(char *, unsigned int);
extern unsigned int fmt_uint0(char *, unsigned int, unsigned int);
extern unsigned int fmt_uinto(char *, unsigned int);
extern unsigned int fmt_uintx(char *, unsigned int);
extern unsigned int fmt_ulong(char *, unsigned long int);
extern unsigned int fmt_ulong0(char *, unsigned long int, unsigned int);
extern unsigned int fmt_ulongo(char *, unsigned long int);
extern unsigned int fmt_ulongx(char *, unsigned long int);

extern unsigned int fmt_plusminus(char *, long int);
extern unsigned int fmt_minus(char *, long int);

extern unsigned int fmt_str(char *, const char *);
extern unsigned int fmt_strn(char *, const char *, unsigned int);

#endif
