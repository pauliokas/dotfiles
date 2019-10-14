#!/usr/bin/env sh

silent='false'

function print_status() {
    if [[ $silent = 'true' ]]
    then
        echo ''
    else
        echo ''
    fi
}

function toggle() {
    if [[ $silent = 'true' ]]
    then
        silent='false'
        killall -SIGUSR2 dunst
    else
        silent='true'
        killall -SIGUSR1 dunst
    fi
    print_status
}

trap toggle USR1

while true
do
    print_status
    sleep 1 &
    wait
done
