#!/bin/bash

#access information
function accessLog(){
echo "Accessed at $(date +'%T %m-%d-%y') " | tr ':' '-' >> /home/champuser/SYS-320/week13/fileaccesslog.txt
}

#accessLog

emailFile="/home/champuser/SYS-320/week13/email5.txt"
fileLog="/home/champuser/SYS-320/week13/fileaccesslog.txt"



#email
echo "To: nydia.lane@mymail.champlain.edu" > "$emailFile"
echo "Subject: File Access" >> "$emailFile"
cat "$fileLog" >> "$emailFile"
cat "$emailFile" | ssmtp nydia.lane@mymail.champlain.edu



