
function giant($var1,$var2,$var3){
$Result1 = Get-Content C:\xampp\apache\logs\access.log | Select-String $var1
$Result2 = $Result1 | Select-String $var2
$Result3 = $Result2 | Select-String $var3

return $Result3

}

giant "index.html" 200 "Chrome"