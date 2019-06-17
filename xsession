# Turn off DPMS
xset dpms off

# Disable bell
xset b off

# Disable screensaver
xset s off

feh --bg-fill --no-fehbg ~/Pictures/Wallpapers/arch-mesh.png &
compton --daemon &
dunst &
redshift &
(sleep .5; polybar --reload top) &
