#!bin/bash

file="/var/log/apache2/access.log"

results=$(cat "$file" | cut -d' ' -f7 | sort | uniq -c | sort -nr )

echo "$results"
 
