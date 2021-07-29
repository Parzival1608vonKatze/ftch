
# This is more or less the main config file but since this is just a script. You can modify anything!

# first configure your colors or don't I've already set some defaults!

#change/ add specific color(-value)s here
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

#define your colors here
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

# echo logo
#put your ascii-art here
#for example
#echo -e "                                                               "
#echo -e "${c2}                            ██                            "
#echo -e "${c2}                           ████                           "
#echo -e "${c2}                          ██████                          "
#echo -e "${c2}                         ████████                         "
#echo -e "${c2}                        ██████████                        "
#echo -e "${c2}                       ████████████                       "
#echo -e "${c2}                      ██████████████                      "
#echo -e "${c2}                     ████████████████                     "
#echo -e "${c2}                    ██████████████████                    "
#echo -e "${c2}                   ████████████████████                   "
#echo -e "${c2}                  ██████████████████████                  "
#echo -e "${c2}                 ██████████     █████████                 "
#echo -e "${c2}                ██████████       █████████                "
#echo -e "${c2}               ██████████         █████████               "
#echo -e "${c2}              ███████████         ██████████              "
#echo -e "${c2}             ████████████         ███████████             "
#echo -e "${c2}            ████████                  ████████            "
#echo -e "${c2}           ████                            ████           "
#echo -e "${c2}          ██                                  ██          "

# or source an other file

# I'm trying to implement Distro detection
# WORK IN PROGRESS
source "${pwd}/detect.sh"




echo -e "   "
echo -e "   "
#  add a '#' before the next couple of lines to to disable printing of your user and hostname
#echo -e "             $(printenv USER)@$(cat /etc/hostname)"
#echo -e "           ${c5}----------------------"
#
# add a '#' before the next line to to disable printing of your operating system
echo -e "           ${c1}os${c3}      ${distro} "
#
# add a '#' before the next line to to disable printing of the version of the kernel your're running
echo -e "           ${c7}ker${c3}     $(uname -r)"
#
# add a '#' before the next line to to disable printing of the arcitecture of your processor
#echo -e "           ${c7}arc${c11}     $(uname -m)${c0}"
#
# add a '#' before the next line to to disable printing of the packages on your system
echo -e "           ${c2}pkgs${c3}    $(net_pkg)"
# add a '#' before the next line to to disable printing of a few icons
# source "${pwd}/scripts/icons.sh" 
#
# add a '#' before the next line to to disable printing of your shell
echo -e "           ${c4}sh      $(basename "${SHELL}")"
#
# add a '#' before the next line to to disable printing of the ram being used
echo -e "           ${c6}ram${c3}     $(get_mem)"
#
# add a '#' before the next line to to disable printing of your init-system
echo -e "           ${c1}init${c3}    $(get_init)"
#
# add a '#' before the next line to to disable printing of your window-manager
echo -e "           ${c5}wm${c3}      ${ui}"
#
# add a '#' before the next couple of lines to to disable printing of your gkt themeing
echo -e "           ${c6}gtk${c12}    ${gtk_theme}"
#
#echo -e "           ${c4}icons  ${gtk_icons}${c0}"
#
#echo -e "          ${c4}cursor ${gtk_cursor}"
#
#echo -e "           ${c6}term ${c6}   $(printenv TERM)${c0}"
# add a '#' before the next line to to disable printing of the storage being used by '/'
echo -e "           ${c4}disk${c3}    $storageused Used"
#
# add a '#' before the next line to to disable printing of your screen resolution
# echo -e "           ${c7}res     $(echo "$X"x"$Y")"
# add a '#' before the next line to to disable printing of the batterie percentage
echo -e "           ${c1}bat$BAT"
echo -e " "
echo -e " "
echo -e " "

