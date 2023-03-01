$predictionUrl="YOUR_PREDICTION_URL"
$predictionKey = "YOUR_PREDICTION_KEY"


# Code to call Custom Vision service for image classification

$img_num = 1
if ($args.count -gt 0 -And $args[0] -in (1..3))
{
    $img_num = $args[0]
}

$img = "https://raw.githubusercontent.com/MicrosoftLearning/AI-900-AIFundamentals/main/data/vision/animals/animal-$($img_num).jpg"

$headers = @{}
$headers.Add( "Prediction-Key", $predictionKey )
$headers.Add( "Content-Type","application/json" )

$body = "{'url' : '$img'}"

write-host "Analyzing image..."
$result = Invoke-RestMethod -Method Post `
          -Uri $predictionUrl `
          -Headers $headers `
          -Body $body | ConvertTo-Json -Depth 5

$prediction = $result | ConvertFrom-Json

Write-Host ("`n",$prediction.predictions[0].tagName, "`n")
