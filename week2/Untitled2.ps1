cd $PSScriptRoot
$files= Get-ChildItem -Path . -File
$files

$folderpath = "outfolder/"
$filepath = Join-Path $folderpath "out.csv" 
Write-Host $filepath | Select-Object * | Out-String

$files | Where-Object { $_.Name -ilike "*.ps1"} | `
Export-Csv -Path $filepath -NoTypeInformation
$folderpath | Select-Object *