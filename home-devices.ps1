# Paste in your Language resource key and endpoint 
$key="YOUR_PRIMARY_KEY"
$endpointUrl="YOUR_ENDPOINT_URL"


#This should be your project name 
$projectname="HomeAutomation"

# Do not edit below this comment 
$headers=@{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/json" )

# Code to call Language Understanding service for intent prediction
if ($args.count -gt 0){
    # Get the predicted intent and entities from the user input
    $utterance = $args[0]
    $body=@{}
    $body.Add("query", $utterance)
    $body = $body | ConvertTo-Json
    $url = "$endpointUrl/language/:analyze-conversations?api-version=2021-11-01-preview&projectName=$projectname&deploymentName=production"
    $result = Invoke-RestMethod -Method Post -Headers $headers -Uri $url -Body $body
    $predictedIntent = $result.prediction.TopIntent
    $predictedDevice = $result.prediction.entities.text 
    Write-Host("Predicted intent: $predictedIntent")
    Write-Host("Predicted device: $predictedDevice")

    # Now perform the appropriate action if the request was understood
    if ($predictedIntent -in ("switch_on", "switch_off")){
        if($predictedDevice -like ("*light*") -or ("*fan*")){
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
