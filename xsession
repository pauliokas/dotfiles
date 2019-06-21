# Turn off DPMS
xset -dpms

# Disable bell
xset -b

# Disable screensaver
xset s off

feh --bg-fill --no-fehbg ~/Pictures/Wallpapers/arch-mesh.png &
compton --daemon &
dunst &
redshift &
(sleep .5; polybar --reload top) &
