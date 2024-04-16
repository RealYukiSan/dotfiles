#!/bin/sh
# source: https://gist.github.com/RealYukiSan/7baa2fad355d18060a206951c26dadd7
# You could place this script in e.g. `${HOME}/scripts/alert-battery.sh`

threshold=10  # threshold percentage to trigger alert

# Use `awk` to capture `acpi`'s percent capacity ($2) and status ($3) fields
# and read their values into the `status` and `capacity` variables

while true; do
	capacity=$(cat /sys/class/power_supply/BAT1/capacity)

	  # If battery is discharging with capacity below threshold
	  if [ "${capacity}" -lt ${threshold} ];then
	    # Send a notification that appears for 300000 ms (5 min)
	    notify-send -t 300000 "Charge your battery!"
	    break
    else
		sleep 1m
	  fi
done

