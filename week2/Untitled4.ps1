$chromeProcess = Get-Process -Name chrome -ErrorAction SilentlyContinue
if ($chromeProcess) {
    Stop-Process -Name chrome -Force 
        } else { 
        Start-Process "chrome.exe" -ArgumentList "https://www.champlain.edu"
        }
