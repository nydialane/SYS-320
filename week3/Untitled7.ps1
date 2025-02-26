$loginouts = Get-EventLog System -source Microsoft-Windows-Winlogon

$loginoutsTable = @()
for($i=0; $i -lt $loginouts.Count; $i++){
$sid = $loginouts[$i].ReplacementStrings[1]
$userSid = New-Object System.Security.Principal.SecurityIdentifier($sid)
$userName = $userSid.translate([System.Security.Principal.NTAccount]).Value
$event = ""
if($loginouts[$i].EventID -eq 7001) {$event="Logon"}
if($loginouts[$i].EventID -eq 7002) {$event="Logoff"}

$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated;
                                       "Id" = $loginouts[$i].InstanceId;
                                       "Event" = $event;
                                       "User" = $userName;
                                       }
}
$loginoutsTable
