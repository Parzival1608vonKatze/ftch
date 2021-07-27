#!/bin/bash

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