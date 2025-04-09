$classes = Get-Content -Path .\SYS-320\Scraping.ps1

# lists class code and times for classes in JOYCE 310 on mondays

$FullTable | Where-Object {($_.Location -ilike "JOYC 310") -and ($_.days -ilike "Monday") } | `
             Sort-Object "Time Start" | `
             Select-Object "Time Start", "Time End", "Class Code"
            