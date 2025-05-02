#!/bin/bash

myIP=$(bash myIP.bash)


# Todo-1: Create a helpmenu function that prints help for the script
HelpMePlease(){
	echo "Help is on the way:"
	echo "-------------------------------------"
	echo "Syntax: bash networkchecker.bash [-n or -s] [internal or external]"
	echo "-------------------------------------"
	echo "[-n] 			use nmap for this script"
	echo "[-n external] 		external NMAP scan"
	echo "[-n internal]             internal NMAP scan"
	echo "-------------------------------------"
	echo "[-s] 			use ss for this script"
	echo "[-s external]		external ss(Netstat) scan"
	echo "[-s internal]             internal ss(Netstat) scan"
}

# Return ports that are serving to the network
function ExternalNmap(){
  rex=$(nmap "${myIP}" | awk -F"[/[:space:]]+" '/open/ {print $1,$4}' )
}

# Return ports that are serving to localhost
function InternalNmap(){
  rin=$(nmap localhost | awk -F"[/[:space:]]+" '/open/ {print $1,$4}' )
}


# Only IPv4 ports listening from network
function ExternalListeningPorts(){
elpo=$(ss -ltpn4 | grep -v 127.0.0. | awk -F"[[:space:]:(),]+" '/0.0.0./ {print $5,$9}' \
| tr -d "\"")
# Todo-2: Complete the ExternalListeningPorts that will print the port and application
# that is listening on that port from network (using ss utility)

}


# Only IPv4 ports listening from localhost
function InternalListeningPorts(){
ilpo=$(ss -ltpn | awk  -F"[[:space:]:(),]+" '/127.0.0./ {print $5,$9}' | tr -d "\"")
}



# Todo-3: If the program is not taking exactly 2 arguments, print helpmenu
if [ ! ${#} -eq 2 ]; then
HelpMePlease
exit;
fi

# Todo-4: Use getopts to accept options -n and -s (both will have an argument)
# If the argument is not internal or external, call helpmenu
# If an option other then -n or -s is given, call helpmenu
# If the options and arguments are given correctly, call corresponding functions
# For instance: -n internal => will call NMAP on localhost
#               -s external => will call ss on network (non-local)

while getopts "n:s:" option
do
	case $option in
	n)
		if [[ "${OPTARG}" == "external" ]]; then
			ExternalNmap
			echo "$rex"
		elif [[ "${OPTARG}" == "internal" ]]; then
			InternalNmap
			echo "$rin"
		else
			HelpMePlease
		fi
	;;
	s)
		if [[ "${OPTARG}" == "external" ]]; then
			ExternalListeningPorts
			echo "$elpo"
		elif [[ "${OPTARG}" == "internal" ]]; then
			InternalListeningPorts
			echo "$ilpo"
		else
			HelpMePlease
		fi

	;;
	?)
		HelpMePlease
	esac
done
