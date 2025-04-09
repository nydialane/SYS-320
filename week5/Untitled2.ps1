$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.40/ToBeScraped.html

$h2s = $scraped_page.ParsedHtml.body.getElementsByTagName("div") | where { `
$_.getAttributeNode("class").Value -ilike "div-1"} | Select-Object innerText
$h2s

# $links = $scraped_page.Links | Select-Object outerText, href
# $links