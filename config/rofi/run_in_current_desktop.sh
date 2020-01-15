#!/bin/bash

bspc rule -a \* -o desktop=$(bspc query -D -d) && "$@"
