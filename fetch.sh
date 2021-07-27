#!/bin/bash

#get 'install' dir
 pwd=$(pwd)

# get colors
source "${pwd}/scripts/colors.sh"

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


# fetch output
distro_detect
storage

# echo logo
source "${pwd}/scripts/ascii.sh"
 # echo output 
 source "${pwd}/scripts/output.sh"


#																			(END OF FILE)