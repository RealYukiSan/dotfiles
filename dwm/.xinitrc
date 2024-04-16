source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

while true
do
	is_muted=$(pactl get-sink-mute 0 | awk '{print $2}')
	BATT=$(cat /sys/class/power_supply/BAT1/capacity)
	VOLUME=$(pactl get-sink-volume 0 | awk '{print $5}' | tr -d '\n')
	if [[ $is_muted = "yes" ]]; then
		SPEAKER="  $VOLUME";
		else SPEAKER="  $VOLUME";
	fi
	ROOT="$SPEAKER   $BATT% - $(date)"
	xsetroot -name "$ROOT"
	sleep 1
done &
exec dwm
