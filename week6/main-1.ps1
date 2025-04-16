. (Join-Path $PSScriptRoot Users.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)
# . (Join-Path $PSScriptRoot FailedLog.ps1)
clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - List Enabled Users`n"
$Prompt += "2 - List Disabled Users`n"
$Prompt += "3 - Create a User`n"
$Prompt += "4 - Remove a User`n"
$Prompt += "5 - Enable a User`n"
$Prompt += "6 - Disable a User`n"
$Prompt += "7 - Get Log-In Logs`n"
$Prompt += "8 - Get Failed Log-In Logs`n"
$Prompt += "9 - List at Risk Users`n"
$Prompt += "10 - Exit`n"


$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 


    if($choice -eq 10){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif($choice -eq 1){
        $enabledUsers = getEnabledUsers
        Write-Host ($enabledUsers | Format-Table | Out-String)
    }

    elseif($choice -eq 2){
        $notEnabledUsers = getNotEnabledUsers
        Write-Host ($notEnabledUsers | Format-Table | Out-String)
    }
    

    # Create a user
    elseif($choice -eq 3){ 

        $name = Read-Host -Prompt "Please enter the username for the new user"
        

        # TODO: Create a function called checkUser in Users that: 
        #              - Checks if user a exists. 
        #              - If user exists, returns true, else returns false
	   
        # TODO: Check the given username with your new function.
        #              - If false is returned, continue with the rest of the function
        #              - If true is returned, do not continue and inform the user
        $checking = checkUser $name
        if ($checking){
            Write-Host "Username exists"
            } else {
            Write-Host "Username does not exist"
            $password = Read-Host -AsSecureString -Prompt "Please enter the password for the new user"
            $meow = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
            $plainpass = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($meow)
            $checker = checkPassword $plainpass
            if ($checker) { 
            createAUser $name $password
            Write-Host "User: $name is created." | Out-String} 
            else { Write-Host "Please make sure your password is complex enough: At least 6 in length, a special character, a number, and a letter" | Out-String}   
  
            }
        # TODO: Create a function called checkPassword in String-Helper that:
        #              - Checks if the given string is at least 6 characters
        #              - Checks if the given string contains at least 1 special character, 1 number, and 1 letter
        #              - If the given string does not satisfy conditions, returns false
        #              - If the given string satisfy the conditions, returns true
      
        # TODO: Check the given password with your new function. 
        #              - If false is returned, do not continue and inform the user
        #              - If true is returned, continue with the rest of the function
       
    }


    # Remove a user
    elseif($choice -eq 4){

        $name = Read-Host -Prompt "Please enter the username for the user to be removed"

        # TODO: Check the given username with the checkUser function.

        $checked = checkUser $name
        if ($checked){

        removeAUser $name

        Write-Host "User: $name Removed." | Out-String
            } else {Write-Host "User does not exist"}
    }


    # Enable a user
    elseif($choice -eq 5){


        $name = Read-Host -Prompt "Please enter the username for the user to be enabled"

        # TODO: Check the given username with the checkUser function.

         $checked = checkUser $name
        if ($checked){
        enableAUser $name

        Write-Host "User: $name Enabled." | Out-String
                } else {Write-Host "User does not exist"}
    }


    # Disable a user
    elseif($choice -eq 6){

        $name = Read-Host -Prompt "Please enter the username for the user to be disabled"

        # TODO: Check the given username with the checkUser function.


        $checked = checkUser $name
        if ($checked){
        disableAUser $name

        Write-Host "User: $name Disabled." | Out-String}
                else {Write-Host "User does not exist"}
    }


    elseif($choice -eq 7){

        $name = Read-Host -Prompt "Please enter the username for the user logs"

        # TODO: Check the given username with the checkUser function.
         $checked = checkUser $name
        if ($checked){
        $days = Read-Host -Prompt "Please enter the amount of days you would like to check for user logs"
        $userLogins = getLogInAndOffs $days
        }        else {Write-Host "User does not exist"}
        # TODO: Change the above line in a way that, the days 90 should be taken from the user

        Write-Host ($userLogins | Where-Object { $_.User -ilike "*$name"} | Format-Table | Out-String)
    }


    elseif($choice -eq 8){

        $name = Read-Host -Prompt "Please enter the username for the user's failed login logs"

        # TODO: Check the given username with the checkUser function.
         $checked = checkUser $name
        if ($checked){
        $days = Read-Host -Prompt "Please enter the amount of days you would like to check for failed logins"
        $userLogins = getFailedLogins $days }
                else {Write-Host "User does not exist"}
        # TODO: Change the above line in a way that, the days 90 should be taken from the user

        Write-Host ($userLogins | Where-Object { $_.User -ilike "*$name"} | Format-Table | Out-String)
    }


    # TODO: Create another choice "List at Risk Users" that
    #              - Lists all the users with more than 10 failed logins in the last <User Given> days.  
    #                (You might need to create some failed logins to test)
    #              - Do not forget to update prompt and option numbers
    
     elseif($choice -eq 9){
        
        $days = Read-Host -Prompt "Please enter the amount of days you would like to check users with 10 or more failed logins"
        $userLogins = atRiskUsers $days
          
           
                }

  # TODO: If user enters anything other than listed choices, e.g. a number that is not in the menu   
  #       or a character that should not be accepted. Give a proper message to the user and prompt again.
      else{
           Write-Host "Please enter a valid number 1-10"}
   


   }
