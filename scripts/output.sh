source ${pwd}/scripts/batterie.sh
echo -e "   "
echo -e "   "
#
# add a '#' before the next line to to disable printing of your operating system
echo -e "           ${c1}os${c3}    ${distro} "
#
# add a '#' before the next line to to disable printing of the version of the kernel your're running
echo -e "           ${c7}ker${c3}   $(uname -r)"
#
# add a '#' before the next line to to disable printing of the arcitecture of your processor
echo -e "           ${7}arc${9}     $(uname -m)"
#
# add a '#' before the next line to to disable printing of the packages on your system
echo -e "           ${c2}pkgs${c3}  $(net_pkg)"  
source "${pwd}/scripts/icons.sh"
#
# add a '#' before the next line to to disable printing of your shell
echo -e "           ${c4}sh         $(basename "${SHELL}")"
#
# add a '#' before the next line to to disable printing of the ram being used
echo -e "           ${c6}ram${c3}   $(get_mem)"
#
# add a '#' before the next line to to disable printing of your init-system
echo -e "           ${c1}init${c3}  $(get_init)"
#
# add a '#' before the next line to to disable printing of your window-manager
echo -e "           ${c5}wm${c3}    ${ui}"
#
# add a '#' before the next line to to disable printing of the storage being used by '/'
echo -e "           ${c4}disk${c3}  $storageused Used"
#
# add a '#' before the next line to to disable printing of the batterie percentage
echo -e "           ${c1}bat$BAT"
echo -e " "
echo -e " "
echo -e " "