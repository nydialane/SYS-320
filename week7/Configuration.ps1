#FUNCTIONS######################

function readConfiguration(){
    $file = Get-Content -Path C:\Users\champuser\SYS-320\week7\config.txt
            $configTab = [pscustomobject]@{ "Days" = $file[0]; `
                                           "ExecutionTime" = $file[1]; 
                                       } 
                                return $configTab       
                                        }
########################################################

function changeConfiguration(){
      $path = "C:\Users\champuser\SYS-320\week7\config.txt"

      #user input
      $newDays = Read-Host -Prompt "Enter the number of days you want the logs to be obtained for"
      $newTime = Read-Host -Prompt "Enter the execution time"

      #newarray
      $newContent = @()
      $newContent += $newDays
      $newContent += $newTime

      #write to file
      $newContent | Set-Content -Path $path
      Write-Host "New Configuration Set"

      }
########################################################
$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Show Configuration`n"
$Prompt += "2 - Change Configuration`n"
$Prompt += "3 - Exit`n"
########################################################

$operation = $true


########################################################

while($operation){

    Write-Host $Prompt | Out-String
    $choice = Read-Host 

########################################################
    if($choice -eq 3){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }
########################################################
    elseif($choice -eq 1){
            $configTab = readConfiguration
            Write-Host ($configTab | Format-Table | Out-String)
            }
      
########################################################
 elseif($choice -eq 2){
            changeConfiguration
            }
                        
########################################################
else{
           Write-Host "Please enter a valid number 1-10"}

        }



















