#!/bin/bash


#get 'install' dir
 pwd=$(pwd)


# make (default) config file
if [ -f ~/.config/ftch/config.ftch ]; then
 cat /dev/null
else
mkdir ~/.config/ftch
cat "${pwd}/defaults/output.cfg" > ~/.config/ftch/config.ftch
fi

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
#      "dpkg")
#	 total=$(dpkg-query -l | wc -l)
#	 ;;
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
	   distro="$(source /etc/os-release && echo "${PRETTY_NAME}" | sed "s/Linux//g" | sed "s/ //g" )"
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


# get GTK theming
#gtk_theme=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-theme-name= | sed "s/gtk-theme-name=/ /g")

# get gtk-icon-theme
#gtk_icons=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-icon-theme-name= | sed "s/gtk-icon-theme-name=/ /g")

# get gtk-font 
#gtk_font=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-font-name= | sed "s/gtk-font-name=/ /g")

#get gtk-cursor-theme
#gtk_cursor=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-cursor-theme-name= | sed "s/gtk-cursor-theme-name=/ /g")

# OUTPUT

# distro detect
distro_detect

#get used storage
storage

# get battery
BAT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | sed "s/percentage:          / /g")

# get screen resolution
    #get horizontal resolution
    X=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
    # get vertical resolution
    Y=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
    # add them together
    res=$(echo "$X"x"$Y")
    
 # echo output 
 source ~/.config/ftch/config.ftch


