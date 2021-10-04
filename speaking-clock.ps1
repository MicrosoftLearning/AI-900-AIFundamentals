$key="YOUR_KEY"
$region="YOUR_LOCATION"


# Code to call Speech to Text API
$wav = "./data/speech/time.wav"

$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","audio/wav" )


write-host "Analyzing audio..."
$result = Invoke-RestMethod -Method Post `
          -Uri "https://$region.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=en-US" `
          -Headers $headers `
          -InFile $wav

$analysis = $result
Write-Host ("`nYou said '$($analysis.DisplayText)'")

if ($analysis.DisplayText -eq "What time is it?"){
    # Code to call Text to Speech API
    $sml = "<speak version='1.0' xml:lang='en-US'>
    <voice xml:lang='en-US' xml:gender='Female' name='en-US-AriaNeural'>
        It's coding time!
    </voice>
    </speak>"

    $headers = @{}
    $headers.Add( "Ocp-Apim-Subscription-Key", $key )
    $headers.Add( "Content-Type","application/ssml+xml" )
    $headers.Add( "X-Microsoft-OutputFormat","audio-16khz-128kbitrate-mono-mp3" )

    $outputFile = "output.wav"

    write-host "Synthesizing speech..."
    $result = Invoke-RestMethod -Method Post `
        -Uri "https://$region.tts.speech.microsoft.com/cognitiveservices/v1" `
        -Headers $headers `
        -Body $sml `
        -OutFile $outputFile

    write-host $result
    write-host "Response saved in $outputFile `n"

}