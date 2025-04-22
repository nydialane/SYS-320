. "C:\Users\champuser\SYS-320\week7\Email.ps1"
. "C:\Users\champuser\SYS-320\week7\Scheduler.ps1"
. "C:\Users\champuser\SYS-320\week6\Event-Logs.ps1"
. "C:\Users\champuser\SYS-320\week7\Configuration.ps1"


#Obtain Configuration

$configuration = readConfiguration

#Obtaining at risk users

$Failed = atRiskUsers $configuration.Days

#Sending at risk users email

SendAlertEmail ($Failed | Format-Table | Out-String )

#setting the script to run daily

ChooseTimeToRun($configuration.ExecutionTime)