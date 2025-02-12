function startshuts(){
$shuts = Get-EventLog System | Where-Object {($_.EventID -ilike 6005) -or ($_.EventID -ilike 6006)}

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
$show = startshuts 
$show