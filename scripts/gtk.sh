#!/bin/bash

# get gtk-theme
gtk_theme=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-theme-name= | sed "s/gtk-theme-name=/ /g")

# get gtk-icon-theme
gtk_icons=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-icon-theme-name= | sed "s/gtk-icon-theme-name=/ /g")

# get gtk-font 
gtk_font=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-font-name= | sed "s/gtk-font-name=/ /g")

#get gtk-cursor-theme
gtk_cursor=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-cursor-theme-name= | sed "s/gtk-cursor-theme-name=/ /g")
