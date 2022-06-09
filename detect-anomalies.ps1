$key="dc05fdb67e0442f78f1041280e126021"
$endpoint="https://mynewtraining.cognitiveservices.azure.com/"


# Code to call Anomaly Detector
write-host "Analyzing data..."
$data = "./data/anomaly/data.json"
$json = (Get-Content $data -Raw) | ConvertFrom-Json
$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/json" )
$result = Invoke-RestMethod -Method Post `
          -Uri $endpoint/anomalydetector/v1.0/timeseries/entire/detect `
          -Headers $headers `
          -InFile $data

# Process results
for ($i = 0 ; $i -lt $result.expectedValues.count ; $i++){
    $c = "white"
    if ($result.isAnomaly[$i] -eq "True"){
        $c = "red"
    }
    Write-Host $json.series[$i].timestamp, $json.series[$i].value, $result.isAnomaly[$i] -ForegroundColor $c
}
