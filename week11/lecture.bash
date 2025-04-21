#!bin/bash

file="/var/log/apache2/access.log"

tail -n 5 "$file"
