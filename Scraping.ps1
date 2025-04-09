function gatherClasses(){

$page = Invoke-WebRequest -TimeoutSec 2 http://localhost/courses.html

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
                                       "Time Start" = $Times[0]; `
                                       "Time End" = $Times[1]; `   
                                       "Instructor" = $tds[6].innerText; `
                                       "Location" = $tds[9].innerText; `
                                       }
    } #for loop end
return $FullTable
}

$FullTable = gatherClasses

function daysTranslator($FullTable){

#go over all the records in the table
for($i=0; $i -lt $FullTable.length; $i++){
    
    #empty array
    $Days = @()

    # MONDAY -> M
    if($FullTable[$i].Days -ilike "M*"){    $Days += "Monday"    }

    # TUESDAYS -> followed by T,W, or F
    if($FullTable[$i].Days -ilike "*T[WTF]*"){    $Days += "Tuesday"    }
    # Only T -> TUESDAY
    Elseif($FullTable[$i].Days -ilike "T"){    $Days += "Tuesday"    }

    #WEDNESDAY -> W
    if($FullTable[$i].Days -ilike "*W*"){    $Days += "Wednesday"    }

    #THURSDAY -> TH
    if($FullTable[$i].Days -ilike "*TH*"){    $Days += "Thursday"    }

    #FRIDAY -> F
    if($FullTable[$i].Days -ilike "*F"){    $Days += "Friday"    }

    # Makes the switch
    $FullTable[$i].Days = $Days

}
return $FullTable
}

$FullTable = daysTranslator $FullTable 
write-host ($FullTable | Format-Table | Out-String)
