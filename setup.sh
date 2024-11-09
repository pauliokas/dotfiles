#!/usr/bin/env bash

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes
# set -x

finish() {
    result=$?
    exit ${result}
}
trap finish EXIT ERR


confirm() {
    local prompt="$*"
    while true; do
        read -r -p "$prompt " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}


if ! command -v /opt/homebrew/bin/brew >/dev/null && confirm "Install homebrew?"; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

for name in $(cat ./links.txt); do
    source="$PWD/$name"
    target="$HOME/.$name"

    printf "Setting up %s\n" "$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        if confirm "$name exists, but is not a link. overwrite?"; then
            rm -rf "$target"
        fi
    elif [ -L "$target" ] && [ "$(readlink $target)" != "$source" ]; then
        if confirm "$name exists, but links to a different target ($(readlink $target)). overwrite?"; then
            rm -rf "$target"
        fi
    fi

    if [ ! -e "$target" ]; then
        mkdir -p "$(dirname $target)"
        ln -s "$source" "$target"
    fi
done
