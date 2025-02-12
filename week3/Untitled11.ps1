function days($days){

$loginouts = Get-EventLog System -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days)
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
return $loginoutsTable
}

function startshuts($days){
$shuts = Get-EventLog System -After (Get-Date).AddDays(-$days) | Where-Object {($_.EventID -ilike 6005) -or ($_.EventID -ilike 6006)} 

$shutsTable = @()
for($i=0; $i -lt $shuts.Count; $i++){
$event = ""
if($shuts[$i].EventID -eq 6005) {$event="Startup"}
if($shuts[$i].EventID -eq 6006) {$event="Shutdown"}
$shutsTable += [pscustomobject]@{"Time" = $shuts[$i].TimeGenerated;
                                       "Id" = $shuts[$i].EventId;
                                       "Event" = $event;
                                       "User" = "System";
                                       }
}
return $shutsTable
}

