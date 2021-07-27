#!/bin/bash

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