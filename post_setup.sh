#!/usr/bin/env bash

if [ $(command -v bat >/dev/null) ]; then
    printf 'Building bat cache... '
	bat cache --build >/dev/null
	printf 'OK\n'
fi
