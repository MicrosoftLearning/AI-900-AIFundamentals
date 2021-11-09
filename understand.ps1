$appId="YOUR_APP_ID"
$key = "YOUR_PRIMARY_KEY"
$endpointUrl="YOUR_ENDPOINT_URL"



# Code to call Language Understanding service for intent prediction
if ($args.count -gt 0){
    # Get the predicted intent and entities from the user input
    $utterance = $args[0].ToString()
    $url = "$($endpointUrl)/luis/prediction/v3.0/apps/$($appId)/slots/production/predict?subscription-key=$($key)&query=$($utterance)"
    $result = Invoke-RestMethod -Method Get -Uri $url
    $predictedIntent = $result.prediction.topIntent
    $predictedDevice = $result.prediction.entities.device | Out-String
    Write-Host("Predicted intent: $predictedIntent")
    Write-Host("Predicted device: $predictedDevice")

    # Now perform the appropriate action if the request was understood
    if ($predictedIntent -in ("switch_on", "switch_off")){
        if($predictedDevice -like ("*light*") -or (-like ("*fan*"))){
            if($predictedIntent -eq "switch_on"){
                Write-Host("The $predictedDevice is on.")
            }
            else {
                Write-Host("The $predictedDevice is off.")
            }
        }
        else{
            Write-Host("Sorry, I can't do that.")
        }
    }
}
else {
    Write-Host("Sorry, I can't do that.")
}
Write-Host "`n"
