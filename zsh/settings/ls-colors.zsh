# Typing the variables caused warnings on new subshells
# typeset -TUg LS_COLORS ls_colors
typeset -a ls_colors
# Have zsh automatically sync $ls_colors and global exported $LS_COLORS, minus duplicates.
# typeset -gxaUT LS_COLORS ls_colors :

# Effects
# 00  Default colour
# 01  Bold
# 04  Underlined
# 05  Flashing text
# 07  Reversetd
# 08  Concealed
# Colours
# 31  Red
# 32  Green
# 33  Orange
# 34  Blue
# 35  Purple
# 36  Cyan
# 37  Grey
# Backgrounds
# 40  Black background
# 41  Red background
# 42  Green background
# 43  Orange background
# 44  Blue background
# 45  Purple background
# 46  Cyan background
# 47  Grey background
# Extra colours
# 90  Dark grey
# 91  Light red
# 92  Light green
# 93  Yellow
# 94  Light blue
# 95  Light purple
# 96  Turquoise
# 97  White
# 100 Dark grey background
# 101 Light red background
# 102 Light green background
# 103 Yellow background
# 104 Light blue background
# 105 Light purple background
# 106 Turquoise background
local executable='00;32'
local archive='00;31'

# The keys (below) are assigned a colour pattern which is a semi-colon separated list of colour codes.
ls_colors=(
  'no=00'           #  NORMAL, NORM  Global default, although everything should be something
  'fi=00'           #  FILE  Normal file
  'di=33'           #  DIR Directory
  'ln=36'           #  SYMLINK, LINK, LNK  Symbolic link. 
                    #  If you set this to ‘target’ instead of a numerical value, the color is as for the file pointed to.
  'pi=95'           #  FIFO, PIPE  Named pipe
  'do=35'           #  DOOR  Door
  'bd=93'           #  BLOCK, BLK  Block device
  'cd=93'           #  CHAR, CHR Character device
  'or=31;05'        #  ORPHAN  Symbolic link pointing to a non-existent file, or non-stat'able file
  'so=35'           #  SOCK  Socket
  'su=37;41'        #  SETUID  File that is setuid (u+s)
  'sg=30;43'        #  SETGID  File that is setgid (g+s)
  'tw=30;42'        # dir that is sticky and other-writable (+t,o+w)
  'ow=34;42'        # dir that is other-writable (o+w) and not sticky
  'st=37;44'        # dir with the sticky bit set (+t) and not other-writable

# This is for files with execute permission:
  "ex=$executable"  # ex  EXEC  Executable file (i.e. has ‘x’ set in permissions)
  # 'mi=1'          #  MISSING Non-existent file pointed to by a symbolic link (visible when you type ls -l)
  # 'lc=2'          #  LEFTCODE, LEFT  Opening terminal code
  # 'rc=3'          #  RIGHTCODE, RIGHT  Closing terminal code
  # 'ec=4'          #  ENDCODE, END  Non-filename text

# Windows executable files
  "*.cmd=$executable"
  "*.exe=$executable"
  "*.com=$executable"
  "*.bat=$executable"

# archives or compressed (bright red)
  "*.tar=$archive"
  "*.tgz=$archive"
  "*.arj=$archive"
  "*.taz=$archive"
  "*.lzh=$archive"
  "*.lzma=$archive"
  "*.tlz=$archive"
  "*.txz=$archive"
  "*.zip=$archive"
  "*.z=$archive"
  "*.Z=$archive"
  "*.dz=$archive"
  "*.gz=$archive"
  "*.xz=$archive"
  "*.bz2=$archive"
  "*.bz=$archive"
  "*.tbz=$archive"
  "*.tbz2=$archive"
  "*.tz=$archive"
  "*.deb=$archive"
  "*.rpm=$archive"
  "*.jar=$archive"
  "*.rar=$archive"
  "*.ace=$archive"
  "*.zoo=$archive"
  "*.cpio=$archive"
  "*.7z=$archive"
  "*.rz=$archive"

# image formats
  '*.jpg=35'
  '*.jpeg=35'
  '*.gif=35'
  '*.bmp=35'
  '*.pbm=35'
  '*.pgm=35'
  '*.ppm=35'
  '*.tga=35'
  '*.xbm=35'
  '*.xpm=35'
  '*.tif=35'
  '*.tiff=35'
  '*.png=35'
  '*.svg=35'
  '*.svgz=35'
  '*.mng=35'
  '*.pcx=35'
  '*.mov=35'
  '*.mpg=35'
  '*.mpeg=35'
  '*.m2v=35'
  '*.mkv=35'
  '*.ogm=35'
  '*.mp4=35'
  '*.m4v=35'
  '*.mp4v=35'
  '*.vob=35'
  '*.qt=35'
  '*.nuv=35'
  '*.wmv=35'
  '*.asf=35'
  '*.rm=35'
  '*.rmvb=35'
  '*.flc=35'
  '*.avi=35'
  '*.fli=35'
  '*.flv=35'
  '*.gl=35'
  '*.dl=35'
  '*.xcf=35'
  '*.xwd=35'
  '*.yuv=35'
  
# http://wiki.xiph.org/index.php/MIME_Types_and_File_Extensions
  '*.axv=35'
  '*.anx=35'
  '*.ogv=35'
  '*.ogx=35'
# audio formats
  '*.aac=00;36'
  '*.au=00;36'
  '*.flac=00;36'
  '*.mid=00;36'
  '*.midi=00;36'
  '*.mka=00;36'
  '*.mp3=00;36'
  '*.mpc=00;36'
  '*.ogg=00;36'
  '*.ra=00;36'
  '*.wav=00;36'
# http://wiki.xiph.org/index.php/MIME_Types_and_File_Extensions
  '*.axa=00;36'
  '*.oga=00;36'
  '*.spx=00;36'
  '*.xspf=00;36'
# scripts
  '*.rb=91'
  '*.py=00;93'
)
unset executable
unset archive
export LS_COLORS=${(j.:.)ls_colors}

# Use the ls colors for completion lists
zstyle ':completion:*:default' list-colors $ls_colors
unset ls_colors
