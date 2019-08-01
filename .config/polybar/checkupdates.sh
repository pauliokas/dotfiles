#!/usr/bin/env bash

tmppath="${TMPDIR:-/tmp}/yay-checkup-db-${USER}"
dbpath="$(pacman-conf DBPath)"

trap 'rm -f $tmppath/db.lck' INT TERM EXIT

mkdir -p "$tmppath"
ln -s "$dbpath/local" "$tmppath" &>/dev/null
fakeroot -- yay -Sy --dbpath "$tmppath" --logfile /dev/null &>/dev/null

update_count=$(yay -Qu --dbpath "$tmppath" 2>/dev/null | wc -l)
if [ $update_count -eq 0 ]
then
    echo ''
    exit 0
fi

echo $update_count
