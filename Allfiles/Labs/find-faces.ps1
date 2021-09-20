$endpoint="YOUR_ENDPOINT"
$key="YOUR_KEY"



# Code to call Face service for face detection
$img_file = "store-cam1.jpg"
if ($args.count -gt 0 -And $args[0] -in ("store-cam1.jpg", "store-cam2.jpg", "store-cam3.jpg", "store-cam4.jpg"))
{
    $img_file = $args[0]
}

$img = "https://github.com/GraemeMalcolm/ai-stuff/raw/main/data/vision/$img_file"

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
