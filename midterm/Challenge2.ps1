

function getApacheLogs(){
$logsNotform = Get-Content C:\xampp\apache\logs\midaccess.log
$tableRecords = @()

for ($i=0; $i -lt $logsNotform.Count; $i++){

# this is splitting string into words

$words = $logsNotform[$i].Split(" ");

$tableRecords += [pscustomobject]@{ "IP" = $words[0]; `
                                    "Time" = $words[3].Trim('['); `
                                    "Method" = $words[5].Trim('"'); `
                                    "Page" = $words[6]; `
                                    "Protocol" = $words[7]; `
                                    "Response" = $words[8];
                                    "Referrer" = $words[10]; `
                                    }
} #end of for loop
return $tableRecords | Where-Object {$_.IP -ilike "10.*"}
}
$tableRecords = getApacheLogs
$tableRecords | Format-Table -AutoSize -Wrap