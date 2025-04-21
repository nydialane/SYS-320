#!bin/bash

file="/var/log/apache2/access.log"

results=$(cat "$file" | grep "Firefox")

echo "$results"

