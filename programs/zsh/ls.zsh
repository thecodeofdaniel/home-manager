# Alias for allowing 256 colors
c="38;5;"
# Coloring output for "ls" command
LS_COLORS="no=02;${c}255:fi=00;${c}255:di=01;${c}004"
export LS_COLORS

# What does this mean?
# Global Default | no=02;38;5;255 | DIM WHITE
# Normal File    | fi=00;38;5;255 | WHITE
# Directory      | di=01;38;5;004 | BOLD BLUE

# EFFECTS
# __________________
# 00  Default colour
# 01  Bold
# 02  Dim
# 04  Underlined
# 05  Blink
# 07  Invert
# 08  Hidden

# KEYS
# ______________________________________________________________________________
# no  NORMAL, NORM                Global default, although everything should
#                                 be something
# fi  FILE                        Normal file
# di  DIR                         Directory
# ln  SYMLINK, LINK, LNK          Symbolic link. If you set this to `target`
#                                 instead of a numerical value, the color is as
#                                 for the file pointed to
# pi  FIFO, PIPE                  Named pipe
# do  DOOR                        Door
# bd  BLOCK, BLK                  Black device
# cd  CHAR, CHR                   Character device
# or  ORPHAN                      Symbolic link pointing to a non-existent file
# so  SOCK                        Socket
# su  SETUID                      File that is setuid (u+s)
# sg  SETGID                      File that is setgid (g+s)
# tw  STICKY_OTHER_WRITABLE       Directory that is sticky and other-writable
#                                 (+t,o+w)
# ow  OTHER_WRITABLE              Directory that is other-writable (o+w) and
#                                 not sticky
# st  STICKY                      Directory with the sticky bit set (+t) and
#                                 not other-writable
# ex  EXEC                        Executable file (i.e. has `x` set
#                                 in permissions)
# mi  MISSING                     Non-existent file pointed to by a symbolic link
#                                 (visible when you type ls -l)
# lc  LEFTCODE, LEFT              Opening terminal code
# rc  RIGHTCODE, RIGHT            Closing terminal code
# ec  ENDCODE, END                Non-filename text
# *.extension                     Every file using this extension e.g. *.jpg
