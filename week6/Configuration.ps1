#FUNCTIONS######################

function readConfiguration(){
    $file = Get-Content -Path C:\Users\champuser\SYS-320\week7\config.txt
            $config = [pscustomobject]@{ "Days" = $file[0]; `
                                           "Execution Time" = $file[1];
                                        } }
########################################################

#function changeConfiguration($newDays,$newTime)
                              




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
            Write-Host ($config | Format-Table | Out-String)

      }
########################################################
 #elseif($choice -eq 2){
      #      $newDays = Read-Host -Prompt "Enter the number of days you want the logs to be obtained for"
       #     $newExc = Read-Host -Prompt "Enter the execution time"
#
       #     }
                        



########################################################
else{
           Write-Host "Please enter a valid number 1-10"}

        }



















