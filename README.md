# PiTemperatureMonitor
A very simple bash script that monitors the CPU temp using cron and controls a fan accordingly. No python required!

## Installation
Download all the files then `chmod +x` and run `installer.sh` in the same directory as `tempmon.sh` and `gettemp.sh`, then follow the onscreen instructions.

I used 2 minute intervals and a maximum temp of 40°C.

## Removal
Run `rm -r ~/.scripts && rm /usr/bin/gettemp` to remove all the scripts.

### Other stuff
Also note that pin 11 refers to GPIO11, which is pin 23 on the board. Because the Pi works at 3.3v logic level, 
I used an NPN transistor to control the fan and powered it straight from the 5V rails because these come directly
from the USB power supply, so no worries about damaging the Pi by drawing too much current.
