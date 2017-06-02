#!/bin/bash
temp="$(gettemp)"
fanPin=11
maxtemp=40
if [ -d "/sys/class/gpio/gpio$fanPin" ]; then
 printf "GPIO Setup.\n"
 else
 printf "Setting up GPIO...\n"
 printf "$fanPin" > /sys/class/gpio/export
 printf "out" > /sys/class/gpio/gpio"$fanPin"/direction
fi

printf "Current CPU Temp: %s°C\n"  "$temp"

if [ $temp -gt $maxtemp ]; then
 printf "Max Temp reached, enabling fan...\n"
 printf "1" > /sys/class/gpio/gpio"$fanPin"/value
 else
 printf "CPU Temp below maximum.\n"
 printf "0" > /sys/class/gpio/gpio"$fanPin"/value
fi
