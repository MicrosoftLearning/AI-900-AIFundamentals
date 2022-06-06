$endpointUrl="YOUR_ENDPOINT"
$key = "YOUR_KEY"
$projectName = "YOUR_PROJECT_NAME"
$deploymentName = "YOUR_DEPLOYMENT_NAME"


if ($args.count -gt 0){
    # Get the user input
    $utterance = $args[0].ToString()

   # Code to call Language service for intent prediction
    $headers = @{}
    $headers.Add( "Ocp-Apim-Subscription-Key", $key)
    $headers.Add( "Content-Type","application/json")

    $item = [ordered]@{}
    $item.Add( "id", "1")
    $item.Add( "participantId", "1")
    $item.Add( "text", $utterance)
    $input = @{}
    $input.Add( "conversationItem", $item)
    
    $parameters = [ordered]@{}
    $parameters.Add( "projectName", $projectName)
    $parameters.Add( "deploymentName", $deploymentName)
    $parameters.Add( "stringIndexType", "TextElement_V8")

    $body = @{}
    $body.Add( "kind", "Conversation")
    $body.Add( "analysisInput", $input)
    $body.Add( "parameters", $parameters)
   
    $body = $body | ConvertTo-Json
    
    Write-Host "Calling Language model..."
    $response = Invoke-WebRequest -Method Post `
           -Uri $endpointUrl `
           -Headers $headers `
           -Body $body

    $result = $response | ConvertFrom-Json

    $predictedIntent = $result.result.prediction.topIntent
    $predictedDevice = $result.result.prediction.entities[0].text
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
