while true
do
	BATT=$(cat /sys/class/power_supply/BAT1/capacity)
	ROOT="Battery $BATT% - $(date)"
	xsetroot -name "$ROOT"
	sleep 1
done &
exec dwm
