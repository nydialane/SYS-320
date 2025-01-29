$stoppedServices = Get-Service | Where-Object { $_.Status -eq 'Stopped' }

$sortedServices = $stoppedServices | Sort-Object -Property Name

$sortedServices | Export-Csv -Path C:\Users\champuser\SYS-320\week2\out.csv 



# $csvPath =  Join-Path -Path "\SYS-320\week2\Stopped_Services.csv"

# $sortedServices | Export-Csv -Path $csvPath -NoTypeInformation

# Write-Output "CSV file was created at: $csvPath" 