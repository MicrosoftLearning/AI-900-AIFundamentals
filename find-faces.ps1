$key="dc05fdb67e0442f78f1041280e126021"
$endpoint="https://mynewtraining.cognitiveservices.azure.com/"



# Code to call Face service for face detection
$img_file = "store-camera-1.jpg"
if ($args.count -gt 0 -And $args[0] -in ("store-camera-1.jpg", "store-camera-2.jpg", "store-camera-3.jpg"))
{
    $img_file = $args[0]
}

$img = "https://raw.githubusercontent.com/MicrosoftLearning/AI-900-AIFundamentals/main/data/vision/$img_file"

$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/json" )

$body = "{'url' : '$img'}"

write-host "Analyzing image...`n"
$result = Invoke-RestMethod -Method Post `
          -Uri "$endpoint/face/v1.0/detect?detectionModel=detection_01&returnFaceId=true&returnFaceAttributes=age,smile,facialHair,glasses,emotion,hair,makeup,accessories" `
          -Headers $headers `
          -Body $body | ConvertTo-Json -Depth 5

$analysis = ($result | ConvertFrom-Json)
foreach ($face in $analysis)
{
    Write-Host("Face location: $($face.faceRectangle)`n - Age:$($face.faceAttributes.age)`n - Emotions: $($face.faceAttributes.emotion)`n")
}
