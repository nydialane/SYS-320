function gatherClasses(){

$page = Invoke-WebRequest -TimeoutSec 10 http://localhost/courses.html

# tr elements

$trs=$page.ParsedHtml.body.getElementsByTagName("tr")

# array to hold results
$FullTable = @()
for($i=1; $i -lt $trs.length; $i++){
        

        # get td element of tr element
        $tds = $trs[$i].getElementsByTagName("td")
       
        # seperate start time and end time
        $Times = $tds[5].innerText.split("-")
       
       $FullTable += [pscustomobject]@{"Class Code" = $tds[0].innerText; `
                                       "Title" = $tds[1].innerText; ` 
                                       "Days" = $tds[4].innerText; `
                                       "Time Start" = $tds[0]; `
                                       "Time End" = $tds[1]; `   
                                       "Instructor" = $tds[6].innerText; `
                                       "Location" = $tds[9].innerText; `
                                       }
    } #for loop end
return $FullTable
}
gatherClasses
$PSVersionTable