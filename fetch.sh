#!/bin/bash


#colors

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


   

#getting the init
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
#      "dpkg")
#	 total=$(dpkg-query -l | wc -l)
#	 ;;
      "")
	 total="Unknown"
	 ;;
  esac

  echo $total
}

# check distro info for counting n.o of packages accordingly
distro_detect() {
    os="$(uname -o)"
    case "${os}" in
	Android)
	   distro="Android"
	   ;;
	*)
	   distro="$(source /etc/os-release && echo "${PRETTY_NAME}")"
	   ;;
    esac
}

storage() {
    storageused=$(df -h / | grep "/" | awk '{print $3}')
    storageavail=$(df -h / | grep "/" | awk '{print $2}')
}

# Get Memory usage
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

ui='unknown'
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

# fetch output
distro_detect
storage

# echo logo
source ~/ftch/scripts/ascii
 # echo output 
 source ~/ftch/scripts/output


#																			(END OF FILE)