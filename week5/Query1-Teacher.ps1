$classes = Get-Content -Path .\SYS-320\Scraping.ps1

# lists all classes with the instructor Furkan Paligu

$FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | `
            Where-Object {$_."Instructor" -ilike "Furkan Paligu"}