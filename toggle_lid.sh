#!/bin/bash
#script -> toggle(on|off) notebooks lid senzor

FILE="/etc/systemd/logind.conf"
OFF="#HandleLidSwitch=ignore"
ON="HandleLidSwitch=ignore"

if grep -Fxq "$OFF" $FILE
	then
		sed -i "s/$OFF/$ON/" $FILE
		echo "lid switched OFF"

elif grep -Fxq "$ON" $FILE
	then
		sed -i "s/$ON/$OFF/" $FILE
		echo "lid switched ON"
else
		cat "$OFF" >> "$FILE"
		echo "No lid switch found! It has been set and switched OFF"

fi

systemctl restart systemd-logind #reset systemd-logind to set changes
