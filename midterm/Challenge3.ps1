$indicators = getIndicators
$tableRecords = getApacheLogs

# empty array to put matches
$matches = @()

foreach ($log in $tableRecords) {
    foreach ($indicator in $indicators) {
        if ($log.Page -like "*$($indicator.Pattern)*") {
            $matches += [pscustomobject]@{ "IP" = $log.IP; `
                                           "Time" = $log.Time; `
                                           "Page" = $log.Page; `
                                           "Pattern"     = $indicator.Pattern; `
                                           "Explanation" = $indicator.Explanation; 
                                                    }
        } #if loop
    } #foreach indicator
}#foreach log

$matches | Format-Table -AutoSize -Wrap 