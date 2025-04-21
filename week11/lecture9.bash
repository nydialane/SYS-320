#!bin/bash


file="/var/log/apache2/access.log"
function coutingCurlAccess(){
results=$(grep "curl" "$file" | cut -d' ' -f1,2,12 | tr -d "-" | sort | uniq -c | sort -nr  )
			echo "$results"
}
coutingCurlAccess

 
