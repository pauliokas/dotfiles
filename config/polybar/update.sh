#!/usr/bin/env bash

echo -e 'Available updates:\n'
checkupdates

echo
read -r -p 'Are you sure you want to update? [Y/n] ' input

if [[ -z $input ]]; then
    input='yes'
fi

case $input in
    [yY][eE][sS]|[yY])
        echo
        yay -Syu
        ;;
esac

printf '\nPress any key to continue...'
read -n 1 -s
