#!/bin/bash

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