# source $zsh_vars

# Where and how big the history file should be
HISTFILE="$zsh_hist"
HISTSIZE=10000
SAVEHIST=10000

# Ignores commands with a space in the beginning for shell session and history file
setopt HIST_IGNORE_SPACE

# Allows for more precise history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Enable <up/down arrow> keys for history
# Find the keycode by using: <Ctrl> + V, then enter desired key
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end

# Enable the <Ctrl> + <left/right arrow> key for navigating
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Enable <Ctrl> + <Backspace> for deleting a word
bindkey '^H' backward-kill-word

# Auto tab complete:
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

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
