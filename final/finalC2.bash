#!/bin/bash

access=$1

IOC=$2

cat "$access" | egrep -i -f "$IOC" | cut -d" " -f1,4,7 | tr -d '[' > report.txt
