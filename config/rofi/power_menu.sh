#!/usr/bin/env bash

suspend=''
lock=''
restart=''
shutdown=''

choice=$(rofi \
	-dmenu \
	-theme $HOME/.config/rofi/themes/tiled-view.rasi <<- END
		$lock
		$suspend
		$restart
		$shutdown
	END
)

case $choice in
	$suspend)
		systemctl suspend
		;;
	$lock)
		loginctl lock-session
		;;
	$restart)
		systemctl reboot
		;;
	$shutdown)
		systemctl poweroff
		;;
esac
