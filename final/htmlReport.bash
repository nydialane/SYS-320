#!/bin/bash

txt="report.txt"
html="report.html"
apache="/var/www/html/$html"

cat <<EOF > $html
<html>
<style>
	table, th, td { border: 1px solid black; border-collapse: collapse; }
	th, td { padding: 4px 8px; fonst-size 18px; }
</style>
<body>
<h2>IOC found against access.log</h2>
<table>
EOF

while IFS= read -r line
do
	ip=$(echo "$line" | awk '{print $1}')
	date=$(echo "$line" | awk '{print $2}')
	page=$(echo "$line" | awk '{print $3}')
	echo "<tr><td>$ip</td><td>$date</td><td>$page</td></tr>" >> $html
done < "$txt"

cat <<EOF >> $html
</table>
</body>
</html>
EOF

sudo mv $html $apache

echo "HTML report created. Report moved to $apache"
