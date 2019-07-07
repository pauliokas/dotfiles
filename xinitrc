#!/bin/sh

# Turn off DPMS
xset -dpms

# Disable bell
xset -b

# Disable screensaver
xset s off

xrdb -merge "$HOME/.Xresources"

xsetroot -cursor_name left_ptr

exec bspwm
