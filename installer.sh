
#!/bin/bash
if [ -f tempmon.sh ] && [ -f gettemp.sh ]; then

 if [ "$(id -u)" -eq "0"  ]; then 
  printf "Installing PiTemperatureMonitor...\n"
 else
  printf "Installation requires root privileges.\n"
  sudo -v
 fi

 chmod +x tempmon.sh
 chmod +x gettemp.sh
 printf "Copying gettemp.sh to /usr/bin/gettemp... "
 sudo cp gettemp.sh /usr/bin/gettemp
 printf "Done.\n"
 printf "Copying tempmon to ~/.scripts... "
 mkdir -p ~/.scripts
 cp tempmon.sh ~/.scripts/tempmon.sh
 printf "Done.\n"

 printf "Enter maximum temperature: "
 read temp
 printf "$temp" > ~/.scripts/temp.dat
 printf "Enter check interval in minutes: "
 read interval
 printf "Creating cronjob to run every %s minutes... " "$interval"
 printf "*/%s * * * * ~/.scripts/tempmon.sh\n" "$interval" > cronjob 
 crontab cronjob
 printf "Done.\n"
 rm cronjob
 printf "\nSetup complete, run again to adjust values.\n"
 exit
else
 printf "Error! Shell scripts cannot be found.\n"
 printf "Run installer in same directory as tempmon.sh and gettemp.sh\n"
 exit
fi
