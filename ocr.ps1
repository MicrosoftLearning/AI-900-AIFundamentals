$key="YOUR_KEY"
$endpoint="YOUR_ENDPOINT"


# Code to call OCR service for text in image analysis
$img_file = "advert.jpg"
if ($args.count -gt 0 -And $args[0] -in ("advert.jpg", "letter.jpg", "note.jpg"))
{
    $img_file = $args[0]
}

$img = "https://raw.githubusercontent.com/MicrosoftLearning/AI-900-AIFundamentals/main/data/vision/$img_file"

$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/json" )

$body = "{'url' : '$img'}"

write-host "Analyzing Image...`n"
$result = Invoke-Webrequest -Method Post `
          -Uri "$endpoint/vision/v3.2/read/analyze?language=en" `
          -Headers $headers `
          -Body $body 

# Extract the URL from the response of the Read operation
# to call the API to getting the analysis results 
$resultUrl = $($result.Headers['Operation-Location'])

# Create the header for the REST GET with only the subscription key
$resultHeaders = @{}
$resultHeaders.Add( "Ocp-Apim-Subscription-Key", $key )
$body = "{'url' : '$img'}"

# Get the read results, passing in the resultURL
# Continue to request results until the analysis is "succeeded"
Write-Host "Getting results..."
Do {
    $result = Invoke-RestMethod -Method Get `
            -Uri $resultUrl `
            -Headers $resultHeaders | ConvertTo-Json -Depth 10

    $analysis = ($result | ConvertFrom-Json)
} while ($analysis.status -ne "succeeded")

# Access the relevant fields from the analysis 
$analysisFields = $analysis.analyzeResult.readResults.lines

# Print out the text and bounding boxes 
foreach ($listofdict in $analysisFields)
{
    foreach($dict in $listofdict)
    {
        Write-Host ("Text:", $($dict.text), "| Text Bounding Box:", $($dict.boundingBox))
    }
}
