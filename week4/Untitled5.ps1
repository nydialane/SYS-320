function ApacheLogs(){
   $logsNotformatted = GetContent C:\xampp\apache\logs\access.log
   $tableRecords = 
  
   for($i=0; $i -               $i++){

   # to split a string into words
   $words = $logsNotformatted[$i].Split(" ");
    
   $tableRecords += []@{ "IP" = $  [];
                        "Time" = $ [].Trim('[');
                        "Method" = $ [].Trim('"');
                        "Page" = $ [];
                        "Protocol" = $ [];
                        "Response" = $ [];
                        "Referrer" = $ [];
                        "Client" = $ [11..]