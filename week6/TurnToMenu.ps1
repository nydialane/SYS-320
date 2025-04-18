. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot .\week4\ParsingApache.ps1)
clear

$Hello = "`n"
$Hello += "Please choose your operation:`n"
$Hello += "1 - Display last 10 Apache Logs`n"
$Hello += "2 - Display last 10 failed logins for all users`n"
$Hello += "3 - Display at-risk users`n"
$Hello += "4 - Champlain.edu`n"
$Hello += "5 - Exit`n"


$operation = $true

while($operation){

    
    Write-Host $Hello | Out-String
    $choice = Read-Host 


    if($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

     elseif($choice -eq 1){
        $tenApache = ApacheLogs1 | Sort-Object Time -Descending | Select-Object -First 10
        Write-Host ($tenApache | Format-Table | Out-String)
    }
    elseif($choice -eq 2){
        $tenFails = getFailedLogins(1000) | Sort-Object Time -Descending | Select-Object -First 10
        Write-Host ($tenFails | Format-Table | Out-String)
      }
 elseif($choice -eq 3){
        $risky = atRiskUsers(1000)
        Write-Host ($risky | Format-Table | Out-String)}

 elseif($choice -eq 4){
        Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe" -ArgumentList "https://www.champlain.edu"
    }
else{ Write-Host "Please enter a valid number 1-10"}
   

    }