#!bash/bin

allLogs=""
file="/var/log/apache2/access.log"

function getAllLogs(){
allLogs=$(cat "$file" | cut -d' ' -f1,4,7 | tr -d "[")
}

echo "Before function:"
echo "$allLogs"

getAllLogs
echo "After Function:"
echo "$allLogs"
