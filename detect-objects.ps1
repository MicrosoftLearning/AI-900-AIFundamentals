$predictionUrl="YOUR_PREDICTION_URL"
$predictionKey = "YOUR_PREDITION_KEY"


# Code to call Custom Vision service for object detection
$img_num = 1
if ($args.count -gt 0 -And $args[0] -in (1..2))
{
    $img_num = $args[0]
}

$img = "https://github.com/MicrosoftLearning/AI-900-AIFundamentals/raw/main/data/vision/road-safety/road-safety-$($img_num).jpg"

$headers = @{}
$headers.Add( "Prediction-Key", $predictionKey )
$headers.Add( "Content-Type","application/json" )

$body = "{'url' : '$img'}"

write-host( "Analyzing image...", "`n")
$result = Invoke-RestMethod -Method Post `
          -Uri $predictionUrl `
          -Headers $headers `
          -Body $body | ConvertTo-Json -Depth 5

$prediction = $result | ConvertFrom-Json

$items = $prediction.predictions

foreach ($item in $items) 
{if ($item.probability -gt .9)
{
    Write-Host ($item.tagName + " (" + $item.probability + "%)")
    Write-Host ($item.boundingBox, "`n")
}
}

