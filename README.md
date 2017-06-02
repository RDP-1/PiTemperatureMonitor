# PiTemperatureMonitor
A very simple bash script that monitors the CPU temp and controls a fan accordingly. No python required!

All the scripts need to be `chmod +x`'d and then `gettemp` needs to be dropped into `/usr/bin`.

`gettemp` is left as a seperate script as I also use this as part of other scripts and programs, but you could implement it as a function if you wanted.

`tempmon.sh` can be placed anywhere and is run using cron to check the temperature at intervals to determine when to turn the fan on or off.

I used 5 minute intervals and a maximum temp of 45°C.

Also note that pin 11 refers to GPIO11, which is pin 23 on the board. Because the Pi works at 3.3v logic level, 
I used an NPN transistor to control the fan and powered it straight from the 5V rails because these come directly
from the USB power supply, so no worries about damaging the Pi by drawing too much current.
