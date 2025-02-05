# logs that only contain 404, saves to $notfound
$notfounds = Get-Item C:\xampp\apache\logs\access.log | Select-String ' 404 '

# defines regex from IP addresses
$regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"
# get $notfound records that match the regex
$ipsUnorganized = $regex.Matches($notfounds)
$ipsUnorganized.Value
# get ips as pscustomobject
$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
$ips +=[pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
}
# $ips | where-Object { $_.IP -ilike "10.*" }

# counts the IPs
$counts = $ips |  Where-Object { $_.IP -ilike "10.*" } | Group-Object -Property "IP"
$counts | Select-Object Count, Name