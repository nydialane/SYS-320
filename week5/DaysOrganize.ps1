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
write-host $FullTable | Out-String