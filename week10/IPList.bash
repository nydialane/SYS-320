#!/bin/bash

# Lists all the IPs in the given network prefix
# only for /24

# Use it as: bash IPList.bash 10.0.17
[ $# -ne 1 ] && echo "Usage: $0 <Prefix>" && exit 1

# Prefix is the first input taken 

prefix=$1

# Verify the input length is at least 5 characters

[ ${#prefix} -lt 5 ] && \
printf "Prefix length is too short\nPrefix example: 10.0.17" && exit 1

for i in {1..254}
#  pings IP addresses in the given network prefix
do
	ping -c 1 "$prefix.$i" | grep "64 bytes from" | \
	grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" 
done
