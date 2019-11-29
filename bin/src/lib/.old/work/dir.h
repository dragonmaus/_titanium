#ifndef DIR_H
#define DIR_H

struct dir {
  unsigned int fd;
};

struct dir_entry {
};

extern int               dir_close(struct dir *);
extern unsigned int      dir_fd(const struct dir *);
extern struct dir *      dir_fopen(unsigned int);
extern struct dir *      dir_open(const char *);
extern struct dir_entry *dir_read(struct dir *);
extern int               dir_seek(struct dir *, long int);
extern int               dir_tell(const struct dir *);

#endif
