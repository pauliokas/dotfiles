alias pac=yay  # For convenience

# pacmatic needs to be run as root: https://github.com/keenerd/pacmatic/issues/35
alias pacmatic='sudo --preserve-env=pacman_program /usr/bin/pacmatic'

# Downgrade permissions as AUR helpers expect to be run as a non-root user. $UID is read-only in {ba,z}sh.
alias yay='pacman_program="sudo -u #$UID /usr/bin/yay" pacmatic'
