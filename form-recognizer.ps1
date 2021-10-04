$key="YOUR_KEY"
$endpoint="YOUR_ENDPOINT"

# Create the URL where the raw receipt image can be found
$img = "https://raw.githubusercontent.com/MicrosoftLearning/AI-900-AIFundamentals/main/data/vision/receipt.jpg"

# Create the header for the REST POST with the subscription key
# In this example, the URL of the image will be sent instead of 
# the raw image, so the Content-Type is JSON
$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/json" )

# Create the body with the URL of the raw image
$body = "{'source': '$img'}"

# Call the receipt analyze method with the header and body
# Must call the Invoke-WebRequest to have acces to the header
Write-Host "Sending receipt..."
$response = Invoke-WebRequest -Method Post `
          -Uri "$endpoint/formrecognizer/v2.1/prebuilt/receipt/analyze" `
          -Headers $headers `
          -Body $body
Write-Host "...Receipt sent."

# Extract the URL from the response of the receipt anaylzer 
# to call the API to getting the analysis results
$resultUrl = $($response.Headers['Operation-Location'])

# Create the header for the REST GET with only the subscription key
$resultHeaders = @{}
$resultHeaders.Add( "Ocp-Apim-Subscription-Key", $key )

# Get the receipt analysis results, passing in the resultURL
# Continue to request results until the analysis is "succeeded"
Write-Host "Getting results..."
Do {
    $result = Invoke-RestMethod -Method Get `
            -Uri $resultUrl `
            -Headers $resultHeaders | ConvertTo-Json -Depth 10

    $analysis = ($result | ConvertFrom-Json)
} while ($analysis.status -ne "succeeded")
Write-Host "...Done`n"

# Access the relevant fields from the analysis 
$analysisFields = $analysis.analyzeResult.documentResults.fields

# Print out all of the properties of the receipt analysis
Write-Host ("Receipt Type: ", $($analysisFields.ReceiptType.valueString))
Write-Host ("Merchant Address: ", $($analysisFields.MerchantAddress.text))
Write-Host ("Merchant Phone: ", $($analysisFields.MerchantPhoneNumber.text))
Write-Host ("Transaction Date: ", $($analysisFields.TransactionDate.valueDate))
Write-Host ("Receipt Items: ")

# Access the individual items from the analysis
$receiptItems = $($analysisFields.Items.valueArray)

for (($idx = 0); $idx -lt $receiptItems.Length; $idx++) {
    $item = $receiptItems[$idx] 
    Write-Host ("Item #", ($idx+1))
    Write-Host ("  - Name: ", $($item.valueObject.Name.valueString))
    Write-Host ("  - Price: ",$($item.valueObject.TotalPrice.valueNumber))
}

Write-Host ("Subtotal: ", $($analysisFields.Subtotal.text))
Write-Host ("Tax: ", $($analysisFields.Tax.text))
Write-Host ("Total: ", $($analysisFields.Total.text))