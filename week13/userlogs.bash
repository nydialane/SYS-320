#!/bin/bash


authLog="/var/log/auth.log"

#collect logins to be called later

function getLogins(){
	lineOfLog=$(cat "$authLog" | grep "systemd-logind" | grep "New session")
	dateAndUser=$(echo "$lineOfLog" | cut -d' ' -f1,2,11 | tr -d '\.')
	echo "$dateAndUser"
}

getLogins
