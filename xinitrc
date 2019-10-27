#!/bin/sh

# Turn off DPMS
xset -dpms

# Disable bell
xset -b

# Disable screensaver
xset s off

xrdb -merge "$HOME/.Xresources"

xsetroot -cursor_name left_ptr

eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec bspwm
