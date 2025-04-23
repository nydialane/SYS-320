#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser" 
}

function getFailedLogins(){
# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
	findFail=$(cat "$authfile" | grep "failure")
	failInfo=$(echo "$findFail" | cut -d' ' -f1,2,3,17)
	echo "$failInfo"

}

# Sending logins as email - Do not forget to change email address
# to your own email address
#echo "To: nydia.lane@mymail.champlain.edu" > emailform1.txt
#echo "Subject: Logins" >> emailform1.txt
#getLogins >> emailform1.txt
#cat emailform1.txt | ssmtp nydia.lane@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 

echo "To: nydia.lane@mymail.champlain.edu" > emailform2.txt
echo "Subject: Failed Logins" >> emailform2.txt
getFailedLogins >> emailform2.txt
cat emailform2.txt | ssmtp nydia.lane@mymail.champlain.edu


