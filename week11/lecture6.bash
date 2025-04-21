#!bash/bin

allLogs=""
file="/var/log/apache2/access.log"

function getAllLogs(){
allLogs=$(cat "$file" | cut -d' ' -f1,4,7 | tr -d "[")
}

function ips(){
ipsAccess=$(echo "$allLogs" | cut -d' ' -f1)
}

getAllLogs
ips
echo "$ipsAccess"
