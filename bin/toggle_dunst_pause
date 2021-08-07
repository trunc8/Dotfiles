#!/usr/bin/env bash

pause_status_file="/tmp/dunst-pause-status"

# pause=0 means not paused
# pause=1 means pause enabled
pause=$([[ -f "$pause_status_file" ]] && cat $pause_status_file)

toggle_pause=$((1-pause))

echo $toggle_pause > $pause_status_file

notify-send "DUNST_COMMAND_TOGGLE"
