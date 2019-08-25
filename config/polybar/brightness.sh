#!/usr/bin/env sh

function parse_brightness {
    cat - | grep 'brightness:' | cut -d' ' -f2
}

case "$1" in
    up)
        xf86 brightness up | parse_brightness
        ;;
    down)
        xf86 brightness down | parse_brightness
        ;;
    *)
        xf86 brightness | parse_brightness
esac
