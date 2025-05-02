#!/bin/bash

link="10.0.17.6/IOC.html"

fullPage=$(curl -sL "$link")

toolOutput=$(echo "$fullPage" | xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet sel -t -m "//table/tr[position()>1]/td[1]" -v . -n)

echo "$toolOutput" > IOC.txt
