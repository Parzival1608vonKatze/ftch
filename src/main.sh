#!/bin/bash
# get init system
get_init() {
    os="$(uname -o)"
    if [[ "$os" = "Android" ]]; then
       echo "init.rc"
    elif [[ ! $(pidof systemd) ]]; then
        if [[ -f "/sbin/openrc" ]]; then
            echo "openrc"
        else
         echo $(cat /proc/1/comm)
        fi
    else
        echo "systemD"
    fi
}
#get total packages
net_pkg() {
    pack="$(which {xbps-install,apk,apt,pacman,nix,yum,rpm,dpkg,emerge} 2>/dev/null | grep -v "not found" | awk -F/ 'NR==1{print $NF}')"
  case "${pack}" in
      "xbps-install")
	 total=$(xbps-query -l | wc -l)
	 ;;
      "apk")
	 total=$(apk search | wc -l)
	 ;;
      "apt")
	 total=$(apt list --installed 2>/dev/null | wc -l)
	 ;;
      "pacman")
	 total=$(pacman -Q | wc -l)
	 ;;
      "nix")
	 total=$(nix-env -qa --installed "*" | wc -l)
	 ;;
      "yum")
	 total=$(yum list installed | wc -l)
	 ;;
      "rpm")
	 total=$(rpm -qa | wc -l)
	 ;;
      "emerge")
	 total=$(qlist -I | wc -l)
	 ;;
	"dpkg")
	total=$(dpkg-query -l | wc -l)
	 ;;
	"")
	 total="Unknown"
	 ;;
  esac
  echo $total
}
# check distro info
distro_detect() {
    os="$(uname -o)"
    case "${os}" in
	Android)
	   distro="Android"
	   ;;
	*)
	   distro="$(source /etc/os-release && echo "${PRETTY_NAME}" | sed "s/Linux//g" | sed "s/ //g"
)"
	   ;;
    esac
}
# get storage used
storage() {
    storageused=$(df -h / | grep "/" | awk '{print $3}')
    storageavail=$(df -h / | grep "/" | awk '{print $2}')
}
# get memory usage
get_mem () {
  free --mega | sed -n -E '2s/^[^0-9]*([0-9]+) *([0-9]+).*/'"${space}"'\2 MB/p'
}
# Get WM or DE
parse_rcs() {
	for f in "${@}"; do
		wm="$(tail -n 1 "${f}" 2> /dev/null | cut -d ' ' -f 2)"
		[ -n "${wm}" ] && echo "${wm}" && return
	done
}
rcwm="$(parse_rcs "${HOME}/.xinitrc" "${HOME}/.xsession")"
ui='n/a'
uitype='UI'
if [ -n "${DE}" ]; then
	ui="${DE}"
	uitype='DE'
elif [ -n "${WM}" ]; then
	ui="${WM}"
	uitype='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
	ui="${XDG_CURRENT_DESKTOP}"
	uitype='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
	ui="${DESKTOP_SESSION}"
	uitype='DE'
elif [ -n "${rcwm}" ]; then
	ui="${rcwm}"
	uitype='WM'
elif [ -n "${XDG_SESSION_TYPE}" ]; then
	ui="${XDG_SESSION_TYPE}"
fi
ui="$(basename "${ui}")"
# GTK (!!HAS TO BE ENABLED!!)
#	gtk_theme=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-theme-name= | sed "s/gtk-theme-name=/ /g")
#	gtk_icons=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-icon-theme-name= | sed "s/gtk-icon-theme-name=/ /g")
#	gtk_font=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-font-name= | sed "s/gtk-font-name=/ /g")
#	gtk_cursor=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-cursor-theme-name= | sed "s/gtk-cursor-theme-name=/ /g")

# !!OUTPUT!!
distro_detect
storage
# get battery
BATT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | sed "s/percentage:          / /g")
# get screen resolution
X=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Y=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
res=$(echo "$X"x"$Y")
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
echo -e " \n "
#  add a '#' before the next couple of lines to to disable printing of your user and hostname
#echo -e "             $(printenv USER)@$(cat /etc/hostname)"
#echo -e "           ${c5}----------------"
# add a '#' before the next line to to disable printing of your operating system
echo -e "           ${c1}os${c3}      ${distro} "
# NERDFONT-ICONS
#echo -e "           ${c1}${c3}   ${distro} "
# add a '#' before the next line to to disable printing of the version of the kernel your're running
#this line is very bloated. but iam to dumb to figure out a better way. feel free to commit a better way for doing this!
echo -e "           ${c7}ker${c3}     $(uname -r | sed "s/a//g" | sed "s/b//g" | sed "s/c//g" | sed "s/d//g" | sed "s/e//g" | sed "s/f//g" | sed "s/g//g" | sed "s/h//g" | sed "s/i//g" | sed "s/j//g" | sed "s/k//g" | sed "s/l//g" | sed "s/m//g" | sed "s/n//g" | sed "s/o//g" | sed "s/p//g" | sed "s/q//g" | sed "s/r//g" | sed "s/s//g" | sed "s/t//g" | sed "s/u//g" | sed "s/v//g" | sed "s/w//g" | sed "s/x//g" | sed "s/y//g" | sed "s/z//g" | sed "s/-1//g" | sed "s/-2//g" | sed "s/-3//g" | sed "s/-4//g" | sed "s/-5//g" | sed "s/-//g"| sed "s/ //g")"
# NERDFONT-ICONS
#echo -e "           ${c7}${c3}   $(uname -r | sed "s/a//g" | sed "s/b//g" | sed "s/c//g" | sed "s/d//g" | sed "s/e//g" | sed "s/f//g" | sed "s/g//g" | sed "s/h//g" | sed "s/i//g" | sed "s/j//g" | sed "s/k//g" | sed "s/l//g" | sed "s/m//g" | sed "s/n//g" | sed "s/o//g" | sed "s/p//g" | sed "s/q//g" | sed "s/r//g" | sed "s/s//g" | sed "s/t//g" | sed "s/u//g" | sed "s/v//g" | sed "s/w//g" | sed "s/x//g" | sed "s/y//g" | sed "s/z//g" | sed "s/-1//g" | sed "s/-2//g" | sed "s/-3//g" | sed "s/-4//g" | sed "s/-5//g" | sed "s/-//g"| sed "s/ //g")"
# add a '#' before the next line to to disable printing of the arcitecture of your processor
#echo -e "           ${c7}arc${c3}     $(uname -m)${c0}"
# NERDFONT-ICONS
#echo -e "           ${c7}${c11}     $(uname -m)${c0}"
# add a '#' before the next line to to disable printing of the packages on your system
echo -e "           ${c2}pkgs${c3}    $(net_pkg)"
#echo -e "           ${c2}${c3}   $(net_pkg)"
# add a '#' before the next line to to disable printing of a few icons
# source "${pwd}/scripts/icons.sh" 
# NERDFONT-ICONS
# add a '#' before the next line to to disable printing of your shell
echo -e "           ${c4}sh      ${c3}$(basename "${SHELL}")"
# NERDFONT-ICONS
#echo -e "           ${c4}   ${c3}$(basename "${SHELL}")"
# add a '#' before the next line to to disable printing of the ram being used
echo -e "           ${c6}ram${c3}     $(get_mem)"
#echo -e "           ${c6}${c3}   $(get_mem)"
# add a '#' before the next line to to disable printing of your init-system
#echo -e "           ${c1}init${c3}    $(get_init)"
# NERDFONT-ICONS
# add a '#' before the next line to to disable printing of your window-manager
#echo -e "           ${c5}wm${c3}      ${ui}"
# NERDFONT-ICONS
#echo -e "           ${c5}  ${c3} ${ui}"
# add a '#' before the next couple of lines to to disable printing of your gkt themeing
#echo -e "           ${c6}gtk${c12}    ${gtk_theme}"
# NERDFONT-ICONS
#echo -e "           ${c6}難${c12}    ${gtk_theme}"
#echo -e "           ${c4}icons  ${gtk_icons}${c0}"
# NERDFONT-ICONS
#echo -e "           ${c4}  ${gtk_icons}${c0}"
#echo -e "          ${c4}cursor ${gtk_cursor}"
#echo -e "           ${c6}term ${c6}   $(printenv TERM)${c0}"
# add a '#' before the next line to to disable printing of the storage being used by '/'
#echo -e "           ${c4}disk${c3}    $storageused Used"
# add a '#' before the next line to to disable printing of your screen resolution
#cho -e "           ${c7}res     $(echo "$X"x"$Y")"
# NERDFONT-ICONS
# echo -e "           ${c7}     $(echo "$X"x"$Y")"
# add a '#' before the next line to to disable printing of the battery percentage
#echo -e "           ${c1}bat$BATT"
echo -e " \n"