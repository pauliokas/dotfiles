#!/usr/bin/env bash

if command -v bat >/dev/null; then
    printf 'Building bat cache... '
	bat cache --build >/dev/null
	printf 'OK\n'
fi

if command -v nvim >/dev/null; then
    printf 'Linking nvim to vi and vim...\n'
	sudo ln -sf $(which nvim) /usr/local/bin/vi
	sudo ln -sf $(which nvim) /usr/local/bin/vim
	printf 'OK\n'
fi
