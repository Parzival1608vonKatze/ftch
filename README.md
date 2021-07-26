# ftch
ftch is a *cli* system *information-tool*
written in *bash*!
it's aiming to be a *simple non-bloated* alternative
to neofetch
## fetures 
it can display:
* os
* (linux-) kernel
* ram
* sh
* init
* wm
* disk
* bat
it also supports costum ascii art.
since it's lightweight you have to add it maunualy to /scripts/ascii
(use echo -e "*" if you want colors)
your can change the colors in the first 36 lines of fetch.sh
by default:
magenta="\033[1;35m"
green="\033[1;32m"
white="\033[1;37m"
blue="\033[1;34m"
red="\033[1;31m"
black="\033[1;30m"
yellow="\033[1;33m"
cyan="\033[1;36m"
reset="\033[0m"
bgyellow="\033[1;43;33m"
bgwhite="\033[1;47;37m"
zgreen1="\033[0;32m"
zgray="\033[0;37m"
zblue="\033[0;34m"

c0="${reset}"
c1="${magenta}"
c2="${green}"
c3="${white}"
c4="${blue}"
c5="${red}"
c6="${yellow}"
c7="${cyan}"
c8="${black}"
c9="${bgyellow}"
c10="${bgwhite}"
c11="${zgreen1}"
c12="${zgray}"
c13="${zblue}"
## please read
place the ftch directory in your home folder!