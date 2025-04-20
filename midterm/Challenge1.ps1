

function getIndicators(){

#get the page
$page = Invoke-WebRequest -TimeoutSec 100 http://localhost/IOC.html

$trs=$page.ParsedHtml.body.getElementsByTagName("tr")

# array to hold results
$FullTable = @()
for($i=1; $i -lt $trs.length; $i++){
        

        # get td element of tr element
        $tds = $trs[$i].getElementsByTagName("td")

         $FullTable += [pscustomobject]@{"Pattern" = $tds[0].innerText; `
                                       "Explanation" = $tds[1].innerText;
                                       }

} #end of for loop
return $FullTable}

getIndicators