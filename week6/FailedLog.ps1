$loginouts = Get-EventLog Security -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-24)
$loginoutsTable = @()
for($i=0; $i -lt $loginouts.Count; $i++){

$event = ""
if($loginouts[$i].EventID -eq 7001) {$event="Logon"}
if($loginouts[$i].EventID -eq 7002) {$event="Logoff"}

$user = $loginouts[$i].ReplacementStrings[1]

$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated;
                                       "Id" = $loginouts[$i].InstanceId;
                                       "Event" = $event;
                                       "User" = $user;
                                       }
}
$loginoutsTable