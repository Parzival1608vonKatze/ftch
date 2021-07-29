#!/bin/bash

#get 'install' dir
 pwd=$(pwd)

# get init system
source "${pwd}/scripts/init.sh"

#get total packages
source "${pwd}/scripts/pkgs.sh"

# check distro info for counting n.o of packages accordingly
source "${pwd}/scripts/distro.sh"

# get storage used
source "${pwd}/scripts/disk.sh"

# get Memory usage
source "${pwd}/scripts/mem.sh"

# Get WM or DE
source "${pwd}/scripts/wm.sh"


# get GTK theming
source "${pwd}/scripts/gtk.sh"


# fetch output
distro_detect

storage

# get batterie
source ${pwd}/scripts/batterie.sh

# get screen resolution
source "${pwd}/scripts/res.sh"

 # echo output 
 source "${pwd}/output.sh"

#																			(END OF FILE)