$classes = Get-Content -Path .\SYS-320\Scraping.ps1

# list of instructors that teach at  least 1 course in SYS, SEC, NET, FOR, CSI, DAT
#sorted by name 
$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or `
                                              ($_."Class Code" -ilike "NET*") -or `
                                              ($_."Class Code" -ilike "SEC*") -or `
                                              ($_."Class Code" -ilike "FOR*") -or `
                                              ($_."Class Code" -ilike "CSI*") -or `
                                              ($_."Class Code" -ilike "DAT*") } `
                               | Select-Object "Instructor" | Sort-Object "Instructor" -Unique                        
$ITSInstructors | Out-String