#!bash/bin

allLogs=""
file="/var/log/apache2/access.log"

function getAllLogs(){
allLogs=$(cat "$file" | cut -d' ' -f7)
}
getAllLogs
echo "$allLogs"

function pageCount(){
pagesVist=$(echo "$allLogs" | grep -o  "\*" )
}

pageCount
echo "$pagesVisit"
